Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC415291FB
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 22:54:21 +0200 (CEST)
Received: from localhost ([::1]:60732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqhjQ-0007F6-6o
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 16:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhfP-000485-Cl
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:50:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhfN-00065i-Ce
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:50:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hujmOXIeib1MXC792mUHaQ3b6Dw/BEMKcjVBpMYvJUk=;
 b=SzzoQF69AIcvYYUdRbbPK8B0NywABMUmjCh7q95AWkTDxdVwJU4/f3wP/IsJIHMfJNQQhW
 QT19HMRDdMCGkOY4A+6wgh2slSCkW7BM6yy+Yo8w6kjBlWu8rKi6bmEfoq0wEzhWuXXgI8
 EmNamw5xeB2d1E/fr37qrHSqmiXrAFc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-AD6sTxSVMnG8MD1gU2NP0Q-1; Mon, 16 May 2022 16:50:07 -0400
X-MC-Unique: AD6sTxSVMnG8MD1gU2NP0Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 b3-20020aa7d483000000b004282ca95814so10413021edr.9
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hujmOXIeib1MXC792mUHaQ3b6Dw/BEMKcjVBpMYvJUk=;
 b=y9m99yIKmlpjJ6W9VnRk+u8ei6Hfqir22KjjOEB8x4tdo7Q8zN2i9/Fi38LspFPWqU
 FK1Rzv2ssMxmzpgfuI/ZSCDEHIwLyumO2lNeYwBFACb3Q4vOIdhJ4Nm/DslcMPaOHrVR
 VQ8ymi51gHp48jGIQ4JMOEeb5h+Iz2Cv4+VyFW94r9w4Q5IpL+hltqgsR3ZwEDuAGDry
 +BOI/ZQeEm1JuHt3JLKKGxSAaL3H0WyMo8bU92w0MXuVj7n1nIBafzW2e0wLquqvZVYp
 7nRzhV/gImRUDPoMtPxP49oNVKT812H+7pNZXfbygOgZBdgpV68QQcZh64q6ILrOgXSU
 wdEQ==
X-Gm-Message-State: AOAM532iHBZLby4ZiuktU1kCNNu185BIgbrstdDeXuMLTl7lKOf70D7s
 n1hB/xhXZJzWURLH1qxm/Q0NZXcWQ6fSL8Lx21A8jDpYuV8HAT3F6K/pF8ALaF6Uh+f8gxF2gsc
 Wi1ErJK5iXDfMm5yPTXp2jhcF2d68S14gKr0n8m2GvKnyLqw9FHqZ0ZZdypPP
X-Received: by 2002:a05:6402:783:b0:42a:b251:6a9d with SMTP id
 d3-20020a056402078300b0042ab2516a9dmr6846010edy.315.1652734205713; 
 Mon, 16 May 2022 13:50:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlAqJ+PROMn2IW5sOSitijj+POS0+dWBiUPRkOW0A1kEhXRrRhbF4ej/THN4dirmHOUbvc7Q==
X-Received: by 2002:a05:6402:783:b0:42a:b251:6a9d with SMTP id
 d3-20020a056402078300b0042ab2516a9dmr6845988edy.315.1652734205458; 
 Mon, 16 May 2022 13:50:05 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 w26-20020a170907271a00b006f3ef214e25sm154889ejk.139.2022.05.16.13.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:50:04 -0700 (PDT)
Date: Mon, 16 May 2022 16:50:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [PULL v2 01/86] virtio: fix feature negotiation for ACCESS_PLATFORM
Message-ID: <20220516204913.542894-2-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Halil Pasic <pasic@linux.ibm.com>

Unlike most virtio features ACCESS_PLATFORM is considered mandatory by
QEMU, i.e. the driver must accept it if offered by the device. The
virtio specification says that the driver SHOULD accept the
ACCESS_PLATFORM feature if offered, and that the device MAY fail to
operate if ACCESS_PLATFORM was offered but not negotiated.

While a SHOULD ain't exactly a MUST, we are certainly allowed to fail
the device when the driver fences ACCESS_PLATFORM. With commit
2943b53f68 ("virtio: force VIRTIO_F_IOMMU_PLATFORM") we already made the
decision to do so whenever the get_dma_as() callback is implemented (by
the bus), which in practice means for the entirety of virtio-pci.

That means, if the device needs to translate I/O addresses, then
ACCESS_PLATFORM is mandatory. The aforementioned commit tells us in the
commit message that this is for security reasons. More precisely if we
were to allow a less then trusted driver (e.g. an user-space driver, or
a nested guest) to make the device bypass the IOMMU by not negotiating
ACCESS_PLATFORM, then the guest kernel would have no ability to
control/police (by programming the IOMMU) what pieces of guest memory
the driver may manipulate using the device. Which would break security
assumptions within the guest.

If ACCESS_PLATFORM is offered not because we want the device to utilize
an IOMMU and do address translation, but because the device does not
have access to the entire guest RAM, and needs the driver to grant
access to the bits it needs access to (e.g. confidential guest support),
we still require the guest to have the corresponding logic and to accept
ACCESS_PLATFORM. If the driver does not accept ACCESS_PLATFORM, then
things are bound to go wrong, and we may see failures much less graceful
than failing the device because the driver didn't negotiate
ACCESS_PLATFORM.

So let us make ACCESS_PLATFORM mandatory for the driver regardless
of whether the get_dma_as() callback is implemented or not.

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
Fixes: 2943b53f68 ("virtio: force VIRTIO_F_IOMMU_PLATFORM")

Message-Id: <20220307112939.2780117-1-pasic@linux.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/virtio/virtio-bus.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index 0f69d1c742..d7ec023adf 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -78,17 +78,23 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
         return;
     }
 
-    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
-    if (klass->get_dma_as != NULL && has_iommu) {
+    vdev->dma_as = &address_space_memory;
+    if (has_iommu) {
+        vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
+        /*
+         * Present IOMMU_PLATFORM to the driver iff iommu_plattform=on and
+         * device operational. If the driver does not accept IOMMU_PLATFORM
+         * we fail the device.
+         */
         virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
-        vdev->dma_as = klass->get_dma_as(qbus->parent);
-        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
-            error_setg(errp,
+        if (klass->get_dma_as) {
+            vdev->dma_as = klass->get_dma_as(qbus->parent);
+            if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
+                error_setg(errp,
                        "iommu_platform=true is not supported by the device");
-            return;
+                return;
+            }
         }
-    } else {
-        vdev->dma_as = &address_space_memory;
     }
 }
 
-- 
MST


