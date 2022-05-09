Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 920AA51FDB4
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:13:48 +0200 (CEST)
Received: from localhost ([::1]:46848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3Ct-0005Vf-La
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1no2tV-0006Yq-SS
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:53:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1no2tS-0002tL-Nc
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:53:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652100820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S0Bt7UWE+CKYFGau+ZVL9OtrPmqduOEiEILSb/Y4I8M=;
 b=YmaX2+9RFE4Ha7EecnuOt1LA7iZHjOmKs53VQN3pxU+GQrgPqT+I9VTlDzN5Y/BknROJyb
 xeP3zLVyQKGYDo8VHLGNYHE/UnmWQzxZimw2F3whP34xbX6p5KFVS1ZDpAjar5FOMG0DJc
 F4IKK48YERJ056xVRZ5PHwqQ3rEDSGM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-sCDB04v9PGOZtHz4sVaxgQ-1; Mon, 09 May 2022 08:53:37 -0400
X-MC-Unique: sCDB04v9PGOZtHz4sVaxgQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E80EC100BAAB;
 Mon,  9 May 2022 12:53:36 +0000 (UTC)
Received: from localhost (unknown [10.39.195.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FA9043EA07;
 Mon,  9 May 2022 12:53:36 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: <qemu-block@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 4/9] virtio-scsi: fix ctrl and event handler functions in
 dataplane mode
Date: Mon,  9 May 2022 13:53:10 +0100
Message-Id: <20220509125315.3746865-5-stefanha@redhat.com>
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

Commit f34e8d8b8d48d73f36a67b6d5e492ef9784b5012 ("virtio-scsi: prepare
virtio_scsi_handle_cmd for dataplane") prepared the virtio-scsi cmd
virtqueue handler function to be used in both the dataplane and
non-datpalane code paths.

It failed to convert the ctrl and event virtqueue handler functions,
which are not designed to be called from the dataplane code path but
will be since the ioeventfd is set up for those virtqueues when
dataplane starts.

Convert the ctrl and event virtqueue handler functions now so they
operate correctly when called from the dataplane code path. Avoid code
duplication by extracting this code into a helper function.

Fixes: f34e8d8b8d48d73f36a67b6d5e492ef9784b5012 ("virtio-scsi: prepare virtio_scsi_handle_cmd for dataplane")
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-id: 20220427143541.119567-2-stefanha@redhat.com
[Fixed s/by used/be used/ typo pointed out by Michael Tokarev
<mjt@tls.msk.ru>.
--Stefan]
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/scsi/virtio-scsi.c | 42 +++++++++++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 34a968ecfb..417fbc71d6 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -472,16 +472,32 @@ bool virtio_scsi_handle_ctrl_vq(VirtIOSCSI *s, VirtQueue *vq)
     return progress;
 }
 
+/*
+ * If dataplane is configured but not yet started, do so now and return true on
+ * success.
+ *
+ * Dataplane is started by the core virtio code but virtqueue handler functions
+ * can also be invoked when a guest kicks before DRIVER_OK, so this helper
+ * function helps us deal with manually starting ioeventfd in that case.
+ */
+static bool virtio_scsi_defer_to_dataplane(VirtIOSCSI *s)
+{
+    if (!s->ctx || s->dataplane_started) {
+        return false;
+    }
+
+    virtio_device_start_ioeventfd(&s->parent_obj.parent_obj);
+    return !s->dataplane_fenced;
+}
+
 static void virtio_scsi_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIOSCSI *s = (VirtIOSCSI *)vdev;
 
-    if (s->ctx) {
-        virtio_device_start_ioeventfd(vdev);
-        if (!s->dataplane_fenced) {
-            return;
-        }
+    if (virtio_scsi_defer_to_dataplane(s)) {
+        return;
     }
+
     virtio_scsi_acquire(s);
     virtio_scsi_handle_ctrl_vq(s, vq);
     virtio_scsi_release(s);
@@ -720,12 +736,10 @@ static void virtio_scsi_handle_cmd(VirtIODevice *vdev, VirtQueue *vq)
     /* use non-QOM casts in the data path */
     VirtIOSCSI *s = (VirtIOSCSI *)vdev;
 
-    if (s->ctx && !s->dataplane_started) {
-        virtio_device_start_ioeventfd(vdev);
-        if (!s->dataplane_fenced) {
-            return;
-        }
+    if (virtio_scsi_defer_to_dataplane(s)) {
+        return;
     }
+
     virtio_scsi_acquire(s);
     virtio_scsi_handle_cmd_vq(s, vq);
     virtio_scsi_release(s);
@@ -855,12 +869,10 @@ static void virtio_scsi_handle_event(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIOSCSI *s = VIRTIO_SCSI(vdev);
 
-    if (s->ctx) {
-        virtio_device_start_ioeventfd(vdev);
-        if (!s->dataplane_fenced) {
-            return;
-        }
+    if (virtio_scsi_defer_to_dataplane(s)) {
+        return;
     }
+
     virtio_scsi_acquire(s);
     virtio_scsi_handle_event_vq(s, vq);
     virtio_scsi_release(s);
-- 
2.35.1


