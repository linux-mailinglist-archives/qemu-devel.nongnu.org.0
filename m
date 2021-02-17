Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0388E31E0CF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:52:05 +0100 (CET)
Received: from localhost ([::1]:59350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTno-0002q2-3I
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:52:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLb-0008CZ-FI
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:55 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:41797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLY-0007M4-SZ
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:55 -0500
Received: by mail-pg1-x533.google.com with SMTP id t11so9206103pgu.8
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tDBHUplRWlhhF0tIGzcFewPFwl6oh2HCB/aPTX+DVBc=;
 b=w4mhJFizPV4fSDWVyq/Ql72ricgdjnOie+ZV85pOM8qj0PlLygxmBQUOTQA0RbyzLd
 Vibaa/cy6V6qViM4Y1/OR0fygNTUzsGJCNQwx0qED6dP/Ep5EIKbAfnMpQVj3lBiTDG3
 dQDiPGecm60vWFgo+Pu8Id5F7ctnD4PvLgUO4Frid389V7j4F1UQvlntQNxbTPr/7D1F
 Pbw6GEYu2fXFw+rPCt18JztCmtyW69h2kQu/kiLTIqEJr5DfmkmGLBJLxLfGMptjisT2
 +i029mgQJevAAHI/66XBTy79q/zHOdjb3DyOYi55OF6C1uI391CvVdYMpuuZRDF76w7G
 IVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tDBHUplRWlhhF0tIGzcFewPFwl6oh2HCB/aPTX+DVBc=;
 b=jcKzPvFg/+v7v1rKooZLlzIRoIKXUVssRcJDQV977FHYdKFRJDpqqpIjFCz3QmNb9K
 r9LS6ThaQmjQYfjYpUHPhWqotMZ9F9eakpEdtns6TzV20Qxx8jQeLpDj/42wC6mbB0By
 NC3rBXevmrlCiPalC2GFrHCKq7YcmwuEioFrqOYZEVkQ62pRrx580eUl39WKqQnklwi4
 ze9Ecj1wKX/ZcGsi5r6ak59yXM8tRZYKzMCC8897JZOGwJMSqA7EZaboznrlcpypGWlJ
 GON9B/v2Ss6cgZ3OJ/Xs6KWkm59rYbGvb6POFo6cwegV5AohqdYslTW5PGttgykCIHk4
 vIVw==
X-Gm-Message-State: AOAM530PHg841snTSwh/+Prga8CYTC+d5AdZ5Zj3S8/WAsTDOo0eZPFK
 rArD2u07iHsIbYI1ULsFhF+E6ntQJdkEWg==
X-Google-Smtp-Source: ABdhPJwxCFtJSSkRqyYY4S9CKdUsNbyd0byMAgo/+z6c1rnXxPXAZg7nPMV9ZTVJrwr4R9yw/S76xw==
X-Received: by 2002:a63:580d:: with SMTP id m13mr952598pgb.342.1613593371653; 
 Wed, 17 Feb 2021 12:22:51 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:22:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 28/71] tcg/tci: Reuse tci_args_l for goto_tb
Date: Wed, 17 Feb 2021 12:19:53 -0800
Message-Id: <20210217202036.1724901-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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


