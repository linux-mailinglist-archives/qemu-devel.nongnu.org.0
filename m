Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CECBD4B1BFE
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 03:13:14 +0100 (CET)
Received: from localhost ([::1]:38456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nILQv-0007JL-WE
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 21:13:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKo9-0005hA-9e
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:33:09 -0500
Received: from [2607:f8b0:4864:20::62d] (port=42610
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKo0-0007V5-F2
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:33:08 -0500
Received: by mail-pl1-x62d.google.com with SMTP id z17so3402730plb.9
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tw347i7UUzkCL2aGKWmeY7B5v0kBuROLRWuELxPT4a8=;
 b=cVsgXvF9zkl1aIGHj9csl8mcf3sc6EVEIOdsgdxAYHrYx3gsJxL2SIPHj6svbAOAYR
 g1/yjOHz4UuvX+AuLTiJK1jS+v9i18X5i4KjCWRuC2MbleE27Ygfcl5CThGXyBPHuid1
 5aYoU1jtsNbjJRIYPAYFdXowPODsjaU62wGhIOgPJTi0KV4Ys76bEyJiQ+2ADkKkIwvc
 SUm3K3AQE+dNWbmErjNytdfVsQ8a45xYW46qYZJMq9+IT2fJppDxtvgvvZG4kggmgQ+9
 k5McsFlCR8yAEGloCYSoYG7XlSxueziLW7xDKTqrwX6PoywVC7YECoy8byQOTke1iDWA
 b+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tw347i7UUzkCL2aGKWmeY7B5v0kBuROLRWuELxPT4a8=;
 b=EtkGrlTxeFGa4iMVlPm0Xgh5Oq9AaZXXQOrP1URIr5ve/T0vlTWd05h7oJrreISuv1
 7QoD39rSJkSGm5jvtbPVASa/Tgi/DrVk1EnEeADOzuPZbUk8Z5F2PSXsXZE9mNBzbgdB
 rtTYmJ92jSNzdgnVPkztCcVESNn61NKETq8MxGqU0geL2mxcJjLTaPBjeedk4eVpbyVX
 98KpZrNUyiJgEpvfQ0LlEBU2CbylYFEW4UEGbs5QhCiDy3bKE6kv5VqcW6Lz735SohVO
 Ib6wB3x0OuwEO+eSoX7wc/N4ey4KcDClSNXdWi1Byx3zVrGjwn9ek7garh/50ltDZvE+
 zO9g==
X-Gm-Message-State: AOAM530GSdfFWxGJ5ZdOfmC7At/Xuow1bg6kYkiC4qFPkx7L4pAhRio8
 cp5AGmVhSc9agNl40abZFi+55U1slIonfBms
X-Google-Smtp-Source: ABdhPJyjKtJUWudwfylAP85mrMCLh0d4IPKheJkel6YVxOTh6FJ4jZ/Yur9yNCemHB2rmuvtydlWyQ==
X-Received: by 2002:a17:902:b90a:: with SMTP id
 bf10mr10266713plb.36.1644543175639; 
 Thu, 10 Feb 2022 17:32:55 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:32:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/34] tcg/sparc: Add tcg_out_jmpl_const for better tail calls
Date: Fri, 11 Feb 2022 12:30:57 +1100
Message-Id: <20220211013059.17994-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Due to mapping changes, we now rarely place the code_gen_buffer
near the main executable.  Which means that direct calls will
now rarely be in range.

So, always use indirect calls for tail calls, which allows us to
avoid clobbering %o7, and therefore we need not save and restore it.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index e78945d153..646bb462c3 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -858,6 +858,19 @@ static void tcg_out_addsub2_i64(TCGContext *s, TCGReg rl, TCGReg rh,
     tcg_out_mov(s, TCG_TYPE_I64, rl, tmp);
 }
 
+static void tcg_out_jmpl_const(TCGContext *s, const tcg_insn_unit *dest,
+                               bool in_prologue, bool tail_call)
+{
+    uintptr_t desti = (uintptr_t)dest;
+
+    /* Be careful not to clobber %o7 for a tail call. */
+    tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_REG_T1,
+                     desti & ~0xfff, in_prologue,
+                     tail_call ? TCG_REG_G2 : TCG_REG_O7);
+    tcg_out_arithi(s, tail_call ? TCG_REG_G0 : TCG_REG_O7,
+                   TCG_REG_T1, desti & 0xfff, JMPL);
+}
+
 static void tcg_out_call_nodelay(TCGContext *s, const tcg_insn_unit *dest,
                                  bool in_prologue)
 {
@@ -866,10 +879,7 @@ static void tcg_out_call_nodelay(TCGContext *s, const tcg_insn_unit *dest,
     if (disp == (int32_t)disp) {
         tcg_out32(s, CALL | (uint32_t)disp >> 2);
     } else {
-        uintptr_t desti = (uintptr_t)dest;
-        tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_REG_T1,
-                         desti & ~0xfff, in_prologue, TCG_REG_O7);
-        tcg_out_arithi(s, TCG_REG_O7, TCG_REG_T1, desti & 0xfff, JMPL);
+        tcg_out_jmpl_const(s, dest, in_prologue, false);
     }
 }
 
@@ -960,11 +970,10 @@ static void build_trampolines(TCGContext *s)
 
         /* Set the retaddr operand.  */
         tcg_out_mov(s, TCG_TYPE_PTR, ra, TCG_REG_O7);
-        /* Set the env operand.  */
-        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_O0, TCG_AREG0);
         /* Tail call.  */
-        tcg_out_call_nodelay(s, qemu_ld_helpers[i], true);
-        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_O7, ra);
+        tcg_out_jmpl_const(s, qemu_ld_helpers[i], true, true);
+        /* delay slot -- set the env argument */
+        tcg_out_mov_delay(s, TCG_REG_O0, TCG_AREG0);
     }
 
     for (i = 0; i < ARRAY_SIZE(qemu_st_helpers); ++i) {
@@ -1006,14 +1015,14 @@ static void build_trampolines(TCGContext *s)
         if (ra >= TCG_REG_O6) {
             tcg_out_st(s, TCG_TYPE_PTR, TCG_REG_O7, TCG_REG_CALL_STACK,
                        TCG_TARGET_CALL_STACK_OFFSET);
-            ra = TCG_REG_G1;
+        } else {
+            tcg_out_mov(s, TCG_TYPE_PTR, ra, TCG_REG_O7);
         }
-        tcg_out_mov(s, TCG_TYPE_PTR, ra, TCG_REG_O7);
-        /* Set the env operand.  */
-        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_O0, TCG_AREG0);
+
         /* Tail call.  */
-        tcg_out_call_nodelay(s, qemu_st_helpers[i], true);
-        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_O7, ra);
+        tcg_out_jmpl_const(s, qemu_st_helpers[i], true, true);
+        /* delay slot -- set the env argument */
+        tcg_out_mov_delay(s, TCG_REG_O0, TCG_AREG0);
     }
 }
 #endif
-- 
2.25.1


