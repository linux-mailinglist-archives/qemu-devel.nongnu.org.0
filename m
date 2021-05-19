Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C453895F5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:59:03 +0200 (CEST)
Received: from localhost ([::1]:39210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRPK-0005yz-In
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljR1m-000340-HU
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:34:42 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:35698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljR1h-0007Qk-Hp
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:34:42 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so12625301otg.2
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5FZEkPjS4wJtxJ82VN/fE6regNmzsPr0FO89DJYk2Ek=;
 b=DM32tm/9glhf1FkBdEJiHNAfhe4OHqcDeKdIJeJl+TDAJl0aHqH2+hTlTNvLOy+db2
 rwEZywZxmFybont52Y5DQy/yputet4q4vWFWO4ZEZatRpKyQ4MQCGEM1hVjD82tW5pzX
 eNAFBbTq3p0HwN86Hrj1QrZDR+/IuKfs4S3cZvQuvA4UOanX4zvPFTNAfpjTWtWrkf1S
 3Q4tYxQ0PKzQoc/2C3fHHBVg++MNX27Q8cRoV5SKz8ndD9GZ244mUrvCOJk7NAZuiXUU
 QWcrzzoWizksrqfNBBMBwjXawLyLJSchcRs9FXlmPZZFI/dumUelFCDF2FDZ4m2yBjdd
 2TlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5FZEkPjS4wJtxJ82VN/fE6regNmzsPr0FO89DJYk2Ek=;
 b=Bc2yCk4EA5aRItC2GWgVHp8tpkTBjj12BhZoOIvJgS+ihGpvywcd7dJtA7tbJE/nwm
 NOrRYczq05uBh2WA1CdEJNX0MjsjbadtIt5To660xw7VPAI99WYlMStqjHlC350AYzlz
 n5nKdBPG91ZBuqngkm0emZHXiRgtudnL9cA4XzDAICYUTry8BYCQ8U+wplF8VmfMRYEa
 Wb78ri6vWLsCh9cR8mGJ0oib7SfL9Fyww7UPXa+yhCHFE0knjGlwubPXRJ3X3p52vTVq
 yjJpB8dW/Wn1K4RjFPyur71hAARvZU09w1P8xdLuBMzKeyrI3SuLWB7jTIY8vtsQKmuE
 iK3Q==
X-Gm-Message-State: AOAM530ghkhEhmXfbDFyxwLbb7b64FGl1V3igr4X6TIJO+gY/4NoB2yT
 txCco/AJJQZUSlkOEzH9UPayFLwB0EKYhRpj
X-Google-Smtp-Source: ABdhPJzyfyKv/fN8CEmhXRcJXl3BbWe41kHG0CrMdgjYeR9aNfyvq21RPgR1qD30WBW8zG5tqLhDdw==
X-Received: by 2002:a05:6830:1388:: with SMTP id
 d8mr659926otq.53.1621449276484; 
 Wed, 19 May 2021 11:34:36 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id i9sm38642oog.17.2021.05.19.11.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:34:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 44/50] target/i386: Eliminate user stubs for read/write_crN,
 rd/wrmsr
Date: Wed, 19 May 2021 13:30:44 -0500
Message-Id: <20210519183050.875453-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-45-richard.henderson@linaro.org>
---
 target/i386/helper.h              |  8 ++++----
 target/i386/tcg/translate.c       |  4 ++++
 target/i386/tcg/user/misc_stubs.c | 20 --------------------
 3 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index 0264fba335..1d85f033df 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -42,8 +42,6 @@ DEF_HELPER_5(lcall_protected, void, env, int, tl, int, tl)
 DEF_HELPER_2(iret_real, void, env, int)
 DEF_HELPER_3(iret_protected, void, env, int, int)
 DEF_HELPER_3(lret_protected, void, env, int, int)
-DEF_HELPER_FLAGS_2(read_crN, TCG_CALL_NO_RWG, tl, env, int)
-DEF_HELPER_FLAGS_3(write_crN, TCG_CALL_NO_RWG, void, env, int, tl)
 DEF_HELPER_1(clts, void, env)
 
 #ifndef CONFIG_USER_ONLY
@@ -87,8 +85,6 @@ DEF_HELPER_1(cpuid, void, env)
 DEF_HELPER_1(rdtsc, void, env)
 DEF_HELPER_1(rdtscp, void, env)
 DEF_HELPER_FLAGS_1(rdpmc, TCG_CALL_NO_WG, noreturn, env)
-DEF_HELPER_1(rdmsr, void, env)
-DEF_HELPER_1(wrmsr, void, env)
 
 DEF_HELPER_2(check_iob, void, env, i32)
 DEF_HELPER_2(check_iow, void, env, i32)
@@ -114,6 +110,10 @@ DEF_HELPER_FLAGS_2(flush_page, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_2(hlt, TCG_CALL_NO_WG, noreturn, env, int)
 DEF_HELPER_FLAGS_2(monitor, TCG_CALL_NO_WG, void, env, tl)
 DEF_HELPER_FLAGS_2(mwait, TCG_CALL_NO_WG, noreturn, env, int)
+DEF_HELPER_1(rdmsr, void, env)
+DEF_HELPER_1(wrmsr, void, env)
+DEF_HELPER_FLAGS_2(read_crN, TCG_CALL_NO_RWG, tl, env, int)
+DEF_HELPER_FLAGS_3(write_crN, TCG_CALL_NO_RWG, void, env, int, tl)
 #endif /* !CONFIG_USER_ONLY */
 
 /* x86 FPU */
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index eb11a75e86..9501089861 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -198,6 +198,8 @@ STUB_HELPER(flush_page, TCGv_env env, TCGv addr)
 STUB_HELPER(hlt, TCGv_env env, TCGv_i32 pc_ofs)
 STUB_HELPER(monitor, TCGv_env env, TCGv addr)
 STUB_HELPER(mwait, TCGv_env env, TCGv_i32 pc_ofs)
+STUB_HELPER(rdmsr, TCGv_env env)
+STUB_HELPER(read_crN, TCGv ret, TCGv_env env, TCGv_i32 reg)
 STUB_HELPER(set_dr, TCGv_env env, TCGv_i32 reg, TCGv val)
 STUB_HELPER(stgi, TCGv_env env)
 STUB_HELPER(svm_check_intercept, TCGv_env env, TCGv_i32 type)
@@ -206,6 +208,8 @@ STUB_HELPER(vmload, TCGv_env env, TCGv_i32 aflag)
 STUB_HELPER(vmmcall, TCGv_env env)
 STUB_HELPER(vmrun, TCGv_env env, TCGv_i32 aflag, TCGv_i32 pc_ofs)
 STUB_HELPER(vmsave, TCGv_env env, TCGv_i32 aflag)
+STUB_HELPER(write_crN, TCGv_env env, TCGv_i32 reg, TCGv val)
+STUB_HELPER(wrmsr, TCGv_env env)
 #endif
 
 static void gen_eob(DisasContext *s);
diff --git a/target/i386/tcg/user/misc_stubs.c b/target/i386/tcg/user/misc_stubs.c
index 84df4e65ff..df38b44d6e 100644
--- a/target/i386/tcg/user/misc_stubs.c
+++ b/target/i386/tcg/user/misc_stubs.c
@@ -53,23 +53,3 @@ target_ulong helper_inl(CPUX86State *env, uint32_t port)
     g_assert_not_reached();
     return 0;
 }
-
-target_ulong helper_read_crN(CPUX86State *env, int reg)
-{
-    g_assert_not_reached();
-}
-
-void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
-{
-    g_assert_not_reached();
-}
-
-void helper_wrmsr(CPUX86State *env)
-{
-    g_assert_not_reached();
-}
-
-void helper_rdmsr(CPUX86State *env)
-{
-    g_assert_not_reached();
-}
-- 
2.25.1


