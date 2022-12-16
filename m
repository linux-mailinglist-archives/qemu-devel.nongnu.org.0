Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7141764F419
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:27:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IU5-00061Z-6L; Fri, 16 Dec 2022 16:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITu-0005wt-M5
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:06 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITs-0000ag-QB
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:02 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so5001336wmb.2
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NlLR2z3qolE9UkVci7mw2GXgMx349fCTP5JUzSE62RQ=;
 b=bScts5i56vU/uLIcXiRNf5AUdcGkeLW/PbIaYPQDLAKftZ0zUFClUy1QiLY5G/mFv8
 cjiMAZLn/f9h54F0QUyPR6Q/IQqPpzwBsCHOpFhCFvL8QNDyBT5ZCnVy8cPBLp0hy566
 s0OVA6AsXFBl8IMs5VSdI3GPrZ9egUxh5eWAeoJQM8CQxCm7EKGU7SHhF/B6FZur5ELF
 0nP9JAMSmW9jNUBwDfsj4gBE4cnP71dylBMOBvUNxo9tQ6obw+bnfVqGE+4As4b8xm0h
 G0Hjj4HCmdm8+JV73KL5ckyQ4oFYaWW7WhCSmtxKdQC/TBopys5bHMVFq8MHRA3Rdv9J
 9hQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NlLR2z3qolE9UkVci7mw2GXgMx349fCTP5JUzSE62RQ=;
 b=K/W2zd4B7z3G/7qCgKKiO7smGVzBp/QVRjiQaMo/Tk2J0SAWponU46ljaAtitWWZwu
 rP87/wnRR8mJSF7tkVJWCBITvPXDNSMHzymHOfzRBIfOknIC9VOhMBwGi9VCit+vDElB
 aoPUYBvBmODXkDf6CYSCbP3VrjTgvoETEVqLIhtlQelHVn0cPgF7UjkKc2etwltpjl+b
 ELmkojwLkgPu9pQ+fmu3MKPX5u2uDry3Ko/5nSNQhTb62t0Def5C/NSbRuLbRtFriuQ+
 lWqGVQQLZ5B025DxjPam8o9HGrSCVy4Vn4us1A9HC4GGp/rriU5Lfw0oB2T+d7ogf1kT
 4oYg==
X-Gm-Message-State: AFqh2koxjrSiFoP7zcS6nhmk70GQR0FnQWzDqnIj448xHnH1pq9ZrvFv
 Es37d0BnJCji8ZEsKWmYeCDJPSvN3LyWwoU4
X-Google-Smtp-Source: AMrXdXsmjaW+UQ238E8X2biTHeIHSVUvuY+lNclJ6PjwLE9RQVR/4prCbCcWjBvWOgCbZbC70AW2tQ==
X-Received: by 2002:a05:600c:1e29:b0:3d3:404a:8a1b with SMTP id
 ay41-20020a05600c1e2900b003d3404a8a1bmr3957083wmb.8.1671226980085; 
 Fri, 16 Dec 2022 13:43:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.42.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:42:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/36] target/hexagon: Convert to 3-phase reset
Date: Fri, 16 Dec 2022 21:42:23 +0000
Message-Id: <20221216214244.1391647-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
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

Convert the hexagon CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Message-id: 20221124115023.2437291-6-peter.maydell@linaro.org
---
 target/hexagon/cpu.h |  2 +-
 target/hexagon/cpu.c | 12 ++++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 2a65a57bab3..794a0453fd4 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -137,7 +137,7 @@ typedef struct HexagonCPUClass {
     CPUClass parent_class;
     /*< public >*/
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 } HexagonCPUClass;
 
 struct ArchCPU {
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 03221fbdc28..658ca4ff783 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -281,14 +281,16 @@ static void hexagon_restore_state_to_opc(CPUState *cs,
     env->gpr[HEX_REG_PC] = data[0];
 }
 
-static void hexagon_cpu_reset(DeviceState *dev)
+static void hexagon_cpu_reset_hold(Object *obj)
 {
-    CPUState *cs = CPU(dev);
+    CPUState *cs = CPU(obj);
     HexagonCPU *cpu = HEXAGON_CPU(cs);
     HexagonCPUClass *mcc = HEXAGON_CPU_GET_CLASS(cpu);
     CPUHexagonState *env = &cpu->env;
 
-    mcc->parent_reset(dev);
+    if (mcc->parent_phases.hold) {
+        mcc->parent_phases.hold(obj);
+    }
 
     set_default_nan_mode(1, &env->fp_status);
     set_float_detect_tininess(float_tininess_before_rounding, &env->fp_status);
@@ -339,11 +341,13 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
     HexagonCPUClass *mcc = HEXAGON_CPU_CLASS(c);
     CPUClass *cc = CPU_CLASS(c);
     DeviceClass *dc = DEVICE_CLASS(c);
+    ResettableClass *rc = RESETTABLE_CLASS(c);
 
     device_class_set_parent_realize(dc, hexagon_cpu_realize,
                                     &mcc->parent_realize);
 
-    device_class_set_parent_reset(dc, hexagon_cpu_reset, &mcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, hexagon_cpu_reset_hold, NULL,
+                                       &mcc->parent_phases);
 
     cc->class_by_name = hexagon_cpu_class_by_name;
     cc->has_work = hexagon_cpu_has_work;
-- 
2.25.1


