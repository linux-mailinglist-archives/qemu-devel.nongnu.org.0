Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4449C307516
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 12:47:03 +0100 (CET)
Received: from localhost ([::1]:43860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l55lO-0006zn-AL
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 06:47:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gZ-0001J9-NB
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:03 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:38292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gT-00067E-Bl
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:03 -0500
Received: by mail-wm1-x334.google.com with SMTP id y187so4304601wmd.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 03:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DQapdna4q5KlhOpBjPWEEiHjmFts8BaZpTCE2Nvje2w=;
 b=Re6LUPLB6mXxlIJY7EOZB4deXKydxYivQHETHT+KwrFHNlkjJcDeX4EkUjulfdq1MP
 4lYm1cNjb+5c8BLaEiNiOIXgG/LhzVg/M42F+lVADyOHgJ9kQTEsopmC7/6/NCc3zl0s
 H9xBfzWyHeH47NK4ElU3IzvECE9WzhCP4nyb/7+JnZ2MH4Jd7GWX/7DDuPIcvzg3cF5n
 D5z+1ioZRNm3RBCo/LQcsnmJsuulL/OoPnKLLQVe/Ipmwv/7fruSfBsNsW9J1qOWMYZ8
 ySrdBiTRTTx54mv91DdRaW/buj67rd36vdyr2p9EX6Z23MAUzUUNeKsYwZWfJVJcE/nm
 xIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DQapdna4q5KlhOpBjPWEEiHjmFts8BaZpTCE2Nvje2w=;
 b=HPWxC4a3333BRqZyBjhSS8DwC45Wsd4hi4gzCYHgmNXjYcFaUe1tNi3EFJgwhJrFM5
 /zAVDz7etTIOfKSrMsimrxCWQ8PsJW60fDO/adq+/GyHs6t/dN4BkIC6gO6842cxIQ74
 DWHrTZNMllV69qUPFAegEQd+JvwFzW1zp2i4UezBO5a7L3PfWmwg2JWl1dPlk9NrKMys
 tcgOWm6yvV6nlNqfnk1xkkCWMyKPZPKfH/OYnRej1FXLZ4RT7qMsRG95m6oUYa0Z+Rjw
 4XQ8QUWLou8tMwVFL+qoa6PVo+uWuaRRLyszLe+n8TBIymapewztoSKAVtIU+9JH3XuV
 bIiw==
X-Gm-Message-State: AOAM532kXWkFwSXVJ9fQDD2OFDVFnCoxvrUTxUJMRTyVaVT4ruWxl+qC
 dS1geJXt/kFPP08JJFk/UENWDg==
X-Google-Smtp-Source: ABdhPJy+UakbaagTegmJZqzH8mmEedz2zys1giJqtfrB7gXXSwZpYiJdVaC5JLdGYp1ZSzfCjzSzrA==
X-Received: by 2002:a1c:df08:: with SMTP id w8mr8100524wmg.81.1611834116136;
 Thu, 28 Jan 2021 03:41:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:41:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 08/25] hw/timer/cmsdk-apb-dualtimer: Add Clock input
Date: Thu, 28 Jan 2021 11:41:28 +0000
Message-Id: <20210128114145.20536-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As the first step in converting the CMSDK_APB_DUALTIMER device to the
Clock framework, add a Clock input.  For the moment we do nothing
with this clock; we will change the behaviour from using the pclk-frq
property to using the Clock once all the users of this device have
been converted to wire up the Clock.

We take the opportunity to correct the name of the clock input to
match the hardware -- the dual timer names the clock which drives the
timers TIMCLK.  (It does also have a 'pclk' input, which is used only
for the register and APB bus logic; on the SSE-200 these clocks are
both connected together.)

This is a migration compatibility break for machines mps2-an385,
mps2-an386, mps2-an500, mps2-an511, mps2-an505, mps2-an521, musca-a,
musca-b1.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210121190622.22000-9-peter.maydell@linaro.org
---
 include/hw/timer/cmsdk-apb-dualtimer.h | 3 +++
 hw/timer/cmsdk-apb-dualtimer.c         | 7 +++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/hw/timer/cmsdk-apb-dualtimer.h b/include/hw/timer/cmsdk-apb-dualtimer.h
index 08d9e6fa3d5..3adbb01dd34 100644
--- a/include/hw/timer/cmsdk-apb-dualtimer.h
+++ b/include/hw/timer/cmsdk-apb-dualtimer.h
@@ -17,6 +17,7 @@
  *
  * QEMU interface:
  *  + QOM property "pclk-frq": frequency at which the timer is clocked
+ *  + Clock input "TIMCLK": clock (for both timers)
  *  + sysbus MMIO region 0: the register bank
  *  + sysbus IRQ 0: combined timer interrupt TIMINTC
  *  + sysbus IRO 1: timer block 1 interrupt TIMINT1
@@ -28,6 +29,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/ptimer.h"
+#include "hw/clock.h"
 #include "qom/object.h"
 
 #define TYPE_CMSDK_APB_DUALTIMER "cmsdk-apb-dualtimer"
@@ -62,6 +64,7 @@ struct CMSDKAPBDualTimer {
     MemoryRegion iomem;
     qemu_irq timerintc;
     uint32_t pclk_frq;
+    Clock *timclk;
 
     CMSDKAPBDualTimerModule timermod[CMSDK_APB_DUALTIMER_NUM_MODULES];
     uint32_t timeritcr;
diff --git a/hw/timer/cmsdk-apb-dualtimer.c b/hw/timer/cmsdk-apb-dualtimer.c
index f6534241b94..781b496037b 100644
--- a/hw/timer/cmsdk-apb-dualtimer.c
+++ b/hw/timer/cmsdk-apb-dualtimer.c
@@ -25,6 +25,7 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/registerfields.h"
+#include "hw/qdev-clock.h"
 #include "hw/timer/cmsdk-apb-dualtimer.h"
 #include "migration/vmstate.h"
 
@@ -445,6 +446,7 @@ static void cmsdk_apb_dualtimer_init(Object *obj)
     for (i = 0; i < ARRAY_SIZE(s->timermod); i++) {
         sysbus_init_irq(sbd, &s->timermod[i].timerint);
     }
+    s->timclk = qdev_init_clock_in(DEVICE(s), "TIMCLK", NULL, NULL);
 }
 
 static void cmsdk_apb_dualtimer_realize(DeviceState *dev, Error **errp)
@@ -485,9 +487,10 @@ static const VMStateDescription cmsdk_dualtimermod_vmstate = {
 
 static const VMStateDescription cmsdk_apb_dualtimer_vmstate = {
     .name = "cmsdk-apb-dualtimer",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = (VMStateField[]) {
+        VMSTATE_CLOCK(timclk, CMSDKAPBDualTimer),
         VMSTATE_STRUCT_ARRAY(timermod, CMSDKAPBDualTimer,
                              CMSDK_APB_DUALTIMER_NUM_MODULES,
                              1, cmsdk_dualtimermod_vmstate,
-- 
2.20.1


