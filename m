Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DE53895BF
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:48:00 +0200 (CEST)
Received: from localhost ([::1]:51374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljREd-0001hA-5N
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyn-0004LL-Ir
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:37 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:34695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyZ-0005mP-VI
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:37 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 u25-20020a0568302319b02902ac3d54c25eso12656902ote.1
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1DqtU0WV8QcSF4+X7m6wigiX0PReSyvreleY4X8ijYI=;
 b=WWxnrjOYRyMGRp7PhTvkVpu3miWRLibTfUgyUV/rhQT+M8wEdZ497h7RoZ8xLo5DQu
 3hqlKE5fDn0r/ZnlplfgvkdPcudGWeb2CIqzT6zzsH8AvxdY5f2yAazWcj6Q2q7fSRGz
 U6Y50UCvXyU/hovCVnwZePZ/ZsBOW0M7BUzY0WO9x2P0mf8qQYPmlYhF6PqPvzQJsZrA
 fWfpKuJhjaNwaCrUXLvh6lmXp5viVA80H1oqDlYjcB1TvimSU2u4S0IbJys6Ntd1s3LK
 ymO895eWwaRgeBX+pEbOhoKVlEZqHuPWs+hGO4jqeLQef0t5kjPAXp4z1+T2BC8i3O7F
 JBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1DqtU0WV8QcSF4+X7m6wigiX0PReSyvreleY4X8ijYI=;
 b=bniRptcmIHVhW38PelHgrF/Fj2z/UTa+kMDg54F3BR6hKKdbDko42lz9G/Cnabfz+g
 8CQNvIiBnRtWmUamv/gCqY+UAo0FfjcBkatRatNkfcHkM9+uKaZ2eOFaVgG+NH7WwAc4
 W85puVA2VgPCNgC/xM00EUP6+M+phmnIrP9+1t973ZWh6dDTzZ5IFRlMWioMZzecVUPz
 or41odxHOph75n/q2vqaex6a4HSUp+HqmY79YgMGWVFNpcdQHRVXZmfKdkd2hOkgIdgi
 S0tVqktqVvk2BGU6VEm5RyjlREZZnktAjsmHBgMvm2jWAoNW1Jt7cV45q8r1JE84gsuN
 p0+w==
X-Gm-Message-State: AOAM533Ric4rrIn1wTRbJMKel/Bv7y3mGFLi+3FqyFfaOnrginUjhNtG
 Jt+It3eArxxvSHT2Eosur2DJQA47Cx6AyVdi
X-Google-Smtp-Source: ABdhPJxXTPZ2hdcdb/9ULLPWxQsxW/blLfo2P7DZ+uPhVW6FtDeEGUSMAoZv61yUWtFzguLPQLJEAg==
X-Received: by 2002:a9d:5a7:: with SMTP id 36mr639756otd.321.1621449082775;
 Wed, 19 May 2021 11:31:22 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/50] target/i386: Assert !GUEST for user-only
Date: Wed, 19 May 2021 13:30:31 -0500
Message-Id: <20210519183050.875453-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
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

For user-only, we do not need to check for VMM intercept.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-32-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 235caa247b..200d205d7e 100644
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


