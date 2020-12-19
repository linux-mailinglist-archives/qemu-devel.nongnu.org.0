Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3302DEE6C
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 12:09:58 +0100 (CET)
Received: from localhost ([::1]:56154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqa7Z-00078U-KV
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 06:09:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtu-0004xl-Lf
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtl-0007HL-KZ
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608375340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M7Mbkx49VnsZZPTjzSq3CtgEnaNIXUwF1DNyuy1pL44=;
 b=Z/Lz9+cr7zlOyQbV4mP8kDq6XzkAHpMVBto7ue/e0tuL0l24kifmVkD4DyD3cPmf13Kv+1
 AT1WqWbSopsmaiwGFaEKETtaUNHwMFj8yOU/+YGTnQI3H9A3W9jv4Wa0ZwBVn9rTh0oI4z
 0SGpVGpUdW3o/KJMR320EzJ6suA6PIs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-2A5GdPL_MXeKza7WQDWePg-1; Sat, 19 Dec 2020 05:55:38 -0500
X-MC-Unique: 2A5GdPL_MXeKza7WQDWePg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23ABB180A097;
 Sat, 19 Dec 2020 10:55:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C4AAB5D9D7;
 Sat, 19 Dec 2020 10:55:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A5AC011268A2; Sat, 19 Dec 2020 11:55:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/33] hw/rdma: Replace QList by GQueue
Date: Sat, 19 Dec 2020 11:55:19 +0100
Message-Id: <20201219105532.1734134-21-armbru@redhat.com>
In-Reply-To: <20201219105532.1734134-1-armbru@redhat.com>
References: <20201219105532.1734134-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Yuval Shaia <yuval.shaia.ml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RdmaProtectedQList provides a thread-safe queue of int64_t on top of a
QList.

rdma_protected_qlist_destroy() calls qlist_destroy_obj() directly.
qlist_destroy_obj() is actually for use by qobject_destroy() only.
The next commit will make that obvious.

The minimal fix would be calling qobject_unref() instead.  But QList
is actually a bad fit here.  It's designed for representing JSON
arrays.  We're better off with a GQueue here.  Replace.

Cc: Yuval Shaia <yuval.shaia.ml@gmail.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201211171152.146877-8-armbru@redhat.com>
---
 hw/rdma/rdma_backend_defs.h |  2 +-
 hw/rdma/rdma_utils.h        | 15 ++++++++-------
 hw/rdma/rdma_backend.c      | 10 +++++-----
 hw/rdma/rdma_utils.c        | 29 ++++++++++++++++-------------
 4 files changed, 30 insertions(+), 26 deletions(-)

diff --git a/hw/rdma/rdma_backend_defs.h b/hw/rdma/rdma_backend_defs.h
index 0b55be3503..4e6c0ad695 100644
--- a/hw/rdma/rdma_backend_defs.h
+++ b/hw/rdma/rdma_backend_defs.h
@@ -43,7 +43,7 @@ typedef struct RdmaBackendDev {
     struct ibv_context *context;
     struct ibv_comp_channel *channel;
     uint8_t port_num;
-    RdmaProtectedQList recv_mads_list;
+    RdmaProtectedGQueue recv_mads_list;
     RdmaCmMux rdmacm_mux;
 } RdmaBackendDev;
 
diff --git a/hw/rdma/rdma_utils.h b/hw/rdma/rdma_utils.h
index e7babe96cb..9fd0efd940 100644
--- a/hw/rdma/rdma_utils.h
+++ b/hw/rdma/rdma_utils.h
@@ -28,10 +28,10 @@
 #define rdma_info_report(fmt, ...) \
     info_report("%s: " fmt, "rdma", ## __VA_ARGS__)
 
-typedef struct RdmaProtectedQList {
+typedef struct RdmaProtectedGQueue {
     QemuMutex lock;
-    QList *list;
-} RdmaProtectedQList;
+    GQueue *list;
+} RdmaProtectedGQueue;
 
 typedef struct RdmaProtectedGSList {
     QemuMutex lock;
@@ -40,10 +40,11 @@ typedef struct RdmaProtectedGSList {
 
 void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t plen);
 void rdma_pci_dma_unmap(PCIDevice *dev, void *buffer, dma_addr_t len);
-void rdma_protected_qlist_init(RdmaProtectedQList *list);
-void rdma_protected_qlist_destroy(RdmaProtectedQList *list);
-void rdma_protected_qlist_append_int64(RdmaProtectedQList *list, int64_t value);
-int64_t rdma_protected_qlist_pop_int64(RdmaProtectedQList *list);
+void rdma_protected_gqueue_init(RdmaProtectedGQueue *list);
+void rdma_protected_gqueue_destroy(RdmaProtectedGQueue *list);
+void rdma_protected_gqueue_append_int64(RdmaProtectedGQueue *list,
+                                        int64_t value);
+int64_t rdma_protected_gqueue_pop_int64(RdmaProtectedGQueue *list);
 void rdma_protected_gslist_init(RdmaProtectedGSList *list);
 void rdma_protected_gslist_destroy(RdmaProtectedGSList *list);
 void rdma_protected_gslist_append_int32(RdmaProtectedGSList *list,
diff --git a/hw/rdma/rdma_backend.c b/hw/rdma/rdma_backend.c
index 5de010b1fa..6dcdfbbbe2 100644
--- a/hw/rdma/rdma_backend.c
+++ b/hw/rdma/rdma_backend.c
@@ -78,7 +78,7 @@ static void clean_recv_mads(RdmaBackendDev *backend_dev)
     unsigned long cqe_ctx_id;
 
     do {
-        cqe_ctx_id = rdma_protected_qlist_pop_int64(&backend_dev->
+        cqe_ctx_id = rdma_protected_gqueue_pop_int64(&backend_dev->
                                                     recv_mads_list);
         if (cqe_ctx_id != -ENOENT) {
             qatomic_inc(&backend_dev->rdma_dev_res->stats.missing_cqe);
@@ -597,7 +597,7 @@ static unsigned int save_mad_recv_buffer(RdmaBackendDev *backend_dev,
     bctx->up_ctx = ctx;
     bctx->sge = *sge;
 
-    rdma_protected_qlist_append_int64(&backend_dev->recv_mads_list, bctx_id);
+    rdma_protected_gqueue_append_int64(&backend_dev->recv_mads_list, bctx_id);
 
     return 0;
 }
@@ -1111,7 +1111,7 @@ static void process_incoming_mad_req(RdmaBackendDev *backend_dev,
 
     trace_mad_message("recv", msg->umad.mad, msg->umad_len);
 
-    cqe_ctx_id = rdma_protected_qlist_pop_int64(&backend_dev->recv_mads_list);
+    cqe_ctx_id = rdma_protected_gqueue_pop_int64(&backend_dev->recv_mads_list);
     if (cqe_ctx_id == -ENOENT) {
         rdma_warn_report("No more free MADs buffers, waiting for a while");
         sleep(THR_POLL_TO);
@@ -1185,7 +1185,7 @@ static int mad_init(RdmaBackendDev *backend_dev, CharBackend *mad_chr_be)
         return -EIO;
     }
 
-    rdma_protected_qlist_init(&backend_dev->recv_mads_list);
+    rdma_protected_gqueue_init(&backend_dev->recv_mads_list);
 
     enable_rdmacm_mux_async(backend_dev);
 
@@ -1205,7 +1205,7 @@ static void mad_fini(RdmaBackendDev *backend_dev)
 {
     disable_rdmacm_mux_async(backend_dev);
     qemu_chr_fe_disconnect(backend_dev->rdmacm_mux.chr_be);
-    rdma_protected_qlist_destroy(&backend_dev->recv_mads_list);
+    rdma_protected_gqueue_destroy(&backend_dev->recv_mads_list);
 }
 
 int rdma_backend_get_gid_index(RdmaBackendDev *backend_dev,
diff --git a/hw/rdma/rdma_utils.c b/hw/rdma/rdma_utils.c
index 698ed4716c..98df58f689 100644
--- a/hw/rdma/rdma_utils.c
+++ b/hw/rdma/rdma_utils.c
@@ -14,8 +14,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qapi/qmp/qlist.h"
-#include "qapi/qmp/qnum.h"
 #include "trace.h"
 #include "rdma_utils.h"
 
@@ -54,41 +52,46 @@ void rdma_pci_dma_unmap(PCIDevice *dev, void *buffer, dma_addr_t len)
     }
 }
 
-void rdma_protected_qlist_init(RdmaProtectedQList *list)
+void rdma_protected_gqueue_init(RdmaProtectedGQueue *list)
 {
     qemu_mutex_init(&list->lock);
-    list->list = qlist_new();
+    list->list = g_queue_new();
 }
 
-void rdma_protected_qlist_destroy(RdmaProtectedQList *list)
+void rdma_protected_gqueue_destroy(RdmaProtectedGQueue *list)
 {
     if (list->list) {
-        qlist_destroy_obj(QOBJECT(list->list));
+        g_queue_free_full(list->list, g_free);
         qemu_mutex_destroy(&list->lock);
         list->list = NULL;
     }
 }
 
-void rdma_protected_qlist_append_int64(RdmaProtectedQList *list, int64_t value)
+void rdma_protected_gqueue_append_int64(RdmaProtectedGQueue *list,
+                                        int64_t value)
 {
     qemu_mutex_lock(&list->lock);
-    qlist_append_int(list->list, value);
+    g_queue_push_tail(list->list, g_memdup(&value, sizeof(value)));
     qemu_mutex_unlock(&list->lock);
 }
 
-int64_t rdma_protected_qlist_pop_int64(RdmaProtectedQList *list)
+int64_t rdma_protected_gqueue_pop_int64(RdmaProtectedGQueue *list)
 {
-    QObject *obj;
+    int64_t *valp;
+    int64_t val;
 
     qemu_mutex_lock(&list->lock);
-    obj = qlist_pop(list->list);
+
+    valp = g_queue_pop_head(list->list);
     qemu_mutex_unlock(&list->lock);
 
-    if (!obj) {
+    if (!valp) {
         return -ENOENT;
     }
 
-    return qnum_get_uint(qobject_to(QNum, obj));
+    val = *valp;
+    g_free(valp);
+    return val;
 }
 
 void rdma_protected_gslist_init(RdmaProtectedGSList *list)
-- 
2.26.2


