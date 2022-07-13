Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E82572FCE
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 09:57:39 +0200 (CEST)
Received: from localhost ([::1]:57196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBXFb-0005lK-1h
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 03:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBN-0007pw-4S; Wed, 13 Jul 2022 03:53:17 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:57845
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBJ-0002Wi-Sr; Wed, 13 Jul 2022 03:53:16 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LjVGp5qJ7z4ySc;
 Wed, 13 Jul 2022 17:53:06 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LjVGm1gW8z4ySW;
 Wed, 13 Jul 2022 17:53:03 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 01/19] aspeed: sbc: Allow per-machine settings
Date: Wed, 13 Jul 2022 09:52:37 +0200
Message-Id: <20220713075255.2248923-2-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220713075255.2248923-1-clg@kaod.org>
References: <20220713075255.2248923-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=zHgX=XS=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: Joel Stanley <joel@jms.id.au>

In order to correctly report secure boot running firmware the values
of certain registers must be set.

We don't yet have documentation from ASPEED on what they mean. The
meaning is inferred from u-boot's use of them.

Introduce properties so the settings can be configured per-machine.

Reviewed-by: Peter Delevoryas <pdel@fb.com>
Tested-by: Peter Delevoryas <pdel@fb.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Message-Id: <20220628154740.1117349-4-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/misc/aspeed_sbc.h | 13 +++++++++++
 hw/misc/aspeed_sbc.c         | 42 ++++++++++++++++++++++++++++++++++--
 2 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/include/hw/misc/aspeed_sbc.h b/include/hw/misc/aspeed_sbc.h
index 67e43b53ecc3..405e6782b97a 100644
--- a/include/hw/misc/aspeed_sbc.h
+++ b/include/hw/misc/aspeed_sbc.h
@@ -17,9 +17,22 @@ OBJECT_DECLARE_TYPE(AspeedSBCState, AspeedSBCClass, ASPEED_SBC)
 
 #define ASPEED_SBC_NR_REGS (0x93c >> 2)
 
+#define QSR_AES                     BIT(27)
+#define QSR_RSA1024                 (0x0 << 12)
+#define QSR_RSA2048                 (0x1 << 12)
+#define QSR_RSA3072                 (0x2 << 12)
+#define QSR_RSA4096                 (0x3 << 12)
+#define QSR_SHA224                  (0x0 << 10)
+#define QSR_SHA256                  (0x1 << 10)
+#define QSR_SHA384                  (0x2 << 10)
+#define QSR_SHA512                  (0x3 << 10)
+
 struct AspeedSBCState {
     SysBusDevice parent;
 
+    bool emmc_abr;
+    uint32_t signing_settings;
+
     MemoryRegion iomem;
 
     uint32_t regs[ASPEED_SBC_NR_REGS];
diff --git a/hw/misc/aspeed_sbc.c b/hw/misc/aspeed_sbc.c
index bfa8b81d01c7..c6f328e3be23 100644
--- a/hw/misc/aspeed_sbc.c
+++ b/hw/misc/aspeed_sbc.c
@@ -11,6 +11,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qemu/error-report.h"
+#include "hw/qdev-properties.h"
 #include "hw/misc/aspeed_sbc.h"
 #include "qapi/error.h"
 #include "migration/vmstate.h"
@@ -19,6 +20,27 @@
 #define R_STATUS        (0x014 / 4)
 #define R_QSR           (0x040 / 4)
 
+/* R_STATUS */
+#define ABR_EN                  BIT(14) /* Mirrors SCU510[11] */
+#define ABR_IMAGE_SOURCE        BIT(13)
+#define SPI_ABR_IMAGE_SOURCE    BIT(12)
+#define SB_CRYPTO_KEY_EXP_DONE  BIT(11)
+#define SB_CRYPTO_BUSY          BIT(10)
+#define OTP_WP_EN               BIT(9)
+#define OTP_ADDR_WP_EN          BIT(8)
+#define LOW_SEC_KEY_EN          BIT(7)
+#define SECURE_BOOT_EN          BIT(6)
+#define UART_BOOT_EN            BIT(5)
+/* bit 4 reserved*/
+#define OTP_CHARGE_PUMP_READY   BIT(3)
+#define OTP_IDLE                BIT(2)
+#define OTP_MEM_IDLE            BIT(1)
+#define OTP_COMPARE_STATUS      BIT(0)
+
+/* QSR */
+#define QSR_RSA_MASK           (0x3 << 12)
+#define QSR_HASH_MASK          (0x3 << 10)
+
 static uint64_t aspeed_sbc_read(void *opaque, hwaddr addr, unsigned int size)
 {
     AspeedSBCState *s = ASPEED_SBC(opaque);
@@ -80,8 +102,17 @@ static void aspeed_sbc_reset(DeviceState *dev)
     memset(s->regs, 0, sizeof(s->regs));
 
     /* Set secure boot enabled with RSA4096_SHA256 and enable eMMC ABR */
-    s->regs[R_STATUS] = 0x000044C6;
-    s->regs[R_QSR] = 0x07C07C89;
+    s->regs[R_STATUS] = OTP_IDLE | OTP_MEM_IDLE;
+
+    if (s->emmc_abr) {
+        s->regs[R_STATUS] &= ABR_EN;
+    }
+
+    if (s->signing_settings) {
+        s->regs[R_STATUS] &= SECURE_BOOT_EN;
+    }
+
+    s->regs[R_QSR] = s->signing_settings;
 }
 
 static void aspeed_sbc_realize(DeviceState *dev, Error **errp)
@@ -105,6 +136,12 @@ static const VMStateDescription vmstate_aspeed_sbc = {
     }
 };
 
+static Property aspeed_sbc_properties[] = {
+    DEFINE_PROP_BOOL("emmc-abr", AspeedSBCState, emmc_abr, 0),
+    DEFINE_PROP_UINT32("signing-settings", AspeedSBCState, signing_settings, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void aspeed_sbc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -112,6 +149,7 @@ static void aspeed_sbc_class_init(ObjectClass *klass, void *data)
     dc->realize = aspeed_sbc_realize;
     dc->reset = aspeed_sbc_reset;
     dc->vmsd = &vmstate_aspeed_sbc;
+    device_class_set_props(dc, aspeed_sbc_properties);
 }
 
 static const TypeInfo aspeed_sbc_info = {
-- 
2.35.3


