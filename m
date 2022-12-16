Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FAE64F3C2
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:11:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IUg-0006NX-NA; Fri, 16 Dec 2022 16:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IU2-00060j-Hj
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:10 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IU0-0000ag-O7
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:10 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so5001527wmb.2
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3wlQ3hEbEsOsTOS6YZN+KsSVSdVU6IjrEOLfitW6DbU=;
 b=EBvfgXw+k7fK2/Qh3SZ7CHXukOUVHaSeJkMCnAC+ZtGZ2NGfXjkZmobBkbVGSn4SaV
 0yoKizvY1grSU8RZNEEw+1GdF3VYBuqxdBh51Vq3tGjFhyUI9zWUgx/+cg/54x/oA/qN
 TtjgInf77ts1d4GAiPWfWa7DCyu80z7hjk0R+wDVNZm5j4AsGsxAEeu3kYW9oMlSQt1e
 sN7AZ7rN3VwiXgD9dTdzZnY3tzKbVKaMmkNZsji72uTRmVxMQ6vObcPDQyFFnAOzkxSP
 CIfQ70QLVGd7nakfE6xAeSi5I3oTB2mF+6pP3wcGIbbO44UoeH1yYGAKL1FYelMd+ku9
 f3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3wlQ3hEbEsOsTOS6YZN+KsSVSdVU6IjrEOLfitW6DbU=;
 b=hztNnzgNGLMbqRQqfmOXzd7udkmQ/OLG4wL5z6bUjIHXuS+I3EhUM2fmdyf2d6ocHX
 +iCkKR1K9PYt0bj8kZ4sRmxFU1Cwvhd4OMPv206+lUgfTMNgWjE6dFQvFuLHgzwsLYX9
 Bo0i23jlpSod9DJlfSyPfunuRk3/FkkWBKcI+PxsAMnVDb2kzyuqKl4Cy1P3+sR4DM4d
 hppAAblWJbgIeUoeL7oN2mC3HrlHLJ/xIQkNGjdXyfGEnmE51+NpfZyZw2Yf5fZd/msg
 tkW2KyALxzFzpF6ef4OX41n4ilSKLvFcYUk20M+4cjLTMqlS2J4ebvipQg7WAmjkt6ee
 QqoA==
X-Gm-Message-State: AFqh2koVU7UvF0SapiWtkwdT7ABAqAn7ZHM++tqCrEmU5muEd2AgYWfA
 H72wW4sFyDS9kKsaSZLASe4DYSzPQU7eb3Er
X-Google-Smtp-Source: AMrXdXtN+6jiSBo1VpGSxsEXG5OJBo/qukMilxzuc4ipXfAtD1n3yYrg1sYpioYX4YhXiioO7MT1Eg==
X-Received: by 2002:a1c:4b18:0:b0:3d3:39a9:e659 with SMTP id
 y24-20020a1c4b18000000b003d339a9e659mr6223903wma.21.1671226987034; 
 Fri, 16 Dec 2022 13:43:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.43.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:43:06 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/36] target/openrisc: Convert to 3-phase reset
Date: Fri, 16 Dec 2022 21:42:30 +0000
Message-Id: <20221216214244.1391647-23-peter.maydell@linaro.org>
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

Convert the openrisc CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Message-id: 20221124115023.2437291-13-peter.maydell@linaro.org
---
 target/openrisc/cpu.h |  4 ++--
 target/openrisc/cpu.c | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index 1d5efa5ca2f..5f607497052 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -34,7 +34,7 @@ OBJECT_DECLARE_CPU_TYPE(OpenRISCCPU, OpenRISCCPUClass, OPENRISC_CPU)
 /**
  * OpenRISCCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A OpenRISC CPU model.
  */
@@ -44,7 +44,7 @@ struct OpenRISCCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 #define TARGET_INSN_START_EXTRA_WORDS 1
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index de0176cd20c..4c11a1f7ada 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -70,13 +70,15 @@ static void openrisc_disas_set_info(CPUState *cpu, disassemble_info *info)
     info->print_insn = print_insn_or1k;
 }
 
-static void openrisc_cpu_reset(DeviceState *dev)
+static void openrisc_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     OpenRISCCPU *cpu = OPENRISC_CPU(s);
     OpenRISCCPUClass *occ = OPENRISC_CPU_GET_CLASS(cpu);
 
-    occ->parent_reset(dev);
+    if (occ->parent_phases.hold) {
+        occ->parent_phases.hold(obj);
+    }
 
     memset(&cpu->env, 0, offsetof(CPUOpenRISCState, end_reset_fields));
 
@@ -229,10 +231,12 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     OpenRISCCPUClass *occ = OPENRISC_CPU_CLASS(oc);
     CPUClass *cc = CPU_CLASS(occ);
     DeviceClass *dc = DEVICE_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
 
     device_class_set_parent_realize(dc, openrisc_cpu_realizefn,
                                     &occ->parent_realize);
-    device_class_set_parent_reset(dc, openrisc_cpu_reset, &occ->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, openrisc_cpu_reset_hold, NULL,
+                                       &occ->parent_phases);
 
     cc->class_by_name = openrisc_cpu_class_by_name;
     cc->has_work = openrisc_cpu_has_work;
-- 
2.25.1


