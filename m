Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C83264F3F4
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:18:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IV0-0006eJ-3f; Fri, 16 Dec 2022 16:44:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IU4-00061M-09
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:12 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IU1-0000ar-LP
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:11 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso4974705wme.5
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lqJ1U1BjhvvbnXKxuMnVz/cLZMrP5TJ4J5T0otuK7Ws=;
 b=BOtriwxshH0YTkpjm7w0rqIqQ/wupWBqkRMWLDlindEIBnwtEj4MNMgJtS4MwjmN8y
 DTjK5oRY8soSk4U3IZjwSnBWF8Np5SY5Fn0CiO2F+/InGPMQTT3TGdJoDhY3erwGA4HO
 TemOGd4mMLETXvq9j4FAJxnYIe7oNe5YGsSNOTe3PMzLvk31EPL5TB041UGyOX0ZbCJe
 zzwATcVmGfBvmrpq5Kt9m6AVWhY6ayUBLzkUgJIHWcYgJ32bEdsmgBduN0J60vQTrlNx
 4dXBK0BYn9OUl086o4ytYnsQ815mCXcFgdVwhXPIlZlVg3MLvlnANTZjEpBJNn0liCLY
 a32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lqJ1U1BjhvvbnXKxuMnVz/cLZMrP5TJ4J5T0otuK7Ws=;
 b=ivL8iT6G9C/0exb94tomlFW+MsnEuWczUhpAvIqAA+G5thXQhIRuS/+Xu7f/FA9AbH
 If6qjI4LhPNHAt1N8oTc2cCH69a2mBqf2d0fIzV0hrdztZXRrbzaGcqXB/jG96dsXkXQ
 AmLgk2nMZXPuepzqXEOe8IeyAHGmRbQ9Fhw1t2bSa3fAs142uBMsBxriPKA5P/8UlKHJ
 a/ScPLtvJ52FGCYKKObityBD3YUyWhpILjldKiLqNL8RbdR1+hO0az48GRSFKFuO3REX
 zWQrzcTotN5bimmGCdttgwYHDyYiLAkHN4o4U5q6gCB7B/VWXPK1u62fxXhRia5WVue3
 ASUA==
X-Gm-Message-State: ANoB5pnCIhNyX2zmYjOQqBErZRSYCy6rt37m+G5p/tqDt2dB9uiQhXJ5
 u7prJyphnd65Ito3QBi0VygeFX+nJrI046qY
X-Google-Smtp-Source: AA0mqf6XRxl5qrXZnm+R88pURpPe4Syj0ocf/VqS5f9TAcWTValQUoS/PNPxHOo0E6H53pcFVX0PXg==
X-Received: by 2002:a05:600c:539a:b0:3cf:8957:806e with SMTP id
 hg26-20020a05600c539a00b003cf8957806emr27147023wmb.5.1671226988885; 
 Fri, 16 Dec 2022 13:43:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.43.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:43:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/36] target/riscv: Convert to 3-phase reset
Date: Fri, 16 Dec 2022 21:42:32 +0000
Message-Id: <20221216214244.1391647-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
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

Convert the riscv CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-id: 20221124115023.2437291-15-peter.maydell@linaro.org
---
 target/riscv/cpu.h |  4 ++--
 target/riscv/cpu.c | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 3a9e25053f8..443d15a47c0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -395,7 +395,7 @@ OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
 /**
  * RISCVCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A RISCV CPU model.
  */
@@ -404,7 +404,7 @@ struct RISCVCPUClass {
     CPUClass parent_class;
     /*< public >*/
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 struct RISCVCPUConfig {
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d14e95c9dc1..6fe176e4833 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -519,18 +519,20 @@ static void riscv_restore_state_to_opc(CPUState *cs,
     env->bins = data[1];
 }
 
-static void riscv_cpu_reset(DeviceState *dev)
+static void riscv_cpu_reset_hold(Object *obj)
 {
 #ifndef CONFIG_USER_ONLY
     uint8_t iprio;
     int i, irq, rdzero;
 #endif
-    CPUState *cs = CPU(dev);
+    CPUState *cs = CPU(obj);
     RISCVCPU *cpu = RISCV_CPU(cs);
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
     CPURISCVState *env = &cpu->env;
 
-    mcc->parent_reset(dev);
+    if (mcc->parent_phases.hold) {
+        mcc->parent_phases.hold(obj);
+    }
 #ifndef CONFIG_USER_ONLY
     env->misa_mxl = env->misa_mxl_max;
     env->priv = PRV_M;
@@ -1161,11 +1163,13 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
     CPUClass *cc = CPU_CLASS(c);
     DeviceClass *dc = DEVICE_CLASS(c);
+    ResettableClass *rc = RESETTABLE_CLASS(c);
 
     device_class_set_parent_realize(dc, riscv_cpu_realize,
                                     &mcc->parent_realize);
 
-    device_class_set_parent_reset(dc, riscv_cpu_reset, &mcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, riscv_cpu_reset_hold, NULL,
+                                       &mcc->parent_phases);
 
     cc->class_by_name = riscv_cpu_class_by_name;
     cc->has_work = riscv_cpu_has_work;
-- 
2.25.1


