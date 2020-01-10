Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F15D1375C1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 19:03:18 +0100 (CET)
Received: from localhost ([::1]:50230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipycv-0008Q4-JW
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 13:03:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51194)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Jeff.Kubascik@dornerworks.com>) id 1ipyc3-0007lz-BD
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 13:02:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Jeff.Kubascik@dornerworks.com>) id 1ipyc2-00062W-8A
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 13:02:23 -0500
Received: from mail.dornerworks.com ([12.207.209.150]:34882
 helo=webmail.dornerworks.com) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <Jeff.Kubascik@dornerworks.com>)
 id 1ipybz-0005iE-Q1; Fri, 10 Jan 2020 13:02:19 -0500
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
Subject: [PATCH] target/arm: adjust program counter for wfi exception in
 AArch32
Date: Fri, 10 Jan 2020 13:02:11 -0500
Message-ID: <20200110180211.29025-1-jeff.kubascik@dornerworks.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.27.13.179]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 12.207.209.150
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The wfi instruction can be configured to be trapped by a higher exception
level, such as the EL2 hypervisor. When the instruction is trapped, the
program counter should contain the address of the wfi instruction that
caused the exception. The program counter is adjusted for this in the wfi op
helper function.

However, this correction is done to env->pc, which only applies to AArch64
mode. For AArch32, the program counter is stored in env->regs[15]. This
adds an if-else statement to modify the correct program counter location
based on the the current CPU mode.

Signed-off-by: Jeff Kubascik <jeff.kubascik@dornerworks.com>
---
Hello,

I am using the ARMv8 version of QEMU to run the Xen hypervisor with a guest
virtual machine compiled for AArch32/Thumb code. I have noticed that when
the AArch32 guest VM executes the wfi instruction, the hypervisor trap of
the wfi instruction sees the program counter contain the address of the
instruction following the wfi. This does not occur for an AARch64 guest VM;
in this case, the program counter contains the address of the wfi
instruction. I am confident the correct behavior in both cases is for the
program counter to contain the address of the wfi instruction, as this works
on actual hardware (Xilinx Zynq UltraScale+ MPSoC).

I have tested the above patch and it works for Xen with both an AArch64
guest (Linux) and an AArch32 guest (RTEMS). I'm still getting accustomed to
the QEMU code base, so it may not be correct. Any feedback would be greatly
appreciated.

Sincerely,
Jeff Kubascik
---
 target/arm/op_helper.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index e5a346cb87..7295645854 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -295,7 +295,11 @@ void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
     }
 
     if (target_el) {
-        env->pc -= insn_len;
+        if (env->aarch64)
+            env->pc -= insn_len;
+        else
+            env->regs[15] -= insn_len;
+
         raise_exception(env, EXCP_UDEF, syn_wfx(1, 0xe, 0, insn_len == 2),
                         target_el);
     }
-- 
2.17.1


