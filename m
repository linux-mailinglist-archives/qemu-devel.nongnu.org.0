Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 893926D0D61
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 20:06:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phwdv-0003rQ-Ja; Thu, 30 Mar 2023 14:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdl-0003hJ-JJ
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:49 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdj-0002BM-SO
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:49 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AC43C21A2A;
 Thu, 30 Mar 2023 18:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680199486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xbnEYXpXSxKKvda2xSwA3+xm74lnwDfudsd/3P4vJn0=;
 b=FunnyHzyPcjgmVesHyQ7lQjgGS8xCZRLGYCCGTui31QgWUsJwR3tBl+OV9dSgMyf6r14XF
 cCgNllvpeE9bU73n2YEJ94ahR4Zm0fH0Sl+YeYuYaTeKRheB/Tlc7qPglPJ5rdzhFjkPyj
 vVzeX7U8qeRHO1vk/TYs95l/sDABGKE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680199486;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xbnEYXpXSxKKvda2xSwA3+xm74lnwDfudsd/3P4vJn0=;
 b=t2p4OOeBp3MWeycDT+Dp8R4F0w1eUGSFMCHt4U4VO3I8xOeeoihVti1zH23quNJFKLkISL
 Vlkxce/Cpu8yH6DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 961B71348E;
 Thu, 30 Mar 2023 18:04:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0MoRFzzPJWQ5GwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 30 Mar 2023 18:04:44 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [RFC PATCH v1 23/26] migration/multifd: Support incoming fixed-ram
 stream format
Date: Thu, 30 Mar 2023 15:03:33 -0300
Message-Id: <20230330180336.2791-24-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230330180336.2791-1-farosas@suse.de>
References: <20230330180336.2791-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
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

For the incoming fixed-ram migration we need to read the ramblock
headers, get the pages bitmap and send the host address of each
non-zero page to the multifd channel thread for writing.

To read from the migration file we need a preadv function that can
read into the iovs in segments of contiguous pages because (as in the
writing case) the file offset applies to the entire iovec.

Usage on HMP is:

(qemu) migrate_set_capability multifd on
(qemu) migrate_set_capability fixed-ram on
(qemu) migrate_set_parameter max-bandwidth 0
(qemu) migrate_set_parameter multifd-channels 8
(qemu) migrate_incoming file:migfile
(qemu) info status
(qemu) c

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 migration/multifd.c | 26 ++++++++++++++++++++++++--
 migration/ram.c     |  9 +++++++--
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index cc70b20ff7..36b5aedb16 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -141,6 +141,7 @@ static void nocomp_recv_cleanup(MultiFDRecvParams *p)
 static int nocomp_recv_pages(MultiFDRecvParams *p, Error **errp)
 {
     uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
+    uint64_t read_base = 0;
 
     if (flags != MULTIFD_FLAG_NOCOMP) {
         error_setg(errp, "multifd %u: flags received %x flags expected %x",
@@ -151,7 +152,13 @@ static int nocomp_recv_pages(MultiFDRecvParams *p, Error **errp)
         p->iov[i].iov_base = p->host + p->normal[i];
         p->iov[i].iov_len = p->page_size;
     }
-    return qio_channel_readv_all(p->c, p->iov, p->normal_num, errp);
+
+    if (migrate_fixed_ram()) {
+        read_base = p->pages->block->pages_offset - (uint64_t) p->host;
+    }
+
+    return qio_channel_read_full_all(p->c, p->iov, p->normal_num, read_base,
+                                     p->read_flags, errp);
 }
 
 static MultiFDMethods multifd_nocomp_ops = {
@@ -1221,9 +1228,21 @@ void multifd_recv_sync_main(void)
 {
     int i;
 
-    if (!migrate_use_multifd() || !migrate_multifd_use_packets()) {
+    if (!migrate_use_multifd()) {
         return;
     }
+
+    if (!migrate_multifd_use_packets()) {
+        for (i = 0; i < migrate_multifd_channels(); i++) {
+            MultiFDRecvParams *p = &multifd_recv_state->params[i];
+
+            qemu_sem_post(&p->sem);
+            continue;
+        }
+
+        return;
+    }
+
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDRecvParams *p = &multifd_recv_state->params[i];
 
@@ -1256,6 +1275,7 @@ static void *multifd_recv_thread(void *opaque)
 
     while (true) {
         uint32_t flags;
+        p->normal_num = 0;
 
         if (p->quit) {
             break;
@@ -1377,6 +1397,8 @@ int multifd_load_setup(Error **errp)
             p->packet_len = sizeof(MultiFDPacket_t)
                 + sizeof(uint64_t) * page_count;
             p->packet = g_malloc0(p->packet_len);
+        } else {
+            p->read_flags |= QIO_CHANNEL_READ_FLAG_WITH_OFFSET;
         }
         p->name = g_strdup_printf("multifdrecv_%d", i);
         p->iov = g_new0(struct iovec, page_count);
diff --git a/migration/ram.c b/migration/ram.c
index e9b28c16da..180e8e0d94 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4427,8 +4427,13 @@ static void read_ramblock_fixed_ram(QEMUFile *f, RAMBlock *block,
             host = host_from_ram_block_offset(block, offset);
             read_len = MIN(len, TARGET_PAGE_SIZE);
 
-            read = qemu_get_buffer_at(f, host, read_len,
-                                      block->pages_offset + offset);
+            if (migrate_use_multifd()) {
+                multifd_recv_queue_page(f, block, offset);
+                read = read_len;
+            } else {
+                read = qemu_get_buffer_at(f, host, read_len,
+                                          block->pages_offset + offset);
+            }
             completed += read;
         }
     }
-- 
2.35.3


