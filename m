Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AFD31172B
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:35:06 +0100 (CET)
Received: from localhost ([::1]:34852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8Acy-0005aZ-V7
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:35:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A3W-0003Im-VK
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:58:26 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:36598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A3U-0003lX-83
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:58:26 -0500
Received: by mail-pj1-x1033.google.com with SMTP id gx20so4657100pjb.1
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZpT0a90ks+5DiP5UMdif8NtnBjPr0Hz5e7GTI8mhROE=;
 b=zhqRtXygHDduFVHeM9fJqYeV3OdwbVt5Ckjx9axmOIn697tDejuzYkw5t+CHaHZjRl
 HLkMaXDuhm4nElJvu44wrHVAQvQpUDI/hKCsIW237sQrq3HloMbfUHm2GydZLju4Hebr
 1IAB2HGTWG7TAf97YfUGYj49j7Vf0TMc5PsYE+TVHJTImATegBHq++r16MENOIYwMHP+
 CGXtXNnoeegriKTTEDvuH8ecnDeyGNdOWbEc+FW/LXCRJSSCJ6E62KgeNeNwWKRURJ2C
 s4PnBY+JVWLuWMeoG9+LeZEM2WF4jG4Lc6zqXjxPjqkfmzZSiqQs88yvzbO4sxQnCFZu
 RMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZpT0a90ks+5DiP5UMdif8NtnBjPr0Hz5e7GTI8mhROE=;
 b=o26iEzawA6FqfwsfTH+7i271VP2voZ21D4hyRUG1gA1LhmosbieCSXLFfN+ITJaVLL
 RbIyVi70Sc9tYCfsZ93BrH8u+l/6yPjh/5UBbPFHDRKL02G1T2E5fVapQCc5AdwdAxce
 iEikG2G9kAiB958lGQR7J1iWripySsgx0bifJLL7pe8ngKnvGFgqYVOqK3YieJoQiyDS
 MPNKWQGJ1i4P7bPSAHF/b+pEi49g6XNFvhXYbGyv/+OgS30e0ep1YHp/fMqsRuUWrUMW
 TkXt3ZJxWXVZD8f1XpJ6GwoH40OuHWWBtYcxTVKhkbriCT4Z78KlJ8yQbmpLjkIZgTFb
 8C+A==
X-Gm-Message-State: AOAM530oqN1DIgJ05R/+cu9NOUlZ3Ggj965evrEB3KXDZfLRn3YN/qxj
 87iTD0b1zFmMfHcUbuP3dsIUoSKUNtc0o8iP
X-Google-Smtp-Source: ABdhPJyZ66WBa4QfvqCd7JMk+BPEvdiS5alUf/HY0FD9qO2gLiXa/OPCqJqanS0A68mL87l97xdBDA==
X-Received: by 2002:a17:90a:d09:: with SMTP id
 t9mr6526999pja.139.1612565901807; 
 Fri, 05 Feb 2021 14:58:21 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:58:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 46/46] accel: introduce AccelCPUClass extending CPUClass
Date: Fri,  5 Feb 2021 12:56:50 -1000
Message-Id: <20210205225650.1330794-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: peter.maydell@linaro.org, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

add a new optional interface to CPUClass, which allows accelerators
to extend the CPUClass with additional accelerator-specific
initializations.

This will allow to separate the target cpu code that is specific
to each accelerator, and register it automatically with object
hierarchy lookup depending on accelerator code availability,
as part of the accel_init_interfaces() initialization step.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Message-Id: <20210204163931.7358-19-cfontana@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/accel-cpu.h | 38 ++++++++++++++++++++++++++++++++
 include/hw/core/cpu.h       |  4 ++++
 accel/accel-common.c        | 44 +++++++++++++++++++++++++++++++++++++
 MAINTAINERS                 |  1 +
 4 files changed, 87 insertions(+)
 create mode 100644 include/hw/core/accel-cpu.h

diff --git a/include/hw/core/accel-cpu.h b/include/hw/core/accel-cpu.h
new file mode 100644
index 0000000000..24a6697412
--- /dev/null
+++ b/include/hw/core/accel-cpu.h
@@ -0,0 +1,38 @@
+/*
+ * Accelerator interface, specializes CPUClass
+ * This header is used only by target-specific code.
+ *
+ * Copyright 2021 SUSE LLC
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef ACCEL_CPU_H
+#define ACCEL_CPU_H
+
+/*
+ * This header is used to define new accelerator-specific target-specific
+ * accelerator cpu subclasses.
+ * It uses CPU_RESOLVING_TYPE, so this is clearly target-specific.
+ *
+ * Do not try to use for any other purpose than the implementation of new
+ * subclasses in target/, or the accel implementation itself in accel/
+ */
+
+#define TYPE_ACCEL_CPU "accel-" CPU_RESOLVING_TYPE
+#define ACCEL_CPU_NAME(name) (name "-" TYPE_ACCEL_CPU)
+typedef struct AccelCPUClass AccelCPUClass;
+DECLARE_CLASS_CHECKERS(AccelCPUClass, ACCEL_CPU, TYPE_ACCEL_CPU)
+
+typedef struct AccelCPUClass {
+    /*< private >*/
+    ObjectClass parent_class;
+    /*< public >*/
+
+    void (*cpu_class_init)(CPUClass *cc);
+    void (*cpu_instance_init)(CPUState *cpu);
+    void (*cpu_realizefn)(CPUState *cpu, Error **errp);
+} AccelCPUClass;
+
+#endif /* ACCEL_CPU_H */
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 4f6c6b18c9..38d813c389 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -79,6 +79,9 @@ struct TranslationBlock;
 /* see tcg-cpu-ops.h */
 struct TCGCPUOps;
 
+/* see accel-cpu.h */
+struct AccelCPUClass;
+
 /**
  * CPUClass:
  * @class_by_name: Callback to map -cpu command line model name to an
@@ -187,6 +190,7 @@ struct CPUClass {
     /* Keep non-pointer data at the end to minimize holes.  */
     int gdb_num_core_regs;
     bool gdb_stop_before_watchpoint;
+    struct AccelCPUClass *accel_cpu;
 
     /* when TCG is not available, this pointer is NULL */
     struct TCGCPUOps *tcg_ops;
diff --git a/accel/accel-common.c b/accel/accel-common.c
index 6b59873419..9901b0531c 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -26,6 +26,9 @@
 #include "qemu/osdep.h"
 #include "qemu/accel.h"
 
+#include "cpu.h"
+#include "hw/core/accel-cpu.h"
+
 #ifndef CONFIG_USER_ONLY
 #include "accel-softmmu.h"
 #endif /* !CONFIG_USER_ONLY */
@@ -46,16 +49,57 @@ AccelClass *accel_find(const char *opt_name)
     return ac;
 }
 
+static void accel_init_cpu_int_aux(ObjectClass *klass, void *opaque)
+{
+    CPUClass *cc = CPU_CLASS(klass);
+    AccelCPUClass *accel_cpu = opaque;
+
+    cc->accel_cpu = accel_cpu;
+    if (accel_cpu->cpu_class_init) {
+        accel_cpu->cpu_class_init(cc);
+    }
+}
+
+/* initialize the arch-specific accel CpuClass interfaces */
+static void accel_init_cpu_interfaces(AccelClass *ac)
+{
+    const char *ac_name; /* AccelClass name */
+    char *acc_name;      /* AccelCPUClass name */
+    ObjectClass *acc;    /* AccelCPUClass */
+
+    ac_name = object_class_get_name(OBJECT_CLASS(ac));
+    g_assert(ac_name != NULL);
+
+    acc_name = g_strdup_printf("%s-%s", ac_name, CPU_RESOLVING_TYPE);
+    acc = object_class_by_name(acc_name);
+    g_free(acc_name);
+
+    if (acc) {
+        object_class_foreach(accel_init_cpu_int_aux,
+                             CPU_RESOLVING_TYPE, false, acc);
+    }
+}
+
 void accel_init_interfaces(AccelClass *ac)
 {
 #ifndef CONFIG_USER_ONLY
     accel_init_ops_interfaces(ac);
 #endif /* !CONFIG_USER_ONLY */
+
+    accel_init_cpu_interfaces(ac);
 }
 
+static const TypeInfo accel_cpu_type = {
+    .name = TYPE_ACCEL_CPU,
+    .parent = TYPE_OBJECT,
+    .abstract = true,
+    .class_size = sizeof(AccelCPUClass),
+};
+
 static void register_accel_types(void)
 {
     type_register_static(&accel_type);
+    type_register_static(&accel_cpu_type);
 }
 
 type_init(register_accel_types);
diff --git a/MAINTAINERS b/MAINTAINERS
index 2e63561ad0..8d8b0bf966 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -440,6 +440,7 @@ R: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
 F: include/qemu/accel.h
 F: include/sysemu/accel-ops.h
+F: include/hw/core/accel-cpu.h
 F: accel/accel-*.c
 F: accel/Makefile.objs
 F: accel/stubs/Makefile.objs
-- 
2.25.1


