Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EAE440506
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 23:44:33 +0200 (CEST)
Received: from localhost ([::1]:33226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgZfs-000213-OM
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 17:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgZJJ-0007iG-KO
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 17:21:14 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:19950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgZJE-0005cA-Rt
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 17:21:13 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 092367561AE;
 Fri, 29 Oct 2021 23:20:45 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0E9E47561EB; Fri, 29 Oct 2021 23:20:44 +0200 (CEST)
Message-Id: <f818dc3dd2ac8c3b3d53067f316a716d7f9683d8.1635541329.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635541329.git.balaton@eik.bme.hu>
References: <cover.1635541329.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v6 30/30] hw/timer/sh_timer: Remove use of hw_error
Date: Fri, 29 Oct 2021 23:02:09 +0200
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

The hw_error function calls abort and is not meant to be used by
devices. Use qemu_log_mask instead to log and ignore invalid accesses.
Also fix format strings to allow dropping type casts of hwaddr and use
__func__ instead of hard coding function name in the message which
were wrong in two cases.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/timer/sh_timer.c | 40 +++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index a6445092e4..8a586f2c4a 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -10,7 +10,7 @@
 
 #include "qemu/osdep.h"
 #include "exec/memory.h"
-#include "hw/hw.h"
+#include "qemu/log.h"
 #include "hw/irq.h"
 #include "hw/sh4/sh.h"
 #include "hw/timer/tmu012.h"
@@ -75,11 +75,10 @@ static uint32_t sh_timer_read(void *opaque, hwaddr offset)
         if (s->feat & TIMER_FEAT_CAPT) {
             return s->tcpr;
         }
-        /* fall through */
-    default:
-        hw_error("sh_timer_read: Bad offset %x\n", (int)offset);
-        return 0;
     }
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
+                  __func__, offset);
+    return 0;
 }
 
 static void sh_timer_write(void *opaque, hwaddr offset, uint32_t value)
@@ -134,7 +133,8 @@ static void sh_timer_write(void *opaque, hwaddr offset, uint32_t value)
             }
             /* fallthrough */
         default:
-            hw_error("sh_timer_write: Reserved TPSC value\n");
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Reserved TPSC value\n", __func__);
         }
         switch ((value & TIMER_TCR_CKEG) >> 3) {
         case 0:
@@ -147,7 +147,8 @@ static void sh_timer_write(void *opaque, hwaddr offset, uint32_t value)
             }
             /* fallthrough */
         default:
-            hw_error("sh_timer_write: Reserved CKEG value\n");
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Reserved CKEG value\n", __func__);
         }
         switch ((value & TIMER_TCR_ICPE) >> 6) {
         case 0:
@@ -159,7 +160,8 @@ static void sh_timer_write(void *opaque, hwaddr offset, uint32_t value)
             }
             /* fallthrough */
         default:
-            hw_error("sh_timer_write: Reserved ICPE value\n");
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Reserved ICPE value\n", __func__);
         }
         if ((value & TIMER_TCR_UNF) == 0) {
             s->int_level = 0;
@@ -168,13 +170,15 @@ static void sh_timer_write(void *opaque, hwaddr offset, uint32_t value)
         value &= ~TIMER_TCR_UNF;
 
         if ((value & TIMER_TCR_ICPF) && (!(s->feat & TIMER_FEAT_CAPT))) {
-            hw_error("sh_timer_write: Reserved ICPF value\n");
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Reserved ICPF value\n", __func__);
         }
 
         value &= ~TIMER_TCR_ICPF; /* capture not supported */
 
         if (value & TIMER_TCR_RESERVED) {
-            hw_error("sh_timer_write: Reserved TCR bits set\n");
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Reserved TCR bits set\n", __func__);
         }
         s->tcr = value;
         ptimer_set_limit(s->timer, s->tcor, 0);
@@ -192,7 +196,8 @@ static void sh_timer_write(void *opaque, hwaddr offset, uint32_t value)
         }
         /* fallthrough */
     default:
-        hw_error("sh_timer_write: Bad offset %x\n", (int)offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad offset 0x%" HWADDR_PRIx "\n", __func__, offset);
     }
     sh_timer_update(s);
 }
@@ -262,7 +267,9 @@ static uint64_t tmu012_read(void *opaque, hwaddr offset, unsigned size)
     trace_sh_timer_read(offset);
     if (offset >= 0x20) {
         if (!(s->feat & TMU012_FEAT_3CHAN)) {
-            hw_error("tmu012_write: Bad channel offset %x\n", (int)offset);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Bad channel offset 0x%" HWADDR_PRIx "\n",
+                          __func__, offset);
         }
         return sh_timer_read(s->timer[2], offset - 0x20);
     }
@@ -280,7 +287,8 @@ static uint64_t tmu012_read(void *opaque, hwaddr offset, unsigned size)
         return s->tocr;
     }
 
-    hw_error("tmu012_write: Bad offset %x\n", (int)offset);
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: Bad offset 0x%" HWADDR_PRIx "\n", __func__, offset);
     return 0;
 }
 
@@ -292,7 +300,9 @@ static void tmu012_write(void *opaque, hwaddr offset,
     trace_sh_timer_write(offset, value);
     if (offset >= 0x20) {
         if (!(s->feat & TMU012_FEAT_3CHAN)) {
-            hw_error("tmu012_write: Bad channel offset %x\n", (int)offset);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Bad channel offset 0x%" HWADDR_PRIx "\n",
+                          __func__, offset);
         }
         sh_timer_write(s->timer[2], offset - 0x20, value);
         return;
@@ -315,7 +325,7 @@ static void tmu012_write(void *opaque, hwaddr offset,
             sh_timer_start_stop(s->timer[2], value & (1 << 2));
         } else {
             if (value & (1 << 2)) {
-                hw_error("tmu012_write: Bad channel\n");
+                qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad channel\n", __func__);
             }
         }
 
-- 
2.21.4


