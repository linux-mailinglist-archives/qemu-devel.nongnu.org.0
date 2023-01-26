Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC0667C3ED
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 05:42:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKu2p-0000Pe-U5; Wed, 25 Jan 2023 23:39:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2Y-0000Hq-OS
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:11 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2V-0004TZ-FR
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:10 -0500
Received: by mail-pj1-x1035.google.com with SMTP id m11so563423pji.0
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 20:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BaPNUV0c7247g5NnraFY0tZEOzKo666SsANsAFMshsk=;
 b=XfpXMwT1eKZ8klyN5pMeD6yVXvJfnP515CrIgKG+MOnMx8REEynWgzXSQCagSzOCZY
 B8yqAZ6B+96U5d5iHSGaVRhSTEHNv/hO+eCh9i8QZOa1rdcQu3f+T5ft759pwh/VfU5w
 MOBdN/tyJ0PXvJ0G1trx0mkvYFwqqiyDHllCBQ8bllkED8wKdfd6I+qGqb1d7G+Zx8M8
 G8sOTnc3pEyluB1S1Km2hx9VPJtsK0WZa28SAxwawczzyGoUOf4sHC9ZvHO1Bz8bjUOC
 XHW9IMgKM0gKhB4CtDU8gQ12jYs/kqrP/JiQTWLKKh5YEIqdwdF2Rh8RwDNqmiMwJReh
 p77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BaPNUV0c7247g5NnraFY0tZEOzKo666SsANsAFMshsk=;
 b=gyKNsOOqd2P5phl+Plk5VrLw+DLU2S9PB5onmBgcBXZTMgkR2rQSYDG+iR4ZNZcvBt
 DWHXvSt/ID9vQY2ZesbnE1czl3yFVHH+76JtXALhHWkg71cB/MqcprppHN2lNUsYI6ju
 5Io6DZ4baitvrwFHNCqb12Urec8oREllbLAL8swJSlKpx84hlrkw7xMzA19GS0F0IDoE
 s8Nu3tcd8mPg1TcgWc8gr8b+7QGsgsCluPj2MTRn7kW5GhV9Co2I2J4Zq2CnN8KEviGS
 IKA0II/O5KzfI9HYDBvxmD2wJc1NKA8/ZEE5YnWhItdUW6+P2saSFzw0YkXdxJWYQOJp
 aA3Q==
X-Gm-Message-State: AFqh2kpAr4x3/Kxbcum7DlmaDfkmlEmZHePPCFazf2a3Z0vE/Vp8RE3C
 rzo3Xl+pZhgOXmXQggBnrj+ZqJflwEX9Jp4iEEw=
X-Google-Smtp-Source: AMrXdXvX0rYU94hRT+4Mk1KGbu4qR10Kta11LEpN7OTfScF41gu4w3/RJsdVgto2Tfq7gqs5yonBhg==
X-Received: by 2002:a17:90b:3eca:b0:22b:b89b:b9d0 with SMTP id
 rm10-20020a17090b3eca00b0022bb89bb9d0mr21215869pjb.22.1674707945250; 
 Wed, 25 Jan 2023 20:39:05 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a17090a69c400b00228e56d375asm233376pjj.33.2023.01.25.20.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 20:39:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v5 24/36] target/s390x: Use a single return for
 helper_divs32/u32
Date: Wed, 25 Jan 2023 18:38:12 -1000
Message-Id: <20230126043824.54819-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126043824.54819-1-richard.henderson@linaro.org>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Pack the quotient and remainder into a single uint64_t.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix operand ordering; use tcg_extr32_i64.
Cc: David Hildenbrand <david@redhat.com>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/helper.h         |  2 +-
 target/s390x/tcg/int_helper.c | 26 +++++++++++++-------------
 target/s390x/tcg/translate.c  |  8 ++++----
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 93923ca153..bc828d976b 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -10,7 +10,7 @@ DEF_HELPER_FLAGS_4(clc, TCG_CALL_NO_WG, i32, env, i32, i64, i64)
 DEF_HELPER_3(mvcl, i32, env, i32, i32)
 DEF_HELPER_3(clcl, i32, env, i32, i32)
 DEF_HELPER_FLAGS_4(clm, TCG_CALL_NO_WG, i32, env, i32, i32, i64)
-DEF_HELPER_FLAGS_3(divs32, TCG_CALL_NO_WG, s64, env, s64, s64)
+DEF_HELPER_FLAGS_3(divs32, TCG_CALL_NO_WG, i64, env, s64, s64)
 DEF_HELPER_FLAGS_3(divu32, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(divs64, TCG_CALL_NO_WG, s64, env, s64, s64)
 DEF_HELPER_FLAGS_4(divu64, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
diff --git a/target/s390x/tcg/int_helper.c b/target/s390x/tcg/int_helper.c
index 954542388a..7260583cf2 100644
--- a/target/s390x/tcg/int_helper.c
+++ b/target/s390x/tcg/int_helper.c
@@ -34,45 +34,45 @@
 #endif
 
 /* 64/32 -> 32 signed division */
-int64_t HELPER(divs32)(CPUS390XState *env, int64_t a, int64_t b64)
+uint64_t HELPER(divs32)(CPUS390XState *env, int64_t a, int64_t b64)
 {
-    int32_t ret, b = b64;
-    int64_t q;
+    int32_t b = b64;
+    int64_t q, r;
 
     if (b == 0) {
         tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
     }
 
-    ret = q = a / b;
-    env->retxl = a % b;
+    q = a / b;
+    r = a % b;
 
     /* Catch non-representable quotient.  */
-    if (ret != q) {
+    if (q != (int32_t)q) {
         tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
     }
 
-    return ret;
+    return deposit64(q, 32, 32, r);
 }
 
 /* 64/32 -> 32 unsigned division */
 uint64_t HELPER(divu32)(CPUS390XState *env, uint64_t a, uint64_t b64)
 {
-    uint32_t ret, b = b64;
-    uint64_t q;
+    uint32_t b = b64;
+    uint64_t q, r;
 
     if (b == 0) {
         tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
     }
 
-    ret = q = a / b;
-    env->retxl = a % b;
+    q = a / b;
+    r = a % b;
 
     /* Catch non-representable quotient.  */
-    if (ret != q) {
+    if (q != (uint32_t)q) {
         tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
     }
 
-    return ret;
+    return deposit64(q, 32, 32, r);
 }
 
 /* 64/64 -> 64 signed division */
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index a339b277e9..169f7ee1b2 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -2395,15 +2395,15 @@ static DisasJumpType op_diag(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_divs32(DisasContext *s, DisasOps *o)
 {
-    gen_helper_divs32(o->out2, cpu_env, o->in1, o->in2);
-    return_low128(o->out);
+    gen_helper_divs32(o->out, cpu_env, o->in1, o->in2);
+    tcg_gen_extr32_i64(o->out2, o->out, o->out);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_divu32(DisasContext *s, DisasOps *o)
 {
-    gen_helper_divu32(o->out2, cpu_env, o->in1, o->in2);
-    return_low128(o->out);
+    gen_helper_divu32(o->out, cpu_env, o->in1, o->in2);
+    tcg_gen_extr32_i64(o->out2, o->out, o->out);
     return DISAS_NEXT;
 }
 
-- 
2.34.1


