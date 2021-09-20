Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CCF4128FA
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:41:51 +0200 (CEST)
Received: from localhost ([::1]:52818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRyw-00006p-CY
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR87-0006Te-7w
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:47:17 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR84-0003Ue-7F
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:47:14 -0400
Received: by mail-wr1-x432.google.com with SMTP id u15so33601174wru.6
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1fT2quxplJ5GzjL7Rxg21kKvMAH6bBYwpkK2l5yjvQo=;
 b=R8nuokHfBefjPDnD6JhEgV32Lfk5fqb6cFKS7gvVlAZeqetJoBTdz/dthkWy1xSz2N
 23GgWn/RdyZxbw1guhB8G5eUbi7AOmaca0QynJL0RujEpFb1Lq+I707tO28kt9tswTn3
 hbCEJwOzb+XcLj3XpRDyhcNDfJpjllC+dlItsuhoDgU1UaIwYZKZFk2hJuz6N0qwf7mF
 vnCHM1ikzGsuGQfw6XRpYVLGg4pJuzmgE7sdbsiFhfVq8U/CxqC4ZphX4bGdBb5UYT/x
 7hic92Cl6Jf1oLqv1ENtXq0mq7PmqR4fP7WjQzMT/W0PpNVBfeIzu2T7TSAFCScJHRvY
 yPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1fT2quxplJ5GzjL7Rxg21kKvMAH6bBYwpkK2l5yjvQo=;
 b=OcAhOkdx7Lz+6qZHvuqccEQWHSVia3qE3N3g5v5w2kqE2PBydnyQmc0Te9hXSuyPaf
 ukf75CiJGQa+exLBf/WTlBz3dStP/BsFZKpXJt8iVd0BG4oXjOdeaiCTx7mtoZBUJGag
 7iyoJUSwEVz68JksyT7u5oHvzlaZs0nHgCI8Pk44eH8Rb34wHQUXpfxT6LEJ1I9DvswN
 8QBPHmgk4jXTrDD1v862vmJm4zUDiglEYh77A4cGg0eivd12G0LtTHOkhG35VpXCynNh
 LvHM7WnOBbTJefGN5w5KYRdHoRSx1ESWAs+d/6Tr5XX7sMCKv8+4pSW/NFWsudys9Cia
 ZaGQ==
X-Gm-Message-State: AOAM532Bl9MtzHvmisDJSGKLPNTLfAjkgrXZOj1r9viL8cBzHqkgqZeZ
 eeMydIfci8kQ8+aIXpzM+Eqkl1mqSBc=
X-Google-Smtp-Source: ABdhPJyR5An0CuA/D7A6BVciKJk8k63wZbCqLYIkkkWVZPbBsC76SiV6zbcI3qbRL+BtQuhbhK3XOQ==
X-Received: by 2002:a05:600c:4fc7:: with SMTP id
 o7mr1116578wmq.91.1632174430793; 
 Mon, 20 Sep 2021 14:47:10 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 l124sm732345wml.8.2021.09.20.14.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:47:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 31/31] accel: Add missing AccelOpsClass::has_work() and
 drop SysemuCPUOps one
Date: Mon, 20 Sep 2021 23:44:47 +0200
Message-Id: <20210920214447.2998623-32-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Durrant <paul@xen.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cpu_common_has_work() is the default has_work() implementation
and returns 'false'.

Explicit it for the QTest / HAX / HVF / NVMM / Xen accelerators
and remove cpu_common_has_work().

Since there are no more implementations of SysemuCPUOps::has_work,
remove it along with the assertion in cpu_has_work().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Paul Durrant <paul@xen.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h             |  2 --
 accel/hvf/hvf-accel-ops.c         |  6 ++++++
 accel/qtest/qtest.c               |  6 ++++++
 accel/xen/xen-all.c               |  6 ++++++
 hw/core/cpu-common.c              |  6 ------
 softmmu/cpus.c                    | 11 ++---------
 target/i386/hax/hax-accel-ops.c   |  6 ++++++
 target/i386/nvmm/nvmm-accel-ops.c |  6 ++++++
 8 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index e2dd171a13f..c64709b898c 100644
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
index d1691be9896..53c427ee42e 100644
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
index 7e6b8110d52..eb5a17cef18 100644
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
index 69aa7d018b2..fe5a37fa2e6 100644
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
index e2f5a646046..5ed1ccdfdd5 100644
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
index 98b4049aba7..e6dad2243c6 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -251,15 +251,8 @@ void cpu_interrupt(CPUState *cpu, int mask)
 
 bool cpu_has_work(CPUState *cpu)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cc->has_work) {
-        return cc->has_work(cpu);
-    }
-    if (cpus_accel->has_work) {
-        return cpus_accel->has_work(cpu);
-    }
-    g_assert_not_reached();
+    g_assert(cpus_accel->has_work);
+    return cpus_accel->has_work(cpu);
 }
 
 static int do_vm_stop(RunState state, bool send_stop)
diff --git a/target/i386/hax/hax-accel-ops.c b/target/i386/hax/hax-accel-ops.c
index 136630e9b23..5407ba17eaf 100644
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
index f788f75289f..36296f79ff8 100644
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
2.31.1


