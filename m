Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E907A315F7F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 07:31:59 +0100 (CET)
Received: from localhost ([::1]:43710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9j2c-0008Eo-V9
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 01:31:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ip7-0001eF-G7; Wed, 10 Feb 2021 01:18:02 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:60621 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ip3-0000MG-QG; Wed, 10 Feb 2021 01:18:00 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db8gm3hHjz9sB4; Wed, 10 Feb 2021 17:17:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612937860;
 bh=UTUKuhobskUzKV6ia2euB5gyH/7mfxDG4U4Uk76xHas=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=budA8wwbHo+2Xi9EoIv3d/77MvSzouo2ko4aq6kCpAS62S2ybx4n6hgGzD7bo2Fb2
 m3T7UX6Hb5t90r3tbn5W2duvZk4usK7XrNvsN2kQiz4/oVweRg8RMyHPyFJHFieYd5
 hz4sL7Ik7PVDTQmnHcgY3al5Hf6VlUhrP0x1sMHM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 09/19] ppc/pnv: Discard internal BMC initialization when BMC is
 external
Date: Wed, 10 Feb 2021 17:17:25 +1100
Message-Id: <20210210061735.304384-10-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210061735.304384-1-david@gibson.dropbear.id.au>
References: <20210210061735.304384-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

The PowerNV machine can be run with an external IPMI BMC device
connected to a remote QEMU machine acting as BMC, using these options :

  -chardev socket,id=ipmi0,host=localhost,port=9002,reconnect=10 \
  -device ipmi-bmc-extern,id=bmc0,chardev=ipmi0 \
  -device isa-ipmi-bt,bmc=bmc0,irq=10 \
  -nodefaults

In that case, some aspects of the BMC initialization should be
skipped, since they rely on the simulator interface.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210126171059.307867-6-clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv_bmc.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
index 86d16b4935..b9bf5735ea 100644
--- a/hw/ppc/pnv_bmc.c
+++ b/hw/ppc/pnv_bmc.c
@@ -51,6 +51,11 @@ typedef struct OemSel {
 #define SOFT_OFF        0x00
 #define SOFT_REBOOT     0x01
 
+static bool pnv_bmc_is_simulator(IPMIBmc *bmc)
+{
+    return object_dynamic_cast(OBJECT(bmc), TYPE_IPMI_BMC_SIMULATOR);
+}
+
 static void pnv_gen_oem_sel(IPMIBmc *bmc, uint8_t reboot)
 {
     /* IPMI SEL Event are 16 bytes long */
@@ -79,6 +84,10 @@ void pnv_dt_bmc_sensors(IPMIBmc *bmc, void *fdt)
     const struct ipmi_sdr_compact *sdr;
     uint16_t nextrec;
 
+    if (!pnv_bmc_is_simulator(bmc)) {
+        return;
+    }
+
     offset = fdt_add_subnode(fdt, 0, "bmc");
     _FDT(offset);
 
@@ -243,6 +252,10 @@ static const IPMINetfn hiomap_netfn = {
 
 void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor)
 {
+    if (!pnv_bmc_is_simulator(bmc)) {
+        return;
+    }
+
     object_ref(OBJECT(pnor));
     object_property_add_const_link(OBJECT(bmc), "pnor", OBJECT(pnor));
 
@@ -286,7 +299,7 @@ static int bmc_find(Object *child, void *opaque)
 
 IPMIBmc *pnv_bmc_find(Error **errp)
 {
-    ForeachArgs args = { TYPE_IPMI_BMC_SIMULATOR, NULL };
+    ForeachArgs args = { TYPE_IPMI_BMC, NULL };
     int ret;
 
     ret = object_child_foreach_recursive(object_get_root(), bmc_find, &args);
-- 
2.29.2


