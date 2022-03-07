Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BA24D0B7B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 23:52:00 +0100 (CET)
Received: from localhost ([::1]:37670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMCt-0001tr-Eg
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 17:51:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM6K-00065r-Ro
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM6J-0005OX-21
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TX6EjlT2hSkO078tNRAKGmtPlKuyy6GjReGhr8QOnJA=;
 b=dmNra4NOtrq5pJZDU0+5FulxZR4GMWqnL/31Tp7ItpMKdUhIRCBQkqBAklSPrpEur9+Sfz
 1scagH+ZP0E2vCksFtJq5QUGZPc26a0u3/mp2qAW5bPHjKdljIRWEE19E/DRBZ1X9L7g+a
 RxT1sRMoO3U3uiccrBEPXWl4hFaIODU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-gUiQ5TKJPfqHCDoOzekFXg-1; Mon, 07 Mar 2022 17:45:09 -0500
X-MC-Unique: gUiQ5TKJPfqHCDoOzekFXg-1
Received: by mail-wr1-f72.google.com with SMTP id
 f14-20020adfc98e000000b001e8593b40b0so4952676wrh.14
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:45:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TX6EjlT2hSkO078tNRAKGmtPlKuyy6GjReGhr8QOnJA=;
 b=AhZMnAOR5us/VwVz+1BV6FHSsuHt/2z4cr9ENbATMe4+ViJmDt7Tiv+pn3mk1VF9R4
 D0K0iefdsPMDyt5JDIen12m7vOkeWqVY/czJD/m+5p7EebXKiwza05f9BotcOdid9Qm9
 BqFgrjpGdKp0iN/zrLFu78ohZlfB8EFCHhxvbOAcACxA4Q2WTHUM0dZlz9KbJY1QrU0c
 9HjvRD8OcbQVhG5IKHG+CR09QBjrTQKf0ZN1ADMDGQETzOxEGmsO85iSxcykvkXq1AH3
 HcLxM6nyyfyV/6eIcsmTlAKt0YCBmz/cX1qsbsyinimzENL9URm2F15Aq4xs75SrhjJA
 ZQWA==
X-Gm-Message-State: AOAM533SfeHKp7uqJlxxzKWCAZOeJZQrIKjZqTwrUzbxGMEUJfX3Th1v
 RYqXqob8K121zveg/es6SdZLzW8kLu3PL21liMqBXiTqixGTV1BzHDT+8NvviKi2KAo+VKfwh8U
 fpdO5gUHK+BMN6M4o1VPHUWnTO3n5H0myRSfy1K7XVzw4M5IM2lf7aXpFJAyI
X-Received: by 2002:a1c:6a08:0:b0:388:73a2:1548 with SMTP id
 f8-20020a1c6a08000000b0038873a21548mr949288wmc.163.1646693107515; 
 Mon, 07 Mar 2022 14:45:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0uDADHhQppZXFTt7jzomXpiia16xpO73+dka978+o11fP7duhSgjDZTsvE01fmXzu2cLyDQ==
X-Received: by 2002:a1c:6a08:0:b0:388:73a2:1548 with SMTP id
 f8-20020a1c6a08000000b0038873a21548mr949258wmc.163.1646693107199; 
 Mon, 07 Mar 2022 14:45:07 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 f13-20020adff8cd000000b001f03439743fsm12359207wrq.75.2022.03.07.14.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:45:06 -0800 (PST)
Date: Mon, 7 Mar 2022 17:45:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 11/47] virtio: fix the condition for iommu_platform not
 supported
Message-ID: <20220307224357.682101-12-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
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
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-stable@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Halil Pasic <pasic@linux.ibm.com>

The commit 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
unsupported") claims to fail the device hotplug when iommu_platform
is requested, but not supported by the (vhost) device. On the first
glance the condition for detecting that situation looks perfect, but
because a certain peculiarity of virtio_platform it ain't.

In fact the aforementioned commit introduces a regression. It breaks
virtio-fs support for Secure Execution, and most likely also for AMD SEV
or any other confidential guest scenario that relies encrypted guest
memory.  The same also applies to any other vhost device that does not
support _F_ACCESS_PLATFORM.

The peculiarity is that iommu_platform and _F_ACCESS_PLATFORM collates
"device can not access all of the guest RAM" and "iova != gpa, thus
device needs to translate iova".

Confidential guest technologies currently rely on the device/hypervisor
offering _F_ACCESS_PLATFORM, so that, after the feature has been
negotiated, the guest  grants access to the portions of memory the
device needs to see. So in for confidential guests, generally,
_F_ACCESS_PLATFORM is about the restricted access to memory, but not
about the addresses used being something else than guest physical
addresses.

This is the very reason for which commit f7ef7e6e3b ("vhost: correctly
turn on VIRTIO_F_IOMMU_PLATFORM") fences _F_ACCESS_PLATFORM from the
vhost device that does not need it, because on the vhost interface it
only means "I/O address translation is needed".

This patch takes inspiration from f7ef7e6e3b ("vhost: correctly turn on
VIRTIO_F_IOMMU_PLATFORM"), and uses the same condition for detecting the
situation when _F_ACCESS_PLATFORM is requested, but no I/O translation
by the device, and thus no device capability is needed. In this
situation claiming that the device does not support iommu_plattform=on
is counter-productive. So let us stop doing that!

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
Reported-by: Jakob Naucke <Jakob.Naucke@ibm.com>
Fixes: 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
unsupported")
Acked-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-stable@nongnu.org

Message-Id: <20220207112857.607829-1-pasic@linux.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/virtio-bus.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index d23db98c56..0f69d1c742 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -48,6 +48,7 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
     VirtioBusClass *klass = VIRTIO_BUS_GET_CLASS(bus);
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
     bool has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
+    bool vdev_has_iommu;
     Error *local_err = NULL;
 
     DPRINTF("%s: plug device.\n", qbus->name);
@@ -69,11 +70,6 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
         return;
     }
 
-    if (has_iommu && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
-        error_setg(errp, "iommu_platform=true is not supported by the device");
-        return;
-    }
-
     if (klass->device_plugged != NULL) {
         klass->device_plugged(qbus->parent, &local_err);
     }
@@ -82,9 +78,15 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
         return;
     }
 
+    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
     if (klass->get_dma_as != NULL && has_iommu) {
         virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
         vdev->dma_as = klass->get_dma_as(qbus->parent);
+        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
+            error_setg(errp,
+                       "iommu_platform=true is not supported by the device");
+            return;
+        }
     } else {
         vdev->dma_as = &address_space_memory;
     }
-- 
MST


