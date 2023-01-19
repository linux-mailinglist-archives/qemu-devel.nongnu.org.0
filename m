Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4256738B8
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 13:37:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIU8u-0006ij-Dj; Thu, 19 Jan 2023 07:35:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8r-0006el-PM; Thu, 19 Jan 2023 07:35:41 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8p-0007dU-PP; Thu, 19 Jan 2023 07:35:41 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4NyMY52W75z4xZj;
 Thu, 19 Jan 2023 23:35:37 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NyMY30RLYz4xHV;
 Thu, 19 Jan 2023 23:35:34 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 12/25] hw/nvram/eeprom_at24c: Add init_rom field and
 at24c_eeprom_init_rom helper
Date: Thu, 19 Jan 2023 13:34:36 +0100
Message-Id: <20230119123449.531826-13-clg@kaod.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119123449.531826-1-clg@kaod.org>
References: <20230119123449.531826-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Delevoryas <peter@pjd.dev>

Allows users to specify binary data to initialize an EEPROM, allowing users to
emulate data programmed at manufacturing time.

- Added init_rom and init_rom_size attributes to TYPE_AT24C_EE
- Added at24c_eeprom_init_rom helper function to initialize attributes
- If -drive property is provided, it overrides init_rom data

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/nvram/eeprom_at24c.h | 16 ++++++++++++++
 hw/nvram/eeprom_at24c.c         | 37 ++++++++++++++++++++++++++++-----
 2 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at24c.h
index 196db309d4..acb9857b2a 100644
--- a/include/hw/nvram/eeprom_at24c.h
+++ b/include/hw/nvram/eeprom_at24c.h
@@ -20,4 +20,20 @@
  */
 I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size);
 
+
+/*
+ * Create and realize an AT24C EEPROM device on the heap with initial data.
+ * @bus: I2C bus to put it on
+ * @address: I2C address of the EEPROM slave when put on a bus
+ * @rom_size: size of the EEPROM
+ * @init_rom: Array of bytes to initialize EEPROM memory with
+ * @init_rom_size: Size of @init_rom, must be less than or equal to @rom_size
+ *
+ * Create the device state structure, initialize it, put it on the specified
+ * @bus, and drop the reference to it (the device is realized). Copies the data
+ * from @init_rom to the beginning of the EEPROM memory buffer.
+ */
+I2CSlave *at24c_eeprom_init_rom(I2CBus *bus, uint8_t address, uint32_t rom_size,
+                                const uint8_t *init_rom, uint32_t init_rom_size);
+
 #endif
diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 98857e3626..f8d751fa27 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -50,6 +50,9 @@ struct EEPROMState {
     uint8_t *mem;
 
     BlockBackend *blk;
+
+    const uint8_t *init_rom;
+    uint32_t init_rom_size;
 };
 
 static
@@ -131,19 +134,38 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
 
 I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size)
 {
-    I2CSlave *i2c_dev = i2c_slave_new(TYPE_AT24C_EE, address);
-    DeviceState *dev = DEVICE(i2c_dev);
+    return at24c_eeprom_init_rom(bus, address, rom_size, NULL, 0);
+}
+
+I2CSlave *at24c_eeprom_init_rom(I2CBus *bus, uint8_t address, uint32_t rom_size,
+                                const uint8_t *init_rom, uint32_t init_rom_size)
+{
+    EEPROMState *s;
+
+    s = AT24C_EE(qdev_new(TYPE_AT24C_EE));
+
+    qdev_prop_set_uint8(DEVICE(s), "address", address);
+    qdev_prop_set_uint32(DEVICE(s), "rom-size", rom_size);
 
-    qdev_prop_set_uint32(dev, "rom-size", rom_size);
-    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
+    /* TODO: Model init_rom with QOM properties. */
+    s->init_rom = init_rom;
+    s->init_rom_size = init_rom_size;
 
-    return i2c_dev;
+    i2c_slave_realize_and_unref(I2C_SLAVE(s), bus, &error_abort);
+
+    return I2C_SLAVE(s);
 }
 
 static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
 {
     EEPROMState *ee = AT24C_EE(dev);
 
+    if (ee->init_rom_size > ee->rsize) {
+        error_setg(errp, "%s: init rom is larger than rom: %u > %u",
+                   TYPE_AT24C_EE, ee->init_rom_size, ee->rsize);
+        return;
+    }
+
     if (ee->blk) {
         int64_t len = blk_getlength(ee->blk);
 
@@ -163,6 +185,7 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
     }
 
     ee->mem = g_malloc0(ee->rsize);
+
 }
 
 static
@@ -176,6 +199,10 @@ void at24c_eeprom_reset(DeviceState *state)
 
     memset(ee->mem, 0, ee->rsize);
 
+    if (ee->init_rom) {
+        memcpy(ee->mem, ee->init_rom, MIN(ee->init_rom_size, ee->rsize));
+    }
+
     if (ee->blk) {
         int ret = blk_pread(ee->blk, 0, ee->rsize, ee->mem, 0);
 
-- 
2.39.0


