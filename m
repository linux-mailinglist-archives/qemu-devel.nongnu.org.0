Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9142FF3DB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:11:01 +0100 (CET)
Received: from localhost ([::1]:36606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fMC-0005kF-VC
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:11:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fIE-0002IU-T5
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:06:56 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fI0-0005oX-1i
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:06:53 -0500
Received: by mail-wr1-x434.google.com with SMTP id a12so2816392wrv.8
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H+D/Gt7JsF9hn1kRelKr/4gM1Ewyi0uJ0hZ0lBf0vAM=;
 b=u/LvHBnQzZEe8w8M/W6QpoL4pX8rxzdR7/8jMb2FIn0Vhh+UuayocOGuvRt8zMK+O+
 koDEMcOrMS0lZ4gnfbvvXJErp0/i/NtYB0eu1h5KHzglCJfoSW60VkUZMk4NlWTGRp16
 +OsXoDhxSTRVX+ZLZjFxinzhZt+QNuViCTvh1kIcSpe6I5SwqGJja77g9GNYKCe5YBZS
 xTO8YuRZ/QdcUA6u1UHDbl6v1dU/LWAdUQmWEsuwcXBUi8frIlN5S7dfBin/Zn1+FsqE
 pUra+PE4l/5h8V2OhRfc2SDWQaYDI6DpnOiIn9cM0yz5SlEqEbDRJkQ2jHEVQNqKZp6d
 aZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H+D/Gt7JsF9hn1kRelKr/4gM1Ewyi0uJ0hZ0lBf0vAM=;
 b=CDNlSZh548jB1FB63zrV+XNSxHcUHjF/7gZPXBMe8oyZew6hYiErssggEJccqDOWw5
 T/RwSq5LFReHzy8AOwhc0D3PpeDqgl1ROndPFE8zPWzX0/BePzsFrBErT1QCRmf50swn
 ot3Yw/tQtbeaJ3zOVt9nYJ9vsE5CEC9D3zClkNet094tTaO0ST74V8n7JzWjjrIybjh4
 9RrYSC0ZSD4lNQ4xOGf/o2VCmmWrVA3/AaUgX197cTsFO7NN11KZdmju0gvu57DLcGgI
 mPq19VKB3LlvXOXWIhEMStxy2q8vBZ5fBvfpcSXiTstPREvtJrxvhHGyoqE+seqKGt3h
 +YbQ==
X-Gm-Message-State: AOAM532o38yR5hesteCowENGTJYCIuoDvRSWGy/3zlg+wy1aCIBJfk/4
 RKPDKSpOKgO8Bgfy1CVHZ32aFw==
X-Google-Smtp-Source: ABdhPJzJvrDMu+NAjev6D3ygcCTfhQ+CM2U/fSsab161YWgjA9tfI7e2m7CTTtO9snOu+GyHi5iy+w==
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr896028wrw.386.1611255994104; 
 Thu, 21 Jan 2021 11:06:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/25] hw/watchdog/cmsdk-apb-watchdog: Add Clock input
Date: Thu, 21 Jan 2021 19:06:06 +0000
Message-Id: <20210121190622.22000-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121190622.22000-1-peter.maydell@linaro.org>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As the first step in converting the CMSDK_APB_TIMER device to the
Clock framework, add a Clock input.  For the moment we do nothing
with this clock; we will change the behaviour from using the
wdogclk-frq property to using the Clock once all the users of this
device have been converted to wire up the Clock.

This is a migration compatibility break for machines mps2-an385,
mps2-an386, mps2-an500, mps2-an511, mps2-an505, mps2-an521, musca-a,
musca-b1, lm3s811evb, lm3s6965evb.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/watchdog/cmsdk-apb-watchdog.h | 3 +++
 hw/watchdog/cmsdk-apb-watchdog.c         | 7 +++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/hw/watchdog/cmsdk-apb-watchdog.h b/include/hw/watchdog/cmsdk-apb-watchdog.h
index 3da0d43e355..34069ca6969 100644
--- a/include/hw/watchdog/cmsdk-apb-watchdog.h
+++ b/include/hw/watchdog/cmsdk-apb-watchdog.h
@@ -17,6 +17,7 @@
  *
  * QEMU interface:
  *  + QOM property "wdogclk-frq": frequency at which the watchdog is clocked
+ *  + Clock input "WDOGCLK": clock for the watchdog's timer
  *  + sysbus MMIO region 0: the register bank
  *  + sysbus IRQ 0: watchdog interrupt
  *
@@ -33,6 +34,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/ptimer.h"
+#include "hw/clock.h"
 #include "qom/object.h"
 
 #define TYPE_CMSDK_APB_WATCHDOG "cmsdk-apb-watchdog"
@@ -54,6 +56,7 @@ struct CMSDKAPBWatchdog {
     uint32_t wdogclk_frq;
     bool is_luminary;
     struct ptimer_state *timer;
+    Clock *wdogclk;
 
     uint32_t control;
     uint32_t intstatus;
diff --git a/hw/watchdog/cmsdk-apb-watchdog.c b/hw/watchdog/cmsdk-apb-watchdog.c
index 5bbadadfa68..b03bcb73628 100644
--- a/hw/watchdog/cmsdk-apb-watchdog.c
+++ b/hw/watchdog/cmsdk-apb-watchdog.c
@@ -30,6 +30,7 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/registerfields.h"
+#include "hw/qdev-clock.h"
 #include "hw/watchdog/cmsdk-apb-watchdog.h"
 #include "migration/vmstate.h"
 
@@ -318,6 +319,7 @@ static void cmsdk_apb_watchdog_init(Object *obj)
                           s, "cmsdk-apb-watchdog", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->wdogint);
+    s->wdogclk = qdev_init_clock_in(DEVICE(s), "WDOGCLK", NULL, NULL);
 
     s->is_luminary = false;
     s->id = cmsdk_apb_watchdog_id;
@@ -346,9 +348,10 @@ static void cmsdk_apb_watchdog_realize(DeviceState *dev, Error **errp)
 
 static const VMStateDescription cmsdk_apb_watchdog_vmstate = {
     .name = "cmsdk-apb-watchdog",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = (VMStateField[]) {
+        VMSTATE_CLOCK(wdogclk, CMSDKAPBWatchdog),
         VMSTATE_PTIMER(timer, CMSDKAPBWatchdog),
         VMSTATE_UINT32(control, CMSDKAPBWatchdog),
         VMSTATE_UINT32(intstatus, CMSDKAPBWatchdog),
-- 
2.20.1


