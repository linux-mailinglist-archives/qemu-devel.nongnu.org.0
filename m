Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAF0310F7F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:07:31 +0100 (CET)
Received: from localhost ([::1]:36804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85Vx-0004PJ-Ns
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:07:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84Ta-0006kL-Uz
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:00:59 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84T8-00043W-N7
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:00:56 -0500
Received: by mail-wr1-x42a.google.com with SMTP id l12so8485702wry.2
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WtrfuXabVXGeTIyTEVS5d0lsWCXmLnI61ZuEmNjOGlM=;
 b=DDtqw24MGTthrvTCDmCVUhvyNywQQ3ySB1PCZmmdqA69MvBPLN8u+GuH550lICpKTM
 /2Ur1N+ajMBksskb/5L85bcM0JId2ij6HExRnzFXFAyyQI2m4hCMGJRJYVuHNmeGNN3F
 zsX+EspckPaQQftqV2kqKbLrT2u4/JSCWPyWOCG2JpOAeev7VVgyIhQijjSeZ8LSEiGc
 kxeOdU7UilnarRePQ0M2zVlXuT94V52X55+xXMh/LN8HIy3xIt3qZQOKZt0hmJSY+B+O
 /xkdf0icRQFKPVF/Tcg1aOOP2u49grsQlKA5VCDHhwYy2NB+eIvTXmtc/urONqgoq7fR
 ZUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WtrfuXabVXGeTIyTEVS5d0lsWCXmLnI61ZuEmNjOGlM=;
 b=dRJ+l6XpRgVZ4SGm3xqscbkeyawISNoJSWJ3FxgknsAFO/xjg5Ff6wufSXhHrrrcMS
 v3LIa7arEbiXbP7hcEPl02/UDS/fnvMd0V1C609WcTQtmVEWzE+Ruw2+3EdOQsrnNENF
 AVALFX74p6jdtytOa9FAdI5AZBMQ6T0I5bx2UKjFvqJT+4FEirmiFyEBMWdpyZp9yAFG
 dI+8spb2Zz583vd+qCOdyx7eqdrS7R2N0EoDhtjjBTcbmEZgq0vK3Kh/3j15LqjHPcmX
 KeICJHFC0kRcZCbb1dSHHEIj8cN0YDtwkz/oD+Lu3gJjFrCZbMm+56TQQXVMaecSzCGc
 Ekeg==
X-Gm-Message-State: AOAM533KGPl1sg8eDBpx25G28gkyFmsIFPEGZFr9ilEk9E8NzR9ee5tC
 Zopxw+5Ta3kF12hqbpiBh4aUanivt2Dbkg==
X-Google-Smtp-Source: ABdhPJybn6y2gQSULSVsv1OrsCCTXzBd/a+tOJs0XPHiYTRigflHHmdt+wnotStNMNz9YAIn6gMVcg==
X-Received: by 2002:adf:f182:: with SMTP id h2mr5997610wro.355.1612544429075; 
 Fri, 05 Feb 2021 09:00:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/24] hw/arm/mps2-tz: Make number of IRQs board-specific
Date: Fri,  5 Feb 2021 17:00:04 +0000
Message-Id: <20210205170019.25319-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AN524 has more interrupt lines than the AN505 and AN521; make
numirq board-specific rather than a compile-time constant.

Since the difference is small (92 on the current boards and 95 on the
new one) we don't dynamically allocate the cpu_irq_splitter[] array
but leave it as a fixed length array whose size is the maximum needed
for any of the boards.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 4d8e42fa6b6..0f021676854 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -65,7 +65,7 @@
 #include "hw/qdev-clock.h"
 #include "qom/object.h"
 
-#define MPS2TZ_NUMIRQ 92
+#define MPS2TZ_NUMIRQ_MAX 92
 
 typedef enum MPS2TZFPGAType {
     FPGA_AN505,
@@ -81,6 +81,7 @@ struct MPS2TZMachineClass {
     const uint32_t *oscclk;
     uint32_t fpgaio_num_leds; /* Number of LEDs in FPGAIO LED0 register */
     bool fpgaio_switches; /* Does FPGAIO have SWITCH register? */
+    int numirq; /* Number of external interrupts */
     const char *armsse_type;
 };
 
@@ -105,7 +106,7 @@ struct MPS2TZMachineState {
     SplitIRQ sec_resp_splitter;
     qemu_or_irq uart_irq_orgate;
     DeviceState *lan9118;
-    SplitIRQ cpu_irq_splitter[MPS2TZ_NUMIRQ];
+    SplitIRQ cpu_irq_splitter[MPS2TZ_NUMIRQ_MAX];
     Clock *sysclk;
     Clock *s32kclk;
 };
@@ -140,8 +141,9 @@ static qemu_irq get_sse_irq_in(MPS2TZMachineState *mms, int irqno)
 {
     /* Return a qemu_irq which will signal IRQ n to all CPUs in the SSE. */
     MachineClass *mc = MACHINE_GET_CLASS(mms);
+    MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
 
-    assert(irqno < MPS2TZ_NUMIRQ);
+    assert(irqno < mmc->numirq);
 
     if (mc->max_cpus > 1) {
         return qdev_get_gpio_in(DEVICE(&mms->cpu_irq_splitter[irqno]), 0);
@@ -428,7 +430,7 @@ static void mps2tz_common_init(MachineState *machine)
     iotkitdev = DEVICE(&mms->iotkit);
     object_property_set_link(OBJECT(&mms->iotkit), "memory",
                              OBJECT(system_memory), &error_abort);
-    qdev_prop_set_uint32(iotkitdev, "EXP_NUMIRQ", MPS2TZ_NUMIRQ);
+    qdev_prop_set_uint32(iotkitdev, "EXP_NUMIRQ", mmc->numirq);
     qdev_connect_clock_in(iotkitdev, "MAINCLK", mms->sysclk);
     qdev_connect_clock_in(iotkitdev, "S32KCLK", mms->s32kclk);
     sysbus_realize(SYS_BUS_DEVICE(&mms->iotkit), &error_fatal);
@@ -439,8 +441,9 @@ static void mps2tz_common_init(MachineState *machine)
      * board. If there is only one CPU, we can just wire the device IRQ
      * directly to the SSE's IRQ input.
      */
+    assert(mmc->numirq <= MPS2TZ_NUMIRQ_MAX);
     if (mc->max_cpus > 1) {
-        for (i = 0; i < MPS2TZ_NUMIRQ; i++) {
+        for (i = 0; i < mmc->numirq; i++) {
             char *name = g_strdup_printf("mps2-irq-splitter%d", i);
             SplitIRQ *splitter = &mms->cpu_irq_splitter[i];
 
@@ -693,6 +696,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mmc->len_oscclk = ARRAY_SIZE(an505_oscclk);
     mmc->fpgaio_num_leds = 2;
     mmc->fpgaio_switches = false;
+    mmc->numirq = 92;
     mmc->armsse_type = TYPE_IOTKIT;
 }
 
@@ -713,6 +717,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mmc->len_oscclk = ARRAY_SIZE(an505_oscclk);
     mmc->fpgaio_num_leds = 2;
     mmc->fpgaio_switches = false;
+    mmc->numirq = 92;
     mmc->armsse_type = TYPE_SSE200;
 }
 
-- 
2.20.1


