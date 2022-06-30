Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADBA561916
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 13:27:21 +0200 (CEST)
Received: from localhost ([::1]:46082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6sKN-0001mw-UU
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 07:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sHh-000746-3C; Thu, 30 Jun 2022 07:24:33 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:40183
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sHf-0001xX-0c; Thu, 30 Jun 2022 07:24:32 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LYbZY6Z8dz4xXF;
 Thu, 30 Jun 2022 21:24:21 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LYbZW4SVYz4xD5;
 Thu, 30 Jun 2022 21:24:19 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Iris Chen <irischenlj@gmail.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 01/27] hw: m25p80: add WP# pin and SRWD bit for write protection
Date: Thu, 30 Jun 2022 13:23:45 +0200
Message-Id: <20220630112411.1474431-2-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220630112411.1474431-1-clg@kaod.org>
References: <20220630112411.1474431-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

From: Iris Chen <irischenlj@gmail.com>

Signed-off-by: Iris Chen <irischenlj@gmail.com>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-Id: <20220621202427.2680413-1-irischenlj@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 82 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 67 insertions(+), 15 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 81ba3da4df10..3045dda53b81 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -472,11 +472,13 @@ struct Flash {
     uint8_t spansion_cr2v;
     uint8_t spansion_cr3v;
     uint8_t spansion_cr4v;
+    bool wp_level;
     bool write_enable;
     bool four_bytes_address_mode;
     bool reset_enable;
     bool quad_enable;
     bool aai_enable;
+    bool status_register_write_disabled;
     uint8_t ear;
 
     int64_t dirty_page;
@@ -723,6 +725,8 @@ static void complete_collecting_data(Flash *s)
         flash_erase(s, s->cur_addr, s->cmd_in_progress);
         break;
     case WRSR:
+        s->status_register_write_disabled = extract32(s->data[0], 7, 1);
+
         switch (get_man(s)) {
         case MAN_SPANSION:
             s->quad_enable = !!(s->data[1] & 0x02);
@@ -1165,22 +1169,34 @@ static void decode_new_cmd(Flash *s, uint32_t value)
         break;
 
     case WRSR:
-        if (s->write_enable) {
-            switch (get_man(s)) {
-            case MAN_SPANSION:
-                s->needed_bytes = 2;
-                s->state = STATE_COLLECTING_DATA;
-                break;
-            case MAN_MACRONIX:
-                s->needed_bytes = 2;
-                s->state = STATE_COLLECTING_VAR_LEN_DATA;
-                break;
-            default:
-                s->needed_bytes = 1;
-                s->state = STATE_COLLECTING_DATA;
-            }
-            s->pos = 0;
+        /*
+         * If WP# is low and status_register_write_disabled is high,
+         * status register writes are disabled.
+         * This is also called "hardware protected mode" (HPM). All other
+         * combinations of the two states are called "software protected mode"
+         * (SPM), and status register writes are permitted.
+         */
+        if ((s->wp_level == 0 && s->status_register_write_disabled)
+            || !s->write_enable) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "M25P80: Status register write is disabled!\n");
+            break;
+        }
+
+        switch (get_man(s)) {
+        case MAN_SPANSION:
+            s->needed_bytes = 2;
+            s->state = STATE_COLLECTING_DATA;
+            break;
+        case MAN_MACRONIX:
+            s->needed_bytes = 2;
+            s->state = STATE_COLLECTING_VAR_LEN_DATA;
+            break;
+        default:
+            s->needed_bytes = 1;
+            s->state = STATE_COLLECTING_DATA;
         }
+        s->pos = 0;
         break;
 
     case WRDI:
@@ -1195,6 +1211,8 @@ static void decode_new_cmd(Flash *s, uint32_t value)
 
     case RDSR:
         s->data[0] = (!!s->write_enable) << 1;
+        s->data[0] |= (!!s->status_register_write_disabled) << 7;
+
         if (get_man(s) == MAN_MACRONIX || get_man(s) == MAN_ISSI) {
             s->data[0] |= (!!s->quad_enable) << 6;
         }
@@ -1484,6 +1502,14 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
     return r;
 }
 
+static void m25p80_write_protect_pin_irq_handler(void *opaque, int n, int level)
+{
+    Flash *s = M25P80(opaque);
+    /* WP# is just a single pin. */
+    assert(n == 0);
+    s->wp_level = !!level;
+}
+
 static void m25p80_realize(SSIPeripheral *ss, Error **errp)
 {
     Flash *s = M25P80(ss);
@@ -1515,12 +1541,18 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
         s->storage = blk_blockalign(NULL, s->size);
         memset(s->storage, 0xFF, s->size);
     }
+
+    qdev_init_gpio_in_named(DEVICE(s),
+                            m25p80_write_protect_pin_irq_handler, "WP#", 1);
 }
 
 static void m25p80_reset(DeviceState *d)
 {
     Flash *s = M25P80(d);
 
+    s->wp_level = true;
+    s->status_register_write_disabled = false;
+
     reset_memory(s);
 }
 
@@ -1587,6 +1619,25 @@ static const VMStateDescription vmstate_m25p80_aai_enable = {
     }
 };
 
+static bool m25p80_wp_level_srwd_needed(void *opaque)
+{
+    Flash *s = (Flash *)opaque;
+
+    return !s->wp_level || s->status_register_write_disabled;
+}
+
+static const VMStateDescription vmstate_m25p80_write_protect = {
+    .name = "m25p80/write_protect",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = m25p80_wp_level_srwd_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_BOOL(wp_level, Flash),
+        VMSTATE_BOOL(status_register_write_disabled, Flash),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_m25p80 = {
     .name = "m25p80",
     .version_id = 0,
@@ -1618,6 +1669,7 @@ static const VMStateDescription vmstate_m25p80 = {
     .subsections = (const VMStateDescription * []) {
         &vmstate_m25p80_data_read_loop,
         &vmstate_m25p80_aai_enable,
+        &vmstate_m25p80_write_protect,
         NULL
     }
 };
-- 
2.35.3


