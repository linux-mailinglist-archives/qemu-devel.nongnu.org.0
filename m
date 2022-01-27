Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A6C49ED07
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 22:09:29 +0100 (CET)
Received: from localhost ([::1]:52944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDC1G-0006Xx-OA
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 16:09:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDBnB-00006V-75
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 15:54:53 -0500
Received: from [2001:41c9:1:41f::167] (port=36860
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDBn9-0004zS-AE
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 15:54:52 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDBme-000BHM-F0; Thu, 27 Jan 2022 20:54:24 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Thu, 27 Jan 2022 20:54:05 +0000
Message-Id: <20220127205405.23499-12-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 11/11] macio/pmu.c: remove redundant code
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

Now that the logic related to edge-triggered interrupts is all contained within
the mos6522 device the redundant implementation for the mac99 PMU device can
be removed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/macio/pmu.c         | 33 ---------------------------------
 include/hw/misc/macio/pmu.h |  2 --
 2 files changed, 35 deletions(-)

diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
index a5dd0a4734..a16841e758 100644
--- a/hw/misc/macio/pmu.c
+++ b/hw/misc/macio/pmu.c
@@ -57,19 +57,6 @@
 
 #define VIA_TIMER_FREQ (4700000 / 6)
 
-static void via_update_irq(PMUState *s)
-{
-    MOS6522PMUState *mps = MOS6522_PMU(&s->mos6522_pmu);
-    MOS6522State *ms = MOS6522(mps);
-
-    bool new_state = !!(ms->ifr & ms->ier & (SR_INT | T1_INT | T2_INT));
-
-    if (new_state != s->via_irq_state) {
-        s->via_irq_state = new_state;
-        qemu_set_irq(s->via_irq, new_state);
-    }
-}
-
 static void via_set_sr_int(void *opaque)
 {
     PMUState *s = opaque;
@@ -808,28 +795,9 @@ static void mos6522_pmu_portB_write(MOS6522State *s)
     MOS6522PMUState *mps = container_of(s, MOS6522PMUState, parent_obj);
     PMUState *ps = container_of(mps, PMUState, mos6522_pmu);
 
-    if ((s->pcr & 0xe0) == 0x20 || (s->pcr & 0xe0) == 0x60) {
-        s->ifr &= ~CB2_INT;
-    }
-    s->ifr &= ~CB1_INT;
-
-    via_update_irq(ps);
     pmu_update(ps);
 }
 
-static void mos6522_pmu_portA_write(MOS6522State *s)
-{
-    MOS6522PMUState *mps = container_of(s, MOS6522PMUState, parent_obj);
-    PMUState *ps = container_of(mps, PMUState, mos6522_pmu);
-
-    if ((s->pcr & 0x0e) == 0x02 || (s->pcr & 0x0e) == 0x06) {
-        s->ifr &= ~CA2_INT;
-    }
-    s->ifr &= ~CA1_INT;
-
-    via_update_irq(ps);
-}
-
 static void mos6522_pmu_reset(DeviceState *dev)
 {
     MOS6522State *ms = MOS6522(dev);
@@ -853,7 +821,6 @@ static void mos6522_pmu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, mos6522_pmu_reset,
                                   &mdc->parent_reset);
     mdc->portB_write = mos6522_pmu_portB_write;
-    mdc->portA_write = mos6522_pmu_portA_write;
 }
 
 static const TypeInfo mos6522_pmu_type_info = {
diff --git a/include/hw/misc/macio/pmu.h b/include/hw/misc/macio/pmu.h
index 78237d99a2..00fcdd23f5 100644
--- a/include/hw/misc/macio/pmu.h
+++ b/include/hw/misc/macio/pmu.h
@@ -193,8 +193,6 @@ struct PMUState {
 
     MemoryRegion mem;
     uint64_t frequency;
-    qemu_irq via_irq;
-    bool via_irq_state;
 
     /* PMU state */
     MOS6522PMUState mos6522_pmu;
-- 
2.20.1


