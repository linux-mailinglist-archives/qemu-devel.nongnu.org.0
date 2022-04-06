Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F534F6C53
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 23:14:02 +0200 (CEST)
Received: from localhost ([::1]:49606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncCyX-00009F-M4
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 17:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ncCwa-0006a6-9Q
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 17:12:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ncCwX-0004jr-MV
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 17:11:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649279517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hujmOXIeib1MXC792mUHaQ3b6Dw/BEMKcjVBpMYvJUk=;
 b=cy+x2UWeRNsOQBdoEF63w5ZRPONOmB5cqARUmhB+zT0lrF2bOHpGilcW6rX1YLnfmSsGjq
 qJ/maDRY+fek7Zm926ZxFxKVt/QWbZmuyGWRnslqunKYsDFBnaLWdiY2oqDfLmG7kGdpOZ
 S1PVG+IAe5BMrB5dNNZazgHH1Lo0saw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-OIQJY44eMtuCyXHkuSL20Q-1; Wed, 06 Apr 2022 17:11:56 -0400
X-MC-Unique: OIQJY44eMtuCyXHkuSL20Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg8-20020a05600c3c8800b0038e6a989925so952499wmb.3
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 14:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hujmOXIeib1MXC792mUHaQ3b6Dw/BEMKcjVBpMYvJUk=;
 b=LStpzFOGyKQwO67t6GdOc2evt7qv7LkbcUwek3JBAJ48Y8fKdTh5boipJdnQC1HWMQ
 GSwfdYO3qaPNsb0d5XX6e1D75j/lJNucuaLXJS8WHDE9mI+jerjPds+UUv59fTnX/lyZ
 OQpiKd8jlzed0nRXOd9N2ZxBZNns+0foYnN2kLDxKbowtYZKJobE+U8F9ikTHgjVsuev
 OR3pYnsTecQEcq6g1TpekNsH9cuBeNa4uFwN54sAHgrlSII/8R2Jb9k4CBObH/CUIvfV
 nreTSt/EbcamTeD6yDCDioM5ge+Oqg3MsyDgI4mG6iWMaDrUpA0iefRe7n2EH99lUVwZ
 Z4gA==
X-Gm-Message-State: AOAM532a3e5helb+BCKegkRSPXtk7rZmtVpy2rEmVYkHul0EvcEQ+a3M
 VXqDKs2qcfeOkUsuq6IoCIXW9x+DScVI4Qb/HGB28kmtXZsJu6he+xfO2YdtZeu3uWiPcUZJz/O
 a/9SSOnHF+zE4PDoea4cm4Zgw1bziBzqNr81WJpV5VQ9s+DnYC/YIXE9J4ntq
X-Received: by 2002:adf:e0ce:0:b0:1ef:706d:d6b9 with SMTP id
 m14-20020adfe0ce000000b001ef706dd6b9mr8290913wri.71.1649279514814; 
 Wed, 06 Apr 2022 14:11:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7u/NqLRmffKo9OHlTbWeczZti+/bEtCIEcQ6yjofANo49ZCZ7oi1uLLJ3j266Z74n9zOiqg==
X-Received: by 2002:adf:e0ce:0:b0:1ef:706d:d6b9 with SMTP id
 m14-20020adfe0ce000000b001ef706dd6b9mr8290895wri.71.1649279514433; 
 Wed, 06 Apr 2022 14:11:54 -0700 (PDT)
Received: from redhat.com ([2.52.15.99]) by smtp.gmail.com with ESMTPSA id
 v13-20020adfe28d000000b0020375f27a5asm16066100wri.4.2022.04.06.14.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 14:11:53 -0700 (PDT)
Date: Wed, 6 Apr 2022 17:11:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] virtio: fix feature negotiation for ACCESS_PLATFORM
Message-ID: <20220406211137.38840-2-mst@redhat.com>
References: <20220406211137.38840-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220406211137.38840-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>, Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>
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


