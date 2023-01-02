Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D508465AF30
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 11:02:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCHcw-0001LU-K2; Mon, 02 Jan 2023 05:01:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanwj@mail.ustc.edu.cn>)
 id 1pCHcq-0001Ky-TX
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 05:01:01 -0500
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanwj@mail.ustc.edu.cn>) id 1pCHcl-0003Bt-KE
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 05:00:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id:MIME-Version:Resolves:Signed-off-by:
 Content-Transfer-Encoding; bh=4l1q2i7HzvQhIXkI0ocqWh3zSWgQKkdRND
 zTNBNm8eo=; b=HWCyOBQr6D1z58BxUPKIB3Vtt0UG/duLVoW+oEXsfj4iR4l2oz
 YHGmIEQZRyryh2GRCbVyH7cPsbMq6ogqS+rrqnHNEJ10HMLeS14SBy/1RuhpJLed
 vabXPOkr+yuMTUskkzhKPxuCHVTuNQniyNp3CHoWqwWBAy6l9vc38sI18=
Received: from localhost.localdomain (unknown [120.204.77.150])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygDnsF1Eq7JjFgWMAA--.27105S2; 
 Mon, 02 Jan 2023 18:00:42 +0800 (CST)
From: fanwenjie <fanwj@mail.ustc.edu.cn>
To: qemu-devel@nongnu.org
Cc: fanwenjie <fanwj@mail.ustc.edu.cn>
Subject: [PATCH] linux-user: fix bug about incorrect base addresss of idt and
 gdt on i386 and x86_64
Date: Mon,  2 Jan 2023 18:00:31 +0800
Message-Id: <20230102100031.1122-1-fanwj@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1405
Signed-off-by: fanwenjie <fanwj@mail.ustc.edu.cn>
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: LkAmygDnsF1Eq7JjFgWMAA--.27105S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ury5AFyDZFy7urWkZryfCrg_yoW8ZFW5pa
 sagF43JF48tFs8J3ZIqwnYvFyUXF4kKrWUAw1fCanYq3W8Jry8ur1DCay7Wwn8Xw48ur4S
 yr9rAFWDu3y7XrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUym14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
 rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
 vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
 x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
 xKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
 14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUdEfOUUUUU=
X-CM-SenderInfo: pidq4yo6pdxzwoxv3uoohg3hdfq/1tbiAQwTEFQhoPOJ6QANsF
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

---
 linux-user/i386/cpu_loop.c | 10 ++++++++++
 linux-user/main.c          | 11 +++++++++++
 2 files changed, 21 insertions(+)

diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index 865413c08f..1f23bc5e3a 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -314,8 +314,18 @@ void cpu_loop(CPUX86State *env)
     }
 }
 
+static void target_cpu_free(void *obj)
+{
+    CPUArchState* env = ((CPUState*)obj)->env_ptr;
+    target_munmap(env->idt.base, sizeof(uint64_t) * (env->idt.limit + 1));
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
index a17fed045b..2276040548 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -234,6 +234,17 @@ CPUArchState *cpu_copy(CPUArchState *env)
 
     new_cpu->tcg_cflags = cpu->tcg_cflags;
     memcpy(new_env, env, sizeof(CPUArchState));
+#if defined(TARGET_I386) || defined(TARGET_X86_64)
+    new_env->gdt.base = target_mmap(0, sizeof(uint64_t) * TARGET_GDT_ENTRIES,
+                                    PROT_READ|PROT_WRITE,
+                                    MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
+    new_env->idt.base = target_mmap(0, sizeof(uint64_t) * (env->idt.limit + 1),
+                                PROT_READ|PROT_WRITE,
+                                MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
+    memcpy((void*)new_env->gdt.base, (void*)env->gdt.base, sizeof(uint64_t) * TARGET_GDT_ENTRIES);
+    memcpy((void*)new_env->idt.base, (void*)env->idt.base, sizeof(uint64_t) * (env->idt.limit + 1));
+    OBJECT(new_cpu)->free = OBJECT(cpu)->free;
+#endif
 
     /* Clone all break/watchpoints.
        Note: Once we support ptrace with hw-debug register access, make sure
-- 
2.34.1



