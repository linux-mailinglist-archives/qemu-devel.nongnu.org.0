Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218F3622FF9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 17:16:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osnj9-000187-Rf; Wed, 09 Nov 2022 11:14:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnj8-00017c-Dh
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:14:58 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnj2-0007jX-I5
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:14:58 -0500
Received: by mail-wr1-x432.google.com with SMTP id a14so26511522wru.5
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 08:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ly4OSovRHvN+53CgiCfPFZpycGRSTR1uUEH/wJ6P+uc=;
 b=M37MRuhiMlfCctx8TrSl4afDY1ELXk5CVeruVonARwJGVV3+2mqKGfZP9WQGHOAiW3
 uyVoRDYu/eUM4RcNOO0wNggK1KciTmYcB5fltAlQkRhbol1/edPi7M4JM1EftcpvfRsF
 iiMR7qKfEZEJ+DPzrz2nAhpT0dTj3pSfp4aE8U0KFV3ZXabGZpcSBUAbCFfHhoUMqqyN
 8XQpK2vdWD6E/dvW2zLF6dKJ8NpsQBZVqLacmECeoORzzZZaUc4VuLkSK0Jr6CX2Jc3/
 oDMW3EKiRqqOMSnjAPrqKVijq1GPSuo+SyIe5abRNgONMEXYIgJDUsJl0o5nT0xWYEsT
 GMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ly4OSovRHvN+53CgiCfPFZpycGRSTR1uUEH/wJ6P+uc=;
 b=dayUDlVlgCfGLreKOiX7+CXGHpBvSszplhZvzM01bsdnp92tohF8sitlLJYu/mpiM0
 XLPxdufLN3uJmIWI6fyMlkrt7MJEOrUwjLxfXwhAz67gKhMg2+WDhVTsHJX6t4ld7qg+
 z5RgLiHoJqbLDVflM0RC/7CVy3l7BQV5QA4owha8pP7UrIUu0eHteAalMclzi6WGArcb
 QYokiOZtYjewKwG7OQ7fuT3DkdN6a1QWW0wnii7tf2xKHXZox8piJ9PJpRgP5REQA6lF
 X8tutjp6d5LygpHG9og3KQ7lBVW94OralQS0ypxMzmR2kdc/zYlTFui/6K+dGBtupxAa
 ovRw==
X-Gm-Message-State: ACrzQf3qZOqCugJN90QCg4igVf6NUHOTbLmgMIxyvOTDI8ugWMeUvZPL
 Q/nXOYDsSyUJ/bN8vpP9oa5YNxYmsZufdA==
X-Google-Smtp-Source: AMsMyM6wfBqyUfuVqGaadHNkWvD+RCCttd9tAMFUXQCelCm/Llm/IMkS5sl/2jG6ZJgHjoM35vYszg==
X-Received: by 2002:adf:d213:0:b0:236:9cb4:20a9 with SMTP id
 j19-20020adfd213000000b002369cb420a9mr39317373wrh.581.1668010489563; 
 Wed, 09 Nov 2022 08:14:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p15-20020adfce0f000000b0022cbf4cda62sm16209186wrn.27.2022.11.09.08.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 08:14:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-8.0 3/9] hw/intc: Convert TYPE_ARM_GIC_COMMON to 3-phase
 reset
Date: Wed,  9 Nov 2022 16:14:38 +0000
Message-Id: <20221109161444.3397405-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221109161444.3397405-1-peter.maydell@linaro.org>
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

Convert the TYPE_ARM_GIC_COMMON device to 3-phase reset.  This is a
simple no-behaviour-change conversion.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic_common.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
index 7b44d5625b6..a379cea3959 100644
--- a/hw/intc/arm_gic_common.c
+++ b/hw/intc/arm_gic_common.c
@@ -261,9 +261,9 @@ static inline void arm_gic_common_reset_irq_state(GICState *s, int first_cpu,
     }
 }
 
-static void arm_gic_common_reset(DeviceState *dev)
+static void arm_gic_common_reset_hold(Object *obj)
 {
-    GICState *s = ARM_GIC_COMMON(dev);
+    GICState *s = ARM_GIC_COMMON(obj);
     int i, j;
     int resetprio;
 
@@ -364,9 +364,10 @@ static Property arm_gic_common_properties[] = {
 static void arm_gic_common_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     ARMLinuxBootIfClass *albifc = ARM_LINUX_BOOT_IF_CLASS(klass);
 
-    dc->reset = arm_gic_common_reset;
+    rc->phases.hold = arm_gic_common_reset_hold;
     dc->realize = arm_gic_common_realize;
     device_class_set_props(dc, arm_gic_common_properties);
     dc->vmsd = &vmstate_gic;
-- 
2.25.1


