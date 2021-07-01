Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A1A3B8E1E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 09:20:29 +0200 (CEST)
Received: from localhost ([::1]:34184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyqzr-0003F4-Us
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 03:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lyqyX-0001bH-BI
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 03:19:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lyqyV-00066w-AY
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 03:19:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625123942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=325cEBWoiJvAmk7nwEdNdOrs7M1MxzJNEs4UJax4yGs=;
 b=QNR1w08qqnZJ8njYZWCeGA1hvEQPGegbDK16/zCZrELvy52KW+ACUJpcGd7aBgDlzqtw1t
 GSLMZSBheyQWTHSHcNrIWQN0ca5Z07ZR3l8kJnmhjaxMN8TG0OCV2LzNnzPJgRsc0SUIgY
 VwoySP2shwZ+dFbSfJw6XirAmfUBKsQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-c_t24KfiPdSsDfQaiVtk5Q-1; Thu, 01 Jul 2021 03:19:00 -0400
X-MC-Unique: c_t24KfiPdSsDfQaiVtk5Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 310F483DD15
 for <qemu-devel@nongnu.org>; Thu,  1 Jul 2021 07:19:00 +0000 (UTC)
Received: from localhost (unknown [10.36.110.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B02C0189C4;
 Thu,  1 Jul 2021 07:18:52 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/display: fail early when multiple virgl devices are
 requested
Date: Thu,  1 Jul 2021 11:18:37 +0400
Message-Id: <20210701071837.738897-2-marcandre.lureau@redhat.com>
In-Reply-To: <20210701071837.738897-1-marcandre.lureau@redhat.com>
References: <20210701071837.738897-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This avoids failing to initialize virgl and crashing later on, and clear
the user expectations.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/display/virtio-gpu-gl.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index d971b48080..c973d4824b 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -25,6 +25,8 @@
 
 #include <virglrenderer.h>
 
+static int virgl_count = 0;
+
 static void virtio_gpu_gl_update_cursor_data(VirtIOGPU *g,
                                              struct virtio_gpu_scanout *s,
                                              uint32_t resource_id)
@@ -113,6 +115,11 @@ static void virtio_gpu_gl_device_realize(DeviceState *qdev, Error **errp)
     return;
 #endif
 
+    if (virgl_count++ > 0) {
+        error_setg(errp, "multiple virgl devices aren't supported yet");
+        return;
+    }
+
     if (!display_opengl) {
         error_setg(errp, "opengl is not available");
         return;
@@ -124,6 +131,10 @@ static void virtio_gpu_gl_device_realize(DeviceState *qdev, Error **errp)
 
     virtio_gpu_device_realize(qdev, errp);
 }
+static void virtio_gpu_gl_device_unrealize(DeviceState *dev)
+{
+    virgl_count--;
+}
 
 static Property virtio_gpu_gl_properties[] = {
     DEFINE_PROP_BIT("stats", VirtIOGPU, parent_obj.conf.flags,
@@ -144,6 +155,7 @@ static void virtio_gpu_gl_class_init(ObjectClass *klass, void *data)
     vgc->update_cursor_data = virtio_gpu_gl_update_cursor_data;
 
     vdc->realize = virtio_gpu_gl_device_realize;
+    vdc->unrealize = virtio_gpu_gl_device_unrealize;
     vdc->reset = virtio_gpu_gl_reset;
     device_class_set_props(dc, virtio_gpu_gl_properties);
 }
-- 
2.29.0


