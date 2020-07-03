Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FEF21403C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 22:16:53 +0200 (CEST)
Received: from localhost ([::1]:33524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrS7A-000541-6h
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 16:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1jrS5z-0003lv-Vq
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 16:15:39 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:50135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1jrS5v-00010X-N9
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 16:15:39 -0400
X-Originating-IP: 82.252.130.88
Received: from localhost.localdomain (lns-bzn-59-82-252-130-88.adsl.proxad.net
 [82.252.130.88]) (Authenticated sender: jcd@tribudubois.net)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id D0A6A1BF206;
 Fri,  3 Jul 2020 20:15:32 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org, peter.chubb@nicta.com.au,
 f4bug@amsat.org
Subject: [PATCH 2/3] Add the ability to change the FEC PHY MDIO device number
 on i.MX6 processor
Date: Fri,  3 Jul 2020 22:15:16 +0200
Message-Id: <05a64e83eb1c0c865ac077b22c599425c024c02c.1593806826.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1593806826.git.jcd@tribudubois.net>
References: <cover.1593806826.git.jcd@tribudubois.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.70.183.201; envelope-from=jcd@tribudubois.net;
 helo=relay8-d.mail.gandi.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 16:15:30
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
---
 hw/arm/fsl-imx6.c         | 7 +++++++
 include/hw/arm/fsl-imx6.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 4ae3c3efc28..0721f333497 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -402,6 +402,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
                                             spi_table[i].irq));
     }
 
+    object_property_set_uint(OBJECT(&s->eth), s->phy_num, "phy-num", &err);
     qdev_set_nic_properties(DEVICE(&s->eth), &nd_table[0]);
     sysbus_realize(SYS_BUS_DEVICE(&s->eth), &err);
     if (err) {
@@ -476,10 +477,16 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
                                 &s->ocram_alias);
 }
 
+static Property fsl_imx6_properties[] = {
+    DEFINE_PROP_UINT32("fec-phy-num", FslIMX6State, phy_num, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void fsl_imx6_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
+    device_class_set_props(dc, fsl_imx6_properties);
     dc->realize = fsl_imx6_realize;
     dc->desc = "i.MX6 SOC";
     /* Reason: Uses serial_hd() in the realize() function */
diff --git a/include/hw/arm/fsl-imx6.h b/include/hw/arm/fsl-imx6.h
index 1ebd7513246..162fe99375d 100644
--- a/include/hw/arm/fsl-imx6.h
+++ b/include/hw/arm/fsl-imx6.h
@@ -73,6 +73,7 @@ typedef struct FslIMX6State {
     MemoryRegion   caam;
     MemoryRegion   ocram;
     MemoryRegion   ocram_alias;
+    uint32_t       phy_num;
 } FslIMX6State;
 
 
-- 
2.25.1


