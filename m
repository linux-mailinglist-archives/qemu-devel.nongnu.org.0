Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1057F50C8CA
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 11:47:53 +0200 (CEST)
Received: from localhost ([::1]:56934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niCMq-0002fe-43
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 05:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1niCIo-0000aw-Gv
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 05:43:42 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:38696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1niCIl-0001ou-Tx
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 05:43:41 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B9FF47470B9;
 Sat, 23 Apr 2022 11:43:38 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CA75C746E06; Sat, 23 Apr 2022 11:43:30 +0200 (CEST)
Message-Id: <d959aa0b267eb139a994e41ca0b7ba87d9cef7a9.1650706617.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1650706617.git.balaton@eik.bme.hu>
References: <cover.1650706617.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 3/3] hw/audio/ac97: Remove unneeded local variables
Date: Sat, 23 Apr 2022 11:36:57 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Victor Colombo <victor.colombo@eldorado.org.br>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Several functions have a local variable that is just a copy of one of
the function parameters. This is unneeded complication so just get rid
of these.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/audio/ac97.c | 102 +++++++++++++++++++++++-------------------------
 1 file changed, 49 insertions(+), 53 deletions(-)

diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
index 6584aa749e..be2dd701a4 100644
--- a/hw/audio/ac97.c
+++ b/hw/audio/ac97.c
@@ -557,9 +557,8 @@ static uint32_t nam_readb(void *opaque, uint32_t addr)
 static uint32_t nam_readw(void *opaque, uint32_t addr)
 {
     AC97LinkState *s = opaque;
-    uint32_t index = addr;
     s->cas = 0;
-    return mixer_load(s, index);
+    return mixer_load(s, addr);
 }
 
 static uint32_t nam_readl(void *opaque, uint32_t addr)
@@ -584,21 +583,21 @@ static void nam_writeb(void *opaque, uint32_t addr, uint32_t val)
 static void nam_writew(void *opaque, uint32_t addr, uint32_t val)
 {
     AC97LinkState *s = opaque;
-    uint32_t index = addr;
+
     s->cas = 0;
-    switch (index) {
+    switch (addr) {
     case AC97_Reset:
         mixer_reset(s);
         break;
     case AC97_Powerdown_Ctrl_Stat:
         val &= ~0x800f;
-        val |= mixer_load(s, index) & 0xf;
-        mixer_store(s, index, val);
+        val |= mixer_load(s, addr) & 0xf;
+        mixer_store(s, addr, val);
         break;
     case AC97_PCM_Out_Volume_Mute:
     case AC97_Master_Volume_Mute:
     case AC97_Record_Gain_Mute:
-        set_volume(s, index, val);
+        set_volume(s, addr, val);
         break;
     case AC97_Record_Select:
         record_select(s, val);
@@ -626,7 +625,7 @@ static void nam_writew(void *opaque, uint32_t addr, uint32_t val)
         break;
     case AC97_PCM_Front_DAC_Rate:
         if (mixer_load(s, AC97_Extended_Audio_Ctrl_Stat) & EACS_VRA) {
-            mixer_store(s, index, val);
+            mixer_store(s, addr, val);
             dolog("Set front DAC rate to %d\n", val);
             open_voice(s, PO_INDEX, val);
         } else {
@@ -636,7 +635,7 @@ static void nam_writew(void *opaque, uint32_t addr, uint32_t val)
         break;
     case AC97_MIC_ADC_Rate:
         if (mixer_load(s, AC97_Extended_Audio_Ctrl_Stat) & EACS_VRM) {
-            mixer_store(s, index, val);
+            mixer_store(s, addr, val);
             dolog("Set MIC ADC rate to %d\n", val);
             open_voice(s, MC_INDEX, val);
         } else {
@@ -646,7 +645,7 @@ static void nam_writew(void *opaque, uint32_t addr, uint32_t val)
         break;
     case AC97_PCM_LR_ADC_Rate:
         if (mixer_load(s, AC97_Extended_Audio_Ctrl_Stat) & EACS_VRA) {
-            mixer_store(s, index, val);
+            mixer_store(s, addr, val);
             dolog("Set front LR ADC rate to %d\n", val);
             open_voice(s, PI_INDEX, val);
         } else {
@@ -673,7 +672,7 @@ static void nam_writew(void *opaque, uint32_t addr, uint32_t val)
         break;
     default:
         dolog("U nam writew 0x%x <- 0x%x\n", addr, val);
-        mixer_store(s, index, val);
+        mixer_store(s, addr, val);
         break;
     }
 }
@@ -693,10 +692,9 @@ static uint32_t nabm_readb(void *opaque, uint32_t addr)
 {
     AC97LinkState *s = opaque;
     AC97BusMasterRegs *r = NULL;
-    uint32_t index = addr;
     uint32_t val = ~0U;
 
-    switch (index) {
+    switch (addr) {
     case CAS:
         dolog("CAS %d\n", s->cas);
         val = s->cas;
@@ -705,37 +703,37 @@ static uint32_t nabm_readb(void *opaque, uint32_t addr)
     case PI_CIV:
     case PO_CIV:
     case MC_CIV:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         val = r->civ;
-        dolog("CIV[%d] -> 0x%x\n", GET_BM(index), val);
+        dolog("CIV[%d] -> 0x%x\n", GET_BM(addr), val);
         break;
     case PI_LVI:
     case PO_LVI:
     case MC_LVI:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         val = r->lvi;
-        dolog("LVI[%d] -> 0x%x\n", GET_BM(index), val);
+        dolog("LVI[%d] -> 0x%x\n", GET_BM(addr), val);
         break;
     case PI_PIV:
     case PO_PIV:
     case MC_PIV:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         val = r->piv;
-        dolog("PIV[%d] -> 0x%x\n", GET_BM(index), val);
+        dolog("PIV[%d] -> 0x%x\n", GET_BM(addr), val);
         break;
     case PI_CR:
     case PO_CR:
     case MC_CR:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         val = r->cr;
-        dolog("CR[%d] -> 0x%x\n", GET_BM(index), val);
+        dolog("CR[%d] -> 0x%x\n", GET_BM(addr), val);
         break;
     case PI_SR:
     case PO_SR:
     case MC_SR:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         val = r->sr & 0xff;
-        dolog("SRb[%d] -> 0x%x\n", GET_BM(index), val);
+        dolog("SRb[%d] -> 0x%x\n", GET_BM(addr), val);
         break;
     default:
         dolog("U nabm readb 0x%x -> 0x%x\n", addr, val);
@@ -748,23 +746,22 @@ static uint32_t nabm_readw(void *opaque, uint32_t addr)
 {
     AC97LinkState *s = opaque;
     AC97BusMasterRegs *r = NULL;
-    uint32_t index = addr;
     uint32_t val = ~0U;
 
-    switch (index) {
+    switch (addr) {
     case PI_SR:
     case PO_SR:
     case MC_SR:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         val = r->sr;
-        dolog("SR[%d] -> 0x%x\n", GET_BM(index), val);
+        dolog("SR[%d] -> 0x%x\n", GET_BM(addr), val);
         break;
     case PI_PICB:
     case PO_PICB:
     case MC_PICB:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         val = r->picb;
-        dolog("PICB[%d] -> 0x%x\n", GET_BM(index), val);
+        dolog("PICB[%d] -> 0x%x\n", GET_BM(addr), val);
         break;
     default:
         dolog("U nabm readw 0x%x -> 0x%x\n", addr, val);
@@ -777,31 +774,30 @@ static uint32_t nabm_readl(void *opaque, uint32_t addr)
 {
     AC97LinkState *s = opaque;
     AC97BusMasterRegs *r = NULL;
-    uint32_t index = addr;
     uint32_t val = ~0U;
 
-    switch (index) {
+    switch (addr) {
     case PI_BDBAR:
     case PO_BDBAR:
     case MC_BDBAR:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         val = r->bdbar;
-        dolog("BMADDR[%d] -> 0x%x\n", GET_BM(index), val);
+        dolog("BMADDR[%d] -> 0x%x\n", GET_BM(addr), val);
         break;
     case PI_CIV:
     case PO_CIV:
     case MC_CIV:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         val = r->civ | (r->lvi << 8) | (r->sr << 16);
-        dolog("CIV LVI SR[%d] -> 0x%x, 0x%x, 0x%x\n", GET_BM(index),
+        dolog("CIV LVI SR[%d] -> 0x%x, 0x%x, 0x%x\n", GET_BM(addr),
                r->civ, r->lvi, r->sr);
         break;
     case PI_PICB:
     case PO_PICB:
     case MC_PICB:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         val = r->picb | (r->piv << 16) | (r->cr << 24);
-        dolog("PICB PIV CR[%d] -> 0x%x 0x%x 0x%x 0x%x\n", GET_BM(index),
+        dolog("PICB PIV CR[%d] -> 0x%x 0x%x 0x%x 0x%x\n", GET_BM(addr),
                val, r->picb, r->piv, r->cr);
         break;
     case GLOB_CNT:
@@ -827,12 +823,12 @@ static void nabm_writeb(void *opaque, uint32_t addr, uint32_t val)
 {
     AC97LinkState *s = opaque;
     AC97BusMasterRegs *r = NULL;
-    uint32_t index = addr;
-    switch (index) {
+
+    switch (addr) {
     case PI_LVI:
     case PO_LVI:
     case MC_LVI:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         if ((r->cr & CR_RPBM) && (r->sr & SR_DCH)) {
             r->sr &= ~(SR_DCH | SR_CELV);
             r->civ = r->piv;
@@ -840,12 +836,12 @@ static void nabm_writeb(void *opaque, uint32_t addr, uint32_t val)
             fetch_bd(s, r);
         }
         r->lvi = val % 32;
-        dolog("LVI[%d] <- 0x%x\n", GET_BM(index), val);
+        dolog("LVI[%d] <- 0x%x\n", GET_BM(addr), val);
         break;
     case PI_CR:
     case PO_CR:
     case MC_CR:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         if (val & CR_RR) {
             reset_bm_regs(s, r);
         } else {
@@ -861,15 +857,15 @@ static void nabm_writeb(void *opaque, uint32_t addr, uint32_t val)
                 voice_set_active(s, r - s->bm_regs, 1);
             }
         }
-        dolog("CR[%d] <- 0x%x (cr 0x%x)\n", GET_BM(index), val, r->cr);
+        dolog("CR[%d] <- 0x%x (cr 0x%x)\n", GET_BM(addr), val, r->cr);
         break;
     case PI_SR:
     case PO_SR:
     case MC_SR:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         r->sr |= val & ~(SR_RO_MASK | SR_WCLEAR_MASK);
         update_sr(s, r, r->sr & ~(val & SR_WCLEAR_MASK));
-        dolog("SR[%d] <- 0x%x (sr 0x%x)\n", GET_BM(index), val, r->sr);
+        dolog("SR[%d] <- 0x%x (sr 0x%x)\n", GET_BM(addr), val, r->sr);
         break;
     default:
         dolog("U nabm writeb 0x%x <- 0x%x\n", addr, val);
@@ -881,15 +877,15 @@ static void nabm_writew(void *opaque, uint32_t addr, uint32_t val)
 {
     AC97LinkState *s = opaque;
     AC97BusMasterRegs *r = NULL;
-    uint32_t index = addr;
-    switch (index) {
+
+    switch (addr) {
     case PI_SR:
     case PO_SR:
     case MC_SR:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         r->sr |= val & ~(SR_RO_MASK | SR_WCLEAR_MASK);
         update_sr(s, r, r->sr & ~(val & SR_WCLEAR_MASK));
-        dolog("SR[%d] <- 0x%x (sr 0x%x)\n", GET_BM(index), val, r->sr);
+        dolog("SR[%d] <- 0x%x (sr 0x%x)\n", GET_BM(addr), val, r->sr);
         break;
     default:
         dolog("U nabm writew 0x%x <- 0x%x\n", addr, val);
@@ -901,14 +897,14 @@ static void nabm_writel(void *opaque, uint32_t addr, uint32_t val)
 {
     AC97LinkState *s = opaque;
     AC97BusMasterRegs *r = NULL;
-    uint32_t index = addr;
-    switch (index) {
+
+    switch (addr) {
     case PI_BDBAR:
     case PO_BDBAR:
     case MC_BDBAR:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         r->bdbar = val & ~3;
-        dolog("BDBAR[%d] <- 0x%x (bdbar 0x%x)\n", GET_BM(index), val, r->bdbar);
+        dolog("BDBAR[%d] <- 0x%x (bdbar 0x%x)\n", GET_BM(addr), val, r->bdbar);
         break;
     case GLOB_CNT:
         /* TODO: Handle WR or CR being set (warm/cold reset requests) */
-- 
2.30.4


