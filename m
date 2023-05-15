Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68195702DCF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:17:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXsO-0007Ft-Cs; Mon, 15 May 2023 09:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyXqw-0004Yn-FO
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:03:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyXqr-000125-45
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684155775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qkq5D45uI365p6GB8vYO3k8fs8WzQsWQgwuB8D+tAvM=;
 b=SXEv9BTbS7/k08bnAPYuhxBp60eoq0QlipUsJ+sCfNL4te5IeYReqDthIHJmw0oI7wF6Ou
 nnqozpqlaOCQ7OTsVCTvMJnWnO+4tN9QmlxDMLi+IE1cVKjKpTVy9nRakdgZEQC3oNSU5Q
 lRg4qH5DCgQL6q7eAm/4dqIJLgTUvjA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-YbEJo7XcOiesw5edNT5yOg-1; Mon, 15 May 2023 09:02:53 -0400
X-MC-Unique: YbEJo7XcOiesw5edNT5yOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD3F4299E760;
 Mon, 15 May 2023 13:02:52 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FA0840C6EC4;
 Mon, 15 May 2023 13:02:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 13/21] hw/core: Use a callback for target specific
 query-cpus-fast information
Date: Mon, 15 May 2023 15:02:25 +0200
Message-Id: <20230515130233.418183-14-thuth@redhat.com>
In-Reply-To: <20230515130233.418183-1-thuth@redhat.com>
References: <20230515130233.418183-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

For being able to create a universal QEMU binary one day, core
files like machine-qmp-cmds.c must not contain any "#ifdef TARGET_..."
parts. Thus let's provide the target specific function via a
function pointer in CPUClass instead, as a first step towards
making this file target independent.

Message-Id: <20230424160434.331175-2-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/core/cpu.h      |  4 ++++
 include/qemu/typedefs.h    |  1 +
 hw/core/machine-qmp-cmds.c | 16 ++--------------
 target/s390x/cpu.c         |  8 ++++++++
 4 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 397fd3ac68..5a019a27bc 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -106,6 +106,9 @@ struct SysemuCPUOps;
  * @has_work: Callback for checking if there is work to do.
  * @memory_rw_debug: Callback for GDB memory access.
  * @dump_state: Callback for dumping state.
+ * @query_cpu_fast:
+ *       Fill in target specific information for the "query-cpus-fast"
+ *       QAPI call.
  * @get_arch_id: Callback for getting architecture-dependent CPU ID.
  * @set_pc: Callback for setting the Program Counter register. This
  *       should have the semantics used by the target architecture when
@@ -151,6 +154,7 @@ struct CPUClass {
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
+    void (*query_cpu_fast)(CPUState *cpu, CpuInfoFast *value);
     int64_t (*get_arch_id)(CPUState *cpu);
     void (*set_pc)(CPUState *cpu, vaddr value);
     vaddr (*get_pc)(CPUState *cpu);
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index df4b55ac65..8e9ef252f5 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -41,6 +41,7 @@ typedef struct CompatProperty CompatProperty;
 typedef struct ConfidentialGuestSupport ConfidentialGuestSupport;
 typedef struct CPUAddressSpace CPUAddressSpace;
 typedef struct CPUArchState CPUArchState;
+typedef struct CpuInfoFast CpuInfoFast;
 typedef struct CPUJumpCache CPUJumpCache;
 typedef struct CPUState CPUState;
 typedef struct CPUTLBEntryFull CPUTLBEntryFull;
diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index b98ff15089..c158c02aa3 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -28,18 +28,6 @@
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 
-static void cpustate_to_cpuinfo_s390(CpuInfoS390 *info, const CPUState *cpu)
-{
-#ifdef TARGET_S390X
-    S390CPU *s390_cpu = S390_CPU(cpu);
-    CPUS390XState *env = &s390_cpu->env;
-
-    info->cpu_state = env->cpu_state;
-#else
-    abort();
-#endif
-}
-
 /*
  * fast means: we NEVER interrupt vCPU threads to retrieve
  * information from KVM.
@@ -68,8 +56,8 @@ CpuInfoFastList *qmp_query_cpus_fast(Error **errp)
         }
 
         value->target = target;
-        if (target == SYS_EMU_TARGET_S390X) {
-            cpustate_to_cpuinfo_s390(&value->u.s390x, cpu);
+        if (cpu->cc->query_cpu_fast) {
+            cpu->cc->query_cpu_fast(cpu, value);
         }
 
         QAPI_LIST_APPEND(tail, value);
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 40fdeaa905..df167493c3 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -140,6 +140,13 @@ static bool s390_cpu_has_work(CPUState *cs)
     return s390_cpu_has_int(cpu);
 }
 
+static void s390_query_cpu_fast(CPUState *cpu, CpuInfoFast *value)
+{
+    S390CPU *s390_cpu = S390_CPU(cpu);
+
+    value->u.s390x.cpu_state = s390_cpu->env.cpu_state;
+}
+
 /* S390CPUClass::reset() */
 static void s390_cpu_reset(CPUState *s, cpu_reset_type type)
 {
@@ -332,6 +339,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = s390_cpu_class_by_name,
     cc->has_work = s390_cpu_has_work;
     cc->dump_state = s390_cpu_dump_state;
+    cc->query_cpu_fast = s390_query_cpu_fast;
     cc->set_pc = s390_cpu_set_pc;
     cc->get_pc = s390_cpu_get_pc;
     cc->gdb_read_register = s390_cpu_gdb_read_register;
-- 
2.31.1


