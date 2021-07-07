Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF2C3BEA5B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:06:45 +0200 (CEST)
Received: from localhost ([::1]:33810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m198O-0000Xh-82
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m194q-0008DK-6R
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m194o-0006Xz-Gh
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625670182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QReaygTvgIPiu+t7rp1+oUfbV4YTyblPRgcOq0uWDBw=;
 b=H32e0jPcN3teaIaPzP0XkMXWSQb/MOcZgDwLgZYIyDSowMwcs6RWRVvBdzF2ZvC8yRCPHf
 3/E3byQoctdARfeIigXn6eQfGmi1uJBaj9cRNvu5bwfZxjE6eB2VnPGcyiueo8+uQlTQ+v
 sv98/SBvnyH/SoujoYCGKhYcgDdhSQI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-kMYLvm36MbSjsmhNEVVHXg-1; Wed, 07 Jul 2021 11:03:00 -0400
X-MC-Unique: kMYLvm36MbSjsmhNEVVHXg-1
Received: by mail-wm1-f72.google.com with SMTP id
 n5-20020a05600c3b85b02902152e9caa1dso929563wms.3
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 08:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QReaygTvgIPiu+t7rp1+oUfbV4YTyblPRgcOq0uWDBw=;
 b=mrMIuc//PsLVkGYCYDjOpRohK4e/Svoab3sbkm25gf2JEb7+uLe9MhpPsPoLV7DMQR
 IQtPfSZ2ubMB388suinEkbsYXV9srbZGT1NWV4C/AQHe9sie8yGGfi8AUjlHLoa1N2AX
 uwWNc9t/f+18KtDLL/9zwCTsGp+euc75yI90KunEnsEL7/YebPBbDmzzV+rwGCZS+3AP
 hzITCsh6xMpFrZrJjV2MvmwxDkBYockoEHxgZkw4aJNyVlc3je8l14mdfefs5Y61u/3j
 NXqLsY4WYyfibo1A7qqPx/0zrxJJ3qt3LPY4LZsGpqWMMeoIkCquVrJYCMsCQzN7ulQR
 K2qA==
X-Gm-Message-State: AOAM533zYeCXaiNzyfRFAu6Q4exxrraTUCr1tlB3A6Iy/Eh/5x77G/NS
 QjXHrrirXCk+NXn0Rte4pvVIXGz15WHXvhQc0XnOyVqvfQFbIT81Rqnk3ETg1dgxgwQD3neo2TK
 wAxBCVMKHe052pfqDpubAieEHhcm5p9QSo0HrjGuwupfuBcKMGd+NxEWclm/w
X-Received: by 2002:a1c:1bc3:: with SMTP id b186mr52390wmb.27.1625670179168;
 Wed, 07 Jul 2021 08:02:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4Q8XrrpGrdQaAIPd7jvyUNXvz1y0/jXVMo8yTwl0oacs31GgeqeuCun9qePvejWxFX5g0wg==
X-Received: by 2002:a1c:1bc3:: with SMTP id b186mr52341wmb.27.1625670178903;
 Wed, 07 Jul 2021 08:02:58 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id o35sm859428wms.29.2021.07.07.08.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:02:58 -0700 (PDT)
Date: Wed, 7 Jul 2021 11:02:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/13] virtio: disable ioeventfd for record/replay
Message-ID: <20210707150157.52328-2-mst@redhat.com>
References: <20210707150157.52328-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707150157.52328-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

virtio devices support separate iothreads waiting for
events from file descriptors. These are asynchronous
events that can't be recorded and replayed, therefore
this patch disables ioeventfd for all devices when
record or replay is enabled.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Message-Id: <162125678869.1252810.4317416444097392406.stgit@pasha-ThinkPad-X280>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/s390x/virtio-ccw.c   | 6 ++++++
 hw/virtio/virtio-mmio.c | 6 ++++++
 hw/virtio/virtio-pci.c  | 6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index d68888fccd..6a2df1c1e9 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -31,6 +31,7 @@
 #include "trace.h"
 #include "hw/s390x/css-bridge.h"
 #include "hw/s390x/s390-virtio-ccw.h"
+#include "sysemu/replay.h"
 
 #define NR_CLASSIC_INDICATOR_BITS 64
 
@@ -770,6 +771,11 @@ static void virtio_ccw_device_realize(VirtioCcwDevice *dev, Error **errp)
         dev->flags &= ~VIRTIO_CCW_FLAG_USE_IOEVENTFD;
     }
 
+    /* fd-based ioevents can't be synchronized in record/replay */
+    if (replay_mode != REPLAY_MODE_NONE) {
+        dev->flags &= ~VIRTIO_CCW_FLAG_USE_IOEVENTFD;
+    }
+
     if (k->realize) {
         k->realize(dev, &err);
         if (err) {
diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 5952471b38..1af48a1b04 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -29,6 +29,7 @@
 #include "qemu/host-utils.h"
 #include "qemu/module.h"
 #include "sysemu/kvm.h"
+#include "sysemu/replay.h"
 #include "hw/virtio/virtio-mmio.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
@@ -740,6 +741,11 @@ static void virtio_mmio_realizefn(DeviceState *d, Error **errp)
         proxy->flags &= ~VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD;
     }
 
+    /* fd-based ioevents can't be synchronized in record/replay */
+    if (replay_mode != REPLAY_MODE_NONE) {
+        proxy->flags &= ~VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD;
+    }
+
     if (proxy->legacy) {
         memory_region_init_io(&proxy->iomem, OBJECT(d),
                               &virtio_legacy_mem_ops, proxy,
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index b321604d9b..f1e105fa52 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -37,6 +37,7 @@
 #include "qemu/range.h"
 #include "hw/virtio/virtio-bus.h"
 #include "qapi/visitor.h"
+#include "sysemu/replay.h"
 
 #define VIRTIO_PCI_REGION_SIZE(dev)     VIRTIO_PCI_CONFIG_OFF(msix_present(dev))
 
@@ -1760,6 +1761,11 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
         proxy->flags &= ~VIRTIO_PCI_FLAG_USE_IOEVENTFD;
     }
 
+    /* fd-based ioevents can't be synchronized in record/replay */
+    if (replay_mode != REPLAY_MODE_NONE) {
+        proxy->flags &= ~VIRTIO_PCI_FLAG_USE_IOEVENTFD;
+    }
+
     /*
      * virtio pci bar layout used by default.
      * subclasses can re-arrange things if needed.
-- 
MST


