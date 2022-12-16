Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF3564F3DE
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:17:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IUs-0006Wu-FL; Fri, 16 Dec 2022 16:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IU2-00060k-Jr
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:10 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IU0-0000gB-MY
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:10 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so5012555wma.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MOyQoEElJBaMGAXsx9Bs+8ElHc6eJlOS6vtS/o3/iRQ=;
 b=Mk4Fepy0U0cPiNS5365h9QbHPPvpxQbAuYJUZyD51QOktcVaYvR+KQc/cfZcg2EOeL
 nGFbFSbt4hNGgLpa3+7piKO60fmY7iiXnlGRzLOAPm0narcIRo5mUhv0QGasti9evCgD
 xv424sYlTzRj1w4UJtjqOEv9eU62pptWQsSUb85zmTwFSTUDEK5qsB2Nl5Lt0D8WfZMm
 irDcUDxRZvkX559zfu8wVjbVdFlbRNqgW/M/JTbBnG82VxbRy2WatbdZd5KTyNznJXks
 y7P2ZBQ1qN9GvMjar/sKg5qOiR2mcnXpFlXVl/RCKzzdwFK7e0kpUD1+qL69oAqhIC3G
 zULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MOyQoEElJBaMGAXsx9Bs+8ElHc6eJlOS6vtS/o3/iRQ=;
 b=m4q+gGmCWTwTG8OFzZM7maL8Bl/T4+b4e728owAiKBi2CHmsE1up3bjQdtCVh8Ap/k
 g8VvJiJjhOGR7XOFDnKvVipYddUa7gIRMY/2wtOhyvHHbQCdNKHvO4sDr50MZf6FHJX+
 9uPpDb71xAw85gw22+sLEEeHFLdls2j5gE4iT1OtvpfhxqQe+69hFWWjkx8Bp7b2PuuU
 J0OT9l12tSDrOKoZqazr7B1Rc77ArU0JrLVfTAR7gR6NByYNmAjaYDChEK2YLk/18+vd
 F2IM1mvbNs6RZaUXQ+OATClwR2EPvaUnBpnILvUFvjF/xxxB9huboRoPUJdnjgx+FJrw
 5rkg==
X-Gm-Message-State: ANoB5pk8VOpXVJ49dQuIHxN0E7Djo1SYmJEBTQvcus1TStpeaH5MyAUW
 V+AQFw0VPO8tGTOMGViARYWTWzJxixjSuE9Z
X-Google-Smtp-Source: AA0mqf5Ystu4QWkbqzbkxzsZPgBZ5hUbvRV2kbBH1Tiiw/eI/tnNJvQl/hFoRcnx7vY2Ar0/LKFAyg==
X-Received: by 2002:a05:600c:6002:b0:3cf:8260:6364 with SMTP id
 az2-20020a05600c600200b003cf82606364mr27394783wmb.37.1671226986083; 
 Fri, 16 Dec 2022 13:43:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.43.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:43:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/36] target/nios2: Convert to 3-phase reset
Date: Fri, 16 Dec 2022 21:42:29 +0000
Message-Id: <20221216214244.1391647-22-peter.maydell@linaro.org>
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

Convert the nios2 CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Message-id: 20221124115023.2437291-12-peter.maydell@linaro.org
---
 target/nios2/cpu.h |  4 ++--
 target/nios2/cpu.c | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index f85581ee560..b1a55490747 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -37,7 +37,7 @@ OBJECT_DECLARE_CPU_TYPE(Nios2CPU, Nios2CPUClass, NIOS2_CPU)
 
 /**
  * Nios2CPUClass:
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A Nios2 CPU model.
  */
@@ -47,7 +47,7 @@ struct Nios2CPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 #define TARGET_HAS_ICE 1
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 9a5351bc81d..cff30823dad 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -57,14 +57,16 @@ static bool nios2_cpu_has_work(CPUState *cs)
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
 
-static void nios2_cpu_reset(DeviceState *dev)
+static void nios2_cpu_reset_hold(Object *obj)
 {
-    CPUState *cs = CPU(dev);
+    CPUState *cs = CPU(obj);
     Nios2CPU *cpu = NIOS2_CPU(cs);
     Nios2CPUClass *ncc = NIOS2_CPU_GET_CLASS(cpu);
     CPUNios2State *env = &cpu->env;
 
-    ncc->parent_reset(dev);
+    if (ncc->parent_phases.hold) {
+        ncc->parent_phases.hold(obj);
+    }
 
     memset(env->ctrl, 0, sizeof(env->ctrl));
     env->pc = cpu->reset_addr;
@@ -371,11 +373,13 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
     Nios2CPUClass *ncc = NIOS2_CPU_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
 
     device_class_set_parent_realize(dc, nios2_cpu_realizefn,
                                     &ncc->parent_realize);
     device_class_set_props(dc, nios2_properties);
-    device_class_set_parent_reset(dc, nios2_cpu_reset, &ncc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, nios2_cpu_reset_hold, NULL,
+                                       &ncc->parent_phases);
 
     cc->class_by_name = nios2_cpu_class_by_name;
     cc->has_work = nios2_cpu_has_work;
-- 
2.25.1


