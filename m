Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB99C629846
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 13:13:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouuoO-0003wN-Ot; Tue, 15 Nov 2022 07:13:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouuoC-0003sI-Vo
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 07:12:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouuoB-0004ZR-4q
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 07:12:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668514374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZoPVLuHc8bKBMaJocqe53n8qzTbPzXHFovN5EZZS1lo=;
 b=Ww+mLWBgX7kdK76bZsYO6clwMQApU2KVFpyYX0r5qpzkbp4ilICqMY0pYdf28kiqvq4p9b
 MFJ0Nq+wtQ2Ix69lA28R1y6pS3nxRJILqeTz/Vxo7ex060mXvU56WZ1gRwbW/ZXqvoROlh
 uf6xp2eTbHQgxJDGSTSV4QXnafzwt7Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-_zZz41YwOzOW3oBCcQWDkA-1; Tue, 15 Nov 2022 07:12:50 -0500
X-MC-Unique: _zZz41YwOzOW3oBCcQWDkA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8ABA1C09041;
 Tue, 15 Nov 2022 12:12:49 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB3EC492B05;
 Tue, 15 Nov 2022 12:12:46 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH 04/30] multifd: Create page_size fields into both MultiFD{Recv,
 Send}Params
Date: Tue, 15 Nov 2022 13:12:00 +0100
Message-Id: <20221115121226.26609-5-quintela@redhat.com>
In-Reply-To: <20221115121226.26609-1-quintela@redhat.com>
References: <20221115121226.26609-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We were calling qemu_target_page_size() left and right.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Leonardo Bras <leobras@redhat.com>
---
 migration/multifd.h      |  4 ++++
 migration/multifd-zlib.c | 14 ++++++--------
 migration/multifd-zstd.c | 12 +++++-------
 migration/multifd.c      | 18 ++++++++----------
 4 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 913e4ba274..941563c232 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -80,6 +80,8 @@ typedef struct {
     bool registered_yank;
     /* packet allocated len */
     uint32_t packet_len;
+    /* guest page size */
+    uint32_t page_size;
     /* multifd flags for sending ram */
     int write_flags;
 
@@ -143,6 +145,8 @@ typedef struct {
     QIOChannel *c;
     /* packet allocated len */
     uint32_t packet_len;
+    /* guest page size */
+    uint32_t page_size;
 
     /* syncs main thread and channels */
     QemuSemaphore sem_sync;
diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index 18213a9513..37770248e1 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -116,7 +116,6 @@ static void zlib_send_cleanup(MultiFDSendParams *p, Error **errp)
 static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
 {
     struct zlib_data *z = p->data;
-    size_t page_size = qemu_target_page_size();
     z_stream *zs = &z->zs;
     uint32_t out_size = 0;
     int ret;
@@ -135,8 +134,8 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
          * with compression. zlib does not guarantee that this is safe,
          * therefore copy the page before calling deflate().
          */
-        memcpy(z->buf, p->pages->block->host + p->normal[i], page_size);
-        zs->avail_in = page_size;
+        memcpy(z->buf, p->pages->block->host + p->normal[i], p->page_size);
+        zs->avail_in = p->page_size;
         zs->next_in = z->buf;
 
         zs->avail_out = available;
@@ -242,12 +241,11 @@ static void zlib_recv_cleanup(MultiFDRecvParams *p)
 static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
 {
     struct zlib_data *z = p->data;
-    size_t page_size = qemu_target_page_size();
     z_stream *zs = &z->zs;
     uint32_t in_size = p->next_packet_size;
     /* we measure the change of total_out */
     uint32_t out_size = zs->total_out;
-    uint32_t expected_size = p->normal_num * page_size;
+    uint32_t expected_size = p->normal_num * p->page_size;
     uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
     int ret;
     int i;
@@ -274,7 +272,7 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
             flush = Z_SYNC_FLUSH;
         }
 
-        zs->avail_out = page_size;
+        zs->avail_out = p->page_size;
         zs->next_out = p->host + p->normal[i];
 
         /*
@@ -288,8 +286,8 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
         do {
             ret = inflate(zs, flush);
         } while (ret == Z_OK && zs->avail_in
-                             && (zs->total_out - start) < page_size);
-        if (ret == Z_OK && (zs->total_out - start) < page_size) {
+                             && (zs->total_out - start) < p->page_size);
+        if (ret == Z_OK && (zs->total_out - start) < p->page_size) {
             error_setg(errp, "multifd %u: inflate generated too few output",
                        p->id);
             return -1;
diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index d788d309f2..f4a8e1ed1f 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -113,7 +113,6 @@ static void zstd_send_cleanup(MultiFDSendParams *p, Error **errp)
 static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
 {
     struct zstd_data *z = p->data;
-    size_t page_size = qemu_target_page_size();
     int ret;
     uint32_t i;
 
@@ -128,7 +127,7 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
             flush = ZSTD_e_flush;
         }
         z->in.src = p->pages->block->host + p->normal[i];
-        z->in.size = page_size;
+        z->in.size = p->page_size;
         z->in.pos = 0;
 
         /*
@@ -241,8 +240,7 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
 {
     uint32_t in_size = p->next_packet_size;
     uint32_t out_size = 0;
-    size_t page_size = qemu_target_page_size();
-    uint32_t expected_size = p->normal_num * page_size;
+    uint32_t expected_size = p->normal_num * p->page_size;
     uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
     struct zstd_data *z = p->data;
     int ret;
@@ -265,7 +263,7 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
 
     for (i = 0; i < p->normal_num; i++) {
         z->out.dst = p->host + p->normal[i];
-        z->out.size = page_size;
+        z->out.size = p->page_size;
         z->out.pos = 0;
 
         /*
@@ -279,8 +277,8 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
         do {
             ret = ZSTD_decompressStream(z->zds, &z->out, &z->in);
         } while (ret > 0 && (z->in.size - z->in.pos > 0)
-                         && (z->out.pos < page_size));
-        if (ret > 0 && (z->out.pos < page_size)) {
+                         && (z->out.pos < p->page_size));
+        if (ret > 0 && (z->out.pos < p->page_size)) {
             error_setg(errp, "multifd %u: decompressStream buffer too small",
                        p->id);
             return -1;
diff --git a/migration/multifd.c b/migration/multifd.c
index b54b6e7528..b32fe7edaf 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -87,15 +87,14 @@ static void nocomp_send_cleanup(MultiFDSendParams *p, Error **errp)
 static int nocomp_send_prepare(MultiFDSendParams *p, Error **errp)
 {
     MultiFDPages_t *pages = p->pages;
-    size_t page_size = qemu_target_page_size();
 
     for (int i = 0; i < p->normal_num; i++) {
         p->iov[p->iovs_num].iov_base = pages->block->host + p->normal[i];
-        p->iov[p->iovs_num].iov_len = page_size;
+        p->iov[p->iovs_num].iov_len = p->page_size;
         p->iovs_num++;
     }
 
-    p->next_packet_size = p->normal_num * page_size;
+    p->next_packet_size = p->normal_num * p->page_size;
     p->flags |= MULTIFD_FLAG_NOCOMP;
     return 0;
 }
@@ -139,7 +138,6 @@ static void nocomp_recv_cleanup(MultiFDRecvParams *p)
 static int nocomp_recv_pages(MultiFDRecvParams *p, Error **errp)
 {
     uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
-    size_t page_size = qemu_target_page_size();
 
     if (flags != MULTIFD_FLAG_NOCOMP) {
         error_setg(errp, "multifd %u: flags received %x flags expected %x",
@@ -148,7 +146,7 @@ static int nocomp_recv_pages(MultiFDRecvParams *p, Error **errp)
     }
     for (int i = 0; i < p->normal_num; i++) {
         p->iov[i].iov_base = p->host + p->normal[i];
-        p->iov[i].iov_len = page_size;
+        p->iov[i].iov_len = p->page_size;
     }
     return qio_channel_readv_all(p->c, p->iov, p->normal_num, errp);
 }
@@ -281,8 +279,7 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
 static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
 {
     MultiFDPacket_t *packet = p->packet;
-    size_t page_size = qemu_target_page_size();
-    uint32_t page_count = MULTIFD_PACKET_SIZE / page_size;
+    uint32_t page_count = MULTIFD_PACKET_SIZE / p->page_size;
     RAMBlock *block;
     int i;
 
@@ -344,7 +341,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
     for (i = 0; i < p->normal_num; i++) {
         uint64_t offset = be64_to_cpu(packet->offset[i]);
 
-        if (offset > (block->used_length - page_size)) {
+        if (offset > (block->used_length - p->page_size)) {
             error_setg(errp, "multifd: offset too long %" PRIu64
                        " (max " RAM_ADDR_FMT ")",
                        offset, block->used_length);
@@ -433,8 +430,7 @@ static int multifd_send_pages(QEMUFile *f)
     p->packet_num = multifd_send_state->packet_num++;
     multifd_send_state->pages = p->pages;
     p->pages = pages;
-    transferred = ((uint64_t) pages->num) * qemu_target_page_size()
-                + p->packet_len;
+    transferred = ((uint64_t) pages->num) * p->page_size + p->packet_len;
     qemu_file_acct_rate_limit(f, transferred);
     ram_counters.multifd_bytes += transferred;
     ram_counters.transferred += transferred;
@@ -947,6 +943,7 @@ int multifd_save_setup(Error **errp)
         /* We need one extra place for the packet header */
         p->iov = g_new0(struct iovec, page_count + 1);
         p->normal = g_new0(ram_addr_t, page_count);
+        p->page_size = qemu_target_page_size();
 
         if (migrate_use_zero_copy_send()) {
             p->write_flags = QIO_CHANNEL_WRITE_FLAG_ZERO_COPY;
@@ -1194,6 +1191,7 @@ int multifd_load_setup(Error **errp)
         p->name = g_strdup_printf("multifdrecv_%d", i);
         p->iov = g_new0(struct iovec, page_count);
         p->normal = g_new0(ram_addr_t, page_count);
+        p->page_size = qemu_target_page_size();
     }
 
     for (i = 0; i < thread_count; i++) {
-- 
2.38.1


