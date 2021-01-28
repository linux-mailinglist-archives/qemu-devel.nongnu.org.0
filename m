Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6A0307546
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 12:56:03 +0100 (CET)
Received: from localhost ([::1]:45708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l55u6-0002ci-PR
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 06:56:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gY-0001Ga-Ox
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:02 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gS-000670-OK
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:02 -0500
Received: by mail-wr1-x434.google.com with SMTP id a1so5074678wrq.6
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 03:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PcyyQtxEfK2y+OFK30UnD/QXT/ftSlQorAj3S+Fk7FE=;
 b=qfN5rLMp4qA3iy1d2aPpnmztm8v/X2d7qe0H9nmWjWPmXeY6rZ5J6m7V0wdSbr69ZK
 w3pRDzS4IEulRYFOV5aaHoV6e8n4SfzlH4Kvjl+qLoUO4ED80DQjGWc5dD6O3UMSEMta
 zYXYTuZxkNEayxxyHDdk+hGrB6QWXV4FM777Z2C6h/Of3wAIt0KZmuBlZSQNPrXehXgv
 kPqL3h9HaSU+qX5O6Jd0+hMzUD+S/ka66XS/qtJk/rap2Z21uNUF+3ObpBcp0O5SuzV/
 QYIV5jr6quUqfqQZh93bnpNT4T8Bjsdt2i1s26j81bklMvb1VkfOezBNdKb7QNwXD0MW
 Gy1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PcyyQtxEfK2y+OFK30UnD/QXT/ftSlQorAj3S+Fk7FE=;
 b=KBHjY8lodkzOx62w9vj/ab8Cmz5TZ/B+0HoPSCGo9EPrft0GEoVk63i0oRF62ZgzP+
 L4LUSFWieFL3VH+aGWbvkEhULUdZ7gE9AxmQhZnqUmHYRxyCTcFwG/5BKoR/dwuAyq7R
 euQawy7Ua4qz/twxheLfhNWosKBJxOin4yn4kUdlt/1BbW+RA1ho7WIOY6rfSVPZmt4z
 mXWB6Hlthb3t7rRkAJFgInk7bxmBr/eleUc0UdeSo+Ex1oPjm8OFcUFMj3ESVOoraA4Y
 uR88as3c9OVPhoJvZnur/uv4Byc7sQS/m9wC2ylwVUNZpCgXtwF5S36+VOXDHwYUbyEJ
 /siA==
X-Gm-Message-State: AOAM533QTq6nE7NAONmzk4SySYX8lN7cmC/eiGltuBCY7KbfSRTfj7q7
 ZJtpfU+253ukHSSsxW/sp/hxTponV6hizQ==
X-Google-Smtp-Source: ABdhPJyzWrhXtESTCx/GsjTzMbiCF3IxgSKg4RnIh5De6ekw4KRLvk+jsOqlVEWYx6+VPbWqflOU/w==
X-Received: by 2002:a5d:4402:: with SMTP id z2mr15796220wrq.265.1611834115157; 
 Thu, 28 Jan 2021 03:41:55 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:41:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 07/25] hw/timer/cmsdk-apb-timer: Add Clock input
Date: Thu, 28 Jan 2021 11:41:27 +0000
Message-Id: <20210128114145.20536-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As the first step in converting the CMSDK_APB_TIMER device to the
Clock framework, add a Clock input.  For the moment we do nothing
with this clock; we will change the behaviour from using the pclk-frq
property to using the Clock once all the users of this device have
been converted to wire up the Clock.

Since the device doesn't already have a doc comment for its "QEMU
interface", we add one including the new Clock.

This is a migration compatibility break for machines mps2-an505,
mps2-an521, musca-a, musca-b1.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210121190622.22000-8-peter.maydell@linaro.org
---
 include/hw/timer/cmsdk-apb-timer.h | 9 +++++++++
 hw/timer/cmsdk-apb-timer.c         | 7 +++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/hw/timer/cmsdk-apb-timer.h b/include/hw/timer/cmsdk-apb-timer.h
index baa009bb2da..fc2aa97acac 100644
--- a/include/hw/timer/cmsdk-apb-timer.h
+++ b/include/hw/timer/cmsdk-apb-timer.h
@@ -15,11 +15,19 @@
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "hw/ptimer.h"
+#include "hw/clock.h"
 #include "qom/object.h"
 
 #define TYPE_CMSDK_APB_TIMER "cmsdk-apb-timer"
 OBJECT_DECLARE_SIMPLE_TYPE(CMSDKAPBTimer, CMSDK_APB_TIMER)
 
+/*
+ * QEMU interface:
+ *  + QOM property "pclk-frq": frequency at which the timer is clocked
+ *  + Clock input "pclk": clock for the timer
+ *  + sysbus MMIO region 0: the register bank
+ *  + sysbus IRQ 0: timer interrupt TIMERINT
+ */
 struct CMSDKAPBTimer {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -29,6 +37,7 @@ struct CMSDKAPBTimer {
     qemu_irq timerint;
     uint32_t pclk_frq;
     struct ptimer_state *timer;
+    Clock *pclk;
 
     uint32_t ctrl;
     uint32_t value;
diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
index ae9c5422540..c63145ff553 100644
--- a/hw/timer/cmsdk-apb-timer.c
+++ b/hw/timer/cmsdk-apb-timer.c
@@ -35,6 +35,7 @@
 #include "hw/sysbus.h"
 #include "hw/irq.h"
 #include "hw/registerfields.h"
+#include "hw/qdev-clock.h"
 #include "hw/timer/cmsdk-apb-timer.h"
 #include "migration/vmstate.h"
 
@@ -212,6 +213,7 @@ static void cmsdk_apb_timer_init(Object *obj)
                           s, "cmsdk-apb-timer", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->timerint);
+    s->pclk = qdev_init_clock_in(DEVICE(s), "pclk", NULL, NULL);
 }
 
 static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
@@ -236,10 +238,11 @@ static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
 
 static const VMStateDescription cmsdk_apb_timer_vmstate = {
     .name = "cmsdk-apb-timer",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = (VMStateField[]) {
         VMSTATE_PTIMER(timer, CMSDKAPBTimer),
+        VMSTATE_CLOCK(pclk, CMSDKAPBTimer),
         VMSTATE_UINT32(ctrl, CMSDKAPBTimer),
         VMSTATE_UINT32(value, CMSDKAPBTimer),
         VMSTATE_UINT32(reload, CMSDKAPBTimer),
-- 
2.20.1


