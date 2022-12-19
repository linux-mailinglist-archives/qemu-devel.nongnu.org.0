Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93771651554
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 23:09:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7OKL-0008SI-51; Mon, 19 Dec 2022 17:09:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7OKI-0008S9-0e
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 17:09:38 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7OKG-0003vc-BJ
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 17:09:37 -0500
Received: by mail-ed1-x52f.google.com with SMTP id m19so14937599edj.8
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 14:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uzcpDEzkh6Xc0aI0JtsxV0tnoQlgrshM331KIKOT9f4=;
 b=qWiA5fkeAWa35c07MGB75nTaU7yS+amCMjbhy27GSBOCDWQV+g80sc9jm2GNkMXOu0
 3MFSzFYuFCo2HSShqopp1ZP92D0w9dRZdtOhXUyKfqHnPwR0maMS7HNbbSsnzTqrp2uY
 UmPRG1rRdY30hWZqRnfOdjdQNxpWyQ4ahYidDZsg53dCbd57srJPrP4CDnf1hCDbSy7M
 dPSTF/qQb6KECtkTXqNSqKemzNAtXjZsrm8EY80G+5QgjT4YQMpNSXvde2RelXytpRG3
 +uX+lxuTM8SFdLONicXaM7nIgUsvV9X5GTwWeRfjq7XTIFM5+i8JNXEAL2evo9lG/B/E
 BnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uzcpDEzkh6Xc0aI0JtsxV0tnoQlgrshM331KIKOT9f4=;
 b=FGFumo4g3nP70Q1GnoLOoOnrv23MeUAb1P4AqsIB7eO5RU7cCIIJkGoa4ZnRyrxM47
 A8M0aCMRCLFduww4IMCeV6rC0Tvpaka2lOBVpiDpkF/QCAaBTmn7YxgT8n6moKXLQ/ez
 HCdJ0Wl2Z3XmMY4j+nAMczhUOZS1gc2JYleSTvctmtM3qhJw18Y+qHJT72aM/KJeKO4U
 hWot70Wj7dD5g5u+ARS+Rr5xOEgwrgw0OH7LJ6XRwEvRlKeC3AB2QY0wVkO3wV6I2SYF
 BxYM5xnuCSdT8TfkwR6xpCASrDiXle1VTfQSuEqP2LKWEnxPX01E7wleUNn0wAfVjJMi
 xs2A==
X-Gm-Message-State: ANoB5pn3gxvCXFrIMh8YVBVC/VJ+SscLmZu/VGG8yzl2fk100x0/U84t
 0cpny4FVfEl5A0EfPGuH25yYLPAEUcksokUgjfQ=
X-Google-Smtp-Source: AA0mqf6Ie63dQDP1vh6/Ht58x+1qdSke2gfC8vqs+faYpOQNkAbjYTI8sAdyRE9A4Lai6KyyLnx0OA==
X-Received: by 2002:a05:6402:320f:b0:46c:ec6f:43d7 with SMTP id
 g15-20020a056402320f00b0046cec6f43d7mr51440021eda.19.1671487774282; 
 Mon, 19 Dec 2022 14:09:34 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n19-20020aa7c793000000b0045cf4f72b04sm4855634eds.94.2022.12.19.14.09.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Dec 2022 14:09:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 04a/27] tcg: Massage process_op_defs()
Date: Mon, 19 Dec 2022 23:09:23 +0100
Message-Id: <20221219220925.79218-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219220925.79218-1-philmd@linaro.org>
References: <20221213212541.1820840-5-richard.henderson@linaro.org>
 <20221219220925.79218-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52f.google.com
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

In preparation of introducing paired registers,
massage a bit process_op_defs()'s switch case.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[PMD: Split from bigger patch, 1/3]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
2.38.1


