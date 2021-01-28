Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4828307547
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 12:56:31 +0100 (CET)
Received: from localhost ([::1]:46874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l55uY-0003Av-R2
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 06:56:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gq-0001fK-Rw
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:20 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55ge-0006DJ-V0
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:20 -0500
Received: by mail-wr1-x435.google.com with SMTP id c12so5055806wrc.7
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 03:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FLhKJfJA3wJXHxcMZPwl39x9goxCdaNuR65Z80YJ5OE=;
 b=dvL1tvBW0hb+ABtbTnHOaDtgaVPGUu/yGvYan8qVNWP1vnhCE/+Fwwu5T/F6ZzgaL+
 VLnzY8sQq71XXz833C+mYNEjgn8YmE8U7OfdO7VHs0Y24sErXopLKSZ6uRsHdaMEVwgn
 4rxgOztIQ7Yo4z5rsEhCvNCzB81NaO00cgTUWFavGl+YLz+fnNH34CGwyZQ96AFPRGJ7
 s7yv2Vq9EI9R8ZPOKbKVDPu83+LTNA2Z6dNe7+yNCycedsYd82RxcPOSzjlhodEeQMfj
 lKHMBzMo5gOeCQu4weHzTKAcvZ7yeeR+UsLd410XQ4KjbBVPksIk7AWwxYgIXa4SqBUO
 ovmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FLhKJfJA3wJXHxcMZPwl39x9goxCdaNuR65Z80YJ5OE=;
 b=QGGtz3p/dP9PmCZ27LbsjnBa4XrBMicPTp6BK+vCwuyaz2N3NclRHTl46MvfDhdAg5
 pISJ8T8BvOhGwDpf1XRSqLwnYjlBwwkDuwr2JsAsDKjY9ZyjQOGJXY4sItia6ijVLNbW
 lkbzj4pK8d966QioC/M1qdAHifkb2vyKPZ+SS144x7yunyRZF25RUzvPhW7TwR+YpSbj
 o46GBIy9P3WZCQjBlslNSyZOP4+C97fBRwYLuM0XJ52EwC8OBaFq2k9ucoQTEuv9FjUf
 tfPko6+Jq24SWYaCq4368NHI7acL93X5g2Z7GT4tX98DewA6bvio6msQT9Ny7IVeOsxo
 KiMw==
X-Gm-Message-State: AOAM530MyzWyBbVL2LZHRrFdMGK1qFjR3gxR6WSaMkwIKyRYKPyyq8+o
 14bY3qsNsxeYTPxHoXHoQVKaqA==
X-Google-Smtp-Source: ABdhPJxMreuamRMoqLMOWVicTPnlrnRQ6KEgY+AWOcJj4r3vdlolY+gDU/ARAOq0DOvjQd1H+i1T0g==
X-Received: by 2002:a05:6000:188c:: with SMTP id
 a12mr16295896wri.105.1611834127506; 
 Thu, 28 Jan 2021 03:42:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:42:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 20/25] hw/watchdog/cmsdk-apb-watchdog: Convert to use Clock
 input
Date: Thu, 28 Jan 2021 11:41:40 +0000
Message-Id: <20210128114145.20536-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

Switch the CMSDK APB watchdog device over to using its Clock input;
the wdogclk_frq property is now ignored.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
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


