Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 599733116BE
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:19:53 +0100 (CET)
Received: from localhost ([::1]:51544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8AOG-0005Wj-Bu
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:19:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A3B-0002cQ-Bk
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:58:05 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:55624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A30-0003ZH-BQ
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:58:04 -0500
Received: by mail-pj1-x1033.google.com with SMTP id s24so4425903pjp.5
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p24OmppzTkk6imjU3BHdTzuVQpvNCrU4ZaFU25HopQk=;
 b=xtg8lqfw1Trhgjziu5+aQ/gdu/2tZ2IB7qmvfttRHxFJBP2YwzX9eUJxn1jO73vWkw
 osgufH4FrPT93jCtQr4VluOs6amKO2Wd4hiePKwS/mh2OVZkSkJJKV/+GEPrhdJZoa7L
 mkuEWN6efC7g/fHuF1C5163uxzEOKSSP78XycR4TNSYWXkdWQAous5q1Gtj+83V3sxOj
 gs6yZ+pODU472ovhzYmM3t9hgq9OQQReUmvNcaCatVe36WF2V1yHxlgI+F3NsB/IeE70
 SueeimrFRafMyVjHO6HzEwHq7BQ8hgyS8RLyqJwz3M53u3K16+awiyMYb3oX63yZuS7P
 ieYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p24OmppzTkk6imjU3BHdTzuVQpvNCrU4ZaFU25HopQk=;
 b=WfsgKBdUG9XVyujGaB+XwLVwWxXk9GleCVCCoIOG3lUzRcesxrlRqPmZdZ74lwZeeg
 4aPULYY70YORmC1mxXSkAf6QPwwAcB/gaV80PEJN0+6G6JxmwoYpjMQFJMSC7ORyzH0A
 IKgf/tL1uHAs/0F1rvL0NHhzRQ//w8igytfFEjWeTpiC25AkgtfYc+n1BKQi/Dryaqil
 cXDPCCZnLTH3+fsd8YgKfRsL50HTCmj7yCrRQooJ2AHrTpGU+RCucKcYOi5bpgc5U15F
 gTGPmkL8BoYyUdgW3g/4axVvblONEvGuvounYJggO/hoUBtvzzise7Peah8iVwq2mj8X
 DkqA==
X-Gm-Message-State: AOAM533oN+I2JEz5pEee8LV+4K/ZKvYpjtNEcAG8Oixo6NpBeCUUBPeh
 Eq0tbnJEgVztHZE9NznbUbq7d6Pcv3RnxmEt
X-Google-Smtp-Source: ABdhPJxQ0pWZQMald5awKwH6GKn+zCBcaVIvEyxwf8ur5YEvhOWwwNNpn4ZfN7dP1vVJjkVBePJ93A==
X-Received: by 2002:a17:902:6808:b029:e2:b405:fc0d with SMTP id
 h8-20020a1709026808b02900e2b405fc0dmr4026457plk.10.1612565871471; 
 Fri, 05 Feb 2021 14:57:51 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/46] accel/tcg: split TCG-only code from cpu_exec_realizefn
Date: Fri,  5 Feb 2021 12:56:35 -1000
Message-Id: <20210205225650.1330794-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

move away TCG-only code, make it compile only on TCG.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
[claudio: moved the prototypes from hw/core/cpu.h to exec/cpu-all.h]
Signed-off-by: Claudio Fontana <cfontana@suse.de>
Message-Id: <20210204163931.7358-4-cfontana@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h | 11 +++++--
 include/hw/core/cpu.h  |  2 ++
 accel/tcg/cpu-exec.c   | 28 +++++++++++++++++
 cpu.c                  | 70 ++++++++++++++++++++----------------------
 hw/core/cpu.c          |  6 +++-
 5 files changed, 77 insertions(+), 40 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 4b5408c341..cfb1d79331 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -410,19 +410,26 @@ static inline bool tlb_hit(target_ulong tlb_addr, target_ulong addr)
 }
 
 #ifdef CONFIG_TCG
+/* accel/tcg/cpu-exec.c */
 void dump_drift_info(void);
+/* accel/tcg/translate-all.c */
 void dump_exec_info(void);
 void dump_opcount_info(void);
 #endif /* CONFIG_TCG */
 
 #endif /* !CONFIG_USER_ONLY */
 
+#ifdef CONFIG_TCG
+/* accel/tcg/cpu-exec.c */
+int cpu_exec(CPUState *cpu);
+void tcg_exec_realizefn(CPUState *cpu, Error **errp);
+void tcg_exec_unrealizefn(CPUState *cpu);
+#endif /* CONFIG_TCG */
+
 /* Returns: 0 on success, -1 on error */
 int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
                         void *ptr, target_ulong len, bool is_write);
 
-int cpu_exec(CPUState *cpu);
-
 /**
  * cpu_set_cpustate_pointers(cpu)
  * @cpu: The cpu object
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 26b89fd7a4..d0b17dcc4c 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1126,6 +1126,8 @@ AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx);
 
 void QEMU_NORETURN cpu_abort(CPUState *cpu, const char *fmt, ...)
     GCC_FMT_ATTR(2, 3);
+
+/* $(top_srcdir)/cpu.c */
 void cpu_exec_initfn(CPUState *cpu);
 void cpu_exec_realizefn(CPUState *cpu, Error **errp);
 void cpu_exec_unrealizefn(CPUState *cpu);
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 6d017e46dd..5628a156d1 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -828,6 +828,34 @@ int cpu_exec(CPUState *cpu)
     return ret;
 }
 
+void tcg_exec_realizefn(CPUState *cpu, Error **errp)
+{
+    static bool tcg_target_initialized;
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (!tcg_target_initialized) {
+        cc->tcg_ops.initialize();
+        tcg_target_initialized = true;
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
index 79a2bf12b3..bfbe5a66f9 100644
--- a/cpu.c
+++ b/cpu.c
@@ -124,12 +124,34 @@ const VMStateDescription vmstate_cpu_common = {
 };
 #endif
 
-void cpu_exec_unrealizefn(CPUState *cpu)
+void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    tlb_destroy(cpu);
-    cpu_list_remove(cpu);
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
+void cpu_exec_unrealizefn(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
 
 #ifdef CONFIG_USER_ONLY
     assert(cc->vmsd == NULL);
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
 
 void cpu_exec_initfn(CPUState *cpu)
@@ -156,39 +185,6 @@ void cpu_exec_initfn(CPUState *cpu)
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
index 7553411653..57542b6906 100644
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
 
-- 
2.25.1


