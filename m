Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E99CD6203BB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:26:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAxV-0002BJ-NG; Mon, 07 Nov 2022 17:51:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAxU-00028q-1a
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:51:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAxL-00040a-6W
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:51:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MtEUbBVVYdPzeiTU39HNTaDMuOUKjIcjW007vq8qqcw=;
 b=biGCcm3sfhxPi+KozW7pUaLLIyyR3jyCfvwh62otLfEIhJg3rmg9pvzkYraNbm6yuTnnZR
 4yT9KIFoopqrqFCndn0JqGoR+o5eBISUUXtNDxVv9mpnci4t9yMALYWQRKa8X4sFAPSFkw
 GJXyBXID6OrUzkeVjUwVvxxsa4rxgFQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-244-mGm3sHEEOyW8evkKrWPgZw-1; Mon, 07 Nov 2022 17:51:01 -0500
X-MC-Unique: mGm3sHEEOyW8evkKrWPgZw-1
Received: by mail-qk1-f199.google.com with SMTP id
 bj1-20020a05620a190100b006fa12a05188so11320581qkb.4
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:51:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MtEUbBVVYdPzeiTU39HNTaDMuOUKjIcjW007vq8qqcw=;
 b=BPyoNKxP7MUdsn0MxohXUJLtfV79gkdT6BVsj5WQRMyUQ5Mb7Ec8Lw7beAl0k35WVd
 ec40AvTBuZ8rhy5FHl40zJTtubXEje1CrBDbZ3lDpDYotL3k98gIOEkWEYgeVQxGoFpe
 qGzVYAaaiN/SjUTH8aghfEtWVWYFYErA1Ht4vqBvkuMvTRqNs/sh4ETPNx+nFbsaj1Bv
 SN8qhbVAPIpPnq7qfRbTk1Vqha4PdwVRuxW6IU+xTX9HujF5Asu8bVxGYxKxhx//U+AO
 QZ6i3tk6RVk+VOiersC/J+vzzyj4Tm9QHq3+T/P7LdGKo4husnmdRX6PrUR4NzJ1/KpB
 28hQ==
X-Gm-Message-State: ACrzQf1onB8pMXtlNzbj8IBZpNVn692d3Snk6znotjkaBfr3TS+6lPCL
 KighuxYj0vz4uEaJoyvuVYYkaT0gajOIFhzwyl2ByJ1YHYyUhJQDZNqRLHPICRNQK7jv5exDiSc
 ldhMSHp6Aqo0sm41Vdd5k7ERLopTwrIMCsKGuP7b9XgX5XUnipz+4RcY0eUiA
X-Received: by 2002:a05:622a:18a1:b0:3a5:6740:c9b with SMTP id
 v33-20020a05622a18a100b003a567400c9bmr14801355qtc.182.1667861460942; 
 Mon, 07 Nov 2022 14:51:00 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6HC7hBM8J0ZhMGSSuEGX7Lv85QoAhCV4rfJ0leqf/WvmYDRwzd/q2S4lP59Sf1x8Hq0pgqmA==
X-Received: by 2002:a05:622a:18a1:b0:3a5:6740:c9b with SMTP id
 v33-20020a05622a18a100b003a567400c9bmr14801327qtc.182.1667861460604; 
 Mon, 07 Nov 2022 14:51:00 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 v14-20020a05620a440e00b006fab416015csm6954298qkp.25.2022.11.07.14.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:51:00 -0800 (PST)
Date: Mon, 7 Nov 2022 17:50:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Daney <david.daney@fungible.com>,
 Marcin Nowakowski <marcin.nowakowski@fungible.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@fungible.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL v4 42/83] virtio-rng-pci: Allow setting nvectors, so we can
 use MSI-X
Message-ID: <20221107224600.934080-43-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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


