Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2BB2D59A1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 12:51:11 +0100 (CET)
Received: from localhost ([::1]:36764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKTV-0002zb-Sm
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 06:51:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQh-0001If-58
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:15 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:38378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQW-0006yE-GI
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:14 -0500
Received: by mail-wm1-x331.google.com with SMTP id g185so4989288wmf.3
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=W2PjLxacECPQUW4eCpZKhew0wzGcffw3W4zjesTZu74=;
 b=lTHONRYc7x6DtgP3KHAgS7RSjJQmQKFd12HUTSMSwBigpNxbWLh+8tEaygbfhJLDXk
 kTxtJ7QutF8OGoeaj+7es6ClgtaPQWtwyrWFoVE6zZ5vKDlVasUeNlxnDjpZ1g7H+vdW
 nYuWL2Ke0wKJ5c+iZehtEvtbWSzAFxgCggu8mTpqthZ+KU18wdExTDs/8CVvKTBLIJPF
 QZxS2siOPG5uDYchGEb9qOWRLeZTSMIG2u43y35ugr9NQ5gtYsR600E9ykRChl4sTtOS
 aL8RgHa9diQ+A2sBHDD62Q0ZyQ8EXeHBcUHYTF3rKKT61tTTonAD2ZMfuM8gjwapjSBP
 6egw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W2PjLxacECPQUW4eCpZKhew0wzGcffw3W4zjesTZu74=;
 b=egYZ3u3YxZ436Um8HR9LW6hhFkABOVbc42TVlWLgt0C1cHzeU0A7G4qkL9GLooMRZu
 a70G/04n8UtJgWjMz9WYYyXv/pHDf/qm+e3VJ3BaFQQdBmSQv8Yz9NEymL4bqsTinrA5
 J1LSTHu8GEi/z9TcAGOibUKr2R/jkSlwYt1CClOzDfIgmjEB6XmtPDRUFeCP03l/YO4l
 pbDpasXwjguFhPxbrF2rnteO+dh82uzLkonY6fl1cqdjkuN+Ht5YGSOiJkKg4G8Zb4fd
 2TozbD9YsrcJj7C1tTXJvIX4gheptVi4Kk6ORzhKQCKjFtsvRIrEwgNyLzl94uVftEu4
 BGfw==
X-Gm-Message-State: AOAM532fb9mSwpcCurMISo391VBcnTmECzGYh5+39DQz7NHChN08pUpm
 JwlFuBpK6uk98WGe/fR9Putd07jtSfPbqQ==
X-Google-Smtp-Source: ABdhPJz8roiIEqil9sxSi7Sq+49bvAXB0Q4YBxbimBbYYP/HGJP8dxtAVEvJ+YDjB93/YtP4CSLKkg==
X-Received: by 2002:a1c:454:: with SMTP id 81mr7767405wme.178.1607600882830;
 Thu, 10 Dec 2020 03:48:02 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/36] xlnx-zynqmp: Connect Xilinx ZynqMP CAN controllers
Date: Thu, 10 Dec 2020 11:47:23 +0000
Message-Id: <20201210114756.16501-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

From: Vikram Garhwal <fnu.vikram@xilinx.com>

Connect CAN0 and CAN1 on the ZynqMP.

Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Message-id: 1605728926-352690-3-git-send-email-fnu.vikram@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/xlnx-zynqmp.h |  8 ++++++++
 hw/arm/xlnx-zcu102.c         | 20 ++++++++++++++++++++
 hw/arm/xlnx-zynqmp.c         | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 567d0dba09b..6f45387a173 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -22,6 +22,7 @@
 #include "hw/intc/arm_gic.h"
 #include "hw/net/cadence_gem.h"
 #include "hw/char/cadence_uart.h"
+#include "hw/net/xlnx-zynqmp-can.h"
 #include "hw/ide/ahci.h"
 #include "hw/sd/sdhci.h"
 #include "hw/ssi/xilinx_spips.h"
@@ -33,6 +34,7 @@
 #include "hw/cpu/cluster.h"
 #include "target/arm/cpu.h"
 #include "qom/object.h"
+#include "net/can_emu.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx,zynqmp"
 OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
@@ -41,6 +43,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
 #define XLNX_ZYNQMP_NUM_RPU_CPUS 2
 #define XLNX_ZYNQMP_NUM_GEMS 4
 #define XLNX_ZYNQMP_NUM_UARTS 2
+#define XLNX_ZYNQMP_NUM_CAN 2
+#define XLNX_ZYNQMP_CAN_REF_CLK (24 * 1000 * 1000)
 #define XLNX_ZYNQMP_NUM_SDHCI 2
 #define XLNX_ZYNQMP_NUM_SPIS 2
 #define XLNX_ZYNQMP_NUM_GDMA_CH 8
@@ -92,6 +96,7 @@ struct XlnxZynqMPState {
 
     CadenceGEMState gem[XLNX_ZYNQMP_NUM_GEMS];
     CadenceUARTState uart[XLNX_ZYNQMP_NUM_UARTS];
+    XlnxZynqMPCANState can[XLNX_ZYNQMP_NUM_CAN];
     SysbusAHCIState sata;
     SDHCIState sdhci[XLNX_ZYNQMP_NUM_SDHCI];
     XilinxSPIPS spi[XLNX_ZYNQMP_NUM_SPIS];
@@ -112,6 +117,9 @@ struct XlnxZynqMPState {
     bool virt;
     /* Has the RPU subsystem?  */
     bool has_rpu;
+
+    /* CAN bus. */
+    CanBusState *canbus[XLNX_ZYNQMP_NUM_CAN];
 };
 
 #endif
diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index ad7fff9697b..4ef0c516bfd 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -25,6 +25,7 @@
 #include "sysemu/qtest.h"
 #include "sysemu/device_tree.h"
 #include "qom/object.h"
+#include "net/can_emu.h"
 
 struct XlnxZCU102 {
     MachineState parent_obj;
@@ -34,6 +35,8 @@ struct XlnxZCU102 {
     bool secure;
     bool virt;
 
+    CanBusState *canbus[XLNX_ZYNQMP_NUM_CAN];
+
     struct arm_boot_info binfo;
 };
 
@@ -125,6 +128,14 @@ static void xlnx_zcu102_init(MachineState *machine)
     object_property_set_bool(OBJECT(&s->soc), "virtualization", s->virt,
                              &error_fatal);
 
+    for (i = 0; i < XLNX_ZYNQMP_NUM_CAN; i++) {
+        gchar *bus_name = g_strdup_printf("canbus%d", i);
+
+        object_property_set_link(OBJECT(&s->soc), bus_name,
+                                 OBJECT(s->canbus[i]), &error_fatal);
+        g_free(bus_name);
+    }
+
     qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
 
     /* Create and plug in the SD cards */
@@ -208,6 +219,15 @@ static void xlnx_zcu102_machine_instance_init(Object *obj)
     s->secure = false;
     /* Default to virt (EL2) being disabled */
     s->virt = false;
+    object_property_add_link(obj, "xlnx-zcu102.canbus0", TYPE_CAN_BUS,
+                             (Object **)&s->canbus[0],
+                             object_property_allow_set_link,
+                             0);
+
+    object_property_add_link(obj, "xlnx-zcu102.canbus1", TYPE_CAN_BUS,
+                             (Object **)&s->canbus[1],
+                             object_property_allow_set_link,
+                             0);
 }
 
 static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 7885bb17745..881847255b4 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -81,6 +81,14 @@ static const int uart_intr[XLNX_ZYNQMP_NUM_UARTS] = {
     21, 22,
 };
 
+static const uint64_t can_addr[XLNX_ZYNQMP_NUM_CAN] = {
+    0xFF060000, 0xFF070000,
+};
+
+static const int can_intr[XLNX_ZYNQMP_NUM_CAN] = {
+    23, 24,
+};
+
 static const uint64_t sdhci_addr[XLNX_ZYNQMP_NUM_SDHCI] = {
     0xFF160000, 0xFF170000,
 };
@@ -243,6 +251,11 @@ static void xlnx_zynqmp_init(Object *obj)
                                 TYPE_CADENCE_UART);
     }
 
+    for (i = 0; i < XLNX_ZYNQMP_NUM_CAN; i++) {
+        object_initialize_child(obj, "can[*]", &s->can[i],
+                                TYPE_XLNX_ZYNQMP_CAN);
+    }
+
     object_initialize_child(obj, "sata", &s->sata, TYPE_SYSBUS_AHCI);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
@@ -482,6 +495,23 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
                            gic_spi[uart_intr[i]]);
     }
 
+    for (i = 0; i < XLNX_ZYNQMP_NUM_CAN; i++) {
+        object_property_set_int(OBJECT(&s->can[i]), "ext_clk_freq",
+                                XLNX_ZYNQMP_CAN_REF_CLK, &error_abort);
+
+        object_property_set_link(OBJECT(&s->can[i]), "canbus",
+                                 OBJECT(s->canbus[i]), &error_fatal);
+
+        sysbus_realize(SYS_BUS_DEVICE(&s->can[i]), &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->can[i]), 0, can_addr[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->can[i]), 0,
+                           gic_spi[can_intr[i]]);
+    }
+
     object_property_set_int(OBJECT(&s->sata), "num-ports", SATA_NUM_PORTS,
                             &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->sata), errp)) {
@@ -619,6 +649,10 @@ static Property xlnx_zynqmp_props[] = {
     DEFINE_PROP_BOOL("has_rpu", XlnxZynqMPState, has_rpu, false),
     DEFINE_PROP_LINK("ddr-ram", XlnxZynqMPState, ddr_ram, TYPE_MEMORY_REGION,
                      MemoryRegion *),
+    DEFINE_PROP_LINK("canbus0", XlnxZynqMPState, canbus[0], TYPE_CAN_BUS,
+                     CanBusState *),
+    DEFINE_PROP_LINK("canbus1", XlnxZynqMPState, canbus[1], TYPE_CAN_BUS,
+                     CanBusState *),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.20.1


