Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A9221484C
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jul 2020 21:14:14 +0200 (CEST)
Received: from localhost ([::1]:58898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrnc5-0007Sf-83
	for lists+qemu-devel@lfdr.de; Sat, 04 Jul 2020 15:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1jrnav-0005oQ-J9
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 15:13:01 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:37761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1jrnat-0002EX-Ue
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 15:13:01 -0400
X-Originating-IP: 90.127.194.69
Received: from jcd-UX305CA.home (lfbn-idf1-1-2027-69.w90-127.abo.wanadoo.fr
 [90.127.194.69]) (Authenticated sender: jcd@tribudubois.net)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 77C612000A;
 Sat,  4 Jul 2020 19:12:57 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org, peter.chubb@nicta.com.au,
 f4bug@amsat.org
Subject: [PATCH v2 3/3] Add the ability to change the FEC PHY MDIO devices
 numbers on i.MX7 processor
Date: Sat,  4 Jul 2020 21:12:45 +0200
Message-Id: <c850187322be9930e47c8b234c385a7d0da245cb.1593806826.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1593806826.git.jcd@tribudubois.net>
References: <cover.1593806826.git.jcd@tribudubois.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.70.183.200; envelope-from=jcd@tribudubois.net;
 helo=relay7-d.mail.gandi.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 14:54:37
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

 v2: same patch after pull request from peter is validated.

 hw/arm/fsl-imx7.c         | 9 +++++++++
 include/hw/arm/fsl-imx7.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index b49d895a412..5dbf0e500aa 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -364,6 +364,8 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
             FSL_IMX7_ENET2_ADDR,
         };
 
+        object_property_set_uint(OBJECT(&s->eth[i]), s->phy_num[i],
+                                 "phy-num", &error_abort);
         object_property_set_uint(OBJECT(&s->eth[i]), FSL_IMX7_ETH_NUM_TX_RINGS,
                                  "tx-ring-num", &error_abort);
         qdev_set_nic_properties(DEVICE(&s->eth[i]), &nd_table[i]);
@@ -551,10 +553,17 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
                                 FSL_IMX7_PCIE_PHY_SIZE);
 }
 
+static Property fsl_imx7_properties[] = {
+    DEFINE_PROP_UINT32("fec1-phy-num", FslIMX7State, phy_num[0], 0),
+    DEFINE_PROP_UINT32("fec2-phy-num", FslIMX7State, phy_num[1], 1),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void fsl_imx7_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
+    device_class_set_props(dc, fsl_imx7_properties);
     dc->realize = fsl_imx7_realize;
 
     /* Reason: Uses serial_hds and nd_table in realize() directly */
diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index da977f9ffb4..ad889237077 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -81,6 +81,7 @@ typedef struct FslIMX7State {
     IMX7GPRState       gpr;
     ChipideaState      usb[FSL_IMX7_NUM_USBS];
     DesignwarePCIEHost pcie;
+    uint32_t           phy_num[FSL_IMX7_NUM_ETHS];
 } FslIMX7State;
 
 enum FslIMX7MemoryMap {
-- 
2.25.1


