Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E01843E944
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 22:04:47 +0200 (CEST)
Received: from localhost ([::1]:50674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgBdl-0003ud-Mk
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 16:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgBWU-0003aS-5h
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:57:14 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:64456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgBWQ-0008TH-7x
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:57:13 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BFE4C7561D5;
 Thu, 28 Oct 2021 21:57:05 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 53746756036; Thu, 28 Oct 2021 21:57:05 +0200 (CEST)
Message-Id: <1ecc1748443a161ecb988aab6b89c68e5ae631ff.1635449225.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635449225.git.balaton@eik.bme.hu>
References: <cover.1635449225.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v4 02/23] hw/char/sh_serial: Use hw_error instead of fprintf
 and abort
Date: Thu, 28 Oct 2021 21:27:05 +0200
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

It does the same with dumping some more state but avoids calling abort
directly and printing to stderr from the device model.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/char/sh_serial.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 1b1e6a6a04..dbefb51d71 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -26,6 +26,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/sh4/sh.h"
 #include "chardev/char-fe.h"
@@ -200,9 +201,7 @@ static void sh_serial_write(void *opaque, hwaddr offs,
         }
     }
 
-    fprintf(stderr, "sh_serial: unsupported write to 0x%02"
-            HWADDR_PRIx "\n", offs);
-    abort();
+    hw_error("sh_serial: unsupported write to 0x%02"HWADDR_PRIx"\n", offs);
 }
 
 static uint64_t sh_serial_read(void *opaque, hwaddr offs,
@@ -307,9 +306,7 @@ static uint64_t sh_serial_read(void *opaque, hwaddr offs,
 #endif
 
     if (ret & ~((1 << 16) - 1)) {
-        fprintf(stderr, "sh_serial: unsupported read from 0x%02"
-                HWADDR_PRIx "\n", offs);
-        abort();
+        hw_error("sh_serial: unsupported read from 0x%02"HWADDR_PRIx"\n", offs);
     }
 
     return ret;
-- 
2.21.4


