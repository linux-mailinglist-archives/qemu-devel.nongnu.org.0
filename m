Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 822113315BD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:19:12 +0100 (CET)
Received: from localhost ([::1]:46886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKTH-0006qQ-Gd
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJlA-0007CX-16
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:36 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkq-000788-NK
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:35 -0500
Received: by mail-wr1-x436.google.com with SMTP id j2so12316129wrx.9
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=isA+xDxTPHaC4bWeYk3oUlNAA9jCo2clgs97raTOEG4=;
 b=V3RYsBwX6ZfJhqk/f+gi6NNAiCHHPnRnjM1RUlexuBb47qo1Qn9ogmnTfzzIGgQ31V
 i5uLNGTsgwtoPbuztBO4Piiwqs0qp7GRydny8vn/P3xq9gDDzXeHAIDXRy48UtavAka0
 aHw9pvR7UO76dKyM9NCYPPCtVqeeNUidungwErSrBwgpjgI9kXxW650Wi+LuCBkKb+Df
 yTDaLBA3qQIEqWiGoviQtXs2IkCF4ydt72du6W2r3bD0JhcF52RLOVzol5iR8eE6lcib
 GtBBVI/k9TgYRq4CvFlbvHmIDMx3evowWzEDmf0f2pr9azt3LEMaYUpksjCSTvlGVTcF
 SC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=isA+xDxTPHaC4bWeYk3oUlNAA9jCo2clgs97raTOEG4=;
 b=HDig+KW+VngYRm9C7kTG0VWlem0wHA2aHwS4Q+WX4gErfXPK6eGdOwy2au5dHbHzB6
 W6o6QjuWM55EipB0/IAX+BjJwy3qymTdoi2TJmivuPTyh0C/cGkLZ0GA5iRexBnYMlZX
 SH++s0xlQgvSoMJfK1sWvfOqA+LqtlO/9tv6+VUMu9Z7c44LlWyaPLKcGNTh+SjRExH7
 vpetGjf+svhQOZcYsiljm6sfEVEvHWORIiPZzoCFbT+i1jDGzS5U/CFo6+/eLDvO74mb
 uLk+r6wjjeEpfFlXCULvEzJteQxxtzfDC8GFtc0vqNguiBmsynXi+PhIy7BeasFVklGh
 yHVQ==
X-Gm-Message-State: AOAM533rHy2IMOoCABnF8mTcK2aNDi3nIYy0ccbm1Zh5cudsFhNuus/L
 9koer2Im+lJXAWHpukCrU4DVmjuWB9CF1w==
X-Google-Smtp-Source: ABdhPJwT/9aQMFtJs+bea55uSR22g4PeR62cgx2FW1ydwS4oJTjxVHNxxW5uRqTg+omL9Dh2QlwK9Q==
X-Received: by 2002:adf:fa08:: with SMTP id m8mr24392182wrr.12.1615224794658; 
 Mon, 08 Mar 2021 09:33:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/54] hw/misc/mps2-fpgaio: Support AN547 DBGCTRL register
Date: Mon,  8 Mar 2021 17:32:28 +0000
Message-Id: <20210308173244.20710-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the AN547 image, the FPGAIO block has an extra DBGCTRL register,
which is used to control the SPNIDEN, SPIDEN, NPIDEN and DBGEN inputs
to the CPU.  These signals control when the CPU permits use of the
external debug interface.  Our CPU models don't implement the
external debug interface, so we model the register as
reads-as-written.

Implement the register, with a property defining whether it is
present, and allow mps2-tz boards to specify that it is present.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-39-peter.maydell@linaro.org
---
 include/hw/misc/mps2-fpgaio.h |  2 ++
 hw/arm/mps2-tz.c              |  5 +++++
 hw/misc/mps2-fpgaio.c         | 22 ++++++++++++++++++++--
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/include/hw/misc/mps2-fpgaio.h b/include/hw/misc/mps2-fpgaio.h
index e04fd590b63..7b8bd604de0 100644
--- a/include/hw/misc/mps2-fpgaio.h
+++ b/include/hw/misc/mps2-fpgaio.h
@@ -39,10 +39,12 @@ struct MPS2FPGAIO {
     LEDState *led[MPS2FPGAIO_MAX_LEDS];
     uint32_t num_leds;
     bool has_switches;
+    bool has_dbgctrl;
 
     uint32_t led0;
     uint32_t prescale;
     uint32_t misc;
+    uint32_t dbgctrl;
 
     /* QEMU_CLOCK_VIRTUAL time at which counter and pscntr were last synced */
     int64_t pscntr_sync_ticks;
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 85e80c4d726..79a076ce693 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -110,6 +110,7 @@ struct MPS2TZMachineClass {
     const uint32_t *oscclk;
     uint32_t fpgaio_num_leds; /* Number of LEDs in FPGAIO LED0 register */
     bool fpgaio_has_switches; /* Does FPGAIO have SWITCH register? */
+    bool fpgaio_has_dbgctrl; /* Does FPGAIO have DBGCTRL register? */
     int numirq; /* Number of external interrupts */
     int uart_overflow_irq; /* number of the combined UART overflow IRQ */
     const RAMInfo *raminfo;
@@ -422,6 +423,7 @@ static MemoryRegion *make_fpgaio(MPS2TZMachineState *mms, void *opaque,
     object_initialize_child(OBJECT(mms), "fpgaio", fpgaio, TYPE_MPS2_FPGAIO);
     qdev_prop_set_uint32(DEVICE(fpgaio), "num-leds", mmc->fpgaio_num_leds);
     qdev_prop_set_bit(DEVICE(fpgaio), "has-switches", mmc->fpgaio_has_switches);
+    qdev_prop_set_bit(DEVICE(fpgaio), "has-dbgctrl", mmc->fpgaio_has_dbgctrl);
     sysbus_realize(SYS_BUS_DEVICE(fpgaio), &error_fatal);
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(fpgaio), 0);
 }
@@ -1046,6 +1048,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mmc->len_oscclk = ARRAY_SIZE(an505_oscclk);
     mmc->fpgaio_num_leds = 2;
     mmc->fpgaio_has_switches = false;
+    mmc->fpgaio_has_dbgctrl = false;
     mmc->numirq = 92;
     mmc->uart_overflow_irq = 47;
     mmc->raminfo = an505_raminfo;
@@ -1070,6 +1073,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mmc->len_oscclk = ARRAY_SIZE(an505_oscclk);
     mmc->fpgaio_num_leds = 2;
     mmc->fpgaio_has_switches = false;
+    mmc->fpgaio_has_dbgctrl = false;
     mmc->numirq = 92;
     mmc->uart_overflow_irq = 47;
     mmc->raminfo = an505_raminfo; /* AN521 is the same as AN505 here */
@@ -1094,6 +1098,7 @@ static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
     mmc->len_oscclk = ARRAY_SIZE(an524_oscclk);
     mmc->fpgaio_num_leds = 10;
     mmc->fpgaio_has_switches = true;
+    mmc->fpgaio_has_dbgctrl = false;
     mmc->numirq = 95;
     mmc->uart_overflow_irq = 47;
     mmc->raminfo = an524_raminfo;
diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
index 72598c8a3d2..07b8cbdad28 100644
--- a/hw/misc/mps2-fpgaio.c
+++ b/hw/misc/mps2-fpgaio.c
@@ -29,6 +29,7 @@
 #include "qemu/timer.h"
 
 REG32(LED0, 0)
+REG32(DBGCTRL, 4)
 REG32(BUTTON, 8)
 REG32(CLK1HZ, 0x10)
 REG32(CLK100HZ, 0x14)
@@ -129,6 +130,12 @@ static uint64_t mps2_fpgaio_read(void *opaque, hwaddr offset, unsigned size)
     case A_LED0:
         r = s->led0;
         break;
+    case A_DBGCTRL:
+        if (!s->has_dbgctrl) {
+            goto bad_offset;
+        }
+        r = s->dbgctrl;
+        break;
     case A_BUTTON:
         /* User-pressable board buttons. We don't model that, so just return
          * zeroes.
@@ -195,6 +202,14 @@ static void mps2_fpgaio_write(void *opaque, hwaddr offset, uint64_t value,
             }
         }
         break;
+    case A_DBGCTRL:
+        if (!s->has_dbgctrl) {
+            goto bad_offset;
+        }
+        qemu_log_mask(LOG_UNIMP,
+                      "MPS2 FPGAIO: DBGCTRL unimplemented\n");
+        s->dbgctrl = value;
+        break;
     case A_PRESCALE:
         resync_counter(s);
         s->prescale = value;
@@ -225,6 +240,7 @@ static void mps2_fpgaio_write(void *opaque, hwaddr offset, uint64_t value,
         s->pscntr = value;
         break;
     default:
+    bad_offset:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "MPS2 FPGAIO write: bad offset 0x%x\n", (int) offset);
         break;
@@ -287,12 +303,13 @@ static void mps2_fpgaio_realize(DeviceState *dev, Error **errp)
 
 static const VMStateDescription mps2_fpgaio_vmstate = {
     .name = "mps2-fpgaio",
-    .version_id = 2,
-    .minimum_version_id = 2,
+    .version_id = 3,
+    .minimum_version_id = 3,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(led0, MPS2FPGAIO),
         VMSTATE_UINT32(prescale, MPS2FPGAIO),
         VMSTATE_UINT32(misc, MPS2FPGAIO),
+        VMSTATE_UINT32(dbgctrl, MPS2FPGAIO),
         VMSTATE_INT64(clk1hz_tick_offset, MPS2FPGAIO),
         VMSTATE_INT64(clk100hz_tick_offset, MPS2FPGAIO),
         VMSTATE_UINT32(counter, MPS2FPGAIO),
@@ -308,6 +325,7 @@ static Property mps2_fpgaio_properties[] = {
     /* Number of LEDs controlled by LED0 register */
     DEFINE_PROP_UINT32("num-leds", MPS2FPGAIO, num_leds, 2),
     DEFINE_PROP_BOOL("has-switches", MPS2FPGAIO, has_switches, false),
+    DEFINE_PROP_BOOL("has-dbgctrl", MPS2FPGAIO, has_dbgctrl, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.20.1


