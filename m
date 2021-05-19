Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6839C3895C9
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:49:53 +0200 (CEST)
Received: from localhost ([::1]:59884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRGS-0007MB-Em
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyt-0004V2-Qj
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:43 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:34697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyc-0005nT-T7
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:43 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 u25-20020a0568302319b02902ac3d54c25eso12656971ote.1
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5OwIdHlv3LdKR7MTqV9VCeiU1XRsbRl+uomjXUgH9RM=;
 b=O3Qoa0oPmKPLbGotezIODNmkKL+o2YtDJ94KujFPMzS44YcOFDtpke8ON87RcGjoJT
 3CjDTU9b+FqycVqmAAesVfgEsyyLugMJ0bZFFmwfyZQVhuDfBLWE8R1zemeeqUKZescb
 h2dVTIT4aL0dLj20xIoparWGbIBdchE1DbzEOiPmjjH8/CQlKCdzOaEAaCL3Ifm5pJsx
 C6/BMBwLGXOrLrZC10UD1nv6aV9U53U0KiLby0Kxh1ZKBMuWK3Cr+mpw3rTp3m18DWmN
 1zasu3q5/H7aNkdImOWKONQR9mullbsMg1tSy97xHzg61sQLq8gwCK5aEcQ/vzfSdyd6
 uISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5OwIdHlv3LdKR7MTqV9VCeiU1XRsbRl+uomjXUgH9RM=;
 b=a1dniCbtWQ/BtfGDoGlk44GPoe96I4vASinThyczGE7hVb0evNLK43NP4BGLvh+aRf
 FYbi882c5FXgUGZCGlIdTPyqm24KE4T7W92YZww3SSR5YWlJCLJjcK8moof1fExMt4Qt
 lkjXM7iW7ZYpZ/MazKFVJGmj7Y02tA7LxRpq56+oOvhlol9nfki6NmUoJdJiPg6Ze4u6
 Bi/ZOkBIKav7B7oCspAs0W8ZMyZWGKHGLnM5pYCJMAhtAhPjWfekUqn9ciXT1C7+pizr
 yZMnVkN/Mu0CIJc6pZqECzJejH4cDTtgBSY9dCRn/7iuHDF3YktdRbfSBlLZQg+HJEYJ
 TCzA==
X-Gm-Message-State: AOAM530UIvE8MHN27m4AnqBEvoNiKJrRhPiE0cEuSVbeFUsrK0F2O4E+
 I3ouf9wvOeg2AwfsbDB5CW0WSSGdFzc99xC9
X-Google-Smtp-Source: ABdhPJw1sPW1F7KrlFYwLCKufDI5BUts4popzIYzquGSDf3fvJm4CLZzlB288NuMAOnh1nyoDHanHg==
X-Received: by 2002:a9d:6244:: with SMTP id i4mr646702otk.182.1621449084717;
 Wed, 19 May 2021 11:31:24 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/50] target/i386: Eliminate SVM helpers for user-only
Date: Wed, 19 May 2021 13:30:33 -0500
Message-Id: <20210519183050.875453-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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

Use STUB_HELPER to ensure that such calls are always eliminated.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-34-richard.henderson@linaro.org>
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
index f7f84f79fe..b2a997fb30 100644
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


