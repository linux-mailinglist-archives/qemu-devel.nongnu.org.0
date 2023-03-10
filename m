Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D306B53EE
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:11:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvz-0008MD-Ny; Fri, 10 Mar 2023 17:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvy-0008M2-3l
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:54 -0500
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvw-00036X-Bk
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:53 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MG9To-1pmpkR16oG-00Gc5K; Fri, 10
 Mar 2023 23:09:43 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 "fanwj@mail.ustc.edu.cn" <fanwj@mail.ustc.edu.cn>
Subject: [PULL 28/28] linux-user: fix bug about incorrect base addresss of gdt
 on i386 and x86_64
Date: Fri, 10 Mar 2023 23:09:27 +0100
Message-Id: <20230310220927.326606-29-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3XJKxqtEkm1gEjnf04IlYzo9UetJwh8unQiZlSpIEDTY8mZu5l0
 oDAVglJmNyRG5Seu68didFFEIuxLvG73Gpv7YpifpbtRwkx3aAwWhulNTVKTA3CAFJpa3e2
 df2rltyDc1JPfSCzfbujFiVT2Uupvq3rnEv6WRpQTU/gMQeD6nZnUBGsRN2MlQeTbbENKLy
 fSCeMno4zfkfM6PW3ntMg==
UI-OutboundReport: notjunk:1;M01:P0:A4492zbpkIs=;eisQV6cS4y6l70sd5zGoJzL0xOq
 +SuoPoa1hYD2Ok/BybL3AcVr7sMJI4FYTH1bgzrLzHGTW4PqU+mm3oxFWBCMaZRzfkmagm0vb
 pUD1Li6AoPWCYzNF2z4Nnrp/t5X+zMC1+0CrC4TEG3vdSQoHjMacFTLhLKSt6Eg5pA7GEKS//
 n1ic5b3+544gOEHYXFU6TxZQBuqkUkgEQNsX0NlbPkMAsB62jlXLFwlLPKjzGNvaKvOIiGp+M
 kld6M0Gu9CkCegfUh51ZxAPi2dg9CD/WRE2Da7d38de3utRBMjSFC3pjTZhW1jSJIKDpiHxM7
 Nu2H6nuyRoH+4NWto5Qvwqs02Q1iK83qm2QvMpOiycMjnlIvKuqp3QyAhKKnxY/VgoOFRMCRI
 edUBvKg0GzjVanRnp1wBVtolPyLPsJNxd/PiDwAyLTB0Sc+fQmzzU+gYDfQX/WCXRaCbhmATd
 42aZsOD0r5uXGpJMWqxR2K5/OaO1d/0kS8PQL/aki0qTxcwT3hjZ6D473ZSRmGAKOQAFiGH2+
 9irA7s07SMFiIN9SlnuGQrizaiKxhFUcXxdQX6a2iqDspRe49vBuYk+gBIJU+XhJ1rul5TMpH
 xoH8HgUCPzQNJZ5u5Nif7fA0lObRRJzhzC3T8PhpRoXud+stUuGHBvN0CXJNbekO8GC/8PJ2V
 Z+lvadsKo24wZndjLfZPA4XA97meWuC3mKF6ajodug==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: "fanwj@mail.ustc.edu.cn" <fanwj@mail.ustc.edu.cn>

On linux user mode, CPUX86State::gdt::base from Different CPUX86State
Objects have same value, It is incorrect! Every CPUX86State::gdt::base
Must points to independent memory space.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1405
Signed-off-by: fanwenjie <fanwj@mail.ustc.edu.cn>
Message-Id: <4172b90.58b08.18631b77860.Coremail.fanwj@mail.ustc.edu.cn>
[lv: remove unnecessary casts, split overlong line]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/i386/cpu_loop.c | 9 +++++++++
 linux-user/main.c          | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index 865413c08f07..2d0918a93ff6 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -314,8 +314,17 @@ void cpu_loop(CPUX86State *env)
     }
 }
 
+static void target_cpu_free(void *obj)
+{
+    CPUArchState *env = ((CPUState *)obj)->env_ptr;
+    target_munmap(env->gdt.base, sizeof(uint64_t) * TARGET_GDT_ENTRIES);
+    g_free(obj);
+}
+
 void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
 {
+    CPUState *cpu = env_cpu(env);
+    OBJECT(cpu)->free = target_cpu_free;
     env->cr[0] = CR0_PG_MASK | CR0_WP_MASK | CR0_PE_MASK;
     env->hflags |= HF_PE_MASK | HF_CPL_MASK;
     if (env->features[FEAT_1_EDX] & CPUID_SSE) {
diff --git a/linux-user/main.c b/linux-user/main.c
index 798fdc0bce8e..47b0c0fc4394 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -238,6 +238,14 @@ CPUArchState *cpu_copy(CPUArchState *env)
 
     new_cpu->tcg_cflags = cpu->tcg_cflags;
     memcpy(new_env, env, sizeof(CPUArchState));
+#if defined(TARGET_I386) || defined(TARGET_X86_64)
+    new_env->gdt.base = target_mmap(0, sizeof(uint64_t) * TARGET_GDT_ENTRIES,
+                                    PROT_READ | PROT_WRITE,
+                                    MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+    memcpy(g2h_untagged(new_env->gdt.base), g2h_untagged(env->gdt.base),
+           sizeof(uint64_t) * TARGET_GDT_ENTRIES);
+    OBJECT(new_cpu)->free = OBJECT(cpu)->free;
+#endif
 
     /* Clone all break/watchpoints.
        Note: Once we support ptrace with hw-debug register access, make sure
-- 
2.39.2


