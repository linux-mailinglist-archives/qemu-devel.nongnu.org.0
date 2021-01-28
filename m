Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D6E307538
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 12:54:07 +0100 (CET)
Received: from localhost ([::1]:40904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l55sF-0000bd-0b
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 06:54:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gX-0001EO-SX
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:01 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gS-00066n-2s
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:01 -0500
Received: by mail-wr1-x433.google.com with SMTP id c12so5055136wrc.7
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 03:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4+oOsbOZCzGymS/pjG8axPSCcjrYv7uWaDnLd5easic=;
 b=RoogCL2v/x29BC0v2NyOztnq84tKwXC7eP9CHyXsYMvelN/RrXCxWNy2sSgtugzp0G
 19BSqFE/oKy4CQFlobbXJ2LwoYY/But93FnVH+gEA5Ii7DvzzgBq4m7sblzcVnowNEul
 X5L638WTTA9FnPTAd4daRLsVUbnVLcVuB4HSDyF4ZO7PnYgU3AuxNqCGrlgJEqqqzmgS
 8iybR9dxaFVFHqITjEWOLPoYkfV0cO7UNi8aAl8Uqf/ceXlGJoBk7tySn3SRPrsA/44H
 072rB5pcx9bY8c6MpQ2sw2vVlZ2Or4/AwOmg8/SJNaXZ2bqI+1umTELfMiyM+8fee7xB
 x//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4+oOsbOZCzGymS/pjG8axPSCcjrYv7uWaDnLd5easic=;
 b=kITmJQRf18WrHNrmc1UNGoavLGtYtaWYV/Vi7zPc81fZ1fYa3gdABFj69IhhEMuBtP
 SQ5BGol4NhtyfluF2wF5b72S73LKtV+m18Sq4h1+MzG/K8Ylp3Diqk2p3Ny347H1ghiE
 PwJfJIkEIMjv4Wi/FdpRrVzRxR4XoX1n7Pa/LSF4XRG/bHhWYj9zh4Qqe/VrRiPePZmA
 cYa56m0jOCoFBIOUixHms/uErPe6w3qDACfHRojlvJIQ2lQxge1U7/gnUZMZ7mmseHCF
 fEdwWTMxta1paoziWSIVB4FW/GnvLuRdWrBSHPDzCjaGmsOKkEd6aEG7AesPApDFAn5X
 cXGw==
X-Gm-Message-State: AOAM53199BB7q2zg1Dpko7tpCMGohuRQZICwKMssUvla9+1RMZ1aYSCF
 l35fis8Xou0JJmPU3QO9Fa0dng==
X-Google-Smtp-Source: ABdhPJw4KEIOPxPTCS+L4XGMS5eWFfa34rymJHTNHqLlbJTrSvZhhFeTZ2HGBeZ+xy66RTRx32Ubgg==
X-Received: by 2002:a05:6000:1803:: with SMTP id
 m3mr15567503wrh.34.1611834114303; 
 Thu, 28 Jan 2021 03:41:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:41:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 06/25] hw/timer/cmsdk-apb-timer: Rename CMSDKAPBTIMER
 struct to CMSDKAPBTimer
Date: Thu, 28 Jan 2021 11:41:26 +0000
Message-Id: <20210128114145.20536-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

The state struct for the CMSDK APB timer device doesn't follow our
usual naming convention of camelcase -- "CMSDK" and "APB" are both
acronyms, but "TIMER" is not so should not be all-uppercase.
Globally rename the struct to "CMSDKAPBTimer" (bringing it into line
with CMSDKAPBWatchdog and CMSDKAPBDualTimer; CMSDKAPBUART remains
as-is because "UART" is an acronym).

Commit created with:
 perl -p -i -e 's/CMSDKAPBTIMER/CMSDKAPBTimer/g' hw/timer/cmsdk-apb-timer.c include/hw/arm/armsse.h include/hw/timer/cmsdk-apb-timer.h

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210121190622.22000-7-peter.maydell@linaro.org
---
 include/hw/arm/armsse.h            |  6 +++---
 include/hw/timer/cmsdk-apb-timer.h |  4 ++--
 hw/timer/cmsdk-apb-timer.c         | 28 ++++++++++++++--------------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 77f86771c30..83f5e28c16e 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -153,9 +153,9 @@ struct ARMSSE {
     TZPPC apb_ppc0;
     TZPPC apb_ppc1;
     TZMPC mpc[IOTS_NUM_MPC];
-    CMSDKAPBTIMER timer0;
-    CMSDKAPBTIMER timer1;
-    CMSDKAPBTIMER s32ktimer;
+    CMSDKAPBTimer timer0;
+    CMSDKAPBTimer timer1;
+    CMSDKAPBTimer s32ktimer;
     qemu_or_irq ppc_irq_orgate;
     SplitIRQ sec_resp_splitter;
     SplitIRQ ppc_irq_splitter[NUM_PPCS];
diff --git a/include/hw/timer/cmsdk-apb-timer.h b/include/hw/timer/cmsdk-apb-timer.h
index 0d80b2a48cd..baa009bb2da 100644
--- a/include/hw/timer/cmsdk-apb-timer.h
+++ b/include/hw/timer/cmsdk-apb-timer.h
@@ -18,9 +18,9 @@
 #include "qom/object.h"
 
 #define TYPE_CMSDK_APB_TIMER "cmsdk-apb-timer"
-OBJECT_DECLARE_SIMPLE_TYPE(CMSDKAPBTIMER, CMSDK_APB_TIMER)
+OBJECT_DECLARE_SIMPLE_TYPE(CMSDKAPBTimer, CMSDK_APB_TIMER)
 
-struct CMSDKAPBTIMER {
+struct CMSDKAPBTimer {
     /*< private >*/
     SysBusDevice parent_obj;
 
diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
index f85f1309f37..ae9c5422540 100644
--- a/hw/timer/cmsdk-apb-timer.c
+++ b/hw/timer/cmsdk-apb-timer.c
@@ -67,14 +67,14 @@ static const int timer_id[] = {
     0x0d, 0xf0, 0x05, 0xb1, /* CID0..CID3 */
 };
 
-static void cmsdk_apb_timer_update(CMSDKAPBTIMER *s)
+static void cmsdk_apb_timer_update(CMSDKAPBTimer *s)
 {
     qemu_set_irq(s->timerint, !!(s->intstatus & R_INTSTATUS_IRQ_MASK));
 }
 
 static uint64_t cmsdk_apb_timer_read(void *opaque, hwaddr offset, unsigned size)
 {
-    CMSDKAPBTIMER *s = CMSDK_APB_TIMER(opaque);
+    CMSDKAPBTimer *s = CMSDK_APB_TIMER(opaque);
     uint64_t r;
 
     switch (offset) {
@@ -106,7 +106,7 @@ static uint64_t cmsdk_apb_timer_read(void *opaque, hwaddr offset, unsigned size)
 static void cmsdk_apb_timer_write(void *opaque, hwaddr offset, uint64_t value,
                                   unsigned size)
 {
-    CMSDKAPBTIMER *s = CMSDK_APB_TIMER(opaque);
+    CMSDKAPBTimer *s = CMSDK_APB_TIMER(opaque);
 
     trace_cmsdk_apb_timer_write(offset, value, size);
 
@@ -181,7 +181,7 @@ static const MemoryRegionOps cmsdk_apb_timer_ops = {
 
 static void cmsdk_apb_timer_tick(void *opaque)
 {
-    CMSDKAPBTIMER *s = CMSDK_APB_TIMER(opaque);
+    CMSDKAPBTimer *s = CMSDK_APB_TIMER(opaque);
 
     if (s->ctrl & R_CTRL_IRQEN_MASK) {
         s->intstatus |= R_INTSTATUS_IRQ_MASK;
@@ -191,7 +191,7 @@ static void cmsdk_apb_timer_tick(void *opaque)
 
 static void cmsdk_apb_timer_reset(DeviceState *dev)
 {
-    CMSDKAPBTIMER *s = CMSDK_APB_TIMER(dev);
+    CMSDKAPBTimer *s = CMSDK_APB_TIMER(dev);
 
     trace_cmsdk_apb_timer_reset();
     s->ctrl = 0;
@@ -206,7 +206,7 @@ static void cmsdk_apb_timer_reset(DeviceState *dev)
 static void cmsdk_apb_timer_init(Object *obj)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
-    CMSDKAPBTIMER *s = CMSDK_APB_TIMER(obj);
+    CMSDKAPBTimer *s = CMSDK_APB_TIMER(obj);
 
     memory_region_init_io(&s->iomem, obj, &cmsdk_apb_timer_ops,
                           s, "cmsdk-apb-timer", 0x1000);
@@ -216,7 +216,7 @@ static void cmsdk_apb_timer_init(Object *obj)
 
 static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
 {
-    CMSDKAPBTIMER *s = CMSDK_APB_TIMER(dev);
+    CMSDKAPBTimer *s = CMSDK_APB_TIMER(dev);
 
     if (s->pclk_frq == 0) {
         error_setg(errp, "CMSDK APB timer: pclk-frq property must be set");
@@ -239,17 +239,17 @@ static const VMStateDescription cmsdk_apb_timer_vmstate = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_PTIMER(timer, CMSDKAPBTIMER),
-        VMSTATE_UINT32(ctrl, CMSDKAPBTIMER),
-        VMSTATE_UINT32(value, CMSDKAPBTIMER),
-        VMSTATE_UINT32(reload, CMSDKAPBTIMER),
-        VMSTATE_UINT32(intstatus, CMSDKAPBTIMER),
+        VMSTATE_PTIMER(timer, CMSDKAPBTimer),
+        VMSTATE_UINT32(ctrl, CMSDKAPBTimer),
+        VMSTATE_UINT32(value, CMSDKAPBTimer),
+        VMSTATE_UINT32(reload, CMSDKAPBTimer),
+        VMSTATE_UINT32(intstatus, CMSDKAPBTimer),
         VMSTATE_END_OF_LIST()
     }
 };
 
 static Property cmsdk_apb_timer_properties[] = {
-    DEFINE_PROP_UINT32("pclk-frq", CMSDKAPBTIMER, pclk_frq, 0),
+    DEFINE_PROP_UINT32("pclk-frq", CMSDKAPBTimer, pclk_frq, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -266,7 +266,7 @@ static void cmsdk_apb_timer_class_init(ObjectClass *klass, void *data)
 static const TypeInfo cmsdk_apb_timer_info = {
     .name = TYPE_CMSDK_APB_TIMER,
     .parent = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(CMSDKAPBTIMER),
+    .instance_size = sizeof(CMSDKAPBTimer),
     .instance_init = cmsdk_apb_timer_init,
     .class_init = cmsdk_apb_timer_class_init,
 };
-- 
2.20.1


