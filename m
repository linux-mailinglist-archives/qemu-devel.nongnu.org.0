Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F37968BCAB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:18:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0SE-0000xH-MI; Mon, 06 Feb 2023 07:18:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0Rp-0000tY-A9
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:18:13 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0Rn-0005ur-9W
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:18:13 -0500
Received: by mail-wr1-x433.google.com with SMTP id ba1so6108101wrb.5
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 04:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xK04lMyGXiTsZ6tKZ58V/KNKtbYzeddWJbilZBnE9nw=;
 b=D52LimxeEnhnCNJrq8EfTT2PUerVJl4kyndYSyRbB/gGkKyoPohRWTWepJF61XLzpy
 /fuucykyj5jYUspGuIrwPe+3qrmAt6IbHXEZ7bGiqcEXgjfYed8C/9hpgoHIB54OYJyg
 puv+BTUHHheL6Q2GX6j+auGNckfDa6KA0TMx8ge9MIglNF+hQ4uEzABFbWdtZtErwyv9
 9btdeWxECtSOScwqDrjl2kiNgePa3FmXcTlWhB2QaJB3N5cOkgPNuRTjT+cFsptTOddb
 Qb/uNLeXFOmfSOXrD1uEHAxiPx3pH9IuZV5O8a4zxmk8Ozun0Si8kdACJcBGWtIogIut
 KE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xK04lMyGXiTsZ6tKZ58V/KNKtbYzeddWJbilZBnE9nw=;
 b=cijcULpbKjbQ+2sykU0e7TvzRGuaBLSmzwHlzo3mj4zHYdoPnYeZOuko8giNg7oCbI
 SL1coX9d4WMAOKmFMpzsMPcECnOTyQRj71YZ8eLfZXrja0tjzMBZ8N9DsMq4lORsYTEI
 HyNcrC8Vp22FjoNknBK60OIs3LdkKBoWhLJUH9Rix5a2aHyiccSR5rAoEdtcXhNsyv+A
 C1cK3H6U5SaLrvKSTwbg2uacCEC68sANvLBLDPHQ+NtA2u6G2YuOUTOmmSRWgUKDc4wM
 UfvBD9QgkdOtMDWaOTQdQog+IU4R39o0SBS0QKiQpKQojUh0IfB4RIy1eoq9l0XjdjB6
 UXAg==
X-Gm-Message-State: AO0yUKW7S7sesXbuu7JXnzupf4qS0sN3fqkM7Ys7MskSeppbJ+srWavz
 BTHL86+1DCwtTApejfEcQK1gZIVmnoHMXu+k
X-Google-Smtp-Source: AK7set8F8a/pi/sKbrEIDqU87xGhm0Dz0tj/jLeQDNRO8EDfi2TEtZ5f9L5CBl+kvEaJIMTzIgVH4w==
X-Received: by 2002:a5d:6b0e:0:b0:2c2:6541:7afa with SMTP id
 v14-20020a5d6b0e000000b002c265417afamr19648680wrw.57.1675685889688; 
 Mon, 06 Feb 2023 04:18:09 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 s14-20020adfa28e000000b002c3be49ef94sm8895439wra.52.2023.02.06.04.18.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 04:18:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH 9/9] hw/arm/armv7m: Pass CPU/NVIC using
 object_property_add_const_link()
Date: Mon,  6 Feb 2023 13:17:14 +0100
Message-Id: <20230206121714.85084-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206121714.85084-1-philmd@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Avoid having QOM objects poke at each other internals.
Instead, pass references using QOM link properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/arm/armv7m.c       | 4 ++--
 hw/intc/armv7m_nvic.c | 3 ++-
 target/arm/cpu.c      | 3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 50a9507c0b..edde774da2 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -338,8 +338,8 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
      * Tell the CPU where the NVIC is; it will fail realize if it doesn't
      * have one. Similarly, tell the NVIC where its CPU is.
      */
-    s->cpu->env.nvic = &s->nvic;
-    s->nvic.cpu = s->cpu;
+    object_property_add_const_link(OBJECT(s->cpu), "nvic", OBJECT(&s->nvic));
+    object_property_add_const_link(OBJECT(&s->nvic), "cpu", OBJECT(s->cpu));
 
     if (!qdev_realize(DEVICE(s->cpu), NULL, errp)) {
         return;
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index d9c7e414bc..e43898a9e0 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2668,7 +2668,8 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
     NVICState *s = NVIC(dev);
 
     /* The armv7m container object will have set our CPU pointer */
-    if (!s->cpu || !arm_feature(&s->cpu->env, ARM_FEATURE_M)) {
+    s->cpu = ARM_CPU(object_property_get_link(OBJECT(dev), "cpu", &error_abort));
+    if (!arm_feature(&s->cpu->env, ARM_FEATURE_M)) {
         error_setg(errp, "The NVIC can only be used with a Cortex-M CPU");
         return;
     }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 876ab8f3bf..f081861947 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1573,12 +1573,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
      * error and will result in segfaults if not caught here.
      */
     if (arm_feature(env, ARM_FEATURE_M)) {
+        env->nvic = NVIC(object_property_get_link(OBJECT(dev), "nvic", NULL));
         if (!env->nvic) {
             error_setg(errp, "This board cannot be used with Cortex-M CPUs");
             return;
         }
     } else {
-        if (env->nvic) {
+        if (object_property_find(OBJECT(dev), "nvic")) {
             error_setg(errp, "This board can only be used with Cortex-M CPUs");
             return;
         }
-- 
2.38.1


