Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B92BD51FDE1
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:17:19 +0200 (CEST)
Received: from localhost ([::1]:55548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3GI-0003Ai-Rq
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1no2ta-0006fU-17
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:53:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1no2tY-0002vj-6S
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:53:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652100827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ernlZqK4rx/jKyHCSCB8PzjGsU1N9ct62d1XbrP+O+0=;
 b=A2AlJV4zIzNsUiM/mBRDOP5scwJNTowXx/HUriYI/vFgrswowsl7sqW6Ynovrfw2XmSlL5
 PKto467iZgySn0VwQR4sHn9jUG3lbeaUfbyKHlqx/2dIAXv3XWL/3PyBDzusQSFWD/WXbF
 Le2RCWnbBWv8i5B3akbEITeIAQa1Xrk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-K4bIrwfFOpSIMEQIy1PawA-1; Mon, 09 May 2022 08:53:44 -0400
X-MC-Unique: K4bIrwfFOpSIMEQIy1PawA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DD571C0F68C;
 Mon,  9 May 2022 12:53:44 +0000 (UTC)
Received: from localhost (unknown [10.39.195.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C1C0D43EA03;
 Mon,  9 May 2022 12:53:43 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: <qemu-block@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 9/9] virtio-scsi: move request-related items from .h to .c
Date: Mon,  9 May 2022 13:53:15 +0100
Message-Id: <20220509125315.3746865-10-stefanha@redhat.com>
In-Reply-To: <20220509125315.3746865-1-stefanha@redhat.com>
References: <20220509125315.3746865-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no longer a need to expose the request and related APIs in
virtio-scsi.h since there are no callers outside virtio-scsi.c.

Note the block comment in VirtIOSCSIReq has been adjusted to meet the
coding style.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-id: 20220427143541.119567-7-stefanha@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/virtio/virtio-scsi.h | 40 -----------------------------
 hw/scsi/virtio-scsi.c           | 45 ++++++++++++++++++++++++++++++---
 2 files changed, 41 insertions(+), 44 deletions(-)

diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
index 2040352102..a36aad9c86 100644
--- a/include/hw/virtio/virtio-scsi.h
+++ b/include/hw/virtio/virtio-scsi.h
@@ -92,42 +92,6 @@ struct VirtIOSCSI {
     uint32_t host_features;
 };
 
-typedef struct VirtIOSCSIReq {
-    /* Note:
-     * - fields up to resp_iov are initialized by virtio_scsi_init_req;
-     * - fields starting at vring are zeroed by virtio_scsi_init_req.
-     * */
-    VirtQueueElement elem;
-
-    VirtIOSCSI *dev;
-    VirtQueue *vq;
-    QEMUSGList qsgl;
-    QEMUIOVector resp_iov;
-
-    union {
-        /* Used for two-stage request submission */
-        QTAILQ_ENTRY(VirtIOSCSIReq) next;
-
-        /* Used for cancellation of request during TMFs */
-        int remaining;
-    };
-
-    SCSIRequest *sreq;
-    size_t resp_size;
-    enum SCSIXferMode mode;
-    union {
-        VirtIOSCSICmdResp     cmd;
-        VirtIOSCSICtrlTMFResp tmf;
-        VirtIOSCSICtrlANResp  an;
-        VirtIOSCSIEvent       event;
-    } resp;
-    union {
-        VirtIOSCSICmdReq      cmd;
-        VirtIOSCSICtrlTMFReq  tmf;
-        VirtIOSCSICtrlANReq   an;
-    } req;
-} VirtIOSCSIReq;
-
 static inline void virtio_scsi_acquire(VirtIOSCSI *s)
 {
     if (s->ctx) {
@@ -149,10 +113,6 @@ void virtio_scsi_common_realize(DeviceState *dev,
                                 Error **errp);
 
 void virtio_scsi_common_unrealize(DeviceState *dev);
-void virtio_scsi_init_req(VirtIOSCSI *s, VirtQueue *vq, VirtIOSCSIReq *req);
-void virtio_scsi_free_req(VirtIOSCSIReq *req);
-void virtio_scsi_push_event(VirtIOSCSI *s, SCSIDevice *dev,
-                            uint32_t event, uint32_t reason);
 
 void virtio_scsi_dataplane_setup(VirtIOSCSI *s, Error **errp);
 int virtio_scsi_dataplane_start(VirtIODevice *s);
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 12c6a21202..db54d104be 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -29,6 +29,43 @@
 #include "hw/virtio/virtio-access.h"
 #include "trace.h"
 
+typedef struct VirtIOSCSIReq {
+    /*
+     * Note:
+     * - fields up to resp_iov are initialized by virtio_scsi_init_req;
+     * - fields starting at vring are zeroed by virtio_scsi_init_req.
+     */
+    VirtQueueElement elem;
+
+    VirtIOSCSI *dev;
+    VirtQueue *vq;
+    QEMUSGList qsgl;
+    QEMUIOVector resp_iov;
+
+    union {
+        /* Used for two-stage request submission */
+        QTAILQ_ENTRY(VirtIOSCSIReq) next;
+
+        /* Used for cancellation of request during TMFs */
+        int remaining;
+    };
+
+    SCSIRequest *sreq;
+    size_t resp_size;
+    enum SCSIXferMode mode;
+    union {
+        VirtIOSCSICmdResp     cmd;
+        VirtIOSCSICtrlTMFResp tmf;
+        VirtIOSCSICtrlANResp  an;
+        VirtIOSCSIEvent       event;
+    } resp;
+    union {
+        VirtIOSCSICmdReq      cmd;
+        VirtIOSCSICtrlTMFReq  tmf;
+        VirtIOSCSICtrlANReq   an;
+    } req;
+} VirtIOSCSIReq;
+
 static inline int virtio_scsi_get_lun(uint8_t *lun)
 {
     return ((lun[2] << 8) | lun[3]) & 0x3FFF;
@@ -45,7 +82,7 @@ static inline SCSIDevice *virtio_scsi_device_get(VirtIOSCSI *s, uint8_t *lun)
     return scsi_device_get(&s->bus, 0, lun[1], virtio_scsi_get_lun(lun));
 }
 
-void virtio_scsi_init_req(VirtIOSCSI *s, VirtQueue *vq, VirtIOSCSIReq *req)
+static void virtio_scsi_init_req(VirtIOSCSI *s, VirtQueue *vq, VirtIOSCSIReq *req)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(s);
     const size_t zero_skip =
@@ -58,7 +95,7 @@ void virtio_scsi_init_req(VirtIOSCSI *s, VirtQueue *vq, VirtIOSCSIReq *req)
     memset((uint8_t *)req + zero_skip, 0, sizeof(*req) - zero_skip);
 }
 
-void virtio_scsi_free_req(VirtIOSCSIReq *req)
+static void virtio_scsi_free_req(VirtIOSCSIReq *req)
 {
     qemu_iovec_destroy(&req->resp_iov);
     qemu_sglist_destroy(&req->qsgl);
@@ -801,8 +838,8 @@ static void virtio_scsi_reset(VirtIODevice *vdev)
     s->events_dropped = false;
 }
 
-void virtio_scsi_push_event(VirtIOSCSI *s, SCSIDevice *dev,
-                            uint32_t event, uint32_t reason)
+static void virtio_scsi_push_event(VirtIOSCSI *s, SCSIDevice *dev,
+                                   uint32_t event, uint32_t reason)
 {
     VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(s);
     VirtIOSCSIReq *req;
-- 
2.35.1


