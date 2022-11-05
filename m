Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C3261DCA8
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:46:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMpX-0008Bs-U9; Sat, 05 Nov 2022 13:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnx-0007Bv-LJ
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMns-0007an-Ub
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MtEUbBVVYdPzeiTU39HNTaDMuOUKjIcjW007vq8qqcw=;
 b=YjeHtSfDOrDk2wTnUOON8NVVcQXZkBS5OYQbunyAMHPo+WRvonCM7t8oHfhlJEkaMDYyZN
 3A3EdEYeTnmFeo+aVxvNPqe3sEfLRhb76DHsvgXNqrR3JxitBxKzW9E7vBobyjFjm6QgXN
 wvhBxq/MUS0vaJSLkHOeVh+8nZvIS3U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-331-hb-sssW_NO2lzM7ApD05HQ-1; Sat, 05 Nov 2022 13:17:48 -0400
X-MC-Unique: hb-sssW_NO2lzM7ApD05HQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay40-20020a05600c1e2800b003cf8aa16377so3800182wmb.7
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MtEUbBVVYdPzeiTU39HNTaDMuOUKjIcjW007vq8qqcw=;
 b=2YfjLPsFMT76MFC0p+tlH8msN8XKNU6mFw+7gqU+hpYo1qtM745+yWViasGUJGdASE
 SKnuScVMlvi/71vTzdezg1fdIUdZtgJVtSMeu0S/BVc/+Rq1MCMk55iyQfGTlB/q6J1s
 gCG0BEnAi//NRra9O7sbQmSUKjyh5KzclwX10Jv6hIFIAc48ikmYlonGBEyDnph/7kBD
 WZq4Cdvyvpqe3hdYL1hSq9JuLgXY/silgZwKcnREM5lE5+c6zZN/uODnEwYcEmtir37V
 hIwhjT/bx8yTNRRBl05vUHPgpPEvv/sAtpDtt0TLYk9BDNRemZC3cF7dYl5KfT2/FQB1
 Wfew==
X-Gm-Message-State: ACrzQf0DT8tqvNOSivPrEx7D89gchplBHSlmLLxLp4oz+tJSJwZfcEim
 6KgGyocWtj2lzRVmJ5aTQ4XTJepBxFIcxyg495DwaHTbQe410dxjl+KkmdCZZtDnJne3tzlJWhu
 J+R7i+ZpZSvFWLETxn+Wg7IZJ6b5NHZMS46+6XzrI5ZaF8cGGd6DVLdPRonk+
X-Received: by 2002:adf:f687:0:b0:236:481f:83a6 with SMTP id
 v7-20020adff687000000b00236481f83a6mr26543484wrp.342.1667668666964; 
 Sat, 05 Nov 2022 10:17:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4anUKoQUNghkOy+PttWWtzMxHXCRzlXFYBfqS2lVz4Fg/Gmv8XkqiG8G0e/DT6S6VjikDQRg==
X-Received: by 2002:adf:f687:0:b0:236:481f:83a6 with SMTP id
 v7-20020adff687000000b00236481f83a6mr26543473wrp.342.1667668666663; 
 Sat, 05 Nov 2022 10:17:46 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 p15-20020adfce0f000000b0022cbf4cda62sm3147075wrn.27.2022.11.05.10.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:17:46 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:17:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Daney <david.daney@fungible.com>,
 Marcin Nowakowski <marcin.nowakowski@fungible.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@fungible.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL v3 47/81] virtio-rng-pci: Allow setting nvectors, so we can
 use MSI-X
Message-ID: <20221105171116.432921-48-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: David Daney <david.daney@fungible.com>

Most other virtio-pci devices allow MSI-X, let's have it for rng too.

Signed-off-by: David Daney <david.daney@fungible.com>
Reviewed-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@fungible.com>
Message-Id: <20221014160947.66105-1-philmd@fungible.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-rng-pci.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/virtio/virtio-rng-pci.c b/hw/virtio/virtio-rng-pci.c
index 151ece6f94..6e76f8b57b 100644
--- a/hw/virtio/virtio-rng-pci.c
+++ b/hw/virtio/virtio-rng-pci.c
@@ -13,6 +13,7 @@
 
 #include "hw/virtio/virtio-pci.h"
 #include "hw/virtio/virtio-rng.h"
+#include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "qom/object.h"
@@ -31,11 +32,23 @@ struct VirtIORngPCI {
     VirtIORNG vdev;
 };
 
+static Property virtio_rng_properties[] = {
+    DEFINE_PROP_BIT("ioeventfd", VirtIOPCIProxy, flags,
+                    VIRTIO_PCI_FLAG_USE_IOEVENTFD_BIT, true),
+    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
+                       DEV_NVECTORS_UNSPECIFIED),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void virtio_rng_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 {
     VirtIORngPCI *vrng = VIRTIO_RNG_PCI(vpci_dev);
     DeviceState *vdev = DEVICE(&vrng->vdev);
 
+    if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
+        vpci_dev->nvectors = 2;
+    }
+
     if (!qdev_realize(vdev, BUS(&vpci_dev->bus), errp)) {
         return;
     }
@@ -54,6 +67,7 @@ static void virtio_rng_pci_class_init(ObjectClass *klass, void *data)
     pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_RNG;
     pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
     pcidev_k->class_id = PCI_CLASS_OTHERS;
+    device_class_set_props(dc, virtio_rng_properties);
 }
 
 static void virtio_rng_initfn(Object *obj)
-- 
MST


