Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F63327544
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:38:17 +0100 (CET)
Received: from localhost ([::1]:34930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVdg-0004d1-2b
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:38:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPu-0005nG-Bc
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:02 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:46258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPk-0007lz-22
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:02 -0500
Received: by mail-pg1-x52a.google.com with SMTP id h4so10317287pgf.13
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3nFp54OBUJIrmpxOTOb02gXaUeZK7B8DrZUFxLsO4wY=;
 b=ndpYWws2Gl34I+wC+/jeufSTd8ERkOwtkotvW3i3XySSHOmASLZzOKTaanGdPH0fLr
 sMqgZSHw1EF2HdDAeksKQXpcmYtDmIf4379qPkLjiYfZRQog6tCroKpMdNsNJ2bDH7zG
 QYe7ag4PsyNVa4pcMoKKjo8kRqJVOYedF1wbt08jawgmSkqJQp2eHp7yBFjl2HS7wERf
 LFCsDseUMYdaci/Iwm1cCPpEahMRNH5vMsWrTRysjclag60zKUO87t3kkooMGuUcnMNO
 KMn2sZUwxRkgyG/NctV/uVaWe/2b41L0dehf91sxXwkPwkd+Key9rFTOJCIZ2Z4fW4+R
 cx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3nFp54OBUJIrmpxOTOb02gXaUeZK7B8DrZUFxLsO4wY=;
 b=KMg/Q41pc1Zqp1orvir7DFNu5o833kM2vkE/tddAn3/Z8gaEBgz37kDGkk3N75up80
 Ay4R4BnFC3bR1B1ZfnojG2g+obt62voIbtFCTlagE48CaInZmF6v6tLFg2Kzk0WX7zFp
 T5JGxJpFcnNLbvJETgtVDMx9y7jMjonFgvYrhcDO6hxRUS2vWf2guKD3lg3B3B9IFQTX
 EyL70bccuwyl59ePXrMS0vgE6SEtkqbRbLN4azAzhMg09V1+R06VeUqnSLqYAjV5b7P1
 XDD4jUqW49L/tkyXNAh0RY14KmtWAhKnLnmMtn2S9sW4DYZ/hQRMyOZ5MESWdjOZCVRj
 nK7A==
X-Gm-Message-State: AOAM530XBzlVR313Q6p8Qm3V6i0n++hc5mZUALC+4B1OF13UcG1VQ5jS
 wPlFGQbB4+8tR7Ouk4iWMsEJ0DV6fVY8aA==
X-Google-Smtp-Source: ABdhPJwa5vLu+azb8ljre/qoUHhESKPVBEqaOXKBGN7W75IdFSZiirNm8Z3G8aH/eWv3utAdT6kWRA==
X-Received: by 2002:a05:6a00:22d1:b029:1b4:9bb5:724c with SMTP id
 f17-20020a056a0022d1b02901b49bb5724cmr12644812pfj.63.1614554630113; 
 Sun, 28 Feb 2021 15:23:50 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 32/50] target/i386: Implement skinit in translate.c
Date: Sun, 28 Feb 2021 15:23:03 -0800
Message-Id: <20210228232321.322053-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
index 5b9c6f18be..ca5a781a7e 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -423,13 +423,6 @@ void helper_clgi(CPUX86State *env)
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
index cd376a2c07..92e85e1872 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -7572,10 +7572,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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


