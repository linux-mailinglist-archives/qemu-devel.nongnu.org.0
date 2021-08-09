Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA0D3E46C7
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:37:53 +0200 (CEST)
Received: from localhost ([::1]:35036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5TU-0003JK-98
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD58z-0005I5-6x; Mon, 09 Aug 2021 09:16:42 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD58x-0005IY-1i; Mon, 09 Aug 2021 09:16:40 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179DGQkY179590; Mon, 9 Aug 2021 09:16:26 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ab53480k5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 09:16:25 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 179CwOfY014355;
 Mon, 9 Aug 2021 13:16:07 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 3a9ht8uk5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 13:16:07 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 179DG5TT55574996
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 13:16:05 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2048242047;
 Mon,  9 Aug 2021 13:16:05 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B33024204C;
 Mon,  9 Aug 2021 13:16:04 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  9 Aug 2021 13:16:04 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.114])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id D47EB220032;
 Mon,  9 Aug 2021 15:16:03 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 08/10] aspeed: Emulate the AST2600A3
Date: Mon,  9 Aug 2021 15:15:54 +0200
Message-Id: <20210809131556.686260-9-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809131556.686260-1-clg@kaod.org>
References: <20210809131556.686260-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: q15VwbXnumVcrqYB_IqbKn3iVx3Z8qHM
X-Proofpoint-GUID: q15VwbXnumVcrqYB_IqbKn3iVx3Z8qHM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_04:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 mlxlogscore=999 clxscore=1034 priorityscore=1501 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108090099
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joel Stanley <joel@jms.id.au>

This is the latest revision of the ASPEED 2600 SoC. As there is no
need to model multiple revisions of the same SoC for the moment,
update the SCU AST2600 to model the A3 revision instead of the A1 and
adapt the AST2600 SoC and machines.

Reset values are taken from v8 of the datasheet.

Signed-off-by: Joel Stanley <joel@jms.id.au>
[ clg: - Introduced an Aspeed "ast2600-a3" SoC class
       - Commit log update ]
Message-Id: <20210407171637.777743-21-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20210629142336.750058-3-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/misc/aspeed_scu.h |  2 ++
 hw/arm/aspeed.c              |  6 +++---
 hw/arm/aspeed_ast2600.c      |  6 +++---
 hw/misc/aspeed_scu.c         | 36 +++++++++++++++++++++++++++++-------
 4 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index d49bfb02fbdb..c14aff2bcbb5 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -43,6 +43,8 @@ struct AspeedSCUState {
 #define AST2500_A1_SILICON_REV   0x04010303U
 #define AST2600_A0_SILICON_REV   0x05000303U
 #define AST2600_A1_SILICON_REV   0x05010303U
+#define AST2600_A2_SILICON_REV   0x05020303U
+#define AST2600_A3_SILICON_REV   0x05030303U
=20
 #define ASPEED_IS_AST2500(si_rev)     ((((si_rev) >> 24) & 0xff) =3D=3D =
0x04)
=20
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index c93941789fd4..1ea09584d1f6 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -997,7 +997,7 @@ static void aspeed_machine_ast2600_evb_class_init(Obj=
ectClass *oc, void *data)
     AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
=20
     mc->desc       =3D "Aspeed AST2600 EVB (Cortex-A7)";
-    amc->soc_name  =3D "ast2600-a1";
+    amc->soc_name  =3D "ast2600-a3";
     amc->hw_strap1 =3D AST2600_EVB_HW_STRAP1;
     amc->hw_strap2 =3D AST2600_EVB_HW_STRAP2;
     amc->fmc_model =3D "w25q512jv";
@@ -1017,7 +1017,7 @@ static void aspeed_machine_tacoma_class_init(Object=
Class *oc, void *data)
     AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
=20
     mc->desc       =3D "OpenPOWER Tacoma BMC (Cortex-A7)";
-    amc->soc_name  =3D "ast2600-a1";
+    amc->soc_name  =3D "ast2600-a3";
     amc->hw_strap1 =3D TACOMA_BMC_HW_STRAP1;
     amc->hw_strap2 =3D TACOMA_BMC_HW_STRAP2;
     amc->fmc_model =3D "mx66l1g45g";
@@ -1054,7 +1054,7 @@ static void aspeed_machine_rainier_class_init(Objec=
tClass *oc, void *data)
     AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
=20
     mc->desc       =3D "IBM Rainier BMC (Cortex-A7)";
-    amc->soc_name  =3D "ast2600-a1";
+    amc->soc_name  =3D "ast2600-a3";
     amc->hw_strap1 =3D RAINIER_BMC_HW_STRAP1;
     amc->hw_strap2 =3D RAINIER_BMC_HW_STRAP2;
     amc->fmc_model =3D "mx66l1g45g";
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index e3013128c670..8e1993790e6f 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -516,9 +516,9 @@ static void aspeed_soc_ast2600_class_init(ObjectClass=
 *oc, void *data)
=20
     dc->realize      =3D aspeed_soc_ast2600_realize;
=20
-    sc->name         =3D "ast2600-a1";
+    sc->name         =3D "ast2600-a3";
     sc->cpu_type     =3D ARM_CPU_TYPE_NAME("cortex-a7");
-    sc->silicon_rev  =3D AST2600_A1_SILICON_REV;
+    sc->silicon_rev  =3D AST2600_A3_SILICON_REV;
     sc->sram_size    =3D 0x16400;
     sc->spis_num     =3D 2;
     sc->ehcis_num    =3D 2;
@@ -530,7 +530,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass=
 *oc, void *data)
 }
=20
 static const TypeInfo aspeed_soc_ast2600_type_info =3D {
-    .name           =3D "ast2600-a1",
+    .name           =3D "ast2600-a3",
     .parent         =3D TYPE_ASPEED_SOC,
     .instance_size  =3D sizeof(AspeedSoCState),
     .instance_init  =3D aspeed_soc_ast2600_init,
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 40a38ebd8549..05edebedeb46 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -101,14 +101,24 @@
 #define AST2600_CLK_STOP_CTRL_CLR TO_REG(0x84)
 #define AST2600_CLK_STOP_CTRL2     TO_REG(0x90)
 #define AST2600_CLK_STOP_CTRL2_CLR TO_REG(0x94)
+#define AST2600_DEBUG_CTRL        TO_REG(0xC8)
+#define AST2600_DEBUG_CTRL2       TO_REG(0xD8)
 #define AST2600_SDRAM_HANDSHAKE   TO_REG(0x100)
 #define AST2600_HPLL_PARAM        TO_REG(0x200)
 #define AST2600_HPLL_EXT          TO_REG(0x204)
+#define AST2600_APLL_PARAM        TO_REG(0x210)
+#define AST2600_APLL_EXT          TO_REG(0x214)
+#define AST2600_MPLL_PARAM        TO_REG(0x220)
 #define AST2600_MPLL_EXT          TO_REG(0x224)
+#define AST2600_EPLL_PARAM        TO_REG(0x240)
 #define AST2600_EPLL_EXT          TO_REG(0x244)
+#define AST2600_DPLL_PARAM        TO_REG(0x260)
+#define AST2600_DPLL_EXT          TO_REG(0x264)
 #define AST2600_CLK_SEL           TO_REG(0x300)
 #define AST2600_CLK_SEL2          TO_REG(0x304)
-#define AST2600_CLK_SEL3          TO_REG(0x310)
+#define AST2600_CLK_SEL3          TO_REG(0x308)
+#define AST2600_CLK_SEL4          TO_REG(0x310)
+#define AST2600_CLK_SEL5          TO_REG(0x314)
 #define AST2600_HW_STRAP1         TO_REG(0x500)
 #define AST2600_HW_STRAP1_CLR     TO_REG(0x504)
 #define AST2600_HW_STRAP1_PROT    TO_REG(0x508)
@@ -433,6 +443,8 @@ static uint32_t aspeed_silicon_revs[] =3D {
     AST2500_A1_SILICON_REV,
     AST2600_A0_SILICON_REV,
     AST2600_A1_SILICON_REV,
+    AST2600_A2_SILICON_REV,
+    AST2600_A3_SILICON_REV,
 };
=20
 bool is_supported_silicon_rev(uint32_t silicon_rev)
@@ -651,16 +663,26 @@ static const MemoryRegionOps aspeed_ast2600_scu_ops=
 =3D {
     .valid.unaligned =3D false,
 };
=20
-static const uint32_t ast2600_a1_resets[ASPEED_AST2600_SCU_NR_REGS] =3D =
{
+static const uint32_t ast2600_a3_resets[ASPEED_AST2600_SCU_NR_REGS] =3D =
{
     [AST2600_SYS_RST_CTRL]      =3D 0xF7C3FED8,
-    [AST2600_SYS_RST_CTRL2]     =3D 0xFFFFFFFC,
+    [AST2600_SYS_RST_CTRL2]     =3D 0x0DFFFFFC,
     [AST2600_CLK_STOP_CTRL]     =3D 0xFFFF7F8A,
     [AST2600_CLK_STOP_CTRL2]    =3D 0xFFF0FFF0,
+    [AST2600_DEBUG_CTRL]        =3D 0x00000FFF,
+    [AST2600_DEBUG_CTRL2]       =3D 0x000000FF,
     [AST2600_SDRAM_HANDSHAKE]   =3D 0x00000000,
-    [AST2600_HPLL_PARAM]        =3D 0x1000405F,
+    [AST2600_HPLL_PARAM]        =3D 0x1000408F,
+    [AST2600_APLL_PARAM]        =3D 0x1000405F,
+    [AST2600_MPLL_PARAM]        =3D 0x1008405F,
+    [AST2600_EPLL_PARAM]        =3D 0x1004077F,
+    [AST2600_DPLL_PARAM]        =3D 0x1078405F,
+    [AST2600_CLK_SEL]           =3D 0xF3940000,
+    [AST2600_CLK_SEL2]          =3D 0x00700000,
+    [AST2600_CLK_SEL3]          =3D 0x00000000,
+    [AST2600_CLK_SEL4]          =3D 0xF3F40000,
+    [AST2600_CLK_SEL5]          =3D 0x30000000,
     [AST2600_CHIP_ID0]          =3D 0x1234ABCD,
     [AST2600_CHIP_ID1]          =3D 0x88884444,
-
 };
=20
 static void aspeed_ast2600_scu_reset(DeviceState *dev)
@@ -675,7 +697,7 @@ static void aspeed_ast2600_scu_reset(DeviceState *dev=
)
      * of actual revision. QEMU and Linux only support A1 onwards so thi=
s is
      * sufficient.
      */
-    s->regs[AST2600_SILICON_REV] =3D AST2600_A1_SILICON_REV;
+    s->regs[AST2600_SILICON_REV] =3D AST2600_A3_SILICON_REV;
     s->regs[AST2600_SILICON_REV2] =3D s->silicon_rev;
     s->regs[AST2600_HW_STRAP1] =3D s->hw_strap1;
     s->regs[AST2600_HW_STRAP2] =3D s->hw_strap2;
@@ -689,7 +711,7 @@ static void aspeed_2600_scu_class_init(ObjectClass *k=
lass, void *data)
=20
     dc->desc =3D "ASPEED 2600 System Control Unit";
     dc->reset =3D aspeed_ast2600_scu_reset;
-    asc->resets =3D ast2600_a1_resets;
+    asc->resets =3D ast2600_a3_resets;
     asc->calc_hpll =3D aspeed_2500_scu_calc_hpll; /* No change since AST=
2500 */
     asc->apb_divider =3D 4;
     asc->nr_regs =3D ASPEED_AST2600_SCU_NR_REGS;
--=20
2.31.1


