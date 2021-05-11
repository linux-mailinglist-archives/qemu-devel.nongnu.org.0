Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A6B37A19B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:18:49 +0200 (CEST)
Received: from localhost ([::1]:36672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNbM-0001hH-4w
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWk-0001TP-Bt
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWh-0000hi-4d
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vgJNJcqzKUtK71HTcL6PL4MDg3HF99xzRQyW+AwEq5A=;
 b=aTeL4tg1VGCrlMcP4rJMC8yAozj/g6obcUVbVcrhnqMLYUgoPGNAw22hgwIgSouFm2k7+j
 U1wlg8rsz5QCOTzmifLLaKiv+fLikl7MXqOfYzXP0eN741EPCjl+M+w1/WFic7eghsQ2T0
 QMDIeHf+QVAo581AuoNfDmHb5vo108U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-hKI3rgl2MPqsmTWLFM7hvA-1; Tue, 11 May 2021 04:13:56 -0400
X-MC-Unique: hKI3rgl2MPqsmTWLFM7hvA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A82BC107ACC7;
 Tue, 11 May 2021 08:13:55 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 579675D9E3;
 Tue, 11 May 2021 08:13:55 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/33] i386: split off sysemu-only functionality in tcg-cpu
Date: Tue, 11 May 2021 04:13:25 -0400
Message-Id: <20210511081350.419428-9-pbonzini@redhat.com>
In-Reply-To: <20210511081350.419428-1-pbonzini@redhat.com>
References: <20210511081350.419428-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210322132800.7470-11-cfontana@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/meson.build            |  2 +
 target/i386/tcg/meson.build        |  3 ++
 target/i386/tcg/sysemu/meson.build |  3 ++
 target/i386/tcg/sysemu/tcg-cpu.c   | 83 ++++++++++++++++++++++++++++++
 target/i386/tcg/tcg-cpu.c          | 75 ++-------------------------
 target/i386/tcg/tcg-cpu.h          | 24 +++++++++
 target/i386/tcg/user/meson.build   |  2 +
 7 files changed, 121 insertions(+), 71 deletions(-)
 create mode 100644 target/i386/tcg/sysemu/meson.build
 create mode 100644 target/i386/tcg/sysemu/tcg-cpu.c
 create mode 100644 target/i386/tcg/tcg-cpu.h
 create mode 100644 target/i386/tcg/user/meson.build

diff --git a/target/i386/meson.build b/target/i386/meson.build
index 6f3b0255c0..94571317f6 100644
--- a/target/i386/meson.build
+++ b/target/i386/meson.build
@@ -19,6 +19,7 @@ i386_softmmu_ss.add(files(
   'machine.c',
   'monitor.c',
 ))
+i386_user_ss = ss.source_set()
 
 subdir('kvm')
 subdir('hax')
@@ -29,3 +30,4 @@ subdir('tcg')
 
 target_arch += {'i386': i386_ss}
 target_softmmu_arch += {'i386': i386_softmmu_ss}
+target_user_arch += {'i386': i386_user_ss}
diff --git a/target/i386/tcg/meson.build b/target/i386/tcg/meson.build
index 6a1a73cdbf..320bcd1e46 100644
--- a/target/i386/tcg/meson.build
+++ b/target/i386/tcg/meson.build
@@ -12,3 +12,6 @@ i386_ss.add(when: 'CONFIG_TCG', if_true: files(
   'svm_helper.c',
   'tcg-cpu.c',
   'translate.c'), if_false: files('tcg-stub.c'))
+
+subdir('sysemu')
+subdir('user')
diff --git a/target/i386/tcg/sysemu/meson.build b/target/i386/tcg/sysemu/meson.build
new file mode 100644
index 0000000000..4ab30cc32e
--- /dev/null
+++ b/target/i386/tcg/sysemu/meson.build
@@ -0,0 +1,3 @@
+i386_softmmu_ss.add(when: ['CONFIG_TCG', 'CONFIG_SOFTMMU'], if_true: files(
+  'tcg-cpu.c',
+))
diff --git a/target/i386/tcg/sysemu/tcg-cpu.c b/target/i386/tcg/sysemu/tcg-cpu.c
new file mode 100644
index 0000000000..c223c0fe9b
--- /dev/null
+++ b/target/i386/tcg/sysemu/tcg-cpu.c
@@ -0,0 +1,83 @@
+/*
+ * i386 TCG cpu class initialization functions specific to sysemu
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "tcg/helper-tcg.h"
+
+#include "sysemu/sysemu.h"
+#include "qemu/units.h"
+#include "exec/address-spaces.h"
+
+#include "tcg/tcg-cpu.h"
+
+static void tcg_cpu_machine_done(Notifier *n, void *unused)
+{
+    X86CPU *cpu = container_of(n, X86CPU, machine_done);
+    MemoryRegion *smram =
+        (MemoryRegion *) object_resolve_path("/machine/smram", NULL);
+
+    if (smram) {
+        cpu->smram = g_new(MemoryRegion, 1);
+        memory_region_init_alias(cpu->smram, OBJECT(cpu), "smram",
+                                 smram, 0, 4 * GiB);
+        memory_region_set_enabled(cpu->smram, true);
+        memory_region_add_subregion_overlap(cpu->cpu_as_root, 0,
+                                            cpu->smram, 1);
+    }
+}
+
+bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
+{
+    X86CPU *cpu = X86_CPU(cs);
+
+    /*
+     * The realize order is important, since x86_cpu_realize() checks if
+     * nothing else has been set by the user (or by accelerators) in
+     * cpu->ucode_rev and cpu->phys_bits, and the memory regions
+     * initialized here are needed for the vcpu initialization.
+     *
+     * realize order:
+     * tcg_cpu -> host_cpu -> x86_cpu
+     */
+    cpu->cpu_as_mem = g_new(MemoryRegion, 1);
+    cpu->cpu_as_root = g_new(MemoryRegion, 1);
+
+    /* Outer container... */
+    memory_region_init(cpu->cpu_as_root, OBJECT(cpu), "memory", ~0ull);
+    memory_region_set_enabled(cpu->cpu_as_root, true);
+
+    /*
+     * ... with two regions inside: normal system memory with low
+     * priority, and...
+     */
+    memory_region_init_alias(cpu->cpu_as_mem, OBJECT(cpu), "memory",
+                             get_system_memory(), 0, ~0ull);
+    memory_region_add_subregion_overlap(cpu->cpu_as_root, 0, cpu->cpu_as_mem, 0);
+    memory_region_set_enabled(cpu->cpu_as_mem, true);
+
+    cs->num_ases = 2;
+    cpu_address_space_init(cs, 0, "cpu-memory", cs->memory);
+    cpu_address_space_init(cs, 1, "cpu-smm", cpu->cpu_as_root);
+
+    /* ... SMRAM with higher priority, linked from /machine/smram.  */
+    cpu->machine_done.notify = tcg_cpu_machine_done;
+    qemu_add_machine_init_done_notifier(&cpu->machine_done);
+    return true;
+}
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 23e1f5f0c3..e311f52855 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -23,11 +23,7 @@
 #include "qemu/accel.h"
 #include "hw/core/accel-cpu.h"
 
-#ifndef CONFIG_USER_ONLY
-#include "sysemu/sysemu.h"
-#include "qemu/units.h"
-#include "exec/address-spaces.h"
-#endif
+#include "tcg-cpu.h"
 
 /* Frob eflags into and out of the CPU temporary format.  */
 
@@ -78,72 +74,6 @@ static void tcg_cpu_class_init(CPUClass *cc)
     cc->tcg_ops = &x86_tcg_ops;
 }
 
-#ifndef CONFIG_USER_ONLY
-
-static void x86_cpu_machine_done(Notifier *n, void *unused)
-{
-    X86CPU *cpu = container_of(n, X86CPU, machine_done);
-    MemoryRegion *smram =
-        (MemoryRegion *) object_resolve_path("/machine/smram", NULL);
-
-    if (smram) {
-        cpu->smram = g_new(MemoryRegion, 1);
-        memory_region_init_alias(cpu->smram, OBJECT(cpu), "smram",
-                                 smram, 0, 4 * GiB);
-        memory_region_set_enabled(cpu->smram, true);
-        memory_region_add_subregion_overlap(cpu->cpu_as_root, 0,
-                                            cpu->smram, 1);
-    }
-}
-
-static bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
-{
-    X86CPU *cpu = X86_CPU(cs);
-
-    /*
-     * The realize order is important, since x86_cpu_realize() checks if
-     * nothing else has been set by the user (or by accelerators) in
-     * cpu->ucode_rev and cpu->phys_bits, and the memory regions
-     * initialized here are needed for the vcpu initialization.
-     *
-     * realize order:
-     * tcg_cpu -> host_cpu -> x86_cpu
-     */
-    cpu->cpu_as_mem = g_new(MemoryRegion, 1);
-    cpu->cpu_as_root = g_new(MemoryRegion, 1);
-
-    /* Outer container... */
-    memory_region_init(cpu->cpu_as_root, OBJECT(cpu), "memory", ~0ull);
-    memory_region_set_enabled(cpu->cpu_as_root, true);
-
-    /*
-     * ... with two regions inside: normal system memory with low
-     * priority, and...
-     */
-    memory_region_init_alias(cpu->cpu_as_mem, OBJECT(cpu), "memory",
-                             get_system_memory(), 0, ~0ull);
-    memory_region_add_subregion_overlap(cpu->cpu_as_root, 0, cpu->cpu_as_mem, 0);
-    memory_region_set_enabled(cpu->cpu_as_mem, true);
-
-    cs->num_ases = 2;
-    cpu_address_space_init(cs, 0, "cpu-memory", cs->memory);
-    cpu_address_space_init(cs, 1, "cpu-smm", cpu->cpu_as_root);
-
-    /* ... SMRAM with higher priority, linked from /machine/smram.  */
-    cpu->machine_done.notify = x86_cpu_machine_done;
-    qemu_add_machine_init_done_notifier(&cpu->machine_done);
-    return true;
-}
-
-#else /* CONFIG_USER_ONLY */
-
-static bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
-{
-    return true;
-}
-
-#endif /* !CONFIG_USER_ONLY */
-
 /*
  * TCG-specific defaults that override all CPU models when using TCG
  */
@@ -163,7 +93,10 @@ static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
 {
     AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
 
+#ifndef CONFIG_USER_ONLY
     acc->cpu_realizefn = tcg_cpu_realizefn;
+#endif /* CONFIG_USER_ONLY */
+
     acc->cpu_class_init = tcg_cpu_class_init;
     acc->cpu_instance_init = tcg_cpu_instance_init;
 }
diff --git a/target/i386/tcg/tcg-cpu.h b/target/i386/tcg/tcg-cpu.h
new file mode 100644
index 0000000000..36bd300af0
--- /dev/null
+++ b/target/i386/tcg/tcg-cpu.h
@@ -0,0 +1,24 @@
+/*
+ * i386 TCG cpu class initialization functions
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef TCG_CPU_H
+#define TCG_CPU_H
+
+bool tcg_cpu_realizefn(CPUState *cs, Error **errp);
+
+#endif /* TCG_CPU_H */
diff --git a/target/i386/tcg/user/meson.build b/target/i386/tcg/user/meson.build
new file mode 100644
index 0000000000..7aecc53155
--- /dev/null
+++ b/target/i386/tcg/user/meson.build
@@ -0,0 +1,2 @@
+i386_user_ss.add(when: ['CONFIG_TCG', 'CONFIG_USER_ONLY'], if_true: files(
+))
-- 
2.26.2



