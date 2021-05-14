Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F83C380D7D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:41:32 +0200 (CEST)
Received: from localhost ([::1]:35112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZwR-0007oW-E2
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZZA-0003Xe-Es
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:17:28 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:42609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZZ8-0000Ed-FR
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:17:28 -0400
Received: by mail-qt1-x833.google.com with SMTP id k10so8889715qtp.9
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UUFFT+y5F2S8cXEuCQEETTjZwWb0VciY8UlipYxFAPY=;
 b=IbhNQcxdvrhMMVBeHCM0XTQp2gBmUM4Oa6a+UXLBObFKwv048DMo/DU88FM28Ew4kC
 psZ7if1XyhGglY/5+ZmPPc8US6vas6SQ4dyM7AQFt82Z/TNW8fvXZQ7GCl/Vyyv4CTKt
 RBC6GaE2beXlCQ3l3biXafg5yDKE9FijQPg9vOaXx78jo4Y+vNrO6wWzpiGxuwgSra0t
 6r+yeTmoeVI4U03LU1LOaqVOpQ0INVXHDEU8Spfiv1LlbxwaaO5Yq/faRnxfFoX1qoAc
 RoWXgDWmZY2BCh3Wwml0yXOlXeMC88nXuMiAe+VOmCtZgTO6jSI5yaLVhme2IIx72v4P
 BP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UUFFT+y5F2S8cXEuCQEETTjZwWb0VciY8UlipYxFAPY=;
 b=ECTVU4x3PMhYs+xynIMpo2+CD/ckNVXLSltRYLiioc8/1xSVJ2h8WUvyDozdRmij36
 pz5hMB7cywHUwXx/YNvTZvEAPy04pdn8IrIx1NDW+aIfYPXMnGyK9cQC4cWRDTXoOMLA
 evmEDkKhII1Phm15Hs3xqIfgCE73EZiult4t0IdpFhYWoQ4cWuPv6jgxaQdS9s39AMZE
 e6H5iojZYFPn6IIQ/bmkoMknAUydT2i7YoYvBA+Z86L6r13NzP/pfgoMY5pVyG0VyYnm
 BLbaDkXZ1yEKVJyiQNrnkTzYftCRshX2XfZhe8XKuYbt/aj+kmrhEsnuJkOVghbICx9z
 vGdA==
X-Gm-Message-State: AOAM530DDj+l+2l+ESCjj909MRetS4gWGl0OCW4NinHmAVpMMmXYphAt
 mI4GcPA4/9s8nPwYaroHPQbyRh14IyX+dpGlISs=
X-Google-Smtp-Source: ABdhPJyvmEwdpmRwqs6WeAc9smjY8Se2TkE3BDHeOLMnIRc9fHzx8txOp95ldmSTO6IvJJFer7YnDQ==
X-Received: by 2002:ac8:4e21:: with SMTP id d1mr42986590qtw.290.1621005445648; 
 Fri, 14 May 2021 08:17:25 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id p190sm5181972qke.13.2021.05.14.08.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:17:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 44/50] target/i386: Eliminate user stubs for read/write_crN,
 rd/wrmsr
Date: Fri, 14 May 2021 10:13:36 -0500
Message-Id: <20210514151342.384376-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
index 104101c8a8..2aa2410336 100644
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


