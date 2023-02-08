Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 461B468F25D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 16:50:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPmhY-0002YV-7L; Wed, 08 Feb 2023 10:49:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanwj@mail.ustc.edu.cn>)
 id 1pPmhR-0002Y8-OF
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 10:49:33 -0500
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanwj@mail.ustc.edu.cn>) id 1pPmhN-0005ud-Cv
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 10:49:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID;
 bh=F6Jfn8VELwxSxUXokZHadjeV2QQJfmlbc53zLAvxhv0=; b=PPjcTDRPWe7NT
 ZQKOCGHD69LCPowKxoUnZYCuuWo8eS20d/NgoWms3283ezb+xoAxko+DfWp0tUAz
 tFq7/VV7iiwJGuiWL3K7ZXvoWrEU+BWra+4hZzJzqKy+dVfchhq2obZkpnPimHIw
 ogZdLBH8Wo6hjZSt9lZMR0QMZJUl5Y=
Received: by ajax-webmail-newmailweb.ustc.edu.cn (Coremail) ; Wed, 8 Feb
 2023 23:49:12 +0800 (GMT+08:00)
X-Originating-IP: [120.204.78.217]
Date: Wed, 8 Feb 2023 23:49:12 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: fanwj@mail.ustc.edu.cn
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, peter.maydell@linaro.org
Subject: [PATCH] linux-user: fix bug about incorrect base addresss of gdt on
 i386 and x86_64
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT3.0.8 dev build
 20210401(c5ff3689) Copyright (c) 2002-2023 www.mailtech.cn ustccn
X-SendMailWithSms: false
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <4172b90.58b08.18631b77860.Coremail.fanwj@mail.ustc.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: LkAmygD3+2t5xONj7C2DAQ--.1W
X-CM-SenderInfo: pidq4yo6pdxzwoxv3uoohg3hdfq/1tbiAQ0QEFQhoQJdKAAAsv
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Received-SPF: pass client-ip=2001:da8:d800::8;
 envelope-from=fanwj@mail.ustc.edu.cn; helo=ustc.edu.cn
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, RCVD_IN_PBL=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
+    memcpy((void*)g2h_untagged(new_env->gdt.base), (void*)g2h_untagged(env->gdt.base), sizeof(uint64_t) * TARGET_GDT_ENTRIES);
+    OBJECT(new_cpu)->free = OBJECT(cpu)->free;
+#endif
 
     /* Clone all break/watchpoints.
        Note: Once we support ptrace with hw-debug register access, make sure
-- 
2.34.1



