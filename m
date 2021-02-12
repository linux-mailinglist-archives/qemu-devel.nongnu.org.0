Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FA0319E94
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 13:39:48 +0100 (CET)
Received: from localhost ([::1]:51490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAXjf-00033q-Jt
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 07:39:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lAXgU-00016P-VI
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 07:36:31 -0500
Received: from mx2.suse.de ([195.135.220.15]:48112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lAXgS-0006GP-3I
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 07:36:30 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C818AC90;
 Fri, 12 Feb 2021 12:36:25 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC v18 02/15] cpu: call AccelCPUClass::cpu_realizefn in
 cpu_exec_realizefn
Date: Fri, 12 Feb 2021 13:36:09 +0100
Message-Id: <20210212123622.15834-3-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210212123622.15834-1-cfontana@suse.de>
References: <20210212123622.15834-1-cfontana@suse.de>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

move the call to accel_cpu->cpu_realizefn to the general
cpu_exec_realizefn from target/i386, so it does not need to be
called for every target explicitly as we enable more targets.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 cpu.c             |  6 ++++++
 target/i386/cpu.c | 20 +++++++-------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/cpu.c b/cpu.c
index bfbe5a66f9..ba5d272c1e 100644
--- a/cpu.c
+++ b/cpu.c
@@ -36,6 +36,7 @@
 #include "sysemu/replay.h"
 #include "exec/translate-all.h"
 #include "exec/log.h"
+#include "hw/core/accel-cpu.h"
 
 uintptr_t qemu_host_page_size;
 intptr_t qemu_host_page_mask;
@@ -130,6 +131,11 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 
     cpu_list_add(cpu);
 
+    if (cc->accel_cpu) {
+        /* NB: errp parameter is unused currently */
+        cc->accel_cpu->cpu_realizefn(cpu, errp);
+    }
+
 #ifdef CONFIG_TCG
     /* NB: errp parameter is unused currently */
     if (tcg_enabled()) {
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index b034571869..a81a1edcd4 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6339,16 +6339,19 @@ static void x86_cpu_hyperv_realize(X86CPU *cpu)
 static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
-    CPUClass *cc = CPU_GET_CLASS(cs);
     X86CPU *cpu = X86_CPU(dev);
     X86CPUClass *xcc = X86_CPU_GET_CLASS(dev);
     CPUX86State *env = &cpu->env;
     Error *local_err = NULL;
     static bool ht_warned;
 
-    /* The accelerator realizefn needs to be called first. */
-    if (cc->accel_cpu) {
-        cc->accel_cpu->cpu_realizefn(cs, errp);
+    /* Process Hyper-V enlightenments */
+    x86_cpu_hyperv_realize(cpu);
+
+    cpu_exec_realizefn(cs, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
     }
 
     if (xcc->host_cpuid_required && !accel_uses_host_cpuid()) {
@@ -6464,15 +6467,6 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
         env->cache_info_amd.l3_cache = &legacy_l3_cache;
     }
 
-    /* Process Hyper-V enlightenments */
-    x86_cpu_hyperv_realize(cpu);
-
-    cpu_exec_realizefn(cs, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
 #ifndef CONFIG_USER_ONLY
     MachineState *ms = MACHINE(qdev_get_machine());
     qemu_register_reset(x86_cpu_machine_reset_cb, cpu);
-- 
2.26.2


