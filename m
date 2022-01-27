Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9A249ED08
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 22:09:44 +0100 (CET)
Received: from localhost ([::1]:53192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDC1W-0006ho-AF
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 16:09:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDBmy-0008C2-Bm
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 15:54:40 -0500
Received: from [2001:41c9:1:41f::167] (port=36838
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDBmw-0004wa-Li
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 15:54:40 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDBmR-000BHM-Ez; Thu, 27 Jan 2022 20:54:11 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Thu, 27 Jan 2022 20:54:01 +0000
Message-Id: <20220127205405.23499-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 07/11] mos6522: add register names to register read/write
 trace events
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This helps to follow how the guest is programming the mos6522 when debugging.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/mos6522.c    | 10 ++++++++--
 hw/misc/trace-events |  4 ++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index 093cc83dcf..aaae195d63 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -36,6 +36,12 @@
 #include "qemu/module.h"
 #include "trace.h"
 
+
+static const char *mos6522_reg_names[16] = {
+    "ORB", "ORA", "DDRB", "DDRA", "T1CL", "T1CH", "T1LL", "T1LH",
+    "T2CL", "T2CH", "SR", "ACR", "PCR", "IFR", "IER", "ANH"
+};
+
 /* XXX: implement all timer modes */
 
 static void mos6522_timer1_update(MOS6522State *s, MOS6522Timer *ti,
@@ -310,7 +316,7 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
     }
 
     if (addr != VIA_REG_IFR || val != 0) {
-        trace_mos6522_read(addr, val);
+        trace_mos6522_read(addr, mos6522_reg_names[addr], val);
     }
 
     return val;
@@ -321,7 +327,7 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
     MOS6522State *s = opaque;
     MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(s);
 
-    trace_mos6522_write(addr, val);
+    trace_mos6522_write(addr, mos6522_reg_names[addr], val);
 
     switch (addr) {
     case VIA_REG_B:
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 1c373dd0a4..c1ea57de31 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -95,8 +95,8 @@ imx7_gpr_write(uint64_t offset, uint64_t value) "addr 0x%08" PRIx64 "value 0x%08
 mos6522_set_counter(int index, unsigned int val) "T%d.counter=%d"
 mos6522_get_next_irq_time(uint16_t latch, int64_t d, int64_t delta) "latch=%d counter=0x%"PRId64 " delta_next=0x%"PRId64
 mos6522_set_sr_int(void) "set sr_int"
-mos6522_write(uint64_t addr, uint64_t val) "reg=0x%"PRIx64 " val=0x%"PRIx64
-mos6522_read(uint64_t addr, unsigned val) "reg=0x%"PRIx64 " val=0x%x"
+mos6522_write(uint64_t addr, const char *name, uint64_t val) "reg=0x%"PRIx64 " [%s] val=0x%"PRIx64
+mos6522_read(uint64_t addr, const char *name, unsigned val) "reg=0x%"PRIx64 " [%s] val=0x%x"
 
 # npcm7xx_clk.c
 npcm7xx_clk_read(uint64_t offset, uint32_t value) " offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
-- 
2.20.1


