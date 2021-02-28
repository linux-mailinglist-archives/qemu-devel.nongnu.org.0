Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA55C327550
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:44:43 +0100 (CET)
Received: from localhost ([::1]:52082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVju-0003Kc-L1
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:44:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPr-0005f3-TC
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:59 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:37207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPg-0007ke-6w
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:59 -0500
Received: by mail-pl1-x62b.google.com with SMTP id p5so8770754plo.4
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4uX9QPl9X+aFdcuNr9JmvACrJ855sGkXtJeh0OS686U=;
 b=mwRcCD0GtXiR+UlHBamF9ejU1dExxzLTl+TeQZ/tqyFxumc7e8dKwgan3tbPpiziCH
 QfMrAO5yJu/AK36SRyErnKhEVCchw0zf+DUKJwcrtzzmKYlEi8WbA+1cyeOIqb0govku
 MxjU0QHGCKjkGGFdRQHefekfGhy8AGplxULNhV1CswCtis9haAmJbOdRsbQqhqwfobI4
 ozlBy31pQWuRnIH8o8NROr31luF900E8XZnT7Oq5GbU0n0+FZu3itCb21jPCzXuRClDp
 Ssbz0MIwzffvMcpAluxlgdouE90lsYJQGzdn+P4kdXjLbvR1MvnlEh9QlJtBwaFLHOET
 4zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4uX9QPl9X+aFdcuNr9JmvACrJ855sGkXtJeh0OS686U=;
 b=eR47mGjrZs9NvHH8ubx8s45d5md33WCHaMM1I3j1otrUEG0t+oer1QgIfmpV2OX2m1
 lU/v2v2GARjM0oAnIO4NIj4g4Ap51FpUWFFGsp56lpbKwqK1i/XM2nIvipIEKXIEkjlR
 ylOrxF5aFKo54LICn2jBcMCSzDoH8PQF906AzeD2i2yP9gddhSZ58kcj9LrOp6kJRmf0
 Zl0w/Gu7dHbBET4TMF22DkF06JmtCpn7uqg/zwpI391aMFhXIUDmosnV4LIWiTCCNlo2
 /ssJwB6QWCogNfN3VdsqQPylGZ0vClGfHsxJm1VEFBrea4ELmw1ZXKSv7Mi1yowB/G4u
 PHcg==
X-Gm-Message-State: AOAM5318ttfe+usfLmjsdKeSZjtSyLoutOrCoQUpSwEfsuhsk3XKc/NS
 qd26jK+Xab9HdefE0ZUdmf/ttuZNwKyajw==
X-Google-Smtp-Source: ABdhPJzzM2JcFoH+H0+TTgIBGdQ1OwSiPjdtuEttTvEUnxE9caaULRuwAEgzWk89YjERKp6O6viqMQ==
X-Received: by 2002:a17:90b:1045:: with SMTP id
 gq5mr14615356pjb.101.1614554625595; 
 Sun, 28 Feb 2021 15:23:45 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/50] target/i386: Leave TF in DisasContext.flags
Date: Sun, 28 Feb 2021 15:22:56 -0800
Message-Id: <20210228232321.322053-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's just as easy to clear the flag with AND than assignment.
In two cases the test for the bit can be folded together with
the test for HF_INHIBIT_IRQ_MASK.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 9004f83c52..92669bc142 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -101,7 +101,6 @@ typedef struct DisasContext {
     uint8_t vex_v;  /* vex vvvv register, without 1's complement.  */
     CCOp cc_op;  /* current CC operation */
     bool cc_op_dirty;
-    int tf;     /* TF cpu flag */
     int jmp_opt; /* use direct block chaining for direct jumps */
     int repz_opt; /* optimize jumps within repz instructions */
     int mem_index; /* select memory access functions */
@@ -2656,7 +2655,7 @@ do_gen_eob_worker(DisasContext *s, bool inhibit, bool recheck_tf, bool jr)
     } else if (recheck_tf) {
         gen_helper_rechecking_single_step(cpu_env);
         tcg_gen_exit_tb(NULL, 0);
-    } else if (s->tf) {
+    } else if (s->flags & HF_TF_MASK) {
         gen_helper_single_step(cpu_env);
     } else if (jr) {
         tcg_gen_lookup_and_goto_ptr();
@@ -5534,7 +5533,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         if (s->base.is_jmp) {
             gen_jmp_im(s, s->pc - s->cs_base);
             if (reg == R_SS) {
-                s->tf = 0;
+                s->flags &= ~HF_TF_MASK;
                 gen_eob_inhibit_irq(s, true);
             } else {
                 gen_eob(s);
@@ -5600,7 +5599,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         if (s->base.is_jmp) {
             gen_jmp_im(s, s->pc - s->cs_base);
             if (reg == R_SS) {
-                s->tf = 0;
+                s->flags &= ~HF_TF_MASK;
                 gen_eob_inhibit_irq(s, true);
             } else {
                 gen_eob(s);
@@ -8500,7 +8499,6 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     g_assert(LMA(dc) == ((flags & HF_LMA_MASK) != 0));
     g_assert(ADDSEG(dc) == ((flags & HF_ADDSEG_MASK) != 0));
 
-    dc->tf = (flags >> TF_SHIFT) & 1;
     dc->cc_op = CC_OP_DYNAMIC;
     dc->cc_op_dirty = false;
     dc->popl_esp_hack = 0;
@@ -8515,8 +8513,8 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->cpuid_ext3_features = env->features[FEAT_8000_0001_ECX];
     dc->cpuid_7_0_ebx_features = env->features[FEAT_7_0_EBX];
     dc->cpuid_xsave_features = env->features[FEAT_XSAVE];
-    dc->jmp_opt = !(dc->tf || dc->base.singlestep_enabled ||
-                    (flags & HF_INHIBIT_IRQ_MASK));
+    dc->jmp_opt = !(dc->base.singlestep_enabled ||
+                    (flags & (HF_TF_MASK | HF_INHIBIT_IRQ_MASK)));
     /* Do not optimize repz jumps at all in icount mode, because
        rep movsS instructions are execured with different paths
        in !repz_opt and repz_opt modes. The first one was used
@@ -8591,7 +8589,7 @@ static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 
     pc_next = disas_insn(dc, cpu);
 
-    if (dc->tf || (dc->base.tb->flags & HF_INHIBIT_IRQ_MASK)) {
+    if (dc->flags & (HF_TF_MASK | HF_INHIBIT_IRQ_MASK)) {
         /* if single step mode, we generate only one instruction and
            generate an exception */
         /* if irq were inhibited with HF_INHIBIT_IRQ_MASK, we clear
-- 
2.25.1


