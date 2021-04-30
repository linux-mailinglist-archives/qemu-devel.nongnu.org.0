Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A36DF36FB11
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:58:55 +0200 (CEST)
Received: from localhost ([::1]:44098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSjO-0006sR-LQ
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRSA-00017Z-4M
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:37:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRS8-0001hg-72
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:37:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619782618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9S5KSuAtwx7d0soDjJhrNRJVtmAvbBUCJHoQWxSVLgs=;
 b=XdEqB0xl6O2pLiRh1PSEHmR5GeApcFeCVKG76ifvxpN7qtLrcttBndrCYNf+x8uEoQmDBI
 mcvTYJ8P5k7aRuEHeUrfxWkEpb5Q0xJDM2n+WMw17UBV4Nw10qJQ8EObBcdI+xbqEK7gJO
 kKZPZXA/l2GiJo4G/6rBVFltgY6Eyhg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-OKQmI2bXNfKZtYCP_D_UwQ-1; Fri, 30 Apr 2021 07:36:54 -0400
X-MC-Unique: OKQmI2bXNfKZtYCP_D_UwQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87CBB501FA;
 Fri, 30 Apr 2021 11:36:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E76306F442;
 Fri, 30 Apr 2021 11:36:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AE7B7180079D; Fri, 30 Apr 2021 13:35:47 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/16] virtio-gpu: move virtio-gpu-gl-device to separate
 module
Date: Fri, 30 Apr 2021 13:35:42 +0200
Message-Id: <20210430113547.1816178-12-kraxel@redhat.com>
In-Reply-To: <20210430113547.1816178-1-kraxel@redhat.com>
References: <20210430113547.1816178-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, tina.zhang@intel.com,
 Gerd Hoffmann <kraxel@redhat.com>, vivek.kasireddy@intel.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
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
2.30.2


