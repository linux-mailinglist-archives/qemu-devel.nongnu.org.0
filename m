Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C1E32757F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 01:12:05 +0100 (CET)
Received: from localhost ([::1]:50448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGWAO-0001ME-Nq
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 19:12:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPw-0005tB-HD
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:04 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:54016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPm-0007mT-35
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:04 -0500
Received: by mail-pj1-x1031.google.com with SMTP id c19so9855786pjq.3
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=49Cd1j1K/38NZkLjnlIs6/b9Bf5vlKLKhEhBcwBUlbI=;
 b=G8KiXVnVwc3anNnMfOFv0bZwkZzyOaS1MmlWqccK/HmJz+/A4QBsDQVzwqoH9y9lON
 lLds6AOv4XJvqZWQ/fdCT3oquu+bgPHuyEATk7bXwteC4g4awRpy9HibgqyCF+c2ipY5
 PgDRW7CWZ+mqA9/Ez/exNu2wd+DB29tBFv2aAK/Gz2b5qt0KRkOVEi3fYtPvlKgikBYd
 tpeVBSPhIHo7nGajUfye7DdXBddIeU51yHZiskz8w6Li2b8O6Lq1z3897Knx4wNvs8KQ
 XxhqWLfoAqpH8F7ZceagK91CEM6I0e8mF7CqvJYTUvdXFBYgtpXtSbR44gvMY/usM/Yr
 9hBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=49Cd1j1K/38NZkLjnlIs6/b9Bf5vlKLKhEhBcwBUlbI=;
 b=Zu42kCsIYdHRHWdCXmYgkLnuconpGTkkpYmdnBMWoTP+YkOnPGLSIvd1+8I/pXi5KX
 yQctwQ3VMx4nLbgLZ412UlMCyqJem/GBTa0HgI2O/A0tIjA8A9aw+GKLDZnCgI3MeqfD
 QYHwW/tZxoJLOG+nU7swBk3hNJunYL/CYeZBAFCBzluUCRNSe2Udv5bZGmQ36Dwvt2ST
 Hoqnuhk4TmYS6aJW73B4JjqN6bTjVx2K9Vfg5tih2NGTI2TsAMRZg+lAgyvvcQk9S3E1
 M94utAiLVUtDB24EJglQJXnOCrTT/DUYL7GCDpqfYirjTS/JfRplqnNeN+fZglLeaki+
 pvIQ==
X-Gm-Message-State: AOAM530zr+fR+rFwx5xX0wZXn2aI/KbF3lF74MuiqseL+OVRPJl+kLHB
 qrFQ/WsYeL4fF4egjLM0n3fgi/YuFTufxg==
X-Google-Smtp-Source: ABdhPJwdZfK82X6M5KwWc9IDQhMFnJo5JEfSWuOUfAJ8kPTaALlNXayaU3MSFLXLzz4609qWNvDfBw==
X-Received: by 2002:a17:90a:ce0c:: with SMTP id
 f12mr3133064pju.11.1614554632778; 
 Sun, 28 Feb 2021 15:23:52 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 36/50] target/i386: Tidy svm_check_intercept from tcg
Date: Sun, 28 Feb 2021 15:23:07 -0800
Message-Id: <20210228232321.322053-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
index ca5a781a7e..86a0b3c4be 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -517,10 +517,9 @@ void cpu_svm_check_intercept_param(CPUX86State *env, uint32_t type,
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
index c135be9063..cbc0cc3ccc 100644
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


