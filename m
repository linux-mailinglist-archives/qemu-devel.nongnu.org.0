Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2D843D6E5
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 00:45:54 +0200 (CEST)
Received: from localhost ([::1]:37454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfrg9-0007Bl-2M
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 18:45:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfrMR-0007yI-KU
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:25:31 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:39563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfrMO-0002r1-9I
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:25:31 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A8BA47561B1;
 Thu, 28 Oct 2021 00:25:23 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1FF73756036; Thu, 28 Oct 2021 00:25:16 +0200 (CEST)
Message-Id: <107f01a0d2eb72cc2bd7055282a0c5fe2a1999f7.1635371671.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635371671.git.balaton@eik.bme.hu>
References: <cover.1635371671.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 03/18] hw/sh4: Change debug printfs to traces
Date: Wed, 27 Oct 2021 23:54:31 +0200
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 hw/char/sh_serial.c   | 13 ++-----
 hw/char/trace-events  |  4 +++
 hw/intc/sh_intc.c     | 79 +++++++++++--------------------------------
 hw/intc/trace-events  |  8 +++++
 hw/sh4/sh7750.c       |  8 ++---
 hw/sh4/trace-events   |  3 ++
 hw/sh4/trace.h        |  1 +
 hw/timer/sh_timer.c   | 12 ++-----
 hw/timer/trace-events |  3 ++
 meson.build           |  1 +
 10 files changed, 48 insertions(+), 84 deletions(-)
 create mode 100644 hw/sh4/trace-events
 create mode 100644 hw/sh4/trace.h

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index c4231975c7..bbf7586892 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -32,8 +32,7 @@
 #include "qapi/error.h"
 #include "qemu/log.h"
 #include "qemu/timer.h"
-
-//#define DEBUG_SERIAL
+#include "trace.h"
 
 #define SH_SERIAL_FLAG_TEND (1 << 0)
 #define SH_SERIAL_FLAG_TDE  (1 << 1)
@@ -90,10 +89,7 @@ static void sh_serial_write(void *opaque, hwaddr offs,
     sh_serial_state *s = opaque;
     unsigned char ch;
 
-#ifdef DEBUG_SERIAL
-    printf("sh_serial: write offs=0x%02x val=0x%02x\n",
-           offs, val);
-#endif
+    trace_sh_serial_write(size, offs, val);
     switch (offs) {
     case 0x00: /* SMR */
         s->smr = val & ((s->feat & SH_SERIAL_FEAT_SCIF) ? 0x7b : 0xff);
@@ -302,10 +298,7 @@ static uint64_t sh_serial_read(void *opaque, hwaddr offs,
             break;
         }
     }
-#ifdef DEBUG_SERIAL
-    printf("sh_serial: read offs=0x%02x val=0x%x\n",
-           offs, ret);
-#endif
+    trace_sh_serial_read(size, offs, ret);
 
     if (ret & ~((1 << 16) - 1)) {
         qemu_log_mask(LOG_UNIMP, "sh_serial: unsupported read from 0x%02"
diff --git a/hw/char/trace-events b/hw/char/trace-events
index b774832af4..4a92e7674a 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -101,3 +101,7 @@ exynos_uart_rx_timeout(uint32_t channel, uint32_t stat, uint32_t intsp) "UART%d:
 
 # cadence_uart.c
 cadence_uart_baudrate(unsigned baudrate) "baudrate %u"
+
+# sh_serial.c
+sh_serial_read(unsigned size, uint64_t offs, uint64_t val) " size %d offs 0x%02" PRIx64 " -> 0x%02" PRIx64
+sh_serial_write(unsigned size, uint64_t offs, uint64_t val) "size %d offs 0x%02" PRIx64 " <- 0x%02" PRIx64
diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index e7c9964dba..c1058d97c0 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -9,13 +9,12 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "hw/sh4/sh_intc.h"
 #include "hw/irq.h"
 #include "hw/sh4/sh.h"
-
-//#define DEBUG_INTC
-//#define DEBUG_INTC_SOURCES
+#include "trace.h"
 
 #define INTC_A7(x) ((x) & 0x1fffffff)
 
@@ -57,20 +56,14 @@ void sh_intc_toggle_source(struct intc_source *source,
         }
     }
 
-  if (enable_changed || assert_adj || pending_changed) {
-#ifdef DEBUG_INTC_SOURCES
-            printf("sh_intc: (%d/%d/%d/%d) interrupt source 0x%x %s%s%s\n",
-                   source->parent->pending,
-                   source->asserted,
-                   source->enable_count,
-                   source->enable_max,
-                   source->vect,
-                   source->asserted ? "asserted " :
-                   assert_adj ? "deasserted" : "",
-                   enable_changed == 1 ? "enabled " :
-                   enable_changed == -1 ? "disabled " : "",
-                   source->pending ? "pending" : "");
-#endif
+    if (enable_changed || assert_adj || pending_changed) {
+        trace_sh_intc_sources(source->parent->pending, source->asserted,
+                              source->enable_count, source->enable_max,
+                              source->vect, source->asserted ? "asserted " :
+                              assert_adj ? "deasserted" : "",
+                              enable_changed == 1 ? "enabled " :
+                              enable_changed == -1 ? "disabled " : "",
+                              source->pending ? "pending" : "");
   }
 }
 
@@ -101,10 +94,7 @@ int sh_intc_get_pending_vector(struct intc_desc *desc, int imask)
         struct intc_source *source = desc->sources + i;
 
         if (source->pending) {
-#ifdef DEBUG_INTC_SOURCES
-            printf("sh_intc: (%d) returning interrupt source 0x%x\n",
-                   desc->pending, source->vect);
-#endif
+            trace_sh_intc_pending(desc->pending, source->vect);
             return source->vect;
         }
     }
@@ -199,30 +189,22 @@ static void sh_intc_toggle_mask(struct intc_desc *desc, intc_enum id,
         return;
     }
     if (!source->next_enum_id && (!source->enable_max || !source->vect)) {
-#ifdef DEBUG_INTC_SOURCES
-        printf("sh_intc: reserved interrupt source %d modified\n", id);
-#endif
+        qemu_log_mask(LOG_UNIMP,
+                      "sh_intc: reserved interrupt source %d modified\n", id);
         return;
     }
 
     if (source->vect) {
         sh_intc_toggle_source(source, enable ? 1 : -1, 0);
     }
-#ifdef DEBUG_INTC
-    else {
-        printf("setting interrupt group %d to %d\n", id, !!enable);
-    }
-#endif
 
     if ((is_group || !source->vect) && source->next_enum_id) {
         sh_intc_toggle_mask(desc, source->next_enum_id, enable, 1);
     }
 
-#ifdef DEBUG_INTC
     if (!source->vect) {
-        printf("setting interrupt group %d to %d - done\n", id, !!enable);
+        trace_sh_intc_set(id, !!enable);
     }
-#endif
 }
 
 static uint64_t sh_intc_read(void *opaque, hwaddr offset,
@@ -235,12 +217,9 @@ static uint64_t sh_intc_read(void *opaque, hwaddr offset,
     unsigned int mode = 0;
     unsigned long *valuep;
 
-#ifdef DEBUG_INTC
-    printf("sh_intc_read 0x%lx\n", (unsigned long) offset);
-#endif
-
     sh_intc_locate(desc, (unsigned long)offset, &valuep,
                    &enum_ids, &first, &width, &mode);
+    trace_sh_intc_read(size, offset, *valuep);
     return *valuep;
 }
 
@@ -256,13 +235,9 @@ static void sh_intc_write(void *opaque, hwaddr offset,
     unsigned long *valuep;
     unsigned long mask;
 
-#ifdef DEBUG_INTC
-    printf("sh_intc_write 0x%lx 0x%08x\n", (unsigned long) offset, value);
-#endif
-
+    trace_sh_intc_write(size, offset, value);
     sh_intc_locate(desc, (unsigned long)offset, &valuep,
                    &enum_ids, &first, &width, &mode);
-
     switch (mode) {
     case INTC_MODE_ENABLE_REG | INTC_MODE_IS_PRIO:
         break;
@@ -282,18 +257,10 @@ static void sh_intc_write(void *opaque, hwaddr offset,
         if ((*valuep & mask) == (value & mask)) {
             continue;
         }
-#if 0
-        printf("k = %d, first = %d, enum = %d, mask = 0x%08x\n",
-               k, first, enum_ids[k], (unsigned int)mask);
-#endif
         sh_intc_toggle_mask(desc, enum_ids[k], value & mask, 0);
     }
 
     *valuep = value;
-
-#ifdef DEBUG_INTC
-    printf("sh_intc_write 0x%lx -> 0x%08x\n", (unsigned long) offset, value);
-#endif
 }
 
 static const MemoryRegionOps sh_intc_ops = {
@@ -416,11 +383,8 @@ void sh_intc_register_sources(struct intc_desc *desc,
         s = sh_intc_source(desc, vect->enum_id);
         if (s) {
             s->vect = vect->vect;
-
-#ifdef DEBUG_INTC_SOURCES
-            printf("sh_intc: registered source %d -> 0x%04x (%d/%d)\n",
-                   vect->enum_id, s->vect, s->enable_count, s->enable_max);
-#endif
+            trace_sh_intc_register("source", vect->enum_id, s->vect,
+                                   s->enable_count, s->enable_max);
         }
     }
 
@@ -438,11 +402,8 @@ void sh_intc_register_sources(struct intc_desc *desc,
                 s = sh_intc_source(desc, gr->enum_ids[k - 1]);
                 s->next_enum_id = gr->enum_ids[k];
             }
-
-#ifdef DEBUG_INTC_SOURCES
-            printf("sh_intc: registered group %d (%d/%d)\n",
-                   gr->enum_id, s->enable_count, s->enable_max);
-#endif
+            trace_sh_intc_register("group", gr->enum_id, 0xffff,
+                                   s->enable_count, s->enable_max);
         }
     }
 }
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 6a17d38998..9c7e41f41c 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -238,3 +238,11 @@ goldfish_pic_write(void *dev, int idx, unsigned int addr, unsigned int size, uin
 goldfish_pic_reset(void *dev, int idx) "pic: %p goldfish-irq.%d"
 goldfish_pic_realize(void *dev, int idx) "pic: %p goldfish-irq.%d"
 goldfish_pic_instance_init(void *dev) "pic: %p goldfish-irq"
+
+# sh_intc.c
+sh_intc_sources(int p, int a, int c, int m, unsigned short v, const char *s1, const char *s2, const char *s3) "(%d/%d/%d/%d) interrupt source 0x%x %s%s%s"
+sh_intc_pending(int p, unsigned short v) "(%d) returning interrupt source 0x%x"
+sh_intc_register(const char *s, int id, unsigned short v, int c, int m) "%s %d -> 0x%04x (%d/%d)"
+sh_intc_read(unsigned size, uint64_t offset, unsigned long val) "size %d 0x%" PRIx64 " -> 0x%" PRIx64
+sh_intc_write(unsigned size, uint64_t offset, unsigned long val) "size %d 0x%" PRIx64 " <- 0x%" PRIx64
+sh_intc_set(int id, int enable) "setting interrupt group %d to %d"
diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
index f2f251f165..c3c3caf952 100644
--- a/hw/sh4/sh7750.c
+++ b/hw/sh4/sh7750.c
@@ -33,6 +33,7 @@
 #include "hw/sh4/sh_intc.h"
 #include "hw/timer/tmu012.h"
 #include "exec/exec-all.h"
+#include "trace.h"
 
 #define NB_DEVICES 4
 
@@ -148,15 +149,11 @@ static void porta_changed(SH7750State *s, uint16_t prev)
     uint16_t currenta, changes;
     int i, r = 0;
 
-#if 0
-    fprintf(stderr, "porta changed from 0x%04x to 0x%04x\n",
-            prev, porta_lines(s));
-    fprintf(stderr, "pdtra=0x%04x, pctra=0x%08x\n", s->pdtra, s->pctra);
-#endif
     currenta = porta_lines(s);
     if (currenta == prev) {
         return;
     }
+    trace_sh7750_porta(prev, currenta, s->pdtra, s->pctra);
     changes = currenta ^ prev;
 
     for (i = 0; i < NB_DEVICES; i++) {
@@ -183,6 +180,7 @@ static void portb_changed(SH7750State *s, uint16_t prev)
     if (currentb == prev) {
         return;
     }
+    trace_sh7750_portb(prev, currentb, s->pdtrb, s->pctrb);
     changes = currentb ^ prev;
 
     for (i = 0; i < NB_DEVICES; i++) {
diff --git a/hw/sh4/trace-events b/hw/sh4/trace-events
new file mode 100644
index 0000000000..4b61cd56c8
--- /dev/null
+++ b/hw/sh4/trace-events
@@ -0,0 +1,3 @@
+# sh7750.c
+sh7750_porta(uint16_t prev, uint16_t cur, uint16_t pdtr, uint16_t pctr) "porta changed from 0x%04x to 0x%04x\npdtra=0x%04x, pctra=0x%08x"
+sh7750_portb(uint16_t prev, uint16_t cur, uint16_t pdtr, uint16_t pctr) "portb changed from 0x%04x to 0x%04x\npdtrb=0x%04x, pctrb=0x%08x"
diff --git a/hw/sh4/trace.h b/hw/sh4/trace.h
new file mode 100644
index 0000000000..e2c13323b7
--- /dev/null
+++ b/hw/sh4/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_sh4.h"
diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index cc7c1897a8..179d945eaf 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -15,8 +15,7 @@
 #include "hw/sh4/sh.h"
 #include "hw/timer/tmu012.h"
 #include "hw/ptimer.h"
-
-//#define DEBUG_TIMER
+#include "trace.h"
 
 #define TIMER_TCR_TPSC          (7 << 0)
 #define TIMER_TCR_CKEG          (3 << 3)
@@ -203,10 +202,7 @@ static void sh_timer_start_stop(void *opaque, int enable)
 {
     sh_timer_state *s = (sh_timer_state *)opaque;
 
-#ifdef DEBUG_TIMER
-    printf("sh_timer_start_stop %d (%d)\n", enable, s->enabled);
-#endif
-
+    trace_sh_timer_start_stop(enable, s->enabled);
     ptimer_transaction_begin(s->timer);
     if (s->enabled && !enable) {
         ptimer_stop(s->timer);
@@ -216,10 +212,6 @@ static void sh_timer_start_stop(void *opaque, int enable)
     }
     ptimer_transaction_commit(s->timer);
     s->enabled = !!enable;
-
-#ifdef DEBUG_TIMER
-    printf("sh_timer_start_stop done %d\n", s->enabled);
-#endif
 }
 
 static void sh_timer_tick(void *opaque)
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index d0edcd2a80..653025817b 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -94,3 +94,6 @@ sifive_pwm_set_alarm(uint64_t alarm, uint64_t now) "Setting alarm to: 0x%" PRIx6
 sifive_pwm_interrupt(int num) "Interrupt %d"
 sifive_pwm_read(uint64_t offset) "Read at address: 0x%" PRIx64
 sifive_pwm_write(uint64_t data, uint64_t offset) "Write 0x%" PRIx64 " at address: 0x%" PRIx64
+
+# sh_timer.c
+sh_timer_start_stop(int enable, int current) "%d (%d)"
diff --git a/meson.build b/meson.build
index 2c5b53cbe2..b092728397 100644
--- a/meson.build
+++ b/meson.build
@@ -2459,6 +2459,7 @@ if have_system
     'hw/s390x',
     'hw/scsi',
     'hw/sd',
+    'hw/sh4',
     'hw/sparc',
     'hw/sparc64',
     'hw/ssi',
-- 
2.21.4


