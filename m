Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB57378CDC
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 15:36:57 +0200 (CEST)
Received: from localhost ([::1]:36396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg65g-0006Nl-RP
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 09:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5rh-0005rV-71
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:22:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5rf-0003Bf-9O
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:22:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620652946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ns9mxmqijM7usqvhNVXO9sdWLwvUo0QkZ2iEce3mioc=;
 b=iRWo1hsadoqP1zf/udl9glGXkIQtlRjk0eDFwJwdLthHrT6fFl+tu1Alyk2NtuiGBYIal+
 lmduh7/tOz7NmnPRD7dYy1HsrPGoaFlzG/P9AJx/X17sr2QaybJ/ZHZaNi6RAGGpZIK+BC
 BqnMZqpHnqGrlC4Nk4LfwFPlB9KzkOU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-OXQPDZpUNFyk48ILAAqITA-1; Mon, 10 May 2021 09:22:25 -0400
X-MC-Unique: OXQPDZpUNFyk48ILAAqITA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 272AE801817
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 13:22:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F25AC60FC2;
 Mon, 10 May 2021 13:22:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 07146180087C; Mon, 10 May 2021 15:20:52 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/25] virtio-gpu: move virgl process_cmd
Date: Mon, 10 May 2021 15:20:43 +0200
Message-Id: <20210510132051.2208563-18-kraxel@redhat.com>
In-Reply-To: <20210510132051.2208563-1-kraxel@redhat.com>
References: <20210510132051.2208563-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20210430113547.1816178-1-kraxel@redhat.com
Message-Id: <20210430113547.1816178-9-kraxel@redhat.com>
---
 include/hw/virtio/virtio-gpu.h |  2 ++
 hw/display/virtio-gpu-gl.c     | 11 +++++++++++
 hw/display/virtio-gpu.c        |  9 +++++----
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 7ac9229c639c..c7bc925998d5 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -170,6 +170,7 @@ struct VirtIOGPUClass {
     VirtIOGPUBaseClass parent;
 
     void (*handle_ctrl)(VirtIODevice *vdev, VirtQueue *vq);
+    void (*process_cmd)(VirtIOGPU *g, struct virtio_gpu_ctrl_command *cmd);
 };
 
 struct VirtIOGPUGL {
@@ -229,6 +230,7 @@ void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
 void virtio_gpu_process_cmdq(VirtIOGPU *g);
 void virtio_gpu_device_realize(DeviceState *qdev, Error **errp);
 void virtio_gpu_reset(VirtIODevice *vdev);
+void virtio_gpu_simple_process_cmd(VirtIOGPU *g, struct virtio_gpu_ctrl_command *cmd);
 
 /* virtio-gpu-3d.c */
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index e976fb8d04c4..792cc0b41256 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -23,6 +23,16 @@
 #include "hw/virtio/virtio-gpu-pixman.h"
 #include "hw/qdev-properties.h"
 
+static void virtio_gpu_gl_process_cmd(VirtIOGPU *g,
+                                      struct virtio_gpu_ctrl_command *cmd)
+{
+    if (g->parent_obj.use_virgl_renderer) {
+        virtio_gpu_virgl_process_cmd(g, cmd);
+        return;
+    }
+    virtio_gpu_simple_process_cmd(g, cmd);
+}
+
 static void virtio_gpu_gl_flushed(VirtIOGPUBase *b)
 {
     VirtIOGPU *g = VIRTIO_GPU(b);
@@ -116,6 +126,7 @@ static void virtio_gpu_gl_class_init(ObjectClass *klass, void *data)
 
     vbc->gl_flushed = virtio_gpu_gl_flushed;
     vgc->handle_ctrl = virtio_gpu_gl_handle_ctrl;
+    vgc->process_cmd = virtio_gpu_gl_process_cmd;
 
     vdc->realize = virtio_gpu_gl_device_realize;
     vdc->reset = virtio_gpu_gl_reset;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 9be486bb8121..7c65c3ffe8f2 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -763,8 +763,8 @@ virtio_gpu_resource_detach_backing(VirtIOGPU *g,
     virtio_gpu_cleanup_mapping(g, res);
 }
 
-static void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
-                                          struct virtio_gpu_ctrl_command *cmd)
+void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
+                                   struct virtio_gpu_ctrl_command *cmd)
 {
     VIRTIO_GPU_FILL_CMD(cmd->cmd_hdr);
     virtio_gpu_ctrl_hdr_bswap(&cmd->cmd_hdr);
@@ -822,6 +822,7 @@ static void virtio_gpu_handle_cursor_cb(VirtIODevice *vdev, VirtQueue *vq)
 void virtio_gpu_process_cmdq(VirtIOGPU *g)
 {
     struct virtio_gpu_ctrl_command *cmd;
+    VirtIOGPUClass *vgc = VIRTIO_GPU_GET_CLASS(g);
 
     if (g->processing_cmdq) {
         return;
@@ -835,8 +836,7 @@ void virtio_gpu_process_cmdq(VirtIOGPU *g)
         }
 
         /* process command */
-        VIRGL(g, virtio_gpu_virgl_process_cmd, virtio_gpu_simple_process_cmd,
-              g, cmd);
+        vgc->process_cmd(g, cmd);
 
         QTAILQ_REMOVE(&g->cmdq, cmd, next);
         if (virtio_gpu_stats_enabled(g->parent_obj.conf)) {
@@ -1205,6 +1205,7 @@ static void virtio_gpu_class_init(ObjectClass *klass, void *data)
     VirtIOGPUClass *vgc = VIRTIO_GPU_CLASS(klass);
 
     vgc->handle_ctrl = virtio_gpu_handle_ctrl;
+    vgc->process_cmd = virtio_gpu_simple_process_cmd;
 
     vdc->realize = virtio_gpu_device_realize;
     vdc->reset = virtio_gpu_reset;
-- 
2.31.1


