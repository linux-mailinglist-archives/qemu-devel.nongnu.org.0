Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BED43E931
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 22:01:10 +0200 (CEST)
Received: from localhost ([::1]:42124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgBaH-0006TI-7p
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 16:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgBWT-0003a4-1i
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:57:13 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:64440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgBWQ-0008SU-7X
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:57:12 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8DF5A7561B9;
 Thu, 28 Oct 2021 21:57:05 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5AE78756047; Thu, 28 Oct 2021 21:57:05 +0200 (CEST)
Message-Id: <417915b49e5ec0f9cf707239e68c46f3f4c7f783.1635449225.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635449225.git.balaton@eik.bme.hu>
References: <cover.1635449225.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v4 04/23] hw/sh4/r2d: Use error_report instead of fprintf to
 stderr
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

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sh4/r2d.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 57ccae7249..72759413f3 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -26,6 +26,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
 #include "hw/sh4/sh.h"
@@ -324,7 +325,7 @@ static void r2d_init(MachineState *machine)
                                           SDRAM_BASE + LINUX_LOAD_OFFSET,
                                           INITRD_LOAD_OFFSET - LINUX_LOAD_OFFSET);
         if (kernel_size < 0) {
-            fprintf(stderr, "qemu: could not load kernel '%s'\n", kernel_filename);
+            error_report("qemu: could not load kernel '%s'", kernel_filename);
             exit(1);
         }
 
@@ -345,7 +346,7 @@ static void r2d_init(MachineState *machine)
                                           SDRAM_SIZE - INITRD_LOAD_OFFSET);
 
         if (initrd_size < 0) {
-            fprintf(stderr, "qemu: could not load initrd '%s'\n", initrd_filename);
+            error_report("qemu: could not load initrd '%s'", initrd_filename);
             exit(1);
         }
 
-- 
2.21.4


