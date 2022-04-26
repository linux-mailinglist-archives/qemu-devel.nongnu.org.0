Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB0B5108D2
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:18:34 +0200 (CEST)
Received: from localhost ([::1]:42596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQhl-0007QA-WC
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPps-0001nx-M7
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:22:54 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPpr-0005Mw-1N
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:22:52 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 bd19-20020a17090b0b9300b001d98af6dcd1so2848601pjb.4
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mYrrK9wMFTiFo0vQpejbJip6v2871lt8Lm0SZNjZ9fM=;
 b=V/P+yKyg/Kh6Ls2rYjzegeFFl1sgVIm6BrmqqWtghCGfyKxlzjU1QwJQYZdQ+XYwei
 A59rWEEzypFjWfMjD51y2BKfnakPLgd3pGOE6o5IZQJTvc5DsDyZ+WpIpQ35op6Oh8xH
 /vECJBCDZSNaCOOmQaGa0u1jfR1kKxB9bGyigk05K3K0aTVr/gVyOY8AmTN1fWSwHNtS
 L6j9gfNrfRLlhk2oHJX/tQWg4EAmr4grbJGrGSaCTBhQYHA0wJS09W2GJg+Z9nl81CA/
 ikPiGcCvNRLSu+qAtQ5djfEaaN1udGlhurDmc9oXhljyxjN9zflge2PjNZwrSJjTxHb7
 0YFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mYrrK9wMFTiFo0vQpejbJip6v2871lt8Lm0SZNjZ9fM=;
 b=OYqHLcKHb8VBDOhOhMRWqWXdZv+Y9NxlSdwh6lMNxTnqLsL7wifQ33L+hfAYIjy6nY
 V6uY50b5iuBjckqlaiBqHJ/TD5u1BNDnYmkO1o7noQ+0r7rnJJJbK2y87UahVIIZgjly
 nBC94hkd/zhM5CyXr31qqW7e/xiG8V9gfjhIAWdv8JDDzE5uDl44mesH6CMPsJBonoYA
 40ydZjQeG41gKTLlaE14skG+gTysTGEq5DrMYv/YeKxy/sV8JapoZFYtAqmlovBwF4GD
 +l7kLdoTYs1zEcHAlqloB4WxbhB69WFT+zYlKBadYIPQOJ9aUkUYX6YYtuGhPal0EAZt
 tnXA==
X-Gm-Message-State: AOAM533ke8zfAZzooJHcmTzSVIs/AHO7XFjYQG4Q7dvohpxAX9f4wxk3
 KKb+ylkuDVFCNDJSdL8pRQ7bfBVJrJs1dQ==
X-Google-Smtp-Source: ABdhPJw6y8IyyzI74EYwFlLhIzqWkZCl1vj0TxqfyIeAFQFufS3Gsk8hS0aq7ecmOCYrwFWzhNRf+w==
X-Received: by 2002:a17:902:9887:b0:151:6e1c:7082 with SMTP id
 s7-20020a170902988700b001516e1c7082mr24091460plp.162.1650997369487; 
 Tue, 26 Apr 2022 11:22:49 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b003983a01b896sm13585053pgc.90.2022.04.26.11.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:22:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 44/68] target/nios2: Split out helpers for gen_i_cmpxx
Date: Tue, 26 Apr 2022 11:18:43 -0700
Message-Id: <20220426181907.103691-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Do as little work as possible within the macro.
Split out helper functions and pass in arguments instead.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index a3c63dbbbd..86978ba47a 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -71,6 +71,18 @@ typedef struct {
         .a     = extract32((code), 27, 5), \
     }
 
+typedef target_ulong ImmFromIType(const InstrIType *);
+
+static target_ulong imm_unsigned(const InstrIType *i)
+{
+    return i->imm16.u;
+}
+
+static target_ulong imm_signed(const InstrIType *i)
+{
+    return i->imm16.s;
+}
+
 /* R-Type instruction parsing */
 typedef struct {
     uint8_t op;
@@ -268,15 +280,23 @@ static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
 }
 
 /* Comparison instructions */
-#define gen_i_cmpxx(fname, op3)                                              \
-static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)         \
-{                                                                            \
-    I_TYPE(instr, (code));                                                   \
-    tcg_gen_setcondi_tl(flags, cpu_R[instr.b], cpu_R[instr.a], (op3));       \
+static void do_i_cmpxx(DisasContext *dc, uint32_t insn,
+                       TCGCond cond, ImmFromIType *imm)
+{
+    I_TYPE(instr, insn);
+
+    if (likely(instr.b != R_ZERO)) {
+        tcg_gen_setcondi_tl(cond, cpu_R[instr.b],
+                            load_gpr(dc, instr.a), imm(&instr));
+    }
 }
 
-gen_i_cmpxx(gen_cmpxxsi, instr.imm16.s)
-gen_i_cmpxx(gen_cmpxxui, instr.imm16.u)
+#define gen_i_cmpxx(fname, imm)                                             \
+    static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)    \
+    { do_i_cmpxx(dc, code, flags, imm); }
+
+gen_i_cmpxx(gen_cmpxxsi, imm_signed)
+gen_i_cmpxx(gen_cmpxxui, imm_unsigned)
 
 /* Math/logic instructions */
 #define gen_i_math_logic(fname, insn, resimm, op3)                          \
-- 
2.34.1


