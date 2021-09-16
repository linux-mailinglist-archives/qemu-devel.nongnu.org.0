Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9021940DEFA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 18:04:52 +0200 (CEST)
Received: from localhost ([::1]:35440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtsZ-0001WV-LG
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 12:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLo-0001q0-UN
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:31:00 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:40907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLf-0002dh-1S
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:31:00 -0400
Received: by mail-pf1-x429.google.com with SMTP id y8so6211238pfa.7
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pv5WSTG+D7D0H6LWYGDgFu80+f0Xh3zAIIrMYFZZVwg=;
 b=uVnnWtrEhdpZ1DDpC5jP48KC9ewhAJ36uWBAEbe1Rvcl13XVtuqKAZzbsT0FZ76wX6
 2zBHhMc96EbznfEN3hdFgZusNHjYB7NDjsnP+EoQqxiRrfei24b93FdGiqLUMlEcCFxk
 GPZo3dwwRNcWG5mFsLrCsoDuXf1duYoDztYjBCzjoSLvl8wfanx+5Wgjjl+E9lWVI6n8
 3AinT0oHaxGR5jzh3gKFLAl9Guf5D1pX5xdckOH0f3Hsa0meqINmFBHKE23eyRnO0BHZ
 GnaZgNo/T9Jk+bbgQNsCjDPo1ZKcodz52JYAZbcWITuFCxIOxB7TYuv5wJyQsA+dOuak
 XzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pv5WSTG+D7D0H6LWYGDgFu80+f0Xh3zAIIrMYFZZVwg=;
 b=owjDzJidie1zruSX1q5l0Z0nZkgMNnkYz+cJIsdsQZi9hY2+cr7CfqOgocagDlF2pK
 7GLtQXCPuawcNeAofxgLpvqmEB/BN0GYmF4Z/9N8NkW1SxzzcmrHPHiHVL5z+Rq+6wmb
 4TppH/vEUfgddqeWn28IljZCZePqiphqnRByHBFEmLDHBjmIO5RE2cRo6KQMjhZlSEQm
 DEMa865wN4dfnKhmdrn0gynlPNT02kNA6LJ0GOy5qqkKhc2IcARDvv4SwVmGrounlgDS
 ZPy6/x6Qeki6HU6AHx1psfGr7BoYFPfrcd5rJ4iJ4fOzyEjzLfEpfBGSECTqWNcr7swu
 oBuQ==
X-Gm-Message-State: AOAM531noIL4ME0a6gLaegPdt66QFPbTEI8TrSUmUar9lX9BwI8rWbh7
 V8EZQjbLxAi0NXi/vnmcK0pC3VLE/KRASA==
X-Google-Smtp-Source: ABdhPJwwl3NflkQa6+rheHjsVt3lpSM5CXjYI1E7x08oSnC6t4McNjLSeavV9jzS08sk9o6gmVcAIQ==
X-Received: by 2002:aa7:9395:0:b0:438:9980:5c94 with SMTP id
 t21-20020aa79395000000b0043899805c94mr5754411pfe.81.1631806247872; 
 Thu, 16 Sep 2021 08:30:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/35] accel: Add missing AccelOpsClass::has_work() and drop
 SysemuCPUOps one
Date: Thu, 16 Sep 2021 08:30:21 -0700
Message-Id: <20210916153025.1944763-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Durrant <paul@xen.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

cpu_common_has_work() is the default has_work() implementation
and returns 'false'.

Explicit it for the QTest / HAX / HVF / NVMM / Xen accelerators
and remove cpu_common_has_work().

Since there are no more implementations of SysemuCPUOps::has_work,
remove it along with the assertion in cpu_has_work().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Paul Durrant <paul@xen.org>
Message-Id: <20210912172731.789788-31-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h             | 2 --
 accel/hvf/hvf-accel-ops.c         | 6 ++++++
 accel/qtest/qtest.c               | 6 ++++++
 accel/xen/xen-all.c               | 6 ++++++
 hw/core/cpu-common.c              | 6 ------
 softmmu/cpus.c                    | 9 ++-------
 target/i386/hax/hax-accel-ops.c   | 6 ++++++
 target/i386/nvmm/nvmm-accel-ops.c | 6 ++++++
 8 files changed, 32 insertions(+), 15 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index e2dd171a13..c64709b898 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -89,7 +89,6 @@ struct SysemuCPUOps;
  * instantiatable CPU type.
  * @parse_features: Callback to parse command line arguments.
  * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
- * @has_work: Callback for checking if there is work to do.
  * @memory_rw_debug: Callback for GDB memory access.
  * @dump_state: Callback for dumping state.
  * @get_arch_id: Callback for getting architecture-dependent CPU ID.
@@ -132,7 +131,6 @@ struct CPUClass {
     void (*parse_features)(const char *typename, char *str, Error **errp);
 
     int reset_dump_flags;
-    bool (*has_work)(CPUState *cpu);
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index d1691be989..53c427ee42 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -446,6 +446,11 @@ static void hvf_start_vcpu_thread(CPUState *cpu)
                        cpu, QEMU_THREAD_JOINABLE);
 }
 
+static bool hvf_cpu_has_work(CPUState *cpu)
+{
+    return false;
+}
+
 static void hvf_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
@@ -456,6 +461,7 @@ static void hvf_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_post_init = hvf_cpu_synchronize_post_init;
     ops->synchronize_state = hvf_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = hvf_cpu_synchronize_pre_loadvm;
+    ops->has_work = hvf_cpu_has_work;
 };
 static const TypeInfo hvf_accel_ops_type = {
     .name = ACCEL_OPS_NAME("hvf"),
diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index 7e6b8110d5..eb5a17cef1 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -47,12 +47,18 @@ static const TypeInfo qtest_accel_type = {
 };
 module_obj(TYPE_QTEST_ACCEL);
 
+static bool qtest_cpu_has_work(CPUState *cpu)
+{
+    return false;
+}
+
 static void qtest_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = dummy_start_vcpu_thread;
     ops->get_virtual_clock = qtest_get_virtual_clock;
+    ops->has_work = qtest_cpu_has_work;
 };
 
 static const TypeInfo qtest_accel_ops_type = {
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 69aa7d018b..fe5a37fa2e 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -215,11 +215,17 @@ static const TypeInfo xen_accel_type = {
     .class_init = xen_accel_class_init,
 };
 
+static bool xen_cpu_has_work(CPUState *cpu)
+{
+    return false;
+}
+
 static void xen_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = dummy_start_vcpu_thread;
+    ops->has_work = xen_cpu_has_work;
 }
 
 static const TypeInfo xen_accel_ops_type = {
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index e2f5a64604..5ed1ccdfdd 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -143,11 +143,6 @@ static void cpu_common_reset(DeviceState *dev)
     }
 }
 
-static bool cpu_common_has_work(CPUState *cs)
-{
-    return false;
-}
-
 ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
 {
     CPUClass *cc = CPU_CLASS(object_class_by_name(typename));
@@ -279,7 +274,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
 
     k->parse_features = cpu_common_parse_features;
     k->get_arch_id = cpu_common_get_arch_id;
-    k->has_work = cpu_common_has_work;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 6bce52ce56..e6dad2243c 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -251,13 +251,8 @@ void cpu_interrupt(CPUState *cpu, int mask)
 
 bool cpu_has_work(CPUState *cpu)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cpus_accel->has_work) {
-        return cpus_accel->has_work(cpu);
-    }
-    g_assert(cc->has_work);
-    return cc->has_work(cpu);
+    g_assert(cpus_accel->has_work);
+    return cpus_accel->has_work(cpu);
 }
 
 static int do_vm_stop(RunState state, bool send_stop)
diff --git a/target/i386/hax/hax-accel-ops.c b/target/i386/hax/hax-accel-ops.c
index 136630e9b2..5407ba17ea 100644
--- a/target/i386/hax/hax-accel-ops.c
+++ b/target/i386/hax/hax-accel-ops.c
@@ -74,6 +74,11 @@ static void hax_start_vcpu_thread(CPUState *cpu)
 #endif
 }
 
+static bool hax_cpu_has_work(CPUState *cpu)
+{
+    return false;
+}
+
 static void hax_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
@@ -85,6 +90,7 @@ static void hax_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_post_init = hax_cpu_synchronize_post_init;
     ops->synchronize_state = hax_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = hax_cpu_synchronize_pre_loadvm;
+    ops->has_work = hax_cpu_has_work;
 }
 
 static const TypeInfo hax_accel_ops_type = {
diff --git a/target/i386/nvmm/nvmm-accel-ops.c b/target/i386/nvmm/nvmm-accel-ops.c
index f788f75289..36296f79ff 100644
--- a/target/i386/nvmm/nvmm-accel-ops.c
+++ b/target/i386/nvmm/nvmm-accel-ops.c
@@ -83,6 +83,11 @@ static void nvmm_kick_vcpu_thread(CPUState *cpu)
     cpus_kick_thread(cpu);
 }
 
+static bool nvmm_cpu_has_work(CPUState *cpu)
+{
+    return false;
+}
+
 static void nvmm_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
@@ -94,6 +99,7 @@ static void nvmm_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_post_init = nvmm_cpu_synchronize_post_init;
     ops->synchronize_state = nvmm_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = nvmm_cpu_synchronize_pre_loadvm;
+    ops->has_work = nvmm_cpu_has_work;
 }
 
 static const TypeInfo nvmm_accel_ops_type = {
-- 
2.25.1


