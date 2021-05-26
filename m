Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BDF392383
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 01:59:41 +0200 (CEST)
Received: from localhost ([::1]:59848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3R6-0002n2-5S
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 19:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FN-0005hT-GA
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:33 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:33543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FH-0004VZ-Do
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:33 -0400
Received: by mail-pf1-x42d.google.com with SMTP id f22so2239546pfn.0
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vw5nnEy/H9F7HNJ5jVqUFe/PGYkuz9b7FFSO4MqaxNw=;
 b=OTiHklgG5s1C4tX5RpKp6V2Ei1y4wG3+MdQBhoGZcwQggAp/LayKJ7wyeqe+dMmyPa
 j5Bl4T5HxeRKI1lj+a3ENpEn4WZ61HINaWFqOkG1ehobPXS9axs0uj66HZ2hP5kz4D4G
 vYOrpReF9yxDQ2GvNOvweawVhbtMUKkV9h6g5L56nYqH7DMHTlx7SOaL40ufE4vVKLkf
 +LJTuqWc851W4gqcH8myYZga+au/BoDfAc6EqaDhtA8tJB9AsMlg6l2CIqUFJSQEufHs
 Brbd01PNUxJjOeKPxqZmcVzgfYi3OHZstCiJMzn2ZAb0zke35+O0nBcj8tJOqB+ZipHd
 UOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vw5nnEy/H9F7HNJ5jVqUFe/PGYkuz9b7FFSO4MqaxNw=;
 b=U3A/+RB3aDqvtgNFFJBGGMgHsVkO7I4tYNKyFjSF9HKCsp9NaYvLKGhSnjoEisKCp7
 212rY8wca/Npfy6Qt0Ckp7t29bI9cobwN65gHJ3O8xa6568mLROpilvvT6roLFvgCQqP
 8q4QLS0zmeZ7lnJAYRhgqphzfdhUigz/eduXXNpHhfJZW0NdXF+gseJjpmWqWhmbmkpC
 CGk4I3SX3hj+F2aJeZNhxU4U8IMbRiXXsplsFeJxQ2lafXO+N/6nxTxKwur8Rnkl29KT
 9/LwAYBaMxn24yD0aJElAS57CcYHLQzQmbhoblyygHWR9ZMQgpngX/SqRqf3wYehw2FM
 0ofQ==
X-Gm-Message-State: AOAM533f2Bym3lnjhZfPWXs2gU/lM0KPELgm1IInZUdxRnfk/7OmsW83
 /utirdXk9irUqjBVLaEXpNjOzjaJEO397g==
X-Google-Smtp-Source: ABdhPJz8fwDhfDZ2EqzYqAykDrzFVKcg07PA6gRpSYON4kNnIvmF47M5ywVpZSWlvT/cXhaXXrqW0g==
X-Received: by 2002:a65:625a:: with SMTP id q26mr961775pgv.311.1622072845044; 
 Wed, 26 May 2021 16:47:25 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/31] cpu: Directly use cpu_write_elf*() fallback handlers in
 place
Date: Wed, 26 May 2021 16:46:54 -0700
Message-Id: <20210526234710.125396-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

No code directly accesses CPUClass::write_elf*() handlers out
of hw/core/cpu.c (the rest are assignation in target/ code):

  $ git grep -F -- '->write_elf'
  hw/core/cpu.c:157:    return (*cc->write_elf32_qemunote)(f, cpu, opaque);
  hw/core/cpu.c:171:    return (*cc->write_elf32_note)(f, cpu, cpuid, opaque);
  hw/core/cpu.c:186:    return (*cc->write_elf64_qemunote)(f, cpu, opaque);
  hw/core/cpu.c:200:    return (*cc->write_elf64_note)(f, cpu, cpuid, opaque);
  hw/core/cpu.c:440:    k->write_elf32_qemunote = cpu_common_write_elf32_qemunote;
  hw/core/cpu.c:441:    k->write_elf32_note = cpu_common_write_elf32_note;
  hw/core/cpu.c:442:    k->write_elf64_qemunote = cpu_common_write_elf64_qemunote;
  hw/core/cpu.c:443:    k->write_elf64_note = cpu_common_write_elf64_note;
  target/arm/cpu.c:2304:    cc->write_elf64_note = arm_cpu_write_elf64_note;
  target/arm/cpu.c:2305:    cc->write_elf32_note = arm_cpu_write_elf32_note;
  target/i386/cpu.c:7425:    cc->write_elf64_note = x86_cpu_write_elf64_note;
  target/i386/cpu.c:7426:    cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
  target/i386/cpu.c:7427:    cc->write_elf32_note = x86_cpu_write_elf32_note;
  target/i386/cpu.c:7428:    cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
  target/ppc/translate_init.c.inc:10891:    cc->write_elf64_note = ppc64_cpu_write_elf64_note;
  target/ppc/translate_init.c.inc:10892:    cc->write_elf32_note = ppc32_cpu_write_elf32_note;
  target/s390x/cpu.c:522:    cc->write_elf64_note = s390_cpu_write_elf64_note;

Check the handler presence in place and remove the common fallback code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210517105140.1062037-9-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/core/cpu-common.c | 63 --------------------------------------------
 hw/core/cpu-sysemu.c | 44 +++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 63 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 9d73c9a28c..5913ffe22b 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -116,65 +116,6 @@ void cpu_exit(CPUState *cpu)
     qatomic_set(&cpu->icount_decr_ptr->u16.high, -1);
 }
 
-int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
-                             void *opaque)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    return (*cc->write_elf32_qemunote)(f, cpu, opaque);
-}
-
-static int cpu_common_write_elf32_qemunote(WriteCoreDumpFunction f,
-                                           CPUState *cpu, void *opaque)
-{
-    return 0;
-}
-
-int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
-                         int cpuid, void *opaque)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    return (*cc->write_elf32_note)(f, cpu, cpuid, opaque);
-}
-
-static int cpu_common_write_elf32_note(WriteCoreDumpFunction f,
-                                       CPUState *cpu, int cpuid,
-                                       void *opaque)
-{
-    return -1;
-}
-
-int cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
-                             void *opaque)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    return (*cc->write_elf64_qemunote)(f, cpu, opaque);
-}
-
-static int cpu_common_write_elf64_qemunote(WriteCoreDumpFunction f,
-                                           CPUState *cpu, void *opaque)
-{
-    return 0;
-}
-
-int cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
-                         int cpuid, void *opaque)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    return (*cc->write_elf64_note)(f, cpu, cpuid, opaque);
-}
-
-static int cpu_common_write_elf64_note(WriteCoreDumpFunction f,
-                                       CPUState *cpu, int cpuid,
-                                       void *opaque)
-{
-    return -1;
-}
-
-
 static int cpu_common_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
 {
     return 0;
@@ -377,10 +318,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->has_work = cpu_common_has_work;
     k->get_paging_enabled = cpu_common_get_paging_enabled;
     k->get_memory_mapping = cpu_common_get_memory_mapping;
-    k->write_elf32_qemunote = cpu_common_write_elf32_qemunote;
-    k->write_elf32_note = cpu_common_write_elf32_note;
-    k->write_elf64_qemunote = cpu_common_write_elf64_qemunote;
-    k->write_elf64_note = cpu_common_write_elf64_note;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index 078e1a84a5..7f3a357494 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -54,6 +54,50 @@ int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
     return ret;
 }
 
+int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
+                             void *opaque)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (!cc->write_elf32_qemunote) {
+        return 0;
+    }
+    return (*cc->write_elf32_qemunote)(f, cpu, opaque);
+}
+
+int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
+                         int cpuid, void *opaque)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (!cc->write_elf32_note) {
+        return -1;
+    }
+    return (*cc->write_elf32_note)(f, cpu, cpuid, opaque);
+}
+
+int cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
+                             void *opaque)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (!cc->write_elf64_qemunote) {
+        return 0;
+    }
+    return (*cc->write_elf64_qemunote)(f, cpu, opaque);
+}
+
+int cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
+                         int cpuid, void *opaque)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (!cc->write_elf64_note) {
+        return -1;
+    }
+    return (*cc->write_elf64_note)(f, cpu, cpuid, opaque);
+}
+
 bool cpu_virtio_is_big_endian(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
-- 
2.25.1


