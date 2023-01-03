Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF2D65C637
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:27:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrh-0000Li-8K; Tue, 03 Jan 2023 13:18:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClr5-0008KT-1n
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:45 -0500
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClr3-0005FO-Gh
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:42 -0500
Received: by mail-vk1-xa2d.google.com with SMTP id f184so11693113vkh.2
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wyr5V1dWDMqzJtGPzngC+jk55ZVA++3QMCuRXKZqttA=;
 b=Kq6RkKmGAD4JxZwhoyY+Iee5QDYces8Mf405BzHxPBOoVc3qcFn0X7wa0Q8aZB+RMb
 4qnSG+7EA2uGHlBSEtj84zQDzo1bCEyr3kgPmz/4rfFwfaMn6hS5qLveO5JZ5fMb3lab
 dfCe8JqEA5Mk1PLMgvOKp8ymvoKDE4pn0ZHY1QLOXOon0vvSyHuWrORuQgiA8t1XhW7/
 C2ZHNrunlOdlCQoaA9ydXa77+uMYzqDRCWv/MUxqgs2sGVE69h/lQWa4yA0uPBFH8IMD
 YJ2tdutKUgenjvwzsoyN2yg2STVn4zm+IjTUvh3zNUHwebVXQ7ke//FAXBNh5l6zR5SC
 KkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wyr5V1dWDMqzJtGPzngC+jk55ZVA++3QMCuRXKZqttA=;
 b=L53i9OVtvt+H0W2h9rjcS7IdvOyk49JMRFPEwKmNba+xbb65NgRYOiu+93Sr4t50pp
 ijCXxdvVx6iErCeDsVg5IG1dBbPoNZNyLXRurOi4y+Vtz2JcxRFqwLJQgh6BdP4L8Kjx
 bw57/dSC8nO7//7YAw70GGIY4xtTQd5zGwRTs/bWbJhFWVrUqFA3z+4pV0abA/HwvY9r
 aAcBYZlXI+7JE+1R936NAgzipX5pwXF2eQ39616QdFNRDFMFBxlrcKGu8z8qiO+KhUh1
 q8uVdvRtPrdWp4oY+S6QW57LUdWo8sdNSWoK86zrEQJUme4lsLUaVOAEU/FbuVVx+zsl
 iISg==
X-Gm-Message-State: AFqh2kqnVxdIdDxq3ZsaF3Q8j6kM5v9MvFogPFvP7TW1xxVGlJuiZLvv
 xw5HWjp5pI6IInB5wL30dKSzqCwCdbZOKLbzIH0=
X-Google-Smtp-Source: AMrXdXv3RHCHyU+PHEBzmgMN7e8Wp+p+pFM/qgbiZChizeWY1vjJ28HXKrTpxy34WKCwUb2s342B1Q==
X-Received: by 2002:a1f:24ce:0:b0:3d5:5cd4:8835 with SMTP id
 k197-20020a1f24ce000000b003d55cd48835mr13557926vkk.15.1672769860366; 
 Tue, 03 Jan 2023 10:17:40 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:17:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 17/40] target/arm: Copy cp_regs from ARMCPUClass
Date: Tue,  3 Jan 2023 10:16:23 -0800
Message-Id: <20230103181646.55711-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-vk1-xa2d.google.com
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

Create a hash table of cpregs in ARMCPUClass and copy to the
instance in arm_cpu_init.  Population of this new table will
come in a future patch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-qom.h |  3 +++
 target/arm/cpu.c     | 23 +++++++++++++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 832b2cccf9..36d7fa9779 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -111,6 +111,9 @@ struct ARMCPUClass {
     DeviceRealize parent_realize;
     ResettablePhases parent_phases;
 
+    /* Coprocessor information */
+    GHashTable *cp_regs;
+
     /* 'compatible' string for this CPU for Linux device trees */
     const char *dtb_compatible;
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a46fa424d3..da58f1fae7 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1178,14 +1178,29 @@ uint64_t arm_build_mp_affinity(int idx, uint8_t clustersz)
     return (Aff1 << ARM_AFF1_SHIFT) | Aff0;
 }
 
+static void copy_cp_regs_1(gpointer key, gpointer value, gpointer user)
+{
+    GHashTable *new_table = user;
+    ARMCPRegInfo *new_reg = g_memdup(value, sizeof(ARMCPRegInfo));
+    bool ok = g_hash_table_insert(new_table, key, new_reg);
+    g_assert(ok);
+}
+
+static GHashTable *copy_cp_regs(GHashTable *cp_regs)
+{
+    GHashTable *ret = g_hash_table_new_full(g_direct_hash, g_direct_equal,
+                                            NULL, g_free);
+
+    g_hash_table_foreach(cp_regs, copy_cp_regs_1, ret);
+    return ret;
+}
+
 static void arm_cpu_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     ARMCPUClass *acc = ARM_CPU_GET_CLASS(cpu);
 
     cpu_set_cpustate_pointers(cpu);
-    cpu->cp_regs = g_hash_table_new_full(g_direct_hash, g_direct_equal,
-                                         NULL, g_free);
 
     QLIST_INIT(&cpu->pre_el_change_hooks);
     QLIST_INIT(&cpu->el_change_hooks);
@@ -1219,6 +1234,8 @@ static void arm_cpu_initfn(Object *obj)
     cpu->gic_pribits = acc->gic_pribits;
     cpu->kvm_target = acc->kvm_target;
 
+    cpu->cp_regs = copy_cp_regs(acc->cp_regs);
+
 #ifdef CONFIG_USER_ONLY
 # ifdef TARGET_AARCH64
     /*
@@ -2337,6 +2354,8 @@ static void arm_cpu_leaf_class_init(ObjectClass *oc, void *data)
     const ARMCPUInfo *info = data;
 
     acc->info = info;
+    acc->cp_regs = g_hash_table_new_full(g_direct_hash, g_direct_equal,
+                                         NULL, g_free);
     if (info->class_init) {
         info->class_init(acc);
     }
-- 
2.34.1


