Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EC248AF03
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 14:59:19 +0100 (CET)
Received: from localhost ([::1]:45572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7HgF-0000Tz-0V
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 08:59:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n7Gmm-0005At-SI
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:02:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n7Gmi-0005lc-Bx
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:02:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641906081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G9rt5M62lceiMLEHRh+xPwwooNaUwPvoMJfwJbzXMpo=;
 b=UCFLNtnlKdsqfL53TO/8VRgkY9KcDMmquScr8hCESfBcaVBN4dC+2WDDiKiq3vtNMNw3RJ
 KZmGjBDML18WMCfWvtv6NA4CfuUJNRhj5r5TXeTFzdx93zMNq/mpoCQBnerwiLFHa29ZC2
 UD2hGnKZ+uZ15xJVGbaBKNtSTKTBZto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-SqFhF_LkPh-WNr8hfea3og-1; Tue, 11 Jan 2022 08:01:18 -0500
X-MC-Unique: SqFhF_LkPh-WNr8hfea3og-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0E161023F4E;
 Tue, 11 Jan 2022 13:01:17 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DF8C1059585;
 Tue, 11 Jan 2022 13:01:15 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/23] multifd: Use normal pages array on the recv side
Date: Tue, 11 Jan 2022 14:00:16 +0100
Message-Id: <20220111130024.5392-16-quintela@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

Signed-off-by: Juan Quintela <quintela@redhat.com>

---

Rename num_normal_pages to total_normal_pages (peter)
---
 migration/multifd.h      |  8 +++++--
 migration/multifd-zlib.c |  8 +++----
 migration/multifd-zstd.c |  6 +++---
 migration/multifd.c      | 45 ++++++++++++++++++----------------------
 4 files changed, 33 insertions(+), 34 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 7823199dbe..850889c5d8 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -151,12 +151,16 @@ typedef struct {
     uint32_t next_packet_size;
     /* packets sent through this channel */
     uint64_t num_packets;
-    /* pages sent through this channel */
-    uint64_t num_pages;
+    /* non zero pages recv through this channel */
+    uint64_t total_normal_pages;
     /* syncs main thread and channels */
     QemuSemaphore sem_sync;
     /* buffers to recv */
     struct iovec *iov;
+    /* Pages that are not zero */
+    ram_addr_t *normal;
+    /* num of non zero pages */
+    uint32_t normal_num;
     /* used for de-compression methods */
     void *data;
 } MultiFDRecvParams;
diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index 7f4fbef2c9..8239c840d3 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -225,7 +225,7 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
     uint32_t in_size = p->next_packet_size;
     /* we measure the change of total_out */
     uint32_t out_size = zs->total_out;
-    uint32_t expected_size = p->pages->num * qemu_target_page_size();
+    uint32_t expected_size = p->normal_num * page_size;
     uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
     int ret;
     int i;
@@ -244,16 +244,16 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
     zs->avail_in = in_size;
     zs->next_in = z->zbuff;
 
-    for (i = 0; i < p->pages->num; i++) {
+    for (i = 0; i < p->normal_num; i++) {
         int flush = Z_NO_FLUSH;
         unsigned long start = zs->total_out;
 
-        if (i == p->pages->num - 1) {
+        if (i == p->normal_num - 1) {
             flush = Z_SYNC_FLUSH;
         }
 
         zs->avail_out = page_size;
-        zs->next_out = p->pages->block->host + p->pages->offset[i];
+        zs->next_out = p->pages->block->host + p->normal[i];
 
         /*
          * Welcome to inflate semantics
diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index 907d07805c..c5ed72ddcd 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -242,7 +242,7 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
     uint32_t in_size = p->next_packet_size;
     uint32_t out_size = 0;
     size_t page_size = qemu_target_page_size();
-    uint32_t expected_size = p->pages->num * page_size;
+    uint32_t expected_size = p->normal_num * page_size;
     uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
     struct zstd_data *z = p->data;
     int ret;
@@ -263,8 +263,8 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
     z->in.size = in_size;
     z->in.pos = 0;
 
-    for (i = 0; i < p->pages->num; i++) {
-        z->out.dst = p->pages->block->host + p->pages->offset[i];
+    for (i = 0; i < p->normal_num; i++) {
+        z->out.dst = p->pages->block->host + p->normal[i];
         z->out.size = page_size;
         z->out.pos = 0;
 
diff --git a/migration/multifd.c b/migration/multifd.c
index 7b804928a2..e362b1bb89 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -146,11 +146,11 @@ static int nocomp_recv_pages(MultiFDRecvParams *p, Error **errp)
                    p->id, flags, MULTIFD_FLAG_NOCOMP);
         return -1;
     }
-    for (int i = 0; i < p->pages->num; i++) {
-        p->iov[i].iov_base = p->pages->block->host + p->pages->offset[i];
+    for (int i = 0; i < p->normal_num; i++) {
+        p->iov[i].iov_base = p->pages->block->host + p->normal[i];
         p->iov[i].iov_len = page_size;
     }
-    return qio_channel_readv_all(p->c, p->iov, p->pages->num, errp);
+    return qio_channel_readv_all(p->c, p->iov, p->normal_num, errp);
 }
 
 static MultiFDMethods multifd_nocomp_ops = {
@@ -282,7 +282,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
 {
     MultiFDPacket_t *packet = p->packet;
     size_t page_size = qemu_target_page_size();
-    uint32_t pages_max = MULTIFD_PACKET_SIZE / page_size;
+    uint32_t page_count = MULTIFD_PACKET_SIZE / page_size;
     RAMBlock *block;
     int i;
 
@@ -309,33 +309,25 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
      * If we received a packet that is 100 times bigger than expected
      * just stop migration.  It is a magic number.
      */
-    if (packet->pages_alloc > pages_max * 100) {
+    if (packet->pages_alloc > page_count) {
         error_setg(errp, "multifd: received packet "
-                   "with size %u and expected a maximum size of %u",
-                   packet->pages_alloc, pages_max * 100) ;
+                   "with size %u and expected a size of %u",
+                   packet->pages_alloc, page_count) ;
         return -1;
     }
-    /*
-     * We received a packet that is bigger than expected but inside
-     * reasonable limits (see previous comment).  Just reallocate.
-     */
-    if (packet->pages_alloc > p->pages->allocated) {
-        multifd_pages_clear(p->pages);
-        p->pages = multifd_pages_init(packet->pages_alloc);
-    }
 
-    p->pages->num = be32_to_cpu(packet->pages_used);
-    if (p->pages->num > packet->pages_alloc) {
+    p->normal_num = be32_to_cpu(packet->pages_used);
+    if (p->normal_num > packet->pages_alloc) {
         error_setg(errp, "multifd: received packet "
                    "with %u pages and expected maximum pages are %u",
-                   p->pages->num, packet->pages_alloc) ;
+                   p->normal_num, packet->pages_alloc) ;
         return -1;
     }
 
     p->next_packet_size = be32_to_cpu(packet->next_packet_size);
     p->packet_num = be64_to_cpu(packet->packet_num);
 
-    if (p->pages->num == 0) {
+    if (p->normal_num == 0) {
         return 0;
     }
 
@@ -349,7 +341,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
     }
 
     p->pages->block = block;
-    for (i = 0; i < p->pages->num; i++) {
+    for (i = 0; i < p->normal_num; i++) {
         uint64_t offset = be64_to_cpu(packet->offset[i]);
 
         if (offset > (block->used_length - page_size)) {
@@ -358,7 +350,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
                        offset, block->used_length);
             return -1;
         }
-        p->pages->offset[i] = offset;
+        p->normal[i] = offset;
     }
 
     return 0;
@@ -1022,6 +1014,8 @@ int multifd_load_cleanup(Error **errp)
         p->packet = NULL;
         g_free(p->iov);
         p->iov = NULL;
+        g_free(p->normal);
+        p->normal = NULL;
         multifd_recv_state->ops->recv_cleanup(p);
     }
     qemu_sem_destroy(&multifd_recv_state->sem_sync);
@@ -1095,13 +1089,13 @@ static void *multifd_recv_thread(void *opaque)
         flags = p->flags;
         /* recv methods don't know how to handle the SYNC flag */
         p->flags &= ~MULTIFD_FLAG_SYNC;
-        trace_multifd_recv(p->id, p->packet_num, p->pages->num, flags,
+        trace_multifd_recv(p->id, p->packet_num, p->normal_num, flags,
                            p->next_packet_size);
         p->num_packets++;
-        p->num_pages += p->pages->num;
+        p->total_normal_pages += p->normal_num;
         qemu_mutex_unlock(&p->mutex);
 
-        if (p->pages->num) {
+        if (p->normal_num) {
             ret = multifd_recv_state->ops->recv_pages(p, &local_err);
             if (ret != 0) {
                 break;
@@ -1123,7 +1117,7 @@ static void *multifd_recv_thread(void *opaque)
     qemu_mutex_unlock(&p->mutex);
 
     rcu_unregister_thread();
-    trace_multifd_recv_thread_end(p->id, p->num_packets, p->num_pages);
+    trace_multifd_recv_thread_end(p->id, p->num_packets, p->total_normal_pages);
 
     return NULL;
 }
@@ -1161,6 +1155,7 @@ int multifd_load_setup(Error **errp)
         p->packet = g_malloc0(p->packet_len);
         p->name = g_strdup_printf("multifdrecv_%d", i);
         p->iov = g_new0(struct iovec, page_count);
+        p->normal = g_new0(ram_addr_t, page_count);
     }
 
     for (i = 0; i < thread_count; i++) {
-- 
2.34.1


