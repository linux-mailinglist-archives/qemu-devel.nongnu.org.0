Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2C23011C3
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 01:44:10 +0100 (CET)
Received: from localhost ([::1]:56008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3729-00024F-8M
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 19:44:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>) id 1l36zh-0001Bw-Cr
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 19:41:38 -0500
Received: from mail.csgraf.de ([188.138.100.120]:50170
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>) id 1l36ze-0004oL-Oo
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 19:41:37 -0500
Received: from localhost.localdomain
 (dynamic-077-004-009-148.77.4.pool.telefonica.de [77.4.9.148])
 by csgraf.de (Postfix) with ESMTPSA id 534D239002E0;
 Sat, 23 Jan 2021 01:41:30 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH] hvf: Fetch cr4 before evaluating CPUID(1)
Date: Sat, 23 Jan 2021 01:41:29 +0100
Message-Id: <20210123004129.6364-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Asad Ali <asad@osaro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The CPUID function 1 has a bit called OSXSAVE which tells user space the
status of the CR4.OSXSAVE bit. Our generic CPUID function injects that bit
based on the status of CR4.

With Hypervisor.framework, we do not synchronize full CPU state often enough
for this function to see the CR4 update before guest user space asks for it.

To be on the save side, let's just always synchronize it when we receive a
CPUID(1) request. That way we can set the bit with real confidence.

Reported-by: Asad Ali <asad@osaro.com>
Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/i386/hvf/hvf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 08b4adecd9..f660b829ac 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -426,6 +426,10 @@ int hvf_vcpu_exec(CPUState *cpu)
             uint32_t rcx = (uint32_t)rreg(cpu->hvf->fd, HV_X86_RCX);
             uint32_t rdx = (uint32_t)rreg(cpu->hvf->fd, HV_X86_RDX);
 
+            if (rax == 1) {
+                /* CPUID1.ecx.OSXSAVE needs to know CR4 */
+                env->cr[4] = rvmcs(cpu->hvf->fd, VMCS_GUEST_CR4);
+            }
             cpu_x86_cpuid(env, rax, rcx, &rax, &rbx, &rcx, &rdx);
 
             wreg(cpu->hvf->fd, HV_X86_RAX, rax);
-- 
2.24.3 (Apple Git-128)


