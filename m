Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 921F330C1DA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:35:51 +0100 (CET)
Received: from localhost ([::1]:51812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wmU-0001GB-Jo
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:35:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6wfR-0001FM-Lo
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:28:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6wfN-0003Vl-If
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:28:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612276109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dIyy5vmNRolTVyHmnt4JivqphRRjGpYRnUmqFs8/g84=;
 b=XPu+o+D0mxLvogyC1E5RyKHvwP8Scc0+Oy2/ZtLiIfH6kfs4tGBL8F5exIUSytEq/72CvX
 w7B3HO/40ZC3+U9OTrOS4Lx2pUvQrjhO1RFgrfrJenTqAQ5gMaljzm8F1KeZbDbL7O74l3
 1Mf/HnFIBkNTpESMtblFIxxRN1A+pWs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-1OMC9aR8PSGzd_dbOMpmcA-1; Tue, 02 Feb 2021 09:28:27 -0500
X-MC-Unique: 1OMC9aR8PSGzd_dbOMpmcA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AD5B100A649
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 14:28:26 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA6B410016F4;
 Tue,  2 Feb 2021 14:28:19 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 10/20] vhost-user-gpu: add a configuration flag for dmabuf
 usage
Date: Tue,  2 Feb 2021 18:26:15 +0400
Message-Id: <20210202142625.609070-11-marcandre.lureau@redhat.com>
In-Reply-To: <20210202142625.609070-1-marcandre.lureau@redhat.com>
References: <20210202142625.609070-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Let's inform VirtioGPUBase that vhost-user-gpu require DMABUF messages.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/hw/virtio/virtio-gpu.h | 3 +++
 hw/display/vhost-user-gpu.c    | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 1aed7275c8..4f3dbf79f9 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -71,6 +71,7 @@ enum virtio_gpu_base_conf_flags {
     VIRTIO_GPU_FLAG_VIRGL_ENABLED = 1,
     VIRTIO_GPU_FLAG_STATS_ENABLED,
     VIRTIO_GPU_FLAG_EDID_ENABLED,
+    VIRTIO_GPU_FLAG_DMABUF_ENABLED,
 };
 
 #define virtio_gpu_virgl_enabled(_cfg) \
@@ -79,6 +80,8 @@ enum virtio_gpu_base_conf_flags {
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_STATS_ENABLED))
 #define virtio_gpu_edid_enabled(_cfg) \
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_EDID_ENABLED))
+#define virtio_gpu_dmabuf_enabled(_cfg) \
+    (_cfg.flags & (1 << VIRTIO_GPU_FLAG_DMABUF_ENABLED))
 
 struct virtio_gpu_base_conf {
     uint32_t max_outputs;
diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index dd587436ff..b7bde9feb6 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -547,6 +547,8 @@ vhost_user_gpu_device_realize(DeviceState *qdev, Error **errp)
         return;
     }
 
+    /* existing backend may send DMABUF, so let's add that requirement */
+    g->parent_obj.conf.flags |= 1 << VIRTIO_GPU_FLAG_DMABUF_ENABLED;
     if (virtio_has_feature(g->vhost->dev.features, VIRTIO_GPU_F_VIRGL)) {
         g->parent_obj.conf.flags |= 1 << VIRTIO_GPU_FLAG_VIRGL_ENABLED;
     }
-- 
2.29.0


