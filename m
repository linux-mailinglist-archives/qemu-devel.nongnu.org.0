Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7609331BC6F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 16:29:30 +0100 (CET)
Received: from localhost ([::1]:40790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBfoX-0006lC-9o
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 10:29:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1lBfnI-0005ch-H8; Mon, 15 Feb 2021 10:28:12 -0500
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:36532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1lBfnG-0003gy-PK; Mon, 15 Feb 2021 10:28:12 -0500
Received: by mail-qv1-xf31.google.com with SMTP id e9so3285722qvy.3;
 Mon, 15 Feb 2021 07:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=K9dtiB52KD/fCCxMsNsL//tnnQH/CoxVUrg9hMxEj6o=;
 b=POR5zfy1djIUt8zTFSAhqA+NgBTodRGwQT89aSHAS5XXG05Ya9h6B4M293xppWz6+K
 7iDJCOFoe7RpCTy9djZPt5nALA96oZdkaRnKcjrbREcUnLaLLiaimRoIJR0iIZbkz5Nx
 RffRc1zTKE0pypVlmBH6jUPnl1LZCJLx12HzMv8raQS5ksjLU/8lJsPGPbNtOqLmHRqo
 xSQ22cbSjBp3g5xxrcpmzR5vXa0+9zi+8TJk+u6XbdbG67OTyMy8qd+XQqE/jhhx043A
 BQgsYAK4cZTE0Pq03kVx4IbAPZ90atbmKu9ZNTKAi+EE1gNABBgmvfRa8wOVj73U4tYR
 4IwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=K9dtiB52KD/fCCxMsNsL//tnnQH/CoxVUrg9hMxEj6o=;
 b=XRLsqFaOBECtxTBB2eR98oyE7VGwX91BRAJJstv8zt3UK/E/rPwHaZFGvL6FktQgrc
 Rvq06rnGoD5EVesFBHkheJgLQAKWA83wN8dtwiqEyLKniyz4MvCmtjkBfDm+YabXxNd/
 cbHJieBNimmHSYu+kYeQOgarxxCs/+fCO9+KxxpyJYBh8gTgi+y4YqM73rzXHcayRl+M
 pXT9nICowF26LwACziRZ9z34zxhiFlR1IWCW84lKqR/KEQn/+oHADosFIYF8fyraywIA
 3Q7z4knWH8D/GgdnqUu4oxyHHsStIBOJku0W+y0yI8B9aZWu5TZU662PEbcT63QRDfST
 W2Mw==
X-Gm-Message-State: AOAM532vPqtXHoDvwmVrIhRzRwv8jxwYmSvu8G4suLC2kSauyiO0IPSl
 r+7gfzXfr6IPnyNj0nw0aFFD+7vx4IehMBnV
X-Google-Smtp-Source: ABdhPJwF7fDWEURA4BBrJqazpKJaIlBlzSB3aMJmrK6q+SgOWE/GUiY+b3WgpxG6K9NTyJ8s5JpWVg==
X-Received: by 2002:a0c:83a4:: with SMTP id k33mr15283842qva.1.1613402888807; 
 Mon, 15 Feb 2021 07:28:08 -0800 (PST)
Received: from [127.0.0.1] (ec2-3-14-82-192.us-east-2.compute.amazonaws.com.
 [3.14.82.192])
 by smtp.gmail.com with ESMTPSA id r17sm11254239qta.78.2021.02.15.07.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 07:28:08 -0800 (PST)
Message-ID: <74d39c65cc436dd9f23fdf1e7f471b85b05aa52a.camel@gmail.com>
Subject: [PATCH v3] virtio-mmio: improve virtio-mmio unique device path
 assignment
From: schspa <schspa@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Feb 2021 23:27:59 +0800
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=schspa@gmail.com; helo=mail-qv1-xf31.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Kevin Zhao <kevin.zhao@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Markus Armbruster <armbru@redhat.com>
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
 hw/virtio/virtio-mmio.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index e1b5c3b81e..8fc2ccf347 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -731,6 +731,7 @@ static char
*virtio_mmio_bus_get_dev_path(DeviceState *dev)
     char *proxy_path;
     SysBusDevice *proxy_sbd;
     char *path;
+    MemoryRegionSection section;
 
     virtio_mmio_bus = qdev_get_parent_bus(dev);
     virtio_mmio_proxy = VIRTIO_MMIO(virtio_mmio_bus->parent);
@@ -749,17 +750,18 @@ static char
*virtio_mmio_bus_get_dev_path(DeviceState *dev)
     }
 
     /* Otherwise, we append the base address of the transport. */
-    proxy_sbd = SYS_BUS_DEVICE(virtio_mmio_proxy);
-    assert(proxy_sbd->num_mmio == 1);
-    assert(proxy_sbd->mmio[0].memory == &virtio_mmio_proxy->iomem);
+    section = memory_region_find(&virtio_mmio_proxy->iomem, 0, 0x200);
+    assert(section.mr);
 
     if (proxy_path) {
         path = g_strdup_printf("%s/virtio-mmio@" TARGET_FMT_plx,
proxy_path,
-                               proxy_sbd->mmio[0].addr);
+                               section.offset_within_address_space);
     } else {
         path = g_strdup_printf("virtio-mmio@" TARGET_FMT_plx,
-                               proxy_sbd->mmio[0].addr);
+                               section.offset_within_address_space);
     }
+    memory_region_unref(section.mr);
+
     g_free(proxy_path);
     return path;
 }
-- 
2.30.0



