Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A913B522725
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 00:47:02 +0200 (CEST)
Received: from localhost ([::1]:41692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noYdB-0007Tg-NK
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 18:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1noYaM-0004dg-T0
 for qemu-devel@nongnu.org; Tue, 10 May 2022 18:44:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1noYaI-0006Jh-JF
 for qemu-devel@nongnu.org; Tue, 10 May 2022 18:44:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652222642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mWS/5FeV6dsloVMcQQ2NAu5WOn/IjzqL1/D0GIxLup8=;
 b=GUiJb+Hg/lVPZ+nKa8nRdiLzN52whxhLTAnirt8zO8rSXHmPvVwmsyUPujbJcz3GfkI6lp
 mKJ113zxrW/dTqbzxC78YhA40xyhjzU/ZWDipbc17d9B+bm86ZIous2K3U5zeC8sCtTFPW
 wqikZpS4ie7RvjysY6y2Lika5QT7uB0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-VggH-SgGN0W4dzLDyTqRng-1; Tue, 10 May 2022 18:42:45 -0400
X-MC-Unique: VggH-SgGN0W4dzLDyTqRng-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F48185A5A8;
 Tue, 10 May 2022 22:42:45 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDCFD40CFD06;
 Tue, 10 May 2022 22:42:43 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v6 11/13] multifd: Support for zero pages transmission
Date: Wed, 11 May 2022 00:42:18 +0200
Message-Id: <20220510224220.5912-12-quintela@redhat.com>
In-Reply-To: <20220510224220.5912-1-quintela@redhat.com>
References: <20220510224220.5912-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds counters and similar.  Logic will be added on the
following patch.

Signed-off-by: Juan Quintela <quintela@redhat.com>

---

Added counters for duplicated/non duplicated pages.
Removed reviewed by from David.
Add total_zero_pages
---
 migration/multifd.h    | 17 ++++++++++++++++-
 migration/multifd.c    | 36 +++++++++++++++++++++++++++++-------
 migration/ram.c        |  2 --
 migration/trace-events |  8 ++++----
 4 files changed, 49 insertions(+), 14 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index ed81f249d7..3bb33eb4af 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -47,7 +47,10 @@ typedef struct {
     /* size of the next packet that contains pages */
     uint32_t next_packet_size;
     uint64_t packet_num;
-    uint64_t unused[4];    /* Reserved for future use */
+    /* zero pages */
+    uint32_t zero_pages;
+    uint32_t unused32[1];    /* Reserved for future use */
+    uint64_t unused64[3];    /* Reserved for future use */
     char ramblock[256];
     uint64_t offset[];
 } __attribute__((packed)) MultiFDPacket_t;
@@ -125,6 +128,8 @@ typedef struct {
     uint64_t num_packets;
     /* non zero pages sent through this channel */
     uint64_t total_normal_pages;
+    /* zero pages sent through this channel */
+    uint64_t total_zero_pages;
     /* buffers to send */
     struct iovec *iov;
     /* number of iovs used */
@@ -133,6 +138,10 @@ typedef struct {
     ram_addr_t *normal;
     /* num of non zero pages */
     uint32_t normal_num;
+    /* Pages that are  zero */
+    ram_addr_t *zero;
+    /* num of zero pages */
+    uint32_t zero_num;
     /* used for compression methods */
     void *data;
 }  MultiFDSendParams;
@@ -182,12 +191,18 @@ typedef struct {
     uint8_t *host;
     /* non zero pages recv through this channel */
     uint64_t total_normal_pages;
+    /* zero pages recv through this channel */
+    uint64_t total_zero_pages;
     /* buffers to recv */
     struct iovec *iov;
     /* Pages that are not zero */
     ram_addr_t *normal;
     /* num of non zero pages */
     uint32_t normal_num;
+    /* Pages that are  zero */
+    ram_addr_t *zero;
+    /* num of zero pages */
+    uint32_t zero_num;
     /* used for de-compression methods */
     void *data;
 } MultiFDRecvParams;
diff --git a/migration/multifd.c b/migration/multifd.c
index c8f2caa2ae..15a16686db 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -263,6 +263,7 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
     packet->normal_pages = cpu_to_be32(p->normal_num);
     packet->next_packet_size = cpu_to_be32(p->next_packet_size);
     packet->packet_num = cpu_to_be64(p->packet_num);
+    packet->zero_pages = cpu_to_be32(p->zero_num);
 
     if (p->pages->block) {
         strncpy(packet->ramblock, p->pages->block->idstr, 256);
@@ -323,7 +324,15 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
     p->next_packet_size = be32_to_cpu(packet->next_packet_size);
     p->packet_num = be64_to_cpu(packet->packet_num);
 
-    if (p->normal_num == 0) {
+    p->zero_num = be32_to_cpu(packet->zero_pages);
+    if (p->zero_num > packet->pages_alloc - p->normal_num) {
+        error_setg(errp, "multifd: received packet "
+                   "with %u zero pages and expected maximum pages are %u",
+                   p->zero_num, packet->pages_alloc - p->normal_num) ;
+        return -1;
+    }
+
+    if (p->normal_num == 0 && p->zero_num == 0) {
         return 0;
     }
 
@@ -432,6 +441,8 @@ static int multifd_send_pages(QEMUFile *f)
     ram_counters.multifd_bytes += p->sent_bytes;
     qemu_file_update_transfer(f, p->sent_bytes);
     p->sent_bytes = 0;
+    ram_counters.normal += p->normal_num;
+    ram_counters.duplicate += p->zero_num;
     qemu_mutex_unlock(&p->mutex);
     qemu_sem_post(&p->sem);
 
@@ -545,6 +556,8 @@ void multifd_save_cleanup(void)
         p->iov = NULL;
         g_free(p->normal);
         p->normal = NULL;
+        g_free(p->zero);
+        p->zero = NULL;
         multifd_send_state->ops->send_cleanup(p, &local_err);
         if (local_err) {
             migrate_set_error(migrate_get_current(), local_err);
@@ -636,6 +649,7 @@ static void *multifd_send_thread(void *opaque)
 
             p->iovs_num = 1;
             p->normal_num = 0;
+            p->zero_num = 0;
 
             for (int i = 0; i < p->pages->num; i++) {
                 p->normal[p->normal_num] = p->pages->offset[i];
@@ -651,8 +665,8 @@ static void *multifd_send_thread(void *opaque)
             }
             multifd_send_fill_packet(p);
 
-            trace_multifd_send(p->id, packet_num, p->normal_num, p->flags,
-                               p->next_packet_size);
+            trace_multifd_send(p->id, packet_num, p->normal_num, p->zero_num,
+                               p->flags, p->next_packet_size);
 
             p->iov[0].iov_len = p->packet_len;
             p->iov[0].iov_base = p->packet;
@@ -666,6 +680,7 @@ static void *multifd_send_thread(void *opaque)
             qemu_mutex_lock(&p->mutex);
             p->num_packets++;
             p->total_normal_pages += p->normal_num;
+            p->total_zero_pages += p->zero_num;
             p->pages->num = 0;
             p->pages->block = NULL;
             p->sent_bytes += p->packet_len;;
@@ -707,7 +722,8 @@ out:
     qemu_mutex_unlock(&p->mutex);
 
     rcu_unregister_thread();
-    trace_multifd_send_thread_end(p->id, p->num_packets, p->total_normal_pages);
+    trace_multifd_send_thread_end(p->id, p->num_packets, p->total_normal_pages,
+                                  p->total_zero_pages);
 
     return NULL;
 }
@@ -897,6 +913,7 @@ int multifd_save_setup(Error **errp)
         p->normal = g_new0(ram_addr_t, page_count);
         p->page_size = qemu_target_page_size();
         p->page_count = page_count;
+        p->zero = g_new0(ram_addr_t, page_count);
         socket_send_channel_create(multifd_new_send_channel_async, p);
     }
 
@@ -998,6 +1015,8 @@ int multifd_load_cleanup(Error **errp)
         p->iov = NULL;
         g_free(p->normal);
         p->normal = NULL;
+        g_free(p->zero);
+        p->zero = NULL;
         multifd_recv_state->ops->recv_cleanup(p);
     }
     qemu_sem_destroy(&multifd_recv_state->sem_sync);
@@ -1068,13 +1087,14 @@ static void *multifd_recv_thread(void *opaque)
             break;
         }
 
-        trace_multifd_recv(p->id, p->packet_num, p->normal_num, p->flags,
-                           p->next_packet_size);
+        trace_multifd_recv(p->id, p->packet_num, p->normal_num, p->zero_num,
+                           p->flags, p->next_packet_size);
         sync_needed = p->flags & MULTIFD_FLAG_SYNC;
         /* recv methods don't know how to handle the SYNC flag */
         p->flags &= ~MULTIFD_FLAG_SYNC;
         p->num_packets++;
         p->total_normal_pages += p->normal_num;
+        p->total_normal_pages += p->zero_num;
         qemu_mutex_unlock(&p->mutex);
 
         if (p->normal_num) {
@@ -1099,7 +1119,8 @@ static void *multifd_recv_thread(void *opaque)
     qemu_mutex_unlock(&p->mutex);
 
     rcu_unregister_thread();
-    trace_multifd_recv_thread_end(p->id, p->num_packets, p->total_normal_pages);
+    trace_multifd_recv_thread_end(p->id, p->num_packets, p->total_normal_pages,
+                                  p->total_zero_pages);
 
     return NULL;
 }
@@ -1139,6 +1160,7 @@ int multifd_load_setup(Error **errp)
         p->normal = g_new0(ram_addr_t, page_count);
         p->page_count = page_count;
         p->page_size = qemu_target_page_size();
+        p->zero = g_new0(ram_addr_t, page_count);
     }
 
     for (i = 0; i < thread_count; i++) {
diff --git a/migration/ram.c b/migration/ram.c
index 34da0d71df..0a91b87bd2 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1356,8 +1356,6 @@ static int ram_save_multifd_page(RAMState *rs, RAMBlock *block,
     if (multifd_queue_page(rs->f, block, offset) < 0) {
         return -1;
     }
-    ram_counters.normal++;
-
     return 1;
 }
 
diff --git a/migration/trace-events b/migration/trace-events
index 1aec580e92..d70e89dbb9 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -114,21 +114,21 @@ unqueue_page(char *block, uint64_t offset, bool dirty) "ramblock '%s' offset 0x%
 
 # multifd.c
 multifd_new_send_channel_async(uint8_t id) "channel %u"
-multifd_recv(uint8_t id, uint64_t packet_num, uint32_t used, uint32_t flags, uint32_t next_packet_size) "channel %u packet_num %" PRIu64 " pages %u flags 0x%x next packet size %u"
+multifd_recv(uint8_t id, uint64_t packet_num, uint32_t normal, uint32_t zero, uint32_t flags, uint32_t next_packet_size) "channel %u packet_num %" PRIu64 " normal pages %u zero pages %u flags 0x%x next packet size %u"
 multifd_recv_new_channel(uint8_t id) "channel %u"
 multifd_recv_sync_main(long packet_num) "packet num %ld"
 multifd_recv_sync_main_signal(uint8_t id) "channel %u"
 multifd_recv_sync_main_wait(uint8_t id) "channel %u"
 multifd_recv_terminate_threads(bool error) "error %d"
-multifd_recv_thread_end(uint8_t id, uint64_t packets, uint64_t pages) "channel %u packets %" PRIu64 " pages %" PRIu64
+multifd_recv_thread_end(uint8_t id, uint64_t packets, uint64_t normal_pages, uint64_t zero_pages) "channel %u packets %" PRIu64 " normal pages %" PRIu64 " zero pages %" PRIu64
 multifd_recv_thread_start(uint8_t id) "%u"
-multifd_send(uint8_t id, uint64_t packet_num, uint32_t normal, uint32_t flags, uint32_t next_packet_size) "channel %u packet_num %" PRIu64 " normal pages %u flags 0x%x next packet size %u"
+multifd_send(uint8_t id, uint64_t packet_num, uint32_t normalpages, uint32_t zero_pages, uint32_t flags, uint32_t next_packet_size) "channel %u packet_num %" PRIu64 " normal pages %u zero pages %u flags 0x%x next packet size %u"
 multifd_send_error(uint8_t id) "channel %u"
 multifd_send_sync_main(long packet_num) "packet num %ld"
 multifd_send_sync_main_signal(uint8_t id) "channel %u"
 multifd_send_sync_main_wait(uint8_t id) "channel %u"
 multifd_send_terminate_threads(bool error) "error %d"
-multifd_send_thread_end(uint8_t id, uint64_t packets, uint64_t normal_pages) "channel %u packets %" PRIu64 " normal pages %"  PRIu64
+multifd_send_thread_end(uint8_t id, uint64_t packets, uint64_t normal_pages, uint64_t zero_pages) "channel %u packets %" PRIu64 " normal pages %"  PRIu64 " zero pages %"  PRIu64
 multifd_send_thread_start(uint8_t id) "%u"
 multifd_tls_outgoing_handshake_start(void *ioc, void *tioc, const char *hostname) "ioc=%p tioc=%p hostname=%s"
 multifd_tls_outgoing_handshake_error(void *ioc, const char *err) "ioc=%p err=%s"
-- 
2.35.1


