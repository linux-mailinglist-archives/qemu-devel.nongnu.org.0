Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447BA3E49B5
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 18:22:16 +0200 (CEST)
Received: from localhost ([::1]:55352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD82Z-0006V9-4I
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 12:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <valery.vdovin.s@gmail.com>)
 id 1mD76z-00089f-HS
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 11:22:45 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:43562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <valery.vdovin.s@gmail.com>)
 id 1mD76x-0003rU-9A
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 11:22:45 -0400
Received: by mail-lj1-x22e.google.com with SMTP id x7so12605442ljn.10
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 08:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Dz8/e4J86SkQEXfFT/47M35yk5EzZhJq0YKtk1qpGFQ=;
 b=Y2EbPdar+0Pgqp+ZdG+fWdRbTcPa/nSRQwS0174pe74OjA8ZgfifxZl9lmPWnfeq0m
 bbWz8v8sKptd6miWvA2HguTqybGe02QWtw39aDFwKla364iwNrgBHYnhnwpyQGR/0GBL
 xhOFXnKRR34nFN0PF6JgLcU/OF4Nww0Laa1fYQi9lJLNrMV99sQYslqPSRmf/kxeZ7py
 1O64QmJrkeRbH6Lthtw/ELPCOClJttgRVw9FyPoYX484/6wDGzLU2/t4q1FigJ+5rJoI
 JHdtLvgEYVzxZW0b4mVyyebAB2TUYXo2Z6F9tO7KpRCxsgFv6JVXi3MdGp4gXIs7jJ67
 B3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Dz8/e4J86SkQEXfFT/47M35yk5EzZhJq0YKtk1qpGFQ=;
 b=YNmzZ6OyeoQVMl7pp3VVol0HQtkoYnn8zugFgTU57EAwFJYpt4CSzdZj5t8gO9hi5A
 8cEAaBnHBHCF+JzfEOdN7FLEv0s1Pb0OIS328J40WPU9PRIMz0FbEOncs/N1lxkenvGB
 h4RBbe9wTpUTPptewjVBvLOc4yZjP/l3MFrJ44+WBOCN/sAr4uMFwteaheUsKW+YS6ps
 Zs7eHR7lBN8L3i9UaVf/djnvx07UWa+MMbj1W2HywP81TqwRqE5oFDou42i4LXFq4NYt
 PheQzVx2WS8G8iuUicTQDoxyZvyaLHg+ROPBT5/N18bVGX0/ZaVLJJUsqJvo97oWmAZp
 7XIA==
X-Gm-Message-State: AOAM531o38IthvInR0AgeBQ5TbNpJiDvhDXiD9kTACwc00xzJVbK/zIQ
 dW3iMyvvBUaHEevWXwq3YmNQ5NqOMttq7nCKVOM=
X-Google-Smtp-Source: ABdhPJwUrVss1+WAsBTs/+tUbwl01sjek6Y1Zsl6QO867p5vI6Rlxp7RPQLOguMPjtav5o+9c8hTag==
X-Received: by 2002:a2e:b532:: with SMTP id z18mr5277769ljm.309.1628522560240; 
 Mon, 09 Aug 2021 08:22:40 -0700 (PDT)
Received: from localhost.localdomain ([176.106.247.78])
 by smtp.gmail.com with ESMTPSA id i2sm1764887lfg.48.2021.08.09.08.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 08:22:39 -0700 (PDT)
From: Valeriy Vdovin <valery.vdovin.s@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13] qapi: introduce 'query-x86-cpuid' QMP command.
Date: Mon,  9 Aug 2021 18:22:37 +0300
Message-Id: <20210809152237.8940-1-valery.vdovin.s@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=valery.vdovin.s@gmail.com; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 09 Aug 2021 12:21:02 -0400
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Valeriy Vdovin <valery.vdovin.s@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>, Denis Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>

Introducing new QMP command 'query-x86-cpuid'. This command can be used to
get virtualized cpu model info generated by QEMU during VM initialization in
the form of cpuid representation.

Diving into more details about virtual CPU generation: QEMU first parses '-cpu'
command line option. From there it takes the name of the model as the basis for
feature set of the new virtual CPU. After that it uses trailing '-cpu' options,
that state if additional cpu features should be present on the virtual CPU or
excluded from it (tokens '+'/'-' or '=on'/'=off').
After that QEMU checks if the host's cpu can actually support the derived
feature set and applies host limitations to it.
After this initialization procedure, virtual CPU has it's model and
vendor names, and a working feature set and is ready for identification
instructions such as CPUID.

To learn exactly how virtual CPU is presented to the guest machine via CPUID
instruction, new QMP command can be used. By calling 'query-x86-cpuid'
command, one can get a full listing of all CPUID leaves with subleaves which are
supported by the initialized virtual CPU.

Other than debug, the command is useful in cases when we would like to
utilize QEMU's virtual CPU initialization routines and put the retrieved
values into kernel CPUID overriding mechanics for more precise control
over how various processes perceive its underlying hardware with
container processes as a good example.

The command is specific to x86. It is currenly only implemented for KVM acceleator.

Output format:
The output is a plain list of leaf/subleaf argument combinations, that
return 4 words in registers EAX, EBX, ECX, EDX.

Use example:
qmp_request: {
  "execute": "query-x86-cpuid"
}

qmp_response: {
  "return": [
    {
      "eax": 1073741825,
      "edx": 77,
      "in-eax": 1073741824,
      "ecx": 1447775574,
      "ebx": 1263359563
    },
    {
      "eax": 16777339,
      "edx": 0,
      "in-eax": 1073741825,
      "ecx": 0,
      "ebx": 0
    },
    {
      "eax": 13,
      "edx": 1231384169,
      "in-eax": 0,
      "ecx": 1818588270,
      "ebx": 1970169159
    },
    {
      "eax": 198354,
      "edx": 126614527,
      "in-eax": 1,
      "ecx": 2176328193,
      "ebx": 2048
    },
    ....
    {
      "eax": 12328,
      "edx": 0,
      "in-eax": 2147483656,
      "ecx": 0,
      "ebx": 0
    }
  ]
}

Signed-off-by: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
---
v2: - Removed leaf/subleaf iterators.
    - Modified cpu_x86_cpuid to return false in cases when count is
      greater than supported subleaves.
v3: - Fixed structure name coding style.
    - Added more comments
    - Ensured buildability for non-x86 targets.
v4: - Fixed cpu_x86_cpuid return value logic and handling of 0xA leaf.
    - Fixed comments.
    - Removed target check in qmp_query_cpu_model_cpuid.
v5: - Added error handling code in qmp_query_cpu_model_cpuid
v6: - Fixed error handling code. Added method to query_error_class
v7: - Changed implementation in favor of cached cpuid_data for
      KVM_SET_CPUID2
v8: - Renamed qmp method to query-kvm-cpuid and some fields in response.
    - Modified documentation to qmp method
    - Removed helper struct declaration
v9: - Renamed 'in_eax' / 'in_ecx' fields to 'in-eax' / 'in-ecx'
    - Pasted more complete response to commit message.
v10:
    - Subject changed
    - Fixes in commit message
    - Small fixes in QMP command docs
v11:
    - Added explanation about CONFIG_KVM to the commit message.
v12:
    - Changed title from query-kvm-cpuid to query-x86-cpuid
    - Removed CONFIG_KVM ifdefs
    - Added detailed error messages for some stub/unimplemented cases.
v13:
    - Tagged with since 6.2

 qapi/machine-target.json   | 44 ++++++++++++++++++++++++++++++++
 softmmu/cpus.c             |  2 +-
 target/i386/kvm/kvm-stub.c | 10 ++++++++
 target/i386/kvm/kvm.c      | 51 ++++++++++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c |  1 +
 5 files changed, 107 insertions(+), 1 deletion(-)

diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index e7811654b7..599394d067 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -329,3 +329,47 @@
 ##
 { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
   'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
+
+##
+# @CpuidEntry:
+#
+# A single entry of a CPUID response.
+#
+# One entry holds full set of information (leaf) returned to the guest
+# in response to it calling a CPUID instruction with eax, ecx used as
+# the agruments to that instruction. ecx is an optional argument as
+# not all of the leaves support it.
+#
+# @in-eax: CPUID argument in eax
+# @in-ecx: CPUID argument in ecx
+# @eax: CPUID result in eax
+# @ebx: CPUID result in ebx
+# @ecx: CPUID result in ecx
+# @edx: CPUID result in edx
+#
+# Since: 6.2
+##
+{ 'struct': 'CpuidEntry',
+  'data': { 'in-eax' : 'uint32',
+            '*in-ecx' : 'uint32',
+            'eax' : 'uint32',
+            'ebx' : 'uint32',
+            'ecx' : 'uint32',
+            'edx' : 'uint32'
+          },
+  'if': 'defined(TARGET_I386)' }
+
+##
+# @query-x86-cpuid:
+#
+# Returns raw data from the emulated CPUID table for the first VCPU.
+# The emulated CPUID table defines the response to the CPUID
+# instruction when executed by the guest operating system.
+#
+# Returns: a list of CpuidEntry
+#
+# Since: 6.2
+##
+{ 'command': 'query-x86-cpuid',
+  'returns': ['CpuidEntry'],
+  'if': 'defined(TARGET_I386)' }
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index a7ee431187..74fa6b9af4 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -128,7 +128,7 @@ void hw_error(const char *fmt, ...)
 /*
  * The chosen accelerator is supposed to register this.
  */
-static const AccelOpsClass *cpus_accel;
+const AccelOpsClass *cpus_accel;
 
 void cpu_synchronize_all_states(void)
 {
diff --git a/target/i386/kvm/kvm-stub.c b/target/i386/kvm/kvm-stub.c
index 92f49121b8..27305fc458 100644
--- a/target/i386/kvm/kvm-stub.c
+++ b/target/i386/kvm/kvm-stub.c
@@ -12,6 +12,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "kvm_i386.h"
+#include "qapi/error.h"
 
 #ifndef __OPTIMIZE__
 bool kvm_has_smm(void)
@@ -39,3 +40,12 @@ bool kvm_hv_vpindex_settable(void)
 {
     return false;
 }
+
+typedef struct CpuidEntryList CpuidEntryList;
+CpuidEntryList *qmp_query_x86_cpuid(Error **errp);
+
+CpuidEntryList *qmp_query_x86_cpuid(Error **errp)
+{
+    error_setg(errp, "Not implemented in --disable-kvm configuration");
+    return NULL;
+}
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 7fe9f52710..114ed76493 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -20,10 +20,12 @@
 
 #include <linux/kvm.h>
 #include "standard-headers/asm-x86/kvm_para.h"
+#include "qapi/qapi-commands-machine-target.h"
 
 #include "cpu.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/hw_accel.h"
+#include "sysemu/accel-ops.h"
 #include "sysemu/kvm_int.h"
 #include "sysemu/runstate.h"
 #include "kvm_i386.h"
@@ -1464,6 +1466,51 @@ static Error *invtsc_mig_blocker;
 
 #define KVM_MAX_CPUID_ENTRIES  100
 
+struct kvm_cpuid2 *cpuid_data_cached;
+extern const AccelOpsClass *cpus_accel;
+
+static inline int is_kvm_accel(AccelOpsClass *class)
+{
+    ObjectClass *parent_class;
+
+    parent_class = &class->parent_class;
+    return strcmp(object_class_get_name(parent_class),
+        "kvm-accel-ops") == 0;
+}
+
+CpuidEntryList *qmp_query_x86_cpuid(Error **errp)
+{
+    int i;
+    struct kvm_cpuid_entry2 *kvm_entry;
+    CpuidEntryList *head = NULL, **tail = &head;
+    CpuidEntry *entry;
+
+    if (!cpuid_data_cached) {
+         if (cpus_accel && !is_kvm_accel((AccelOpsClass *)cpus_accel))
+             error_setg(errp, "Not implemented for non-kvm accel");
+         else
+             error_setg(errp, "VCPU was not initialized yet");
+         return NULL;
+    }
+
+    for (i = 0; i < cpuid_data_cached->nent; ++i) {
+        kvm_entry = &cpuid_data_cached->entries[i];
+        entry = g_malloc0(sizeof(*entry));
+        entry->in_eax = kvm_entry->function;
+        if (kvm_entry->flags & KVM_CPUID_FLAG_SIGNIFCANT_INDEX) {
+            entry->in_ecx = kvm_entry->index;
+            entry->has_in_ecx = true;
+        }
+        entry->eax = kvm_entry->eax;
+        entry->ebx = kvm_entry->ebx;
+        entry->ecx = kvm_entry->ecx;
+        entry->edx = kvm_entry->edx;
+        QAPI_LIST_APPEND(tail, entry);
+    }
+
+    return head;
+}
+
 int kvm_arch_init_vcpu(CPUState *cs)
 {
     struct {
@@ -1833,6 +1880,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
     if (r) {
         goto fail;
     }
+    if (!cpuid_data_cached) {
+        cpuid_data_cached = g_malloc0(sizeof(cpuid_data));
+        memcpy(cpuid_data_cached, &cpuid_data, sizeof(cpuid_data));
+    }
 
     if (has_xsave) {
         env->xsave_buf = qemu_memalign(4096, sizeof(struct kvm_xsave));
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index c98b78d033..bd883f7f52 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -46,6 +46,7 @@ static int query_error_class(const char *cmd)
         { "query-balloon", ERROR_CLASS_DEVICE_NOT_ACTIVE },
         { "query-hotpluggable-cpus", ERROR_CLASS_GENERIC_ERROR },
         { "query-vm-generation-id", ERROR_CLASS_GENERIC_ERROR },
+        { "query-x86-cpuid", ERROR_CLASS_GENERIC_ERROR },
         { NULL, -1 }
     };
     int i;
-- 
2.17.1


