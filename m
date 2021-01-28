Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E353C307595
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 13:10:08 +0100 (CET)
Received: from localhost ([::1]:47284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l567j-0007Ho-UJ
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 07:10:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gs-0001ip-6u
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:22 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gh-0006E8-SQ
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:21 -0500
Received: by mail-wm1-x330.google.com with SMTP id e15so4312846wme.0
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 03:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dejnN+1TE+bIdVsXEIIkkiDTxwZNugqOzXyFunr0NOY=;
 b=dpZlRgzdCo/g1pxVEUJCNQOzV46NEadFGZUmVYhIW9hAFmvKTKQcU94WQwsKytPdbh
 qUxi0VyHrjNdnEUJPrQ4m/oDQtNJmMFwKZsqMU/vnyCbEwBCfcAh9uqA7/kkgaHxItws
 +WVIge7vcM1La+a4gAzsoiVsDXhodDikSZXOsza+JvOU4+RHfbC1ZvyPh5aCZwMhXLMD
 83NMYS1hers4buC3QL1l9qZ78zGIdecZu165rl2AklfMF/Nneaabt3wEzNKXXdfGJz8v
 KEqUYr/VMwpuRPzIXkIS0VrtSEky6Bpl5RyMgwxAFpTNdCsC2PqVwFkktSZjqMNR1o/Y
 Vlrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dejnN+1TE+bIdVsXEIIkkiDTxwZNugqOzXyFunr0NOY=;
 b=BjUOtOBQhZZK0A8LHBhcz4dgALTwhXjqPwYJkYXz4IS5calmCwNuiJuEp2wrGz717o
 lGjd0CV25v8IuNvAFMvpQQc5N0B1jRo+UYoMcvqHq+NwpbMF6UV1Bw6Y6llN4knwRmcZ
 GUbY3MQO1xcbLCg6wfqEx1qqxazRVHEIsI6qk71r3ZY/b6eYkgd3yV4GOEsmWXRem+kj
 A55teNOfEGcSwAOGXguYvfelr4VGoy9G7PakKPOQoqmEx/gMRWuNLRft1uHntTTptdGz
 QKTmjXVAcE/9sWU7O3IoTkw8idpzDAEn3fo0e7V+UltBxe5sk9Xu5RT51HSHV6GwD84n
 Ht9g==
X-Gm-Message-State: AOAM5316hAVkjxeEVUwJxdh0TszMsLpadZufuS17LHdr4FUqPl7hFKwP
 30uj+PEFvgAbFL0TJlEtrKPlaw==
X-Google-Smtp-Source: ABdhPJwL7Q1cQ3eIM2UFET0tMGHQQaq5XHmUf8oxI0T/f47dFyDLfPlCjo/P4qqLyBBdNgJvJOXnEg==
X-Received: by 2002:a7b:c08f:: with SMTP id r15mr8407531wmh.22.1611834129473; 
 Thu, 28 Jan 2021 03:42:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:42:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 22/25] hw/arm/armsse: Use Clock to set system_clock_scale
Date: Thu, 28 Jan 2021 11:41:42 +0000
Message-Id: <20210128114145.20536-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

Use the MAINCLK Clock input to set the system_clock_scale variable
rather than using the mainclk_frq property.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210121190622.22000-23-peter.maydell@linaro.org
---
v1->v2: wire armsse_mainclk_update() up as the Clock callback
---
 hw/arm/armsse.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 4349ce9bfdb..9a6b24c79aa 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -232,6 +232,16 @@ static void armsse_forward_sec_resp_cfg(ARMSSE *s)
     qdev_connect_gpio_out(dev_splitter, 2, s->sec_resp_cfg_in);
 }
 
+static void armsse_mainclk_update(void *opaque)
+{
+    ARMSSE *s = ARM_SSE(opaque);
+    /*
+     * Set system_clock_scale from our Clock input; this is what
+     * controls the tick rate of the CPU SysTick timer.
+     */
+    system_clock_scale = clock_ticks_to_ns(s->mainclk, 1);
+}
+
 static void armsse_init(Object *obj)
 {
     ARMSSE *s = ARM_SSE(obj);
@@ -242,7 +252,8 @@ static void armsse_init(Object *obj)
     assert(info->sram_banks <= MAX_SRAM_BANKS);
     assert(info->num_cpus <= SSE_MAX_CPUS);
 
-    s->mainclk = qdev_init_clock_in(DEVICE(s), "MAINCLK", NULL, NULL);
+    s->mainclk = qdev_init_clock_in(DEVICE(s), "MAINCLK",
+                                    armsse_mainclk_update, s);
     s->s32kclk = qdev_init_clock_in(DEVICE(s), "S32KCLK", NULL, NULL);
 
     memory_region_init(&s->container, obj, "armsse-container", UINT64_MAX);
@@ -451,9 +462,11 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (!s->mainclk_frq) {
-        error_setg(errp, "MAINCLK_FRQ property was not set");
-        return;
+    if (!clock_has_source(s->mainclk)) {
+        error_setg(errp, "MAINCLK clock was not connected");
+    }
+    if (!clock_has_source(s->s32kclk)) {
+        error_setg(errp, "S32KCLK clock was not connected");
     }
 
     assert(info->num_cpus <= SSE_MAX_CPUS);
@@ -1115,7 +1128,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
      */
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->container);
 
-    system_clock_scale = NANOSECONDS_PER_SECOND / s->mainclk_frq;
+    /* Set initial system_clock_scale from MAINCLK */
+    armsse_mainclk_update(s);
 }
 
 static void armsse_idau_check(IDAUInterface *ii, uint32_t address,
-- 
2.20.1


