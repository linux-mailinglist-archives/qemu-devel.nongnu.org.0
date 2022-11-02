Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54262616855
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:20:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGKL-0000RI-Ao; Wed, 02 Nov 2022 12:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKG-0000E5-K3
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKF-00037I-3F
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MtEUbBVVYdPzeiTU39HNTaDMuOUKjIcjW007vq8qqcw=;
 b=Sg56vpCs0GwVTGwhD0pa9wvTy5eejQ0E5jd+oo7KWt2bxhvaL+AFnH8PdVyhOTQBRJcVl+
 0NQxySie8HfMXKWpUDo3afuVOqhogjpuGqm0eCAUmT9DRynJiHPBSV+GZEholw5Sr3pnZW
 B9Yo1diN8OaYwjTsABC6NOX/kNC9oHw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-217-aDvm_T4FOniW83h8JGwEBw-1; Wed, 02 Nov 2022 12:10:45 -0400
X-MC-Unique: aDvm_T4FOniW83h8JGwEBw-1
Received: by mail-wm1-f70.google.com with SMTP id
 1-20020a05600c028100b003cf7833293cso1260518wmk.3
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MtEUbBVVYdPzeiTU39HNTaDMuOUKjIcjW007vq8qqcw=;
 b=6ndHfNXgWAADYluXipDmgAfD4wuIVaDuDw5yd6iy4yAZyC9qFeVWtsmmBzvWp6hMZn
 NwOAZTnMJBouzCLvRFcdkAZ0qKUSeBmvPGN4JguBswL7hCfCKSnu8YkNTJKf9FN5QY6f
 aIuvedtXK0MJ8oqI+lPduZuQstvEy798J3Ev05kcCQRx9XQumd5SDia2XAbV0LG5tmUi
 Os1A6vhto3tW4SFruDGE0Ioe7eo+iY86Kmv7W7gMAN0+9p9RQDwhvS69pcBMdAzzgftV
 A2kmCGQd1LD7t1oExA+gARq9SsDJvDxhx6SxiaucYOfZhIsP0SP7J4fAwNwS8Z8kdfO6
 ctCw==
X-Gm-Message-State: ACrzQf2rFsPMCMINuAV0LtA9iy5CzkOp7c+A/OKY2z81iCMfSM+KdEuR
 c0su2Nc/kZTm+1q6AdqkRtNkqvx/XW1joRt8iQfLxPO9IL2ebHOWcT+DkL9qUh5jmapbTo4SBip
 pzVtmohpoTDWbgsjt9IHwrZvEv8VYBDuDtnDdp+OwIH2Vi17NDQaPd0ZuABfc
X-Received: by 2002:a05:600c:21a:b0:3cf:6e76:9830 with SMTP id
 26-20020a05600c021a00b003cf6e769830mr12601283wmi.159.1667405443954; 
 Wed, 02 Nov 2022 09:10:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4xBa4lC9JZbCNJEb0UN0ngpFbdQTynaGF0NTe7hu4fwHY3k7HSgJcXZzmytQObBB9kmvPn4A==
X-Received: by 2002:a05:600c:21a:b0:3cf:6e76:9830 with SMTP id
 26-20020a05600c021a00b003cf6e769830mr12601254wmi.159.1667405443692; 
 Wed, 02 Nov 2022 09:10:43 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 t18-20020a5d4612000000b002368424f89esm13074824wrq.67.2022.11.02.09.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:10:43 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:10:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Daney <david.daney@fungible.com>,
 Marcin Nowakowski <marcin.nowakowski@fungible.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@fungible.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL v2 50/82] virtio-rng-pci: Allow setting nvectors, so we can
 use MSI-X
Message-ID: <20221102160336.616599-51-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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


