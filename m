Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEA3442004
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:26:34 +0100 (CET)
Received: from localhost ([::1]:43734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhc0w-0008WH-3v
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9C-0007zA-WB
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:03 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:46014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9A-0001Ci-EJ
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:02 -0400
Received: by mail-qt1-x832.google.com with SMTP id r2so15244312qtw.12
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=54O7y5F6cil48JbVjJeuP4tBSWG4MHFPBxntrZflWpI=;
 b=QX8lpa/N6MGCc5XN0sEQ8Tozk/ZcRRE1sKnK/UAcaUYvlax/L3h/Z38wKdpO/t91p0
 JX7jUZ3wkH9lryP+LW8tXF3h5KLQzfD5br9Xd5KgqoNoaX8KJQ0iGPAoCLIEW2J7B3p1
 C1/VQ/2oQb8Aay/uYIBLE+9XZiSKzp1MGVyVqjvUtR9m0BBiuu9e/IHmIhnhjXw4xUPm
 hE7SbBJzIFVEbfDF28j74+OWMCti7+O+IygVexfgmTJCzMlHqzSuOjhycHmXyT+ShmhY
 7Bw/Voe/YzD1e7+34DfunY6D2Qvm7BlY2d6avghbwMtZFhjssfHNhazu2lFlh4fz4a4o
 9vHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=54O7y5F6cil48JbVjJeuP4tBSWG4MHFPBxntrZflWpI=;
 b=Mk4eETm7mDd0biQPvxfpX0fmSP1Rl1Xq81dRlu6tDQ7hjZ/AIjPASEhmT3vaGYGANL
 w8/E7HGnVF8FJXGSNkyHT57Opn8VI0LeXq7W6npXpjBha8kRbFa8BmN5tr4PcSB3g22s
 2jYHcvPbRNxRUOmOkOxqoZ4wBWQL6MsGqTOfQQRK3looO2QDQZlnpFMu8HN7PX8+ClnN
 HMZw7frEi0vJkHDsXGEWZJuAx9GlwdeAN4CY40nipSeLO/aZuG2++1DJX2Lsv5VaH/uI
 Ua3rCSjBKJNtcD7xabH7qmioVSc+X7PHTQX55BjR4FQS2DlrTHbfgSq0LB2tGicvgNUy
 6Onw==
X-Gm-Message-State: AOAM53252MkFKalyHjKt+3X80jp9rIBdaAB3M49DmJwlF5zkqNa4OTiU
 aG0rauiSIr+YJdX1FyFHEWmgiY8JoI5u6A==
X-Google-Smtp-Source: ABdhPJx1U+T0jy21FCOp2nGRsnxUoeYX2O0X51TGdFkyla7n7V6sdWqqctt4njnho5MRKjxJSC4WvQ==
X-Received: by 2002:ac8:58c6:: with SMTP id u6mr31956705qta.230.1635787859555; 
 Mon, 01 Nov 2021 10:30:59 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id 13sm1222289qkc.40.2021.11.01.10.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:30:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 48/60] target/ppc: Move SPR_DSISR setting to powerpc_excp
Date: Mon,  1 Nov 2021 13:27:17 -0400
Message-Id: <20211101172729.23149-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


