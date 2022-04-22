Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A07250BEC0
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:34:45 +0200 (CEST)
Received: from localhost ([::1]:33534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxB6-0006YG-Fm
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwaf-0008Lg-2p
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:05 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:33483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwad-0007zJ-EX
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:04 -0400
Received: by mail-io1-xd2d.google.com with SMTP id p62so9270168iod.0
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GcYpZGanzuGeVbXLR1g1V1bbBLnv47df/wapXgxg8sU=;
 b=dfKfu7+0Q/00S42AE29/mv/5Oy5oGq/hzraJ/LvBfp6RgaM8cGVGA7Qd+z/bPDzIr+
 HZoYaVfDVcLuHRJAqHatqxWFCkD+QvkbzN/FI+ePMpb3I41hJMX///hifXBMSselF5AH
 +qfBQu0GVuRIp6Gz2EfCqrJVXCb84vmJDYFmcBlalehhK2KbWTVRInQzABl3Gpo3ea6M
 9P4EScqdOriN4gU0KTpc+JJJrQS7wSwCR9xhaeAiUsTUaduhQhAvR3Sj+/GcIFLH0s62
 FagHa6PsaqYWMVPJ8GKkPmu37qhKh/ylJMuc2mbTOiJudlj95PQ4XPyu9MbzrT+RlWGk
 fcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GcYpZGanzuGeVbXLR1g1V1bbBLnv47df/wapXgxg8sU=;
 b=AM4Pjh5BppGKk7JN6OHBgsoj7zp2cSeFGWGTpjA2kEY37hsxt+Fq2h1d0ilwW092bK
 ei6TB8WyU9IJEx0cGAa2+9yC69as1eCysbbbIto8Y2BOGAz0lQSVzfza7q29ROaELoXD
 2AyCYcHtQYhoOlrGjnTMTm7ZqTMrtAMHJub8Qww/9L8P8GP+VzsewYRLQN+X4wj5KvVy
 r0rj1wg7872wm7Eshu2UOx406r1tLL2wZVYKCz8mccRpmpiWJdN+eFTHqVNqUijQsMD1
 2K1ByPeoYvgSg/It5sye0SBD67fqjC66mYxrWJCYBM+7naCxxaP1/8go1qglfRHfotK7
 S97A==
X-Gm-Message-State: AOAM532uh5mNFOi7Xdopt62Yzff9xz577JNOtECs0UuiDPXdIfJFIiLT
 nMiGEMKCSMdrjdvfrH8dCkSOm+T9jqyLPaEQ
X-Google-Smtp-Source: ABdhPJzp9T30A9yfB/5fTJSd4t6qOOGvIIaTbbDmqaWlg2jTAp0fUHUeYehVlwyKr2JD5OdznnZGGQ==
X-Received: by 2002:a05:6638:389b:b0:32a:a987:46a7 with SMTP id
 b27-20020a056638389b00b0032aa98746a7mr2611777jav.276.1650646622409; 
 Fri, 22 Apr 2022 09:57:02 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a6b8b17000000b00649a2634725sm816380iod.17.2022.04.22.09.57.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:57:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 45/68] target/nios2: Split out helpers for gen_i_math_logic
Date: Fri, 22 Apr 2022 09:52:15 -0700
Message-Id: <20220422165238.1971496-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do as little work as possible within the macro.
Split out helper functions and pass in arguments instead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 58 +++++++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 19 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 86978ba47a..aa570b6d79 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -83,6 +83,11 @@ static target_ulong imm_signed(const InstrIType *i)
     return i->imm16.s;
 }
 
+static target_ulong imm_shifted(const InstrIType *i)
+{
+    return i->imm16.u << 16;
+}
+
 /* R-Type instruction parsing */
 typedef struct {
     uint8_t op;
@@ -115,6 +120,8 @@ typedef struct {
         .imm26 = extract32((code), 6, 26), \
     }
 
+typedef void GenFn2i(TCGv, TCGv, target_long);
+
 typedef struct DisasContext {
     DisasContextBase  base;
     target_ulong      pc;
@@ -299,29 +306,42 @@ gen_i_cmpxx(gen_cmpxxsi, imm_signed)
 gen_i_cmpxx(gen_cmpxxui, imm_unsigned)
 
 /* Math/logic instructions */
-#define gen_i_math_logic(fname, insn, resimm, op3)                          \
-static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)        \
-{                                                                           \
-    I_TYPE(instr, (code));                                                  \
-    if (unlikely(instr.b == R_ZERO)) { /* Store to R_ZERO is ignored */     \
-        return;                                                             \
-    } else if (instr.a == R_ZERO) { /* MOVxI optimizations */               \
-        tcg_gen_movi_tl(cpu_R[instr.b], (resimm) ? (op3) : 0);              \
-    } else {                                                                \
-        tcg_gen_##insn##_tl(cpu_R[instr.b], cpu_R[instr.a], (op3));         \
-    }                                                                       \
+static void do_i_math_logic(DisasContext *dc, uint32_t insn,
+                            GenFn2i *fn, ImmFromIType *imm,
+                            bool x_op_0_eq_x)
+{
+    I_TYPE(instr, insn);
+    target_ulong val;
+
+    if (unlikely(instr.b == R_ZERO)) {
+        /* Store to R_ZERO is ignored -- this catches the canonical NOP. */
+        return;
+    }
+
+    val = imm(&instr);
+
+    if (instr.a == R_ZERO) {
+        /* This catches the canonical expansions of movi and movhi. */
+        tcg_gen_movi_tl(cpu_R[instr.b], x_op_0_eq_x ? val : 0);
+    } else {
+        fn(cpu_R[instr.b], cpu_R[instr.a], val);
+    }
 }
 
-gen_i_math_logic(addi,  addi, 1, instr.imm16.s)
-gen_i_math_logic(muli,  muli, 0, instr.imm16.s)
+#define gen_i_math_logic(fname, insn, x_op_0, imm)                          \
+    static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)    \
+    { do_i_math_logic(dc, code, tcg_gen_##insn##_tl, imm, x_op_0); }
 
-gen_i_math_logic(andi,  andi, 0, instr.imm16.u)
-gen_i_math_logic(ori,   ori,  1, instr.imm16.u)
-gen_i_math_logic(xori,  xori, 1, instr.imm16.u)
+gen_i_math_logic(addi,  addi, 1, imm_signed)
+gen_i_math_logic(muli,  muli, 0, imm_signed)
 
-gen_i_math_logic(andhi, andi, 0, instr.imm16.u << 16)
-gen_i_math_logic(orhi , ori,  1, instr.imm16.u << 16)
-gen_i_math_logic(xorhi, xori, 1, instr.imm16.u << 16)
+gen_i_math_logic(andi,  andi, 0, imm_unsigned)
+gen_i_math_logic(ori,   ori,  1, imm_unsigned)
+gen_i_math_logic(xori,  xori, 1, imm_unsigned)
+
+gen_i_math_logic(andhi, andi, 0, imm_shifted)
+gen_i_math_logic(orhi , ori,  1, imm_shifted)
+gen_i_math_logic(xorhi, xori, 1, imm_shifted)
 
 /* Prototype only, defined below */
 static void handle_r_type_instr(DisasContext *dc, uint32_t code,
-- 
2.34.1


