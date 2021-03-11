Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93242337606
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:45:15 +0100 (CET)
Received: from localhost ([::1]:54560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMYs-0000ZM-Hi
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:45:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMU9-0003EN-6U
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:21 -0500
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:39436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMU7-0006IX-2F
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:20 -0500
Received: by mail-qt1-x830.google.com with SMTP id g24so1268066qts.6
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tDBHUplRWlhhF0tIGzcFewPFwl6oh2HCB/aPTX+DVBc=;
 b=K23fPZWY01m1UBpz8VCVQrmX9mD9Ucoze/PjqgxmTBa++65AnevNa8TIMklSfACYLJ
 U1YLu/N5hVP9cG9xd05Z+7YTmildxAA6RSi9SaxgaX0tciWbu+NJR/5yeLnK9NwZD+nR
 F0oPCJJCXvgkNclqRButmUAs04VM1fmEZDVTqfvXuy3msIGa4C3ojUbCnZu8eRnaPWPa
 6PIw6TAI0jfbzE4CwjPp87V5J2BuvPaJEYpGy1jLc4kkbmxJZMovsXjlezbC415sTlEJ
 qexFnsKoBuVxJTBCXPuaXh1gQQUD9gPpy2uYcMWB0VNRl7sXzJ2XLl46H8T9XjFNkxhZ
 wOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tDBHUplRWlhhF0tIGzcFewPFwl6oh2HCB/aPTX+DVBc=;
 b=Svb9vMPx9JxTi5/YnbYrwloan3sL9kkSFnpCuCNs2ZjVMpW16y4O75ohWBPwfPet0C
 m4uzGE+mL+b7bqbOzkbmI7dg6FkMc/WlHKPsoTRPyJAo/M8PipjacTgqNE89nDmnbWrK
 79Vj8W69jkjO+LKrVVMCi4Fx45M4UxVCwpDpAR0Vyasu1mP6dHcyEICVj74O1OId8kol
 OQBP6fGfeIPmEKyYgH/xcwNVT7vNfKz5qTjk1y3QEhEoAnwdLFRdyrsMgeDwRJQCPwz1
 HJRYX4E/TJll+K8ouDeb+F/jDnaURZTFIrADpiw+SVciYflg5ehp2E/1y+2yA6rlHflG
 vCxw==
X-Gm-Message-State: AOAM530pzqGp0Bqiqx0gKTrt3kW/NAvQ0PBiviBOOOB+i39OkPO9Mj5x
 BwzJ3MvE/YtgnBMN98ocgrNfRnap7anSBX3I
X-Google-Smtp-Source: ABdhPJwnKqx6s3Z+Q9vPH7RtI7msYBiyNRPmxca0lmL09wHr084n8Dz3szvFCtqpx2qx7va0nZKfGQ==
X-Received: by 2002:aed:3886:: with SMTP id k6mr6274889qte.167.1615473616277; 
 Thu, 11 Mar 2021 06:40:16 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/57] tcg/tci: Reuse tci_args_l for goto_tb
Date: Thu, 11 Mar 2021 08:39:14 -0600
Message-Id: <20210311143958.562625-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert to indirect jumps, as it's less complicated.
Then we just have a pointer to the tb address at which
the chain is stored, from which we read.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     | 11 +++--------
 tcg/tci.c                |  8 +++-----
 tcg/tci/tcg-target.c.inc | 13 +++----------
 3 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 9c0021a26f..9285c930a2 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -87,7 +87,7 @@
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
 #define TCG_TARGET_HAS_goto_ptr         0
-#define TCG_TARGET_HAS_direct_jump      1
+#define TCG_TARGET_HAS_direct_jump      0
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #if TCG_TARGET_REG_BITS == 64
@@ -174,12 +174,7 @@ void tci_disas(uint8_t opc);
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
-static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
-                                            uintptr_t jmp_rw, uintptr_t addr)
-{
-    /* patch the branch destination */
-    qatomic_set((int32_t *)jmp_rw, addr - (jmp_rx + 4));
-    /* no need to flush icache explicitly */
-}
+/* not defined -- call should be eliminated at compile time */
+void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #endif /* TCG_TARGET_H */
diff --git a/tcg/tci.c b/tcg/tci.c
index 6fbbc48ecf..3fe0831b33 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -816,13 +816,11 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             return (uintptr_t)ptr;
 
         case INDEX_op_goto_tb:
-            /* Jump address is aligned */
-            tb_ptr = QEMU_ALIGN_PTR_UP(tb_ptr, 4);
-            t0 = qatomic_read((int32_t *)tb_ptr);
-            tb_ptr += sizeof(int32_t);
+            tci_args_l(&tb_ptr, &ptr);
             tci_assert(tb_ptr == old_code_ptr + op_size);
-            tb_ptr += (int32_t)t0;
+            tb_ptr = *(void **)ptr;
             continue;
+
         case INDEX_op_qemu_ld_i32:
             t0 = *tb_ptr++;
             taddr = tci_read_ulong(regs, &tb_ptr);
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index ff8040510f..2c64b4f617 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -405,16 +405,9 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     case INDEX_op_goto_tb:
-        if (s->tb_jmp_insn_offset) {
-            /* Direct jump method. */
-            /* Align for atomic patching and thread safety */
-            s->code_ptr = QEMU_ALIGN_PTR_UP(s->code_ptr, 4);
-            s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
-            tcg_out32(s, 0);
-        } else {
-            /* Indirect jump method. */
-            TODO();
-        }
+        tcg_debug_assert(s->tb_jmp_insn_offset == 0);
+        /* indirect jump method. */
+        tcg_out_i(s, (uintptr_t)(s->tb_jmp_target_addr + args[0]));
         set_jmp_reset_offset(s, args[0]);
         break;
 
-- 
2.25.1


