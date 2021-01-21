Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AD92FF49C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:34:17 +0100 (CET)
Received: from localhost ([::1]:59270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fii-0002vZ-Kb
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:34:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fIW-0002dV-UC
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:07:12 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fI8-0005ww-Mc
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:07:12 -0500
Received: by mail-wr1-x42a.google.com with SMTP id c12so2816479wrc.7
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o6QQiJy5R4qmIV1z0aGnCLcQYm3mM8qRJ5jTAs1T+H8=;
 b=ZIts7p2SirGlVpgj+pmUABXAwdDoIRnny+XuuK8dCw7Oj7KL/umjn2C7T/UKu+qgal
 ZT2o4cpO0L55LtHBgOxX5qkFLrEd9/bJjkOzUzvZIuPv1CbN6LelHBLwX+gfOPaOsWCu
 YfI8Thho5dRD3GM24zPrJVh0At82R4bstvG2zvnDBCc4KiE8MMa8Uvr0G5fezNagRa2v
 4ddl4ooHQX6PlVt3GdSobGFUd0xQZEPcAaSYsq7N4owfe2glYhCvGf7WAs+1meSTF0pW
 IpJxs8Zho3c3ZM00PARP1LVjxSoJpSetBhHye5ELdEFbUq/XjbPYAOhCnfInSL9CLT2V
 V7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o6QQiJy5R4qmIV1z0aGnCLcQYm3mM8qRJ5jTAs1T+H8=;
 b=o77vDIlyeLA5WrLs6leko3d3laz2v85j6jyHCh+gxSIBDNNLFl0yYQwynG53bZIG7u
 6HF/jEdUhO/Gv5NCnA0+yq45AZupxPO0hOeKOuVq9ObqVe6qZqajSenmvfyusRKUtxaT
 0DvNrEDWPvRMH+nYn58QnvSk7YSlGfA4pawmv9abwP/MdUcTtyR3zIycZqGXpRbI+rjz
 w+Nd42xe/LOlGnga4VAUGgY1GwC4tCnfQLX5a7qU1SRKmWkWsrdMs3HHJA8Z6UHMUFIn
 12QMMnsm6vYkyTfCQnYod1hMuNZqmHU9/EwI0T6HwZKpH7EqtN93j5C5kNPLD1EX6JP1
 VXHg==
X-Gm-Message-State: AOAM530hPYIeSyJ32l4mCDP1G/3pizg0XIDU3McrPTjjHQCH8LPAWntr
 bm0bqvdKkbdPVzgb7dubjFsTqg==
X-Google-Smtp-Source: ABdhPJxOZyH1FrB5HFrUtW87qkTcOr49W8I81GLHxRqJf+kxWJgPXNpehcEBp28Mv7dh2xACmaPn3g==
X-Received: by 2002:a5d:6204:: with SMTP id y4mr941451wru.48.1611256006367;
 Thu, 21 Jan 2021 11:06:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 22/25] hw/arm/armsse: Use Clock to set system_clock_scale
Date: Thu, 21 Jan 2021 19:06:19 +0000
Message-Id: <20210121190622.22000-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121190622.22000-1-peter.maydell@linaro.org>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

Use the MAINCLK Clock input to set the system_clock_scale variable
rather than using the mainclk_frq property.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
At some point we should make the SysTick take a Clock itself so
that we can get rid of the system_clock_scale global entirely.
(In fact we want two Clocks: one that is the CPU clock and one
for the 'external reference clock' whose period is currently
hardcoded at 1000ns in systick_scale()...)
---
 hw/arm/armsse.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 4349ce9bfdb..1da0c1be4c7 100644
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
@@ -451,9 +461,11 @@ static void armsse_realize(DeviceState *dev, Error **errp)
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
@@ -1115,7 +1127,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
      */
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->container);
 
-    system_clock_scale = NANOSECONDS_PER_SECOND / s->mainclk_frq;
+    /* Set initial system_clock_scale from MAINCLK */
+    armsse_mainclk_update(s);
 }
 
 static void armsse_idau_check(IDAUInterface *ii, uint32_t address,
-- 
2.20.1


