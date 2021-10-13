Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4CF42B2F1
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 04:55:13 +0200 (CEST)
Received: from localhost ([::1]:41818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUQC-0007QU-Tv
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 22:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHb-0004DA-Mu
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:20 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:38436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHa-0004nM-0k
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:19 -0400
Received: by mail-pf1-x42e.google.com with SMTP id k26so1157625pfi.5
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=54O7y5F6cil48JbVjJeuP4tBSWG4MHFPBxntrZflWpI=;
 b=lv3YyLQxLme3vKyGGKEiCQFJ+bMDhfxALse0U4TYuoIdTxOE7xWwUmWiT5Z+HSaY0M
 QFd5NHl0HAE/rNR8Jt/pMVujOVJHixUA3qejy87L6KuQQaqt0Uh8+yJ2r4eaO7ELTZSq
 ziZpgzp5AaBoNoNvqbFI3Gsb87f0p8NmMADbfKdJkMzY45hGITkRAXqXJPaa2BUnbxD+
 pzN2f3S+yJ5k39XOpOIZhfjF4XJOwx/sFa8QpaAS0Gugh9lHM3vIMgwL/iHYjS25qhXg
 P9KQDJelKmExullvomy8eff9qWj9Zz0q/rrSxB/ll3etagUK5IdwlJ34ydot2SJNPCuf
 hY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=54O7y5F6cil48JbVjJeuP4tBSWG4MHFPBxntrZflWpI=;
 b=v1jO3XJaJKnYYmVL3sp3BqVn/+fKZHfq6I9qafx2qNbiELIqaLoczOXaDTzX5vfQm6
 ekpJi+weDv88FgNuEiH5zxMFHLPQtY08D8zziuUD4ZJcyWPUKtEtjeShMgd9w65xmZcU
 cm1WoyOxMTpkpAIRMfjA7AS5hR8qhuQvaRXAhTgslmGPMe2topFz0OIgqMpjv280hsxf
 6kdtpbazvxhyoEIw3JCtj+FxPI3e2b/4Km2GY7E6C/ArAdFm4wfahLGtwYs8Lz1zdGqd
 proPR011abo1BdrawM20jDSTDUQnuxrXUaVvtXpQOKdT2PicJ8r4pVhng5K0MN7qxYZI
 QydA==
X-Gm-Message-State: AOAM532FhDcY+BOnSZ4t/f6Fq6MvHrEnjWZM11rQ/mKcvyYk2OTeEdMS
 u0SkcdFfCdt7UcUjv4QV37dk45FTzes7gg==
X-Google-Smtp-Source: ABdhPJx1NQH1/y/fU1ZR0Tt4euIOwpBuVEp9F6gNSTtLhB3tjJf3hRD+95ZTLcNSrNCiLFKTzBFa5g==
X-Received: by 2002:a63:f145:: with SMTP id o5mr25793340pgk.273.1634093176605; 
 Tue, 12 Oct 2021 19:46:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/48] target/ppc: Move SPR_DSISR setting to powerpc_excp
Date: Tue, 12 Oct 2021 19:45:26 -0700
Message-Id: <20211013024607.731881-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By doing this while sending the exception, we will have already
done the unwinding, which makes the ppc_cpu_do_unaligned_access
code a bit cleaner.

Update the comment about the expected instruction format.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/excp_helper.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index b7d1767920..88a8de4b80 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -454,13 +454,15 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         break;
     }
     case POWERPC_EXCP_ALIGN:     /* Alignment exception                      */
-        /* Get rS/rD and rA from faulting opcode */
         /*
-         * Note: the opcode fields will not be set properly for a
-         * direct store load/store, but nobody cares as nobody
-         * actually uses direct store segments.
+         * Get rS/rD and rA from faulting opcode.
+         * Note: We will only invoke ALIGN for atomic operations,
+         * so all instructions are X-form.
          */
-        env->spr[SPR_DSISR] |= (env->error_code & 0x03FF0000) >> 16;
+        {
+            uint32_t insn = cpu_ldl_code(env, env->nip);
+            env->spr[SPR_DSISR] |= (insn & 0x03FF0000) >> 16;
+        }
         break;
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
@@ -1462,14 +1464,9 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                  int mmu_idx, uintptr_t retaddr)
 {
     CPUPPCState *env = cs->env_ptr;
-    uint32_t insn;
-
-    /* Restore state and reload the insn we executed, for filling in DSISR.  */
-    cpu_restore_state(cs, retaddr, true);
-    insn = cpu_ldl_code(env, env->nip);
 
     cs->exception_index = POWERPC_EXCP_ALIGN;
-    env->error_code = insn & 0x03FF0000;
-    cpu_loop_exit(cs);
+    env->error_code = 0;
+    cpu_loop_exit_restore(cs, retaddr);
 }
 #endif
-- 
2.25.1


