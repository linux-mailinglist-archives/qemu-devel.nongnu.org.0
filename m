Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF7143A056
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 21:27:38 +0200 (CEST)
Received: from localhost ([::1]:59630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf5dB-0006gT-Lm
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 15:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>) id 1mf5Pu-0000fq-DT
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:13:54 -0400
Received: from mail.csgraf.de ([85.25.223.15]:48314 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>) id 1mf5Ps-0000Qf-Nw
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:13:54 -0400
Received: from localhost.localdomain
 (dynamic-095-114-012-148.95.114.pool.telefonica.de [95.114.12.148])
 by csgraf.de (Postfix) with ESMTPSA id AB55260803C7;
 Mon, 25 Oct 2021 21:13:50 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: Cameron Esfahani <dirty@apple.com>
Subject: [PATCH] hvf: arm: Ignore cache operations on MMIO
Date: Mon, 25 Oct 2021 21:13:49 +0200
Message-Id: <20211025191349.52992-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
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
Cc: kettenis@openbsd.org, qemu-devel@nongnu.org,
 AJ Barris <AwlsomeAlex@github.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>, osy@github.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Apple's Hypervisor.Framework forwards cache operations as MMIO traps
into user space. For MMIO however, these have no meaning: There is no
cache attached to them.

So let's filter SYS instructions for DATA exits out and treat them as nops.

This fixes OpenBSD booting as guest.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reported-by: AJ Barris <AwlsomeAlex@github.com>
---
 target/arm/hvf/hvf.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index bff3e0cde7..46ff4892a7 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1098,6 +1098,33 @@ static void hvf_sync_vtimer(CPUState *cpu)
     }
 }
 
+static bool hvf_emulate_insn(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    uint32_t insn;
+
+    /*
+     * We ran into an instruction that traps for data, but is not
+     * hardware predecoded. This should not ever happen for well
+     * behaved guests. Let's try to see if we can somehow rescue
+     * the situation.
+     */
+
+    cpu_synchronize_state(cpu);
+    if (cpu_memory_rw_debug(cpu, env->pc, &insn, 4, 0)) {
+        /* Could not read the instruction */
+        return false;
+    }
+
+    if ((insn & 0xffc00000) == 0xd5000000) {
+        /* MSR/MRS/SYS/SYSL - happens for cache ops which are nops on data */
+        return true;
+    }
+
+    return false;
+}
+
 int hvf_vcpu_exec(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -1156,6 +1183,11 @@ int hvf_vcpu_exec(CPUState *cpu)
                              hvf_exit->exception.physical_address, isv,
                              iswrite, s1ptw, len, srt);
 
+        if (!isv) {
+            g_assert(hvf_emulate_insn(cpu));
+            advance_pc = true;
+            break;
+        }
         assert(isv);
 
         if (iswrite) {
-- 
2.30.1 (Apple Git-130)


