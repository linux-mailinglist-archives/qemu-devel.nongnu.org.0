Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE4E4FB004
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Apr 2022 22:08:16 +0200 (CEST)
Received: from localhost ([::1]:42074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nddr4-00048J-Fz
	for lists+qemu-devel@lfdr.de; Sun, 10 Apr 2022 16:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clabbe@baylibre.com>)
 id 1ndczW-0000NR-Ag
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 15:12:54 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <clabbe@baylibre.com>)
 id 1ndczS-00008V-Sr
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 15:12:53 -0400
Received: by mail-wr1-x42a.google.com with SMTP id w4so20052883wrg.12
 for <qemu-devel@nongnu.org>; Sun, 10 Apr 2022 12:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3CZBRJSMWWtdPs7tADRIMiY5uDDqazoeCb5BceM9tX4=;
 b=lGBmTI5i/RkvafoPw+KUl/ZGht3ZofkkRH3tDC8x7H+NCoivlP19JHaV1pToOyL8wM
 qouyWbAfCBvDZTMc79DVIwp+ghigbLhFi2D4WI0XJ1i2q77CUTKNHFob21YAQPYGDtZh
 7cvg0KgsAykUHaIkTA+bq31MeVFYUmdgf7yPzA0cP0TBw6/2vImY8AgGRPkBH+s3Kygo
 EEL+lTm8/AuB4FtdOrsv8rySAkhEX96VJyRoMWWz9aqsrpfA+s78I/mmHDpnwJ2VUbvR
 EFhnN1QgmzmYqJp1v2rMx4rHfSyofwZ2Nnzbdo4VNLzD2iNUu6SDQvqgPt6hB5ebNjFk
 YLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3CZBRJSMWWtdPs7tADRIMiY5uDDqazoeCb5BceM9tX4=;
 b=O+zlKTzrvhcWYOyGtT43KJT6P1VxL6jBOfgu6fg8ZHWK+7dxIagmL6/2M/HDjbHLl1
 qsNXCFVp7R3e+hXGTow9fj4hCirAVfANLTgLOgCDYfU5A10a6BDh4pdrGKtuUiROKtNT
 j2AwUNc4C8ncBuEU3HaxatKu3BUxj6WJ2DBHQhJuG1u6GFbibjs9+vU+CBtg5m1OJUgX
 h78PgzX12iYxC1m447MMuYcBnUAWKYsSfGp/J05DYiI5V6vHpXAgdp/jagJ0qMKmVpyt
 gUPB2h9Txh7scKlQRCpzCV2BJwgftiLSjPssL+OZfXqvn7krNd57aQj8RM/1H8azwi43
 b7cQ==
X-Gm-Message-State: AOAM530PkFYLZk3RKMDBbizQSVOAIcC/9pFcV2jB9qEO8iVPWUVO6xH0
 smU8JTUgZGLWcr0sXLIahVgBcw==
X-Google-Smtp-Source: ABdhPJyIN2LzT0/uGue8nGlSJpv/zrR4o9rN37E+kkD16ppXs9Ja3bqWHQ6VsqYfhPJTXVDB6aB7LQ==
X-Received: by 2002:a05:6000:8f:b0:207:9e47:c2f8 with SMTP id
 m15-20020a056000008f00b002079e47c2f8mr6508029wrx.379.1649617968038; 
 Sun, 10 Apr 2022 12:12:48 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id
 f66-20020a1c3845000000b0038eb64a52b5sm3216875wma.43.2022.04.10.12.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 12:12:47 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: peter.maydell@linaro.org, b.galvani@gmail.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: [PATCH] hw/crypto: add Allwinner sun4i-ss crypto device
Date: Sun, 10 Apr 2022 19:12:38 +0000
Message-Id: <20220410191238.760733-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=clabbe@baylibre.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 10 Apr 2022 16:01:29 -0400
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
Cc: Corentin LABBE <clabbe@baylibre.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Corentin LABBE <clabbe@baylibre.com>

The Allwinner A10 has a cryptographic offloader device which
could be easily emulated.
The emulated device is tested with Linux only as any of BSD does not
support it.

Signed-off-by: Corentin LABBE <clabbe@baylibre.com>
---
 MAINTAINERS                                |   8 +
 docs/system/arm/cubieboard.rst             |   1 +
 docs/system/devices/allwinner-sun4i-ss.rst |  31 +
 hw/Kconfig                                 |   1 +
 hw/arm/Kconfig                             |   1 +
 hw/arm/allwinner-a10.c                     |  11 +
 hw/crypto/Kconfig                          |   2 +
 hw/crypto/allwinner-sun4i-ss.c             | 688 +++++++++++++++++++++
 hw/crypto/meson.build                      |   3 +
 hw/crypto/trace-events                     |   3 +
 hw/crypto/trace.h                          |   1 +
 hw/meson.build                             |   1 +
 include/hw/arm/allwinner-a10.h             |   2 +
 include/hw/crypto/allwinner-sun4i-ss.h     |  72 +++
 meson.build                                |   1 +
 15 files changed, 826 insertions(+)
 create mode 100644 docs/system/devices/allwinner-sun4i-ss.rst
 create mode 100644 hw/crypto/Kconfig
 create mode 100644 hw/crypto/allwinner-sun4i-ss.c
 create mode 100644 hw/crypto/meson.build
 create mode 100644 hw/crypto/trace-events
 create mode 100644 hw/crypto/trace.h
 create mode 100644 include/hw/crypto/allwinner-sun4i-ss.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 4ad2451e03..f07d9713af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -583,6 +583,14 @@ F: include/hw/*/allwinner-h3*
 F: hw/arm/orangepi.c
 F: docs/system/arm/orangepi.rst
 
+Allwinner sun4i-ss cryptographic offloader
+M: Corentin LABBE <clabbe@baylibre.com>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/crypto/allwinner-*
+F: include/hw/crypto/allwinner-*
+F: docs/system/arm/orangepi.rst
+
 ARM PrimeCell and CMSDK devices
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
diff --git a/docs/system/arm/cubieboard.rst b/docs/system/arm/cubieboard.rst
index 344ff8cef9..7836643ba4 100644
--- a/docs/system/arm/cubieboard.rst
+++ b/docs/system/arm/cubieboard.rst
@@ -14,3 +14,4 @@ Emulated devices:
 - SDHCI
 - USB controller
 - SATA controller
+- crypto
diff --git a/docs/system/devices/allwinner-sun4i-ss.rst b/docs/system/devices/allwinner-sun4i-ss.rst
new file mode 100644
index 0000000000..6e7d2142b5
--- /dev/null
+++ b/docs/system/devices/allwinner-sun4i-ss.rst
@@ -0,0 +1,31 @@
+Allwinner sun4i-ss
+==================
+
+The ``sun4i-ss`` emulates the Allwinner cryptographic offloader
+present on early Allwinner SoCs (A10, A10s, A13, A20, A33)
+In qemu only A10 via the cubieboard machine is supported.
+
+The emulated hardware is capable of handling the following algorithms:
+- SHA1 and MD5 hash algorithms
+- AES/DES/DES3 in CBC/ECB
+- PRNG
+
+The emulated hardware does not handle yet:
+- CTS for AES
+- CTR for AES/DES/DES3
+- IRQ and DMA mode
+Anyway the Linux driver also does not handle them yet.
+
+The emulation needs a real crypto backend, for the moment only gnutls/nettle is supported.
+So the device emulation needs qemu to be compiled with optionnal gnutls.
+
+Emulation limit
+---------------
+
+PRNG:
+The PRNG is not really emulated as its internal is not known.
+It is replaced by the g_random_int function from glib.
+
+SPEED:
+The emulated hardware is ""faster"" than real hw as any write
+already give results immediatly instead of a few delay in real HW.
diff --git a/hw/Kconfig b/hw/Kconfig
index ad20cce0a9..43bd7fc14d 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -6,6 +6,7 @@ source audio/Kconfig
 source block/Kconfig
 source char/Kconfig
 source core/Kconfig
+source crypto/Kconfig
 source display/Kconfig
 source dma/Kconfig
 source gpio/Kconfig
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 97f3b38019..fd8232b1d4 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -317,6 +317,7 @@ config ALLWINNER_A10
     select AHCI
     select ALLWINNER_A10_PIT
     select ALLWINNER_A10_PIC
+    select ALLWINNER_CRYPTO_SUN4I_SS
     select ALLWINNER_EMAC
     select SERIAL
     select UNIMP
diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 05e84728cb..e9104ee028 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -23,6 +23,7 @@
 #include "hw/misc/unimp.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
+#include "hw/crypto/allwinner-sun4i-ss.h"
 #include "hw/usb/hcd-ohci.h"
 
 #define AW_A10_MMC0_BASE        0x01c0f000
@@ -32,6 +33,7 @@
 #define AW_A10_EMAC_BASE        0x01c0b000
 #define AW_A10_EHCI_BASE        0x01c14000
 #define AW_A10_OHCI_BASE        0x01c14400
+#define AW_A10_CRYPTO_BASE      0x01c15000
 #define AW_A10_SATA_BASE        0x01c18000
 #define AW_A10_RTC_BASE         0x01c20d00
 
@@ -48,6 +50,10 @@ static void aw_a10_init(Object *obj)
 
     object_initialize_child(obj, "emac", &s->emac, TYPE_AW_EMAC);
 
+#if defined CONFIG_NETTLE
+    object_initialize_child(obj, "crypto", &s->crypto, TYPE_AW_SUN4I_SS);
+#endif
+
     object_initialize_child(obj, "sata", &s->sata, TYPE_ALLWINNER_AHCI);
 
     if (machine_usb(current_machine)) {
@@ -115,6 +121,11 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(sysbusdev, 0, AW_A10_EMAC_BASE);
     sysbus_connect_irq(sysbusdev, 0, qdev_get_gpio_in(dev, 55));
 
+#if defined CONFIG_NETTLE
+    sysbus_realize(SYS_BUS_DEVICE(&s->crypto), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->crypto), 0, AW_A10_CRYPTO_BASE);
+#endif
+
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->sata), errp)) {
         return;
     }
diff --git a/hw/crypto/Kconfig b/hw/crypto/Kconfig
new file mode 100644
index 0000000000..5ecfe44b10
--- /dev/null
+++ b/hw/crypto/Kconfig
@@ -0,0 +1,2 @@
+config ALLWINNER_CRYPTO_SUN4I_SS
+    bool
diff --git a/hw/crypto/allwinner-sun4i-ss.c b/hw/crypto/allwinner-sun4i-ss.c
new file mode 100644
index 0000000000..e7d85646e6
--- /dev/null
+++ b/hw/crypto/allwinner-sun4i-ss.c
@@ -0,0 +1,688 @@
+/*
+ * Allwinner sun4i-ss cryptographic offloader emulation
+ *
+ * Copyright (C) 2022 Corentin Labbe <clabbe@baylibre.com>
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qapi/error.h"
+#include "hw/sysbus.h"
+#include "migration/vmstate.h"
+#include "hw/irq.h"
+#include "qemu/log.h"
+#include "trace.h"
+#include "qemu/module.h"
+#include "exec/cpu-common.h"
+#include "hw/crypto/allwinner-sun4i-ss.h"
+
+#include <nettle/aes.h>
+#include <nettle/cbc.h>
+#include <nettle/des.h>
+#include <nettle/md5.h>
+#include <nettle/sha1.h>
+
+#define SS_IV_ARBITRARY (1 << 14)
+
+/* SS operation mode - bits 12-13 */
+#define SS_ECB (0 << 12)
+#define SS_CBC (1 << 12)
+
+/* Key size for AES - bits 8-9 */
+#define SS_AES_128BITS (0 << 8)
+#define SS_AES_192BITS (1 << 8)
+#define SS_AES_256BITS (2 << 8)
+
+/* Operation direction - bit 7 */
+#define SS_ENCRYPTION  (0 << 7)
+#define SS_DECRYPTION  (1 << 7)
+
+/* SS Method - bits 4-6 */
+#define SS_OP_AES      (0 << 4)
+#define SS_OP_DES      (1 << 4)
+#define SS_OP_3DES     (2 << 4)
+#define SS_OP_SHA1     (3 << 4)
+#define SS_OP_MD5      (4 << 4)
+#define SS_OP_PRNG     (5 << 4)
+
+/* Data end bit - bit 2 */
+#define SS_DATA_END (1 << 2)
+
+/* SS Enable bit - bit 0 */
+#define SS_ENABLED (1 << 0)
+
+enum {
+    REG_CTL        = 0x0000,
+    REG_KEY_0      = 0x0004,
+    REG_KEY_1      = 0x0008,
+    REG_KEY_2      = 0x000c,
+    REG_KEY_3      = 0x0010,
+    REG_KEY_4      = 0x0014,
+    REG_KEY_5      = 0x0018,
+    REG_KEY_6      = 0x001c,
+    REG_KEY_7      = 0x0020,
+    REG_IV_0       = 0x0024,
+    REG_IV_1       = 0x0028,
+    REG_IV_2       = 0x002c,
+    REG_IV_3       = 0x0030,
+    REG_IV_4       = 0x0034,
+    REG_FCSR       = 0x0044,
+    REG_ICSR       = 0x0048,
+    REG_MD0        = 0x004c,
+    REG_MD1        = 0x0050,
+    REG_MD2        = 0x0054,
+    REG_MD3        = 0x0058,
+    REG_MD4        = 0x005c,
+    REG_RXFIFO     = 0x0200,
+    REG_TXFIFO     = 0x0204,
+};
+
+static void allwinner_sun4i_ss_try_work(AwSun4iSSState *s);
+
+/* return number of possible operation wih block size=bs */
+static unsigned int can_work(AwSun4iSSState *s, unsigned int bs)
+{
+    unsigned int avail_rx = s->rxc / (bs / 4);
+    unsigned int free_space_tx = (SS_TX_MAX - s->txc) / (bs / 4);
+
+    if (avail_rx > free_space_tx) {
+        return free_space_tx;
+    }
+    return avail_rx;
+}
+
+/*
+ * Without any knowledge on the PRNG, the only solution is
+ * to emulate it via g_random_int()
+ */
+static void do_prng(AwSun4iSSState *s)
+{
+    unsigned int size = 20;
+    int i;
+
+    for (i = 0; i < size / 4; i++) {
+        s->tx[i] = g_random_int();
+    }
+    s->txc += size / 4;
+}
+
+/* remove pop u32 words from RX */
+static void rx_pop(AwSun4iSSState *s, unsigned int pop)
+{
+    uint32_t *rx = (uint32_t *)s->rx;
+    int i;
+
+    for (i = 0; i < s->rxc; i++) {
+        rx[i] = rx[i + pop];
+    }
+}
+
+static void do_md5(AwSun4iSSState *s)
+{
+    unsigned int size = MD5_BLOCK_SIZE;
+    unsigned char *src = s->rx;
+
+    nettle_md5_compress(s->md, src);
+
+    s->rxc -= size / 4;
+    if (s->rxc > 0) {
+        rx_pop(s, size / 4);
+        allwinner_sun4i_ss_try_work(s);
+    }
+}
+
+static void do_sha1(AwSun4iSSState *s)
+{
+    unsigned int size = SHA1_BLOCK_SIZE;
+    unsigned char *src = s->rx;
+
+    nettle_sha1_compress(s->md, src);
+
+    s->rxc -= size / 4;
+    if (s->rxc > 0) {
+        rx_pop(s, size / 4);
+        allwinner_sun4i_ss_try_work(s);
+    }
+}
+
+static void do_des(AwSun4iSSState *s)
+{
+    struct CBC_CTX(struct des_ctx, DES_BLOCK_SIZE) cdes;
+    struct des_ctx des;
+    unsigned char *src = s->rx;
+    unsigned char *dst = s->tx + s->txc * 4;
+    unsigned char *key = (unsigned char *)s->key;
+    unsigned int size = DES_BLOCK_SIZE;
+    unsigned char biv[DES_BLOCK_SIZE];
+
+    if (s->ctl & SS_DECRYPTION) {
+        memcpy(biv, src, DES_BLOCK_SIZE);
+    }
+
+    if (s->ctl & SS_CBC) {
+        CBC_SET_IV(&cdes, s->iv);
+        if (s->ctl & SS_DECRYPTION) {
+            des_set_key(&cdes.ctx, key);
+            CBC_DECRYPT(&cdes, des_decrypt, size, dst, src);
+        } else {
+            des_set_key(&cdes.ctx, key);
+            CBC_ENCRYPT(&cdes, des_encrypt, size, dst, src);
+        }
+        /* Copy next IV in registers */
+        if (s->ctl & SS_DECRYPTION) {
+            memcpy(s->iv, biv, DES_BLOCK_SIZE);
+        } else {
+            memcpy(s->iv, dst, DES_BLOCK_SIZE);
+        }
+    } else {
+        if (s->ctl & SS_DECRYPTION) {
+            des_set_key(&des, key);
+            des_decrypt(&des, size, dst, src);
+        } else {
+                des_set_key(&des, key);
+                des_encrypt(&des, size, dst, src);
+            }
+    }
+    s->txc += size / 4;
+    s->rxc -= size / 4;
+
+    if (s->rxc > 0) {
+        rx_pop(s, size / 4);
+        allwinner_sun4i_ss_try_work(s);
+    }
+}
+
+static void do_des3(AwSun4iSSState *s)
+{
+    struct CBC_CTX(struct des3_ctx, DES3_BLOCK_SIZE) cdes3;
+    struct des3_ctx des3;
+    unsigned char *src = s->rx;
+    unsigned char *dst = s->tx + s->txc * 4;
+    unsigned char *key = (unsigned char *)s->key;
+    unsigned int size = DES3_BLOCK_SIZE;
+    unsigned char biv[DES3_BLOCK_SIZE];
+
+    if (s->ctl & SS_DECRYPTION) {
+        memcpy(biv, src, DES3_BLOCK_SIZE);
+    }
+
+    if (s->ctl & SS_CBC) {
+        CBC_SET_IV(&cdes3, s->iv);
+        if (s->ctl & SS_DECRYPTION) {
+            des3_set_key(&cdes3.ctx, key);
+            CBC_DECRYPT(&cdes3, des3_decrypt, size, dst, src);
+        } else {
+            des3_set_key(&cdes3.ctx, key);
+            CBC_ENCRYPT(&cdes3, des3_encrypt, size, dst, src);
+        }
+        /* Copy next IV in registers */
+        if (s->ctl & SS_DECRYPTION) {
+            memcpy(s->iv, biv, DES3_BLOCK_SIZE);
+        } else {
+            memcpy(s->iv, dst, DES3_BLOCK_SIZE);
+        }
+    } else {
+        if (s->ctl & SS_DECRYPTION) {
+            des3_set_key(&des3, key);
+            des3_decrypt(&des3, size, dst, src);
+        } else {
+            des3_set_key(&des3, key);
+            des3_encrypt(&des3, size, dst, src);
+        }
+    }
+    s->txc += size / 4;
+    s->rxc -= size / 4;
+
+    if (s->rxc > 0) {
+        rx_pop(s, size / 4);
+        allwinner_sun4i_ss_try_work(s);
+    }
+}
+
+static void do_aes(AwSun4iSSState *s)
+{
+    struct CBC_CTX(struct aes128_ctx, AES_BLOCK_SIZE) aes128;
+    struct CBC_CTX(struct aes192_ctx, AES_BLOCK_SIZE) aes192;
+    struct CBC_CTX(struct aes256_ctx, AES_BLOCK_SIZE) aes256;
+    struct aes128_ctx ecb128;
+    struct aes192_ctx ecb192;
+    struct aes256_ctx ecb256;
+    unsigned char *src = s->rx;
+    unsigned char *dst = s->tx + s->txc * 4;
+    unsigned char *key = (unsigned char *)s->key;
+    unsigned int size = AES_BLOCK_SIZE;
+    unsigned char biv[AES_BLOCK_SIZE];
+
+    if (s->ctl & SS_DECRYPTION) {
+        memcpy(biv, src, AES_BLOCK_SIZE);
+    }
+
+    if (s->ctl & SS_CBC) {
+        switch (s->ctl & 0x300) {
+        case SS_AES_128BITS:
+            CBC_SET_IV(&aes128, s->iv);
+
+            if (s->ctl & SS_DECRYPTION) {
+                aes128_set_decrypt_key(&aes128.ctx, key);
+                CBC_DECRYPT(&aes128, aes128_decrypt, size, dst, src);
+            } else {
+                aes128_set_encrypt_key(&aes128.ctx, key);
+                CBC_ENCRYPT(&aes128, aes128_encrypt, size, dst, src);
+            }
+            break;
+        case SS_AES_192BITS:
+            CBC_SET_IV(&aes192, s->iv);
+
+            if (s->ctl & SS_DECRYPTION) {
+                aes192_set_decrypt_key(&aes192.ctx, key);
+                CBC_DECRYPT(&aes192, aes192_decrypt, size, dst, src);
+            } else {
+                aes192_set_encrypt_key(&aes192.ctx, key);
+                CBC_ENCRYPT(&aes192, aes192_encrypt, size, dst, src);
+            }
+            break;
+        case SS_AES_256BITS:
+            CBC_SET_IV(&aes256, s->iv);
+
+            if (s->ctl & SS_DECRYPTION) {
+                aes256_set_decrypt_key(&aes256.ctx, key);
+                CBC_DECRYPT(&aes256, aes256_decrypt, size, dst, src);
+            } else {
+                aes256_set_encrypt_key(&aes256.ctx, key);
+                CBC_ENCRYPT(&aes256, aes256_encrypt, size, dst, src);
+            }
+            break;
+        }
+        /* Copy next IV in registers */
+        if (s->ctl & SS_DECRYPTION) {
+            memcpy(s->iv, biv, AES_BLOCK_SIZE);
+        } else {
+            memcpy(s->iv, dst, AES_BLOCK_SIZE);
+        }
+    } else {
+        switch (s->ctl & 0x300) {
+        case SS_AES_128BITS:
+            if (s->ctl & SS_DECRYPTION) {
+                aes128_set_decrypt_key(&ecb128, key);
+                aes128_decrypt(&ecb128, size, dst, src);
+            } else {
+                aes128_set_encrypt_key(&ecb128, key);
+                aes128_encrypt(&ecb128, size, dst, src);
+            }
+            break;
+        case SS_AES_192BITS:
+            if (s->ctl & SS_DECRYPTION) {
+                aes192_set_decrypt_key(&ecb192, key);
+                aes192_decrypt(&ecb192, size, dst, src);
+            } else {
+                aes192_set_encrypt_key(&ecb192, key);
+                aes192_encrypt(&ecb192, size, dst, src);
+            }
+            break;
+        case SS_AES_256BITS:
+            if (s->ctl & SS_DECRYPTION) {
+                aes256_set_decrypt_key(&ecb256, (const unsigned char *) s->key);
+                aes256_decrypt(&ecb256, size, dst, src);
+            } else {
+                aes256_set_encrypt_key(&ecb256, (const unsigned char *) s->key);
+                aes256_encrypt(&ecb256, size, dst, src);
+            }
+            break;
+        }
+    }
+    s->txc += size / 4;
+    s->rxc -= size / 4;
+
+    if (s->rxc > 0) {
+        rx_pop(s, size / 4);
+        allwinner_sun4i_ss_try_work(s);
+    }
+}
+
+static void allwinner_sun4i_ss_update_fcsr(AwSun4iSSState *s)
+{
+    s->fcsr = (s->txc << 16) | ((32 - s->rxc) << 24);
+}
+
+static void allwinner_sun4i_ss_try_work(AwSun4iSSState *s)
+{
+    if (!(s->ctl & SS_ENABLED)) {
+        return;
+    }
+    if ((s->ctl & 0x70) == SS_OP_AES && can_work(s, AES_BLOCK_SIZE)) {
+        do_aes(s);
+        allwinner_sun4i_ss_update_fcsr(s);
+        return;
+    }
+    if ((s->ctl & 0x70) == SS_OP_DES && can_work(s, DES_BLOCK_SIZE)) {
+        do_des(s);
+        allwinner_sun4i_ss_update_fcsr(s);
+        return;
+    }
+    if ((s->ctl & 0x70) == SS_OP_3DES && can_work(s, DES3_BLOCK_SIZE)) {
+        do_des3(s);
+        allwinner_sun4i_ss_update_fcsr(s);
+        return;
+    }
+    if ((s->ctl & 0x70) == SS_OP_MD5 && s->rxc >= MD5_BLOCK_SIZE / 4) {
+        do_md5(s);
+        allwinner_sun4i_ss_update_fcsr(s);
+        return;
+    }
+    if ((s->ctl & 0x70) == SS_OP_SHA1 && s->rxc >= SHA1_BLOCK_SIZE / 4) {
+        do_sha1(s);
+        allwinner_sun4i_ss_update_fcsr(s);
+        return;
+    }
+    if ((s->ctl & 0x70) == SS_OP_PRNG) {
+        do_prng(s);
+        allwinner_sun4i_ss_update_fcsr(s);
+        return;
+    }
+}
+
+static uint32_t tx_pop(AwSun4iSSState *s)
+{
+    uint32_t *tx = (uint32_t *)s->tx;
+    uint32_t v = 0;
+    int i;
+
+    if (s->txc > 0) {
+        v = tx[0];
+        s->txc--;
+        for (i = 0; i < s->txc; i++) {
+            tx[i] = tx[i + 1];
+        }
+        allwinner_sun4i_ss_update_fcsr(s);
+        allwinner_sun4i_ss_try_work(s);
+    }
+    return v;
+}
+
+static void allwinner_sun4i_ss_reset_common(AwSun4iSSState *s)
+{
+    s->ctl = 0;
+    s->txc = 0;
+    s->rxc = 0;
+    allwinner_sun4i_ss_update_fcsr(s);
+}
+
+static void allwinner_sun4i_ss_reset(DeviceState *dev)
+{
+    AwSun4iSSState *s = AW_SUN4I_SS(dev);
+
+    trace_allwinner_sun4i_ss_reset();
+
+    allwinner_sun4i_ss_reset_common(s);
+}
+
+static uint64_t allwinner_sun4i_ss_read(void *opaque, hwaddr offset,
+                                          unsigned size)
+{
+    AwSun4iSSState *s = AW_SUN4I_SS(opaque);
+    uint64_t value = 0;
+
+    switch (offset) {
+    case REG_CTL:
+        value = s->ctl;
+        break;
+    case REG_IV_0:
+        value = s->iv[0];
+        break;
+    case REG_IV_1:
+        value = s->iv[1];
+        break;
+    case REG_IV_2:
+        value = s->iv[2];
+        break;
+    case REG_IV_3:
+        value = s->iv[3];
+        break;
+    case REG_IV_4:
+        value = s->iv[4];
+        break;
+    case REG_FCSR:
+        value = s->fcsr;
+        break;
+    case REG_KEY_0:
+        value = s->key[0];
+        break;
+    case REG_KEY_1:
+        value = s->key[1];
+        break;
+    case REG_KEY_2:
+        value = s->key[2];
+        break;
+    case REG_KEY_3:
+        value = s->key[3];
+        break;
+    case REG_KEY_4:
+        value = s->key[4];
+        break;
+    case REG_KEY_5:
+        value = s->key[5];
+        break;
+    case REG_KEY_6:
+        value = s->key[6];
+        break;
+    case REG_KEY_7:
+        value = s->key[7];
+        break;
+    case REG_MD0:
+        value = s->md[0];
+        break;
+    case REG_MD1:
+        value = s->md[1];
+        break;
+    case REG_MD2:
+        value = s->md[2];
+        break;
+    case REG_MD3:
+        value = s->md[3];
+        break;
+    case REG_MD4:
+        value = s->md[4];
+        break;
+    case REG_TXFIFO:
+        value = tx_pop(s);
+        break;
+    case REG_RXFIFO:
+        value = s->rx[0];
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "allwinner_sun4i_ss: read access to unknown "
+                                 "CRYPTO register 0x" TARGET_FMT_plx "\n",
+                                  offset);
+    }
+
+    trace_allwinner_sun4i_ss_read(offset, value);
+    return value;
+}
+
+static void rx_push(AwSun4iSSState *s, uint32_t value)
+{
+    uint32_t *rx = (uint32_t *)s->rx;
+
+    if (!(s->ctl & SS_ENABLED)) {
+        return;
+    }
+    if (s->rxc > SS_RX_MAX) {
+        return;
+    }
+    rx[s->rxc] = value;
+    s->rxc++;
+    allwinner_sun4i_ss_update_fcsr(s);
+    allwinner_sun4i_ss_try_work(s);
+
+    return;
+}
+
+static void allwinner_sun4i_ss_write(void *opaque, hwaddr offset,
+                                       uint64_t value, unsigned size)
+{
+    AwSun4iSSState *s = AW_SUN4I_SS(opaque);
+    bool was_disabled = !(s->ctl & SS_ENABLED);
+
+    trace_allwinner_sun4i_ss_write(offset, value);
+
+    switch (offset) {
+    case REG_CTL:
+        s->ctl = value;
+        if (!(s->ctl & SS_ENABLED)) {
+            allwinner_sun4i_ss_reset_common(s);
+            break;
+        }
+        if (was_disabled) {
+            if (s->ctl & SS_IV_ARBITRARY) {
+                s->md[0] = s->iv[0];
+                s->md[1] = s->iv[1];
+                s->md[2] = s->iv[2];
+                s->md[3] = s->iv[3];
+                s->md[4] = s->iv[4];
+            } else {
+                if ((s->ctl & 0x70) == SS_OP_MD5) {
+                    s->md[0] = 0x67452301;
+                    s->md[1] = 0xefcdab89;
+                    s->md[2] = 0x98badcfe;
+                    s->md[3] = 0x10325476;
+                } else {
+                    s->md[0] = 0x67452301;
+                    s->md[1] = 0xefcdab89;
+                    s->md[2] = 0x98badcfe;
+                    s->md[3] = 0x10325476;
+                    s->md[4] = 0xC3D2E1F0;
+                }
+            }
+        }
+        if ((s->ctl & 0x70) == SS_OP_PRNG) {
+            do_prng(s);
+            allwinner_sun4i_ss_update_fcsr(s);
+        }
+        if ((s->ctl & 0x70) == SS_OP_MD5 && s->ctl & SS_DATA_END) {
+            s->ctl &= ~SS_DATA_END;
+            return;
+        }
+        if ((s->ctl & 0x70) == SS_OP_SHA1 && s->ctl & SS_DATA_END) {
+            s->ctl &= ~SS_DATA_END;
+            return;
+        }
+        break;
+    case REG_IV_0:
+        s->iv[0] = value;
+        break;
+    case REG_IV_1:
+        s->iv[1] = value;
+        break;
+    case REG_IV_2:
+        s->iv[2] = value;
+        break;
+    case REG_IV_3:
+        s->iv[3] = value;
+        break;
+    case REG_IV_4:
+        s->iv[4] = value;
+        break;
+    case REG_KEY_0:
+        s->key[0] = value;
+        break;
+    case REG_KEY_1:
+        s->key[1] = value;
+        break;
+    case REG_KEY_2:
+        s->key[2] = value;
+        break;
+    case REG_KEY_3:
+        s->key[3] = value;
+        break;
+    case REG_KEY_4:
+        s->key[4] = value;
+        break;
+    case REG_KEY_5:
+        s->key[5] = value;
+        break;
+    case REG_KEY_6:
+        s->key[6] = value;
+        break;
+    case REG_KEY_7:
+        s->key[7] = value;
+        break;
+    case REG_RXFIFO:
+        rx_push(s, value);
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "allwinner_sun4i_ss: write access to unknown "
+                                 "CRYPTO register 0x" TARGET_FMT_plx "\n",
+                                  offset);
+    }
+}
+
+static const MemoryRegionOps allwinner_sun4i_ss_mem_ops = {
+    .read = allwinner_sun4i_ss_read,
+    .write = allwinner_sun4i_ss_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+    .impl.min_access_size = 4,
+};
+
+static void allwinner_sun4i_ss_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    AwSun4iSSState *s = AW_SUN4I_SS(obj);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &allwinner_sun4i_ss_mem_ops,
+                           s, TYPE_AW_SUN4I_SS, 4 * KiB);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static const VMStateDescription vmstate_allwinner_sun4i_ss = {
+    .name = "allwinner-sun4i-ss",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(ctl, AwSun4iSSState),
+        VMSTATE_UINT32(fcsr, AwSun4iSSState),
+        VMSTATE_UINT32_ARRAY(iv, AwSun4iSSState, 5),
+        VMSTATE_UINT32_ARRAY(key, AwSun4iSSState, 8),
+        VMSTATE_UINT32_ARRAY(md, AwSun4iSSState, 5),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void allwinner_sun4i_ss_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = allwinner_sun4i_ss_reset;
+    dc->vmsd = &vmstate_allwinner_sun4i_ss;
+}
+
+static const TypeInfo allwinner_sun4i_ss_info = {
+    .name           = TYPE_AW_SUN4I_SS,
+    .parent         = TYPE_SYS_BUS_DEVICE,
+    .instance_size  = sizeof(AwSun4iSSState),
+    .instance_init  = allwinner_sun4i_ss_init,
+    .class_init     = allwinner_sun4i_ss_class_init,
+};
+
+static void allwinner_sun4i_ss_register_types(void)
+{
+    type_register_static(&allwinner_sun4i_ss_info);
+}
+
+type_init(allwinner_sun4i_ss_register_types)
diff --git a/hw/crypto/meson.build b/hw/crypto/meson.build
new file mode 100644
index 0000000000..4368e1e401
--- /dev/null
+++ b/hw/crypto/meson.build
@@ -0,0 +1,3 @@
+if nettle.found()
+    softmmu_ss.add(when: 'CONFIG_ALLWINNER_CRYPTO_SUN4I_SS', if_true: files('allwinner-sun4i-ss.c'))
+endif
diff --git a/hw/crypto/trace-events b/hw/crypto/trace-events
new file mode 100644
index 0000000000..39739b317b
--- /dev/null
+++ b/hw/crypto/trace-events
@@ -0,0 +1,3 @@
+allwinner_sun4i_ss_reset(void) "HW reset"
+allwinner_sun4i_ss_read(uint64_t offset, uint64_t val) "MMIO read: offset=0x%" PRIx64 " value=0x%" PRIx64
+allwinner_sun4i_ss_write(uint64_t offset, uint64_t val) "MMIO write: offset=0x%" PRIx64 " value=0x%" PRIx64
diff --git a/hw/crypto/trace.h b/hw/crypto/trace.h
new file mode 100644
index 0000000000..36d01d937d
--- /dev/null
+++ b/hw/crypto/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_crypto.h"
diff --git a/hw/meson.build b/hw/meson.build
index b3366c888e..b8d2cdcc38 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -6,6 +6,7 @@ subdir('block')
 subdir('char')
 subdir('core')
 subdir('cpu')
+subdir('crypto')
 subdir('display')
 subdir('dma')
 subdir('gpio')
diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index a76dc7b84d..d5b1d3f616 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -4,6 +4,7 @@
 #include "qemu/error-report.h"
 #include "hw/char/serial.h"
 #include "hw/arm/boot.h"
+#include "hw/crypto/allwinner-sun4i-ss.h"
 #include "hw/timer/allwinner-a10-pit.h"
 #include "hw/intc/allwinner-a10-pic.h"
 #include "hw/net/allwinner_emac.h"
@@ -33,6 +34,7 @@ struct AwA10State {
     AwA10PITState timer;
     AwA10PICState intc;
     AwEmacState emac;
+    AwSun4iSSState crypto;
     AllwinnerAHCIState sata;
     AwSdHostState mmc0;
     AwRtcState rtc;
diff --git a/include/hw/crypto/allwinner-sun4i-ss.h b/include/hw/crypto/allwinner-sun4i-ss.h
new file mode 100644
index 0000000000..e604819ad0
--- /dev/null
+++ b/include/hw/crypto/allwinner-sun4i-ss.h
@@ -0,0 +1,72 @@
+/*
+ * Allwinner sun4i-ss cryptographic offloader emulation
+ *
+ * Copyright (C) 2022 Corentin Labbe <clabbe@baylibre.com>
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_CRYPTO_ALLWINNER_SUN4I_SS_H
+#define HW_CRYPTO_ALLWINNER_SUN4I_SS_H
+
+#include "qom/object.h"
+#include "hw/sysbus.h"
+
+#define SS_RX_MAX     32
+#define SS_RX_DEFAULT SS_RX_MAX
+#define SS_TX_MAX     33
+
+/**
+ * Object model
+ * @{
+ */
+
+#define TYPE_AW_SUN4I_SS "allwinner-sun4i-ss"
+OBJECT_DECLARE_SIMPLE_TYPE(AwSun4iSSState, AW_SUN4I_SS)
+
+/** @} */
+
+/**
+ * Allwinner sun4i-ss crypto object instance state
+ */
+struct AwSun4iSSState {
+    /*< private >*/
+    SysBusDevice  parent_obj;
+    /*< public >*/
+
+    /** Maps I/O registers in physical memory */
+    MemoryRegion iomem;
+
+    /** @} */
+    unsigned char rx[SS_RX_MAX * 4];
+    unsigned int rxc;
+    unsigned char tx[SS_TX_MAX * 4];
+    unsigned int txc;
+
+    /**
+     * @name Hardware Registers
+     * @{
+     */
+
+    uint32_t    ctl;    /**< Control register */
+    uint32_t    fcsr;   /**< FIFO control register */
+    uint32_t    iv[5];  /**< IV registers */
+    uint32_t    key[8]; /**< KEY registers */
+    uint32_t    md[5];  /**< Message Digest registers */
+
+    /** @} */
+
+};
+
+#endif /* HW_CRYPTO_ALLWINNER_SUN4I_SS_H */
diff --git a/meson.build b/meson.build
index 861de93c4f..cf0bf07bf4 100644
--- a/meson.build
+++ b/meson.build
@@ -2718,6 +2718,7 @@ if have_system
     'hw/block',
     'hw/block/dataplane',
     'hw/char',
+    'hw/crypto',
     'hw/display',
     'hw/dma',
     'hw/hppa',
-- 
2.35.1


