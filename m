Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E674F40C393
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 12:23:59 +0200 (CEST)
Received: from localhost ([::1]:60064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQS58-00057Q-Uo
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 06:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQRss-0003PO-Lv
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:11:18 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:39058
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQRsp-0002wr-QJ
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:11:18 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQRsh-00059W-V3; Wed, 15 Sep 2021 11:11:12 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Wed, 15 Sep 2021 11:10:16 +0100
Message-Id: <20210915101026.25174-11-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210915101026.25174-1-mark.cave-ayland@ilande.co.uk>
References: <20210915101026.25174-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 10/20] nubus-device: remove nubus_register_rom() and
 nubus_register_format_block()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Since there is no need to generate a dummy declaration ROM, remove both
nubus_register_rom() and nubus_register_format_block(). These will shortly be
replaced with a mechanism to optionally load a declaration ROM from disk to
allow real images to be used within QEMU.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/nubus/nubus-device.c  | 143 ---------------------------------------
 include/hw/nubus/nubus.h |  19 ------
 2 files changed, 162 deletions(-)

diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
index 7a32c8c95b..9c1992ceb0 100644
--- a/hw/nubus/nubus-device.c
+++ b/hw/nubus/nubus-device.c
@@ -13,147 +13,6 @@
 #include "qapi/error.h"
 
 
-/* The Format Block Structure */
-
-#define FBLOCK_DIRECTORY_OFFSET 0
-#define FBLOCK_LENGTH           4
-#define FBLOCK_CRC              8
-#define FBLOCK_REVISION_LEVEL   12
-#define FBLOCK_FORMAT           13
-#define FBLOCK_TEST_PATTERN     14
-#define FBLOCK_RESERVED         18
-#define FBLOCK_BYTE_LANES       19
-
-#define FBLOCK_SIZE             20
-#define FBLOCK_PATTERN_VAL      0x5a932bc7
-
-static uint64_t nubus_fblock_read(void *opaque, hwaddr addr, unsigned int size)
-{
-    NubusDevice *dev = opaque;
-    uint64_t val;
-
-#define BYTE(v, b) (((v) >> (24 - 8 * (b))) & 0xff)
-    switch (addr) {
-    case FBLOCK_BYTE_LANES:
-        val = dev->byte_lanes;
-        val |= (val ^ 0xf) << 4;
-        break;
-    case FBLOCK_RESERVED:
-        val = 0x00;
-        break;
-    case FBLOCK_TEST_PATTERN...FBLOCK_TEST_PATTERN + 3:
-        val = BYTE(FBLOCK_PATTERN_VAL, addr - FBLOCK_TEST_PATTERN);
-        break;
-    case FBLOCK_FORMAT:
-        val = dev->rom_format;
-        break;
-    case FBLOCK_REVISION_LEVEL:
-        val = dev->rom_rev;
-        break;
-    case FBLOCK_CRC...FBLOCK_CRC + 3:
-        val = BYTE(dev->rom_crc, addr - FBLOCK_CRC);
-        break;
-    case FBLOCK_LENGTH...FBLOCK_LENGTH + 3:
-        val = BYTE(dev->rom_length, addr - FBLOCK_LENGTH);
-        break;
-    case FBLOCK_DIRECTORY_OFFSET...FBLOCK_DIRECTORY_OFFSET + 3:
-        val = BYTE(dev->directory_offset, addr - FBLOCK_DIRECTORY_OFFSET);
-        break;
-    default:
-        val = 0;
-        break;
-    }
-    return val;
-}
-
-static void nubus_fblock_write(void *opaque, hwaddr addr, uint64_t val,
-                               unsigned int size)
-{
-    /* read only */
-}
-
-static const MemoryRegionOps nubus_format_block_ops = {
-    .read = nubus_fblock_read,
-    .write = nubus_fblock_write,
-    .endianness = DEVICE_BIG_ENDIAN,
-    .valid = {
-        .min_access_size = 1,
-        .max_access_size = 1,
-    }
-};
-
-static void nubus_register_format_block(NubusDevice *dev)
-{
-    char *fblock_name;
-
-    fblock_name = g_strdup_printf("nubus-slot-%d-format-block",
-                                  dev->slot);
-
-    hwaddr fblock_offset = memory_region_size(&dev->slot_mem) - FBLOCK_SIZE;
-    memory_region_init_io(&dev->fblock_io, NULL, &nubus_format_block_ops,
-                          dev, fblock_name, FBLOCK_SIZE);
-    memory_region_add_subregion(&dev->slot_mem, fblock_offset,
-                                &dev->fblock_io);
-
-    g_free(fblock_name);
-}
-
-static void mac_nubus_rom_write(void *opaque, hwaddr addr, uint64_t val,
-                                       unsigned int size)
-{
-    /* read only */
-}
-
-static uint64_t mac_nubus_rom_read(void *opaque, hwaddr addr,
-                                    unsigned int size)
-{
-    NubusDevice *dev = opaque;
-
-    return dev->rom[addr];
-}
-
-static const MemoryRegionOps mac_nubus_rom_ops = {
-    .read  = mac_nubus_rom_read,
-    .write = mac_nubus_rom_write,
-    .endianness = DEVICE_BIG_ENDIAN,
-    .valid = {
-        .min_access_size = 1,
-        .max_access_size = 1,
-    },
-};
-
-
-void nubus_register_rom(NubusDevice *dev, const uint8_t *rom, uint32_t size,
-                        int revision, int format, uint8_t byte_lanes)
-{
-    hwaddr rom_offset;
-    char *rom_name;
-
-    /* FIXME : really compute CRC */
-    dev->rom_length = 0;
-    dev->rom_crc = 0;
-
-    dev->rom_rev = revision;
-    dev->rom_format = format;
-
-    dev->byte_lanes = byte_lanes;
-    dev->directory_offset = -size;
-
-    /* ROM */
-
-    dev->rom = rom;
-    rom_name = g_strdup_printf("nubus-slot-%d-rom", dev->slot);
-    memory_region_init_io(&dev->rom_io, NULL, &mac_nubus_rom_ops,
-                          dev, rom_name, size);
-    memory_region_set_readonly(&dev->rom_io, true);
-
-    rom_offset = memory_region_size(&dev->slot_mem) - FBLOCK_SIZE +
-                 dev->directory_offset;
-    memory_region_add_subregion(&dev->slot_mem, rom_offset, &dev->rom_io);
-
-    g_free(rom_name);
-}
-
 static void nubus_device_realize(DeviceState *dev, Error **errp)
 {
     NubusBus *nubus = NUBUS_BUS(qdev_get_parent_bus(dev));
@@ -179,8 +38,6 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&nubus->slot_io, slot_offset,
                                 &nd->slot_mem);
     g_free(name);
-
-    nubus_register_format_block(nd);
 }
 
 static Property nubus_device_properties[] = {
diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index 8ff4736259..87a97516c7 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -45,25 +45,6 @@ struct NubusDevice {
     int32_t slot;
     MemoryRegion super_slot_mem;
     MemoryRegion slot_mem;
-
-    /* Format Block */
-
-    MemoryRegion fblock_io;
-
-    uint32_t rom_length;
-    uint32_t rom_crc;
-    uint8_t rom_rev;
-    uint8_t rom_format;
-    uint8_t byte_lanes;
-    int32_t directory_offset;
-
-    /* ROM */
-
-    MemoryRegion rom_io;
-    const uint8_t *rom;
 };
 
-void nubus_register_rom(NubusDevice *dev, const uint8_t *rom, uint32_t size,
-                        int revision, int format, uint8_t byte_lanes);
-
 #endif
-- 
2.20.1


