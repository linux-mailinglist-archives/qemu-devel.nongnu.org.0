Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B91214852
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jul 2020 21:16:02 +0200 (CEST)
Received: from localhost ([::1]:35100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrndp-0000rW-Q7
	for lists+qemu-devel@lfdr.de; Sat, 04 Jul 2020 15:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1jrnat-0005m3-22
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 15:12:59 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:43259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1jrnaq-0002EC-00
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 15:12:58 -0400
X-Originating-IP: 90.127.194.69
Received: from jcd-UX305CA.home (lfbn-idf1-1-2027-69.w90-127.abo.wanadoo.fr
 [90.127.194.69]) (Authenticated sender: jcd@tribudubois.net)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E152B20007;
 Sat,  4 Jul 2020 19:12:52 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org, peter.chubb@nicta.com.au,
 f4bug@amsat.org
Subject: [PATCH v2 1/3] Add the ability to change the FEC PHY MDIO device
 number on i.MX25 processor
Date: Sat,  4 Jul 2020 21:12:43 +0200
Message-Id: <9f8923ecd974160ae8f634c275b1100c2cbe66d7.1593806826.git.jcd@tribudubois.net>
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

 hw/arm/fsl-imx25.c         | 7 +++++++
 include/hw/arm/fsl-imx25.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 7ab5c98fbe1..35874aac00b 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -183,6 +183,7 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
                                             epit_table[i].irq));
     }
 
+    object_property_set_uint(OBJECT(&s->fec), s->phy_num, "phy-num", &err);
     qdev_set_nic_properties(DEVICE(&s->fec), &nd_table[0]);
 
     sysbus_realize(SYS_BUS_DEVICE(&s->fec), &err);
@@ -339,10 +340,16 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
                                 &s->iram_alias);
 }
 
+static Property fsl_imx25_properties[] = {
+    DEFINE_PROP_UINT32("fec-phy-num", FslIMX25State, phy_num, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void fsl_imx25_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
+    device_class_set_props(dc, fsl_imx25_properties);
     dc->realize = fsl_imx25_realize;
     dc->desc = "i.MX25 SOC";
     /*
diff --git a/include/hw/arm/fsl-imx25.h b/include/hw/arm/fsl-imx25.h
index 9e228daceae..54ee1bfd780 100644
--- a/include/hw/arm/fsl-imx25.h
+++ b/include/hw/arm/fsl-imx25.h
@@ -65,6 +65,7 @@ typedef struct FslIMX25State {
     MemoryRegion   rom[2];
     MemoryRegion   iram;
     MemoryRegion   iram_alias;
+    uint32_t       phy_num;
 } FslIMX25State;
 
 /**
-- 
2.25.1


