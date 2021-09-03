Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBAD400616
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:48:51 +0200 (CEST)
Received: from localhost ([::1]:50692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFBC-0000HI-OA
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mMF42-00044J-QO; Fri, 03 Sep 2021 15:41:26 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:33791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mMF3v-0002LN-JM; Fri, 03 Sep 2021 15:41:26 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.148])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id C7012BC4DEF9;
 Fri,  3 Sep 2021 21:41:15 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 3 Sep
 2021 21:41:15 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005f97fb7df-1e66-4ea8-8cb3-825e3699f9ec,
 15E2C03324B5D6AD2543493448FEC157D625CB40) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 12/14] hw/arm/aspeed: Initialize AST2600 UART clock selection
 registers
Date: Fri, 3 Sep 2021 21:41:06 +0200
Message-ID: <20210903194108.131403-13-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903194108.131403-1-clg@kaod.org>
References: <20210903194108.131403-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ee3225b2-0cf4-4fd4-a54b-0d5390e5c778
X-Ovh-Tracer-Id: 8816640697611815785
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvjedgudefkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigfdvvdffffevleefgefhheegtedutdfgueevfeffleegledvuefhteetueekjeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>, Joel Stanley <joel@jms.id.au>
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

    https://github.com/facebook/openbmc-uboot/blob/main/drivers/clk/aspeed/clk_ast2600.c#L357)

To summarize, UART5 allows selection from 4 rates: 24 MHz, 192 MHz, 24 /
13 MHz, and 192 / 13 MHz. The other UART's allow selecting either the
"low" rate (UARTCLK) or the "high" rate (HUARTCLK). UARTCLK and HUARTCLK
are configurable themselves:

    UARTCLK = UXCLK * R / (N * 2)
    HUARTCLK = HUXCLK * HR / (HN * 2)

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

  @@ -323,8 +323,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
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

    git clone https://github.com/facebook/openbmc
    cd openbmc
    ./sync_yocto.sh
    source openbmc-init-build-env fuji build-fuji
    bitbake fuji-image
    cp ./tmp/deploy/images/fuji/flash-fuji /tmp/

    dd if=/dev/zero of=/tmp/fixedsize-fuji bs=1M count=128
    dd if=/tmp/flash-fuji of=/tmp/fixedsize-fuji bs=1k conv=notrunc

    git clone --branch init-clock-sel-regs https://github.com/peterdelevoryas/qemu
    cd qemu
    ./configure --target-list=arm-softmmu --disable-vnc
    make -j $(nproc)
    ./build/arm-softmmu/qemu-system-arm \
        -machine ast2600-evb \
        -drive file=/tmp/fixedsize-fuji,format=raw,if=mtd \
        -serial stdio

Signed-off-by: Peter Delevoryas <pdel@fb.com>
[ clg: - reworked diff in commit log
       - dropped CLK_SEL* changes which were already merged
       - Subject update ]
Message-Id: <20210831142502.279485-1-pdel@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_scu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 05edebedeb46..a95dca65f2f1 100644
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
@@ -681,6 +683,8 @@ static const uint32_t ast2600_a3_resets[ASPEED_AST2600_SCU_NR_REGS] = {
     [AST2600_CLK_SEL3]          = 0x00000000,
     [AST2600_CLK_SEL4]          = 0xF3F40000,
     [AST2600_CLK_SEL5]          = 0x30000000,
+    [AST2600_UARTCLK_PARAM]     = 0x00014506,
+    [AST2600_HUARTCLK_PARAM]    = 0x000145C0,
     [AST2600_CHIP_ID0]          = 0x1234ABCD,
     [AST2600_CHIP_ID1]          = 0x88884444,
 };
-- 
2.31.1


