Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B00ED65C5F9
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:20:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrX-0008OW-4l; Tue, 03 Jan 2023 13:18:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqb-0008Ho-Oq
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:22 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqZ-0005AU-2l
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:12 -0500
Received: by mail-yb1-xb35.google.com with SMTP id e141so34042620ybh.3
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/hcmB2LT/3scWI6D2yw07Zg5GL1YtQ6uMDjg/q/TVb4=;
 b=XUGpTbJPJfF5KQ6uD9SvIIRrc+MftcDkf6HVV6Om89nUGHahTin7rZMf3NY7np9FK6
 4ZmZQVOROuYU90w0TO83nC37AIkz1OTXic9ARI5OIe2H2AGy2HcjbxC01rk3R/QicGVO
 7xm1Yvp+LUgl8DYlBaKKN/xdb43ScfId4UnMOoI409mowbzTePyROpFnekEgWupvUXR7
 j19Wa+mRUgjH91I6ZsTwsDajAjEhs5X9dE1LDBpGNr0UItprgDAfCvcDZXV114Txkgc6
 4nWmnt7ShVZCvHiiKS+AlaCtMp40pJYpQs0NkjFUrdW5uWSTwzCo3r7uG6lBfj1myln5
 l8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/hcmB2LT/3scWI6D2yw07Zg5GL1YtQ6uMDjg/q/TVb4=;
 b=4Mzi1gE4f7LsLbU8YxWTIELf8CEZa43JPtKLsKpXtfkHNvibfhXxvyGPlEZWa+VkfL
 bE0GsqurotKMQ6xk5zgPfMN2GVrewbluX8ju356HghPyxTmvkN4yaher1O37Lne0mte5
 rkk8/mgA3tx9FHDer9F9LEC3c206byyJBnJiBAxuOib178jzsPyc3LTybAOdI1YCPsk/
 vFmuqopDZ9RU2x1OlkZGDpm0pg1wuQJi0twdGi3NrE6ZDqfC3wEReOsjJPKxUdLV4bDi
 7eqnAAb/kGExzvpT67MWpOrl5JE+fuqRLOabPSt+OSu9iJjke/ORtMMy+8UWEtEiU+KZ
 bAvw==
X-Gm-Message-State: AFqh2kq0oE0fmoQZmmqsHmtNbofKqtCtIoPO8EB+XjyXcbNRYyOiKgSn
 Dv62lcxamfFRL8Voxqs//C+zBfM0wuuI5ISiLoo=
X-Google-Smtp-Source: AMrXdXvw3kLa/JIeLtsOsEF8VrJIBEo4WLAfSwm6JiGFI+XbHVrJC8zmN84frIEam0Jd4K1iWUDWcg==
X-Received: by 2002:a25:8904:0:b0:6f5:758f:43b with SMTP id
 e4-20020a258904000000b006f5758f043bmr42221079ybl.41.1672769828790; 
 Tue, 03 Jan 2023 10:17:08 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:17:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 06/40] target/arm: Remove AArch64CPUClass
Date: Tue,  3 Jan 2023 10:16:12 -0800
Message-Id: <20230103181646.55711-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb35.google.com
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

The class structure is a plain wrapper around ARMCPUClass.  We really
only need the QOM class, TYPE_AARCH64_CPU.  The instance init and
fallback class init functions are identical to the same ones over
in cpu.c.  Make arm_cpu_post_init static.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-qom.h | 19 ++++++-------------
 target/arm/cpu.h     |  2 --
 target/arm/cpu.c     |  2 +-
 target/arm/cpu64.c   | 33 +--------------------------------
 4 files changed, 8 insertions(+), 48 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 95f7805076..184b3e3726 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -26,6 +26,7 @@
 struct arm_boot_info;
 
 #define TYPE_ARM_CPU "arm-cpu"
+#define TYPE_AARCH64_CPU "aarch64-cpu"
 
 OBJECT_DECLARE_CPU_TYPE(ARMCPU, ARMCPUClass, ARM_CPU)
 
@@ -38,13 +39,17 @@ typedef struct ARMCPUInfo {
 } ARMCPUInfo;
 
 void arm_cpu_register_parent(const ARMCPUInfo *info, const char *parent);
-void aarch64_cpu_register(const ARMCPUInfo *info);
 
 static inline void arm_cpu_register(const ARMCPUInfo *info)
 {
     arm_cpu_register_parent(info, TYPE_ARM_CPU);
 }
 
+static inline void aarch64_cpu_register(const ARMCPUInfo *info)
+{
+    arm_cpu_register_parent(info, TYPE_AARCH64_CPU);
+}
+
 /**
  * ARMCPUClass:
  * @parent_realize: The parent class' realize handler.
@@ -62,18 +67,6 @@ struct ARMCPUClass {
     ResettablePhases parent_phases;
 };
 
-
-#define TYPE_AARCH64_CPU "aarch64-cpu"
-typedef struct AArch64CPUClass AArch64CPUClass;
-DECLARE_CLASS_CHECKERS(AArch64CPUClass, AARCH64_CPU,
-                       TYPE_AARCH64_CPU)
-
-struct AArch64CPUClass {
-    /*< private >*/
-    ARMCPUClass parent_class;
-    /*< public >*/
-};
-
 void register_cp_regs_for_features(ARMCPU *cpu);
 void init_cpreg_list(ARMCPU *cpu);
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2b4bd20f9d..3ac650092f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1076,8 +1076,6 @@ struct ArchCPU {
 
 unsigned int gt_cntfrq_period_ns(ARMCPU *cpu);
 
-void arm_cpu_post_init(Object *obj);
-
 uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz);
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c97461e164..a2f59ac378 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1324,7 +1324,7 @@ unsigned int gt_cntfrq_period_ns(ARMCPU *cpu)
       NANOSECONDS_PER_SECOND / cpu->gt_cntfrq_hz : 1;
 }
 
-void arm_cpu_post_init(Object *obj)
+static void arm_cpu_post_init(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 611b233d23..1d3aff868d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1373,43 +1373,12 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
                                           "execution state ");
 }
 
-static void aarch64_cpu_instance_init(Object *obj)
-{
-    ARMCPUClass *acc = ARM_CPU_GET_CLASS(obj);
-
-    acc->info->initfn(obj);
-    arm_cpu_post_init(obj);
-}
-
-static void cpu_register_class_init(ObjectClass *oc, void *data)
-{
-    ARMCPUClass *acc = ARM_CPU_CLASS(oc);
-
-    acc->info = data;
-}
-
-void aarch64_cpu_register(const ARMCPUInfo *info)
-{
-    TypeInfo type_info = {
-        .parent = TYPE_AARCH64_CPU,
-        .instance_size = sizeof(ARMCPU),
-        .instance_init = aarch64_cpu_instance_init,
-        .class_size = sizeof(ARMCPUClass),
-        .class_init = info->class_init ?: cpu_register_class_init,
-        .class_data = (void *)info,
-    };
-
-    type_info.name = g_strdup_printf("%s-" TYPE_ARM_CPU, info->name);
-    type_register(&type_info);
-    g_free((void *)type_info.name);
-}
-
 static const TypeInfo aarch64_cpu_type_info = {
     .name = TYPE_AARCH64_CPU,
     .parent = TYPE_ARM_CPU,
     .instance_size = sizeof(ARMCPU),
     .abstract = true,
-    .class_size = sizeof(AArch64CPUClass),
+    .class_size = sizeof(ARMCPUClass),
     .class_init = aarch64_cpu_class_init,
 };
 
-- 
2.34.1


