Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DCD308849
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:32:10 +0100 (CET)
Received: from localhost ([::1]:47980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5S0W-0004Hs-A1
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:32:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWO-00059k-C4
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:01:01 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:38032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWF-00078t-3D
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:01:00 -0500
Received: by mail-wm1-x32c.google.com with SMTP id y187so6820757wmd.3
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8Q/Zx+LStNTVndvw6F2NG1TWQc+T3iIwGsQdHvDIx/0=;
 b=HfVbjkYTzqbcX0nMRtcelGrLtq+CiluMFUEtWKKDx/xsGIeS73m/o2+OzMITHKnYZv
 atNlTGaYDOvdlc0eXPPWkSjMeC2rul4EBfyGSJWoO7/z4O1eSNGcTBcjqtLFLgLDs0vZ
 8dpmxbD3I0VseSmD3LZowQ6CWEr/FbFEceswHvCGTWRZQKkvoKXa1Eb0Tdm4ZJ8EdHw9
 MnCjmG7lR9y7eBIMGWW0K6tnOkUwKe/ncfH0ks2mObTqWEfiI/9WGxf+HsJnxWV6ugUk
 XWd9XVN1ZTuDR7GVvHCF+WM37YxLYPZbtpwT0cAZ6bBO5FoOwpGejxfDpilv7shaKBA2
 i05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Q/Zx+LStNTVndvw6F2NG1TWQc+T3iIwGsQdHvDIx/0=;
 b=g9uN1K8BWnTjh2oS2jMu0qTRq0Vr5t9GSh/tGjQWn1aBwBFeresMnN9IWJsdiSxRnO
 elOy6mhGd3gFpzQcIQxe/MNYqfu6FxWmmjASxmKqXQkdFH1G1jKSKv86ufWKDKwTdQWT
 27nJixbQfGT9bSnYq/I3RZPKtHtnmNnJNkcPPDCvY8ItJ8iUI88ESyEk68rI3j10rImr
 azhghdLcMTNjcWMO0+u9Rt8nMFMTWJVBiN7DRMBVxBbDfkBQME02QPK2k42h7GxfDcc3
 b0stVbRS9AkYgKTbgP1p/tO0umMCBNHI/krKDBQoCBIssnHMMQJGbQaM9DXLxy1LEBv3
 zkkg==
X-Gm-Message-State: AOAM530RilXUEgfqZsembx1b1QF3iikAlRO8TpyAn8CzmuV5b6ZQko+g
 OmVdYq44ZlQvPNrJyIdawbCUmK8hkJZkNw==
X-Google-Smtp-Source: ABdhPJz/JGrerkvSJ10iK1q7cjoJrgxOzb465Yz4qf71IfJcsG0b2WkpTdF5WDuC5OCKb0W5hmnCDw==
X-Received: by 2002:a1c:1d12:: with SMTP id d18mr3160744wmd.121.1611918049784; 
 Fri, 29 Jan 2021 03:00:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 39/46] hw/timer/cmsdk-apb-timer: Convert to use Clock input
Date: Fri, 29 Jan 2021 11:00:05 +0000
Message-Id: <20210129110012.8660-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

Switch the CMSDK APB timer device over to using its Clock input; the
pclk-frq property is now ignored.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210128114145.20536-19-peter.maydell@linaro.org
Message-id: 20210121190622.22000-19-peter.maydell@linaro.org
---
 hw/timer/cmsdk-apb-timer.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
index c63145ff553..f053146d88f 100644
--- a/hw/timer/cmsdk-apb-timer.c
+++ b/hw/timer/cmsdk-apb-timer.c
@@ -204,6 +204,15 @@ static void cmsdk_apb_timer_reset(DeviceState *dev)
     ptimer_transaction_commit(s->timer);
 }
 
+static void cmsdk_apb_timer_clk_update(void *opaque)
+{
+    CMSDKAPBTimer *s = CMSDK_APB_TIMER(opaque);
+
+    ptimer_transaction_begin(s->timer);
+    ptimer_set_period_from_clock(s->timer, s->pclk, 1);
+    ptimer_transaction_commit(s->timer);
+}
+
 static void cmsdk_apb_timer_init(Object *obj)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
@@ -213,15 +222,16 @@ static void cmsdk_apb_timer_init(Object *obj)
                           s, "cmsdk-apb-timer", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->timerint);
-    s->pclk = qdev_init_clock_in(DEVICE(s), "pclk", NULL, NULL);
+    s->pclk = qdev_init_clock_in(DEVICE(s), "pclk",
+                                 cmsdk_apb_timer_clk_update, s);
 }
 
 static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
 {
     CMSDKAPBTimer *s = CMSDK_APB_TIMER(dev);
 
-    if (s->pclk_frq == 0) {
-        error_setg(errp, "CMSDK APB timer: pclk-frq property must be set");
+    if (!clock_has_source(s->pclk)) {
+        error_setg(errp, "CMSDK APB timer: pclk clock must be connected");
         return;
     }
 
@@ -232,7 +242,7 @@ static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
                            PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
 
     ptimer_transaction_begin(s->timer);
-    ptimer_set_freq(s->timer, s->pclk_frq);
+    ptimer_set_period_from_clock(s->timer, s->pclk, 1);
     ptimer_transaction_commit(s->timer);
 }
 
-- 
2.20.1


