Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ABA2FF49B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:34:14 +0100 (CET)
Received: from localhost ([::1]:58966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fif-0002ns-6K
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fIV-0002Yf-2n
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:07:11 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fI7-0005v6-2E
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:07:10 -0500
Received: by mail-wm1-x32b.google.com with SMTP id y187so2436665wmd.3
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uDxVLnL9xv9QeWzNKaXg1U1KaegZzyNUwA1UoAWaXas=;
 b=XZhC+Xrx9Ww1AlqhNOlETwxevwiCnjLdAIp1pjcgbcGVsD92fuKCGyiUz3TBe92YZn
 sTog1D1Fay1tTvbP2YBT31aqr/rnKy+OjqLty4wKss8KagBRAvNarGbCpBCC3CwFz6sL
 26pWQBVzXQcWXn9wwDDuMQctqKac76px5OglnGulWMUSej2YwQrr4p/dumOgY+8zSmVy
 Bq2uNk1pyzuT81BHRHC9H2DoWlMk/8irKrT+i8i4GwP0amtV0/UdN7qyFEAw30Y9ZhRt
 +rYPAXvW6gXz/PWLFnCHnfVLuvv4rfWkutr1sIJ+lH9nooNEJo6+vtjeVRJDK+GrY0pE
 sSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uDxVLnL9xv9QeWzNKaXg1U1KaegZzyNUwA1UoAWaXas=;
 b=nVic41AOzdq7mbs90D04I9qRXctOIT1IA0QG3bvYHJ/A5fQEwctSvlRt4dZmGM8zi+
 z+I5+RgILO6KXGiPwhNr/19lNKWsRAVZny7pOrxKOkZ7drCsMafn8FHGFwj7Re6qKLgM
 jIshu5Gtva8YGA7Q1703SqSNUmWn3HTBdklbjr9uTqyEYorfpwGQklJUnE6J2G+NOVXb
 kePs/f2ZeA0Aq/fYYf+5rQJiNiYGvosI6phv+3bT21sVtZICp/5OrJ3ZYUQJSBywyu86
 /fhEWav4rZIWkK4DdqlbAr7mgc6ul8qRTs8Aze3z0lZb/r2zkOY4jeTOc9FJS7Lw+Seh
 QsIQ==
X-Gm-Message-State: AOAM533zbxs2H5AQ5gvQp7SCBithvpnouVxAtsKwCpkA1NO/RxHsDFk7
 rL8p53QhJDfLV7584QZlp9NLoA==
X-Google-Smtp-Source: ABdhPJyPVYG14xA0tYXYc4qeZamF5KlHQKDgB/GyQh0CEN1NJ8PLkIwtISAgBUWcj437lMYri433JQ==
X-Received: by 2002:a1c:9cc5:: with SMTP id f188mr674223wme.171.1611256004490; 
 Thu, 21 Jan 2021 11:06:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 20/25] hw/watchdog/cmsdk-apb-watchdog: Convert to use Clock
 input
Date: Thu, 21 Jan 2021 19:06:17 +0000
Message-Id: <20210121190622.22000-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121190622.22000-1-peter.maydell@linaro.org>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch the CMSDK APB watchdog device over to using its Clock input;
the wdogclk_frq property is now ignored.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


