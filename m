Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 219344A0106
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 20:40:56 +0100 (CET)
Received: from localhost ([::1]:55782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDX77-00080G-OP
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 14:40:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW7b-0000JR-Ft
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:37:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW7W-0001gX-BX
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:37:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643395031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tNPrpk19d5IB0vw46yUHcQziDYelLxLiw1tT27P4kV8=;
 b=hnPM8zzl6shOc8D512hPo1gsJQmHzV4tHirPSxT8SZIVObrKV8qCdCFh2KR4NL3pI+HBYQ
 xsugheR1INzZIWiMzaRsJNs37T8ULOsaSa6WVbPJgbXZJNM5ULuAIZG6G39nCNUY9V8fX9
 bxEQYfxwFuNOCgOB2mSaq759NxvlQ0M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-KjnT3V9fN76kxptQMuhP9Q-1; Fri, 28 Jan 2022 13:37:10 -0500
X-MC-Unique: KjnT3V9fN76kxptQMuhP9Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0605481424E;
 Fri, 28 Jan 2022 18:37:08 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E57E7746A;
 Fri, 28 Jan 2022 18:35:55 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/36] multifd: Use normal pages array on the send side
Date: Fri, 28 Jan 2022 19:30:11 +0100
Message-Id: <20220128183033.31998-15-quintela@redhat.com>
In-Reply-To: <20220128183033.31998-1-quintela@redhat.com>
References: <20220128183033.31998-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.167, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are only sending normal pages through multifd channels.
Later on this series, we are going to also send zero pages.
We are going to detect if a page is zero or non zero in the multifd
channel thread, not on the main thread.

So we receive an array of pages page->offset[N]

And we will end with:

p->normal[N - zero_pages]
p->zero[zero_pages].

In this patch, we just copy all the pages in offset to normal.

for (i = 0; i < pages->num; i++) {
    p->narmal[p->normal_num] = pages->offset[i];
    p->normal_num++:
}

Later in the series this becomes:

for (i = 0; i < pages->num; i++) {
    if (buffer_is_zero(page->offset[i])) {
        p->zerol[p->zero_num] = pages->offset[i];
        p->zero_num++:
    } else {
        p->narmal[p->normal_num] = pages->offset[i];
        p->normal_num++:
    }
}

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

---

Improving comment (dave)
Renaming num_normal_pages to total_normal_pages (peter)
---
 migration/multifd.h      |  8 ++++++--
 migration/multifd-zlib.c |  6 +++---
 migration/multifd-zstd.c |  6 +++---
 migration/multifd.c      | 30 +++++++++++++++++++-----------
 migration/trace-events   |  4 ++--
 5 files changed, 33 insertions(+), 21 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 7496f951a7..7823199dbe 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -104,14 +104,18 @@ typedef struct {
     /* thread local variables */
     /* packets sent through this channel */
     uint64_t num_packets;
-    /* pages sent through this channel */
-    uint64_t num_pages;
+    /* non zero pages sent through this channel */
+    uint64_t total_normal_pages;
     /* syncs main thread and channels */
     QemuSemaphore sem_sync;
     /* buffers to send */
     struct iovec *iov;
     /* number of iovs used */
     uint32_t iovs_num;
+    /* Pages that are not zero */
+    ram_addr_t *normal;
+    /* num of non zero pages */
+    uint32_t normal_num;
     /* used for compression methods */
     void *data;
 }  MultiFDSendParams;
diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index ba90f1aaf4..7f4fbef2c9 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -106,16 +106,16 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
     int ret;
     uint32_t i;
 
-    for (i = 0; i < p->pages->num; i++) {
+    for (i = 0; i < p->normal_num; i++) {
         uint32_t available = z->zbuff_len - out_size;
         int flush = Z_NO_FLUSH;
 
-        if (i == p->pages->num - 1) {
+        if (i == p->normal_num - 1) {
             flush = Z_SYNC_FLUSH;
         }
 
         zs->avail_in = page_size;
-        zs->next_in = p->pages->block->host + p->pages->offset[i];
+        zs->next_in = p->pages->block->host + p->normal[i];
 
         zs->avail_out = available;
         zs->next_out = z->zbuff + out_size;
diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index 757434d1ee..907d07805c 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -121,13 +121,13 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
     z->out.size = z->zbuff_len;
     z->out.pos = 0;
 
-    for (i = 0; i < p->pages->num; i++) {
+    for (i = 0; i < p->normal_num; i++) {
         ZSTD_EndDirective flush = ZSTD_e_continue;
 
-        if (i == p->pages->num - 1) {
+        if (i == p->normal_num - 1) {
             flush = ZSTD_e_flush;
         }
-        z->in.src = p->pages->block->host + p->pages->offset[i];
+        z->in.src = p->pages->block->host + p->normal[i];
         z->in.size = page_size;
         z->in.pos = 0;
 
diff --git a/migration/multifd.c b/migration/multifd.c
index e5b1fa5015..7b804928a2 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -89,13 +89,13 @@ static int nocomp_send_prepare(MultiFDSendParams *p, Error **errp)
     MultiFDPages_t *pages = p->pages;
     size_t page_size = qemu_target_page_size();
 
-    for (int i = 0; i < p->pages->num; i++) {
-        p->iov[p->iovs_num].iov_base = pages->block->host + pages->offset[i];
+    for (int i = 0; i < p->normal_num; i++) {
+        p->iov[p->iovs_num].iov_base = pages->block->host + p->normal[i];
         p->iov[p->iovs_num].iov_len = page_size;
         p->iovs_num++;
     }
 
-    p->next_packet_size = p->pages->num * page_size;
+    p->next_packet_size = p->normal_num * page_size;
     p->flags |= MULTIFD_FLAG_NOCOMP;
     return 0;
 }
@@ -262,7 +262,7 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
 
     packet->flags = cpu_to_be32(p->flags);
     packet->pages_alloc = cpu_to_be32(p->pages->allocated);
-    packet->pages_used = cpu_to_be32(p->pages->num);
+    packet->pages_used = cpu_to_be32(p->normal_num);
     packet->next_packet_size = cpu_to_be32(p->next_packet_size);
     packet->packet_num = cpu_to_be64(p->packet_num);
 
@@ -270,9 +270,9 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
         strncpy(packet->ramblock, p->pages->block->idstr, 256);
     }
 
-    for (i = 0; i < p->pages->num; i++) {
+    for (i = 0; i < p->normal_num; i++) {
         /* there are architectures where ram_addr_t is 32 bit */
-        uint64_t temp = p->pages->offset[i];
+        uint64_t temp = p->normal[i];
 
         packet->offset[i] = cpu_to_be64(temp);
     }
@@ -559,6 +559,8 @@ void multifd_save_cleanup(void)
         p->packet = NULL;
         g_free(p->iov);
         p->iov = NULL;
+        g_free(p->normal);
+        p->normal = NULL;
         multifd_send_state->ops->send_cleanup(p, &local_err);
         if (local_err) {
             migrate_set_error(migrate_get_current(), local_err);
@@ -643,12 +645,17 @@ static void *multifd_send_thread(void *opaque)
         qemu_mutex_lock(&p->mutex);
 
         if (p->pending_job) {
-            uint32_t used = p->pages->num;
             uint64_t packet_num = p->packet_num;
             uint32_t flags = p->flags;
             p->iovs_num = 1;
+            p->normal_num = 0;
 
-            if (used) {
+            for (int i = 0; i < p->pages->num; i++) {
+                p->normal[p->normal_num] = p->pages->offset[i];
+                p->normal_num++;
+            }
+
+            if (p->normal_num) {
                 ret = multifd_send_state->ops->send_prepare(p, &local_err);
                 if (ret != 0) {
                     qemu_mutex_unlock(&p->mutex);
@@ -658,12 +665,12 @@ static void *multifd_send_thread(void *opaque)
             multifd_send_fill_packet(p);
             p->flags = 0;
             p->num_packets++;
-            p->num_pages += used;
+            p->total_normal_pages += p->normal_num;
             p->pages->num = 0;
             p->pages->block = NULL;
             qemu_mutex_unlock(&p->mutex);
 
-            trace_multifd_send(p->id, packet_num, used, flags,
+            trace_multifd_send(p->id, packet_num, p->normal_num, flags,
                                p->next_packet_size);
 
             p->iov[0].iov_len = p->packet_len;
@@ -713,7 +720,7 @@ out:
     qemu_mutex_unlock(&p->mutex);
 
     rcu_unregister_thread();
-    trace_multifd_send_thread_end(p->id, p->num_packets, p->num_pages);
+    trace_multifd_send_thread_end(p->id, p->num_packets, p->total_normal_pages);
 
     return NULL;
 }
@@ -913,6 +920,7 @@ int multifd_save_setup(Error **errp)
         p->tls_hostname = g_strdup(s->hostname);
         /* We need one extra place for the packet header */
         p->iov = g_new0(struct iovec, page_count + 1);
+        p->normal = g_new0(ram_addr_t, page_count);
         socket_send_channel_create(multifd_new_send_channel_async, p);
     }
 
diff --git a/migration/trace-events b/migration/trace-events
index 5172cb3b3d..171a83a55d 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -124,13 +124,13 @@ multifd_recv_sync_main_wait(uint8_t id) "channel %u"
 multifd_recv_terminate_threads(bool error) "error %d"
 multifd_recv_thread_end(uint8_t id, uint64_t packets, uint64_t pages) "channel %u packets %" PRIu64 " pages %" PRIu64
 multifd_recv_thread_start(uint8_t id) "%u"
-multifd_send(uint8_t id, uint64_t packet_num, uint32_t used, uint32_t flags, uint32_t next_packet_size) "channel %u packet_num %" PRIu64 " pages %u flags 0x%x next packet size %u"
+multifd_send(uint8_t id, uint64_t packet_num, uint32_t normal, uint32_t flags, uint32_t next_packet_size) "channel %u packet_num %" PRIu64 " normal pages %u flags 0x%x next packet size %u"
 multifd_send_error(uint8_t id) "channel %u"
 multifd_send_sync_main(long packet_num) "packet num %ld"
 multifd_send_sync_main_signal(uint8_t id) "channel %u"
 multifd_send_sync_main_wait(uint8_t id) "channel %u"
 multifd_send_terminate_threads(bool error) "error %d"
-multifd_send_thread_end(uint8_t id, uint64_t packets, uint64_t pages) "channel %u packets %" PRIu64 " pages %"  PRIu64
+multifd_send_thread_end(uint8_t id, uint64_t packets, uint64_t normal_pages) "channel %u packets %" PRIu64 " normal pages %"  PRIu64
 multifd_send_thread_start(uint8_t id) "%u"
 multifd_tls_outgoing_handshake_start(void *ioc, void *tioc, const char *hostname) "ioc=%p tioc=%p hostname=%s"
 multifd_tls_outgoing_handshake_error(void *ioc, const char *err) "ioc=%p err=%s"
-- 
2.34.1


