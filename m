Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76971357346
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 19:35:54 +0200 (CEST)
Received: from localhost ([::1]:48352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUC5p-0005j0-8k
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 13:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBnl-0007ee-BA; Wed, 07 Apr 2021 13:17:13 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:61390
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBng-0006o3-V7; Wed, 07 Apr 2021 13:17:13 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137H3R0j025005; Wed, 7 Apr 2021 13:16:58 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37rwf0pvmg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 13:16:58 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137HE6pi031313;
 Wed, 7 Apr 2021 17:16:57 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 37rvbqgwc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 17:16:57 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 137HGscY41222524
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 17:16:54 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8529A4054;
 Wed,  7 Apr 2021 17:16:54 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 900AFA405F;
 Wed,  7 Apr 2021 17:16:54 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  7 Apr 2021 17:16:54 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.229])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id F3D5E2200C7;
 Wed,  7 Apr 2021 19:16:53 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 20/24] aspeed: Emulate the AST2600A3
Date: Wed,  7 Apr 2021 19:16:33 +0200
Message-Id: <20210407171637.777743-21-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407171637.777743-1-clg@kaod.org>
References: <20210407171637.777743-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Tao7OgoFhxDPxuG5D2qNIhqwuLC5vgVh
X-Proofpoint-ORIG-GUID: Tao7OgoFhxDPxuG5D2qNIhqwuLC5vgVh
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_09:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104070116
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

This is the latest revision of the ASPEED 2600 SoC.

Reset values are taken from v8 of the datasheet.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Message-Id: <20210304124316.164742-1-joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/misc/aspeed_scu.h |  2 ++
 hw/arm/aspeed_ast2600.c      |  2 +-
 hw/misc/aspeed_scu.c         | 32 +++++++++++++++++++++++++-------
 3 files changed, 28 insertions(+), 8 deletions(-)

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
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index bb650d31f5ad..c30d0f320c2a 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -533,7 +533,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass=
 *oc, void *data)
=20
     sc->name         =3D "ast2600-a1";
     sc->cpu_type     =3D ARM_CPU_TYPE_NAME("cortex-a7");
-    sc->silicon_rev  =3D AST2600_A1_SILICON_REV;
+    sc->silicon_rev  =3D AST2600_A3_SILICON_REV;
     sc->sram_size    =3D 0x16400;
     sc->spis_num     =3D 2;
     sc->ehcis_num    =3D 2;
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 40a38ebd8549..3515d6ff6bbf 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -104,11 +104,19 @@
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
@@ -433,6 +441,8 @@ static uint32_t aspeed_silicon_revs[] =3D {
     AST2500_A1_SILICON_REV,
     AST2600_A0_SILICON_REV,
     AST2600_A1_SILICON_REV,
+    AST2600_A2_SILICON_REV,
+    AST2600_A3_SILICON_REV,
 };
=20
 bool is_supported_silicon_rev(uint32_t silicon_rev)
@@ -651,16 +661,24 @@ static const MemoryRegionOps aspeed_ast2600_scu_ops=
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
@@ -675,7 +693,7 @@ static void aspeed_ast2600_scu_reset(DeviceState *dev=
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
@@ -689,7 +707,7 @@ static void aspeed_2600_scu_class_init(ObjectClass *k=
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
2.26.3


