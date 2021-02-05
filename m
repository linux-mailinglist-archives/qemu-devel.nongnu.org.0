Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EB8310566
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 08:04:32 +0100 (CET)
Received: from localhost ([::1]:34768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7vAN-0004U2-UA
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 02:04:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v2t-00015J-8K
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:56:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v2q-00016b-6t
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:56:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612508203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UR1TQVoBAFDlwvlO7XqMAlXsC2PTiw3BYA3JWKdqeYQ=;
 b=INNLMutrV4Krutd0yIek4p/N7qa7Y+qE3ypJm3VJ9qYAnNGV96DsR+pLLXsDDOixTVwRct
 qiJ0FXzoFRXd2z1X+EHUThjJk1OM6pdq3u+ySg6ThqX8Ij61g942ZkL4oydAJLxvUHBY8g
 JWrPuWw1mB2Bi704uXmf7DN3X71dsdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-TKpFjpGrO3iJjOMGNLO0Qg-1; Fri, 05 Feb 2021 01:56:41 -0500
X-MC-Unique: TKpFjpGrO3iJjOMGNLO0Qg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBFBF5B38C
 for <qemu-devel@nongnu.org>; Fri,  5 Feb 2021 06:56:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A36F71A38C;
 Fri,  5 Feb 2021 06:56:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2C4DE18003BA; Fri,  5 Feb 2021 07:56:21 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/24] vhost-user-gpu: add a configuration flag for dmabuf usage
Date: Fri,  5 Feb 2021 07:56:10 +0100
Message-Id: <20210205065620.1726554-15-kraxel@redhat.com>
In-Reply-To: <20210205065620.1726554-1-kraxel@redhat.com>
References: <20210205065620.1726554-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Let's inform VirtioGPUBase that vhost-user-gpu require DMABUF messages.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210204105232.834642-11-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/virtio/virtio-gpu.h | 3 +++
 hw/display/vhost-user-gpu.c    | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 1aed7275c824..4f3dbf79f9bc 100644
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
index dd587436ff34..b7bde9feb614 100644
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
2.29.2


