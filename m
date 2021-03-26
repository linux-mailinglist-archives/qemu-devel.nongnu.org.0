Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEE134A7A3
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 13:57:21 +0100 (CET)
Received: from localhost ([::1]:58610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPm1h-00055G-1G
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 08:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lPlvN-00064Y-DX
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 08:50:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lPlvF-00048F-Ks
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 08:50:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616763037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HrOjiFbElUI1UPiY3wTVIe5o3LRk5qFEdbWDNQIibHU=;
 b=YWOMzIl1PsYohh+NNkLKWYOvyhq3lVkRr2jdVWrSr1cGvGUk+LC3Ik0exNxjH9uiT6WqB3
 FsFExMTD/l4G457WwrKhVX3nAa211GRQgaDANHLkLJbkqePn3GhJp23uoINdrj3nTcaLvk
 GWHofpURJTkJPjGqFLCPIHFJ3MHnCGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-15rlRJHjOhi52YCkfIDJtg-1; Fri, 26 Mar 2021 08:50:34 -0400
X-MC-Unique: 15rlRJHjOhi52YCkfIDJtg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1ED581627;
 Fri, 26 Mar 2021 12:50:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-102.ams2.redhat.com
 [10.36.112.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFFB51B5C0;
 Fri, 26 Mar 2021 12:50:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1BFA71800393; Fri, 26 Mar 2021 13:49:33 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 8/9] s390x: modularize virtio-gpu-ccw
Date: Fri, 26 Mar 2021 13:49:31 +0100
Message-Id: <20210326124932.481942-9-kraxel@redhat.com>
In-Reply-To: <20210326124932.481942-1-kraxel@redhat.com>
References: <20210326124932.481942-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the virtio-gpu-ccw device depends on the hw-display-virtio-gpu
module, which provides the type virtio-gpu-device, packaging the
hw-display-virtio-gpu module as a separate package that may or may not
be installed along with the qemu package leads to problems. Namely if
the hw-display-virtio-gpu is absent, qemu continues to advertise
virtio-gpu-ccw, but it aborts not only when one attempts using
virtio-gpu-ccw, but also when libvirtd's capability probing tries
to instantiate the type to introspect it.

Let us thus introduce a module named hw-s390x-virtio-gpu-ccw that
is going to provide the virtio-gpu-ccw device. The hw-s390x prefix
was chosen because it is not a portable device.

With virtio-gpu-ccw built as a module, the correct way to package a
modularized qemu is to require that hw-display-virtio-gpu must be
installed whenever the module hw-s390x-virtio-gpu-ccw.

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Halil Pasic <pasic@linux.ibm.com>
Tested-by: Halil Pasic <pasic@linux.ibm.com>
Message-Id: <20210317095622.2839895-4-kraxel@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/s390x/virtio-ccw-gpu.c | 4 +++-
 util/module.c             | 1 +
 hw/s390x/meson.build      | 8 +++++++-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/s390x/virtio-ccw-gpu.c b/hw/s390x/virtio-ccw-gpu.c
index c301e2586bde..75a9e4bb3908 100644
--- a/hw/s390x/virtio-ccw-gpu.c
+++ b/hw/s390x/virtio-ccw-gpu.c
@@ -62,7 +62,9 @@ static const TypeInfo virtio_ccw_gpu = {
 
 static void virtio_ccw_gpu_register(void)
 {
-    type_register_static(&virtio_ccw_gpu);
+    if (have_virtio_ccw) {
+        type_register_static(&virtio_ccw_gpu);
+    }
 }
 
 type_init(virtio_ccw_gpu_register)
diff --git a/util/module.c b/util/module.c
index c65060c167df..cbe89fede628 100644
--- a/util/module.c
+++ b/util/module.c
@@ -304,6 +304,7 @@ static struct {
     { "virtio-gpu-pci-base",   "hw-", "display-virtio-gpu-pci" },
     { "virtio-gpu-pci",        "hw-", "display-virtio-gpu-pci" },
     { "vhost-user-gpu-pci",    "hw-", "display-virtio-gpu-pci" },
+    { "virtio-gpu-ccw",        "hw-", "s390x-virtio-gpu-ccw"   },
     { "virtio-vga-base",       "hw-", "display-virtio-vga"    },
     { "virtio-vga",            "hw-", "display-virtio-vga"    },
     { "vhost-user-vga",        "hw-", "display-virtio-vga"    },
diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
index 91495b563146..327e9c93afa9 100644
--- a/hw/s390x/meson.build
+++ b/hw/s390x/meson.build
@@ -34,7 +34,6 @@ virtio_ss.add(files('virtio-ccw.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-ccw-balloon.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-ccw-blk.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-ccw-crypto.c'))
-virtio_ss.add(when: 'CONFIG_VIRTIO_GPU', if_true: files('virtio-ccw-gpu.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_INPUT', if_true: files('virtio-ccw-input.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-ccw-net.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-ccw-rng.c'))
@@ -48,3 +47,10 @@ virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs-ccw.c'
 s390x_ss.add_all(when: 'CONFIG_VIRTIO_CCW', if_true: virtio_ss)
 
 hw_arch += {'s390x': s390x_ss}
+
+hw_s390x_modules = {}
+virtio_gpu_ccw_ss = ss.source_set()
+virtio_gpu_ccw_ss.add(when: ['CONFIG_VIRTIO_GPU', 'CONFIG_VIRTIO_CCW'],
+                      if_true: [files('virtio-ccw-gpu.c'), pixman])
+hw_s390x_modules += {'virtio-gpu-ccw': virtio_gpu_ccw_ss}
+modules += {'hw-s390x': hw_s390x_modules}
-- 
2.30.2


