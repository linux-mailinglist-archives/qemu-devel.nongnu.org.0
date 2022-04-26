Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B125107BD
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:57:15 +0200 (CEST)
Received: from localhost ([::1]:46288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQN8-0004w6-Oq
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPpv-0001pn-Gl
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:22:56 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:38788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPpt-0005Oj-Hf
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:22:55 -0400
Received: by mail-pf1-x42b.google.com with SMTP id b15so18719351pfm.5
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=90FS4A3L0e+HZIc9EHaI5AkuPRk/8PsmEOmUrAtpCKw=;
 b=SYZqSfEwESzozRy2FZ5oOXy2rh0lymvvRpVp0kuGeUpfPY8VPr8LH2l8hW6Bh0fBVd
 rXyzh+edeRCWyrMZ9LZbA2f9YEMohy1xyVbh7t0hmbE3v0DmkKNHc3FK1xT3xSvzRo++
 lpC/oKSJJ2hzyWnw9v7i3ISmN6yQwcrvUxW27/BJlwgiKkk8+sSfzXpNahAzFfmA090a
 /V9lbJi1WjlrpRopaEdTkUqnRdJwa/7ScUxfDmCPlj7W76crVn/eoUJ6LWeSNunv0sit
 jX+313dnRN7ZkdxMpiSlDNqHL2Zg4UqhS13WytyjNrqtJZIzZRpsPlhDOnThzkV7hIdG
 wQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=90FS4A3L0e+HZIc9EHaI5AkuPRk/8PsmEOmUrAtpCKw=;
 b=4fxk/8vah/yspuopBlzgIHEbPz4+Rw+dhmkRAH5NPJHGCx4Z7lPj2McgwhNyqkEN/b
 KjdqmPNDQrCFQCqhssE/8+iG8YuY+AUf209AzF0eQtshPjkB4pj0l7mfsGEC1bdRPLTs
 FTe34vguKe443SsO4fadnJBZ7hI85/harKljra8SgrDQ/Q1+DEjw91rxiAd5LvyYhG5k
 1+zdpoxOy76LdEfYD0/KrgkGg1z5RdN4+9SiBF4i/HT+s8gi5CYuHk0AMwbqO4DLIVln
 u2D4kBaFf81qdyn1HJUHA274VCsRmk4pcWtwXPfEbg+UfvrzsiVT7FMCp6dYRKJBH/Di
 BW/g==
X-Gm-Message-State: AOAM5312hkRO1t6XXaqYTagWtEtC9SQJx8vQvR42NI+CXZNUzwGUulX/
 QFOMUTxdOdVMRHzePfueXg2uoEDuB+iugQ==
X-Google-Smtp-Source: ABdhPJxOv2JDDpeiMi6PiRfPvx7D6j4nvmrpYpyNKCxqzEDCj0DHpcC/ZtaD3Sb/gSMPb2sitd1a4g==
X-Received: by 2002:a63:de53:0:b0:3aa:8b0:b690 with SMTP id
 y19-20020a63de53000000b003aa08b0b690mr21012412pgi.580.1650997372047; 
 Tue, 26 Apr 2022 11:22:52 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b003983a01b896sm13585053pgc.90.2022.04.26.11.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:22:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 47/68] target/nios2: Split out helpers for gen_rr_mul_high
Date: Tue, 26 Apr 2022 11:18:46 -0700
Message-Id: <20220426181907.103691-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

Rename the macro from gen_r_mul, because these are the multiply
variants that produce a high-part result.  Do as little work as
possible within the macro; split out helper functions and pass
in arguments instead.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 4f52606516..5979427c8e 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -122,6 +122,7 @@ typedef struct {
 
 typedef void GenFn2i(TCGv, TCGv, target_long);
 typedef void GenFn3(TCGv, TCGv, TCGv);
+typedef void GenFn4(TCGv, TCGv, TCGv, TCGv);
 
 typedef struct DisasContext {
     DisasContextBase  base;
@@ -669,21 +670,25 @@ gen_ri_math_logic(srli, shri)
 gen_ri_math_logic(slli, shli)
 gen_ri_math_logic(roli, rotli)
 
-#define gen_r_mul(fname, insn)                                         \
-static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)   \
-{                                                                      \
-    R_TYPE(instr, (code));                                             \
-    if (likely(instr.c != R_ZERO)) {                                   \
-        TCGv t0 = tcg_temp_new();                                      \
-        tcg_gen_##insn(t0, cpu_R[instr.c],                             \
-                       load_gpr(dc, instr.a), load_gpr(dc, instr.b));  \
-        tcg_temp_free(t0);                                             \
-    }                                                                  \
+static void do_rr_mul_high(DisasContext *dc, uint32_t insn, GenFn4 *fn)
+{
+    R_TYPE(instr, insn);
+
+    if (likely(instr.c != R_ZERO)) {
+        TCGv discard = tcg_temp_new();
+        fn(discard, cpu_R[instr.c], load_gpr(dc, instr.a),
+           load_gpr(dc, instr.b));
+        tcg_temp_free(discard);
+    }
 }
 
-gen_r_mul(mulxss, muls2_tl)
-gen_r_mul(mulxuu, mulu2_tl)
-gen_r_mul(mulxsu, mulsu2_tl)
+#define gen_rr_mul_high(fname, insn)                                        \
+    static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)    \
+    { do_rr_mul_high(dc, code, tcg_gen_##insn##_tl); }
+
+gen_rr_mul_high(mulxss, muls2)
+gen_rr_mul_high(mulxuu, mulu2)
+gen_rr_mul_high(mulxsu, mulsu2)
 
 #define gen_r_shift_s(fname, insn)                                         \
 static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)       \
-- 
2.34.1


