Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8933456A4
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 05:19:15 +0100 (CET)
Received: from localhost ([::1]:37024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOYVe-0006u6-Um
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 00:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lOYPp-0000qK-Q3
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 00:13:13 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:37416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lOYPO-0006cl-40
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 00:13:13 -0400
Received: by mail-qk1-x733.google.com with SMTP id g15so13129172qkl.4
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 21:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wi/6RMFD9QHoWMG50SCOYWnSVhyjzRhsQvs0OtM7umo=;
 b=YavFE91R9Vb/1TGYJ3DBFhoideQrhCEE2tQ8xRjZ5V4UTt+IeYnnfsZoRQ1p29sjDc
 A3gyKP/e73jqm8mlsIaakdY06gyNMVd3oJLMuNtJe1+jIEOV5QmCeoccZCr7hl4pcyHF
 C8aZyRJO1lJQitAsoLQGKmL5UeMBs9jGMLkajzmB/hW7fMQbQK+YU1KTaD2BHtjcbelr
 g6iUmUnvT5TO5x6B/y5gNUpo4opkHRtC8SP7QC1piyjpS5bGRN+8VvM9SOGt+ZnVS3SD
 7SoZTtwKJ6wCW95Eu+5+7k5J61MWoBf09YuUlfgdjs8dV6/9G3tDk1g9OFOTJsT8ZBWd
 vMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wi/6RMFD9QHoWMG50SCOYWnSVhyjzRhsQvs0OtM7umo=;
 b=Rgyj7pOyEQPpZfBu0z5jc+ZcOArJbKfNek+Tst+pW2Zl5S00l+wLuTN1PZRFTIKTBw
 z4tF1C4U/pDqq+afJKBSXO5dLgxNGV1nzo8bW+ikRBCrq04+L1fexCezjvw3dqPW5k9r
 BMPpwkYWYs9ZXo8uHX2jMuBegaOAHrepsuCesGnhOMtRFk3+OdPql5bZ1/wE7VaU4ZTS
 Lj17GcJpmrjR6jnd6fo6PWkRSfeK4qQUFkHzu9zZiCliUV9IroprIMQKr16g0wA5vQYa
 HvnCtB+RgjqDaxWx0kATYswBtnyAis6F26CCqijzrko6hGBruUWSkJIiZg3XNUB+uOiu
 uFoA==
X-Gm-Message-State: AOAM533MFepIdAAUuz32Vu/e0FRqdGsbczx4Xu0Lumh5o6sb7LKf0S4p
 RzXnM5Nr2JRWEoU4LgA2Vy+NJg==
X-Google-Smtp-Source: ABdhPJzfJlu3nbQ/9ueU/t4WMft5xvHIRlm0LlOcGMuPHI1HMflT0gYs1ejzUpbX17XQeE/hgTDPsg==
X-Received: by 2002:a37:a0d1:: with SMTP id j200mr3625105qke.426.1616472765321; 
 Mon, 22 Mar 2021 21:12:45 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id m21sm12601181qka.28.2021.03.22.21.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 21:12:45 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v1 7/8] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Date: Tue, 23 Mar 2021 00:12:37 -0400
Message-Id: <20210323041238.133835-8-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210323041238.133835-1-shashi.mallela@linaro.org>
References: <20210323041238.133835-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x733.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Included creation of ITS as part of SBSA platform GIC
initialization.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/arm/sbsa-ref.c | 26 +++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 88dfb2284c..d05cbcae48 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -35,7 +35,7 @@
 #include "hw/boards.h"
 #include "hw/ide/internal.h"
 #include "hw/ide/ahci_internal.h"
-#include "hw/intc/arm_gicv3_common.h"
+#include "hw/intc/arm_gicv3_its_common.h"
 #include "hw/loader.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/qdev-properties.h"
@@ -65,6 +65,7 @@ enum {
     SBSA_CPUPERIPHS,
     SBSA_GIC_DIST,
     SBSA_GIC_REDIST,
+    SBSA_GIC_ITS,
     SBSA_SECURE_EC,
     SBSA_GWDT,
     SBSA_GWDT_REFRESH,
@@ -108,6 +109,7 @@ static const MemMapEntry sbsa_ref_memmap[] = {
     [SBSA_CPUPERIPHS] =         { 0x40000000, 0x00040000 },
     [SBSA_GIC_DIST] =           { 0x40060000, 0x00010000 },
     [SBSA_GIC_REDIST] =         { 0x40080000, 0x04000000 },
+    [SBSA_GIC_ITS] =            { 0x44090000, 0x00020000 },
     [SBSA_SECURE_EC] =          { 0x50000000, 0x00001000 },
     [SBSA_GWDT_REFRESH] =       { 0x50010000, 0x00001000 },
     [SBSA_GWDT_CONTROL] =       { 0x50011000, 0x00001000 },
@@ -378,7 +380,20 @@ static void create_secure_ram(SBSAMachineState *sms,
     memory_region_add_subregion(secure_sysmem, base, secram);
 }
 
-static void create_gic(SBSAMachineState *sms)
+static void create_its(SBSAMachineState *sms)
+{
+    DeviceState *dev;
+
+    dev = qdev_new(TYPE_ARM_GICV3_ITS);
+    SysBusDevice *s = SYS_BUS_DEVICE(dev);
+
+    object_property_set_link(OBJECT(dev), "parent-gicv3", OBJECT(sms->gic),
+                             &error_abort);
+    sysbus_realize_and_unref(s, &error_fatal);
+    sysbus_mmio_map(s, 0, sbsa_ref_memmap[SBSA_GIC_ITS].base);
+}
+
+static void create_gic(SBSAMachineState *sms, MemoryRegion *mem)
 {
     unsigned int smp_cpus = MACHINE(sms)->smp.cpus;
     SysBusDevice *gicbusdev;
@@ -405,6 +420,10 @@ static void create_gic(SBSAMachineState *sms)
     qdev_prop_set_uint32(sms->gic, "len-redist-region-count", 1);
     qdev_prop_set_uint32(sms->gic, "redist-region-count[0]", redist0_count);
 
+    object_property_set_link(OBJECT(sms->gic), "sysmem", OBJECT(mem),
+                                 &error_fatal);
+    qdev_prop_set_bit(sms->gic, "has-lpi", true);
+
     gicbusdev = SYS_BUS_DEVICE(sms->gic);
     sysbus_realize_and_unref(gicbusdev, &error_fatal);
     sysbus_mmio_map(gicbusdev, 0, sbsa_ref_memmap[SBSA_GIC_DIST].base);
@@ -451,6 +470,7 @@ static void create_gic(SBSAMachineState *sms)
         sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
     }
+    create_its(sms);
 }
 
 static void create_uart(const SBSAMachineState *sms, int uart,
@@ -763,7 +783,7 @@ static void sbsa_ref_init(MachineState *machine)
 
     create_secure_ram(sms, secure_sysmem);
 
-    create_gic(sms);
+    create_gic(sms, sysmem);
 
     create_uart(sms, SBSA_UART, sysmem, serial_hd(0));
     create_uart(sms, SBSA_SECURE_UART, secure_sysmem, serial_hd(1));
-- 
2.27.0


