Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB6B308837
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:24:43 +0100 (CET)
Received: from localhost ([::1]:51868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5RtK-0002gi-SR
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWH-0004uT-62
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:53 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RW7-000751-I5
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:52 -0500
Received: by mail-wr1-x42f.google.com with SMTP id z6so8340148wrq.10
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1/VLL2mug+Bt4J4qlQhtUAEkhvzQUTluOBjM1WE/fMk=;
 b=qYmO57PWqDaJ0nA9Hr0QowGOge/4csOsx9QaYP1QhuEv38iAdqu9Efa8UYzaXQopgZ
 c+xCAvd6KVkTaD2MyYD/E9Ydd/YzkvRwRM8xY8RTfNc6hk4zV9Xsdsk6l3mbnscLJIRg
 itXvlTNzpE1zPdVvkqyf3d9z847lt487WxPZvTt4wHC7Xxxv2my6nJFoqr2B53JP2vAZ
 +muMJXkzm1W8mGmo8c2SlYM+aJVU0CmD5cmEiOyLB8O+kTYizrNbC3hjeh0ez5itp6zo
 UMNyhS6xIdPm9dYdjUSuYZXb19oPto8wIgsul/E8QJ1O+5BK43xt/vZd63YZUsjvD8tC
 AaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1/VLL2mug+Bt4J4qlQhtUAEkhvzQUTluOBjM1WE/fMk=;
 b=e1IsbGEf8WHm4Y+dyeIr9NCo5WGZC8npN6UolNHoHEfUOBXL/2J/juZwMoVwT3Njb7
 1wtAqRkgVeZ8QetDEW8htSmLKIa9oh5eQQhP3PEikfmv1w8UDr72VxezCOTFG99pV6pd
 /dL+lzatS7sjI/vyIGtR0Tb2kGvy69gjfo9UOIMPMpifkzaKBpmGLZE+wqYGgcR0n1gG
 WyW9huVqG/g2FO7Jb1gAg/rdUV0KAzs9pC9voLOl2mkehE4Z8X4/5bf4u1qcq87/Ac/R
 vHVN4+F143AeiSOPj83OUo65zTBX1H6e88m4HxLE2458eOCL1HonozSpf3sPfWH0jybv
 VuEQ==
X-Gm-Message-State: AOAM5309od8Lw9oN+K2iibCAKOqtu5LJxg/2Ue3eN11C5UOZqtytF2WO
 hiPpRIuSTtKbSy18lWacUTbCKpzMNUzcUg==
X-Google-Smtp-Source: ABdhPJxg8k9c07XN6s4OQEr0urUjDhDVI50vx7QmIzbBMY/iTdJLkWuuUfhvQIdxAdXViMUZVyBFZA==
X-Received: by 2002:a5d:6189:: with SMTP id j9mr3854286wru.256.1611918042160; 
 Fri, 29 Jan 2021 03:00:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/46] hw/watchdog/cmsdk-apb-watchdog: Add Clock input
Date: Fri, 29 Jan 2021 10:59:56 +0000
Message-Id: <20210129110012.8660-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

As the first step in converting the CMSDK_APB_TIMER device to the
Clock framework, add a Clock input.  For the moment we do nothing
with this clock; we will change the behaviour from using the
wdogclk-frq property to using the Clock once all the users of this
device have been converted to wire up the Clock.

This is a migration compatibility break for machines mps2-an385,
mps2-an386, mps2-an500, mps2-an511, mps2-an505, mps2-an521, musca-a,
musca-b1, lm3s811evb, lm3s6965evb.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210128114145.20536-10-peter.maydell@linaro.org
Message-id: 20210121190622.22000-10-peter.maydell@linaro.org
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


