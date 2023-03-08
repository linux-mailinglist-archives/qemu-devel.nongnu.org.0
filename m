Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 846196B0954
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:35:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZtu5-0004na-6Y; Wed, 08 Mar 2023 08:32:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtrG-0001qz-U9
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:35 -0500
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtrD-0006Be-9z
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:30 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M4rD7-1pbozq1Vu3-001yrJ; Wed, 08
 Mar 2023 14:29:17 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "fanwj@mail.ustc.edu.cn" <fanwj@mail.ustc.edu.cn>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 28/28] linux-user: fix bug about incorrect base addresss of gdt
 on i386 and x86_64
Date: Wed,  8 Mar 2023 14:28:57 +0100
Message-Id: <20230308132857.161793-29-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/ce/HEm01mDc34IyZsFfx4HnYPlh/PawtXMSggN7zsTuxfM5ZtX
 LtlVVMpEYWZv5PGgyK8T66rQmzjmFtqR5leFS28LsT0eVUm4meHGWuKUycO4GwY+l6BxFKZ
 4UcdD+rvmWD5aB8AQ8PZvky5MhojqsgD9c2eMXeW1KYhGvUofRd3VtRUy451nVXlp9zoBGk
 bbbVRrAJc+5depC0IllrA==
UI-OutboundReport: notjunk:1;M01:P0:80GdTV8838A=;UsOPMBOXK6z5N6giV80HdVJnawn
 Lp9FqWuT8rcNDAVG/1hSgltwYnXVJNgmHlk/crmmFsYL8j842u/qsNLLWhT7rsFxyhcVgX1BW
 mmoLx83oDMED70qwOuBEFqUnwCz5CrZIxPMUTRJ9M7OxJ/9xj3PibkmiOHMfi3/Des5K5wmB1
 LIf2jVkoO89AMl2Lrsap/v/mFOn0CUiXtIJddEYZRQ+SynDS30rhOui5dgybxNHMuL2F7Ak0t
 tCTZQnigjPA7jZLZ+1F2c2bXzmK2vzyvKaRBmDPvVxFEwbvsGI/Ir4o6pBrLinU+35ygguMXK
 4nmfj4uD6rZw2jwUpqABOo58IjF9h0BxS+2jlj84KHHWVcRHp0+8oDseOxxYLkampof3yAFcC
 DuWmoJWSvMDZO2XIstP8gX2jy2ybOEcotvhnAiWlHseHcfSjJwzETWP0JctkPiDjWblc/W9Tn
 WIHFSyeuGgM8RU3Zf/Kd7fqQpuV7kAOs3hPvCUHM9LBgeCwfJn0+8SpobxDcmg8fAPD/NKL77
 TcFhhhqbklPS1nWsP4PduRfKH1qXS8eVJUZua4HbSAu5/sslaW/qH6+2a7iDpob2bZ+ZCdn0w
 iC4PNmS7oFVhbBXr8QRBpCSW6JoernfL4MUNZ/aG7kTe0ZSd/mieyzImPaEwpiRlBHI2GzndG
 XLn7KJqnmR6PjYKsMKkw6IUAtc8J0kPH3N3wbI77vA==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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

On linux user mode, CPUX86State::gdt::base from Different CPUX86State Objects have same value, It is incorrect! Every CPUX86State::gdt::base Must points to independent memory space.

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
index 865413c08f07..48511cd68875 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -314,8 +314,17 @@ void cpu_loop(CPUX86State *env)
     }
 }
 
+static void target_cpu_free(void *obj)
+{
+    CPUArchState* env = ((CPUState*)obj)->env_ptr;
+    target_munmap(env->gdt.base, sizeof(uint64_t) * TARGET_GDT_ENTRIES);
+    g_free(obj);
+}
+
 void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
 {
+    CPUState* cpu = env_cpu(env);
+    OBJECT(cpu)->free = target_cpu_free;
     env->cr[0] = CR0_PG_MASK | CR0_WP_MASK | CR0_PE_MASK;
     env->hflags |= HF_PE_MASK | HF_CPL_MASK;
     if (env->features[FEAT_1_EDX] & CPUID_SSE) {
diff --git a/linux-user/main.c b/linux-user/main.c
index 798fdc0bce8e..69ca5a4b9b08 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -238,6 +238,14 @@ CPUArchState *cpu_copy(CPUArchState *env)
 
     new_cpu->tcg_cflags = cpu->tcg_cflags;
     memcpy(new_env, env, sizeof(CPUArchState));
+#if defined(TARGET_I386) || defined(TARGET_X86_64)
+    new_env->gdt.base = target_mmap(0, sizeof(uint64_t) * TARGET_GDT_ENTRIES,
+                                    PROT_READ|PROT_WRITE,
+                                    MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
+    memcpy(g2h_untagged(new_env->gdt.base), g2h_untagged(env->gdt.base),
+           sizeof(uint64_t) * TARGET_GDT_ENTRIES);
+    OBJECT(new_cpu)->free = OBJECT(cpu)->free;
+#endif
 
     /* Clone all break/watchpoints.
        Note: Once we support ptrace with hw-debug register access, make sure
-- 
2.39.2


