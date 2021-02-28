Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4E3327557
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:47:55 +0100 (CET)
Received: from localhost ([::1]:60660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVn0-0006rM-7G
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:47:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPt-0005kC-6P
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:01 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:41373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPi-0007lj-3H
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:00 -0500
Received: by mail-pg1-x536.google.com with SMTP id a23so548434pga.8
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=czdE06JLRHpOqF9jSyw++HZIOzTZNz7lm/9aBoir1rI=;
 b=u+B0cgxXDQeTsumcfKSqWViZC3djhMfcbhpfuj9aVUDCArt5BvRFtRaogR17aCaMMp
 qq7oWvwzgGm2LOJtyb5wrj9RMfaLGUdkWjQTWFvPJzeSA5iI6cHIg3W2kdwAUB0tOUeJ
 bdfmzMUbnCEClZR1aLRjJG4FjghhqPxgCemrw+WAFkmtkk1Czu+Nr8QyU/7U68Fgspgw
 lo5lqrOBAmJCcp8ffsigbNe6EOMPg6RUx/kp7c39eYwDXP0Csp0p/q4j47IIljdcRbgh
 4t92E4QBqYu7C+YVRw/yxS/JAxJ8RUtdfYHWzCk+ijt0mMeuwHp9vfpLO0vWFO06DjxQ
 aYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=czdE06JLRHpOqF9jSyw++HZIOzTZNz7lm/9aBoir1rI=;
 b=UxzKefgVSVlZU3AeQEjK7Vv8y/xbnbTHiIHhmWT3Irr2FXbgRMLLyZpzQEbp+OOwez
 2YccApaOd2u7EUE/FB5qdXjaK3mHzVQYTTRSIH+zuoqZ5kcmY7ZLriOwvyJ895XAhOtS
 FQP4Ciby4aCtdnAZjfVgTR8sEJ1GD2TdajG16QtZLzNKoy5+FO5z5Uyhhn2z4bGoH78P
 uBseawG7KbxRIrsXCVBWzX9ukTM9o6I2nxU2/AV7IoI+e4A2SpJMg7Cz8Xvna0lgIJan
 KYaNN2n2Z9WGcYXKzkCD50V9092sZPtVkyFAo/CKzKWZpjk/fvSWI562KwSeKXLO0gx2
 vPyg==
X-Gm-Message-State: AOAM533Yo33s8i9qTWY2s1vpfe4tVUi8KDDQFx6hCqgTpsX0nIySrr46
 03enXvLn6X8KnBxB4w8JQ9U5+yesvmQEyA==
X-Google-Smtp-Source: ABdhPJzF9UFXWRsFN5CWsZixbAKevgK49CUezlHg9n5VidT3uBo/ByepDmExJwK9q37nuSOZzAkiaw==
X-Received: by 2002:a63:d752:: with SMTP id w18mr9293504pgi.343.1614554628212; 
 Sun, 28 Feb 2021 15:23:48 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 29/50] target/i386: Add stub generator for helper_set_dr
Date: Sun, 28 Feb 2021 15:23:00 -0800
Message-Id: <20210228232321.322053-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

This removes an ifdef from the middle of disas_insn,
and ensures that the branch is not reachable.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index f0bc2df98c..42b96a2669 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -179,6 +179,19 @@ typedef struct DisasContext {
 #define REX_B(S)       0
 #endif
 
+/*
+ * Many sysemu-only helpers are not reachable for user-only.
+ * Define stub generators here, so that we need not either sprinkle
+ * ifdefs through the translator, nor provide the helper function.
+ */
+#define STUB_HELPER(NAME, ...) \
+    static inline void gen_helper_##NAME(__VA_ARGS__) \
+    { qemu_build_not_reached(); }
+
+#ifdef CONFIG_USER_ONLY
+STUB_HELPER(set_dr, TCGv_env env, TCGv_i32 reg, TCGv val)
+#endif
+
 static void gen_eob(DisasContext *s);
 static void gen_jr(DisasContext *s, TCGv dest);
 static void gen_jmp(DisasContext *s, target_ulong eip);
@@ -8069,7 +8082,6 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x121: /* mov reg, drN */
     case 0x123: /* mov drN, reg */
         if (check_cpl0(s)) {
-#ifndef CONFIG_USER_ONLY
             modrm = x86_ldub_code(env, s);
             /* Ignore the mod bits (assume (modrm&0xc0)==0xc0).
              * AMD documentation (24594.pdf) and testing of
@@ -8098,7 +8110,6 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 gen_helper_get_dr(s->T0, cpu_env, s->tmp2_i32);
                 gen_op_mov_reg_v(s, ot, rm, s->T0);
             }
-#endif /* !CONFIG_USER_ONLY */
         }
         break;
     case 0x106: /* clts */
-- 
2.25.1


