Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D524404FB
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 23:38:49 +0200 (CEST)
Received: from localhost ([::1]:43074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgZaK-0006W5-O0
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 17:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgZJ1-000767-4y
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 17:20:55 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:19910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgZIy-0005ZZ-U2
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 17:20:54 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2E0687561FE;
 Fri, 29 Oct 2021 23:20:44 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9AE60756194; Fri, 29 Oct 2021 23:20:43 +0200 (CEST)
Message-Id: <6b46045141d6d9cc32e17c223896fa1116384796.1635541329.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635541329.git.balaton@eik.bme.hu>
References: <cover.1635541329.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v6 09/30] hw/char/sh_serial: Do not abort on invalid access
Date: Fri, 29 Oct 2021 23:02:09 +0200
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

Replace fprintf with qemu_log_mask LOG_GUEST_ERROR as the intention is
to handle valid accesses in these functions so if we get to these
errors then it's an invalid access. Do not abort as that would allow
the guest to crash QEMU and the practice in other devices is to not do
that just log and ignore the invalid access. While at it also simplify
the complex bit ops to check if a return value was set which can be
done much simpler and clearer.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/char/sh_serial.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 053f45e1a6..2d6ea0042e 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -31,6 +31,7 @@
 #include "chardev/char-fe.h"
 #include "qapi/error.h"
 #include "qemu/timer.h"
+#include "qemu/log.h"
 #include "trace.h"
 
 #define SH_SERIAL_FLAG_TEND (1 << 0)
@@ -195,17 +196,16 @@ static void sh_serial_write(void *opaque, hwaddr offs,
             return;
         }
     }
-
-    fprintf(stderr, "sh_serial: unsupported write to 0x%02"
-            HWADDR_PRIx "\n", offs);
-    abort();
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: unsupported write to 0x%02" HWADDR_PRIx "\n",
+                  __func__, offs);
 }
 
 static uint64_t sh_serial_read(void *opaque, hwaddr offs,
                                unsigned size)
 {
     sh_serial_state *s = opaque;
-    uint32_t ret = ~0;
+    uint32_t ret = UINT32_MAX;
 
 #if 0
     switch (offs) {
@@ -299,10 +299,11 @@ static uint64_t sh_serial_read(void *opaque, hwaddr offs,
     }
     trace_sh_serial_read(size, offs, ret);
 
-    if (ret & ~((1 << 16) - 1)) {
-        fprintf(stderr, "sh_serial: unsupported read from 0x%02"
-                HWADDR_PRIx "\n", offs);
-        abort();
+    if (ret > UINT16_MAX) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: unsupported read from 0x%02" HWADDR_PRIx "\n",
+                      __func__, offs);
+        ret = 0;
     }
 
     return ret;
-- 
2.21.4


