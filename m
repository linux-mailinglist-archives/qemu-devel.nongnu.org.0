Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B32964F41F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:29:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IV6-0006lp-Oz; Fri, 16 Dec 2022 16:44:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IU7-00063T-8k
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:15 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IU5-0000ck-Gg
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:14 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 f13-20020a1cc90d000000b003d08c4cf679so2678562wmb.5
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NmHc1iW2xf801WdjGgkjhtPtQcaDJVi1vDsYl4gELPE=;
 b=sJs61Y9rk7oSJyORF5J4o54KW7CWbVbFYwkwP2Lm4ShEBQdC6ZIiHxUVFDw3pV6Zgu
 aAEXxF2yCCwEx2BCaSwrIwcIVqUD59tVYKpFp9koov0cuMMgP/nSI29dGeZ85It3vdaN
 3cvHzuTKTua4kRSJfKLAxE/xLonAPOqFTtXXU/1y+Rk9ZufMF8Cz90gH2jaTTe9WDytv
 isdEd8OyBzo7dcBQvFGfCoGtacLi7YGnNtmEscwr7LbfivRIaL3AnFTnUmPh9BlZ1Sde
 QOkNW5460W2rL+7VHa9Hby1VGL4+/5xw1WpguifNiCmz2qgLVjmRQSibeRqbI3L8PIC4
 Gkcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NmHc1iW2xf801WdjGgkjhtPtQcaDJVi1vDsYl4gELPE=;
 b=LOl/QhzYGt5DHlNaiQlhKDpUFbfqLIWmIMIcalk70Ek23ad5uODzyASUlo9KdpQGWP
 Lf8WYsYl8Z+q6/7Gg+tNmm3qY+KFtjmuRRSHmS9u0bJeoQYvxGPJ3jxIG//wYYDY4pvj
 dO0Zy0zMvGaOMCstzSqXU7y6gpn6t6eRQ0HPY0ShNe4vDGcWYJ1YEGu1wPdaOmLMGQR1
 f7OTTqqStt+NeOBZoHbqNHLXX2AsnnbD5MNkGInmxsz+PMMQWOzN8Lru5bwpyRdHAVqn
 YsTR2BxsT4Qz0/hcTsZv+EaHyt/LhNqPcJF2P8PfxSCs9/WL+nlSWpgb/8MITLBDWNNY
 kLPQ==
X-Gm-Message-State: ANoB5pk2+YYDbunkdkcsNo+mUHzGRusR6dbqCBXBFzvx+i69BSO3SJ8j
 d3SRvA/eL/mhYEo7aPbCx9xllhFm5yiGucGk
X-Google-Smtp-Source: AA0mqf6eMUgHalWMFa13luv5W7xc2TKmY2cj1nYc8wwdxsrgZiHjM6LJqyX/Eyu2BUZH24cckDO4tw==
X-Received: by 2002:a05:600c:3555:b0:3d0:8643:caf1 with SMTP id
 i21-20020a05600c355500b003d08643caf1mr18952734wmq.16.1671226992735; 
 Fri, 16 Dec 2022 13:43:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.43.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:43:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/36] target/tricore: Convert to 3-phase reset
Date: Fri, 16 Dec 2022 21:42:36 +0000
Message-Id: <20221216214244.1391647-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

Convert the tricore CPU class to use 3-phase reset, so it doesn't
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
Message-id: 20221124115023.2437291-19-peter.maydell@linaro.org
---
 target/tricore/cpu-qom.h |  2 +-
 target/tricore/cpu.c     | 12 ++++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/tricore/cpu-qom.h b/target/tricore/cpu-qom.h
index ee24e9fa76a..612731daa09 100644
--- a/target/tricore/cpu-qom.h
+++ b/target/tricore/cpu-qom.h
@@ -32,7 +32,7 @@ struct TriCoreCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 2c54a2825f8..594cd1efd5e 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -68,14 +68,16 @@ static void tricore_restore_state_to_opc(CPUState *cs,
     env->PC = data[0];
 }
 
-static void tricore_cpu_reset(DeviceState *dev)
+static void tricore_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     TriCoreCPU *cpu = TRICORE_CPU(s);
     TriCoreCPUClass *tcc = TRICORE_CPU_GET_CLASS(cpu);
     CPUTriCoreState *env = &cpu->env;
 
-    tcc->parent_reset(dev);
+    if (tcc->parent_phases.hold) {
+        tcc->parent_phases.hold(obj);
+    }
 
     cpu_state_reset(env);
 }
@@ -180,11 +182,13 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
     TriCoreCPUClass *mcc = TRICORE_CPU_CLASS(c);
     CPUClass *cc = CPU_CLASS(c);
     DeviceClass *dc = DEVICE_CLASS(c);
+    ResettableClass *rc = RESETTABLE_CLASS(c);
 
     device_class_set_parent_realize(dc, tricore_cpu_realizefn,
                                     &mcc->parent_realize);
 
-    device_class_set_parent_reset(dc, tricore_cpu_reset, &mcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, tricore_cpu_reset_hold, NULL,
+                                       &mcc->parent_phases);
     cc->class_by_name = tricore_cpu_class_by_name;
     cc->has_work = tricore_cpu_has_work;
 
-- 
2.25.1


