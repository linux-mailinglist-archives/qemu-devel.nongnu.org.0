Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C023E575273
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 18:09:38 +0200 (CEST)
Received: from localhost ([::1]:50244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC1PF-0006jt-RG
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 12:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC12Q-0005Vj-H4; Thu, 14 Jul 2022 11:46:03 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:59425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC12O-0000lR-H3; Thu, 14 Jul 2022 11:46:02 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LkJjZ6vXXz4xht;
 Fri, 15 Jul 2022 01:45:38 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LkJjX6s9Vz4xRC;
 Fri, 15 Jul 2022 01:45:36 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Iris Chen <irischenlj@fb.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 15/19] hw: m25p80: Add Block Protect and Top Bottom bits for
 write protect
Date: Thu, 14 Jul 2022 17:44:52 +0200
Message-Id: <20220714154456.2565189-16-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220714154456.2565189-1-clg@kaod.org>
References: <20220714154456.2565189-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=QWOl=XT=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Iris Chen <irischenlj@fb.com>

Signed-off-by: Iris Chen <irischenlj@fb.com>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-Id: <20220708164552.3462620-1-irischenlj@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 102 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 90 insertions(+), 12 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 46dd9ee9bb06..a8d2519141f7 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -36,21 +36,19 @@
 #include "trace.h"
 #include "qom/object.h"
 
-/* Fields for FlashPartInfo->flags */
-
-/* erase capabilities */
-#define ER_4K 1
-#define ER_32K 2
-/* set to allow the page program command to write 0s back to 1. Useful for
- * modelling EEPROM with SPI flash command set
- */
-#define EEPROM 0x100
-
 /* 16 MiB max in 3 byte address mode */
 #define MAX_3BYTES_SIZE 0x1000000
-
 #define SPI_NOR_MAX_ID_LEN 6
 
+/* Fields for FlashPartInfo->flags */
+enum spi_flash_option_flags {
+    ER_4K                  = BIT(0),
+    ER_32K                 = BIT(1),
+    EEPROM                 = BIT(2),
+    HAS_SR_TB              = BIT(3),
+    HAS_SR_BP3_BIT6        = BIT(4),
+};
+
 typedef struct FlashPartInfo {
     const char *part_name;
     /*
@@ -251,7 +249,8 @@ static const FlashPartInfo known_devices[] = {
     { INFO("n25q512a11",  0x20bb20,      0,  64 << 10, 1024, ER_4K) },
     { INFO("n25q512a13",  0x20ba20,      0,  64 << 10, 1024, ER_4K) },
     { INFO("n25q128",     0x20ba18,      0,  64 << 10, 256, 0) },
-    { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512, ER_4K) },
+    { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512,
+           ER_4K | HAS_SR_BP3_BIT6 | HAS_SR_TB) },
     { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K) },
     { INFO("n25q512ax3",  0x20ba20,  0x1000,  64 << 10, 1024, ER_4K) },
     { INFO("mt25ql512ab", 0x20ba20, 0x1044, 64 << 10, 1024, ER_4K | ER_32K) },
@@ -478,6 +477,11 @@ struct Flash {
     bool reset_enable;
     bool quad_enable;
     bool aai_enable;
+    bool block_protect0;
+    bool block_protect1;
+    bool block_protect2;
+    bool block_protect3;
+    bool top_bottom_bit;
     bool status_register_write_disabled;
     uint8_t ear;
 
@@ -623,12 +627,36 @@ void flash_write8(Flash *s, uint32_t addr, uint8_t data)
 {
     uint32_t page = addr / s->pi->page_size;
     uint8_t prev = s->storage[s->cur_addr];
+    uint32_t block_protect_value = (s->block_protect3 << 3) |
+                                   (s->block_protect2 << 2) |
+                                   (s->block_protect1 << 1) |
+                                   (s->block_protect0 << 0);
 
     if (!s->write_enable) {
         qemu_log_mask(LOG_GUEST_ERROR, "M25P80: write with write protect!\n");
         return;
     }
 
+    if (block_protect_value > 0) {
+        uint32_t num_protected_sectors = 1 << (block_protect_value - 1);
+        uint32_t sector = addr / s->pi->sector_size;
+
+        /* top_bottom_bit == 0 means TOP */
+        if (!s->top_bottom_bit) {
+            if (s->pi->n_sectors <= sector + num_protected_sectors) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "M25P80: write with write protect!\n");
+                return;
+            }
+        } else {
+            if (sector < num_protected_sectors) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "M25P80: write with write protect!\n");
+                return;
+            }
+        }
+    }
+
     if ((prev ^ data) & data) {
         trace_m25p80_programming_zero_to_one(s, addr, prev, data);
     }
@@ -726,6 +754,15 @@ static void complete_collecting_data(Flash *s)
         break;
     case WRSR:
         s->status_register_write_disabled = extract32(s->data[0], 7, 1);
+        s->block_protect0 = extract32(s->data[0], 2, 1);
+        s->block_protect1 = extract32(s->data[0], 3, 1);
+        s->block_protect2 = extract32(s->data[0], 4, 1);
+        if (s->pi->flags & HAS_SR_TB) {
+            s->top_bottom_bit = extract32(s->data[0], 5, 1);
+        }
+        if (s->pi->flags & HAS_SR_BP3_BIT6) {
+            s->block_protect3 = extract32(s->data[0], 6, 1);
+        }
 
         switch (get_man(s)) {
         case MAN_SPANSION:
@@ -1212,6 +1249,15 @@ static void decode_new_cmd(Flash *s, uint32_t value)
     case RDSR:
         s->data[0] = (!!s->write_enable) << 1;
         s->data[0] |= (!!s->status_register_write_disabled) << 7;
+        s->data[0] |= (!!s->block_protect0) << 2;
+        s->data[0] |= (!!s->block_protect1) << 3;
+        s->data[0] |= (!!s->block_protect2) << 4;
+        if (s->pi->flags & HAS_SR_TB) {
+            s->data[0] |= (!!s->top_bottom_bit) << 5;
+        }
+        if (s->pi->flags & HAS_SR_BP3_BIT6) {
+            s->data[0] |= (!!s->block_protect3) << 6;
+        }
 
         if (get_man(s) == MAN_MACRONIX || get_man(s) == MAN_ISSI) {
             s->data[0] |= (!!s->quad_enable) << 6;
@@ -1552,6 +1598,11 @@ static void m25p80_reset(DeviceState *d)
 
     s->wp_level = true;
     s->status_register_write_disabled = false;
+    s->block_protect0 = false;
+    s->block_protect1 = false;
+    s->block_protect2 = false;
+    s->block_protect3 = false;
+    s->top_bottom_bit = false;
 
     reset_memory(s);
 }
@@ -1638,6 +1689,32 @@ static const VMStateDescription vmstate_m25p80_write_protect = {
     }
 };
 
+static bool m25p80_block_protect_needed(void *opaque)
+{
+    Flash *s = (Flash *)opaque;
+
+    return s->block_protect0 ||
+           s->block_protect1 ||
+           s->block_protect2 ||
+           s->block_protect3 ||
+           s->top_bottom_bit;
+}
+
+static const VMStateDescription vmstate_m25p80_block_protect = {
+    .name = "m25p80/block_protect",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = m25p80_block_protect_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_BOOL(block_protect0, Flash),
+        VMSTATE_BOOL(block_protect1, Flash),
+        VMSTATE_BOOL(block_protect2, Flash),
+        VMSTATE_BOOL(block_protect3, Flash),
+        VMSTATE_BOOL(top_bottom_bit, Flash),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_m25p80 = {
     .name = "m25p80",
     .version_id = 0,
@@ -1670,6 +1747,7 @@ static const VMStateDescription vmstate_m25p80 = {
         &vmstate_m25p80_data_read_loop,
         &vmstate_m25p80_aai_enable,
         &vmstate_m25p80_write_protect,
+        &vmstate_m25p80_block_protect,
         NULL
     }
 };
-- 
2.35.3


