Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD0130885B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:39:32 +0100 (CET)
Received: from localhost ([::1]:43594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5S7f-0005nm-Pt
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:39:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWT-0005D7-M2
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:01:09 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:35487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWI-0007Aw-Nu
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:01:05 -0500
Received: by mail-wm1-x333.google.com with SMTP id e15so6819005wme.0
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Nx8d60ny6nKbuq9bq2+Eyh9vShnK54u12FMGTPcmjio=;
 b=UER0xAbPQnKwozuxWtEq+u2ApL/fQSuYsXRUO762f5zOI84Li92/onfIJP9Zww8Yyv
 sLlHon6f9GVY+ixwnLNSZetIJk4sJnKNqv/6xYgAIp2wSxMtDe/nq256nn4LQR8Oqrkk
 +vKBlMxRlzrgO5scYWElKa6rDaR8Uj9Pl+9qiIACaVwBo31j1XRxVTOXnQj7XVcyv/PH
 xymfrp9hjm4YWst21rNCP7shCxHm0kwgSufe+ocqQiA3VrsKHRMuGZ8QIUdDDxToE0T/
 D6fFWcWzF9tJdfdIsTfIs3PlNihlFLsJFxSw01jF8AsEBggpAMwzXAX8cCG+azB+en7s
 m/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nx8d60ny6nKbuq9bq2+Eyh9vShnK54u12FMGTPcmjio=;
 b=uNtXabGCJfU/gt4HZnIJr6ZKU9K7UB9roJ1piZ3c0NYwkHK7c+eIXFEIXb3ttIeweC
 lN17GVXkWIwnnVNxbTjHErBIYkoy1zMQAVgiVpml9Cc8G0glNL6JCaZ4uyL/i0opPVK/
 4gErrwcmY9m+oKI3g/C1F+ELWZYDiUJnryvicpYhDzobWXU7PSu77rFb71iv2UffHNBB
 aURZ/FXjkBlAgrI3UTBlAb+xByk3ql7b3U2I1zR6CYdbyGr437pVdIk3tDA6oRCUyU9a
 lZb3A2NhDDrdcc/EDmThDYt8SEZ1PQvLD2Cgw+aRZfGQ6IqRCWFJxJO/ml5O4JOsGUdm
 kROA==
X-Gm-Message-State: AOAM533JVIGL7M8tJ/SnaDenMfWT6CWo5eso8YFZBjxvpEcPNmY9boyF
 Q/g7CDc5AHt1b1VBOtspXUwTplqVJ7dnUA==
X-Google-Smtp-Source: ABdhPJzMTdU9NTotUDNiixlMvJc3hLq5//uqDYSOS8+6w9dlzfW+/LpdjzKi8NTneSFuVsXB1wUbrQ==
X-Received: by 2002:a05:600c:4e8e:: with SMTP id
 f14mr3264039wmq.139.1611918053217; 
 Fri, 29 Jan 2021 03:00:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 43/46] hw/arm/armsse: Use Clock to set system_clock_scale
Date: Fri, 29 Jan 2021 11:00:09 +0000
Message-Id: <20210129110012.8660-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

Use the MAINCLK Clock input to set the system_clock_scale variable
rather than using the mainclk_frq property.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210128114145.20536-23-peter.maydell@linaro.org
Message-id: 20210121190622.22000-23-peter.maydell@linaro.org
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


