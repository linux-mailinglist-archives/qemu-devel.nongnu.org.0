Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77802380D8E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:45:08 +0200 (CEST)
Received: from localhost ([::1]:42304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZzv-0004bE-H3
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZWC-0006C7-Ez
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:24 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:35422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZW3-00077Y-GP
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:24 -0400
Received: by mail-qk1-x730.google.com with SMTP id x8so29028248qkl.2
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3YtdsZVGY71CO6vpGl3MIh8sBMcWUiJTk6gvp8+iKQ0=;
 b=afCjKAAi+rwrvH1OptwJhf7u9o6UdZEwszXMvm/H652sVu39CA2Yyy9jA2DFwGuFs6
 ygRstN1pah5/eVLEilm/UHBQTqU71LUqGsHFHbeSFUm+xBRDnG6veDZ76Y+mbT7Fh/hG
 l5O5grhS52e0jGhPiOgESAfFf0YmLwppwO4WA6EiLEF4QfWSyvlQtTiuRzc0xYRBnGIH
 461Bb66hT495FZxSMp85TBUbPiby+Clq5PRy51xFBfAz2LZlOVT7hfkHtR3xLhHKAJwI
 7NqpSWmV+9A6UmHCNquSSCLIn8AZpbDlS6BuhsiE4v2sumc6+Z/PK5sSdj7bGWZh7BFr
 6B/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3YtdsZVGY71CO6vpGl3MIh8sBMcWUiJTk6gvp8+iKQ0=;
 b=r6q68luTEljOq3/sR8EQ0ZA1oACl7OZYuWYB81t75xjiDR45FXmQdS8NgB3l6zFMq7
 vm5EqLpT2+3KL+Jz7f5BWBK9W2FS8DrRJMixgHeFejBWKtIavz0sEoqvFSs2pEF1vNqe
 qOs1kszs/sLkTnHMhrRdcDzqkLs+XWp95UOYiNPsoIqgGtBzuNiDwqsWJllUAycJCkze
 QCxD0iNZqYPwRc6GihWGve1vfqLQfZRpexNaoTB8c5CPGnqrm9zj0te1RTERxg5mDNLK
 BcrgSEWXalFLYRTkGyLa6eOjr7n7SHFRD58wA1gXqt1c+XQFaw0j1RTMC1Dqjki7UftD
 MuQw==
X-Gm-Message-State: AOAM531jR/K3I7ZlCqSw5GsyCCfJPiMvTMwXH0A8WkJ25WndXD6Hxt70
 hTO3bEErWLdEYuC2uXec3bM2L5UY4kc8Uqe3580=
X-Google-Smtp-Source: ABdhPJxPIX7kZNesWD1D6ikdCYZ9v+wdZ5zHmIybM6/bqjc2VSsJKl954TkSzni42ZBxq3/uHPZ0Wg==
X-Received: by 2002:a37:96c1:: with SMTP id y184mr39415406qkd.61.1621005254376; 
 Fri, 14 May 2021 08:14:14 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:14:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 33/50] target/i386: Eliminate SVM helpers for user-only
Date: Fri, 14 May 2021 10:13:25 -0500
Message-Id: <20210514151342.384376-34-richard.henderson@linaro.org>
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

Use STUB_HELPER to ensure that such calls are always eliminated.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/helper.h             |  3 +--
 target/i386/tcg/translate.c      |  9 ++++++++
 target/i386/tcg/user/svm_stubs.c | 38 --------------------------------
 3 files changed, 10 insertions(+), 40 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index 7a09efd55b..d0f7f07c6c 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -107,8 +107,6 @@ DEF_HELPER_2(inl, tl, env, i32)
 
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_FLAGS_4(bpt_io, TCG_CALL_NO_WG, void, env, i32, i32, tl)
-#endif /* !CONFIG_USER_ONLY */
-
 DEF_HELPER_3(svm_check_intercept_param, void, env, i32, i64)
 DEF_HELPER_4(svm_check_io, void, env, i32, i32, i32)
 DEF_HELPER_3(vmrun, void, env, int, int)
@@ -118,6 +116,7 @@ DEF_HELPER_2(vmsave, void, env, int)
 DEF_HELPER_1(stgi, void, env)
 DEF_HELPER_1(clgi, void, env)
 DEF_HELPER_2(invlpga, void, env, int)
+#endif /* !CONFIG_USER_ONLY */
 
 /* x86 FPU */
 
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index aeb72cd846..9af0d6f2b5 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -193,7 +193,16 @@ typedef struct DisasContext {
     { qemu_build_not_reached(); }
 
 #ifdef CONFIG_USER_ONLY
+STUB_HELPER(clgi, TCGv_env env)
+STUB_HELPER(invlpga, TCGv_env env, TCGv_i32 aflag)
 STUB_HELPER(set_dr, TCGv_env env, TCGv_i32 reg, TCGv val)
+STUB_HELPER(stgi, TCGv_env env)
+STUB_HELPER(svm_check_intercept_param, TCGv_env env, TCGv_i32 t, TCGv_i64 p)
+STUB_HELPER(svm_check_io, TCGv_env env, TCGv_i32 port, TCGv_i32 p, TCGv_i32 a)
+STUB_HELPER(vmload, TCGv_env env, TCGv_i32 aflag)
+STUB_HELPER(vmmcall, TCGv_env env)
+STUB_HELPER(vmrun, TCGv_env env, TCGv_i32 aflag, TCGv_i32 pc_ofs)
+STUB_HELPER(vmsave, TCGv_env env, TCGv_i32 aflag)
 #endif
 
 static void gen_eob(DisasContext *s);
diff --git a/target/i386/tcg/user/svm_stubs.c b/target/i386/tcg/user/svm_stubs.c
index 63b37f0de6..48a43bdcea 100644
--- a/target/i386/tcg/user/svm_stubs.c
+++ b/target/i386/tcg/user/svm_stubs.c
@@ -22,51 +22,13 @@
 #include "exec/helper-proto.h"
 #include "tcg/helper-tcg.h"
 
-void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
-{
-}
-
-void helper_vmmcall(CPUX86State *env)
-{
-}
-
-void helper_vmload(CPUX86State *env, int aflag)
-{
-}
-
-void helper_vmsave(CPUX86State *env, int aflag)
-{
-}
-
-void helper_stgi(CPUX86State *env)
-{
-}
-
-void helper_clgi(CPUX86State *env)
-{
-}
-
-void helper_invlpga(CPUX86State *env, int aflag)
-{
-}
-
 void cpu_vmexit(CPUX86State *nenv, uint32_t exit_code, uint64_t exit_info_1,
                 uintptr_t retaddr)
 {
     assert(0);
 }
 
-void helper_svm_check_intercept_param(CPUX86State *env, uint32_t type,
-                                      uint64_t param)
-{
-}
-
 void cpu_svm_check_intercept_param(CPUX86State *env, uint32_t type,
                                    uint64_t param, uintptr_t retaddr)
 {
 }
-
-void helper_svm_check_io(CPUX86State *env, uint32_t port, uint32_t param,
-                         uint32_t next_eip_addend)
-{
-}
-- 
2.25.1


