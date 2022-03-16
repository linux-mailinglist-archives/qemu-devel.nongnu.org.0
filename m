Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9EB4DAA27
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 07:00:48 +0100 (CET)
Received: from localhost ([::1]:52306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUMiF-0004yI-QE
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 02:00:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgI-0002Db-TS
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:47 -0400
Received: from [2607:f8b0:4864:20::102d] (port=51790
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgH-0006RI-9A
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:46 -0400
Received: by mail-pj1-x102d.google.com with SMTP id gb19so1328429pjb.1
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 22:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z50S1ANY+qogNRBEcXvOj+j9JDtWXU4rP5QfdInSzso=;
 b=ooEevScCNJdN2KNP0mFKh5SumxCiRh1CW/j8c9u4fst18QSJU+jwt0Tf0ToKiWeaKg
 t+neeTQba78HSZ3h+WYfVFkdrBftEose8kxQUEMUXdBHMD/SfhZq3ncjV0LJvZiZUdSd
 uwAvc/lVSB2RRYsMMP2JJ5TNTBNUH272Ls+4c9NMRIZp0VscTzgArN04nF5cROfIswNO
 a2UlccKIEk3uNlyi8n5Ex+PjnoUZpttpZD18/XtnMrAPb0/Cms7oMuzSzMbiZ9pdJpXJ
 eqMlVBmspYNX7Rjssqv2O43cIHevOuXGSMavYK8Z8zah2mpflmOiKPlux/AaquizYhXn
 U/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z50S1ANY+qogNRBEcXvOj+j9JDtWXU4rP5QfdInSzso=;
 b=qrs210f/0/3kboUOcxnTuwSCXhrYny7P9rO2hwCbo/IrLmgOk7yFCGC4EkbLiIevnF
 7VKrRe4NbGKanomwpsaJj6D0tv7/1vcCKSYv2Xlzlx7S2Gz5hmjFfWylLQgzbZWCaHAg
 vef6AoegoQGIs8Ea2fYPrS+giiId8VgqvTJengkJ7RQhUqciBxKcNhWI5d5f4QPykZ8U
 BNOUpW/tTtmfb0hPbwVUvIhvIbKdfWbPiwISQaWSFRNckYSHBxqG+xpA+4IXMp2xkf1Q
 eIKNbGW9v6kWUcBzMJfJvArNwidhlhF0YJ+NOm0AMfHDwtAwQW9XaNcHokqb1lH4Nfr7
 borQ==
X-Gm-Message-State: AOAM531vVToauoNxIplHDXq36C8KgDfXFBR9fyKu27Dg4yEDtbRy5Hgs
 szybxjrpriN2rswSVIYWCNrcOJxqBFCYbg==
X-Google-Smtp-Source: ABdhPJy2cN0l+8kJUN7RB131xl6N1Nv56SQ7YG6rv4amtMprX/vtArVEww/ZvxKyc+XjAx6Om+d0RQ==
X-Received: by 2002:a17:903:2341:b0:150:2371:ee59 with SMTP id
 c1-20020a170903234100b001502371ee59mr31212199plh.57.1647410324033; 
 Tue, 15 Mar 2022 22:58:44 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i24-20020a056a00225800b004f6edabc9f4sm1236290pfu.72.2022.03.15.22.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 22:58:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/17] target/m68k: Switch over exception type in
 m68k_interrupt_all
Date: Tue, 15 Mar 2022 22:58:25 -0700
Message-Id: <20220316055840.727571-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316055840.727571-1-richard.henderson@linaro.org>
References: <20220316055840.727571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace an if ladder with a switch for clarity.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/op_helper.c | 49 +++++++++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index d30f988ae0..2b94a6ec84 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -333,7 +333,8 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         sp &= ~1;
     }
 
-    if (cs->exception_index == EXCP_ACCESS) {
+    switch (cs->exception_index) {
+    case EXCP_ACCESS:
         if (env->mmu.fault) {
             cpu_abort(cs, "DOUBLE MMU FAULT\n");
         }
@@ -391,29 +392,39 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
                      "ssw:  %08x ea:   %08x sfc:  %d    dfc: %d\n",
                      env->mmu.ssw, env->mmu.ar, env->sfc, env->dfc);
         }
-    } else if (cs->exception_index == EXCP_ADDRESS) {
+        break;
+
+    case EXCP_ADDRESS:
         do_stack_frame(env, &sp, 2, oldsr, 0, retaddr);
-    } else if (cs->exception_index == EXCP_ILLEGAL ||
-               cs->exception_index == EXCP_DIV0 ||
-               cs->exception_index == EXCP_CHK ||
-               cs->exception_index == EXCP_TRAPCC ||
-               cs->exception_index == EXCP_TRACE) {
+        break;
+
+    case EXCP_ILLEGAL:
+    case EXCP_DIV0:
+    case EXCP_CHK:
+    case EXCP_TRAPCC:
+    case EXCP_TRACE:
         /* FIXME: addr is not only env->pc */
         do_stack_frame(env, &sp, 2, oldsr, env->pc, retaddr);
-    } else if (is_hw && oldsr & SR_M &&
-               cs->exception_index >= EXCP_SPURIOUS &&
-               cs->exception_index <= EXCP_INT_LEVEL_7) {
-        do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
-        oldsr = sr;
-        env->aregs[7] = sp;
-        cpu_m68k_set_sr(env, sr &= ~SR_M);
-        sp = env->aregs[7];
-        if (!m68k_feature(env, M68K_FEATURE_UNALIGNED_DATA)) {
-            sp &= ~1;
+        break;
+
+    case EXCP_SPURIOUS ... EXCP_INT_LEVEL_7:
+        if (is_hw && oldsr & SR_M) {
+            do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
+            oldsr = sr;
+            env->aregs[7] = sp;
+            cpu_m68k_set_sr(env, sr &= ~SR_M);
+            sp = env->aregs[7];
+            if (!m68k_feature(env, M68K_FEATURE_UNALIGNED_DATA)) {
+                sp &= ~1;
+            }
+            do_stack_frame(env, &sp, 1, oldsr, 0, retaddr);
+            break;
         }
-        do_stack_frame(env, &sp, 1, oldsr, 0, retaddr);
-    } else {
+        /* fall through */
+
+    default:
         do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
+        break;
     }
 
     env->aregs[7] = sp;
-- 
2.25.1


