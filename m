Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB333A59A4
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 18:39:43 +0200 (CEST)
Received: from localhost ([::1]:40864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsT9C-0001BG-SV
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 12:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lsT7S-0006tK-1C
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 12:37:54 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41232
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lsT7P-0001ba-UN
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 12:37:53 -0400
Received: from host86-132-109-72.range86-132.btcentralplus.com
 ([86.132.109.72] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lsT7F-0006x0-DO; Sun, 13 Jun 2021 17:37:41 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com,
 f4bug@amsat.org, aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 jasowang@redhat.com
Date: Sun, 13 Jun 2021 17:37:35 +0100
Message-Id: <20210613163738.2141-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210613163738.2141-1-mark.cave-ayland@ilande.co.uk>
References: <20210613163738.2141-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.132.109.72
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 2/5] dp8393x: convert to trace-events
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

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/net/dp8393x.c    | 55 +++++++++++++++++----------------------------
 hw/net/trace-events | 17 ++++++++++++++
 2 files changed, 37 insertions(+), 35 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 56af08f0fe..ea5b22f680 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -28,14 +28,10 @@
 #include "qemu/timer.h"
 #include <zlib.h>
 #include "qom/object.h"
-
-/* #define DEBUG_SONIC */
+#include "trace.h"
 
 #define SONIC_PROM_SIZE 0x1000
 
-#ifdef DEBUG_SONIC
-#define DPRINTF(fmt, ...) \
-do { printf("sonic: " fmt , ##  __VA_ARGS__); } while (0)
 static const char *reg_names[] = {
     "CR", "DCR", "RCR", "TCR", "IMR", "ISR", "UTDA", "CTDA",
     "TPS", "TFC", "TSA0", "TSA1", "TFS", "URDA", "CRDA", "CRBA0",
@@ -45,12 +41,6 @@ static const char *reg_names[] = {
     "SR", "WT0", "WT1", "RSC", "CRCT", "FAET", "MPT", "MDT",
     "0x30", "0x31", "0x32", "0x33", "0x34", "0x35", "0x36", "0x37",
     "0x38", "0x39", "0x3a", "0x3b", "0x3c", "0x3d", "0x3e", "DCR2" };
-#else
-#define DPRINTF(fmt, ...) do {} while (0)
-#endif
-
-#define SONIC_ERROR(fmt, ...) \
-do { printf("sonic ERROR: %s: " fmt, __func__ , ## __VA_ARGS__); } while (0)
 
 #define SONIC_CR     0x00
 #define SONIC_DCR    0x01
@@ -161,9 +151,7 @@ struct dp8393xState {
     bool big_endian;
     bool last_rba_is_full;
     qemu_irq irq;
-#ifdef DEBUG_SONIC
     int irq_level;
-#endif
     QEMUTimer *watchdog;
     int64_t wt_last_update;
     NICConf conf;
@@ -270,16 +258,14 @@ static void dp8393x_update_irq(dp8393xState *s)
 {
     int level = (s->regs[SONIC_IMR] & s->regs[SONIC_ISR]) ? 1 : 0;
 
-#ifdef DEBUG_SONIC
     if (level != s->irq_level) {
         s->irq_level = level;
         if (level) {
-            DPRINTF("raise irq, isr is 0x%04x\n", s->regs[SONIC_ISR]);
+            trace_dp8393x_raise_irq(s->regs[SONIC_ISR]);
         } else {
-            DPRINTF("lower irq\n");
+            trace_dp8393x_lower_irq();
         }
     }
-#endif
 
     qemu_set_irq(s->irq, level);
 }
@@ -302,9 +288,9 @@ static void dp8393x_do_load_cam(dp8393xState *s)
         s->cam[index][3] = dp8393x_get(s, width, 2) >> 8;
         s->cam[index][4] = dp8393x_get(s, width, 3) & 0xff;
         s->cam[index][5] = dp8393x_get(s, width, 3) >> 8;
-        DPRINTF("load cam[%d] with %02x%02x%02x%02x%02x%02x\n", index,
-            s->cam[index][0], s->cam[index][1], s->cam[index][2],
-            s->cam[index][3], s->cam[index][4], s->cam[index][5]);
+        trace_dp8393x_load_cam(index, s->cam[index][0], s->cam[index][1],
+                               s->cam[index][2], s->cam[index][3],
+                               s->cam[index][4], s->cam[index][5]);
         /* Move to next entry */
         s->regs[SONIC_CDC]--;
         s->regs[SONIC_CDP] += size;
@@ -315,7 +301,7 @@ static void dp8393x_do_load_cam(dp8393xState *s)
     address_space_read(&s->as, dp8393x_cdp(s),
                        MEMTXATTRS_UNSPECIFIED, s->data, size);
     s->regs[SONIC_CE] = dp8393x_get(s, width, 0);
-    DPRINTF("load cam done. cam enable mask 0x%04x\n", s->regs[SONIC_CE]);
+    trace_dp8393x_load_cam_done(s->regs[SONIC_CE]);
 
     /* Done */
     s->regs[SONIC_CR] &= ~SONIC_CR_LCAM;
@@ -338,9 +324,8 @@ static void dp8393x_do_read_rra(dp8393xState *s)
     s->regs[SONIC_CRBA1] = dp8393x_get(s, width, 1);
     s->regs[SONIC_RBWC0] = dp8393x_get(s, width, 2);
     s->regs[SONIC_RBWC1] = dp8393x_get(s, width, 3);
-    DPRINTF("CRBA0/1: 0x%04x/0x%04x, RBWC0/1: 0x%04x/0x%04x\n",
-        s->regs[SONIC_CRBA0], s->regs[SONIC_CRBA1],
-        s->regs[SONIC_RBWC0], s->regs[SONIC_RBWC1]);
+    trace_dp8393x_read_rra_regs(s->regs[SONIC_CRBA0], s->regs[SONIC_CRBA1],
+                                s->regs[SONIC_RBWC0], s->regs[SONIC_RBWC1]);
 
     /* Go to next entry */
     s->regs[SONIC_RRP] += size;
@@ -444,7 +429,7 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
         /* Read memory */
         size = sizeof(uint16_t) * 6 * width;
         s->regs[SONIC_TTDA] = s->regs[SONIC_CTDA];
-        DPRINTF("Transmit packet at %08x\n", dp8393x_ttda(s));
+        trace_dp8393x_transmit_packet(dp8393x_ttda(s));
         address_space_read(&s->as, dp8393x_ttda(s) + sizeof(uint16_t) * width,
                            MEMTXATTRS_UNSPECIFIED, s->data, size);
         tx_len = 0;
@@ -499,7 +484,7 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
             /* Remove existing FCS */
             tx_len -= 4;
             if (tx_len < 0) {
-                SONIC_ERROR("tx_len is %d\n", tx_len);
+                trace_dp8393x_transmit_txlen_error(tx_len);
                 break;
             }
         }
@@ -618,7 +603,7 @@ static uint64_t dp8393x_read(void *opaque, hwaddr addr, unsigned int size)
         val = s->regs[reg];
     }
 
-    DPRINTF("read 0x%04x from reg %s\n", val, reg_names[reg]);
+    trace_dp8393x_read(reg, reg_names[reg], val, size);
 
     return s->big_endian ? val << 16 : val;
 }
@@ -630,7 +615,7 @@ static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
     int reg = addr >> s->it_shift;
     uint32_t val = s->big_endian ? data >> 16 : data;
 
-    DPRINTF("write 0x%04x to reg %s\n", (uint16_t)val, reg_names[reg]);
+    trace_dp8393x_write(reg, reg_names[reg], val, size);
 
     switch (reg) {
     /* Command register */
@@ -643,21 +628,21 @@ static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
     case SONIC_CAP0:
     case SONIC_SR:
     case SONIC_MDT:
-        DPRINTF("writing to reg %d invalid\n", reg);
+        trace_dp8393x_write_invalid(reg);
         break;
     /* Accept write to some registers only when in reset mode */
     case SONIC_DCR:
         if (s->regs[SONIC_CR] & SONIC_CR_RST) {
             s->regs[reg] = val & 0xbfff;
         } else {
-            DPRINTF("writing to DCR invalid\n");
+            trace_dp8393x_write_invalid_dcr("DCR");
         }
         break;
     case SONIC_DCR2:
         if (s->regs[SONIC_CR] & SONIC_CR_RST) {
             s->regs[reg] = val & 0xf017;
         } else {
-            DPRINTF("writing to DCR2 invalid\n");
+            trace_dp8393x_write_invalid_dcr("DCR2");
         }
         break;
     /* 12 lower bytes are Read Only */
@@ -803,7 +788,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
     }
 
     if (padded_len > dp8393x_rbwc(s) * 2) {
-        DPRINTF("oversize packet, pkt_size is %d\n", pkt_size);
+        trace_dp8393x_receive_oversize(pkt_size);
         s->regs[SONIC_ISR] |= SONIC_ISR_RBAE;
         dp8393x_update_irq(s);
         s->regs[SONIC_RCR] |= SONIC_RCR_LPKT;
@@ -812,7 +797,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
 
     packet_type = dp8393x_receive_filter(s, buf, pkt_size);
     if (packet_type < 0) {
-        DPRINTF("packet not for netcard\n");
+        trace_dp8393x_receive_not_netcard();
         return -1;
     }
 
@@ -850,7 +835,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
     checksum = cpu_to_le32(crc32(0, buf, pkt_size));
 
     /* Put packet into RBA */
-    DPRINTF("Receive packet at %08x\n", dp8393x_crba(s));
+    trace_dp8393x_receive_packet(dp8393x_crba(s));
     address = dp8393x_crba(s);
     address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
                         buf, pkt_size);
@@ -888,7 +873,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
     }
 
     /* Write status to memory */
-    DPRINTF("Write status at %08x\n", dp8393x_crda(s));
+    trace_dp8393x_receive_write_status(dp8393x_crda(s));
     dp8393x_put(s, width, 0, s->regs[SONIC_RCR]); /* status */
     dp8393x_put(s, width, 1, rx_len); /* byte count */
     dp8393x_put(s, width, 2, s->regs[SONIC_TRBA0]); /* pkt_ptr0 */
diff --git a/hw/net/trace-events b/hw/net/trace-events
index c28b91ee1a..643338f610 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -436,3 +436,20 @@ npcm7xx_emc_received_packet(uint32_t len) "Received %u byte packet"
 npcm7xx_emc_rx_done(uint32_t crxdsa) "RX done, CRXDSA=0x%x"
 npcm7xx_emc_reg_read(int emc_num, uint32_t result, const char *name, int regno) "emc%d: 0x%x = reg[%s/%d]"
 npcm7xx_emc_reg_write(int emc_num, const char *name, int regno, uint32_t value) "emc%d: reg[%s/%d] = 0x%x"
+
+# dp8398x.c
+dp8393x_raise_irq(int isr) "raise irq, isr is 0x%04x"
+dp8393x_lower_irq(void) "lower irq"
+dp8393x_load_cam(int idx, int cam0, int cam1, int cam2, int cam3, int cam4, int cam5) "load cam[%d] with 0x%02x0x%02x0x%02x0x%02x0x%02x0x%02x"
+dp8393x_load_cam_done(int cen) "load cam done. cam enable mask 0x%04x"
+dp8393x_read_rra_regs(int crba0, int crba1, int rbwc0, int rbwc1) "CRBA0/1: 0x%04x/0x%04x, RBWC0/1: 0x%04x/0x%04x"
+dp8393x_transmit_packet(int ttda) "Transmit packet at 0x%"PRIx32
+dp8393x_transmit_txlen_error(int len) "tx_len is %d"
+dp8393x_read(int reg, const char *name, int val, int size) "reg=0x%x [%s] val=0x%04x size=%d"
+dp8393x_write(int reg, const char *name, int val, int size) "reg=0x%x [%s] val=0x%04x size=%d"
+dp8393x_write_invalid(int reg) "writing to reg %d invalid"
+dp8393x_write_invalid_dcr(const char *name) "writing to %s invalid"
+dp8393x_receive_oversize(int size) "oversize packet, pkt_size is %d"
+dp8393x_receive_not_netcard(void) "packet not for netcard"
+dp8393x_receive_packet(int crba) "Receive packet at 0x%"PRIx32
+dp8393x_receive_write_status(int crba) "Write status at 0x%"PRIx32
-- 
2.20.1


