Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991764CE5AA
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 16:58:59 +0100 (CET)
Received: from localhost ([::1]:33620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQWo6-0003Fp-N2
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 10:58:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQWl9-0003c4-Vs
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 10:55:56 -0500
Received: from [2001:41c9:1:41f::167] (port=59246
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQWl8-0003g7-GZ
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 10:55:55 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQWkP-0008cY-2O; Sat, 05 Mar 2022 15:55:13 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu, pbonzini@redhat.com, fam@euphon.net,
 qemu-devel@nongnu.org
Date: Sat,  5 Mar 2022 15:55:22 +0000
Message-Id: <20220305155530.9265-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220305155530.9265-1-mark.cave-ayland@ilande.co.uk>
References: <20220305155530.9265-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 02/10] macfb: don't use special irq_state and irq_mask
 variables in MacfbState
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The current IRQ state and IRQ mask are handled exactly the same as standard
register accesses, so store these values directly in the regs array rather
than having separate variables for them.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/macfb.c         | 15 +++++++--------
 include/hw/display/macfb.h |  2 --
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index 66ceacf1ae..fb54b460c1 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -476,7 +476,8 @@ static void macfb_update_display(void *opaque)
 
 static void macfb_update_irq(MacfbState *s)
 {
-    uint32_t irq_state = s->irq_state & s->irq_mask;
+    uint32_t irq_state = s->regs[DAFB_INTR_STAT >> 2] &
+                         s->regs[DAFB_INTR_MASK >> 2];
 
     if (irq_state) {
         qemu_irq_raise(s->irq);
@@ -496,7 +497,7 @@ static void macfb_vbl_timer(void *opaque)
     MacfbState *s = opaque;
     int64_t next_vbl;
 
-    s->irq_state |= DAFB_INTR_VBL;
+    s->regs[DAFB_INTR_STAT >> 2] |= DAFB_INTR_VBL;
     macfb_update_irq(s);
 
     /* 60 Hz irq */
@@ -530,10 +531,8 @@ static uint64_t macfb_ctrl_read(void *opaque,
     case DAFB_MODE_VADDR2:
     case DAFB_MODE_CTRL1:
     case DAFB_MODE_CTRL2:
-        val = s->regs[addr >> 2];
-        break;
     case DAFB_INTR_STAT:
-        val = s->irq_state;
+        val = s->regs[addr >> 2];
         break;
     case DAFB_MODE_SENSE:
         val = macfb_sense_read(s);
@@ -568,7 +567,7 @@ static void macfb_ctrl_write(void *opaque,
         macfb_sense_write(s, val);
         break;
     case DAFB_INTR_MASK:
-        s->irq_mask = val;
+        s->regs[addr >> 2] = val;
         if (val & DAFB_INTR_VBL) {
             next_vbl = macfb_next_vbl();
             timer_mod(s->vbl_timer, next_vbl);
@@ -577,12 +576,12 @@ static void macfb_ctrl_write(void *opaque,
         }
         break;
     case DAFB_INTR_CLEAR:
-        s->irq_state &= ~DAFB_INTR_VBL;
+        s->regs[DAFB_INTR_STAT >> 2] &= ~DAFB_INTR_VBL;
         macfb_update_irq(s);
         break;
     case DAFB_RESET:
         s->palette_current = 0;
-        s->irq_state &= ~DAFB_INTR_VBL;
+        s->regs[DAFB_INTR_STAT >> 2] &= ~DAFB_INTR_VBL;
         macfb_update_irq(s);
         break;
     case DAFB_LUT:
diff --git a/include/hw/display/macfb.h b/include/hw/display/macfb.h
index e52775aa21..6d9f0f7869 100644
--- a/include/hw/display/macfb.h
+++ b/include/hw/display/macfb.h
@@ -66,8 +66,6 @@ typedef struct MacfbState {
     uint32_t regs[MACFB_NUM_REGS];
     MacFbMode *mode;
 
-    uint32_t irq_state;
-    uint32_t irq_mask;
     QEMUTimer *vbl_timer;
     qemu_irq irq;
 } MacfbState;
-- 
2.20.1


