Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E60250B5C9
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:58:41 +0200 (CEST)
Received: from localhost ([::1]:56636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqzo-0003Ma-IP
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqA5-000524-Mo
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:14 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqA3-0002s7-UC
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:13 -0400
Received: by mail-wr1-x436.google.com with SMTP id h25so4284450wrc.13
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ppb9q2JdzKJCAX+yRCeZ8lM7X4SqlcHbmDsxajJSFyc=;
 b=s7PdLcKjTNz1AkMbEHtcT0M4CDCfvXob/oxUbEsA9v/Wx6bT8s7+w7DIqx9BjCIRVD
 FMIC0GNI2IJyBnd6VWBloWMEnZ85NR29HvuOjfWYpBPIVBS48eCgdxx9gIPq7r/aA6LN
 SaEqMWRc8VjDgqBp+qT2lv5PRilXvjknI0tNXH1/ZMiNhBkaRNZmjgpiFU+n//IZap3M
 XWRAP2SxwsoeUCIbuyFx8utr7kY+CAKcba26dFA4L8srzvtkgmtGI4aAAgvRd+MoXI8B
 +nIxcCBGWtZPf7r0LW4XcQj/hXQjfeId7Gzv41c/qusMr3SFt1mWHj95hngfMXUJe1e/
 mqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ppb9q2JdzKJCAX+yRCeZ8lM7X4SqlcHbmDsxajJSFyc=;
 b=H8sI4fUxpi1IJrJR39prP03YvXk8YVTu93sbua5DcOnn9mf2HPGr1RV/jxvv1UgStG
 2WYxbdEmC0Gzzjgyk+UUGMXeVD9vv2z+B5QTCuQKrMMGeaWNI57KwZLUgr0q7CVS/fes
 KomyJKC7zte97Z8vR5N679Nm7LDgGHTXnBBlo7mlvQh7u70KzZY+VG05XQwrSkVZmW7i
 mhgqOKv7CPSuAie/2H3RFRWpdY2Cg0Wp+mK99AOC9aqT9wa26bsHEFVxs4ypC4Aets+x
 a9ga0ehkjhVj/wVo4noW9LIcGuQ620wBNOIJSDMPlI+OZxOvf2Y83bzrGeIzvXPC0BcP
 n6OQ==
X-Gm-Message-State: AOAM533SOBdABaK1bMhT33M5fdDaBOJRCIK0n1C6OYWj5NVDyubcA0b+
 hUY3W1DkHI0s+d3m1vhpeI3kHC7aK8obUA==
X-Google-Smtp-Source: ABdhPJwMlrxICw81DoPq42UPOLv07AXtOu2Kvnj3OQFT6+5HYf2yV4RIVb5DjkVOMRle6/CL9gPybg==
X-Received: by 2002:a5d:4b45:0:b0:207:ab91:edd8 with SMTP id
 w5-20020a5d4b45000000b00207ab91edd8mr3100939wrs.168.1650621910662; 
 Fri, 22 Apr 2022 03:05:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 39/61] hw/arm/virt: Use VIRT_GIC_VERSION_* enum values in
 create_gic()
Date: Fri, 22 Apr 2022 11:04:10 +0100
Message-Id: <20220422100432.2288247-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Everywhere we need to check which GIC version we're using, we look at
vms->gic_version and use the VIRT_GIC_VERSION_* enum values, except
in create_gic(), which copies vms->gic_version into a local 'int'
variable and makes direct comparisons against values 2 and 3.

For consistency, change this function to check the GIC version
the same way we do elsewhere. This includes not implicitly relying
on the enumeration type values happening to match the integer
'revision' values the GIC device object wants.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-40-peter.maydell@linaro.org
---
 hw/arm/virt.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index bb6a2484d81..d5f8b0c74ad 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -690,14 +690,29 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     /* We create a standalone GIC */
     SysBusDevice *gicbusdev;
     const char *gictype;
-    int type = vms->gic_version, i;
+    int i;
     unsigned int smp_cpus = ms->smp.cpus;
     uint32_t nb_redist_regions = 0;
+    int revision;
 
-    gictype = (type == 3) ? gicv3_class_name() : gic_class_name();
+    if (vms->gic_version == VIRT_GIC_VERSION_2) {
+        gictype = gic_class_name();
+    } else {
+        gictype = gicv3_class_name();
+    }
 
+    switch (vms->gic_version) {
+    case VIRT_GIC_VERSION_2:
+        revision = 2;
+        break;
+    case VIRT_GIC_VERSION_3:
+        revision = 3;
+        break;
+    default:
+        g_assert_not_reached();
+    }
     vms->gic = qdev_new(gictype);
-    qdev_prop_set_uint32(vms->gic, "revision", type);
+    qdev_prop_set_uint32(vms->gic, "revision", revision);
     qdev_prop_set_uint32(vms->gic, "num-cpu", smp_cpus);
     /* Note that the num-irq property counts both internal and external
      * interrupts; there are always 32 of the former (mandated by GIC spec).
@@ -707,7 +722,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
         qdev_prop_set_bit(vms->gic, "has-security-extensions", vms->secure);
     }
 
-    if (type == 3) {
+    if (vms->gic_version == VIRT_GIC_VERSION_3) {
         uint32_t redist0_capacity =
                     vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZE;
         uint32_t redist0_count = MIN(smp_cpus, redist0_capacity);
@@ -742,7 +757,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     gicbusdev = SYS_BUS_DEVICE(vms->gic);
     sysbus_realize_and_unref(gicbusdev, &error_fatal);
     sysbus_mmio_map(gicbusdev, 0, vms->memmap[VIRT_GIC_DIST].base);
-    if (type == 3) {
+    if (vms->gic_version == VIRT_GIC_VERSION_3) {
         sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_REDIST].base);
         if (nb_redist_regions == 2) {
             sysbus_mmio_map(gicbusdev, 2,
@@ -780,7 +795,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
                                                    ppibase + timer_irq[irq]));
         }
 
-        if (type == 3) {
+        if (vms->gic_version == VIRT_GIC_VERSION_3) {
             qemu_irq irq = qdev_get_gpio_in(vms->gic,
                                             ppibase + ARCH_GIC_MAINT_IRQ);
             qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",
@@ -806,9 +821,9 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 
     fdt_add_gic_node(vms);
 
-    if (type == 3 && vms->its) {
+    if (vms->gic_version == VIRT_GIC_VERSION_3 && vms->its) {
         create_its(vms);
-    } else if (type == 2) {
+    } else if (vms->gic_version == VIRT_GIC_VERSION_2) {
         create_v2m(vms);
     }
 }
-- 
2.25.1


