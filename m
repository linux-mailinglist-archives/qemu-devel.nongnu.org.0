Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8514D64F3B7
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:08:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IU4-00061Q-VA; Fri, 16 Dec 2022 16:43:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITt-0005wl-WA
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:06 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITs-0000eW-Dd
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:01 -0500
Received: by mail-wm1-x335.google.com with SMTP id o15so2731588wmr.4
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PZCvJDQbNUr26OElgPGYt8xyDSU+rXGhRrJxQ62tt6I=;
 b=YYoy1aO3+lYoJh64G7LrZ1tDNp8x8plOkrOQNOYbQDes7vVon9JENG5KNnXcZAAiCx
 HMB7H5RvVMRahEd05i2omeeWh6daUiF/QHDkS6NKFdBFLpA4z+RJS4eGtztqFetahV2A
 NTW6SrhgZNrwgFSKMRbmFtpV5zJiTYTl/lBts4mPnsKwZ+SdIhWYvCngYaj7DieSJs5P
 fZtkBVWat/jZBaSZSRCu1EtKB1mdP0p7nzWFdhv+lytBMZYHDEOij6yZFdKLeiV7V35G
 9iAI4qhgIWJBjE8mnwZxcnbJu4M+hRFD48vsHAliymr30BO+Ly21Sx7cgzXume0VM8jg
 veYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PZCvJDQbNUr26OElgPGYt8xyDSU+rXGhRrJxQ62tt6I=;
 b=1pEM7DM6xqGTjRrotcuqX7n4KtUiYxo/ee/SbdsvOju9lQL09eBZ10vWWcV/Swzcj0
 EEZRi5PwZGlyWS7SEOlBK+i7a9+Ux8mnqIjdavVtGaAGByWTKftwiqOJWP0MPlzNc0nq
 jVKdWQiLmR0vCi8TYj7nxQ0Se5FBGOTBrCnKPWy01THC3zocO/gmTAFiE8SUfUmHNKr0
 SEhQvDQ/XjhasBmLb+raATWg//gljTg4y1p9X+7dhBBjgtGcG8Wh60MUxL1DQ1Ln5IZK
 Yvr1cdR5HRsspisHJQXC7liIBRZ1Qb4ln0Xn5su93WD2XXTcHNmty+q8P4wso2sU/SZv
 +Smw==
X-Gm-Message-State: ANoB5plbhX23i+yHNCpKwZHLHKA1Jxv+WKZQoWw2dyeMzF8Z0sptGTpn
 mmDIwJ1Oc38u8xQbOCifaL2VQ9gdpZlv8iXY
X-Google-Smtp-Source: AA0mqf6Nbj/FQl7lJ9xWjXb3xSPmLrBXX/pHR/yyuFlczROAWOovWRsT2C3jy22h584b84IZyO56iA==
X-Received: by 2002:a05:600c:3c95:b0:3cf:e7c8:494 with SMTP id
 bg21-20020a05600c3c9500b003cfe7c80494mr26547301wmb.29.1671226978353; 
 Fri, 16 Dec 2022 13:42:58 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.42.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:42:57 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/36] target/avr: Convert to 3-phase reset
Date: Fri, 16 Dec 2022 21:42:21 +0000
Message-Id: <20221216214244.1391647-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

Convert the avr CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-id: 20221124115023.2437291-4-peter.maydell@linaro.org
---
 target/avr/cpu-qom.h |  4 ++--
 target/avr/cpu.c     | 13 +++++++++----
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/avr/cpu-qom.h b/target/avr/cpu-qom.h
index b5c3507d6d7..01ea5f160b6 100644
--- a/target/avr/cpu-qom.h
+++ b/target/avr/cpu-qom.h
@@ -31,7 +31,7 @@ OBJECT_DECLARE_CPU_TYPE(AVRCPU, AVRCPUClass, AVR_CPU)
 /**
  *  AVRCPUClass:
  *  @parent_realize: The parent class' realize handler.
- *  @parent_reset: The parent class' reset handler.
+ *  @parent_phases: The parent class' reset phase handlers.
  *
  *  A AVR CPU model.
  */
@@ -40,7 +40,7 @@ struct AVRCPUClass {
     CPUClass parent_class;
     /*< public >*/
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index c7295b488d1..d0139804b9f 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -67,14 +67,16 @@ static void avr_restore_state_to_opc(CPUState *cs,
     env->pc_w = data[0];
 }
 
-static void avr_cpu_reset(DeviceState *ds)
+static void avr_cpu_reset_hold(Object *obj)
 {
-    CPUState *cs = CPU(ds);
+    CPUState *cs = CPU(obj);
     AVRCPU *cpu = AVR_CPU(cs);
     AVRCPUClass *mcc = AVR_CPU_GET_CLASS(cpu);
     CPUAVRState *env = &cpu->env;
 
-    mcc->parent_reset(ds);
+    if (mcc->parent_phases.hold) {
+        mcc->parent_phases.hold(obj);
+    }
 
     env->pc_w = 0;
     env->sregI = 1;
@@ -223,9 +225,12 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
     AVRCPUClass *mcc = AVR_CPU_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
 
     device_class_set_parent_realize(dc, avr_cpu_realizefn, &mcc->parent_realize);
-    device_class_set_parent_reset(dc, avr_cpu_reset, &mcc->parent_reset);
+
+    resettable_class_set_parent_phases(rc, NULL, avr_cpu_reset_hold, NULL,
+                                       &mcc->parent_phases);
 
     cc->class_by_name = avr_cpu_class_by_name;
 
-- 
2.25.1


