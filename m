Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9081E2D78E0
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:15:32 +0100 (CET)
Received: from localhost ([::1]:41980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knk8p-0000si-I7
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:15:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1knk6Z-0007XD-DP; Fri, 11 Dec 2020 10:13:11 -0500
Received: from mail.csgraf.de ([188.138.100.120]:36588
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1knk6W-0001uv-C7; Fri, 11 Dec 2020 10:13:11 -0500
Received: from localhost.localdomain
 (dynamic-077-007-081-179.77.7.pool.telefonica.de [77.7.81.179])
 by csgraf.de (Postfix) with ESMTPSA id 17DD83900529;
 Fri, 11 Dec 2020 16:13:05 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/11] hvf: Simplify post reset/init/loadvm hooks
Date: Fri, 11 Dec 2020 16:12:55 +0100
Message-Id: <20201211151300.85322-7-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201211151300.85322-1-agraf@csgraf.de>
References: <20201211151300.85322-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The hooks we have that call us after reset, init and loadvm really all
just want to say "The reference of all register state is in the QEMU
vcpu struct, please push it".

We already have a working pushing mechanism though called cpu->vcpu_dirty,
so we can just reuse that for all of the above, syncing state properly the
next time we actually execute a vCPU.

This fixes PSCI resets on ARM, as they modify CPU state even after the
post init call has completed, but before we execute the vCPU again.

To also make the scheme work for x86, we have to make sure we don't
move stale eflags into our env when the vcpu state is dirty.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
---
 accel/hvf/hvf-cpus.c     | 27 +++++++--------------------
 target/i386/hvf/x86hvf.c |  5 ++++-
 2 files changed, 11 insertions(+), 21 deletions(-)

diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
index 2c6796604a..a324da2757 100644
--- a/accel/hvf/hvf-cpus.c
+++ b/accel/hvf/hvf-cpus.c
@@ -275,39 +275,26 @@ static void hvf_cpu_synchronize_state(CPUState *cpu)
     }
 }
 
-static void do_hvf_cpu_synchronize_post_reset(CPUState *cpu,
-                                              run_on_cpu_data arg)
+static void do_hvf_cpu_synchronize_set_dirty(CPUState *cpu,
+                                             run_on_cpu_data arg)
 {
-    hvf_put_registers(cpu);
-    cpu->vcpu_dirty = false;
+    /* QEMU state is the reference, push it to HVF now and on next entry */
+    cpu->vcpu_dirty = true;
 }
 
 static void hvf_cpu_synchronize_post_reset(CPUState *cpu)
 {
-    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_reset, RUN_ON_CPU_NULL);
-}
-
-static void do_hvf_cpu_synchronize_post_init(CPUState *cpu,
-                                             run_on_cpu_data arg)
-{
-    hvf_put_registers(cpu);
-    cpu->vcpu_dirty = false;
+    run_on_cpu(cpu, do_hvf_cpu_synchronize_set_dirty, RUN_ON_CPU_NULL);
 }
 
 static void hvf_cpu_synchronize_post_init(CPUState *cpu)
 {
-    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_init, RUN_ON_CPU_NULL);
-}
-
-static void do_hvf_cpu_synchronize_pre_loadvm(CPUState *cpu,
-                                              run_on_cpu_data arg)
-{
-    cpu->vcpu_dirty = true;
+    run_on_cpu(cpu, do_hvf_cpu_synchronize_set_dirty, RUN_ON_CPU_NULL);
 }
 
 static void hvf_cpu_synchronize_pre_loadvm(CPUState *cpu)
 {
-    run_on_cpu(cpu, do_hvf_cpu_synchronize_pre_loadvm, RUN_ON_CPU_NULL);
+    run_on_cpu(cpu, do_hvf_cpu_synchronize_set_dirty, RUN_ON_CPU_NULL);
 }
 
 static void hvf_vcpu_destroy(CPUState *cpu)
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index 0f2aeb1cf8..3111c0be4c 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -435,7 +435,10 @@ int hvf_process_events(CPUState *cpu_state)
     X86CPU *cpu = X86_CPU(cpu_state);
     CPUX86State *env = &cpu->env;
 
-    env->eflags = rreg(cpu_state->hvf->fd, HV_X86_RFLAGS);
+    if (!cpu_state->vcpu_dirty) {
+        /* light weight sync for CPU_INTERRUPT_HARD and IF_MASK */
+        env->eflags = rreg(cpu_state->hvf->fd, HV_X86_RFLAGS);
+    }
 
     if (cpu_state->interrupt_request & CPU_INTERRUPT_INIT) {
         cpu_synchronize_state(cpu_state);
-- 
2.24.3 (Apple Git-128)


