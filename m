Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7523E2EB875
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 04:40:47 +0100 (CET)
Received: from localhost ([::1]:48900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwzgk-0007MF-Go
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 22:40:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzeg-0005XL-7Q; Tue, 05 Jan 2021 22:38:38 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:60159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzed-0006Fm-LV; Tue, 05 Jan 2021 22:38:38 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D9ZpG28fnz9sVy; Wed,  6 Jan 2021 14:38:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609904310;
 bh=WIP3Li0A1RWtQCRsapwk6616aNsCUjuJfUoLZNg9Opg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l0KD/6fUvrYIWmfW2fdSlFMXoW3qPD5bwaNWD1McmnGa/Azb1OtBsPyv0YLiiwCcX
 DS/KhMu9rKLLYRIKiWS/43PCuKxdPCAsWRv8P1jB2E8K/TRbKu3ePvYDXPG+Ko9lyR
 qTwbPY5t9YsemkS7sxc5j30nLDv3Cdo3+aaNXRMM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 03/22] hw/ppc/virtex_ml507: Drop use of ppcuic_init()
Date: Wed,  6 Jan 2021 14:37:57 +1100
Message-Id: <20210106033816.232598-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106033816.232598-1-david@gibson.dropbear.id.au>
References: <20210106033816.232598-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Switch the virtex_ml507 board to directly creating and
configuring the UIC, rather than doing it via the old
ppcuic_init() helper function.

This fixes a trivial Coverity-detected memory leak where
we were leaking the array of IRQs returned by ppcuic_init().

Fixes: Coverity CID 1421992
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20201212001537.24520-4-peter.maydell@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/virtex_ml507.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 07fe49da0d..b26ff17767 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -43,6 +43,7 @@
 #include "qemu/option.h"
 #include "exec/address-spaces.h"
 
+#include "hw/intc/ppc-uic.h"
 #include "hw/ppc/ppc.h"
 #include "hw/ppc/ppc4xx.h"
 #include "hw/qdev-properties.h"
@@ -95,7 +96,8 @@ static PowerPCCPU *ppc440_init_xilinx(const char *cpu_type, uint32_t sysclk)
 {
     PowerPCCPU *cpu;
     CPUPPCState *env;
-    qemu_irq *irqs;
+    DeviceState *uicdev;
+    SysBusDevice *uicsbd;
 
     cpu = POWERPC_CPU(cpu_create(cpu_type));
     env = &cpu->env;
@@ -105,10 +107,19 @@ static PowerPCCPU *ppc440_init_xilinx(const char *cpu_type, uint32_t sysclk)
     ppc_dcr_init(env, NULL, NULL);
 
     /* interrupt controller */
-    irqs = g_new0(qemu_irq, PPCUIC_OUTPUT_NB);
-    irqs[PPCUIC_OUTPUT_INT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT];
-    irqs[PPCUIC_OUTPUT_CINT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT];
-    ppcuic_init(env, irqs, 0x0C0, 0, 1);
+    uicdev = qdev_new(TYPE_PPC_UIC);
+    uicsbd = SYS_BUS_DEVICE(uicdev);
+
+    object_property_set_link(OBJECT(uicdev), "cpu", OBJECT(cpu),
+                             &error_fatal);
+    sysbus_realize_and_unref(uicsbd, &error_fatal);
+
+    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
+                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
+    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
+                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
+
+    /* This board doesn't wire anything up to the inputs of the UIC. */
     return cpu;
 }
 
-- 
2.29.2


