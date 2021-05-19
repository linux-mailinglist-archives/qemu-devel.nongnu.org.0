Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579753895F2
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:57:44 +0200 (CEST)
Received: from localhost ([::1]:60446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRO3-0001MY-8m
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyu-0004Yv-T2
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:44 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:33299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyh-0005pA-4X
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:44 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 i23-20020a9d68d70000b02902dc19ed4c15so12662099oto.0
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o+bSpPqvUS5hXLbtWM0XfAjDH/PGAEYXlkUYshXGyEo=;
 b=Mj9CiSl30M5SrX+Hfe73nhCiqAVlYMbRoQrPasxPO7N4Uy+sYMmInR+3mV/BITZ+yU
 OL2E6V9fHo2QVCgZTtuBZqkIXngysrJRs6VilPfbQKjtEm7g41HRiW62lJu+5WsIPTjw
 utqVAFT2cOWHDP8Iw7I65K8ZBWzUQT7FSvM0xAuLXY/3xnkaShCokqM63t/6qPAX9Uef
 rZ+++G+jdkrJLKMObKCgz4GRthb45fc6oAvAH/5eNgRlI3ZWufAjY43FM9KxG9B/YN7H
 zq5HZ8m/bn6ZC53vojAhY3v8H3VXg7t5TBf5wIG7r69aywHZg38XG2AKnSemk+BvSUie
 SBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o+bSpPqvUS5hXLbtWM0XfAjDH/PGAEYXlkUYshXGyEo=;
 b=dWS2s7Ck4zQrfWspKT56UXyCFQeRSS6myctWLZ360XIVtT8uOH8Mg7kYgWMrn3NlK/
 2PjtFLpnFJAmD9NYGuNq+8HkW0Y2U5eECD/BWcd0cu7tNXl9Lpk0aA7cM9g+W/jd7pAT
 RrhrfqwLBOPrTnLGwjSQ38fN1w9A5kiTuj/C37dmqY/rb9LC4KbukHcnyUn5nIRTrsTP
 VmaBiq/8LV0mv5j5e1A4FJtPVj8Ll3R4lFaWkJK+agtpfz8bElEOrgG+1WTesMLamR9W
 eTxt5XCY6qqEt5F10CKc1ScRYC7k1Cphu090cRa5nDXM/aJftGRQ2KTEDy55ktY9ytGZ
 Hr7A==
X-Gm-Message-State: AOAM5326eIu5vGt47ZpcIoEL4MNaEEh4q3Wesw6h6Z4M15jRONiHQ08J
 8sV7JxdgowMwCGhtvhCmlc6wOXDmzfmRVEQi
X-Google-Smtp-Source: ABdhPJw4hg4BlFlit2wjZ02drTv4FUlcs2HHXMFtdS0MTmpJl2i3Dpmi+SrHrntbR8lADo7pifdowg==
X-Received: by 2002:a9d:6c47:: with SMTP id g7mr645929otq.67.1621449087801;
 Wed, 19 May 2021 11:31:27 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/50] target/i386: Tidy svm_check_intercept from tcg
Date: Wed, 19 May 2021 13:30:36 -0500
Message-Id: <20210519183050.875453-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
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
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The param argument to helper_svm_check_intercept_param is always 0;
eliminate it and rename to helper_svm_check_intercept.  Fold
gen_svm_check_intercept_param into gen_svm_check_intercept.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-37-richard.henderson@linaro.org>
---
 target/i386/helper.h                |  2 +-
 target/i386/tcg/sysemu/svm_helper.c |  5 ++---
 target/i386/tcg/translate.c         | 16 ++++------------
 3 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index f794d1c7c7..86484a4ec4 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -107,7 +107,7 @@ DEF_HELPER_2(inl, tl, env, i32)
 
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_FLAGS_4(bpt_io, TCG_CALL_NO_WG, void, env, i32, i32, tl)
-DEF_HELPER_3(svm_check_intercept_param, void, env, i32, i64)
+DEF_HELPER_2(svm_check_intercept, void, env, i32)
 DEF_HELPER_4(svm_check_io, void, env, i32, i32, i32)
 DEF_HELPER_3(vmrun, void, env, int, int)
 DEF_HELPER_1(vmmcall, void, env)
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 79c73d67af..b431016e72 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -506,10 +506,9 @@ void cpu_svm_check_intercept_param(CPUX86State *env, uint32_t type,
     }
 }
 
-void helper_svm_check_intercept_param(CPUX86State *env, uint32_t type,
-                                      uint64_t param)
+void helper_svm_check_intercept(CPUX86State *env, uint32_t type)
 {
-    cpu_svm_check_intercept_param(env, type, param, GETPC());
+    cpu_svm_check_intercept_param(env, type, 0, GETPC());
 }
 
 void helper_svm_check_io(CPUX86State *env, uint32_t port, uint32_t param,
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 36e38ebebf..ad2e6cdd8c 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -197,7 +197,7 @@ STUB_HELPER(clgi, TCGv_env env)
 STUB_HELPER(invlpga, TCGv_env env, TCGv_i32 aflag)
 STUB_HELPER(set_dr, TCGv_env env, TCGv_i32 reg, TCGv val)
 STUB_HELPER(stgi, TCGv_env env)
-STUB_HELPER(svm_check_intercept_param, TCGv_env env, TCGv_i32 t, TCGv_i64 p)
+STUB_HELPER(svm_check_intercept, TCGv_env env, TCGv_i32 type)
 STUB_HELPER(svm_check_io, TCGv_env env, TCGv_i32 port, TCGv_i32 p, TCGv_i32 a)
 STUB_HELPER(vmload, TCGv_env env, TCGv_i32 aflag)
 STUB_HELPER(vmmcall, TCGv_env env)
@@ -2423,9 +2423,8 @@ static inline int svm_is_rep(int prefixes)
     return ((prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) ? 8 : 0);
 }
 
-static inline void
-gen_svm_check_intercept_param(DisasContext *s, target_ulong pc_start,
-                              uint32_t type, uint64_t param)
+static void gen_svm_check_intercept(DisasContext *s, target_ulong pc_start,
+                                    uint32_t type)
 {
     /* no SVM activated; fast case */
     if (likely(!GUEST(s))) {
@@ -2433,14 +2432,7 @@ gen_svm_check_intercept_param(DisasContext *s, target_ulong pc_start,
     }
     gen_update_cc_op(s);
     gen_jmp_im(s, pc_start - s->cs_base);
-    gen_helper_svm_check_intercept_param(cpu_env, tcg_const_i32(type),
-                                         tcg_const_i64(param));
-}
-
-static inline void
-gen_svm_check_intercept(DisasContext *s, target_ulong pc_start, uint64_t type)
-{
-    gen_svm_check_intercept_param(s, pc_start, type, 0);
+    gen_helper_svm_check_intercept(cpu_env, tcg_constant_i32(type));
 }
 
 static inline void gen_stack_update(DisasContext *s, int addend)
-- 
2.25.1


