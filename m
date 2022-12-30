Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3EA6593C5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:18:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2rH-00034r-Ki; Thu, 29 Dec 2022 19:02:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rD-00033H-2g
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:43 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rB-0002i3-1l
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:42 -0500
Received: by mail-pl1-x62f.google.com with SMTP id y19so1329045plb.2
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=82jdObgJZFzER9GFo6NlXKKdjvOyLg4xyhd1mr3KndA=;
 b=XJf+VZAOLyuNddIwf8h9zj6PsowiPHklT03oai+bQGH6QKYDb1AXDCijInv/bSLQPE
 L+miI5baeGHa0XlIgX7sF6ub+gC59hG0z6Ia3hsIbK80hd2F7mVISMSlglJd+F2IE4X0
 b556TvFRNsNZdNgqcqOhyOLCMF0ZyYVhJ6gRfT6CrfBO+qHcS48n0iVQYYRo6rgyNDgR
 Czg8fCE/rV7cUmtYdD+QA4duwMCm1Eyoc+1HLLbZBHKTJSGh/olYm5aP7SQ5U3mYMC3F
 QoIzKDjjeWwheoFrGPOfCsC47bB2dmJ3RhOykCRbvgNxKpdzu6NyIOPwRjJPcCeIfMiS
 PnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=82jdObgJZFzER9GFo6NlXKKdjvOyLg4xyhd1mr3KndA=;
 b=ONT71OY9h3S1lLAqJTiMrIQ3AHshJlJgjk1mz3pRbcKocVa9McTnR9NrB/IfpCtlNJ
 7R70VSEwZjpI9ZfC0Necb0zSwaKPjnf9cxJ0HC7ISX2S4nKb0U1fL+7ocAdQCZ2/iWTC
 2mvPEAEFEs/z7MTXIHejWE5TWR0QPo4XQb9++z+FFgYZrBTQ4neAhyMISwlIQVFuzaVK
 A34rjF0rYjuJ1285F49GBbtDxiGsF2rdKz+Adbwmd/1zFXh0u80XcjakMhkw3k79UsHp
 7LmGE6hoveHALbZYbwz0sjgTm7uvxEwXHuIBjeSREpS8hg7tHiItdiYMAaOjojYtFauR
 4H+g==
X-Gm-Message-State: AFqh2kr5d0XPJzpHnmllQ41qUIAwcWOGE+MOw2PGMcR1nxb6nIzUjIDa
 XCIWxDp0kmpc8h5MYevBmB12YIrj3FVy8q9h
X-Google-Smtp-Source: AMrXdXt+8Y8EHNYN0yBkirYELftJngJJqNv/uKFsft0DRgIjjzb094dzSEcFyOl0XAYnOCuhuFXemg==
X-Received: by 2002:a17:902:ebca:b0:191:117a:414f with SMTP id
 p10-20020a170902ebca00b00191117a414fmr36301761plg.27.1672358559438; 
 Thu, 29 Dec 2022 16:02:39 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 18/47] tcg: Massage process_op_defs()
Date: Thu, 29 Dec 2022 16:01:52 -0800
Message-Id: <20221230000221.2764875-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

In preparation of introducing paired registers,
massage a bit process_op_defs()'s switch case.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[PMD: Split from bigger patch, 1/3]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221219220925.79218-2-philmd@linaro.org>
---
 tcg/tcg.c | 61 +++++++++++++++++++++++++++++++------------------------
 1 file changed, 34 insertions(+), 27 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index c330d114bc..92141bd79a 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2012,7 +2012,7 @@ static void process_op_defs(TCGContext *s)
     for (op = 0; op < NB_OPS; op++) {
         TCGOpDef *def = &tcg_op_defs[op];
         const TCGTargetOpDef *tdefs;
-        int i, nb_args;
+        int i, o, nb_args;
 
         if (def->flags & TCG_OPF_NOT_PRESENT) {
             continue;
@@ -2034,53 +2034,60 @@ static void process_op_defs(TCGContext *s)
 
         for (i = 0; i < nb_args; i++) {
             const char *ct_str = tdefs->args_ct_str[i];
+            bool input_p = i >= def->nb_oargs;
+
             /* Incomplete TCGTargetOpDef entry. */
             tcg_debug_assert(ct_str != NULL);
 
-            while (*ct_str != '\0') {
-                switch(*ct_str) {
-                case '0' ... '9':
-                    {
-                        int oarg = *ct_str - '0';
-                        tcg_debug_assert(ct_str == tdefs->args_ct_str[i]);
-                        tcg_debug_assert(oarg < def->nb_oargs);
-                        tcg_debug_assert(def->args_ct[oarg].regs != 0);
-                        def->args_ct[i] = def->args_ct[oarg];
-                        /* The output sets oalias.  */
-                        def->args_ct[oarg].oalias = true;
-                        def->args_ct[oarg].alias_index = i;
-                        /* The input sets ialias. */
-                        def->args_ct[i].ialias = true;
-                        def->args_ct[i].alias_index = oarg;
-                    }
-                    ct_str++;
-                    break;
-                case '&':
-                    def->args_ct[i].newreg = true;
-                    ct_str++;
-                    break;
+            switch (*ct_str) {
+            case '0' ... '9':
+                o = *ct_str - '0';
+                tcg_debug_assert(input_p);
+                tcg_debug_assert(o < def->nb_oargs);
+                tcg_debug_assert(def->args_ct[o].regs != 0);
+                tcg_debug_assert(!def->args_ct[o].oalias);
+                def->args_ct[i] = def->args_ct[o];
+                /* The output sets oalias.  */
+                def->args_ct[o].oalias = 1;
+                def->args_ct[o].alias_index = i;
+                /* The input sets ialias. */
+                def->args_ct[i].ialias = 1;
+                def->args_ct[i].alias_index = o;
+                tcg_debug_assert(ct_str[1] == '\0');
+                continue;
+
+            case '&':
+                tcg_debug_assert(!input_p);
+                def->args_ct[i].newreg = true;
+                ct_str++;
+                break;
+            }
+
+            do {
+                switch (*ct_str) {
                 case 'i':
                     def->args_ct[i].ct |= TCG_CT_CONST;
-                    ct_str++;
                     break;
 
                 /* Include all of the target-specific constraints. */
 
 #undef CONST
 #define CONST(CASE, MASK) \
-    case CASE: def->args_ct[i].ct |= MASK; ct_str++; break;
+    case CASE: def->args_ct[i].ct |= MASK; break;
 #define REGS(CASE, MASK) \
-    case CASE: def->args_ct[i].regs |= MASK; ct_str++; break;
+    case CASE: def->args_ct[i].regs |= MASK; break;
 
 #include "tcg-target-con-str.h"
 
 #undef REGS
 #undef CONST
                 default:
+                case '0' ... '9':
+                case '&':
                     /* Typo in TCGTargetOpDef constraint. */
                     g_assert_not_reached();
                 }
-            }
+            } while (*++ct_str != '\0');
         }
 
         /* TCGTargetOpDef entry with too much information? */
-- 
2.34.1


