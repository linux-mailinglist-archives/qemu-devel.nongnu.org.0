Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41454438612
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 02:52:54 +0200 (CEST)
Received: from localhost ([::1]:57770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meRkr-0006rw-Cz
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 20:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1meRdp-0006FS-MF
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 20:45:38 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:57024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1meRdk-0004FJ-Ei
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 20:45:37 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 003FD7561A2;
 Sun, 24 Oct 2021 02:45:30 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BFDF175619D; Sun, 24 Oct 2021 02:45:30 +0200 (CEST)
Message-Id: <e1ffebb1e35ab4d65ab8c9beb3331f504f375d3a.1635036053.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635036053.git.balaton@eik.bme.hu>
References: <cover.1635036053.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 4/5] hw/sh4: Coding style: Add missing braces
Date: Sun, 24 Oct 2021 02:40:53 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/char/sh_serial.c      | 48 +++++++++++++++--------
 hw/intc/sh_intc.c        | 83 ++++++++++++++++++++++------------------
 hw/sh4/r2d.c             | 15 +++++---
 hw/sh4/sh7750.c          | 24 ++++++++----
 hw/sh4/sh7750_regnames.c |  3 +-
 hw/timer/sh_timer.c      | 22 ++++++-----
 6 files changed, 116 insertions(+), 79 deletions(-)

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 3fdb9f9a99..1b1e6a6a04 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -103,8 +103,9 @@ static void sh_serial_write(void *opaque, hwaddr offs,
     case 0x08: /* SCR */
         /* TODO : For SH7751, SCIF mask should be 0xfb. */
         s->scr = val & ((s->feat & SH_SERIAL_FEAT_SCIF) ? 0xfa : 0xff);
-        if (!(val & (1 << 5)))
+        if (!(val & (1 << 5))) {
             s->flags |= SH_SERIAL_FLAG_TEND;
+        }
         if ((s->feat & SH_SERIAL_FEAT_SCIF) && s->txi) {
             qemu_set_irq(s->txi, val & (1 << 7));
         }
@@ -133,16 +134,21 @@ static void sh_serial_write(void *opaque, hwaddr offs,
     if (s->feat & SH_SERIAL_FEAT_SCIF) {
         switch (offs) {
         case 0x10: /* FSR */
-            if (!(val & (1 << 6)))
+            if (!(val & (1 << 6))) {
                 s->flags &= ~SH_SERIAL_FLAG_TEND;
-            if (!(val & (1 << 5)))
+            }
+            if (!(val & (1 << 5))) {
                 s->flags &= ~SH_SERIAL_FLAG_TDE;
-            if (!(val & (1 << 4)))
+            }
+            if (!(val & (1 << 4))) {
                 s->flags &= ~SH_SERIAL_FLAG_BRK;
-            if (!(val & (1 << 1)))
+            }
+            if (!(val & (1 << 1))) {
                 s->flags &= ~SH_SERIAL_FLAG_RDF;
-            if (!(val & (1 << 0)))
+            }
+            if (!(val & (1 << 0))) {
                 s->flags &= ~SH_SERIAL_FLAG_DR;
+            }
 
             if (!(val & (1 << 1)) || !(val & (1 << 0))) {
                 if (s->rxi) {
@@ -231,29 +237,37 @@ static uint64_t sh_serial_read(void *opaque, hwaddr offs,
             break;
         case 0x10: /* FSR */
             ret = 0;
-            if (s->flags & SH_SERIAL_FLAG_TEND)
+            if (s->flags & SH_SERIAL_FLAG_TEND) {
                 ret |= (1 << 6);
-            if (s->flags & SH_SERIAL_FLAG_TDE)
+            }
+            if (s->flags & SH_SERIAL_FLAG_TDE) {
                 ret |= (1 << 5);
-            if (s->flags & SH_SERIAL_FLAG_BRK)
+            }
+            if (s->flags & SH_SERIAL_FLAG_BRK) {
                 ret |= (1 << 4);
-            if (s->flags & SH_SERIAL_FLAG_RDF)
+            }
+            if (s->flags & SH_SERIAL_FLAG_RDF) {
                 ret |= (1 << 1);
-            if (s->flags & SH_SERIAL_FLAG_DR)
+            }
+            if (s->flags & SH_SERIAL_FLAG_DR) {
                 ret |= (1 << 0);
+            }
 
-            if (s->scr & (1 << 5))
+            if (s->scr & (1 << 5)) {
                 s->flags |= SH_SERIAL_FLAG_TDE | SH_SERIAL_FLAG_TEND;
+            }
 
             break;
         case 0x14:
             if (s->rx_cnt > 0) {
                 ret = s->rx_fifo[s->rx_tail++];
                 s->rx_cnt--;
-                if (s->rx_tail == SH_RX_FIFO_LENGTH)
+                if (s->rx_tail == SH_RX_FIFO_LENGTH) {
                     s->rx_tail = 0;
-                if (s->rx_cnt < s->rtrg)
+                }
+                if (s->rx_cnt < s->rtrg) {
                     s->flags &= ~SH_SERIAL_FLAG_RDF;
+                }
             }
             break;
         case 0x18:
@@ -308,8 +322,9 @@ static int sh_serial_can_receive(sh_serial_state *s)
 
 static void sh_serial_receive_break(sh_serial_state *s)
 {
-    if (s->feat & SH_SERIAL_FEAT_SCIF)
+    if (s->feat & SH_SERIAL_FEAT_SCIF) {
         s->sr |= (1 << 4);
+    }
 }
 
 static int sh_serial_can_receive1(void *opaque)
@@ -361,8 +376,9 @@ static void sh_serial_receive1(void *opaque, const uint8_t *buf, int size)
 static void sh_serial_event(void *opaque, QEMUChrEvent event)
 {
     sh_serial_state *s = opaque;
-    if (event == CHR_EVENT_BREAK)
+    if (event == CHR_EVENT_BREAK) {
         sh_serial_receive_break(s);
+    }
 }
 
 static const MemoryRegionOps sh_serial_ops = {
diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index 783a05fa38..e7c9964dba 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -26,23 +26,23 @@ void sh_intc_toggle_source(struct intc_source *source,
     int pending_changed = 0;
     int old_pending;
 
-    if ((source->enable_count == source->enable_max) && (enable_adj == -1))
+    if ((source->enable_count == source->enable_max) && (enable_adj == -1)) {
         enable_changed = -1;
-
+    }
     source->enable_count += enable_adj;
 
-    if (source->enable_count == source->enable_max)
+    if (source->enable_count == source->enable_max) {
         enable_changed = 1;
-
+    }
     source->asserted += assert_adj;
 
     old_pending = source->pending;
     source->pending = source->asserted &&
       (source->enable_count == source->enable_max);
 
-    if (old_pending != source->pending)
+    if (old_pending != source->pending) {
         pending_changed = 1;
-
+    }
     if (pending_changed) {
         if (source->pending) {
             source->parent->pending++;
@@ -79,10 +79,11 @@ static void sh_intc_set_irq(void *opaque, int n, int level)
   struct intc_desc *desc = opaque;
   struct intc_source *source = &(desc->sources[n]);
 
-  if (level && !source->asserted)
+  if (level && !source->asserted) {
     sh_intc_toggle_source(source, 0, 1);
-  else if (!level && source->asserted)
+  } else if (!level && source->asserted) {
     sh_intc_toggle_source(source, 0, -1);
+  }
 }
 
 int sh_intc_get_pending_vector(struct intc_desc *desc, int imask)
@@ -126,16 +127,18 @@ static unsigned int sh_intc_mode(unsigned long address,
         return INTC_MODE_NONE;
 
     if (set_reg && clr_reg) {
-        if (address == INTC_A7(set_reg))
+        if (address == INTC_A7(set_reg)) {
             return INTC_MODE_DUAL_SET;
-        else
+        } else {
             return INTC_MODE_DUAL_CLR;
+        }
     }
 
-    if (set_reg)
+    if (set_reg) {
         return INTC_MODE_ENABLE_REG;
-    else
+    } else {
         return INTC_MODE_MASK_REG;
+    }
 }
 
 static void sh_intc_locate(struct intc_desc *desc,
@@ -155,9 +158,9 @@ static void sh_intc_locate(struct intc_desc *desc,
             struct intc_mask_reg *mr = desc->mask_regs + i;
 
             mode = sh_intc_mode(address, mr->set_reg, mr->clr_reg);
-            if (mode == INTC_MODE_NONE)
+            if (mode == INTC_MODE_NONE) {
                 continue;
-
+            }
             *modep = mode;
             *datap = &mr->value;
             *enums = mr->enum_ids;
@@ -172,9 +175,9 @@ static void sh_intc_locate(struct intc_desc *desc,
             struct intc_prio_reg *pr = desc->prio_regs + i;
 
             mode = sh_intc_mode(address, pr->set_reg, pr->clr_reg);
-            if (mode == INTC_MODE_NONE)
+            if (mode == INTC_MODE_NONE) {
                 continue;
-
+            }
             *modep = mode | INTC_MODE_IS_PRIO;
             *datap = &pr->value;
             *enums = pr->enum_ids;
@@ -192,9 +195,9 @@ static void sh_intc_toggle_mask(struct intc_desc *desc, intc_enum id,
 {
     struct intc_source *source = desc->sources + id;
 
-    if (!id)
+    if (!id) {
         return;
-
+    }
     if (!source->next_enum_id && (!source->enable_max || !source->vect)) {
 #ifdef DEBUG_INTC_SOURCES
         printf("sh_intc: reserved interrupt source %d modified\n", id);
@@ -202,9 +205,9 @@ static void sh_intc_toggle_mask(struct intc_desc *desc, intc_enum id,
         return;
     }
 
-    if (source->vect)
+    if (source->vect) {
         sh_intc_toggle_source(source, enable ? 1 : -1, 0);
-
+    }
 #ifdef DEBUG_INTC
     else {
         printf("setting interrupt group %d to %d\n", id, !!enable);
@@ -276,8 +279,9 @@ static void sh_intc_write(void *opaque, hwaddr offset,
     for (k = 0; k <= first; k++) {
         mask = ((1 << width) - 1) << ((first - k) * width);
 
-        if ((*valuep & mask) == (value & mask))
+        if ((*valuep & mask) == (value & mask)) {
             continue;
+        }
 #if 0
         printf("k = %d, first = %d, enum = %d, mask = 0x%08x\n",
                k, first, enum_ids[k], (unsigned int)mask);
@@ -300,9 +304,9 @@ static const MemoryRegionOps sh_intc_ops = {
 
 struct intc_source *sh_intc_source(struct intc_desc *desc, intc_enum id)
 {
-    if (id)
+    if (id) {
         return desc->sources + id;
-
+    }
     return NULL;
 }
 
@@ -351,12 +355,13 @@ static void sh_intc_register_source(struct intc_desc *desc,
             struct intc_mask_reg *mr = desc->mask_regs + i;
 
             for (k = 0; k < ARRAY_SIZE(mr->enum_ids); k++) {
-                if (mr->enum_ids[k] != source)
+                if (mr->enum_ids[k] != source) {
                     continue;
-
+                }
                 s = sh_intc_source(desc, mr->enum_ids[k]);
-                if (s)
+                if (s) {
                     s->enable_max++;
+                }
             }
         }
     }
@@ -366,12 +371,13 @@ static void sh_intc_register_source(struct intc_desc *desc,
             struct intc_prio_reg *pr = desc->prio_regs + i;
 
             for (k = 0; k < ARRAY_SIZE(pr->enum_ids); k++) {
-                if (pr->enum_ids[k] != source)
+                if (pr->enum_ids[k] != source) {
                     continue;
-
+                }
                 s = sh_intc_source(desc, pr->enum_ids[k]);
-                if (s)
+                if (s) {
                     s->enable_max++;
+                }
             }
         }
     }
@@ -381,12 +387,13 @@ static void sh_intc_register_source(struct intc_desc *desc,
             struct intc_group *gr = groups + i;
 
             for (k = 0; k < ARRAY_SIZE(gr->enum_ids); k++) {
-                if (gr->enum_ids[k] != source)
+                if (gr->enum_ids[k] != source) {
                     continue;
-
+                }
                 s = sh_intc_source(desc, gr->enum_ids[k]);
-                if (s)
+                if (s) {
                     s->enable_max++;
+                }
             }
         }
     }
@@ -425,9 +432,9 @@ void sh_intc_register_sources(struct intc_desc *desc,
             s->next_enum_id = gr->enum_ids[0];
 
             for (k = 1; k < ARRAY_SIZE(gr->enum_ids); k++) {
-                if (!gr->enum_ids[k])
+                if (!gr->enum_ids[k]) {
                     continue;
-
+                }
                 s = sh_intc_source(desc, gr->enum_ids[k - 1]);
                 s->next_enum_id = gr->enum_ids[k];
             }
@@ -512,11 +519,11 @@ void sh_intc_set_irl(void *opaque, int n, int level)
     struct intc_source *s = opaque;
     int i, irl = level ^ 15;
     for (i = 0; (s = sh_intc_source(s->parent, s->next_enum_id)); i++) {
-        if (i == irl)
+        if (i == irl) {
             sh_intc_toggle_source(s, s->enable_count ? 0 : 1,
                                   s->asserted ? 0 : 1);
-        else
-            if (s->asserted)
-                sh_intc_toggle_source(s, 0, -1);
+        } else if (s->asserted) {
+            sh_intc_toggle_source(s, 0, -1);
+        }
     }
 }
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 216d6e24a1..57ccae7249 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -114,20 +114,23 @@ static const struct { short irl; uint16_t msk; } irqtab[NR_IRQS] = {
 static void update_irl(r2d_fpga_t *fpga)
 {
     int i, irl = 15;
-    for (i = 0; i < NR_IRQS; i++)
-        if (fpga->irlmon & fpga->irlmsk & irqtab[i].msk)
-            if (irqtab[i].irl < irl)
-                irl = irqtab[i].irl;
+    for (i = 0; i < NR_IRQS; i++) {
+        if ((fpga->irlmon & fpga->irlmsk & irqtab[i].msk) &&
+            irqtab[i].irl < irl) {
+            irl = irqtab[i].irl;
+        }
+    }
     qemu_set_irq(fpga->irl, irl ^ 15);
 }
 
 static void r2d_fpga_irq_set(void *opaque, int n, int level)
 {
     r2d_fpga_t *fpga = opaque;
-    if (level)
+    if (level) {
         fpga->irlmon |= irqtab[n].msk;
-    else
+    } else {
         fpga->irlmon &= ~irqtab[n].msk;
+    }
     update_irl(fpga);
 }
 
diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
index 1e61f9f1c8..ca7e261aba 100644
--- a/hw/sh4/sh7750.c
+++ b/hw/sh4/sh7750.c
@@ -153,8 +153,9 @@ static void porta_changed(SH7750State *s, uint16_t prev)
     fprintf(stderr, "pdtra=0x%04x, pctra=0x%08x\n", s->pdtra, s->pctra);
 #endif
     currenta = porta_lines(s);
-    if (currenta == prev)
+    if (currenta == prev) {
         return;
+    }
     changes = currenta ^ prev;
 
     for (i = 0; i < NB_DEVICES; i++) {
@@ -167,8 +168,9 @@ static void porta_changed(SH7750State *s, uint16_t prev)
         }
     }
 
-    if (r)
+    if (r) {
         gen_port_interrupts(s);
+    }
 }
 
 static void portb_changed(SH7750State *s, uint16_t prev)
@@ -177,8 +179,9 @@ static void portb_changed(SH7750State *s, uint16_t prev)
     int i, r = 0;
 
     currentb = portb_lines(s);
-    if (currentb == prev)
+    if (currentb == prev) {
         return;
+    }
     changes = currentb ^ prev;
 
     for (i = 0; i < NB_DEVICES; i++) {
@@ -191,8 +194,9 @@ static void portb_changed(SH7750State *s, uint16_t prev)
         }
     }
 
-    if (r)
+    if (r) {
         gen_port_interrupts(s);
+    }
 }
 
 /*
@@ -228,8 +232,9 @@ static uint32_t sh7750_mem_readw(void *opaque, hwaddr addr)
     case SH7750_BCR2_A7:
         return s->bcr2;
     case SH7750_BCR3_A7:
-        if (!has_bcr3_and_bcr4(s))
+        if (!has_bcr3_and_bcr4(s)) {
             error_access("word read", addr);
+        }
         return s->bcr3;
     case SH7750_FRQCR_A7:
         return 0;
@@ -263,8 +268,9 @@ static uint32_t sh7750_mem_readl(void *opaque, hwaddr addr)
     case SH7750_BCR1_A7:
         return s->bcr1;
     case SH7750_BCR4_A7:
-        if (!has_bcr3_and_bcr4(s))
+        if (!has_bcr3_and_bcr4(s)) {
             error_access("long read", addr);
+        }
         return s->bcr4;
     case SH7750_WCR1_A7:
     case SH7750_WCR2_A7:
@@ -332,8 +338,9 @@ static void sh7750_mem_writew(void *opaque, hwaddr addr,
         s->bcr2 = mem_value;
         return;
     case SH7750_BCR3_A7:
-        if (!has_bcr3_and_bcr4(s))
+        if (!has_bcr3_and_bcr4(s)) {
             error_access("word write", addr);
+        }
         s->bcr3 = mem_value;
         return;
     case SH7750_PCR_A7:
@@ -384,8 +391,9 @@ static void sh7750_mem_writel(void *opaque, hwaddr addr,
         s->bcr1 = mem_value;
         return;
     case SH7750_BCR4_A7:
-        if (!has_bcr3_and_bcr4(s))
+        if (!has_bcr3_and_bcr4(s)) {
             error_access("long write", addr);
+        }
         s->bcr4 = mem_value;
         return;
     case SH7750_WCR1_A7:
diff --git a/hw/sh4/sh7750_regnames.c b/hw/sh4/sh7750_regnames.c
index 37b3acd620..e531d46a8e 100644
--- a/hw/sh4/sh7750_regnames.c
+++ b/hw/sh4/sh7750_regnames.c
@@ -90,8 +90,9 @@ const char *regname(uint32_t addr)
     unsigned int i;
 
     for (i = 0; regnames[i].regaddr != (uint32_t)-1; i++) {
-        if (regnames[i].regaddr == addr)
+        if (regnames[i].regaddr == addr) {
             return regnames[i].regname;
+        }
     }
 
     return "<unknown reg>";
diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index 01afcbd2b0..68c109ecfd 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -54,9 +54,9 @@ static void sh_timer_update(sh_timer_state *s)
 {
     int new_level = s->int_level && (s->tcr & TIMER_TCR_UNIE);
 
-    if (new_level != s->old_level)
+    if (new_level != s->old_level) {
         qemu_set_irq(s->irq, new_level);
-
+    }
     s->old_level = s->int_level;
     s->int_level = new_level;
 }
@@ -73,8 +73,9 @@ static uint32_t sh_timer_read(void *opaque, hwaddr offset)
     case OFFSET_TCR:
         return s->tcr | (s->int_level ? TIMER_TCR_UNF : 0);
     case OFFSET_TCPR:
-        if (s->feat & TIMER_FEAT_CAPT)
+        if (s->feat & TIMER_FEAT_CAPT) {
             return s->tcpr;
+        }
         /* fall through */
     default:
         hw_error("sh_timer_read: Bad offset %x\n", (int)offset);
@@ -279,17 +280,18 @@ static uint64_t tmu012_read(void *opaque, hwaddr offset,
         return sh_timer_read(s->timer[2], offset - 0x20);
     }
 
-    if (offset >= 0x14)
+    if (offset >= 0x14) {
         return sh_timer_read(s->timer[1], offset - 0x14);
-
-    if (offset >= 0x08)
+    }
+    if (offset >= 0x08) {
         return sh_timer_read(s->timer[0], offset - 0x08);
-
-    if (offset == 4)
+    }
+    if (offset == 4) {
         return s->tstr;
-
-    if ((s->feat & TMU012_FEAT_TOCR) && offset == 0)
+    }
+    if ((s->feat & TMU012_FEAT_TOCR) && offset == 0) {
         return s->tocr;
+    }
 
     hw_error("tmu012_write: Bad offset %x\n", (int)offset);
     return 0;
-- 
2.21.4


