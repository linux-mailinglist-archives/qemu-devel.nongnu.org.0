Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD90401C8D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:42:51 +0200 (CEST)
Received: from localhost ([::1]:47160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEte-0003CO-SP
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=888312a924=pdel@fb.com>)
 id 1mNErR-0000M9-RV
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:40:35 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:22884
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=888312a924=pdel@fb.com>)
 id 1mNErP-0006jS-S1
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:40:33 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.43/8.16.0.43) with SMTP id 186DZ5pL014829
 for <qemu-devel@nongnu.org>; Mon, 6 Sep 2021 06:40:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=7hX8pcfClyecpQ+u2ryVt37NGwkCMaGiDqwps6yjoeo=;
 b=Sfr0C4tiFuVLb4HBBp7d1y8jknOLIxDb2tgwj8A5hyYTYMpTamG7vDRwX0d8ooqrhJWS
 xbzM7Q4ZpWXf3u3x03PmH9KFnCjRu8jR+H2oQIxvFkWI+4sLB61YRDkyRZ6vm4Ot77HB
 PsPKV6/F81y8AUQFK39e3C6jK5sJp3Theto= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0001303.ppops.net with ESMTP id 3awgun9egp-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:40:29 -0700
Received: from intmgw003.48.prn1.facebook.com (2620:10d:c085:208::f) by
 mail.thefacebook.com (2620:10d:c085:11d::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Mon, 6 Sep 2021 06:40:27 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id 564731ACBBDB; Mon,  6 Sep 2021 06:40:24 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <joel@jms.id.au>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <f4bug@amsat.org>, Peter Delevoryas <pdel@fb.com>
Subject: [PATCH v2 1/1] hw/arm/aspeed: Initialize AST2600 UART clock selection
 registers
Date: Mon, 6 Sep 2021 06:40:23 -0700
Message-ID: <20210906134023.3711031-2-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210906134023.3711031-1-pdel@fb.com>
References: <20210906134023.3711031-1-pdel@fb.com>
X-FB-Internal: Safe
Content-Type: text/plain
X-FB-Source: Intern
X-Proofpoint-GUID: xY9OEadA6vcwW9URUYBwBXfs6QM8NHfe
X-Proofpoint-ORIG-GUID: xY9OEadA6vcwW9URUYBwBXfs6QM8NHfe
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-06_06:2021-09-03,
 2021-09-06 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109060086
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=888312a924=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Peter Delevoryas <pdel@fb.com>

UART5 is typically used as the default debug UART on the AST2600, but
UART1 is also designed to be a debug UART. All the AST2600 UART's have
semi-configurable clock rates through registers in the System Control
Unit (SCU), but only UART5 works out of the box with zero-initialized
values. The rest of the UART's expect a few of the registers to be
initialized to non-zero values, or else the clock rate calculation will
yield zero or undefined (due to a divide-by-zero).

For reference, the U-Boot clock rate driver here shows the calculation:

    https://github.com/facebook/openbmc-uboot/blob/15f7e0dc01d8/drivers/clk=
/aspeed/clk_ast2600.c#L357

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

To test this, I used Facebook's AST2600 OpenBMC image for "fuji", with
the following diff applied (because fuji uses UART1 for console output,
not UART5).

  @@ -323,8 +323,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
       }

      /* UART - attach an 8250 to the IO space as our UART5 */
  -    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
  -                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
  +    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART1], 2,
  +                   aspeed_soc_get_irq(s, ASPEED_DEV_UART1),
                    38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);

       /* I2C */

Without these clock rate registers being initialized, U-Boot hangs in
the clock rate driver from a divide-by-zero, because the UART1 clock
rate register reads return zero, and there's no console output. After
initializing them with default values, fuji boots successfully.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/misc/aspeed_scu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 05edebedeb..a95dca65f2 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -119,6 +119,8 @@
 #define AST2600_CLK_SEL3          TO_REG(0x308)
 #define AST2600_CLK_SEL4          TO_REG(0x310)
 #define AST2600_CLK_SEL5          TO_REG(0x314)
+#define AST2600_UARTCLK_PARAM     TO_REG(0x338)
+#define AST2600_HUARTCLK_PARAM    TO_REG(0x33C)
 #define AST2600_HW_STRAP1         TO_REG(0x500)
 #define AST2600_HW_STRAP1_CLR     TO_REG(0x504)
 #define AST2600_HW_STRAP1_PROT    TO_REG(0x508)
@@ -681,6 +683,8 @@ static const uint32_t ast2600_a3_resets[ASPEED_AST2600_=
SCU_NR_REGS] =3D {
     [AST2600_CLK_SEL3]          =3D 0x00000000,
     [AST2600_CLK_SEL4]          =3D 0xF3F40000,
     [AST2600_CLK_SEL5]          =3D 0x30000000,
+    [AST2600_UARTCLK_PARAM]     =3D 0x00014506,
+    [AST2600_HUARTCLK_PARAM]    =3D 0x000145C0,
     [AST2600_CHIP_ID0]          =3D 0x1234ABCD,
     [AST2600_CHIP_ID1]          =3D 0x88884444,
 };
--=20
2.30.2


