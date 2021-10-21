Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B046D436C8D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:17:51 +0200 (CEST)
Received: from localhost ([::1]:38926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfRe-00063t-Py
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfG0-0007Lr-V4
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:05:50 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:43683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfFz-0004Ai-CJ
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:05:48 -0400
Received: by mail-pf1-x430.google.com with SMTP id 187so1740137pfc.10
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WL784dDelb2n11jVqBh0M/kFnuIJJZnBgr5d6GB5NwI=;
 b=o+4VwUGNeGhwSx8oa9IEgXhF+l2DIrUA0F3msQm23RheJUISRjECD0DIiqppMSItvX
 d431NUEvyGitkCifYXBdbofLv7SVAbmi9h7Cb+cvZrzJmkQXoZIhYSn7e6FdLoOYa6PK
 4Vvx+pP3wMGJU+D6NI2I3oMGRvg/ba0JbZfgKQ2IPorFm8LKpcZ7OIc/6fDaEYgVW3MR
 1pvKqmD7EiZb14a/AU1m3QVheUP8PdjWYk+vqdNg5wCrhIEHwp19NcOoYHWijbnzJQ9B
 NMCEVbDnfKv5+XFPzCqJgC9OHFgF99m2k0ddyaUo0GeChi2eMFO1pYjDAeuub1vI8ypm
 4R0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WL784dDelb2n11jVqBh0M/kFnuIJJZnBgr5d6GB5NwI=;
 b=QOVgM4GaFnv9DVB/TDlAaCFRdlNSBQXWKBBYJUzPt29Ik0ODPCtyCVv/pRwrAFiHFw
 VIyFwFPrC45cjtR/tFr7hrJj9k8vQc6Im2Or65in+yaXQyJuERgQiH/eXC8HBF7J/mBb
 oNaCPTlAWzUtNFz5parmxyp6eaxZO+AjrHdQAroezoS3BF07SPW6+sguqeC3kP6iB54W
 fEvsRh5EE8KdRq189bLHiX/ymSwjHA7b9k2m+UGHtNVDQHLIL7G1q/IOBBITRpa2JUoE
 fLft4Hrw5tDhiIFbDmZ7WL58njt3CSvnDdesww1UvGHIT0bcxfABC+n6qjlDBMLZbjQ2
 5+Qg==
X-Gm-Message-State: AOAM531d/OoJIaMHFBnDBvN62l6ff7ILWb1ClyVIKIMjaVc/8VHIPxEZ
 HbNGT1GflXZlxMRLfeA6EoPHopeDJqi19Q==
X-Google-Smtp-Source: ABdhPJzZ5IemMC6ktnrhAYR62vqdfbgQ90MrZEdvltwpnEzdFUgeV3kWIpICoT3eikQJ198GTe306Q==
X-Received: by 2002:aa7:9ec6:0:b0:44d:6650:c1ff with SMTP id
 r6-20020aa79ec6000000b0044d6650c1ffmr8165414pfq.15.1634850345046; 
 Thu, 21 Oct 2021 14:05:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:05:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/48] tcg/optimize: Split out init_arguments
Date: Thu, 21 Oct 2021 14:04:57 -0700
Message-Id: <20211021210539.825582-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There was no real reason for calls to have separate code here.
Unify init for calls vs non-calls using the call path, which
handles TCG_CALL_DUMMY_ARG.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index b875d76354..019c5aaf81 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -128,11 +128,6 @@ static void init_ts_info(OptContext *ctx, TCGTemp *ts)
     }
 }
 
-static void init_arg_info(OptContext *ctx, TCGArg arg)
-{
-    init_ts_info(ctx, arg_temp(arg));
-}
-
 static TCGTemp *find_better_copy(TCGContext *s, TCGTemp *ts)
 {
     TCGTemp *i, *g, *l;
@@ -606,6 +601,16 @@ static bool swap_commutative2(TCGArg *p1, TCGArg *p2)
     return false;
 }
 
+static void init_arguments(OptContext *ctx, TCGOp *op, int nb_args)
+{
+    for (int i = 0; i < nb_args; i++) {
+        TCGTemp *ts = arg_temp(op->args[i]);
+        if (ts) {
+            init_ts_info(ctx, ts);
+        }
+    }
+}
+
 /* Propagate constants and copies, fold constant expressions. */
 void tcg_optimize(TCGContext *s)
 {
@@ -636,19 +641,11 @@ void tcg_optimize(TCGContext *s)
         if (opc == INDEX_op_call) {
             nb_oargs = TCGOP_CALLO(op);
             nb_iargs = TCGOP_CALLI(op);
-            for (i = 0; i < nb_oargs + nb_iargs; i++) {
-                TCGTemp *ts = arg_temp(op->args[i]);
-                if (ts) {
-                    init_ts_info(&ctx, ts);
-                }
-            }
         } else {
             nb_oargs = def->nb_oargs;
             nb_iargs = def->nb_iargs;
-            for (i = 0; i < nb_oargs + nb_iargs; i++) {
-                init_arg_info(&ctx, op->args[i]);
-            }
         }
+        init_arguments(&ctx, op, nb_oargs + nb_iargs);
 
         /* Do copy propagation */
         for (i = nb_oargs; i < nb_oargs + nb_iargs; i++) {
-- 
2.25.1


