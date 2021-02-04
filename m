Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6D330ECD8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 08:01:21 +0100 (CET)
Received: from localhost ([::1]:43584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Ydj-0003kC-Ij
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 02:01:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>) id 1l7YbQ-0002qg-8u
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 01:58:56 -0500
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:40500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>) id 1l7YbO-0004XP-6U
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 01:58:56 -0500
Received: by mail-io1-xd33.google.com with SMTP id n2so2115901iom.7
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 22:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=rMAll4xewdl8R6EJ6rvmNvubbx2IgHPMT8zmUwgxp8A=;
 b=khPq4AhmQ31KuJN9UVKGGdxWlajl9H95Kke8RR36rbbkPoQBf7rHooevFF4Va4qQ0F
 GZvTL+T8LulMINqH9tPGrkszWO78o3QKjYQqRops2y48urzLTiOTQQj94nev+CUGUJRo
 vJqXk6aTHv/R0ofO8CcD8IEq44mMulT3GuNa2HwJiz5PphnzL2xJnfdDbQqnXcgZBAYH
 psVaIQAwJyRPspwf3Vwx7Pv6Zt7y84XOfAD3/sct5JixeYjo4gpQvejg8xevmCAgwkaL
 dVVemNVZ4yb33d1DJfq0gOjGJ5OjjPCbnyJlyyYklotFfKZJX7BhoNUNLLvaZjDPjPvQ
 vJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=rMAll4xewdl8R6EJ6rvmNvubbx2IgHPMT8zmUwgxp8A=;
 b=pUMzDznnqqCACL3dn3ti7wK+3w/R/tRgQyUyNqSg74h0+rrNNFm5zNFpOOjNmXoZc7
 y0haXaDmZhKLJ+IJSLYrbKZ9JVLeE4774oSfm8k7TmkS5VlRkvhrk0ZQsiALmFRxtDAY
 C90uqBsxOXpv6tr6Md6JPF/m19CLXS2NpoGe1aMPdsI45QToxczwOdJkCDZ/ds98WPkM
 /nZG5xWSjoemqa1qTfyKOrJaAzWINXa4Gm+9KqDgdwuglBWJey/MaVuHlpysqrFA3tbq
 58aXeOh6ruT/RpDZWRcUp2YbrzDh7k1Wuepr6FHypLV3jSvQwRzpbBDMBcjOkKpaCT5G
 upNA==
X-Gm-Message-State: AOAM532KFCOOKH0PQEsXC6JNPGZZH51WoH8bSbUtLzWxWTHquR7YK4lW
 bK0o6s+qNTpe7dSipzlOSjrUf+EMTEuT/A==
X-Google-Smtp-Source: ABdhPJyjGQryzLXajBDdfSHDbndvGnTaZDyTkIpATf/MWg6jjKf6+8W0NfSt3NcKxh1y68/RHjFD0Q==
X-Received: by 2002:a02:7710:: with SMTP id g16mr6667484jac.83.1612421932062; 
 Wed, 03 Feb 2021 22:58:52 -0800 (PST)
Received: from [127.0.0.1] (ec2-3-14-82-192.us-east-2.compute.amazonaws.com.
 [3.14.82.192])
 by smtp.gmail.com with ESMTPSA id m4sm2170224ilc.53.2021.02.03.22.58.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 22:58:51 -0800 (PST)
Message-ID: <3362132240927a23ecca7b9d8cfd6e4130509eea.camel@gmail.com>
Subject: [PATCH] arm: xlnx-versal: fix virtio-mmio base address assignment
From: schspa <schspa@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 04 Feb 2021 14:58:49 +0800
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=schspa@gmail.com; helo=mail-io1-xd33.google.com
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

This problem was fixed on arm virt platform in patch
 
https://lists.nongnu.org/archive/html/qemu-devel/2016-07/msg01119.html

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

We can solve this by simply assign mmio[0].addr directly. makes
virtio_mmio_bus_get_dev_path to produce correct unique device path.

Signed-off-by: schspa <schspa@gmail.com>
---
 hw/arm/xlnx-versal-virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 8482cd6196..87b92ec6c3 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -490,6 +490,7 @@ static void create_virtio_regions(VersalVirt *s)
         object_property_add_child(OBJECT(&s->soc), name, OBJECT(dev));
         sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic_irq);
+        SYS_BUS_DEVICE(dev)->mmio[0].addr = base;
         mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
         memory_region_add_subregion(&s->soc.mr_ps, base, mr);
         g_free(name);
-- 
2.30.0



