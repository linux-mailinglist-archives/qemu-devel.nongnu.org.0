Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E2F380D43
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:35:08 +0200 (CEST)
Received: from localhost ([::1]:43472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZq9-00020c-So
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZWB-00068H-HR
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:23 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:41942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZW6-000785-H1
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:23 -0400
Received: by mail-qk1-x730.google.com with SMTP id l129so29002157qke.8
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A1dgGUuYfUmlEfW2piW8mtjDMUJG7qNyIHwOhqBphag=;
 b=ignLgo8cZZhdP3IGJWdKH0k2xl9djt6Co+T0WeeyGSG+1tbjovzSm60u5IaRrkBbtq
 R1EmdhYgRoHdb1qTNtF4BhazXHgxjvLFpyBNX6MYYtS5fMfsWp5Vo4KbEbAGCkW8qe17
 u1uGgjXeOj0EgLBD6EdA/qkvG2KaJikKRUzuT+Q1tsFFu+t/9XQaB59uR3lnPzNXnTQl
 RYkclRvzLVTKtAEia6S22z8w6pmq70u6W9aEepYlE/cHdrut7gDZPXF3yuncmFIEVckJ
 E5xQ2jgqvZn2dSJ2fB11Rd4SOj03IKkCjRXEF2T/DAdjhMmmwpPVw/NBrMoZtfienSLT
 JgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A1dgGUuYfUmlEfW2piW8mtjDMUJG7qNyIHwOhqBphag=;
 b=YbKIh25wNFv5l9a42j/ub8Mm7r2JgSQ4RnbXywYmgqwdvAhyG0vQf5dxkZJEkCyvne
 n1Liho/ThWEEGe8x5BhPfdPXlHop0xIvuZxQGjRqnCuHuKJGDlcw8seRhY4/lYrk0mQf
 cIGbKZIzqfXlK6tprgoWl/EMCTBHmSUgLyYxkTg8VWq6BLBzwP+s7WJB/deBf5by4pQn
 3pdOXFAafBYhWB5LazdAA4SSuREmu3Ezam3wno9LvZjQGptq35JmWWlva381ECiiS4Tk
 px8BPikY4/jQ/mth1psOhvTld+jg8c1HmAojZQJW9F0hE7HUngj9B90A1nMdK+bue+a7
 4gwA==
X-Gm-Message-State: AOAM530O6wzOx+2cEBdv4/4aWysPFQENGfbzYQRmCHbxRmta6wjM1Bty
 DOJpjx/2QXrfwByzBFvEWEJbFomTc+1DSQsKDV8=
X-Google-Smtp-Source: ABdhPJwGxlOSyDKaobXwYeHYPZ8XlzSku2HwMfif2RQwPoLMCxGOvavzjjlm4UYm23L2Vcmc5psG8g==
X-Received: by 2002:a05:620a:15a2:: with SMTP id
 f2mr44815686qkk.310.1621005257115; 
 Fri, 14 May 2021 08:14:17 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:14:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 36/50] target/i386: Tidy svm_check_intercept from tcg
Date: Fri, 14 May 2021 10:13:28 -0500
Message-Id: <20210514151342.384376-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x730.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The param argument to helper_svm_check_intercept_param is always 0;
eliminate it and rename to helper_svm_check_intercept.  Fold
gen_sve_check_intercept_param into gen_svm_check_intercept.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
index 8a02c5a373..12ef2cf064 100644
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


