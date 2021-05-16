Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F823820CD
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 22:09:48 +0200 (CEST)
Received: from localhost ([::1]:34872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liN59-0002ji-K7
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 16:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1liMup-00021M-2q; Sun, 16 May 2021 15:59:07 -0400
Received: from mail.csgraf.de ([85.25.223.15]:45402 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1liMum-0008GC-58; Sun, 16 May 2021 15:59:06 -0400
Received: from localhost.localdomain
 (dynamic-095-118-089-019.95.118.pool.telefonica.de [95.118.89.19])
 by csgraf.de (Postfix) with ESMTPSA id 8099360806B0;
 Sun, 16 May 2021 21:59:01 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v7 08/19] hvf: Use cpu_synchronize_state()
Date: Sun, 16 May 2021 21:58:44 +0200
Message-Id: <20210516195855.28869-9-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210516195855.28869-1-agraf@csgraf.de>
References: <20210516195855.28869-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no reason to call the hvf specific hvf_cpu_synchronize_state()
when we can just use the generic cpu_synchronize_state() instead. This
allows us to have less dependency on internal function definitions and
allows us to make hvf_cpu_synchronize_state() static.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 accel/hvf/hvf-accel-ops.c | 2 +-
 accel/hvf/hvf-accel-ops.h | 1 -
 target/i386/hvf/x86hvf.c  | 9 ++++-----
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index b262efd8b6..3b599ac57c 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -200,7 +200,7 @@ static void do_hvf_cpu_synchronize_state(CPUState *cpu, run_on_cpu_data arg)
     }
 }
 
-void hvf_cpu_synchronize_state(CPUState *cpu)
+static void hvf_cpu_synchronize_state(CPUState *cpu)
 {
     if (!cpu->vcpu_dirty) {
         run_on_cpu(cpu, do_hvf_cpu_synchronize_state, RUN_ON_CPU_NULL);
diff --git a/accel/hvf/hvf-accel-ops.h b/accel/hvf/hvf-accel-ops.h
index 09fcf22067..f6192b56f0 100644
--- a/accel/hvf/hvf-accel-ops.h
+++ b/accel/hvf/hvf-accel-ops.h
@@ -13,7 +13,6 @@
 #include "sysemu/cpus.h"
 
 int hvf_vcpu_exec(CPUState *);
-void hvf_cpu_synchronize_state(CPUState *);
 void hvf_cpu_synchronize_post_reset(CPUState *);
 void hvf_cpu_synchronize_post_init(CPUState *);
 void hvf_cpu_synchronize_pre_loadvm(CPUState *);
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index 2b99f3eaa2..cc381307ab 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -26,14 +26,13 @@
 #include "cpu.h"
 #include "x86_descr.h"
 #include "x86_decode.h"
+#include "sysemu/hw_accel.h"
 
 #include "hw/i386/apic_internal.h"
 
 #include <Hypervisor/hv.h>
 #include <Hypervisor/hv_vmx.h>
 
-#include "accel/hvf/hvf-accel-ops.h"
-
 void hvf_set_segment(struct CPUState *cpu, struct vmx_segment *vmx_seg,
                      SegmentCache *qseg, bool is_tr)
 {
@@ -437,7 +436,7 @@ int hvf_process_events(CPUState *cpu_state)
     env->eflags = rreg(cpu_state->hvf_fd, HV_X86_RFLAGS);
 
     if (cpu_state->interrupt_request & CPU_INTERRUPT_INIT) {
-        hvf_cpu_synchronize_state(cpu_state);
+        cpu_synchronize_state(cpu_state);
         do_cpu_init(cpu);
     }
 
@@ -451,12 +450,12 @@ int hvf_process_events(CPUState *cpu_state)
         cpu_state->halted = 0;
     }
     if (cpu_state->interrupt_request & CPU_INTERRUPT_SIPI) {
-        hvf_cpu_synchronize_state(cpu_state);
+        cpu_synchronize_state(cpu_state);
         do_cpu_sipi(cpu);
     }
     if (cpu_state->interrupt_request & CPU_INTERRUPT_TPR) {
         cpu_state->interrupt_request &= ~CPU_INTERRUPT_TPR;
-        hvf_cpu_synchronize_state(cpu_state);
+        cpu_synchronize_state(cpu_state);
         apic_handle_tpr_access_report(cpu->apic_state, env->eip,
                                       env->tpr_access_type);
     }
-- 
2.30.1 (Apple Git-130)


