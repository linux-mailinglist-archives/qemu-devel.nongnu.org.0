Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F42324A39
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 06:38:01 +0100 (CET)
Received: from localhost ([::1]:38332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF9Lc-00086O-K0
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 00:38:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1lF9K4-0007AR-RX; Thu, 25 Feb 2021 00:36:24 -0500
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:33021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1lF9K3-0008R8-4A; Thu, 25 Feb 2021 00:36:24 -0500
Received: by mail-io1-xd29.google.com with SMTP id e2so1367284iog.0;
 Wed, 24 Feb 2021 21:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B8SDnx237dYg9O16S6bMrUw7sE1vxEBsTTpQo2JjZeg=;
 b=QqGZWL232vs6T0Vju73pSW1Ctd5EwNmJbxCkxbN6qSmJhgyOwcHs9yDM8JudRS3Bcy
 Edjdbai7hOIywZSB7w9wmHLpaSZjgI7HgY1BSaDk2U1CEAoahcp1iDYSfUbHXorDDQfD
 MB0kwmN13lBgUyeEWnsuURt+jtzJ20xfE7n/3dXhK4RV7MXPk+5UxQVt3xzKks6UCwrD
 c33Ob+f8jqku58HBla5b6u5KIOfudCaVjk37Zr63/hmc+T7iFn85J1c66JeW0+bHBjKt
 Qbr3NsRJsfm/Y3ZOP7wlmuf7665a9B9pcp1feeu046rfTLAGeAb1/imhmeoEcM6LOEGO
 biOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B8SDnx237dYg9O16S6bMrUw7sE1vxEBsTTpQo2JjZeg=;
 b=QgwiX3FnGz1B7D/UeXTi3gIz7pklf3poP4FRVWC5bwix3n5JqWwvYe0kZMu+tVhFv4
 HOBH5I062hglmLCQgDBaERzDGIYacA38K6tq+hibkkOnFqrUohiZcMpckQ6oX3AYqvOp
 0f1lRzXbo+7y4mw7aIVGYFDDC9xC2cLEYiBD1J+gzFtDwgol7XrDYoD1S9U0O6reJhI1
 r40mH4leMUZNkfptuZxNCcJlE+jm+jU6L7xw3TkOEY9el0vhvq2ad93bZkEjbb+3yV0K
 lmaKwO/kauR0FtEuAGZyIitDufVPieVAz6nBIV4Z9K1lgcLL7oD7+wFDZ5SDfGk327+V
 sxhg==
X-Gm-Message-State: AOAM532aQGfFjVH/DxINABwZ+hPzwYDTqpJ7vGK5tbf4OirxAWNLXeCe
 Npt1uS+MKpPoSJcTeYbDuLjlZWkD9wTuKoQDMF0=
X-Google-Smtp-Source: ABdhPJwQKZOsH31NdN3HPhXuAhpq8CMoirNIIrds0gH/F9zDXdv28qniFoNs4SzyE2n78gAOJblVZQ==
X-Received: by 2002:a02:b61a:: with SMTP id h26mr1586877jam.90.1614231380828; 
 Wed, 24 Feb 2021 21:36:20 -0800 (PST)
Received: from localhost (ec2-3-14-82-192.us-east-2.compute.amazonaws.com.
 [3.14.82.192])
 by smtp.gmail.com with ESMTPSA id o131sm2698236ila.5.2021.02.24.21.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 21:36:20 -0800 (PST)
From: schspa <schspa@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4] virtio-mmio: improve virtio-mmio get_dev_path alog
Date: Thu, 25 Feb 2021 13:36:06 +0800
Message-Id: <20210225053606.385884-1-schspa@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <CAFEAcA_W0AhNYs7+9hn1H6B2DL+UnSdhrj2JsBS4vCZ6fEd_pw@mail.gmail.com>
References: <CAFEAcA_W0AhNYs7+9hn1H6B2DL+UnSdhrj2JsBS4vCZ6fEd_pw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=schspa@gmail.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, schspa@gmail.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the moment the following QEMU command line triggers an assertion
failure On xlnx-versal SOC:
  qemu-system-aarch64 \
      -machine xlnx-versal-virt -nographic -smp 2 -m 128 \
      -fsdev local,id=shareid,path=${HOME}/work,security_model=none \
      -device virtio-9p-device,fsdev=shareid,mount_tag=share \
      -fsdev local,id=shareid1,path=${HOME}/Music,security_model=none \
      -device virtio-9p-device,fsdev=shareid1,mount_tag=share1

  qemu-system-aarch64: ../migration/savevm.c:860:
  vmstate_register_with_alias_id:
  Assertion `!se->compat || se->instance_id == 0' failed.

This problem was fixed on arm virt platform in commit f58b39d2d5b
("virtio-mmio: format transport base address in BusClass.get_dev_path")

It works perfectly on arm virt platform. but there is still there on
xlnx-versal SOC.

The main difference between arm virt and xlnx-versal is they use
different way to create virtio-mmio qdev. on arm virt, it calls
sysbus_create_simple("virtio-mmio", base, pic[irq]); which will call
sysbus_mmio_map internally and assign base address to subsys device
mmio correctly. but xlnx-versal's implements won't do this.

However, xlnx-versal can't switch to sysbus_create_simple() to create
virtio-mmio device. It's because xlnx-versal's cpu use
VersalVirt.soc.fpd.apu.mr as it's memory. which is subregion of
system_memory. sysbus_create_simple will add virtio to system_memory,
which can't be accessed by cpu.

Besides, xlnx-versal can't add sysbus_mmio_map api call too, because
this will add memory region to system_memory, and it can't be added
to VersalVirt.soc.fpd.apu.mr again.

We can solve this by assign correct base address offset on dev_path.

This path was test on aarch64 virt & xlnx-versal platform.

Signed-off-by: schspa <schspa@gmail.com>
---
 hw/virtio/virtio-mmio.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 610661d6a5..6990b9879c 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -737,8 +737,8 @@ static char *virtio_mmio_bus_get_dev_path(DeviceState *dev)
     BusState *virtio_mmio_bus;
     VirtIOMMIOProxy *virtio_mmio_proxy;
     char *proxy_path;
-    SysBusDevice *proxy_sbd;
     char *path;
+    MemoryRegionSection section;
 
     virtio_mmio_bus = qdev_get_parent_bus(dev);
     virtio_mmio_proxy = VIRTIO_MMIO(virtio_mmio_bus->parent);
@@ -757,17 +757,18 @@ static char *virtio_mmio_bus_get_dev_path(DeviceState *dev)
     }
 
     /* Otherwise, we append the base address of the transport. */
-    proxy_sbd = SYS_BUS_DEVICE(virtio_mmio_proxy);
-    assert(proxy_sbd->num_mmio == 1);
-    assert(proxy_sbd->mmio[0].memory == &virtio_mmio_proxy->iomem);
+    section = memory_region_find(&virtio_mmio_proxy->iomem, 0, 0x200);
+    assert(section.mr);
 
     if (proxy_path) {
         path = g_strdup_printf("%s/virtio-mmio@" TARGET_FMT_plx, proxy_path,
-                               proxy_sbd->mmio[0].addr);
+                               section.offset_within_address_space);
     } else {
         path = g_strdup_printf("virtio-mmio@" TARGET_FMT_plx,
-                               proxy_sbd->mmio[0].addr);
+                               section.offset_within_address_space);
     }
+    memory_region_unref(section.mr);
+
     g_free(proxy_path);
     return path;
 }
-- 
2.30.1


