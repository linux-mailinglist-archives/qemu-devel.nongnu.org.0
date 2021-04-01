Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D5735123F
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 11:31:39 +0200 (CEST)
Received: from localhost ([::1]:60768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRtfu-0007aR-DE
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 05:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lRtbh-0003vE-BU
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:27:17 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:41832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lRtbf-0000iU-O7
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:27:17 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 nh23-20020a17090b3657b02900c0d5e235a8so725616pjb.0
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 02:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uzpsUtOcXRxFpFM1gTpswBQapI2J1zS+kL4x32MBeUA=;
 b=P/2SA3a2e2uO8g7OZeVtGJ867cbnZQ+7yqGtTtMrAC8DoSaznf1b3BwxC2lpA6/NvA
 EAlGBNg3lxb2qo+q9E+DL78Etk3VA+ORxi3LF4f7vWYdor0SWcHqB6yZneiW7bSSEoTj
 gLvIhmZG5tfrLJxj9/JU2Axw4n3BUNqngOYl7KaPMbYgGQmHSmos0vTQ3qXfHcNhWeHM
 S1IrerwUahysCL3+rPBlm1OHkBokJWZvB9fxAWvQ3rSYmW4/P9A2+0EhSnq8UkNIsdPv
 rRt6Z6mxLkxuPQNlJWDhdE9PRpBrFGrpXvKnKMPgwB4MEO+2CUSPHFpaB+eSLkf/xwDJ
 x5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uzpsUtOcXRxFpFM1gTpswBQapI2J1zS+kL4x32MBeUA=;
 b=mwhQmUcB62SLUSdwdGUMELgB2nt3GzFY6LHce2gSOzq13/SjInWuqtnOov++tkKf/Z
 sDNuX2TONkV9jfZd4swysbNqAdVEQ+1CO9eAHaIm3FzIPK6+N7zkPb+Ta4fyXw+koPep
 WsJd93yzitIc/fQlPjk9h4ZPGdBl2zSdjj+r2TgstBxwn6cxXHLFYdZV7V/jDWlDi4o0
 8ckJxBa1EKVU7mKMmOfqYxZUzCNlZ5wruvI08PnYJ8o/7cx3g7ND/r3/EM0EJfuLnWPG
 lUPVhR5NaU655f5aIUIb8D+pHwPGJK28T7Hk5K30n5SVfkN8iD5n8FguNbl/Ns/ANwNE
 TwlA==
X-Gm-Message-State: AOAM530/4YCw6dJountSWLHRasyu+fxNy83QdCPlsGXEz66v6cx4mYan
 yGtQdmuQnENnMh6ypJ8tnfhC2hn4y9QbC/Hg
X-Google-Smtp-Source: ABdhPJxQ8dF9lPnwDmfu9ps773X/glnUp84Xb42s0HD6fLPgdlZVQpDoQtXsgOxEQWU8AWa36vF3kQ==
X-Received: by 2002:a17:90a:d301:: with SMTP id
 p1mr7951997pju.233.1617269234240; 
 Thu, 01 Apr 2021 02:27:14 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id i7sm4751319pgq.16.2021.04.01.02.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 02:27:13 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v2 3/4] target/riscv: handle RNMI interrupt and exception
Date: Thu,  1 Apr 2021 17:26:50 +0800
Message-Id: <20210401092659.12014-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210401092659.12014-1-frank.chang@sifive.com>
References: <20210401092659.12014-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu_bits.h   |  4 ++++
 target/riscv/cpu_helper.c | 49 +++++++++++++++++++++++++++++++++++----
 2 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index a376ede0cc5..937b1f28455 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -607,4 +607,8 @@
 #define MIE_UTIE                           (1 << IRQ_U_TIMER)
 #define MIE_SSIE                           (1 << IRQ_S_SOFT)
 #define MIE_USIE                           (1 << IRQ_U_SOFT)
+
+/* RISC-V-specific interrupt pending bits. */
+#define CPU_INTERRUPT_RNMI                 CPU_INTERRUPT_TGT_EXT_0
+
 #endif
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 21c54ef5613..67a633154a9 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -38,6 +38,19 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 #ifndef CONFIG_USER_ONLY
 static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 {
+    if (riscv_feature(env, RISCV_FEATURE_RNMI)) {
+        /* Priority: RNMI > Other interrupt. */
+        if (env->nmip && env->nmie) {
+            return ctz64(env->nmip); /* since non-zero */
+        } else if (!env->nmie) {
+            /*
+             * We are already in RNMI handler,
+             * other interrupts cannot preempt.
+             */
+            return EXCP_NONE;
+        }
+    }
+
     target_ulong irqs;
 
     target_ulong mstatus_mie = get_field(env->mstatus, MSTATUS_MIE);
@@ -80,7 +93,9 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (interrupt_request & CPU_INTERRUPT_HARD) {
+    uint32_t mask = CPU_INTERRUPT_HARD | CPU_INTERRUPT_RNMI;
+
+    if (interrupt_request & mask) {
         RISCVCPU *cpu = RISCV_CPU(cs);
         CPURISCVState *env = &cpu->env;
         int interruptno = riscv_cpu_local_irq_pending(env);
@@ -909,6 +924,23 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     target_ulong tval = 0;
     target_ulong htval = 0;
     target_ulong mtval2 = 0;
+    target_ulong nextpc;
+    bool nmi_execp = false;
+
+    if (riscv_feature(env, RISCV_FEATURE_RNMI)) {
+        nmi_execp = !env->nmie && !async;
+
+        if (env->nmip && async) {
+            env->nmie = false;
+            env->mnstatus = set_field(env->mnstatus, MSTATUS_MPP,
+                                      env->priv);
+            env->mncause = cause;
+            env->mnepc = env->pc;
+            env->pc = env->rnmi_irqvec;
+            riscv_cpu_set_mode(env, PRV_M);
+            goto handled;
+        }
+    }
 
     if  (cause == RISCV_EXCP_SEMIHOST) {
         if (env->priv >= PRV_S) {
@@ -967,7 +999,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                   __func__, env->mhartid, async, cause, env->pc, tval,
                   riscv_cpu_get_trap_name(cause, async));
 
-    if (env->priv <= PRV_S &&
+    if (env->priv <= PRV_S && !nmi_execp &&
             cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
         /* handle the trap in S-mode */
         if (riscv_has_ext(env, RVH)) {
@@ -1056,8 +1088,15 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         env->mepc = env->pc;
         env->mbadaddr = tval;
         env->mtval2 = mtval2;
-        env->pc = (env->mtvec >> 2 << 2) +
-            ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
+
+        if (nmi_execp) {
+            nextpc = env->rnmi_excpvec;
+        } else {
+            nextpc = (env->mtvec >> 2 << 2) +
+                ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
+        }
+        env->pc = nextpc;
+
         riscv_cpu_set_mode(env, PRV_M);
     }
 
@@ -1068,6 +1107,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
      */
 
     env->two_stage_lookup = false;
+
+handled:
 #endif
     cs->exception_index = EXCP_NONE; /* mark handled to qemu */
 }
-- 
2.17.1


