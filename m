Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D261A3895D4
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:51:14 +0200 (CEST)
Received: from localhost ([::1]:34544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRHl-0000qP-Rq
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQym-0004JH-Vp
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:37 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:38705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyb-0005mg-47
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:36 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 i14-20020a9d624e0000b029033683c71999so1434475otk.5
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oHyJNDPwLv7CDpqATFVKQ26htkoObORPlVS9sJxQt9M=;
 b=eCJZBmBaTf45ebK9uSFdapKDqaTUgHY6JuY3IVmJK6/5RXPISNvg8iO1PFmSOVSGJV
 fzxjfQe3GQpmmra00VjRNhe1TCMyTZ+Pr8VP+0oAsPK74FsJQhEiiEgyrsxUoxs5t+f1
 +7IUZWthVlvJK3rD4HgOtJsr7KCmUbuefA/CEXzeT30hvxZS1wkZ/8VT4OQp3Fa2G3xx
 pR36T9Gdv8utdZJYjwbYmRPWGH7IwfvRvQpfBoB56kd19CN/LOWPYveVCBPp0OQCvv7l
 3SSGkQfIROs/l9di3i+vRyQ0jo3dBuyHt5eU4hj2oI9czFiCJAPmMYykzNwiimYHt7HB
 AIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oHyJNDPwLv7CDpqATFVKQ26htkoObORPlVS9sJxQt9M=;
 b=WpSG8XjNuf+3DrD2Bk6feKS94eibRmk/P598I6JEZ2C4JiHO2rMou7DfQSOA31MKUE
 RpfkesQlZ24/Xupg2kNvRz0H/Ewn/id/DkBkfShmBvPf8l1pw38SKYhmdv/lm2waKF3W
 z4XDXVBwBKRfev7wCrmUfNJ/DQpqJFaBKBp5Da+OPtJf7WbyXeKKWwv9HWYA5VYa2jhV
 y3j3pyC44psQHbNO2A1DpmDOFsxnyM3ROtesr1hM92V295Yg8XwJxQyFKNoucA1pCFp1
 2ZMgN+Ng0irsoSOc2Yz8RJE89/jRwwfUnNWzJsVrsuE2cY+zwnRxhTWOV7EyWNsFLxoP
 +7oQ==
X-Gm-Message-State: AOAM5302bR/2QAJKqEIO9+TzEWjIAP9jheknh0+HoQMJ6AmGS1ivLdXQ
 KjsGPx0fmkIA4qTd7nuIV3Oui5/AePVg157W
X-Google-Smtp-Source: ABdhPJx5bC/qCjCn9wouLuzzt2FDsU+xN/f1JBcqDt+ANktIIBUOW9Z9esLG+vW0oK7qM6OluOrDKw==
X-Received: by 2002:a9d:a37:: with SMTP id 52mr687003otg.280.1621449083752;
 Wed, 19 May 2021 11:31:23 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/50] target/i386: Implement skinit in translate.c
Date: Wed, 19 May 2021 13:30:32 -0500
Message-Id: <20210519183050.875453-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
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

Our sysemu implementation is a stub.  We can already intercept
instructions for vmexit, and raising #UD is trivial.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-33-richard.henderson@linaro.org>
---
 target/i386/helper.h                | 1 -
 target/i386/tcg/sysemu/svm_helper.c | 7 -------
 target/i386/tcg/translate.c         | 7 +++----
 target/i386/tcg/user/svm_stubs.c    | 4 ----
 4 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index 095520f81f..7a09efd55b 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -117,7 +117,6 @@ DEF_HELPER_2(vmload, void, env, int)
 DEF_HELPER_2(vmsave, void, env, int)
 DEF_HELPER_1(stgi, void, env)
 DEF_HELPER_1(clgi, void, env)
-DEF_HELPER_1(skinit, void, env)
 DEF_HELPER_2(invlpga, void, env, int)
 
 /* x86 FPU */
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index c4e8e717a9..79c73d67af 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -412,13 +412,6 @@ void helper_clgi(CPUX86State *env)
     env->hflags2 &= ~HF2_GIF_MASK;
 }
 
-void helper_skinit(CPUX86State *env)
-{
-    cpu_svm_check_intercept_param(env, SVM_EXIT_SKINIT, 0, GETPC());
-    /* XXX: not implemented */
-    raise_exception(env, EXCP06_ILLOP);
-}
-
 void helper_invlpga(CPUX86State *env, int aflag)
 {
     X86CPU *cpu = env_archcpu(env);
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 200d205d7e..f7f84f79fe 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -7578,10 +7578,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 || !PE(s)) {
                 goto illegal_op;
             }
-            gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
-            gen_helper_skinit(cpu_env);
-            break;
+            gen_svm_check_intercept(s, pc_start, SVM_EXIT_SKINIT);
+            /* If not intercepted, not implemented -- raise #UD. */
+            goto illegal_op;
 
         case 0xdf: /* INVLPGA */
             if (!SVME(s) || !PE(s)) {
diff --git a/target/i386/tcg/user/svm_stubs.c b/target/i386/tcg/user/svm_stubs.c
index 97528b56ad..63b37f0de6 100644
--- a/target/i386/tcg/user/svm_stubs.c
+++ b/target/i386/tcg/user/svm_stubs.c
@@ -46,10 +46,6 @@ void helper_clgi(CPUX86State *env)
 {
 }
 
-void helper_skinit(CPUX86State *env)
-{
-}
-
 void helper_invlpga(CPUX86State *env, int aflag)
 {
 }
-- 
2.25.1


