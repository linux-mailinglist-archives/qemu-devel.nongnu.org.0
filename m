Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 263745118D6
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 16:37:55 +0200 (CEST)
Received: from localhost ([::1]:47832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njini-0003wE-0w
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 10:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1njilj-0000P9-P0
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 10:35:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1njilh-0000h7-If
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 10:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651070148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ZP3lPqOofQa8RmvJott9WghY1vGPz5GAxohwXzJYBw=;
 b=bprIP2it/RJi1/0vUc48IaD4t8NQorMyhqKf31/SNzTZFR3O/tKWWf9MsC8qej0TfvuMmN
 7pRnhCQkLhABEqFubxHNdaE2McNYLBuCtM0kpSRMk1kAhGisBbpIEUTtmCR0qLLaCYXRdX
 +kvNFHFvyUEZoNLmY+fcNWu7NY2mSrI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-aKORJdcYM32dpSsQngXQbA-1; Wed, 27 Apr 2022 10:35:45 -0400
X-MC-Unique: aKORJdcYM32dpSsQngXQbA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66F393C23FA3;
 Wed, 27 Apr 2022 14:35:44 +0000 (UTC)
Received: from localhost (unknown [10.39.195.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16949C53360;
 Wed, 27 Apr 2022 14:35:43 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] virtio-scsi: fix ctrl and event handler functions in
 dataplane mode
Date: Wed, 27 Apr 2022 15:35:36 +0100
Message-Id: <20220427143541.119567-2-stefanha@redhat.com>
In-Reply-To: <20220427143541.119567-1-stefanha@redhat.com>
References: <20220427143541.119567-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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
Cc: Nir Soffer <nsoffer@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-stable@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit f34e8d8b8d48d73f36a67b6d5e492ef9784b5012 ("virtio-scsi: prepare
virtio_scsi_handle_cmd for dataplane") prepared the virtio-scsi cmd
virtqueue handler function to by used in both the dataplane and
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


