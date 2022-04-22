Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABB950BEE3
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:40:35 +0200 (CEST)
Received: from localhost ([::1]:42016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxGk-0004Sv-Fs
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwag-0008SQ-S9
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:06 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:37404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwaf-0007ze-7A
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:06 -0400
Received: by mail-io1-xd29.google.com with SMTP id p21so9219273ioj.4
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3+xpTVDecc7cNEyZfsWnLhG5F+1r9PluCtiZXsENmzo=;
 b=r2RBbBg+FRkY68QZd99l+7PDLW0el1AnqeMLUA+VC0A3vDZvTz5fKBhirAtwMIIH1m
 /ks8k2Nb1ZNW3TF6GLTy/ZvUrKAKiAUxnE8CgJdFQX45M5LRBvacejP6aTmiPgLFH3jl
 bbOO9NRcS4Lv0HyVZL2pAuHYCPEa83cVwbfq+JDz19ZePcrilVPjTP/k+xB++znsZxqc
 xNHL3pY7dEB3jfxV3locH8oQleEGnXIO1j+uLtTJ+kSwkKdu6ccwUzruNdPZVNaqQwNw
 2b8Ex3DsA1W5qDillXe3l1GDBBIyTkmEXAQLYWi6JsjvIgBVW09w5sWO44Dcv2HrTj/Z
 D4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3+xpTVDecc7cNEyZfsWnLhG5F+1r9PluCtiZXsENmzo=;
 b=38ZSh+ERKUKhbPCDLoI1d3SKq94PTCmDwypIASoXldO29vsLETmdJ8vMRI2N93TdCK
 YNsJmJWYl4EEnUYMAgY5tGKZzlEMCUZBQlWjQpWKPNvUnFESmexkSJD6IPOLHkakcq3y
 cYqkWkofY2pkE4SxPRdwZ24H6W1E7DucNa90APLbMUZinKMfNYZpc/PW9QgQTIVEBPzZ
 qYivToOdNCouuxoLsCm/hdm8N9+2OXDIcQ236A1gY9Pd6Z9+Cou5byvfVYIsqCjw0k6+
 3ctyKjgoWhqxJ1OEbsf98chqqm4Kzr/+QUQPCa9MwJ1YLcwVodRkZplWT4KpL0jopBKM
 6qDA==
X-Gm-Message-State: AOAM531ln5m48sW4snCuYzeysag9A839EWM6D8VEkXRE3DOuc6igK92V
 B4yuuWVSI2PbUdXVyP6WEchOFMPMVgjLG5nj
X-Google-Smtp-Source: ABdhPJzg34me4rBec/StZoVaFws9eddOxomUl190qth75Csmceqg5OZ4i5togonIU8APWroQrP7A+A==
X-Received: by 2002:a02:cf15:0:b0:328:615c:303d with SMTP id
 q21-20020a02cf15000000b00328615c303dmr2540709jar.313.1650646624136; 
 Fri, 22 Apr 2022 09:57:04 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a6b8b17000000b00649a2634725sm816380iod.17.2022.04.22.09.57.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:57:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 46/68] target/nios2: Split out helpers for gen_r_math_logic
Date: Fri, 22 Apr 2022 09:52:16 -0700
Message-Id: <20220422165238.1971496-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd29.google.com
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

Split the macro in two, one for reg/imm and one for reg/reg.
Do as little work as possible within the macros; split out
helper functions and pass in arguments instead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 54 ++++++++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 18 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index aa570b6d79..4f52606516 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -121,6 +121,7 @@ typedef struct {
     }
 
 typedef void GenFn2i(TCGv, TCGv, target_long);
+typedef void GenFn3(TCGv, TCGv, TCGv);
 
 typedef struct DisasContext {
     DisasContextBase  base;
@@ -628,28 +629,45 @@ static void gen_cmpxx(DisasContext *dc, uint32_t code, uint32_t flags)
 }
 
 /* Math/logic instructions */
-#define gen_r_math_logic(fname, insn, op3)                                 \
-static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)       \
-{                                                                          \
-    R_TYPE(instr, (code));                                                 \
-    if (likely(instr.c != R_ZERO)) {                                       \
-        tcg_gen_##insn(cpu_R[instr.c], load_gpr((dc), instr.a), (op3));    \
-    }                                                                      \
+static void do_ri_math_logic(DisasContext *dc, uint32_t insn, GenFn2i *fn)
+{
+    R_TYPE(instr, insn);
+
+    if (likely(instr.c != R_ZERO)) {
+        fn(cpu_R[instr.c], load_gpr(dc, instr.a), instr.imm5);
+    }
 }
 
-gen_r_math_logic(add,  add_tl,   load_gpr(dc, instr.b))
-gen_r_math_logic(sub,  sub_tl,   load_gpr(dc, instr.b))
-gen_r_math_logic(mul,  mul_tl,   load_gpr(dc, instr.b))
+static void do_rr_math_logic(DisasContext *dc, uint32_t insn, GenFn3 *fn)
+{
+    R_TYPE(instr, insn);
 
-gen_r_math_logic(and,  and_tl,   load_gpr(dc, instr.b))
-gen_r_math_logic(or,   or_tl,    load_gpr(dc, instr.b))
-gen_r_math_logic(xor,  xor_tl,   load_gpr(dc, instr.b))
-gen_r_math_logic(nor,  nor_tl,   load_gpr(dc, instr.b))
+    if (likely(instr.c != R_ZERO)) {
+        fn(cpu_R[instr.c], load_gpr(dc, instr.a), load_gpr(dc, instr.b));
+    }
+}
 
-gen_r_math_logic(srai, sari_tl,  instr.imm5)
-gen_r_math_logic(srli, shri_tl,  instr.imm5)
-gen_r_math_logic(slli, shli_tl,  instr.imm5)
-gen_r_math_logic(roli, rotli_tl, instr.imm5)
+#define gen_ri_math_logic(fname, insn)                                      \
+    static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)    \
+    { do_ri_math_logic(dc, code, tcg_gen_##insn##_tl); }
+
+#define gen_rr_math_logic(fname, insn)                                      \
+    static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)    \
+    { do_rr_math_logic(dc, code, tcg_gen_##insn##_tl); }
+
+gen_rr_math_logic(add,  add)
+gen_rr_math_logic(sub,  sub)
+gen_rr_math_logic(mul,  mul)
+
+gen_rr_math_logic(and,  and)
+gen_rr_math_logic(or,   or)
+gen_rr_math_logic(xor,  xor)
+gen_rr_math_logic(nor,  nor)
+
+gen_ri_math_logic(srai, sari)
+gen_ri_math_logic(srli, shri)
+gen_ri_math_logic(slli, shli)
+gen_ri_math_logic(roli, rotli)
 
 #define gen_r_mul(fname, insn)                                         \
 static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)   \
-- 
2.34.1


