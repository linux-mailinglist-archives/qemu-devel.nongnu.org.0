Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892CE30F158
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 11:59:53 +0100 (CET)
Received: from localhost ([::1]:43534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7cMa-0006x6-K8
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 05:59:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l7cHh-0007zS-3I
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:54:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l7cHf-0008FH-Bq
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:54:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612436086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dIyy5vmNRolTVyHmnt4JivqphRRjGpYRnUmqFs8/g84=;
 b=MGjm3o7nObF1q4fehvclGPxC1CVqPomkUyTUQab/n6zXgLFWOgfsC+nNCYnDNM4RaaPYA+
 5mzj+roVxe1ke3Yd5sKJP8R9fAhEQunTHe8eZtFtoa4vbrrZefEKg0E1owzv94TTop+Bwb
 wIDTPDbqYghM3CFMhj3nrRg5u3Nb2xo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-UU89KUyqNfaMxVVvuT1QMA-1; Thu, 04 Feb 2021 05:54:45 -0500
X-MC-Unique: UU89KUyqNfaMxVVvuT1QMA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9569B195D566
 for <qemu-devel@nongnu.org>; Thu,  4 Feb 2021 10:54:44 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 562345FC3A;
 Thu,  4 Feb 2021 10:54:36 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/20] vhost-user-gpu: add a configuration flag for dmabuf
 usage
Date: Thu,  4 Feb 2021 14:52:22 +0400
Message-Id: <20210204105232.834642-11-marcandre.lureau@redhat.com>
In-Reply-To: <20210204105232.834642-1-marcandre.lureau@redhat.com>
References: <20210204105232.834642-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
 kraxel@redhat.com
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


