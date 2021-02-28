Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47AF327559
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:47:56 +0100 (CET)
Received: from localhost ([::1]:60866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVn1-0006wL-Kx
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPu-0005oW-OR
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:02 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:44600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPk-0007m3-2C
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:02 -0500
Received: by mail-pl1-x62e.google.com with SMTP id a24so8747890plm.11
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A+PcN8cdTkjWxRnwHsXZMZGYR2o7apRl4p1FGWLV554=;
 b=Q6uroxugfl8k0NiFOcn0MB23gjoHM7N30Z/aMfyUHb76YX7/45glmwmD+ghKlC5lM9
 2zqhybij4Z3Z8CW/hPQvLOSbgQKABKtqm9nZbdA0OyH2zYLorObjDGkLLm1OgCU8wZIT
 VAgNyaRfoKGwPVL2PJbYhqLU3qHZDq9qwMVaqzCHGZTss1dx2maDRjA3jNPRZ89uGGFE
 I9lNH/aI6N5X6CjOgN6XQ2fvg2N6DIvCtUoOw2St3LaVORgJmaRXLCSTQxD+qpYMwcad
 awe/CaLwqNsqIi3pPr866o7puM6FZ3K8tu9Ad3rn+9VLGkLEo4cSxH2uoXrVHk9j0MGX
 20dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A+PcN8cdTkjWxRnwHsXZMZGYR2o7apRl4p1FGWLV554=;
 b=AjDFX7GVZf7+rjZf0xXVaotWty9pMwb7kZgROs0O/OcjT0px7wzRFjjt6jgJfzCiOw
 hUbXYGwSJk5Tiy3Nd9foqKoWd5dsfqoT6CsZDE2jHGm3o/psU1apR9gl3YlWt3YOmNtB
 srl2YgTZdb4QZVPkWuwt0s8gRKBiawlvEtT3HDz1xRiq+wXxL2Qp39Nftrrrg3b6/mTp
 fS71sGHJN7RyqQ2Y0jvYQ+3V2jxMhCDrLc2WsqbYK34tpqg8N8w2VQnlKy/k+BiHMEzl
 hF9PviXptJ7U1Xh2lKj9hsBrFkeesYovLnwI+GZZpuygl+6NnXnVQk/D4KRQ1+41deA6
 PmRg==
X-Gm-Message-State: AOAM531wGZGK7k2nNZsUxo6a9GNPkczr/vkLkMPWykEBJQf48u84rLlF
 WXOExJJqg37X56eDk/JU5XKOCcyhlkJ0nA==
X-Google-Smtp-Source: ABdhPJzpIYHI5un5p9t4msf24dWNrh+dvBc1MI19p/BRnnaBppd1m2CTTumlt61iFeB5hqQuW0SrGw==
X-Received: by 2002:a17:902:a714:b029:e3:1cd:a033 with SMTP id
 w20-20020a170902a714b02900e301cda033mr12420258plq.27.1614554630777; 
 Sun, 28 Feb 2021 15:23:50 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 33/50] target/i386: Eliminate SVM helpers for user-only
Date: Sun, 28 Feb 2021 15:23:04 -0800
Message-Id: <20210228232321.322053-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: cfontana@suse.de
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
index 92e85e1872..8c77c9cbe6 100644
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


