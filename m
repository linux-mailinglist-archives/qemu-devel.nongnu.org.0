Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EFA25BBA2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 09:28:11 +0200 (CEST)
Received: from localhost ([::1]:38462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDjfG-0003kD-Av
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 03:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDje5-0001mD-T6
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 03:26:57 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:46935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDje4-0001lB-1V
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 03:26:57 -0400
Received: by mail-pg1-x541.google.com with SMTP id 31so1390525pgy.13
 for <qemu-devel@nongnu.org>; Thu, 03 Sep 2020 00:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bF4Mg8kcTZXoqQQUyRlGmfPMUb1QHX4VgeyA3hgWEws=;
 b=BNUCe9OGdtJ6H+UdrcrIx1AoZdoJF6WKOsllsZANixGvj7lKVoM1fVXoPQjsth24Uv
 /TlFU2DggIeQ8bQlphdfpCN48lSW/oBmCC0e4fD1pckV3qI5NKvwTQXejVwUpOaICN7A
 l3u+Fr9BaR0b5TfVjs12eHurmZPC9PWG/GFRCBAcpNR0QxGFFEf+QmRBanN6X554B8+8
 DLNTo/1l1JhdV4zO1YOlyfrYIhFfBL8PBc1M7tZsKW857g8Bq9bBsF2Suh7BADZlSPJa
 SEe3KR4OojBZbTlymWWjKKYFlUtwsJacJXcd7fUwCLpYF/qp0/RJCKovQ4Z7Dk6FkHnM
 wFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bF4Mg8kcTZXoqQQUyRlGmfPMUb1QHX4VgeyA3hgWEws=;
 b=RYx4hMgCKumNoWaFSOHmDzkaTSLRIQegPRKwagchvUgtfBQMOnnx/Id7C2dFtzAekE
 kwwsqvRHPILg/Uehy0XZktahWxvXXkMG8vXVRZyARRaOfyX9HZEw8tNutju3o+rDmgms
 EYaEDYoX9Y3DuQvtFi5ILONMQT/OQatZwqulR/kANLiR1wYj70BSV9zNDXHaPoOO7yUq
 ujEjqFwur+8uCZ6FBHnk8UnJNwkxd6xInNbEGcWJ/Wf7EtJNHjO+3GMJ38Uqj8+2v1SI
 czodpvmDxnkgl1aFK102Rm2dL2QyiPyP8G6Ko3Z5+q7MGcRWPymvFB+F7RC0Z8fRdkPs
 mCOA==
X-Gm-Message-State: AOAM533FmVDmucdscEXzjzw4QNK/L161gTwpGLST6PIcJvDTUuS+jWOu
 oKmTqmHqSsq6L1b1WcFbkPsB6bzL9C6nSQ==
X-Google-Smtp-Source: ABdhPJxU/etOyyLiODyCbINHSnKa+AkbE8nHJswFicxTJndaNk9h64997V1X6U31S3o5sJBOR8CfbQ==
X-Received: by 2002:aa7:83cf:: with SMTP id j15mr2472327pfn.251.1599118013988; 
 Thu, 03 Sep 2020 00:26:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id x185sm1930229pfc.188.2020.09.03.00.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 00:26:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/12] target/microblaze: Collected fixes for env->iflags
Date: Thu,  3 Sep 2020 00:26:39 -0700
Message-Id: <20200903072650.1360454-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200903072650.1360454-1-richard.henderson@linaro.org>
References: <20200903072650.1360454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: edgar.iglesias@xilinx.com, thuth@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are several problems here that can result in soft lockup,
depending on exactly where an interrupt or exception is delivered:

Include BIMM_FLAG in IFLAGS_TB_MASK, since it needs to follow D_FLAG.
Ensure that iflags is 0 when entering an interrupt/exception handler.
Add mb_cpu_synchronize_from_tb to restore iflags from tb->flags.
The change to t_sync_flags is cosmetic, but makes the code clearer.

This fixes the reported regression in acceptance/replay_kernel.py.

Fixes: 683a247ed7a4 ("target/microblaze: Store "current" iflags in insn_start")
Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/cpu.h       |  3 ++-
 target/microblaze/cpu.c       | 11 +++++++++++
 target/microblaze/helper.c    | 17 +++++++++++------
 target/microblaze/translate.c |  4 ++--
 4 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index d11b6fa995..a25a2b427f 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -270,7 +270,8 @@ struct CPUMBState {
 #define D_FLAG		(1 << 19)  /* Bit in ESR.  */
 
 /* TB dependent CPUMBState.  */
-#define IFLAGS_TB_MASK  (D_FLAG | IMM_FLAG | DRTI_FLAG | DRTE_FLAG | DRTB_FLAG)
+#define IFLAGS_TB_MASK  (D_FLAG | BIMM_FLAG | IMM_FLAG | \
+                         DRTI_FLAG | DRTE_FLAG | DRTB_FLAG)
 #define MSR_TB_MASK     (MSR_UM | MSR_VM | MSR_EE)
 
     uint32_t iflags;
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 67017ecc33..6392524135 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -80,6 +80,16 @@ static void mb_cpu_set_pc(CPUState *cs, vaddr value)
     MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
 
     cpu->env.pc = value;
+    /* Ensure D_FLAG and IMM_FLAG are clear for the new PC */
+    cpu->env.iflags = 0;
+}
+
+static void mb_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
+{
+    MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
+
+    cpu->env.pc = tb->pc;
+    cpu->env.iflags = tb->flags & IFLAGS_TB_MASK;
 }
 
 static bool mb_cpu_has_work(CPUState *cs)
@@ -321,6 +331,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->cpu_exec_interrupt = mb_cpu_exec_interrupt;
     cc->dump_state = mb_cpu_dump_state;
     cc->set_pc = mb_cpu_set_pc;
+    cc->synchronize_from_tb = mb_cpu_synchronize_from_tb;
     cc->gdb_read_register = mb_cpu_gdb_read_register;
     cc->gdb_write_register = mb_cpu_gdb_write_register;
     cc->tlb_fill = mb_cpu_tlb_fill;
diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index 48547385b0..00090526da 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -113,7 +113,10 @@ void mb_cpu_do_interrupt(CPUState *cs)
     uint32_t t, msr = mb_cpu_read_msr(env);
 
     /* IMM flag cannot propagate across a branch and into the dslot.  */
-    assert(!((env->iflags & D_FLAG) && (env->iflags & IMM_FLAG)));
+    assert((env->iflags & (D_FLAG | IMM_FLAG)) != (D_FLAG | IMM_FLAG));
+    /* BIMM flag cannot be set without D_FLAG. */
+    assert((env->iflags & (D_FLAG | BIMM_FLAG)) != BIMM_FLAG);
+    /* RTI flags are private to translate. */
     assert(!(env->iflags & (DRTI_FLAG | DRTE_FLAG | DRTB_FLAG)));
     env->res_addr = RES_ADDR_NONE;
     switch (cs->exception_index) {
@@ -146,7 +149,7 @@ void mb_cpu_do_interrupt(CPUState *cs)
                           env->pc, env->ear,
                           env->esr, env->iflags);
             log_cpu_state_mask(CPU_LOG_INT, cs, 0);
-            env->iflags &= ~(IMM_FLAG | D_FLAG);
+            env->iflags = 0;
             env->pc = cpu->cfg.base_vectors + 0x20;
             break;
 
@@ -186,14 +189,14 @@ void mb_cpu_do_interrupt(CPUState *cs)
                           "exception at pc=%x ear=%" PRIx64 " iflags=%x\n",
                           env->pc, env->ear, env->iflags);
             log_cpu_state_mask(CPU_LOG_INT, cs, 0);
-            env->iflags &= ~(IMM_FLAG | D_FLAG);
+            env->iflags = 0;
             env->pc = cpu->cfg.base_vectors + 0x20;
             break;
 
         case EXCP_IRQ:
             assert(!(msr & (MSR_EIP | MSR_BIP)));
             assert(msr & MSR_IE);
-            assert(!(env->iflags & D_FLAG));
+            assert(!(env->iflags & (D_FLAG | IMM_FLAG)));
 
             t = (msr & (MSR_VM | MSR_UM)) << 1;
 
@@ -226,13 +229,14 @@ void mb_cpu_do_interrupt(CPUState *cs)
             mb_cpu_write_msr(env, msr);
 
             env->regs[14] = env->pc;
+            env->iflags = 0;
             env->pc = cpu->cfg.base_vectors + 0x10;
             //log_cpu_state_mask(CPU_LOG_INT, cs, 0);
             break;
 
         case EXCP_HW_BREAK:
-            assert(!(env->iflags & IMM_FLAG));
-            assert(!(env->iflags & D_FLAG));
+            assert(!(env->iflags & (D_FLAG | IMM_FLAG)));
+
             t = (msr & (MSR_VM | MSR_UM)) << 1;
             qemu_log_mask(CPU_LOG_INT,
                           "break at pc=%x msr=%x %x iflags=%x\n",
@@ -242,6 +246,7 @@ void mb_cpu_do_interrupt(CPUState *cs)
             msr |= t;
             msr |= MSR_BIP;
             env->regs[16] = env->pc;
+            env->iflags = 0;
             env->pc = cpu->cfg.base_vectors + 0x18;
             mb_cpu_write_msr(env, msr);
             break;
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index a377818b5e..a8a3249185 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -91,8 +91,8 @@ static int typeb_imm(DisasContext *dc, int x)
 static void t_sync_flags(DisasContext *dc)
 {
     /* Synch the tb dependent flags between translator and runtime.  */
-    if ((dc->tb_flags ^ dc->base.tb->flags) & ~MSR_TB_MASK) {
-        tcg_gen_movi_i32(cpu_iflags, dc->tb_flags & ~MSR_TB_MASK);
+    if ((dc->tb_flags ^ dc->base.tb->flags) & IFLAGS_TB_MASK) {
+        tcg_gen_movi_i32(cpu_iflags, dc->tb_flags & IFLAGS_TB_MASK);
     }
 }
 
-- 
2.25.1


