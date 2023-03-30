Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAED6D0D6A
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 20:07:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phwde-0003Nd-DA; Thu, 30 Mar 2023 14:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdU-0003K0-4p
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:36 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdR-00026h-Te
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:31 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CD4D521A3A;
 Thu, 30 Mar 2023 18:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680199468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OMQmZ9odr+w1MVMVyhbi8097U68hhrYNCCmZsyNq6zY=;
 b=lUPYDUU4FWBaBQCZ4wTp5TNPmwLnsHy/f4aQnmHq3O2E9PLRR7ae54YfcN2pGXQIOm2GWv
 ffqco5CgN54cJb7h7LK8yKLNNRcEYDb8Io47C304c8YwK/B99C6GoTaTEo2fEH3WkTKVOD
 ApHAgEAo6/5goOqRf7CbfewLE26GHWs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680199468;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OMQmZ9odr+w1MVMVyhbi8097U68hhrYNCCmZsyNq6zY=;
 b=plL4ELN0P6n8ygbqpL0CzJ77hIAIngA5LxJ+zHQp4M9VLMPNf8Gjw0XKbRcsW1HK5kT04Z
 9WhUf8kYuGzjQjCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BA5211348E;
 Thu, 30 Mar 2023 18:04:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aPafHyrPJWQ5GwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 30 Mar 2023 18:04:26 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [RFC PATCH v1 16/26] migration/multifd: Allow multifd without packets
Date: Thu, 30 Mar 2023 15:03:26 -0300
Message-Id: <20230330180336.2791-17-farosas@suse.de>
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

For the upcoming support to the new 'fixed-ram' migration stream
format, we cannot use multifd packets because each write into the
ramblock section in the migration file is expected to contain only the
guest pages. They are written at their respective offsets relative to
the ramblock section header.

There is no space for the packet information and the expected gains
from the new approach come partly from being able to write the pages
sequentially without extraneous data in between.

The new format also doesn't need the packets and all necessary
information can be taken from the standard migration headers with some
(future) changes to multifd code.

Use the presence of the fixed-ram capability to decide whether to send
packets. For now this has no effect as fixed-ram cannot yet be enabled
with multifd.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 migration/migration.c |   5 ++
 migration/migration.h |   2 +-
 migration/multifd.c   | 119 ++++++++++++++++++++++++++----------------
 3 files changed, 80 insertions(+), 46 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 17b26c1808..c647fbffa6 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2764,6 +2764,11 @@ int migrate_fixed_ram(void)
     return migrate_get_current()->enabled_capabilities[MIGRATION_CAPABILITY_FIXED_RAM];
 }
 
+bool migrate_multifd_use_packets(void)
+{
+    return !migrate_fixed_ram();
+}
+
 int migrate_multifd_zlib_level(void)
 {
     MigrationState *s;
diff --git a/migration/migration.h b/migration/migration.h
index 01c8201cfa..d7a014ce57 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -421,7 +421,7 @@ bool migrate_dirty_bitmaps(void);
 bool migrate_ignore_shared(void);
 bool migrate_validate_uuid(void);
 int migrate_fixed_ram(void);
-
+bool migrate_multifd_use_packets(void);
 bool migrate_auto_converge(void);
 bool migrate_use_multifd(void);
 bool migrate_pause_before_switchover(void);
diff --git a/migration/multifd.c b/migration/multifd.c
index e613d85e24..9f6b2787ed 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -659,18 +659,22 @@ static void *multifd_send_thread(void *opaque)
     Error *local_err = NULL;
     int ret = 0;
     bool use_zero_copy_send = migrate_use_zero_copy_send();
+    bool use_packets = migrate_multifd_use_packets();
 
     thread = MigrationThreadAdd(p->name, qemu_get_thread_id());
 
     trace_multifd_send_thread_start(p->id);
     rcu_register_thread();
 
-    if (multifd_send_initial_packet(p, &local_err) < 0) {
-        ret = -1;
-        goto out;
+    if (use_packets) {
+        if (multifd_send_initial_packet(p, &local_err) < 0) {
+            ret = -1;
+            goto out;
+        }
+
+        /* initial packet */
+        p->num_packets = 1;
     }
-    /* initial packet */
-    p->num_packets = 1;
 
     while (true) {
         qemu_sem_wait(&p->sem);
@@ -681,11 +685,10 @@ static void *multifd_send_thread(void *opaque)
         qemu_mutex_lock(&p->mutex);
 
         if (p->pending_job) {
-            uint64_t packet_num = p->packet_num;
             uint32_t flags;
             p->normal_num = 0;
 
-            if (use_zero_copy_send) {
+            if (!use_packets || use_zero_copy_send) {
                 p->iovs_num = 0;
             } else {
                 p->iovs_num = 1;
@@ -703,16 +706,20 @@ static void *multifd_send_thread(void *opaque)
                     break;
                 }
             }
-            multifd_send_fill_packet(p);
+
+            if (use_packets) {
+                multifd_send_fill_packet(p);
+                p->num_packets++;
+            }
+
             flags = p->flags;
             p->flags = 0;
-            p->num_packets++;
             p->total_normal_pages += p->normal_num;
             p->pages->num = 0;
             p->pages->block = NULL;
             qemu_mutex_unlock(&p->mutex);
 
-            trace_multifd_send(p->id, packet_num, p->normal_num, flags,
+            trace_multifd_send(p->id, p->packet_num, p->normal_num, flags,
                                p->next_packet_size);
 
             if (use_zero_copy_send) {
@@ -722,7 +729,7 @@ static void *multifd_send_thread(void *opaque)
                 if (ret != 0) {
                     break;
                 }
-            } else {
+            } else if (use_packets) {
                 /* Send header using the same writev call */
                 p->iov[0].iov_len = p->packet_len;
                 p->iov[0].iov_base = p->packet;
@@ -919,6 +926,7 @@ int multifd_save_setup(Error **errp)
 {
     int thread_count;
     uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
+    bool use_packets = migrate_multifd_use_packets();
     uint8_t i;
 
     if (!migrate_use_multifd()) {
@@ -943,14 +951,20 @@ int multifd_save_setup(Error **errp)
         p->pending_job = 0;
         p->id = i;
         p->pages = multifd_pages_init(page_count);
-        p->packet_len = sizeof(MultiFDPacket_t)
-                      + sizeof(uint64_t) * page_count;
-        p->packet = g_malloc0(p->packet_len);
-        p->packet->magic = cpu_to_be32(MULTIFD_MAGIC);
-        p->packet->version = cpu_to_be32(MULTIFD_VERSION);
+
+        if (use_packets) {
+            p->packet_len = sizeof(MultiFDPacket_t)
+                          + sizeof(uint64_t) * page_count;
+            p->packet = g_malloc0(p->packet_len);
+            p->packet->magic = cpu_to_be32(MULTIFD_MAGIC);
+            p->packet->version = cpu_to_be32(MULTIFD_VERSION);
+
+            /* We need one extra place for the packet header */
+            p->iov = g_new0(struct iovec, page_count + 1);
+        } else {
+            p->iov = g_new0(struct iovec, page_count);
+        }
         p->name = g_strdup_printf("multifdsend_%d", i);
-        /* We need one extra place for the packet header */
-        p->iov = g_new0(struct iovec, page_count + 1);
         p->normal = g_new0(ram_addr_t, page_count);
         p->page_size = qemu_target_page_size();
         p->page_count = page_count;
@@ -1082,7 +1096,7 @@ void multifd_recv_sync_main(void)
 {
     int i;
 
-    if (!migrate_use_multifd()) {
+    if (!migrate_use_multifd() || !migrate_multifd_use_packets()) {
         return;
     }
     for (i = 0; i < migrate_multifd_channels(); i++) {
@@ -1109,6 +1123,7 @@ static void *multifd_recv_thread(void *opaque)
 {
     MultiFDRecvParams *p = opaque;
     Error *local_err = NULL;
+    bool use_packets = migrate_multifd_use_packets();
     int ret;
 
     trace_multifd_recv_thread_start(p->id);
@@ -1121,17 +1136,20 @@ static void *multifd_recv_thread(void *opaque)
             break;
         }
 
-        ret = qio_channel_read_all_eof(p->c, (void *)p->packet,
-                                       p->packet_len, &local_err);
-        if (ret == 0 || ret == -1) {   /* 0: EOF  -1: Error */
-            break;
-        }
+        if (use_packets) {
+            ret = qio_channel_read_all_eof(p->c, (void *)p->packet,
+                                           p->packet_len, &local_err);
+            if (ret == 0 || ret == -1) {   /* 0: EOF  -1: Error */
+                break;
+            }
 
-        qemu_mutex_lock(&p->mutex);
-        ret = multifd_recv_unfill_packet(p, &local_err);
-        if (ret) {
-            qemu_mutex_unlock(&p->mutex);
-            break;
+            qemu_mutex_lock(&p->mutex);
+            ret = multifd_recv_unfill_packet(p, &local_err);
+            if (ret) {
+                qemu_mutex_unlock(&p->mutex);
+                break;
+            }
+            p->num_packets++;
         }
 
         flags = p->flags;
@@ -1139,7 +1157,7 @@ static void *multifd_recv_thread(void *opaque)
         p->flags &= ~MULTIFD_FLAG_SYNC;
         trace_multifd_recv(p->id, p->packet_num, p->normal_num, flags,
                            p->next_packet_size);
-        p->num_packets++;
+
         p->total_normal_pages += p->normal_num;
         qemu_mutex_unlock(&p->mutex);
 
@@ -1174,6 +1192,7 @@ int multifd_load_setup(Error **errp)
 {
     int thread_count;
     uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
+    bool use_packets = migrate_multifd_use_packets();
     uint8_t i;
 
     /*
@@ -1198,9 +1217,12 @@ int multifd_load_setup(Error **errp)
         qemu_sem_init(&p->sem_sync, 0);
         p->quit = false;
         p->id = i;
-        p->packet_len = sizeof(MultiFDPacket_t)
-                      + sizeof(uint64_t) * page_count;
-        p->packet = g_malloc0(p->packet_len);
+
+        if (use_packets) {
+            p->packet_len = sizeof(MultiFDPacket_t)
+                + sizeof(uint64_t) * page_count;
+            p->packet = g_malloc0(p->packet_len);
+        }
         p->name = g_strdup_printf("multifdrecv_%d", i);
         p->iov = g_new0(struct iovec, page_count);
         p->normal = g_new0(ram_addr_t, page_count);
@@ -1246,18 +1268,26 @@ void multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
 {
     MultiFDRecvParams *p;
     Error *local_err = NULL;
-    int id;
+    bool use_packets = migrate_multifd_use_packets();
+    int id, num_packets = 0;
 
-    id = multifd_recv_initial_packet(ioc, &local_err);
-    if (id < 0) {
-        multifd_recv_terminate_threads(local_err);
-        error_propagate_prepend(errp, local_err,
-                                "failed to receive packet"
-                                " via multifd channel %d: ",
-                                qatomic_read(&multifd_recv_state->count));
-        return;
+    if (use_packets) {
+        id = multifd_recv_initial_packet(ioc, &local_err);
+        if (id < 0) {
+            multifd_recv_terminate_threads(local_err);
+            error_propagate_prepend(errp, local_err,
+                                    "failed to receive packet"
+                                    " via multifd channel %d: ",
+                                    qatomic_read(&multifd_recv_state->count));
+            return;
+        }
+        trace_multifd_recv_new_channel(id);
+
+        /* initial packet */
+        num_packets = 1;
+    } else {
+        id = 0;
     }
-    trace_multifd_recv_new_channel(id);
 
     p = &multifd_recv_state->params[id];
     if (p->c != NULL) {
@@ -1268,9 +1298,8 @@ void multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
         return;
     }
     p->c = ioc;
+    p->num_packets = num_packets;
     object_ref(OBJECT(ioc));
-    /* initial packet */
-    p->num_packets = 1;
 
     p->running = true;
     qemu_thread_create(&p->thread, p->name, multifd_recv_thread, p,
-- 
2.35.3


