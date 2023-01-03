Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC3165BF29
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 12:40:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCfdF-0001Qb-Qk; Tue, 03 Jan 2023 06:39:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanwj@mail.ustc.edu.cn>)
 id 1pCfdD-0001QG-Dr
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 06:38:59 -0500
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanwj@mail.ustc.edu.cn>) id 1pCfd9-0001mA-3z
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 06:38:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id:MIME-Version:Content-Transfer-Encoding; bh=Fn5H66cR4c
 NOY4yHKVj2estDAAcLk37UhKNCizvf71k=; b=qcMvsrnxN4BgwkZ8vhECqu6HGG
 /xVD+DlrbhCwAX4P1/zsVz75kv03hixUXuGM7qDTOdt2tQ6vTKaJRaWDVQseQHd3
 Sx6+pOFOWGY5bcxt3iysWxatFq5MPz4Sh7ikwLOSe37ApzHWXzGwBr0mPXuR5bkC
 71dh2Glu56k1+34hs=
Received: from localhost.localdomain (unknown [120.204.77.150])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygDnsF29E7RjG8KTAA--.28714S2; 
 Tue, 03 Jan 2023 19:38:42 +0800 (CST)
From: fanwenjie <fanwj@mail.ustc.edu.cn>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	fanwenjie <fanwj@mail.ustc.edu.cn>
Subject: [PATCH] linux-user: fix bug about incorrect base addresss of gdt on
 i386 and x86_64
Date: Tue,  3 Jan 2023 19:38:33 +0800
Message-Id: <20230103113833.3421-1-fanwj@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: LkAmygDnsF29E7RjG8KTAA--.28714S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFy7ZFyrJF4kXw1kGF4fGrg_yoW8ZrWfpF
 Za9F13tF1Utrs8Ja9Iq3ZYv3W7uF1kKrWUAw1fCrsYvFykJry8urnrCa9ru34DXw48ur4r
 tF98JFWDWay7X3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48J
 MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
 AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
 0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
 v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
 wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUb4v3UUUUUU==
X-CM-SenderInfo: pidq4yo6pdxzwoxv3uoohg3hdfq/1tbiAQ8TEFQhoPPBjAAosO
Received-SPF: pass client-ip=2001:da8:d800::8;
 envelope-from=fanwj@mail.ustc.edu.cn; helo=ustc.edu.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On linux user mode, CPUX86State::gdt::base from Different CPUX86State Objects have same value, It is incorrect! Every CPUX86State::gdt::base Must points to independent memory space. 

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1405
Signed-off-by: fanwenjie <fanwj@mail.ustc.edu.cn>
---
 linux-user/i386/cpu_loop.c | 9 +++++++++
 linux-user/main.c          | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index 865413c..48511cd 100644
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
index a17fed0..3acd9b4 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -234,6 +234,13 @@ CPUArchState *cpu_copy(CPUArchState *env)
 
     new_cpu->tcg_cflags = cpu->tcg_cflags;
     memcpy(new_env, env, sizeof(CPUArchState));
+#if defined(TARGET_I386) || defined(TARGET_X86_64)
+    new_env->gdt.base = target_mmap(0, sizeof(uint64_t) * TARGET_GDT_ENTRIES,
+                                    PROT_READ|PROT_WRITE,
+                                    MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
+    memcpy((void*)new_env->gdt.base, (void*)env->gdt.base, sizeof(uint64_t) * TARGET_GDT_ENTRIES);
+    OBJECT(new_cpu)->free = OBJECT(cpu)->free;
+#endif
 
     /* Clone all break/watchpoints.
        Note: Once we support ptrace with hw-debug register access, make sure
-- 
2.34.1



