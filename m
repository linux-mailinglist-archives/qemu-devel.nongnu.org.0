Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C263B8665
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 17:41:49 +0200 (CEST)
Received: from localhost ([::1]:47102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lycLU-0003iO-Oz
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 11:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lycCH-0004wN-W9
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:32:18 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:37400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lycC5-00057l-A0
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:32:17 -0400
Received: by mail-qt1-x831.google.com with SMTP id h3so1728474qto.4
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 08:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U0or+meyzS1O1E+bq0AooMFJPTAGgN/3BFQxbM2exMk=;
 b=LSlk9yiAyx23mNos4Ii+Hrt7U1+pYR0qPKSQirYhL1+Vea13IatdBOP5kT6B7lvaNQ
 DRcW+ySZunzV2aBt4nI9Cy6nnYmg5cyuVXuMpDrY/vctEFCIYqBA96bgi0O5bv2uHmWZ
 pHdg60pfHQO7HefgoFHbLLpJoapLBqGoTG3Krr3wu2DaRt5+0L7xcIjxscLm2H1vjUNk
 4AezCMEOI+9cw+u7IiQEOKNJA3m4Xq/0yfugP6MPwOM0/glNAz3xilnvO/sD6f5amxzB
 6GRZh+oBu6+g6z9C8qZLnpNaxjchmCREEpJr3No0s++RLap2pu8KP/78a4Qw0D9d1Hjd
 2a7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U0or+meyzS1O1E+bq0AooMFJPTAGgN/3BFQxbM2exMk=;
 b=YBuHDhvhSaBXzMiW1se22NnS2xLJ0scqaTPNe5cCh4chvIfDGQ3qGBwB87ofmwk9aL
 Nd5JVH1tIIGGd7lB1EPcuc0Hi8fLB+uylYp3t3InlQSH9layJ11eXn98DsV+GhxzXuH4
 G0zw4Nmjl/c7/LQUsuFVC7+2rbsjmEeaI1sha5WO+tbtEff2Du5PzqqYiN9T98Pds64E
 n0YtmBaJ1RNToZFpS3zY7u2R5dr3iBM+uI8mcWCiY6JsGuQR/u3WuJ/N7v4JR7cCni/6
 G1sSFpIRfG6/umduvj6CIXK6wBTI+p1duqvQH8BWbNfLPYSwS97M5nUaCNGlTcDFR4nh
 MZyg==
X-Gm-Message-State: AOAM530pwvzTC94iN3/qkfGOFfc0GXacSipRFVwlF5h6wGXmyXD0zi2f
 QEp1Tf6N7N5XeQZs2RX3dHjSuw==
X-Google-Smtp-Source: ABdhPJwvkeeqvIF7zeSK+Tf9b2paeW0rDkT2tCLsTJArFR09lG51Wfp0SsCvfFOkjM8kBD7Bqi1LlQ==
X-Received: by 2002:ac8:4a8c:: with SMTP id l12mr32160021qtq.234.1625067124436; 
 Wed, 30 Jun 2021 08:32:04 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id 4sm836131qkm.100.2021.06.30.08.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 08:32:04 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v5 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Date: Wed, 30 Jun 2021 11:31:53 -0400
Message-Id: <20210630153156.9421-8-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210630153156.9421-1-shashi.mallela@linaro.org>
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x831.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Included creation of ITS as part of SBSA platform GIC
initialization.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/arm/sbsa-ref.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 43c19b4923..3d9c073636 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -34,7 +34,7 @@
 #include "hw/boards.h"
 #include "hw/ide/internal.h"
 #include "hw/ide/ahci_internal.h"
-#include "hw/intc/arm_gicv3_common.h"
+#include "hw/intc/arm_gicv3_its_common.h"
 #include "hw/loader.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/qdev-properties.h"
@@ -64,6 +64,7 @@ enum {
     SBSA_CPUPERIPHS,
     SBSA_GIC_DIST,
     SBSA_GIC_REDIST,
+    SBSA_GIC_ITS,
     SBSA_SECURE_EC,
     SBSA_GWDT,
     SBSA_GWDT_REFRESH,
@@ -107,6 +108,7 @@ static const MemMapEntry sbsa_ref_memmap[] = {
     [SBSA_CPUPERIPHS] =         { 0x40000000, 0x00040000 },
     [SBSA_GIC_DIST] =           { 0x40060000, 0x00010000 },
     [SBSA_GIC_REDIST] =         { 0x40080000, 0x04000000 },
+    [SBSA_GIC_ITS] =            { 0x44090000, 0x00020000 },
     [SBSA_SECURE_EC] =          { 0x50000000, 0x00001000 },
     [SBSA_GWDT_REFRESH] =       { 0x50010000, 0x00001000 },
     [SBSA_GWDT_CONTROL] =       { 0x50011000, 0x00001000 },
@@ -377,7 +379,20 @@ static void create_secure_ram(SBSAMachineState *sms,
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
@@ -404,6 +419,10 @@ static void create_gic(SBSAMachineState *sms)
     qdev_prop_set_uint32(sms->gic, "len-redist-region-count", 1);
     qdev_prop_set_uint32(sms->gic, "redist-region-count[0]", redist0_count);
 
+    object_property_set_link(OBJECT(sms->gic), "sysmem", OBJECT(mem),
+                                 &error_fatal);
+    qdev_prop_set_bit(sms->gic, "has-lpi", true);
+
     gicbusdev = SYS_BUS_DEVICE(sms->gic);
     sysbus_realize_and_unref(gicbusdev, &error_fatal);
     sysbus_mmio_map(gicbusdev, 0, sbsa_ref_memmap[SBSA_GIC_DIST].base);
@@ -450,6 +469,7 @@ static void create_gic(SBSAMachineState *sms)
         sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
     }
+    create_its(sms);
 }
 
 static void create_uart(const SBSAMachineState *sms, int uart,
@@ -762,7 +782,7 @@ static void sbsa_ref_init(MachineState *machine)
 
     create_secure_ram(sms, secure_sysmem);
 
-    create_gic(sms);
+    create_gic(sms, sysmem);
 
     create_uart(sms, SBSA_UART, sysmem, serial_hd(0));
     create_uart(sms, SBSA_SECURE_UART, secure_sysmem, serial_hd(1));
-- 
2.27.0


