Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B273F607192
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 10:02:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmyk-0003xr-Ij
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:02:06 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmVN-0004cA-1q
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmUy-00046Z-A0
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:31:31 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmUV-0007tR-1Z
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:31:15 -0400
Received: by mail-pj1-x102a.google.com with SMTP id ez6so1717013pjb.1
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1tQ/dXFlqMICC2IRZodhBxwkDD25EVtE73g1mVneeVA=;
 b=B6BBDFrj9zSFy1/mf2mDPx6igGOLHelz/sw8JCBNIjEpuS0IkH7DKVyplwFlYFDo/H
 dL4VGJvMV5BFDgmLZtNIsLB/IIT+mRv0m++hUGw9CmyInCICG1jyxDLsve+yLQL1EnHD
 c7VGMBA+Lz2w9QT7El52nGe2MYRZGA057IW3tn+fiCScNLoO90vgS9Qi5NUnSuFy3X73
 H1xaYDswxYzf6dXWqlaFqeI5zkQCaGQx/6mmlqlSWFOOXbeBQ5tYQJqmWuoBVphISXtE
 QYENaek6vbNL5JcjX9OCzU4TniLtkw60LOGK9hRWMYNBuqRRtbpiv+6idLuEMO3p7Okj
 ZxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1tQ/dXFlqMICC2IRZodhBxwkDD25EVtE73g1mVneeVA=;
 b=0N4uBIbk+Z+0Lz4sFR2AyrMBHQ7S+XbRgj9gDWhLziBY2zK4lYL/4e4Zz13AZwEhZ3
 LND837fozVQRr+9Y614RE+w4/dGtVvlg8HtxHOERi54oBevZ6YZ3j2QHkDFZm9guUAMa
 ov+FJRCAHTLF2EkRIDP6XvW/32eTY5TxSkFlBv/35ny2D1B0vCbNqj0qM9Qz5aHMpY4t
 ioV6yuqbqI5LbCyO7VwRugZdFVds1862FqqxElLM3hUL0mfJm2KJhRYRlBVXOthmELba
 QLahB+/3OsNe39dQlQ00qcR6xrv6xpwK01dy3TpLXMbom8mYsrwYu2kRKPOru/CMtGcd
 hoRg==
X-Gm-Message-State: ACrzQf2F7NlCUgCOVRBT/7inMrS4VMVDNT01DYIr3se1Q2mg5oVI9sdb
 zSqxRavmGaFzM4WhdOiUdOtSJsiT1ikBICBZ
X-Google-Smtp-Source: AMsMyM4LbjvIZ5mF2Dg5zZo+xW7smobkv4JkM1M4MyruiVhaU5tP6gXECLfoWOhk6X/IfF8/fYqZUg==
X-Received: by 2002:a17:903:41cb:b0:183:1648:be0f with SMTP id
 u11-20020a17090341cb00b001831648be0fmr17894812ple.18.1666337449506; 
 Fri, 21 Oct 2022 00:30:49 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a17090a6d8900b002008d0e5cb5sm1042721pjk.47.2022.10.21.00.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:30:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 2/9] target/s390x: Use a single return for helper_divs64/u64
Date: Fri, 21 Oct 2022 17:29:59 +1000
Message-Id: <20221021073006.2398819-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021073006.2398819-1-richard.henderson@linaro.org>
References: <20221021073006.2398819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pack the quotient and remainder into a single Int128.
Use the divu128 primitive to remove the cpu_abort on
32-bit hosts.

This is the first use of Int128 as a return value.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/helper.h         |  4 ++--
 target/s390x/tcg/int_helper.c | 38 +++++++++--------------------------
 target/s390x/tcg/translate.c  | 14 +++++++++----
 3 files changed, 21 insertions(+), 35 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 97a9668eef..29986557ed 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -12,8 +12,8 @@ DEF_HELPER_3(clcl, i32, env, i32, i32)
 DEF_HELPER_FLAGS_4(clm, TCG_CALL_NO_WG, i32, env, i32, i32, i64)
 DEF_HELPER_FLAGS_3(divs32, TCG_CALL_NO_WG, i64, env, s64, s64)
 DEF_HELPER_FLAGS_3(divu32, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(divs64, TCG_CALL_NO_WG, s64, env, s64, s64)
-DEF_HELPER_FLAGS_4(divu64, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
+DEF_HELPER_FLAGS_3(divs64, TCG_CALL_NO_WG, i128, env, s64, s64)
+DEF_HELPER_FLAGS_4(divu64, TCG_CALL_NO_WG, i128, env, i64, i64, i64)
 DEF_HELPER_3(srst, void, env, i32, i32)
 DEF_HELPER_3(srstu, void, env, i32, i32)
 DEF_HELPER_4(clst, i64, env, i64, i64, i64)
diff --git a/target/s390x/tcg/int_helper.c b/target/s390x/tcg/int_helper.c
index 130b8bd4d2..7dc919a102 100644
--- a/target/s390x/tcg/int_helper.c
+++ b/target/s390x/tcg/int_helper.c
@@ -76,46 +76,26 @@ uint64_t HELPER(divu32)(CPUS390XState *env, uint64_t a, uint64_t b64)
 }
 
 /* 64/64 -> 64 signed division */
-int64_t HELPER(divs64)(CPUS390XState *env, int64_t a, int64_t b)
+Int128 HELPER(divs64)(CPUS390XState *env, int64_t a, int64_t b)
 {
     /* Catch divide by zero, and non-representable quotient (MIN / -1).  */
     if (b == 0 || (b == -1 && a == (1ll << 63))) {
         tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
     }
-    env->retxl = a % b;
-    return a / b;
+    return int128_make128(a % b, a / b);
 }
 
 /* 128 -> 64/64 unsigned division */
-uint64_t HELPER(divu64)(CPUS390XState *env, uint64_t ah, uint64_t al,
-                        uint64_t b)
+Int128 HELPER(divu64)(CPUS390XState *env, uint64_t ah, uint64_t al, uint64_t b)
 {
-    uint64_t ret;
-    /* Signal divide by zero.  */
-    if (b == 0) {
-        tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
-    }
-    if (ah == 0) {
-        /* 64 -> 64/64 case */
-        env->retxl = al % b;
-        ret = al / b;
-    } else {
-        /* ??? Move i386 idivq helper to host-utils.  */
-#ifdef CONFIG_INT128
-        __uint128_t a = ((__uint128_t)ah << 64) | al;
-        __uint128_t q = a / b;
-        env->retxl = a % b;
-        ret = q;
-        if (ret != q) {
-            tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
+    if (b != 0) {
+        uint64_t r = divu128(&al, &ah, b);
+        if (ah == 0) {
+            return int128_make128(r, al);
         }
-#else
-        /* 32-bit hosts would need special wrapper functionality - just abort if
-           we encounter such a case; it's very unlikely anyways. */
-        cpu_abort(env_cpu(env), "128 -> 64/64 division not implemented\n");
-#endif
     }
-    return ret;
+    /* divide by zero or overflow */
+    tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
 }
 
 uint64_t HELPER(cvd)(int32_t reg)
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 525317c9df..a3f5a55891 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -2411,15 +2411,21 @@ static DisasJumpType op_divu32(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_divs64(DisasContext *s, DisasOps *o)
 {
-    gen_helper_divs64(o->out2, cpu_env, o->in1, o->in2);
-    return_low128(o->out);
+    TCGv_i128 t = tcg_temp_new_i128();
+
+    gen_helper_divs64(t, cpu_env, o->in1, o->in2);
+    tcg_gen_extr_i128_i64(o->out, o->out2, t);
+    tcg_temp_free_i128(t);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_divu64(DisasContext *s, DisasOps *o)
 {
-    gen_helper_divu64(o->out2, cpu_env, o->out, o->out2, o->in2);
-    return_low128(o->out);
+    TCGv_i128 t = tcg_temp_new_i128();
+
+    gen_helper_divu64(t, cpu_env, o->out, o->out2, o->in2);
+    tcg_gen_extr_i128_i64(o->out, o->out2, t);
+    tcg_temp_free_i128(t);
     return DISAS_NEXT;
 }
 
-- 
2.34.1


