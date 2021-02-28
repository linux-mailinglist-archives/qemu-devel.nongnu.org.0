Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7688532754F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:44:43 +0100 (CET)
Received: from localhost ([::1]:52136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVju-0003Ly-FC
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:44:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVQN-0006dh-KK
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:31 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:37162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVQL-00082z-OS
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:31 -0500
Received: by mail-pg1-x52c.google.com with SMTP id o10so10362572pgg.4
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LwDKrp05e40VoqkSfurI/uNTqGwd7yQc3l2JK2S828k=;
 b=jA3QfZNeRNP478mdVidjuVrkCYa6QeutoPFaqhpZxbtgYMmFfpccSJ3LCnXY5NG8NQ
 H/jSOBNXJ9WiwtFBiMrXOSJcu0IlZQcWtQZY1dqhL7X88ZXYmeFbpcy9ldcrZsBFCfCT
 EKcHg6lTWfDYFSDCv3E9ij9obLmXpZsmf0nDeoldPyFSmwlhtvMQ58dnXxwRowWOVlWD
 vbOzwjQN4inbk+GSsr7vcQmt9BAgAeXZdgryDNJcqira4skDWnHeGd5ILLA4/aVkIVhs
 QdFksS/ILxZrG4wy67V/mfFUElFbae3WMcI2yHK1jQe4J5DircdOLV76cmhXZ75jMsf7
 3s3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LwDKrp05e40VoqkSfurI/uNTqGwd7yQc3l2JK2S828k=;
 b=FK7g7K+f0LmpxeXnf28OxsPqCWwEI0BYeIKplATZWT5HLswR7/ZMat7RRDZt1Clvgl
 B+MpUa9DcVSeQHwtB7TkQFNXpgyM6Tn8+CrMaKmkaM5WIHPIt4RiZiDnQ6GVcXmT+vok
 VR6VfUeDc/ffp57o8DZgrwvh2u3/L7UaSNiiLxg3zgWODqb/01VQK3g2QrgMwkokjK70
 cmTlEgkcqoI3aiBvkIL9WbwWAjjHmxpkW9Nhp9ui2u+WZ+zDXr0JuwQzXoWuYxJYV7yQ
 HFggaDzZGMmQsI4PcSpskradJsn1wSkKD4IsXwk/CtCiTSxNV2jUa3Bv7IknH9MLUa3B
 sVow==
X-Gm-Message-State: AOAM5312N1t7nkkaVHswKYHyS7w51PFylX4rrhF49xxPGSSJkHWZCswk
 KPVISDqpEw6qjZwPo31fRIKzrWtknk3T6Q==
X-Google-Smtp-Source: ABdhPJwwNEnkeGecLQn0lJX6z1TrvHz4TpDFcDdIXwRBT5WkXdLks6/wOf+E8qzFErS4592KidhhWw==
X-Received: by 2002:a62:5344:0:b029:1c7:eeea:8bad with SMTP id
 h65-20020a6253440000b02901c7eeea8badmr12659627pfb.1.1614554668418; 
 Sun, 28 Feb 2021 15:24:28 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id b10sm14164049pgm.76.2021.02.28.15.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:24:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 44/50] target/i386: Eliminate user stubs for read/write_crN,
 rd/wrmsr
Date: Sun, 28 Feb 2021 15:23:15 -0800
Message-Id: <20210228232321.322053-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
index 9d2171aa3a..2493d39f0b 100644
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


