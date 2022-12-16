Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B055064F428
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:31:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IV5-0006l3-Bv; Fri, 16 Dec 2022 16:44:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IU3-00061K-U6
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:11 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IU1-0000gQ-B2
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:11 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso2732387wmb.0
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ngOEeBVak8Pn0v7S29nlnFYFEpUJqHxOa2AWGjEaHE4=;
 b=sQga9+/PYBLjqzkXyNlsZik5K0L3OZHKEDmKpv8bfwPeUMB8hqr7KhxR8mLTBTMrIl
 TqEbfafhcV+zHoOFwov/OwCIiU+cl2c5u5w70tzHjLkq0KXz3JkAaxA+7Gf4O3n8PcZv
 KWa+O41TJTEdFbfZcdHZrrkWDJ9Vc3J/Nc3NqWjFnF2Et+Ovzm7t0fXufUtsr4s+16qc
 ceu69CUOp6S9YF5X41FFGz8zici6iaLf/sev43RWmOMkTjLTivk1UCqfBJ6+cwpR3Boc
 EQxsZdLpWQ6ZY1MPhp+3OjrhK4xLFS+nEveQuB+V+I/NF4CiCD2op9dh6IU+WSaWxIet
 oVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ngOEeBVak8Pn0v7S29nlnFYFEpUJqHxOa2AWGjEaHE4=;
 b=MACpGaCeo3ghfF6WfZ8Mzl1xKlYhHj/aDyC+2ncbRcboIX/DHkqmf6vlV3Es1qUxD2
 A8BqRmO+6ztaRNkURMrnyXnP8imuJBFa265JiDwyxFgRPtK99RBDQjCoOqJaw92/mnW3
 lSFBhDM7CMK3ycZhjywNPxW15qTwosMGcGypX2LlZgWKYSMcuJRA05JaImPkbJYJEHpP
 bWiOWyNECs0b50k1XUY2ljqVZ0+0rQEozQcCOxhQ3HI14jieeUJwDXMSiROpf+W3x9P0
 +OYob2w9iGZx4/nEf3SyR4qr66Mjcw6PUX4k5P94RVpflnvGlM0KZk8BzeQInzzb6CNq
 mQEA==
X-Gm-Message-State: ANoB5pkSVtx5CHAoWYpoVTzfL/BAat35TMytnY6hxs4ktlIlZuxhYz2Q
 zIX8KLBw6xdUho/uk9C7XN9Q22gdeXCx2xLW
X-Google-Smtp-Source: AA0mqf5yRVoLzRJ0xyoNI9cYMdWMvQzmlzLvHy6bc+DCvA+3ytatXXBJdYFgGFwd6JeyiJ4yiD7TMA==
X-Received: by 2002:a05:600c:3b15:b0:3d0:d177:cac1 with SMTP id
 m21-20020a05600c3b1500b003d0d177cac1mr26364240wms.36.1671226987974; 
 Fri, 16 Dec 2022 13:43:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.43.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:43:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/36] target/ppc: Convert to 3-phase reset
Date: Fri, 16 Dec 2022 21:42:31 +0000
Message-Id: <20221216214244.1391647-24-peter.maydell@linaro.org>
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

Convert the ppc CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-id: 20221124115023.2437291-14-peter.maydell@linaro.org
---
 target/ppc/cpu-qom.h  |  4 ++--
 target/ppc/cpu_init.c | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 89ff88f28c9..0fbd8b72468 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -143,7 +143,7 @@ typedef struct PPCHash64Options PPCHash64Options;
 /**
  * PowerPCCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A PowerPC CPU model.
  */
@@ -154,7 +154,7 @@ struct PowerPCCPUClass {
 
     DeviceRealize parent_realize;
     DeviceUnrealize parent_unrealize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
     void (*parent_parse_features)(const char *type, char *str, Error **errp);
 
     uint32_t pvr;
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index cbf00813743..95d25856a0e 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7031,16 +7031,18 @@ static bool ppc_cpu_has_work(CPUState *cs)
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
 
-static void ppc_cpu_reset(DeviceState *dev)
+static void ppc_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     PowerPCCPU *cpu = POWERPC_CPU(s);
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
     CPUPPCState *env = &cpu->env;
     target_ulong msr;
     int i;
 
-    pcc->parent_reset(dev);
+    if (pcc->parent_phases.hold) {
+        pcc->parent_phases.hold(obj);
+    }
 
     msr = (target_ulong)0;
     msr |= (target_ulong)MSR_HVB;
@@ -7267,6 +7269,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
     DeviceClass *dc = DEVICE_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
 
     device_class_set_parent_realize(dc, ppc_cpu_realize,
                                     &pcc->parent_realize);
@@ -7275,7 +7278,8 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     pcc->pvr_match = ppc_pvr_match_default;
     device_class_set_props(dc, ppc_cpu_properties);
 
-    device_class_set_parent_reset(dc, ppc_cpu_reset, &pcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, ppc_cpu_reset_hold, NULL,
+                                       &pcc->parent_phases);
 
     cc->class_by_name = ppc_cpu_class_by_name;
     cc->has_work = ppc_cpu_has_work;
-- 
2.25.1


