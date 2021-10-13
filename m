Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E2642CCC9
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 23:26:30 +0200 (CEST)
Received: from localhost ([::1]:48582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1malld-0002FP-Bp
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 17:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1malhK-0003PC-7k
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:22:02 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48420
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1malhH-0006yW-KJ
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:22:01 -0400
Received: from [2a00:23c4:8b9d:d300:c17b:cf83:be43:9708] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1malgz-0000Dh-57; Wed, 13 Oct 2021 22:21:45 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Wed, 13 Oct 2021 22:21:28 +0100
Message-Id: <20211013212132.31519-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
References: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:d300:c17b:cf83:be43:9708
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 4/8] mac_via: add GPIO for A/UX mode
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

Add a new auxmode GPIO that is updated when port B bit 6 is changed indicating
whether the hardware is configured for A/UX mode.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/mac_via.c         | 18 ++++++++++++++++++
 hw/misc/trace-events      |  1 +
 include/hw/misc/mac_via.h |  1 +
 3 files changed, 20 insertions(+)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 7a53a8b4c0..a08ffbcd88 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -880,6 +880,20 @@ static void via1_adb_update(MOS6522Q800VIA1State *v1s)
     }
 }
 
+static void via1_auxmode_update(MOS6522Q800VIA1State *v1s)
+{
+    MOS6522State *s = MOS6522(v1s);
+    int oldirq, irq;
+
+    oldirq = (v1s->last_b & VIA1B_vMystery) ? 1 : 0;
+    irq = (s->b & VIA1B_vMystery) ? 1 : 0;
+
+    if (irq != oldirq) {
+        trace_via1_auxmode(irq);
+        qemu_set_irq(v1s->auxmode_irq, irq);
+    }
+}
+
 static uint64_t mos6522_q800_via1_read(void *opaque, hwaddr addr, unsigned size)
 {
     MOS6522Q800VIA1State *s = MOS6522_Q800_VIA1(opaque);
@@ -902,6 +916,7 @@ static void mos6522_q800_via1_write(void *opaque, hwaddr addr, uint64_t val,
     case VIA_REG_B:
         via1_rtc_update(v1s);
         via1_adb_update(v1s);
+        via1_auxmode_update(v1s);
 
         v1s->last_b = ms->b;
         break;
@@ -1046,6 +1061,9 @@ static void mos6522_q800_via1_init(Object *obj)
               TYPE_ADB_BUS, DEVICE(v1s), "adb.0");
 
     qdev_init_gpio_in(DEVICE(obj), via1_irq_request, VIA1_IRQ_NB);
+
+    /* A/UX mode */
+    qdev_init_gpio_out(DEVICE(obj), &v1s->auxmode_irq, 1);
 }
 
 static const VMStateDescription vmstate_q800_via1 = {
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index ede413965b..2da96d167a 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -228,6 +228,7 @@ via1_rtc_cmd_pram_sect_write(int sector, int offset, int addr, int value) "secto
 via1_adb_send(const char *state, uint8_t data, const char *vadbint) "state %s data=0x%02x vADBInt=%s"
 via1_adb_receive(const char *state, uint8_t data, const char *vadbint, int status, int index, int size) "state %s data=0x%02x vADBInt=%s status=0x%x index=%d size=%d"
 via1_adb_poll(uint8_t data, const char *vadbint, int status, int index, int size) "data=0x%02x vADBInt=%s status=0x%x index=%d size=%d"
+via1_auxmode(int mode) "setting auxmode to %d"
 
 # grlib_ahb_apb_pnp.c
 grlib_ahb_pnp_read(uint64_t addr, uint32_t value) "AHB PnP read addr:0x%03"PRIx64" data:0x%08x"
diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
index 4506abe5d0..b445565866 100644
--- a/include/hw/misc/mac_via.h
+++ b/include/hw/misc/mac_via.h
@@ -43,6 +43,7 @@ struct MOS6522Q800VIA1State {
     MemoryRegion via_mem;
 
     qemu_irq irqs[VIA1_IRQ_NB];
+    qemu_irq auxmode_irq;
     uint8_t last_b;
 
     /* RTC */
-- 
2.20.1


