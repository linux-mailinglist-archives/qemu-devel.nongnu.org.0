Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE7065C608
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:24:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClre-0000FW-Af; Tue, 03 Jan 2023 13:18:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqd-0008Hr-5h
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:22 -0500
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqa-0005C0-Ix
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:14 -0500
Received: by mail-vs1-xe2f.google.com with SMTP id 3so32565189vsq.7
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ox6lsVTv8H7bR8+2oGArM6AIjDyJ3hXTv/IB/m/B3mo=;
 b=O4U5yWLi2TkgpJ2sRi0svKPJKcgBeALOPFCdTuHX9Wr8Ol4asCvQR5rdb7h1Lp4s5W
 X9cKJ3NHWUq/1kPDy3xSi7sgvWFO2RBwdJzv5oBdJFzREb1FKLEnMdak9L7vedilUtUr
 kOCR5y0USU9JDgWcZ4Pkaao4WanGRWhC4JnbdZBixfyks7NBgxmdvUVYXRjrcLYIBRdz
 nihVQt1NLpdLs2WxANVkDPaed3/3Im8kGks9BJzP5ANzoh1cozvfemFHCkotFIbTaU5a
 Zn/goluhN2HKVabspJGnQg0mx/q+d6j/4OF6RnK6EXkk8qxsy7H7Yzq8xVP9uxWTFEfW
 /bJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ox6lsVTv8H7bR8+2oGArM6AIjDyJ3hXTv/IB/m/B3mo=;
 b=yeRNOjWHl6nfZHA3r3dUaQbbC+Cagg916fyuEJhKaGz5U4w+upJlKBodiT8sjCDnEU
 WIY8EdgAGJ9zdEQL2C/TjbEjDU0Ytd16uNm2ZcEEF1IHGdsKu1QU5GAVZrBp0uH2UKmm
 wZw0kHufPuebQ24FqyxVVs6XGBgsfc3x1axyZqdIbk/yMQubCLLTJty7xTC8Cxu3ywAD
 WmtlMS5inJFWXwQqhL42pX7JTp7PjNDQb3D2P+oMJ30WSVKNoe/ezeJJOIZ3VjHhx0V6
 eLFOt6BaymLqpfLdvqM9zaTA9Jt+WjQx1U+az6sGQFIGTmoNeB2H4THtBUxPeDA9cwhC
 hosw==
X-Gm-Message-State: AFqh2kqJYmbo9gQn/D/Ivcl7eyO2PyJablOjzNczolkmFzO7JVmgyR01
 JI0SPvn56gE99Ubfrv5rOY2wJWXbN3vgLQ7Pmuk=
X-Google-Smtp-Source: AMrXdXve3CdxD1Q25g6/PqkLjVah2/PH5BAF02pCzhTd9RW9zJL3+L/XVsvgHPKJuW79jvOAYqBBZQ==
X-Received: by 2002:a67:e05a:0:b0:3ce:9149:5360 with SMTP id
 n26-20020a67e05a000000b003ce91495360mr3321799vsl.7.1672769831526; 
 Tue, 03 Jan 2023 10:17:11 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:17:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 07/40] target/arm: Create TYPE_ARM_V7M_CPU
Date: Tue,  3 Jan 2023 10:16:13 -0800
Message-Id: <20230103181646.55711-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe2f.google.com
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

Create a new intermediate abstract class for v7m, like we do for
aarch64. The initialization of ARMCPUClass.info follows the
concrete class, so remove that init from arm_v7m_class_init.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-qom.h |  6 ++++++
 target/arm/cpu_tcg.c | 36 ++++++++++++++++++++++--------------
 2 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 184b3e3726..ae31289582 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -26,6 +26,7 @@
 struct arm_boot_info;
 
 #define TYPE_ARM_CPU "arm-cpu"
+#define TYPE_ARM_V7M_CPU "arm-v7m-cpu"
 #define TYPE_AARCH64_CPU "aarch64-cpu"
 
 OBJECT_DECLARE_CPU_TYPE(ARMCPU, ARMCPUClass, ARM_CPU)
@@ -45,6 +46,11 @@ static inline void arm_cpu_register(const ARMCPUInfo *info)
     arm_cpu_register_parent(info, TYPE_ARM_CPU);
 }
 
+static inline void arm_v7m_cpu_register(const ARMCPUInfo *info)
+{
+    arm_cpu_register_parent(info, TYPE_ARM_V7M_CPU);
+}
+
 static inline void aarch64_cpu_register(const ARMCPUInfo *info)
 {
     arm_cpu_register_parent(info, TYPE_AARCH64_CPU);
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 568cbcfc52..d566a815d3 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -1056,10 +1056,8 @@ static const struct TCGCPUOps arm_v7m_tcg_ops = {
 
 static void arm_v7m_class_init(ObjectClass *oc, void *data)
 {
-    ARMCPUClass *acc = ARM_CPU_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
 
-    acc->info = data;
 #ifdef CONFIG_TCG
     cc->tcg_ops = &arm_v7m_tcg_ops;
 #endif /* CONFIG_TCG */
@@ -1149,18 +1147,6 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
     { .name = "cortex-a8",   .initfn = cortex_a8_initfn },
     { .name = "cortex-a9",   .initfn = cortex_a9_initfn },
     { .name = "cortex-a15",  .initfn = cortex_a15_initfn },
-    { .name = "cortex-m0",   .initfn = cortex_m0_initfn,
-                             .class_init = arm_v7m_class_init },
-    { .name = "cortex-m3",   .initfn = cortex_m3_initfn,
-                             .class_init = arm_v7m_class_init },
-    { .name = "cortex-m4",   .initfn = cortex_m4_initfn,
-                             .class_init = arm_v7m_class_init },
-    { .name = "cortex-m7",   .initfn = cortex_m7_initfn,
-                             .class_init = arm_v7m_class_init },
-    { .name = "cortex-m33",  .initfn = cortex_m33_initfn,
-                             .class_init = arm_v7m_class_init },
-    { .name = "cortex-m55",  .initfn = cortex_m55_initfn,
-                             .class_init = arm_v7m_class_init },
     { .name = "cortex-r5",   .initfn = cortex_r5_initfn },
     { .name = "cortex-r5f",  .initfn = cortex_r5f_initfn },
     { .name = "ti925t",      .initfn = ti925t_initfn },
@@ -1187,6 +1173,24 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
 #endif
 };
 
+static const ARMCPUInfo arm_v7m_tcg_cpus[] = {
+    { .name = "cortex-m0",   .initfn = cortex_m0_initfn },
+    { .name = "cortex-m3",   .initfn = cortex_m3_initfn },
+    { .name = "cortex-m4",   .initfn = cortex_m4_initfn },
+    { .name = "cortex-m7",   .initfn = cortex_m7_initfn },
+    { .name = "cortex-m33",  .initfn = cortex_m33_initfn },
+    { .name = "cortex-m55",  .initfn = cortex_m55_initfn },
+};
+
+static const TypeInfo arm_v7m_cpu_type_info = {
+    .name = TYPE_ARM_V7M_CPU,
+    .parent = TYPE_ARM_CPU,
+    .instance_size = sizeof(ARMCPU),
+    .abstract = true,
+    .class_size = sizeof(ARMCPUClass),
+    .class_init = arm_v7m_class_init,
+};
+
 static const TypeInfo idau_interface_type_info = {
     .name = TYPE_IDAU_INTERFACE,
     .parent = TYPE_INTERFACE,
@@ -1197,10 +1201,14 @@ static void arm_tcg_cpu_register_types(void)
 {
     size_t i;
 
+    type_register_static(&arm_v7m_cpu_type_info);
     type_register_static(&idau_interface_type_info);
     for (i = 0; i < ARRAY_SIZE(arm_tcg_cpus); ++i) {
         arm_cpu_register(&arm_tcg_cpus[i]);
     }
+    for (i = 0; i < ARRAY_SIZE(arm_v7m_tcg_cpus); ++i) {
+        arm_v7m_cpu_register(&arm_v7m_tcg_cpus[i]);
+    }
 }
 
 type_init(arm_tcg_cpu_register_types)
-- 
2.34.1


