Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFDE2D3492
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:59:25 +0100 (CET)
Received: from localhost ([::1]:42152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmk4y-0001mw-52
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:59:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmiz5-0001WA-Gt
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:49:15 -0500
Received: from mx2.suse.de ([195.135.220.15]:43766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmiyz-0000xY-NB
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:49:15 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 73288ADAA;
 Tue,  8 Dec 2020 19:48:58 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC v9 17/32] accel/tcg: split TCG-only code from cpu_exec_realizefn
Date: Tue,  8 Dec 2020 20:48:24 +0100
Message-Id: <20201208194839.31305-18-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208194839.31305-1-cfontana@suse.de>
References: <20201208194839.31305-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 "Emilio G . Cota" <cota@braap.org>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

move away TCG-only code, make it compile only on TCG.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 accel/tcg/cpu-exec.c  | 28 +++++++++++++++++
 cpu.c                 | 70 ++++++++++++++++++++-----------------------
 hw/core/cpu.c         |  6 +++-
 include/hw/core/cpu.h |  8 +++++
 4 files changed, 74 insertions(+), 38 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 64cba89356..436dfbf155 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -801,6 +801,34 @@ int cpu_exec(CPUState *cpu)
     return ret;
 }
 
+void tcg_exec_realizefn(CPUState *cpu, Error **errp)
+{
+    static bool tcg_target_initialized;
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (!tcg_target_initialized) {
+        tcg_target_initialized = true;
+        cc->tcg_ops.initialize();
+    }
+    tlb_init(cpu);
+    qemu_plugin_vcpu_init_hook(cpu);
+
+#ifndef CONFIG_USER_ONLY
+    tcg_iommu_init_notifier_list(cpu);
+#endif /* !CONFIG_USER_ONLY */
+}
+
+/* undo the initializations in reverse order */
+void tcg_exec_unrealizefn(CPUState *cpu)
+{
+#ifndef CONFIG_USER_ONLY
+    tcg_iommu_free_notifier_list(cpu);
+#endif /* !CONFIG_USER_ONLY */
+
+    qemu_plugin_vcpu_exit_hook(cpu);
+    tlb_destroy(cpu);
+}
+
 #ifndef CONFIG_USER_ONLY
 
 void dump_drift_info(void)
diff --git a/cpu.c b/cpu.c
index 27ad096cc4..5cc8f181be 100644
--- a/cpu.c
+++ b/cpu.c
@@ -124,13 +124,35 @@ const VMStateDescription vmstate_cpu_common = {
 };
 #endif
 
+void cpu_exec_realizefn(CPUState *cpu, Error **errp)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    cpu_list_add(cpu);
+
+#ifdef CONFIG_TCG
+    /* NB: errp parameter is unused currently */
+    if (tcg_enabled()) {
+        tcg_exec_realizefn(cpu, errp);
+    }
+#endif /* CONFIG_TCG */
+
+#ifdef CONFIG_USER_ONLY
+    assert(cc->vmsd == NULL);
+#else
+    if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
+        vmstate_register(NULL, cpu->cpu_index, &vmstate_cpu_common, cpu);
+    }
+    if (cc->vmsd != NULL) {
+        vmstate_register(NULL, cpu->cpu_index, cc->vmsd, cpu);
+    }
+#endif /* CONFIG_USER_ONLY */
+}
+
 void cpu_exec_unrealizefn(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    tlb_destroy(cpu);
-    cpu_list_remove(cpu);
-
 #ifdef CONFIG_USER_ONLY
     assert(cc->vmsd == NULL);
 #else
@@ -140,8 +162,15 @@ void cpu_exec_unrealizefn(CPUState *cpu)
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
         vmstate_unregister(NULL, &vmstate_cpu_common, cpu);
     }
-    tcg_iommu_free_notifier_list(cpu);
 #endif
+#ifdef CONFIG_TCG
+    /* NB: errp parameter is unused currently */
+    if (tcg_enabled()) {
+        tcg_exec_unrealizefn(cpu);
+    }
+#endif /* CONFIG_TCG */
+
+    cpu_list_remove(cpu);
 }
 
 Property cpu_common_props[] = {
@@ -171,39 +200,6 @@ void cpu_exec_initfn(CPUState *cpu)
 #endif
 }
 
-void cpu_exec_realizefn(CPUState *cpu, Error **errp)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-#ifdef CONFIG_TCG
-    static bool tcg_target_initialized;
-#endif /* CONFIG_TCG */
-
-    cpu_list_add(cpu);
-
-#ifdef CONFIG_TCG
-    if (tcg_enabled() && !tcg_target_initialized) {
-        tcg_target_initialized = true;
-        cc->tcg_ops.initialize();
-    }
-#endif /* CONFIG_TCG */
-    tlb_init(cpu);
-
-    qemu_plugin_vcpu_init_hook(cpu);
-
-#ifdef CONFIG_USER_ONLY
-    assert(cc->vmsd == NULL);
-#else /* !CONFIG_USER_ONLY */
-    if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
-        vmstate_register(NULL, cpu->cpu_index, &vmstate_cpu_common, cpu);
-    }
-    if (cc->vmsd != NULL) {
-        vmstate_register(NULL, cpu->cpu_index, cc->vmsd, cpu);
-    }
-
-    tcg_iommu_init_notifier_list(cpu);
-#endif
-}
-
 const char *parse_cpu_option(const char *cpu_option)
 {
     ObjectClass *oc;
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 994a12cb35..1f04aab16b 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -199,6 +199,10 @@ static bool cpu_common_virtio_is_big_endian(CPUState *cpu)
     return target_words_bigendian();
 }
 
+/*
+ * XXX the following #if is always true because this is a common_ss
+ * module, so target CONFIG_* is never defined.
+ */
 #if !defined(CONFIG_USER_ONLY)
 GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
 {
@@ -340,9 +344,9 @@ static void cpu_common_realizefn(DeviceState *dev, Error **errp)
 static void cpu_common_unrealizefn(DeviceState *dev)
 {
     CPUState *cpu = CPU(dev);
+
     /* NOTE: latest generic point before the cpu is fully unrealized */
     trace_fini_vcpu(cpu);
-    qemu_plugin_vcpu_exit_hook(cpu);
     cpu_exec_unrealizefn(cpu);
 }
 
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c93b08a0fb..ea648d52ad 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1119,10 +1119,18 @@ AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx);
 void QEMU_NORETURN cpu_abort(CPUState *cpu, const char *fmt, ...)
     GCC_FMT_ATTR(2, 3);
 extern Property cpu_common_props[];
+
+/* $(top_srcdir)/cpu.c */
 void cpu_exec_initfn(CPUState *cpu);
 void cpu_exec_realizefn(CPUState *cpu, Error **errp);
 void cpu_exec_unrealizefn(CPUState *cpu);
 
+#ifdef CONFIG_TCG
+/* accel/tcg/cpu-exec.c */
+void tcg_exec_realizefn(CPUState *cpu, Error **errp);
+void tcg_exec_unrealizefn(CPUState *cpu);
+#endif /* CONFIG_TCG */
+
 /**
  * target_words_bigendian:
  * Returns true if the (default) endianness of the target is big endian,
-- 
2.26.2


