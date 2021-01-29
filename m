Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9777D308847
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:31:14 +0100 (CET)
Received: from localhost ([::1]:43984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Rzd-0002YP-Jq
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:31:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWM-00057n-Va
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:59 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWH-00079I-13
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:58 -0500
Received: by mail-wm1-x32a.google.com with SMTP id i9so6832697wmq.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=R5ZCiCbzgcfVwbMTe2kDZcJL0TsUz0X/IGSllnBxFwk=;
 b=AT3Zw4s7IQ+J6uq91qh3yDE91Fo8LgW7ipmi1gRDgE+UUkua3ElrKcyJMDsM4J0P+8
 tIV+7dpL3D7UpaWdXUQVuyFr3GqP+rroSg2/wT66xX927Ow8f73WUij0FDrwS7FhLuxU
 kpgJOOC54PpBys6D6SR3+aZBDkdjQMAqQkSk/xVr3PUtKCbfeg8f6Ols5J/UKDfnM2xW
 jQiYrOEv+3fV2rJ2wLWOCXDzX5Dbzdl8h2kLxQo2pkZcRUFkNNPcxAxj4YG0lJ2JDYlG
 DFYZaeod79OumEfVNtz15Ulx8CBGlfT93S1DP4dy0jQsh0pqYjIM97SDmytq1aU2pRFR
 Z9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R5ZCiCbzgcfVwbMTe2kDZcJL0TsUz0X/IGSllnBxFwk=;
 b=cFAxamEvVexO3rHw8bbqIcGgaddv/oBpCtF2RtFscHCJwNrcyRLb4nGG20QWDhO7mN
 RKo/k0rEV6UoigYOBWp6GD/Z1YFSDq88j60kfYvLoMvq/YFIZM6mCF64OZK4P+d0Uy3L
 5Nla83ot4/dTVyKb5Xw8eDwly8OwDJBAgg98GTXhSlq5WeYTpLzd5eJEcNB1tvbj6rwW
 asJ0BWvaeIssTc+aQZLfZz37omPU+iXlhRtPZo6smvClgo07YmS8sxUs8uMXhf9YZuc+
 ElxNzAGRhbWx2rGukEILZ6bmUwidqmnb/1BDJ4QosKTiXOouNA0M9ceL3CUqWjCY1Exd
 KFdw==
X-Gm-Message-State: AOAM533IhECGGO6NmlwIoz+q/P12xiax8NKEqgFXP14eOSjsj99XE9C7
 s2JpXVTwRT41ex3HlaHFK3EFq9m3etYqmA==
X-Google-Smtp-Source: ABdhPJxyCVWKBQT0v5FEq9zT/SjdDeC3+FUt2vdFruFQ9KkALMDLXOLc3OOxM9bHf3+OTB0Dsk7WbQ==
X-Received: by 2002:a05:600c:214c:: with SMTP id
 v12mr3276354wml.8.1611918051534; 
 Fri, 29 Jan 2021 03:00:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 41/46] hw/watchdog/cmsdk-apb-watchdog: Convert to use Clock
 input
Date: Fri, 29 Jan 2021 11:00:07 +0000
Message-Id: <20210129110012.8660-42-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

Switch the CMSDK APB watchdog device over to using its Clock input;
the wdogclk_frq property is now ignored.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210128114145.20536-21-peter.maydell@linaro.org
Message-id: 20210121190622.22000-21-peter.maydell@linaro.org
---
 hw/watchdog/cmsdk-apb-watchdog.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/watchdog/cmsdk-apb-watchdog.c b/hw/watchdog/cmsdk-apb-watchdog.c
index b03bcb73628..9cad0c67da4 100644
--- a/hw/watchdog/cmsdk-apb-watchdog.c
+++ b/hw/watchdog/cmsdk-apb-watchdog.c
@@ -310,6 +310,15 @@ static void cmsdk_apb_watchdog_reset(DeviceState *dev)
     ptimer_transaction_commit(s->timer);
 }
 
+static void cmsdk_apb_watchdog_clk_update(void *opaque)
+{
+    CMSDKAPBWatchdog *s = CMSDK_APB_WATCHDOG(opaque);
+
+    ptimer_transaction_begin(s->timer);
+    ptimer_set_period_from_clock(s->timer, s->wdogclk, 1);
+    ptimer_transaction_commit(s->timer);
+}
+
 static void cmsdk_apb_watchdog_init(Object *obj)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
@@ -319,7 +328,8 @@ static void cmsdk_apb_watchdog_init(Object *obj)
                           s, "cmsdk-apb-watchdog", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->wdogint);
-    s->wdogclk = qdev_init_clock_in(DEVICE(s), "WDOGCLK", NULL, NULL);
+    s->wdogclk = qdev_init_clock_in(DEVICE(s), "WDOGCLK",
+                                    cmsdk_apb_watchdog_clk_update, s);
 
     s->is_luminary = false;
     s->id = cmsdk_apb_watchdog_id;
@@ -329,9 +339,9 @@ static void cmsdk_apb_watchdog_realize(DeviceState *dev, Error **errp)
 {
     CMSDKAPBWatchdog *s = CMSDK_APB_WATCHDOG(dev);
 
-    if (s->wdogclk_frq == 0) {
+    if (!clock_has_source(s->wdogclk)) {
         error_setg(errp,
-                   "CMSDK APB watchdog: wdogclk-frq property must be set");
+                   "CMSDK APB watchdog: WDOGCLK clock must be connected");
         return;
     }
 
@@ -342,7 +352,7 @@ static void cmsdk_apb_watchdog_realize(DeviceState *dev, Error **errp)
                            PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
 
     ptimer_transaction_begin(s->timer);
-    ptimer_set_freq(s->timer, s->wdogclk_frq);
+    ptimer_set_period_from_clock(s->timer, s->wdogclk, 1);
     ptimer_transaction_commit(s->timer);
 }
 
-- 
2.20.1


