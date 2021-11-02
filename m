Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CFD442D25
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:49:50 +0100 (CET)
Received: from localhost ([::1]:33556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsIW-0005UW-SU
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrhA-0001Ov-RH
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:12 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:34342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrh9-0001y7-6R
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:12 -0400
Received: by mail-qk1-x72d.google.com with SMTP id bq14so7755137qkb.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=54O7y5F6cil48JbVjJeuP4tBSWG4MHFPBxntrZflWpI=;
 b=UV1GmcKaWi7JsNo+xvsGQ3x42SkuHFt3TcH5c6MUvKIPtpGwpPELiaiEqsA3h/I+XK
 M779cpi6fDos5n9VSe13JQXff/YwkQrxD38j8YgPzAqBgPifyoEn/Twc0UfMtBoS2Off
 3n32oUdiEypbw6sle7Bo+m1Cwdn6P8KsIftcFwRXeFiU9n+TM1WxDEN4p8k/2n1XqShD
 xGKmtL3ECFxfcFXDhSzNvaxQP37mzJTq55G0PPZvZfXNJf+aI84xlUfkZRniesOug/qC
 l5HudRzbxjyAN8YJLxW5Py3lAdUw98U3waDa9eGkm2yCmGYDDci2mUDPw1USfC4/rZCA
 ljxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=54O7y5F6cil48JbVjJeuP4tBSWG4MHFPBxntrZflWpI=;
 b=6J9OOGEMIwLtCwlRID+heCiBHtDtruvAUv7Ixfc4/h5UnHHVlNEDEHrhH3ChHjW0wd
 ml8cNEBwb/YQJMuNGP2i1d8xUkAR1LE5qKwnlEuGPO20t4nRP6bZHCSGw/n0oIh/jTzn
 Vs0hsWAs8xgmXPYhRBKGzGqcSa/4vTe6EiCyJ3MmF9FLf2AFF/6/fn/Xh5z2tHQE0UA2
 7g1L2HzzXmoLh1GaUn87/ITUxncgXkmmxlwv3k0Uf2usBIMqZHbbbSNy6meOyfv11/iq
 oLLSuLeor3b71IzCgPWc4ZcudH9DXO89eWwBfJPCPta4vAThtcty6Ue/uBRwkejg6tah
 v6Bw==
X-Gm-Message-State: AOAM533L/CHV+2rjORGOAp24ATFQQ3qq+gMeQxM1YIkhV60Dqa7b+gKq
 3Yjx3HArW/GZb8GJcKXXyGHECDgdwKM+HA==
X-Google-Smtp-Source: ABdhPJz5qMHSebCncZ8uQCZbir/mzrpu9/TCf7eJTm8HyXB2B78mUNl0o/jYABTdJLGj71qM6Ai9gw==
X-Received: by 2002:a05:620a:d96:: with SMTP id
 q22mr28577214qkl.219.1635851470234; 
 Tue, 02 Nov 2021 04:11:10 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm25sm12730854qkb.4.2021.11.02.04.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:11:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 48/60] target/ppc: Move SPR_DSISR setting to powerpc_excp
Date: Tue,  2 Nov 2021 07:07:28 -0400
Message-Id: <20211102110740.215699-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
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


