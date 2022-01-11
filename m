Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFDC48AF55
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 15:19:41 +0100 (CET)
Received: from localhost ([::1]:59792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Hzw-00050y-NC
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 09:19:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n7Gmw-0005FV-8S
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:02:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n7Gmt-0005w2-9F
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:02:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641906125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X6yilXY2H4qZVZtGegerGGj1/l1mERp+pEJkWe6zTNo=;
 b=ZZHw2nQjcRwAwHgS917a2BB7I3C7j/8C2DhoEZ0kG9URmXE+fnjzSXebV8aN4MCA8mWLum
 hytw8y59zRM287bGEN/5fWCU5HfSz5k/022LS9zYC3mgNLz+Df+9Xp57OfEDaO4bLeqVWb
 q21N0oxF4+Zd8kIBQbyLUYa7yxS7jy8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-q7IUByK4OZKyiIDbuKziaw-1; Tue, 11 Jan 2022 08:01:31 -0500
X-MC-Unique: q7IUByK4OZKyiIDbuKziaw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 821DD1023F4D;
 Tue, 11 Jan 2022 13:01:29 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 966161059179;
 Tue, 11 Jan 2022 13:01:27 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 20/23] multifd: Support for zero pages transmission
Date: Tue, 11 Jan 2022 14:00:21 +0100
Message-Id: <20220111130024.5392-21-quintela@redhat.com>
In-Reply-To: <20220111130024.5392-1-quintela@redhat.com>
References: <20220111130024.5392-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds counters and similar.  Logic will be added on the
following patch.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.h    | 13 ++++++++++++-
 migration/multifd.c    | 22 +++++++++++++++++++---
 migration/trace-events |  2 +-
 3 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 4dda900a0b..4c6d29c954 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -49,7 +49,10 @@ typedef struct {
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
@@ -117,6 +120,10 @@ typedef struct {
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
@@ -162,6 +169,10 @@ typedef struct {
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
index 76b57a7177..cfa9f75d13 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -265,6 +265,7 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
     packet->normal_pages = cpu_to_be32(p->normal_num);
     packet->next_packet_size = cpu_to_be32(p->next_packet_size);
     packet->packet_num = cpu_to_be64(p->packet_num);
+    packet->zero_pages = cpu_to_be32(p->zero_num);
 
     if (p->pages->block) {
         strncpy(packet->ramblock, p->pages->block->idstr, 256);
@@ -327,7 +328,15 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
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
 
@@ -553,6 +562,8 @@ void multifd_save_cleanup(void)
         p->iov = NULL;
         g_free(p->normal);
         p->normal = NULL;
+        g_free(p->zero);
+        p->zero = NULL;
         multifd_send_state->ops->send_cleanup(p, &local_err);
         if (local_err) {
             migrate_set_error(migrate_get_current(), local_err);
@@ -641,6 +652,7 @@ static void *multifd_send_thread(void *opaque)
             uint32_t flags = p->flags;
             p->iovs_num = 1;
             p->normal_num = 0;
+            p->zero_num = 0;
 
             for (int i = 0; i < p->pages->num; i++) {
                 p->normal[p->normal_num] = p->pages->offset[i];
@@ -662,8 +674,8 @@ static void *multifd_send_thread(void *opaque)
             p->pages->block = NULL;
             qemu_mutex_unlock(&p->mutex);
 
-            trace_multifd_send(p->id, packet_num, p->normal_num, flags,
-                               p->next_packet_size);
+            trace_multifd_send(p->id, packet_num, p->normal_num, p->zero_num,
+                               flags, p->next_packet_size);
 
             p->iov[0].iov_len = p->packet_len;
             p->iov[0].iov_base = p->packet;
@@ -913,6 +925,7 @@ int multifd_save_setup(Error **errp)
         /* We need one extra place for the packet header */
         p->iov = g_new0(struct iovec, page_count + 1);
         p->normal = g_new0(ram_addr_t, page_count);
+        p->zero = g_new0(ram_addr_t, page_count);
         socket_send_channel_create(multifd_new_send_channel_async, p);
     }
 
@@ -1014,6 +1027,8 @@ int multifd_load_cleanup(Error **errp)
         p->iov = NULL;
         g_free(p->normal);
         p->normal = NULL;
+        g_free(p->zero);
+        p->zero = NULL;
         multifd_recv_state->ops->recv_cleanup(p);
     }
     qemu_sem_destroy(&multifd_recv_state->sem_sync);
@@ -1153,6 +1168,7 @@ int multifd_load_setup(Error **errp)
         p->name = g_strdup_printf("multifdrecv_%d", i);
         p->iov = g_new0(struct iovec, page_count);
         p->normal = g_new0(ram_addr_t, page_count);
+        p->zero = g_new0(ram_addr_t, page_count);
     }
 
     for (i = 0; i < thread_count; i++) {
diff --git a/migration/trace-events b/migration/trace-events
index 171a83a55d..b7e8f54395 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -124,7 +124,7 @@ multifd_recv_sync_main_wait(uint8_t id) "channel %u"
 multifd_recv_terminate_threads(bool error) "error %d"
 multifd_recv_thread_end(uint8_t id, uint64_t packets, uint64_t pages) "channel %u packets %" PRIu64 " pages %" PRIu64
 multifd_recv_thread_start(uint8_t id) "%u"
-multifd_send(uint8_t id, uint64_t packet_num, uint32_t normal, uint32_t flags, uint32_t next_packet_size) "channel %u packet_num %" PRIu64 " normal pages %u flags 0x%x next packet size %u"
+multifd_send(uint8_t id, uint64_t packet_num, uint32_t normal, uint32_t zero, uint32_t flags, uint32_t next_packet_size) "channel %u packet_num %" PRIu64 " normal pages %u zero pages %u flags 0x%x next packet size %u"
 multifd_send_error(uint8_t id) "channel %u"
 multifd_send_sync_main(long packet_num) "packet num %ld"
 multifd_send_sync_main_signal(uint8_t id) "channel %u"
-- 
2.34.1


