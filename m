Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5269064F37D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 22:52:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IU6-00061r-Hy; Fri, 16 Dec 2022 16:43:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITw-0005x7-V1
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:06 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITv-0000fW-BL
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:04 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so2697596wms.2
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9VfBPDH2IM8XoXDsV415IlApTEkb1iN+XBOOUvBnr0A=;
 b=HwEA7ZHlNTjz8Zjg2hMtQtIQhuEtcOCn8g0voGgT/Qfp2Iiynn5gmBSoaanEQFdrZ8
 0eC6m37EyvWgR8JWlInxWS51ZQyBkqzIPHR1mw5HjRaT+GeCvWYl+wu6WbCAs2v7dyZ8
 SslZ6hngnwSJSor4uZJJUjOkbK32gSeMBV+Nb9/DbCpulYIYYb+LuEYk7JOXo6zirVeW
 JfkhATlrRPG3jPrKZPaHi2fPW5XK13ora/rrNWmdkapZD7ersTq4qf3IKi9JltQej+Ux
 vEgoqXlRn3Mky34Q82bAr5sdDimBzCmTAllTSbX3CS/fJ/IDmprEfr+ghENsHhkDMi1O
 VY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9VfBPDH2IM8XoXDsV415IlApTEkb1iN+XBOOUvBnr0A=;
 b=D2SzgWsmJITkuJG/97TyUDzG7sBxQBwbH7KeAYy+iTJeK0/g96/1d5HV+GEiLN3XR2
 j2k+6SMGTwbb6Rr08/lhY29x9Ji2NDbRgt8roHPeNuAO1aBwE5a0CuHnOGPgrunh0bKf
 jr6sx+rrUtGtwNLzFCczpDfoehBZ7Atyor/dE5vlaSWma0gVBqINAofTfXXdUBFTatNt
 OvDrbpUsnsB25Q19oqOIuaF64wZLMUH0Bq19Yl916MSEQZRdFMDOUpXmVK80qq5BuF0B
 V/UxpTiHp/TK32CcEfE8PMioGnKFrvkRFenaIB2BRzGc66+OoIfyApoHFYg7q17e/SCt
 2PLw==
X-Gm-Message-State: ANoB5pl7qnM3fGqPHlhQh4niH0SHLP44vA0sCDQOSHnqGshObdcNg7cO
 9blxfaFMiwtOvDUwJ85A/JYRv7irfwHNEkY1
X-Google-Smtp-Source: AA0mqf6BDFqCDgw5xFEr8G2D82AiFOcVjtw2XPBoPIs+Nzjmf7SxZtK0W2S5G69QwH8gd1tibk/WZQ==
X-Received: by 2002:a05:600c:2285:b0:3d2:26cd:3b1e with SMTP id
 5-20020a05600c228500b003d226cd3b1emr16887366wmf.28.1671226981955; 
 Fri, 16 Dec 2022 13:43:01 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.43.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:43:01 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/36] target/loongarch: Convert to 3-phase reset
Date: Fri, 16 Dec 2022 21:42:25 +0000
Message-Id: <20221216214244.1391647-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

Convert the loongarch CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Message-id: 20221124115023.2437291-8-peter.maydell@linaro.org
---
 target/loongarch/cpu.h |  4 ++--
 target/loongarch/cpu.c | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index e15c633b0bf..e35cf655975 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -356,7 +356,7 @@ OBJECT_DECLARE_CPU_TYPE(LoongArchCPU, LoongArchCPUClass,
 /**
  * LoongArchCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A LoongArch CPU model.
  */
@@ -366,7 +366,7 @@ struct LoongArchCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 /*
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index e7b0e12be6a..290ab4d526b 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -450,14 +450,16 @@ void loongarch_cpu_list(void)
     g_slist_free(list);
 }
 
-static void loongarch_cpu_reset(DeviceState *dev)
+static void loongarch_cpu_reset_hold(Object *obj)
 {
-    CPUState *cs = CPU(dev);
+    CPUState *cs = CPU(obj);
     LoongArchCPU *cpu = LOONGARCH_CPU(cs);
     LoongArchCPUClass *lacc = LOONGARCH_CPU_GET_CLASS(cpu);
     CPULoongArchState *env = &cpu->env;
 
-    lacc->parent_reset(dev);
+    if (lacc->parent_phases.hold) {
+        lacc->parent_phases.hold(obj);
+    }
 
     env->fcsr0_mask = FCSR0_M1 | FCSR0_M2 | FCSR0_M3;
     env->fcsr0 = 0x0;
@@ -694,10 +696,12 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
     LoongArchCPUClass *lacc = LOONGARCH_CPU_CLASS(c);
     CPUClass *cc = CPU_CLASS(c);
     DeviceClass *dc = DEVICE_CLASS(c);
+    ResettableClass *rc = RESETTABLE_CLASS(c);
 
     device_class_set_parent_realize(dc, loongarch_cpu_realizefn,
                                     &lacc->parent_realize);
-    device_class_set_parent_reset(dc, loongarch_cpu_reset, &lacc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, loongarch_cpu_reset_hold, NULL,
+                                       &lacc->parent_phases);
 
     cc->class_by_name = loongarch_cpu_class_by_name;
     cc->has_work = loongarch_cpu_has_work;
-- 
2.25.1


