Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 621EF49ED03
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 22:03:31 +0100 (CET)
Received: from localhost ([::1]:44402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDBvW-0000iD-Eg
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 16:03:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDBmt-0007uw-Hg
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 15:54:35 -0500
Received: from [2001:41c9:1:41f::167] (port=36828
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDBms-0004w7-3H
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 15:54:35 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDBmM-000BHM-Ts; Thu, 27 Jan 2022 20:54:07 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Thu, 27 Jan 2022 20:53:59 +0000
Message-Id: <20220127205405.23499-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 05/11] mos6522: remove update_irq() and set_sr_int() methods
 from MOS6522DeviceClass
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

Now that the mos6522 IRQs are managed using standard qdev gpios these methods
are no longer required.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/mos6522.c         | 9 ---------
 include/hw/misc/mos6522.h | 2 --
 2 files changed, 11 deletions(-)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index 6be6853dc2..4c3147a7d1 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -208,13 +208,6 @@ static void mos6522_timer2(void *opaque)
     mos6522_update_irq(s);
 }
 
-static void mos6522_set_sr_int(MOS6522State *s)
-{
-    trace_mos6522_set_sr_int();
-    s->ifr |= SR_INT;
-    mos6522_update_irq(s);
-}
-
 static uint64_t mos6522_get_counter_value(MOS6522State *s, MOS6522Timer *ti)
 {
     return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - ti->load_time,
@@ -527,10 +520,8 @@ static void mos6522_class_init(ObjectClass *oc, void *data)
     dc->vmsd = &vmstate_mos6522;
     device_class_set_props(dc, mos6522_properties);
     mdc->parent_reset = dc->reset;
-    mdc->set_sr_int = mos6522_set_sr_int;
     mdc->portB_write = mos6522_portB_write;
     mdc->portA_write = mos6522_portA_write;
-    mdc->update_irq = mos6522_update_irq;
     mdc->get_timer1_counter_value = mos6522_get_counter_value;
     mdc->get_timer2_counter_value = mos6522_get_counter_value;
     mdc->get_timer1_load_time = mos6522_get_load_time;
diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
index ced8a670bf..f6b513a3a2 100644
--- a/include/hw/misc/mos6522.h
+++ b/include/hw/misc/mos6522.h
@@ -140,10 +140,8 @@ struct MOS6522DeviceClass {
     DeviceClass parent_class;
 
     DeviceReset parent_reset;
-    void (*set_sr_int)(MOS6522State *dev);
     void (*portB_write)(MOS6522State *dev);
     void (*portA_write)(MOS6522State *dev);
-    void (*update_irq)(MOS6522State *dev);
     /* These are used to influence the CUDA MacOS timebase calibration */
     uint64_t (*get_timer1_counter_value)(MOS6522State *dev, MOS6522Timer *ti);
     uint64_t (*get_timer2_counter_value)(MOS6522State *dev, MOS6522Timer *ti);
-- 
2.20.1


