Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903FA6D0D59
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 20:06:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phwdm-0003gd-1F; Thu, 30 Mar 2023 14:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdi-0003e1-Vl
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:47 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdh-0002B0-7A
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:46 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 217B121A28;
 Thu, 30 Mar 2023 18:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680199484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D40bqUGAizR7bdyPNJQVZOGajsk2QhjheNyi32cf6tk=;
 b=y6BJh6QrpmHA3ex9lWHnPW87xEqd9SwkP0cbWkFBvGLSz2VATp9csasjo4S3Kz8lD8/rwX
 Y4KJ/Y+KO9Wi7XeQrI8k++rgc87AvuwMF3tDjzhQW7nzF7KGFl+croIGoAbxVE7VlPsXme
 wYkBw6JHqi67NkpD7kof6kyQUiiYAjg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680199484;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D40bqUGAizR7bdyPNJQVZOGajsk2QhjheNyi32cf6tk=;
 b=R3xaLC0QeqktNwiBZVNXkXAs9tXX8FkilugPc025hhsaby86BnQkcUH29YggOVjoTenLzt
 0qGdOGAa/iziAbBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0F88E1348E;
 Thu, 30 Mar 2023 18:04:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2ILcMTnPJWQ5GwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 30 Mar 2023 18:04:41 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [RFC PATCH v1 22/26] migration/multifd: Support outgoing fixed-ram
 stream format
Date: Thu, 30 Mar 2023 15:03:32 -0300
Message-Id: <20230330180336.2791-23-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230330180336.2791-1-farosas@suse.de>
References: <20230330180336.2791-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The new fixed-ram stream format uses a file transport and puts ram
pages in the migration file at their respective offsets and can be
done in parallel by using the pwritev system call which takes iovecs
and an offset.

Add support to enabling the new format along with multifd to make use
of the threading and page handling already in place.

This requires multifd to stop sending headers and leaving the stream
format to the fixed-ram code. When it comes time to write the data, we
need to call a version of qio_channel_write that can take an offset.

Usage on HMP is:

(qemu) stop
(qemu) migrate_set_capability multifd on
(qemu) migrate_set_capability fixed-ram on
(qemu) migrate_set_parameter max-bandwidth 0
(qemu) migrate_set_parameter multifd-channels 8
(qemu) migrate file:migfile

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 migration/migration.c |  5 -----
 migration/multifd.c   | 51 +++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 258709aee1..77d24a5114 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1345,11 +1345,6 @@ static bool migrate_caps_check(bool *cap_list,
 #endif
 
     if (cap_list[MIGRATION_CAPABILITY_FIXED_RAM]) {
-        if (cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
-            error_setg(errp, "Directly mapped memory incompatible with multifd");
-            return false;
-        }
-
         if (cap_list[MIGRATION_CAPABILITY_XBZRLE]) {
             error_setg(errp, "Directly mapped memory incompatible with xbzrle");
             return false;
diff --git a/migration/multifd.c b/migration/multifd.c
index 20ef665218..cc70b20ff7 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -256,6 +256,19 @@ static void multifd_pages_clear(MultiFDPages_t *pages)
     g_free(pages);
 }
 
+static void multifd_set_file_bitmap(MultiFDSendParams *p, bool set)
+{
+    MultiFDPages_t *pages = p->pages;
+
+    if (!pages->block) {
+        return;
+    }
+
+    for (int i = 0; i < p->normal_num; i++) {
+        ramblock_set_shadow_bmap(pages->block, pages->offset[i], set);
+    }
+}
+
 static void multifd_send_fill_packet(MultiFDSendParams *p)
 {
     MultiFDPacket_t *packet = p->packet;
@@ -608,6 +621,17 @@ int multifd_send_sync_main(QEMUFile *f)
         }
     }
 
+    if (!migrate_multifd_use_packets()) {
+        for (i = 0; i < migrate_multifd_channels(); i++) {
+            MultiFDSendParams *p = &multifd_send_state->params[i];
+
+            qemu_sem_post(&p->sem);
+            continue;
+        }
+
+        return 0;
+    }
+
     /*
      * When using zero-copy, it's necessary to flush the pages before any of
      * the pages can be sent again, so we'll make sure the new version of the
@@ -692,6 +716,8 @@ static void *multifd_send_thread(void *opaque)
 
         if (p->pending_job) {
             uint32_t flags;
+            uint64_t write_base;
+
             p->normal_num = 0;
 
             if (!use_packets || use_zero_copy_send) {
@@ -716,6 +742,16 @@ static void *multifd_send_thread(void *opaque)
             if (use_packets) {
                 multifd_send_fill_packet(p);
                 p->num_packets++;
+                write_base = 0;
+            } else {
+                multifd_set_file_bitmap(p, true);
+
+                /*
+                 * If we subtract the host page now, we don't need to
+                 * pass it into qio_channel_write_full_all() below.
+                 */
+                write_base = p->pages->block->pages_offset -
+                    (uint64_t)p->pages->block->host;
             }
 
             flags = p->flags;
@@ -741,8 +777,9 @@ static void *multifd_send_thread(void *opaque)
                 p->iov[0].iov_base = p->packet;
             }
 
-            ret = qio_channel_writev_full_all(p->c, p->iov, p->iovs_num, NULL,
-                                              0, p->write_flags, &local_err);
+            ret = qio_channel_write_full_all(p->c, p->iov, p->iovs_num,
+                                             write_base, NULL, 0,
+                                             p->write_flags, &local_err);
             if (ret != 0) {
                 break;
             }
@@ -758,6 +795,13 @@ static void *multifd_send_thread(void *opaque)
         } else if (p->quit) {
             qemu_mutex_unlock(&p->mutex);
             break;
+        } else if (!use_packets) {
+            /*
+             * When migrating to a file there's not need for a SYNC
+             * packet, the channels are ready right away.
+             */
+            qemu_sem_post(&multifd_send_state->channels_ready);
+            qemu_mutex_unlock(&p->mutex);
         } else {
             qemu_mutex_unlock(&p->mutex);
             /* sometimes there are spurious wakeups */
@@ -767,6 +811,7 @@ static void *multifd_send_thread(void *opaque)
 out:
     if (local_err) {
         trace_multifd_send_error(p->id);
+        multifd_set_file_bitmap(p, false);
         multifd_send_terminate_threads(local_err);
         error_free(local_err);
     }
@@ -981,6 +1026,8 @@ int multifd_save_setup(Error **errp)
 
         if (migrate_use_zero_copy_send()) {
             p->write_flags = QIO_CHANNEL_WRITE_FLAG_ZERO_COPY;
+        } else if (!use_packets) {
+            p->write_flags |= QIO_CHANNEL_WRITE_FLAG_WITH_OFFSET;
         } else {
             p->write_flags = 0;
         }
-- 
2.35.3


