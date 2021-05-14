Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D62380D6B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:38:17 +0200 (CEST)
Received: from localhost ([::1]:53820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZtH-00013G-S2
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZW8-00062s-O0
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:21 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:33397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZW3-00077K-Fz
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:20 -0400
Received: by mail-qk1-x734.google.com with SMTP id f29so16773996qka.0
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ur+FEBIPEpzkrS9ckyRA/1MIuAhPbqvvO8o/uVK389I=;
 b=wsErnXgRO6CtFr0Mho/xPAqnHZPTG0czsUZI4zr9GL0Uwp6Og33b9aG/V+Uq4BfO3H
 t1PrpO1MCXZoSqYIPAIZT5ZYqSRxVqM7nf2KDGcAogICSF2mPRlh6FxOenK/MqfqKf0n
 EPCHTru/FJKeeprfg+vOcIB7eAzBH57g5bSCXO0CYUAEr2D1qcQUag3+DGKRrWiv3qn1
 +sxYO9fbFxNAXki/hEAukHD3VT9gKy+xpUjdH/n/78D2TE+OoUrgi49YbXd/vT/ZhkE3
 2ADDD6JgozsvNCLFH2+tLrb0ZgMYYOfRwmArameHzd6ujlHEi0jI4jF7fqemiF2P4SF3
 j9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ur+FEBIPEpzkrS9ckyRA/1MIuAhPbqvvO8o/uVK389I=;
 b=MmEotjF/27eDJ5+g108+CmK5Cd1sfeSzVYNLou3pvXvA1TFTU7nLklxhQH8G5Qi82U
 1NYeOic1ewO6WqV/1ek6OCJQEPBaN76+aeaxHPYlb9B46LZoxNd13iaWNwQR5ejRVACg
 KD6Y3FHV9D3sHfIVHfcrv7foCvW0fa80gfGcXDC9zF0Zk2CDwSTU4AFBU2+aVW7b60/9
 WTupCTl2cXh5il0X7sGbly/1D2tbLiEmJ9QfIQpUMOHRjwVDxrjG56uBvr3IW1fnSTaS
 +tMaiip8vHl9osfr2emb6kn7wIwFeufs6nhM6sbjMXOT+Cv/D3YVm9/dejWYyW/iicqi
 P96Q==
X-Gm-Message-State: AOAM531xPt842BlKppDL1FAWJCYBKmKgw/H5Xw1Kn5YDHkVpUIrJAe2y
 cZQFKYkM0B9ZWG05FYkOqk4NZjkhhLExuaiThCw=
X-Google-Smtp-Source: ABdhPJyzHRDM9iFc4hFacSSPsxmu5MX79Mbd0/45YaKA9xqS040h5gz/7dl6l/TwsTYoBqK02PxW1Q==
X-Received: by 2002:a37:2714:: with SMTP id n20mr42912160qkn.434.1621005253474; 
 Fri, 14 May 2021 08:14:13 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:14:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 32/50] target/i386: Implement skinit in translate.c
Date: Fri, 14 May 2021 10:13:24 -0500
Message-Id: <20210514151342.384376-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
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

Our sysemu implementation is a stub.  We can already intercept
instructions for vmexit, and raising #UD is trivial.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
index 57ae515796..aeb72cd846 100644
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


