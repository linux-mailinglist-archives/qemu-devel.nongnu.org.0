Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C96CB380D7A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:41:15 +0200 (CEST)
Received: from localhost ([::1]:33900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZwA-0006wk-GE
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZWB-00066N-3M
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:23 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:33468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZW2-00077G-39
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:22 -0400
Received: by mail-qt1-x829.google.com with SMTP id 1so22445069qtb.0
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UaYAe5QyMjHdbZineA/jxEEnCCicUCmEv0WMWg8ZIk4=;
 b=Y1d9PQwUn6WVAqTzczGu7fhExFt5xb4zJeuXmLoFipm0awK6GWXn1huVyI8di7myOR
 Ys4W0W9WjkfWuHVqhDLCaT828Gwtogfo8NItQu8VaoOdEDLkUhKY68K6EBroDkQJpNAW
 Ng+mDgb9e197GXhpFZtvb5memmlEc9MN6S+OjOyxgZTVKXRsut6f8wGGOeV98cqz0KbA
 CQRpNBos4/JYiaKIs0SK7W0J0uc00sYibQScyVI8VsMOpGCQw0UJJYimFXcq6gCLG2xx
 Qjb573cqqcNEfEJsgnXJINSdlzsuL9ufY3Lm43SEbwa2EYSatwPjvaWpkxOZNKRQ6ETC
 X1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UaYAe5QyMjHdbZineA/jxEEnCCicUCmEv0WMWg8ZIk4=;
 b=fW/Riw06YUgvcveO/AfoIv8bISvU2rS9WR9tpM8xQGhhjO20N3Medx/BnTT8LJK349
 UXAjFvQhO4cIVEwll7uyfwQpDu7FcAedJ7luL6BmjC8oMmSGH17EeGYR+Dzhe7fuHOtg
 8eKV0b+uFoIVx41WqQOKV4nrka55WkyNQj5rEA/A+OpmC9yy9nDS6SuxsI6gKl7/F76c
 Tc3aFoDBbm3lVBYpRXCY+xNZV/auhivZRSGNgSYr0y2h/Jq5gkuty5fxkQaDi5LyRaRJ
 i5nBtyG3xLlUgVYlwANT1IWzQEUIISBjtBWHplaY/dLE0VD54Lx5Pl2zBm+k9uE6nLjr
 H7gQ==
X-Gm-Message-State: AOAM530Tiq8DqQ5YavKTjGjtxgARMYRL2HorPKgUkj9YKwzzHzPI5k3c
 xuJV4jMI+/SZBLApfsOTvoliMIa+bVvvRCde0Fo=
X-Google-Smtp-Source: ABdhPJxBrSAGgYvtkE7eMffU2PbMzmmnKylnFg1LGgcMX4PIFTmU8/7VXUQsokqDWT4PPLsU5zKkyQ==
X-Received: by 2002:a05:622a:183:: with SMTP id
 s3mr22700619qtw.115.1621005252528; 
 Fri, 14 May 2021 08:14:12 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:14:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 31/50] target/i386: Assert !GUEST for user-only
Date: Fri, 14 May 2021 10:13:23 -0500
Message-Id: <20210514151342.384376-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
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

For user-only, we do not need to check for VMM intercept.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index f58e0f480a..57ae515796 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -139,11 +139,13 @@ typedef struct DisasContext {
 #define CPL(S)    3
 #define IOPL(S)   0
 #define SVME(S)   false
+#define GUEST(S)  false
 #else
 #define PE(S)     (((S)->flags & HF_PE_MASK) != 0)
 #define CPL(S)    ((S)->cpl)
 #define IOPL(S)   ((S)->iopl)
 #define SVME(S)   (((S)->flags & HF_SVME_MASK) != 0)
+#define GUEST(S)  (((S)->flags & HF_GUEST_MASK) != 0)
 #endif
 #if defined(CONFIG_USER_ONLY) && defined(TARGET_X86_64)
 #define VM86(S)   false
@@ -677,7 +679,7 @@ static void gen_check_io(DisasContext *s, MemOp ot, target_ulong cur_eip,
             tcg_abort();
         }
     }
-    if(s->flags & HF_GUEST_MASK) {
+    if (GUEST(s)) {
         gen_update_cc_op(s);
         gen_jmp_im(s, cur_eip);
         svm_flags |= (1 << (4 + ot));
@@ -2417,8 +2419,9 @@ gen_svm_check_intercept_param(DisasContext *s, target_ulong pc_start,
                               uint32_t type, uint64_t param)
 {
     /* no SVM activated; fast case */
-    if (likely(!(s->flags & HF_GUEST_MASK)))
+    if (likely(!GUEST(s))) {
         return;
+    }
     gen_update_cc_op(s);
     gen_jmp_im(s, pc_start - s->cs_base);
     gen_helper_svm_check_intercept_param(cpu_env, tcg_const_i32(type),
@@ -8517,6 +8520,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     g_assert(LMA(dc) == ((flags & HF_LMA_MASK) != 0));
     g_assert(ADDSEG(dc) == ((flags & HF_ADDSEG_MASK) != 0));
     g_assert(SVME(dc) == ((flags & HF_SVME_MASK) != 0));
+    g_assert(GUEST(dc) == ((flags & HF_GUEST_MASK) != 0));
 
     dc->cc_op = CC_OP_DYNAMIC;
     dc->cc_op_dirty = false;
-- 
2.25.1


