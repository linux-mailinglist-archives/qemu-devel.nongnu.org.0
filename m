Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 868884F987E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:45:50 +0200 (CEST)
Received: from localhost ([::1]:38644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncprx-0006pG-Jy
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPc-0007So-Ko
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:32 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:34180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPa-0002UK-BQ
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:32 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 j5-20020a05600c1c0500b0038ea8b53580so809197wms.1
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dkdiantr7+5+MkqtF+jpkZPTMHRoOYAGUVHwgCU5zUs=;
 b=awDZuFViW4CzES0ipTulLrOFw5PZHjsIpQ8/O5kqBzCUjYLhz3EtP9oPtibVtZ+y8h
 Nc0vychcetchJio0VczJF9flW+jEfQCKQkr4ywJqsmgEd+aiCGDPRf1Rc0U6EbMGxFq4
 JaBf7YxEmYy0gj01ld2wLQK0cVtJR/ogN8SkPpsgfv0CL3cwKQnY64o9PhJeGX2H5Za/
 XnkpICuZueXeS/RCyD4DxTodojzo+fRoTitsI7O6qLTEmnS6q0JQgC02YE5X83qcnZgS
 OtBXo5tUYtt3xoiF8k1osau/OvdJricHKTd/Gd1YQWSJ12xR7BkKXA8RX25izOgqThMg
 GzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dkdiantr7+5+MkqtF+jpkZPTMHRoOYAGUVHwgCU5zUs=;
 b=H13mWpfbs0rMHRJ2uQTwxCen5ponYXHcqEPu2V8q9WNSfDQMpSytPW/rbZ/kInAn2x
 k0/ueJYzEcBfkh8EoVhM57MxDonL5qd+IXBG5jYt8FaMK+XSU1uyvNVYpDciB7yqckVu
 ZikbRxC5BvHM9Dw0ru/bQeMP+5VgoXQ0919keUAG5PneLOq64/567mBGcjvoodD+/Ki2
 Q+bTG3hdCbrBcjzUu6a9fROebz+9Qpxu8r4hIaar1FO8fHG7Gxxv4ZfKPzgKyulUHyl5
 neFFpG29r8qTZ5E626Snzel9XLHEVjv0if1CGYqGfMl15xQWPd8ibHbUY1h0ObbIRRGW
 fQcw==
X-Gm-Message-State: AOAM530PBzmJs+rI+5WOJ4/tVAcOeiy8UEmToyjnE1YJbo8KdJqCChJL
 GmMRUbqleXMBlRdsBrNrq9QrSwISnc3wbw==
X-Google-Smtp-Source: ABdhPJxmg4Hf9kgq3xEedMt3LiwB1ooQdt7HkrkFJ/PdI10cj3Yi5r2361IXBVhjUCTwQts++trN6g==
X-Received: by 2002:a1c:7517:0:b0:38c:8722:9bc6 with SMTP id
 o23-20020a1c7517000000b0038c87229bc6mr17170265wmc.2.1649427389031; 
 Fri, 08 Apr 2022 07:16:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 39/41] hw/arm/virt: Use VIRT_GIC_VERSION_* enum values in
 create_gic()
Date: Fri,  8 Apr 2022 15:15:48 +0100
Message-Id: <20220408141550.1271295-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
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
---
 hw/arm/virt.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d2e5ecd234a..594a3d0660a 100644
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


