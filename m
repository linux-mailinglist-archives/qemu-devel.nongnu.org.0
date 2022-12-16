Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF7F64F34E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 22:43:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IU3-00060x-NS; Fri, 16 Dec 2022 16:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITu-0005wq-IP
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:06 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITs-0000ea-P6
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:02 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 bi26-20020a05600c3d9a00b003d3404a89faso1997512wmb.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=q8tZDsND3tybaP48R6M+gEKoRel5tUUnDBAqMV6lK9Q=;
 b=EfjNw6lLQ7hF6jJDimXg59ek5raX471SFaougtz/J6/qx3/dk8eIHkCB7Tma4zLBOQ
 +GomQ3uBMM6PHaQf3nvFLWHRcKHZZHhYXkLLruIPh8DVp7zWrl6zEEUK8YVypbceI8es
 ISSngj/3F5005JvE7/WfuRi3sbiMidwk+K0txKaxHhf8yfwiH67icNNQigy1xHS8PfhN
 Zsv6QQ4wUrR3zXcJSvCIkUoSbsXV9rqvNPSUBugvqIEpt1Dup54jf/psbiBX+jByQXs7
 Cv4CAgpxA/6RL4qV5xA5Qnh6eW/9TkmFkIYtv0ER3hd8uQzTGhxCOMHLsLcRmTLe58Lu
 I9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q8tZDsND3tybaP48R6M+gEKoRel5tUUnDBAqMV6lK9Q=;
 b=rwUTXFVNZOYKbv5FO6gF3xnhRPepPaYg+xMstd7TXC0UTQK4CBPCroG8ZAJq+l170R
 GhYKpvJcUVZNUl7hiLRrrFcbqFnyW+4X5a1Htl3dF4+mf9N8P5nJfpd32BRT0GQvyrRC
 mjQVJoeZb7fnEQ539AadhXgE0DRgTF5L8te+TVM9jNFXiKkhtBgN/mCWDCQtRWyMy7Wx
 aRMu1xy6MOzwRTW3PVlGMmxCSVcfi3fgsvU9jL205FjRuwNDf9UFKXNGjHSy98ZDw6aH
 zVZ0XK5+rsbixSVxe/i5WFEr1Nr5+zRwboeq6I6+cO2IwnKyfLartOsDZG318d9OGSMf
 RCJQ==
X-Gm-Message-State: ANoB5pl4hGWl3SJoKf2RMMK7AuZd4iBqucgTmn3Ryexf79E+u00RmH4N
 fHGjjEfhcuCGrNa1PbaCBPnv/qtT3xlzNIud
X-Google-Smtp-Source: AA0mqf4m54UmBJ1Zvktk3t6C1b29wsKsmZZe074WzXPHYP1nxszHz3wK/gr3+EbG+4LkhHp2xvG12g==
X-Received: by 2002:a05:600c:3b93:b0:3d2:3e75:7bb9 with SMTP id
 n19-20020a05600c3b9300b003d23e757bb9mr8073893wms.34.1671226979235; 
 Fri, 16 Dec 2022 13:42:59 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.42.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:42:58 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/36] target/cris: Convert to 3-phase reset
Date: Fri, 16 Dec 2022 21:42:22 +0000
Message-Id: <20221216214244.1391647-15-peter.maydell@linaro.org>
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

Convert the cris CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>
Message-id: 20221124115023.2437291-5-peter.maydell@linaro.org
---
 target/cris/cpu-qom.h |  4 ++--
 target/cris/cpu.c     | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/cris/cpu-qom.h b/target/cris/cpu-qom.h
index 71e8af0e70a..431a1d536a9 100644
--- a/target/cris/cpu-qom.h
+++ b/target/cris/cpu-qom.h
@@ -30,7 +30,7 @@ OBJECT_DECLARE_CPU_TYPE(CRISCPU, CRISCPUClass, CRIS_CPU)
 /**
  * CRISCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  * @vr: Version Register value.
  *
  * A CRIS CPU model.
@@ -41,7 +41,7 @@ struct CRISCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 
     uint32_t vr;
 };
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index fb05dc6f9ab..a6a93c23595 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -56,15 +56,17 @@ static bool cris_cpu_has_work(CPUState *cs)
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
 
-static void cris_cpu_reset(DeviceState *dev)
+static void cris_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     CRISCPU *cpu = CRIS_CPU(s);
     CRISCPUClass *ccc = CRIS_CPU_GET_CLASS(cpu);
     CPUCRISState *env = &cpu->env;
     uint32_t vr;
 
-    ccc->parent_reset(dev);
+    if (ccc->parent_phases.hold) {
+        ccc->parent_phases.hold(obj);
+    }
 
     vr = env->pregs[PR_VR];
     memset(env, 0, offsetof(CPUCRISState, end_reset_fields));
@@ -305,11 +307,13 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
     CRISCPUClass *ccc = CRIS_CPU_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
 
     device_class_set_parent_realize(dc, cris_cpu_realizefn,
                                     &ccc->parent_realize);
 
-    device_class_set_parent_reset(dc, cris_cpu_reset, &ccc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, cris_cpu_reset_hold, NULL,
+                                       &ccc->parent_phases);
 
     cc->class_by_name = cris_cpu_class_by_name;
     cc->has_work = cris_cpu_has_work;
-- 
2.25.1


