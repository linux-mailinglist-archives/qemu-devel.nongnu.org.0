Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEE53FA194
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Aug 2021 00:40:49 +0200 (CEST)
Received: from localhost ([::1]:45318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJkWm-0001AX-KY
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 18:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=78736a82b9=pdel@fb.com>)
 id 1mJj3O-0006Ut-KK
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 17:06:22 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:21120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=78736a82b9=pdel@fb.com>)
 id 1mJj3M-0003CI-3S
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 17:06:21 -0400
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17RL0IJh011546
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 14:06:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=eAmU7uJ7DEoPFCSIKwkqtnpI79NZb89CKay9em5nlD8=;
 b=Tu0TEjspOFfgX+FGpXFU0aaJykvMMnxKvJHw688Jq3wETPmOyWz6K94lJl93BFK9YnbK
 bHLkhggZQe28C9SAa0DJEuRQEn/uU3Jq74okWh5v87ulx2VlyzKpRlo7MAgsbRmmHjLm
 bMSAGKVzSkxU1uLD3Nj/+G/J/kKV2hD4eag= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3aq2fh27mn-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 14:06:19 -0700
Received: from intmgw001.27.prn2.facebook.com (2620:10d:c085:208::11) by
 mail.thefacebook.com (2620:10d:c085:21d::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 27 Aug 2021 14:06:17 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id 0F9F8E74C21; Fri, 27 Aug 2021 14:06:16 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <joel@jms.id.au>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, Peter Delevoryas <pdel@fb.com>
Subject: [PATCH 5/5] hw/arm/aspeed: Initialize AST2600 clock selection
 registers
Date: Fri, 27 Aug 2021 14:04:17 -0700
Message-ID: <20210827210417.4022054-6-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210827210417.4022054-1-pdel@fb.com>
References: <20210827210417.4022054-1-pdel@fb.com>
X-FB-Internal: Safe
Content-Type: text/plain
X-FB-Source: Intern
X-Proofpoint-GUID: 6qCRvfy0HwAIPXuHRecQg_QPxmxJj2zt
X-Proofpoint-ORIG-GUID: 6qCRvfy0HwAIPXuHRecQg_QPxmxJj2zt
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-27_06:2021-08-27,
 2021-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108270124
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=78736a82b9=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 27 Aug 2021 18:37:43 -0400
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

From: Peter Delevoryas <pdel@fb.com>

UART5 is typically used as the default debug UART on the AST2600, but
UART1 is also designed to be a debug UART. All the AST2600 UART's have
semi-configurable clock rates through registers in the System Control
Unit (SCU), but only UART5 works out of the box with zero-initialized
values. The rest of the UART's expect a few of the registers to be
initialized to non-zero values, or else the clock rate calculation will
yield zero or undefined (due to a divide-by-zero).

For reference, the U-Boot clock rate driver here shows the calculation:

    https://github.com/facebook/openbmc-uboot/blob/main/drivers/clk/aspeed/=
clk_ast2600.c#L357)

To summarize, UART5 allows selection from 4 rates: 24 MHz, 192 MHz, 24 /
13 MHz, and 192 / 13 MHz. The other UART's allow selecting either the
"low" rate (UARTCLK) or the "high" rate (HUARTCLK). UARTCLK and HUARTCLK
are configurable themselves:

    UARTCLK =3D UXCLK * R / (N * 2)
    HUARTCLK =3D HUXCLK * HR / (HN * 2)

UXCLK and HUXCLK are also configurable, and depend on the APLL and/or
HPLL clock rates, which also derive from complicated calculations. Long
story short, there's lots of multiplication and division from
configurable registers, and most of these registers are zero-initialized
in QEMU, which at best is unexpected and at worst causes this clock rate
driver to hang from divide-by-zero's. This can also be difficult to
diagnose, because it may cause U-Boot to hang before serial console
initialization completes, requiring intervention from gdb.

This change just initializes all of these registers with default values
from the datasheet.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/misc/aspeed_scu.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index c373e678f0..d51fe8564d 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -104,11 +104,16 @@
 #define AST2600_SDRAM_HANDSHAKE   TO_REG(0x100)
 #define AST2600_HPLL_PARAM        TO_REG(0x200)
 #define AST2600_HPLL_EXT          TO_REG(0x204)
+#define AST2600_APLL_PARAM        TO_REG(0x210)
 #define AST2600_MPLL_EXT          TO_REG(0x224)
 #define AST2600_EPLL_EXT          TO_REG(0x244)
 #define AST2600_CLK_SEL           TO_REG(0x300)
 #define AST2600_CLK_SEL2          TO_REG(0x304)
 #define AST2600_CLK_SEL3          TO_REG(0x308)
+#define AST2600_CLK_SEL4          TO_REG(0x310)
+#define AST2600_CLK_SEL5          TO_REG(0x314)
+#define AST2600_UARTCLK_PARAM     TO_REG(0x338)
+#define AST2600_HUARTCLK_PARAM    TO_REG(0x33C)
 #define AST2600_HW_STRAP1         TO_REG(0x500)
 #define AST2600_HW_STRAP1_CLR     TO_REG(0x504)
 #define AST2600_HW_STRAP1_PROT    TO_REG(0x508)
@@ -658,9 +663,15 @@ static const uint32_t ast2600_a1_resets[ASPEED_AST2600=
_SCU_NR_REGS] =3D {
     [AST2600_CLK_STOP_CTRL2]    =3D 0xFFF0FFF0,
     [AST2600_SDRAM_HANDSHAKE]   =3D 0x00000000,
     [AST2600_HPLL_PARAM]        =3D 0x1000405F,
+    [AST2600_APLL_PARAM]        =3D 0x1000405F,
     [AST2600_CHIP_ID0]          =3D 0x1234ABCD,
     [AST2600_CHIP_ID1]          =3D 0x88884444,
-
+    [AST2600_CLK_SEL2]          =3D 0x00700000,
+    [AST2600_CLK_SEL3]          =3D 0x00000000,
+    [AST2600_CLK_SEL4]          =3D 0xF3F40000,
+    [AST2600_CLK_SEL5]          =3D 0x30000000,
+    [AST2600_UARTCLK_PARAM]     =3D 0x00014506,
+    [AST2600_HUARTCLK_PARAM]    =3D 0x000145C0,
 };
=20
 static void aspeed_ast2600_scu_reset(DeviceState *dev)
--=20
2.30.2


