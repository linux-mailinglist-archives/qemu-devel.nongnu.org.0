Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D464043CC97
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 16:43:34 +0200 (CEST)
Received: from localhost ([::1]:38934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfk9N-0007nj-Vn
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 10:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfjS9-0003vI-11
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:58:57 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:28150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfjS5-0004Uu-1b
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:58:51 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 145327561AE;
 Wed, 27 Oct 2021 15:58:42 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 94B3F756036; Wed, 27 Oct 2021 15:58:41 +0200 (CEST)
Message-Id: <c788cbcd379e42908b55df5785c031e437f81a5b.1635342377.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635342377.git.balaton@eik.bme.hu>
References: <cover.1635342377.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 02/11] hw//sh4: Use qemu_log instead of fprintf to stderr
Date: Wed, 27 Oct 2021 15:46:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/char/sh_serial.c |  7 ++++---
 hw/sh4/sh7750.c     | 13 ++++++-------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 1b1e6a6a04..c4231975c7 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -30,6 +30,7 @@
 #include "hw/sh4/sh.h"
 #include "chardev/char-fe.h"
 #include "qapi/error.h"
+#include "qemu/log.h"
 #include "qemu/timer.h"
 
 //#define DEBUG_SERIAL
@@ -200,8 +201,8 @@ static void sh_serial_write(void *opaque, hwaddr offs,
         }
     }
 
-    fprintf(stderr, "sh_serial: unsupported write to 0x%02"
-            HWADDR_PRIx "\n", offs);
+    qemu_log_mask(LOG_UNIMP, "sh_serial: unsupported write to 0x%02"
+                  HWADDR_PRIx "\n", offs);
     abort();
 }
 
@@ -307,7 +308,7 @@ static uint64_t sh_serial_read(void *opaque, hwaddr offs,
 #endif
 
     if (ret & ~((1 << 16) - 1)) {
-        fprintf(stderr, "sh_serial: unsupported read from 0x%02"
+        qemu_log_mask(LOG_UNIMP, "sh_serial: unsupported read from 0x%02"
                 HWADDR_PRIx "\n", offs);
         abort();
     }
diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
index ca7e261aba..f2f251f165 100644
--- a/hw/sh4/sh7750.c
+++ b/hw/sh4/sh7750.c
@@ -24,6 +24,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/irq.h"
 #include "hw/sh4/sh.h"
 #include "sysemu/sysemu.h"
@@ -205,13 +206,13 @@ static void portb_changed(SH7750State *s, uint16_t prev)
 
 static void error_access(const char *kind, hwaddr addr)
 {
-    fprintf(stderr, "%s to %s (0x" TARGET_FMT_plx ") not supported\n",
-            kind, regname(addr), addr);
+    qemu_log_mask(LOG_GUEST_ERROR, "%s to %s (0x" TARGET_FMT_plx
+                  ") not supported\n", kind, regname(addr), addr);
 }
 
 static void ignore_access(const char *kind, hwaddr addr)
 {
-    fprintf(stderr, "%s to %s (0x" TARGET_FMT_plx ") ignored\n",
+    qemu_log_mask(LOG_UNIMP, "%s to %s (0x" TARGET_FMT_plx ") ignored\n",
             kind, regname(addr), addr);
 }
 
@@ -241,8 +242,7 @@ static uint32_t sh7750_mem_readw(void *opaque, hwaddr addr)
     case SH7750_PCR_A7:
         return s->pcr;
     case SH7750_RFCR_A7:
-        fprintf(stderr,
-                "Read access to refresh count register, incrementing\n");
+        /* Read access to refresh count register, incrementing */
         return s->rfcr++;
     case SH7750_PDTRA_A7:
         return porta_lines(s);
@@ -363,13 +363,12 @@ static void sh7750_mem_writew(void *opaque, hwaddr addr,
         portb_changed(s, temp);
         return;
     case SH7750_RFCR_A7:
-        fprintf(stderr, "Write access to refresh count register\n");
         s->rfcr = mem_value;
         return;
     case SH7750_GPIOIC_A7:
         s->gpioic = mem_value;
         if (mem_value != 0) {
-            fprintf(stderr, "I/O interrupts not implemented\n");
+            qemu_log_mask(LOG_UNIMP, "I/O interrupts not implemented\n");
             abort();
         }
         return;
-- 
2.21.4


