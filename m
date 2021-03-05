Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3669432F195
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:44:25 +0100 (CET)
Received: from localhost ([::1]:34732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEUy-0007F8-7l
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:44:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE34-0006gB-8y
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:35 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:37413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE2y-0007Ub-Q9
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:33 -0500
Received: by mail-wr1-x443.google.com with SMTP id v15so2900537wrx.4
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1hZbYyyaW21TUYFrtCeMy7FScF2J9YFU1u0WZB6SgUg=;
 b=vUA6VPBLPe242oraiQfLtPvmorEzkDVdiIjuXe3hUaBd/eSrVLZUK2Ss0RjpEfGCCG
 sWjv2r0MvVIQbDRM8Ht+dSj3ElML7+JKMlotGlCYFopg8k1syhTcFnf3fIXuWWWS8R1V
 bovPM3exNIVmuHvqJqMjwxK+zjAaZdlivtIG04K/7DjhIyTewfXk3gh3Y9mcIhwJIR2e
 3ZBhiMxS64oBvmLdC0mOK5qx/Wv3kHKXH/K0YsDoGdb8+0rGQmRQiZ+C4Fnzs8xrqhYW
 E1r3+v2DWI5vD6b+wL3DD1tw3MMEjnsuqH7Lb3ThVOFfch5uHlFxBwTmup9L1nqxYWwx
 jqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1hZbYyyaW21TUYFrtCeMy7FScF2J9YFU1u0WZB6SgUg=;
 b=MR1MDTfCPFsRKbsItVwh/rX5WkDmXYP9vOCQqaxxbhceHAv4M2k/b7OYWs2qz+p3WM
 2RZxHVIRuJCsI501sMN70FG5dz/F5X+GiFUFbIn9rvTLIDEGXKdSgtuGZPJBiuu+6DWs
 mX74pdNkF2h0EVPnDvdMBKtwVcEBEL9OYps9WN6W0+uX2jhu+pPlCSZG9y+lOVLx6Wzc
 u5EHYRlW16UwUCM4vKvLpcz+ZbXkZolxc14OTGQGY6uiB0lvPu9ZzmhyNa5LRNjemVtF
 fLzmAYXo5edN8ztcf5MIiQutqwTM0IjLog2/UHnM2EZgAgB0HeBPMEpqfL9XpUo4GZ/O
 wDCw==
X-Gm-Message-State: AOAM5305Qzzndr1Y0v1coTXtUE3Gm7bH7Db4mF44hUjJ/W04i1Lu0/zh
 28sb5wNZFqIQ/AXJrWYSUzDIAb/QhAUMIg==
X-Google-Smtp-Source: ABdhPJwZWQiUT85Wg4pyJoF2OxxAUsYzy86d6aQZ7DRmRNzzADQqe66PAtaso8RWqythRdLH4RkjeQ==
X-Received: by 2002:a5d:4cc9:: with SMTP id c9mr10820752wrt.63.1614964526806; 
 Fri, 05 Mar 2021 09:15:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/49] virtio-mmio: improve virtio-mmio get_dev_path alog
Date: Fri,  5 Mar 2021 17:14:38 +0000
Message-Id: <20210305171515.1038-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: schspa <schspa@gmail.com>

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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/virtio/virtio-mmio.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 610661d6a52..6990b9879cf 100644
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
2.20.1


