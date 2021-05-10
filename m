Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4F9378CCA
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 15:31:41 +0200 (CEST)
Received: from localhost ([::1]:45242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg60a-0001j1-HK
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 09:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5rj-00060u-JZ
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:22:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5rh-0003Dg-Qt
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:22:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620652949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cpVyE0k4VykU6xfyjy/bxp57jnRdl1YQ/rbFbrl2MuA=;
 b=hNDk2e+waSlC5DNDVnFOYRDhR3LLll/UnXvXCVoAwBlg2e507erK6T6+UYjgxSeTTjgmg2
 xKF3n5jCG/qvQbEpFd+koklHuYKO353EtzFHDu5FsmXL/DR/9sxEIY7KOPoEgeqPEo2Dyh
 TIDaaYmfCmMp18nI1Befug+IBG5FuMU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-VrbQK_TiP3mIrK8P7di-bw-1; Mon, 10 May 2021 09:22:27 -0400
X-MC-Unique: VrbQK_TiP3mIrK8P7di-bw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7942D107ACCD
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 13:22:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B6C92B1A8;
 Mon, 10 May 2021 13:22:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 30655180087F; Mon, 10 May 2021 15:20:52 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/25] virtio-gpu: move virtio-gpu-gl-device to separate module
Date: Mon, 10 May 2021 15:20:46 +0200
Message-Id: <20210510132051.2208563-21-kraxel@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
Message-Id: <20210430113547.1816178-12-kraxel@redhat.com>
---
 util/module.c          | 4 +++-
 hw/display/meson.build | 9 ++++++---
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/util/module.c b/util/module.c
index 47bba1182841..c8f3e5a0a736 100644
--- a/util/module.c
+++ b/util/module.c
@@ -182,6 +182,8 @@ static const struct {
     { "ui-spice-app",   "ui-spice-core" },
     { "ui-spice-app",   "chardev-spice" },
 
+    { "hw-display-virtio-gpu-gl", "hw-display-virtio-gpu" },
+
 #ifdef CONFIG_OPENGL
     { "ui-egl-headless", "ui-opengl"    },
     { "ui-gtk",          "ui-opengl"    },
@@ -301,7 +303,7 @@ static struct {
     { "qxl-vga",               "hw-", "display-qxl"           },
     { "qxl",                   "hw-", "display-qxl"           },
     { "virtio-gpu-device",     "hw-", "display-virtio-gpu"    },
-    { "virtio-gpu-gl-device",  "hw-", "display-virtio-gpu"    },
+    { "virtio-gpu-gl-device",  "hw-", "display-virtio-gpu-gl" },
     { "vhost-user-gpu",        "hw-", "display-virtio-gpu"    },
     { "virtio-gpu-pci-base",   "hw-", "display-virtio-gpu-pci" },
     { "virtio-gpu-pci",        "hw-", "display-virtio-gpu-pci" },
diff --git a/hw/display/meson.build b/hw/display/meson.build
index 5161efa08a6e..3c3e47c47ed1 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -56,11 +56,14 @@ softmmu_ss.add(when: [pixman, 'CONFIG_ATI_VGA'], if_true: files('ati.c', 'ati_2d
 if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
   virtio_gpu_ss = ss.source_set()
   virtio_gpu_ss.add(when: 'CONFIG_VIRTIO_GPU',
-                    if_true: [files('virtio-gpu-base.c', 'virtio-gpu.c'), pixman, virgl])
-  virtio_gpu_ss.add(when: ['CONFIG_VIRTIO_GPU', 'CONFIG_VIRGL'],
-                    if_true: [files('virtio-gpu-gl.c', 'virtio-gpu-virgl.c'), pixman, virgl])
+                    if_true: [files('virtio-gpu-base.c', 'virtio-gpu.c'), pixman])
   virtio_gpu_ss.add(when: 'CONFIG_VHOST_USER_GPU', if_true: files('vhost-user-gpu.c'))
   hw_display_modules += {'virtio-gpu': virtio_gpu_ss}
+
+  virtio_gpu_gl_ss = ss.source_set()
+  virtio_gpu_gl_ss.add(when: ['CONFIG_VIRTIO_GPU', 'CONFIG_VIRGL', opengl],
+                       if_true: [files('virtio-gpu-gl.c', 'virtio-gpu-virgl.c'), pixman, virgl])
+  hw_display_modules += {'virtio-gpu-gl': virtio_gpu_gl_ss}
 endif
 
 if config_all_devices.has_key('CONFIG_VIRTIO_PCI')
-- 
2.31.1


