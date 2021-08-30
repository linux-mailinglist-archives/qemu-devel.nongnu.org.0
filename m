Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADF73FB3F5
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 12:36:01 +0200 (CEST)
Received: from localhost ([::1]:45220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKee0-0006S5-MS
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 06:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeUI-0006Jj-Ic
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 06:25:58 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:53350
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeUH-0007mN-0J
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 06:25:58 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeTr-0003D2-6G; Mon, 30 Aug 2021 11:25:36 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Mon, 30 Aug 2021 11:24:47 +0100
Message-Id: <20210830102447.10806-13-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 12/12] mac_via: add qdev gpios for nubus slot interrupts to
 VIA2
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

These will soon be required to enable nubus devices to support interrupts.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/mac_via.c         | 23 +++++++++++++++++++++++
 include/hw/misc/mac_via.h | 10 ++++++++++
 2 files changed, 33 insertions(+)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index f093f7388e..d1abcd97b5 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -1123,6 +1123,26 @@ static void mos6522_q800_via2_reset(DeviceState *dev)
 
     ms->dirb = 0;
     ms->b = 0;
+    ms->dira = 0;
+    ms->a = 0x7f;
+}
+
+static void via2_nubus_irq_request(void *opaque, int irq, int level)
+{
+    MOS6522Q800VIA2State *v2s = opaque;
+    MOS6522State *s = MOS6522(v2s);
+    MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(s);
+
+    if (level) {
+        /* Port A nubus IRQ inputs are active LOW */
+        s->a &= ~(1 << irq);
+        s->ifr |= 1 << VIA2_IRQ_NUBUS_BIT;
+    } else {
+        s->a |= (1 << irq);
+        s->ifr &= ~(1 << VIA2_IRQ_NUBUS_BIT);
+    }
+
+    mdc->update_irq(s);
 }
 
 static void mos6522_q800_via2_init(Object *obj)
@@ -1135,6 +1155,9 @@ static void mos6522_q800_via2_init(Object *obj)
     sysbus_init_mmio(sbd, &v2s->via_mem);
 
     qdev_init_gpio_in(DEVICE(obj), via2_irq_request, VIA2_IRQ_NB);
+
+    qdev_init_gpio_in_named(DEVICE(obj), via2_nubus_irq_request, "nubus-irq",
+                            VIA2_NUBUS_IRQ_NB);
 }
 
 static const VMStateDescription vmstate_q800_via2 = {
diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
index 5168e3ce66..4506abe5d0 100644
--- a/include/hw/misc/mac_via.h
+++ b/include/hw/misc/mac_via.h
@@ -93,6 +93,16 @@ struct MOS6522Q800VIA1State {
 #define VIA2_IRQ_SCSI           (1 << VIA2_IRQ_UNUSED_BIT)
 #define VIA2_IRQ_ASC            (1 << VIA2_IRQ_ASC_BIT)
 
+#define VIA2_NUBUS_IRQ_NB       7
+
+#define VIA2_NUBUS_IRQ_9        0
+#define VIA2_NUBUS_IRQ_A        1
+#define VIA2_NUBUS_IRQ_B        2
+#define VIA2_NUBUS_IRQ_C        3
+#define VIA2_NUBUS_IRQ_D        4
+#define VIA2_NUBUS_IRQ_E        5
+#define VIA2_NUBUS_IRQ_INTVIDEO 6
+
 #define TYPE_MOS6522_Q800_VIA2 "mos6522-q800-via2"
 OBJECT_DECLARE_SIMPLE_TYPE(MOS6522Q800VIA2State, MOS6522_Q800_VIA2)
 
-- 
2.20.1


