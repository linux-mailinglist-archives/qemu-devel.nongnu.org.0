Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC9464F41E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:29:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IV1-0006ft-9Q; Fri, 16 Dec 2022 16:44:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IU8-00064V-6M
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:16 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IU6-0000fE-GH
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:15 -0500
Received: by mail-wm1-x32f.google.com with SMTP id v7so2786738wmn.0
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tmWSOkAlgQ3XeV0sLQSMRS/hn+5qBNnCvxTz3LkMcQc=;
 b=lyPa3JVlWjHsLi18a+PEbeqodaoH0/bqyckN9gU7xFTDgDFIkpAPCdLWJIxFY89UsZ
 Rf2sRBuaL4Ctnwu4/FPHjQCeKMIm+x4XG812x0RsNsIzEzmEzSsGIaSOcvuJkJmb4c2u
 7tcpJH617MolIkKUfN69a4bJyJh9/TUIqdoWmkSi5SEXexeXfab6hCXTjwrfk6G6mOS7
 FYFuWub4Oi/vtHoPrLBX+Vgofi63Qt6qK9zVGoe4kVqMvY/RIREmA0b2v1gJy4g/tCFR
 wLAspnBnGGnikOz9i/frG4XfrjrINmNSx8qs0pbe05HvADI0+HuIqy0bauXR1mrYGp7X
 5X0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tmWSOkAlgQ3XeV0sLQSMRS/hn+5qBNnCvxTz3LkMcQc=;
 b=o2oQfHvh8dVe39snbZHyfVCLb75EKMzXBeQbP4SN7YvjkLa+rps9s75i9YJ41WHkha
 PJp4ZTIWwqJ0yGEeYR+lO4bn7+LgQpKKiyWNEst/OXtNNsxPofnUASJQsRaa1+kcRXSR
 Tf8PivG2Qx1iervD3Ob9jtuRTUgWVExqERgsOax+KgLgdT/IJ5mvI24bdPiq0dIa4oJa
 TsLdZJANS3now8srWN99Y38ouVTYcqURTaYns+1fxC3vdedmW4+5T/Fvhw0awQJcNby1
 GqRUhajpN2NCNP6267WbvdK7/ofVKaXJYTIzo7vR2pAH7Aib7vTBlFL/QyW3ewueU7QX
 H2Jw==
X-Gm-Message-State: AFqh2kqUKiLwS9CvYCDnbd5zDTDuI/VHqGpn77ROdyO8m3KFdgKAOswQ
 ZlAA5FJmzlP35P7wZJSEa9dwOQWNjptkwxpV
X-Google-Smtp-Source: AMrXdXtTZSHF6OtmVXYn9AJ9JmK58jeh+ERIfNEgP1poxhJYKQKOm7UvwoWBUGN3TDV5Bkj9QKGbAw==
X-Received: by 2002:a05:600c:ad6:b0:3d3:3fb1:901d with SMTP id
 c22-20020a05600c0ad600b003d33fb1901dmr4494380wmr.37.1671226993776; 
 Fri, 16 Dec 2022 13:43:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.43.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:43:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/36] target/xtensa: Convert to 3-phase reset
Date: Fri, 16 Dec 2022 21:42:37 +0000
Message-Id: <20221216214244.1391647-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

Convert the xtensa CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-id: 20221124115023.2437291-20-peter.maydell@linaro.org
---
 target/xtensa/cpu-qom.h |  4 ++--
 target/xtensa/cpu.c     | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/xtensa/cpu-qom.h b/target/xtensa/cpu-qom.h
index 4fc35ee49b8..419c7d8e4a3 100644
--- a/target/xtensa/cpu-qom.h
+++ b/target/xtensa/cpu-qom.h
@@ -41,7 +41,7 @@ typedef struct XtensaConfig XtensaConfig;
 /**
  * XtensaCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  * @config: The CPU core configuration.
  *
  * An Xtensa CPU model.
@@ -52,7 +52,7 @@ struct XtensaCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 
     const XtensaConfig *config;
 };
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 09923301c40..2dc8f2d232f 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -85,16 +85,18 @@ bool xtensa_abi_call0(void)
 }
 #endif
 
-static void xtensa_cpu_reset(DeviceState *dev)
+static void xtensa_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     XtensaCPU *cpu = XTENSA_CPU(s);
     XtensaCPUClass *xcc = XTENSA_CPU_GET_CLASS(cpu);
     CPUXtensaState *env = &cpu->env;
     bool dfpu = xtensa_option_enabled(env->config,
                                       XTENSA_OPTION_DFP_COPROCESSOR);
 
-    xcc->parent_reset(dev);
+    if (xcc->parent_phases.hold) {
+        xcc->parent_phases.hold(obj);
+    }
 
     env->pc = env->config->exception_vector[EXC_RESET0 + env->static_vectors];
     env->sregs[LITBASE] &= ~1;
@@ -240,11 +242,13 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
     XtensaCPUClass *xcc = XTENSA_CPU_CLASS(cc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
 
     device_class_set_parent_realize(dc, xtensa_cpu_realizefn,
                                     &xcc->parent_realize);
 
-    device_class_set_parent_reset(dc, xtensa_cpu_reset, &xcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, xtensa_cpu_reset_hold, NULL,
+                                       &xcc->parent_phases);
 
     cc->class_by_name = xtensa_cpu_class_by_name;
     cc->has_work = xtensa_cpu_has_work;
-- 
2.25.1


