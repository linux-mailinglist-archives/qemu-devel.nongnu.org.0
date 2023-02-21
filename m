Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7CC69E96A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 22:24:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUa70-0007JN-Vr; Tue, 21 Feb 2023 16:23:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pUa6w-0007IV-5b
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 16:23:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pUa6u-0001WG-7m
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 16:23:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677014619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ued9A3Zpvty2xRj8YmIG3CjQ2+7RNd+6SofyrHksWwc=;
 b=EZA1/VpU7UsVxvkq2+5OfjpTXiqeIpZ7TfmuyV9nHRIOKge7xBDfk0UFUAdfDs5R9CfUi3
 qDgKWsrduIunYQanzgS2T4R1IL0lILiR/TolUK6W9TZkxoS3I8fKNO1BIIHrLiGu167OEy
 QWelEvoLqYXHnm2kMPOccAOzh+UGRSU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-c3TrWoaJPfmCnznb3ajZTA-1; Tue, 21 Feb 2023 16:22:30 -0500
X-MC-Unique: c3TrWoaJPfmCnznb3ajZTA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3F6B380670C;
 Tue, 21 Feb 2023 21:22:29 +0000 (UTC)
Received: from localhost (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36BDD492B04;
 Tue, 21 Feb 2023 21:22:28 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Fam Zheng <fam@euphon.net>,
 <qemu-block@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Qing Wang <qinwang@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v3 3/3] virtio-scsi: reset SCSI devices from main loop thread
Date: Tue, 21 Feb 2023 16:22:18 -0500
Message-Id: <20230221212218.1378734-4-stefanha@redhat.com>
In-Reply-To: <20230221212218.1378734-1-stefanha@redhat.com>
References: <20230221212218.1378734-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

When an IOThread is configured, the ctrl virtqueue is processed in the
IOThread. TMFs that reset SCSI devices are currently called directly
from the IOThread and trigger an assertion failure in blk_drain() from
the following call stack:

virtio_scsi_handle_ctrl_req -> virtio_scsi_do_tmf -> device_code_reset
-> scsi_disk_reset -> scsi_device_purge_requests -> blk_drain

  ../block/block-backend.c:1780: void blk_drain(BlockBackend *): Assertion `qemu_in_main_thread()' failed.

The blk_drain() function is not designed to be called from an IOThread
because it needs the Big QEMU Lock (BQL).

This patch defers TMFs that reset SCSI devices to a Bottom Half (BH)
that runs in the main loop thread under the BQL. This way it's safe to
call blk_drain() and the assertion failure is avoided.

Introduce s->tmf_bh_list for tracking TMF requests that have been
deferred to the BH. When the BH runs it will grab the entire list and
process all requests. Care must be taken to clear the list when the
virtio-scsi device is reset or unrealized. Otherwise deferred TMF
requests could execute later and lead to use-after-free or other
undefined behavior.

The s->resetting counter that's used by TMFs that reset SCSI devices is
accessed from multiple threads. This patch makes that explicit by using
atomic accessor functions. With this patch applied the counter is only
modified by the main loop thread under the BQL but can be read by any
thread.

Reported-by: Qing Wang <qinwang@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/virtio/virtio-scsi.h |  11 ++-
 hw/scsi/virtio-scsi.c           | 169 +++++++++++++++++++++++++-------
 2 files changed, 143 insertions(+), 37 deletions(-)

diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
index 37b75e15e3..779568ab5d 100644
--- a/include/hw/virtio/virtio-scsi.h
+++ b/include/hw/virtio/virtio-scsi.h
@@ -74,13 +74,22 @@ struct VirtIOSCSICommon {
     VirtQueue **cmd_vqs;
 };
 
+struct VirtIOSCSIReq;
+
 struct VirtIOSCSI {
     VirtIOSCSICommon parent_obj;
 
     SCSIBus bus;
-    int resetting;
+    int resetting; /* written from main loop thread, read from any thread */
     bool events_dropped;
 
+    /*
+     * TMFs deferred to main loop BH. These fields are protected by
+     * virtio_scsi_acquire().
+     */
+    QEMUBH *tmf_bh;
+    QTAILQ_HEAD(, VirtIOSCSIReq) tmf_bh_list;
+
     /* Fields for dataplane below */
     AioContext *ctx; /* one iothread per virtio-scsi-pci for now */
 
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 2b649ca976..612c525d9d 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -43,13 +43,11 @@ typedef struct VirtIOSCSIReq {
     QEMUSGList qsgl;
     QEMUIOVector resp_iov;
 
-    union {
-        /* Used for two-stage request submission */
-        QTAILQ_ENTRY(VirtIOSCSIReq) next;
+    /* Used for two-stage request submission and TMFs deferred to BH */
+    QTAILQ_ENTRY(VirtIOSCSIReq) next;
 
-        /* Used for cancellation of request during TMFs */
-        int remaining;
-    };
+    /* Used for cancellation of request during TMFs */
+    int remaining;
 
     SCSIRequest *sreq;
     size_t resp_size;
@@ -294,6 +292,122 @@ static inline void virtio_scsi_ctx_check(VirtIOSCSI *s, SCSIDevice *d)
     }
 }
 
+static void virtio_scsi_do_one_tmf_bh(VirtIOSCSIReq *req)
+{
+    VirtIOSCSI *s = req->dev;
+    SCSIDevice *d = virtio_scsi_device_get(s, req->req.tmf.lun);
+    BusChild *kid;
+    int target;
+
+    switch (req->req.tmf.subtype) {
+    case VIRTIO_SCSI_T_TMF_LOGICAL_UNIT_RESET:
+        if (!d) {
+            req->resp.tmf.response = VIRTIO_SCSI_S_BAD_TARGET;
+            goto out;
+        }
+        if (d->lun != virtio_scsi_get_lun(req->req.tmf.lun)) {
+            req->resp.tmf.response = VIRTIO_SCSI_S_INCORRECT_LUN;
+            goto out;
+        }
+        qatomic_inc(&s->resetting);
+        device_cold_reset(&d->qdev);
+        qatomic_dec(&s->resetting);
+        break;
+
+    case VIRTIO_SCSI_T_TMF_I_T_NEXUS_RESET:
+        target = req->req.tmf.lun[1];
+        qatomic_inc(&s->resetting);
+
+        rcu_read_lock();
+        QTAILQ_FOREACH_RCU(kid, &s->bus.qbus.children, sibling) {
+            SCSIDevice *d1 = SCSI_DEVICE(kid->child);
+            if (d1->channel == 0 && d1->id == target) {
+                device_cold_reset(&d1->qdev);
+            }
+        }
+        rcu_read_unlock();
+
+        qatomic_dec(&s->resetting);
+        break;
+
+    default:
+        g_assert_not_reached();
+        break;
+    }
+
+out:
+    object_unref(OBJECT(d));
+
+    virtio_scsi_acquire(s);
+    virtio_scsi_complete_req(req);
+    virtio_scsi_release(s);
+}
+
+/* Some TMFs must be processed from the main loop thread */
+static void virtio_scsi_do_tmf_bh(void *opaque)
+{
+    VirtIOSCSI *s = opaque;
+    QTAILQ_HEAD(, VirtIOSCSIReq) reqs = QTAILQ_HEAD_INITIALIZER(reqs);
+    VirtIOSCSIReq *req;
+    VirtIOSCSIReq *tmp;
+
+    GLOBAL_STATE_CODE();
+
+    virtio_scsi_acquire(s);
+
+    QTAILQ_FOREACH_SAFE(req, &s->tmf_bh_list, next, tmp) {
+        QTAILQ_REMOVE(&s->tmf_bh_list, req, next);
+        QTAILQ_INSERT_TAIL(&reqs, req, next);
+    }
+
+    qemu_bh_delete(s->tmf_bh);
+    s->tmf_bh = NULL;
+
+    virtio_scsi_release(s);
+
+    QTAILQ_FOREACH_SAFE(req, &reqs, next, tmp) {
+        QTAILQ_REMOVE(&reqs, req, next);
+        virtio_scsi_do_one_tmf_bh(req);
+    }
+}
+
+static void virtio_scsi_reset_tmf_bh(VirtIOSCSI *s)
+{
+    VirtIOSCSIReq *req;
+    VirtIOSCSIReq *tmp;
+
+    GLOBAL_STATE_CODE();
+
+    virtio_scsi_acquire(s);
+
+    if (s->tmf_bh) {
+        qemu_bh_delete(s->tmf_bh);
+        s->tmf_bh = NULL;
+    }
+
+    QTAILQ_FOREACH_SAFE(req, &s->tmf_bh_list, next, tmp) {
+        QTAILQ_REMOVE(&s->tmf_bh_list, req, next);
+
+        /* SAM-6 6.3.2 Hard reset */
+        req->resp.tmf.response = VIRTIO_SCSI_S_TARGET_FAILURE;
+        virtio_scsi_complete_req(req);
+    }
+
+    virtio_scsi_release(s);
+}
+
+static void virtio_scsi_defer_tmf_to_bh(VirtIOSCSIReq *req)
+{
+    VirtIOSCSI *s = req->dev;
+
+    QTAILQ_INSERT_TAIL(&s->tmf_bh_list, req, next);
+
+    if (!s->tmf_bh) {
+        s->tmf_bh = qemu_bh_new(virtio_scsi_do_tmf_bh, s);
+        qemu_bh_schedule(s->tmf_bh);
+    }
+}
+
 /* Return 0 if the request is ready to be completed and return to guest;
  * -EINPROGRESS if the request is submitted and will be completed later, in the
  *  case of async cancellation. */
@@ -301,8 +415,6 @@ static int virtio_scsi_do_tmf(VirtIOSCSI *s, VirtIOSCSIReq *req)
 {
     SCSIDevice *d = virtio_scsi_device_get(s, req->req.tmf.lun);
     SCSIRequest *r, *next;
-    BusChild *kid;
-    int target;
     int ret = 0;
 
     virtio_scsi_ctx_check(s, d);
@@ -359,15 +471,9 @@ static int virtio_scsi_do_tmf(VirtIOSCSI *s, VirtIOSCSIReq *req)
         break;
 
     case VIRTIO_SCSI_T_TMF_LOGICAL_UNIT_RESET:
-        if (!d) {
-            goto fail;
-        }
-        if (d->lun != virtio_scsi_get_lun(req->req.tmf.lun)) {
-            goto incorrect_lun;
-        }
-        s->resetting++;
-        device_cold_reset(&d->qdev);
-        s->resetting--;
+    case VIRTIO_SCSI_T_TMF_I_T_NEXUS_RESET:
+        virtio_scsi_defer_tmf_to_bh(req);
+        ret = -EINPROGRESS;
         break;
 
     case VIRTIO_SCSI_T_TMF_ABORT_TASK_SET:
@@ -410,22 +516,6 @@ static int virtio_scsi_do_tmf(VirtIOSCSI *s, VirtIOSCSIReq *req)
         }
         break;
 
-    case VIRTIO_SCSI_T_TMF_I_T_NEXUS_RESET:
-        target = req->req.tmf.lun[1];
-        s->resetting++;
-
-        rcu_read_lock();
-        QTAILQ_FOREACH_RCU(kid, &s->bus.qbus.children, sibling) {
-            SCSIDevice *d1 = SCSI_DEVICE(kid->child);
-            if (d1->channel == 0 && d1->id == target) {
-                device_cold_reset(&d1->qdev);
-            }
-        }
-        rcu_read_unlock();
-
-        s->resetting--;
-        break;
-
     case VIRTIO_SCSI_T_TMF_CLEAR_ACA:
     default:
         req->resp.tmf.response = VIRTIO_SCSI_S_FUNCTION_REJECTED;
@@ -655,7 +745,7 @@ static void virtio_scsi_request_cancelled(SCSIRequest *r)
     if (!req) {
         return;
     }
-    if (req->dev->resetting) {
+    if (qatomic_read(&req->dev->resetting)) {
         req->resp.cmd.response = VIRTIO_SCSI_S_RESET;
     } else {
         req->resp.cmd.response = VIRTIO_SCSI_S_ABORTED;
@@ -831,9 +921,12 @@ static void virtio_scsi_reset(VirtIODevice *vdev)
     VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(vdev);
 
     assert(!s->dataplane_started);
-    s->resetting++;
+
+    virtio_scsi_reset_tmf_bh(s);
+
+    qatomic_inc(&s->resetting);
     bus_cold_reset(BUS(&s->bus));
-    s->resetting--;
+    qatomic_dec(&s->resetting);
 
     vs->sense_size = VIRTIO_SCSI_SENSE_DEFAULT_SIZE;
     vs->cdb_size = VIRTIO_SCSI_CDB_DEFAULT_SIZE;
@@ -1053,6 +1146,8 @@ static void virtio_scsi_device_realize(DeviceState *dev, Error **errp)
     VirtIOSCSI *s = VIRTIO_SCSI(dev);
     Error *err = NULL;
 
+    QTAILQ_INIT(&s->tmf_bh_list);
+
     virtio_scsi_common_realize(dev,
                                virtio_scsi_handle_ctrl,
                                virtio_scsi_handle_event,
@@ -1090,6 +1185,8 @@ static void virtio_scsi_device_unrealize(DeviceState *dev)
 {
     VirtIOSCSI *s = VIRTIO_SCSI(dev);
 
+    virtio_scsi_reset_tmf_bh(s);
+
     qbus_set_hotplug_handler(BUS(&s->bus), NULL);
     virtio_scsi_common_unrealize(dev);
 }
-- 
2.39.1


