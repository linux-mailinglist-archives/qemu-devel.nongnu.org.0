Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E133ADC9B
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 06:25:13 +0200 (CEST)
Received: from localhost ([::1]:35830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lup1E-0004Zi-8t
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 00:25:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luoxw-0005JI-RC
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:21:50 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:46943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luoxu-0007x6-2d
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:21:48 -0400
Received: by mail-pf1-x431.google.com with SMTP id x16so10978592pfa.13
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 21:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ktgo4xWUwEPLcu/uB4HSWazqzoEfJMOHsnknfFL5vLg=;
 b=c2brptxgdv6EOmz8vTGY5YLkwDzhXqq3s79sfvVO3gYB8KuWIJaOo5RhAffFnTmaEp
 sr4I6FWTlFyOhVmvkHkto7GP30Ri+hAC1vX29GI3xN76QHfbVCLUyJhYO6OarhcOUZWY
 0DJgWdtifQNqyYdPdZ7Ry/KjLwaxY0H7jMa+Z6iO4XAhawlbaMQ/XxP+kXMBeKE8xKAU
 dNESrARWgw6uSLwtZ++A4mj0JSNxLNHcytZhcSIjVwZnYpQgGGDl0tWP804i7UsQpqf5
 cQK4/UOu9bh2uG8QBlwQAs8K/eBUH6sZV0qGLndRpyAufhtz5FgdL95Es/2lE2ZNnLMd
 Mcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ktgo4xWUwEPLcu/uB4HSWazqzoEfJMOHsnknfFL5vLg=;
 b=Z6crMwvlGUY69ZE5svjlxTm5mjqIkWB4/3ksZps7vrdnSEi/0oeLFjRpDpgZsLCdqs
 nYABH0iQiYChozV8HerfEzXiR6vZURoRoTZQJbdn/kvssgWSB8ZewhvakbQQpNxVcBXJ
 HKzyNKK/3K16HH3mswgrg9CrpfgzpS6hGCevuR7WnB4z9KigY5/GAHgAvfmWLTg8LwoK
 tZ7cdRKFGp2jUroR5Ul56uay+EhkBOFJsFwQQUdbOr9EguMZnrmjunwf5lS06xcPpsXS
 dOSCCWkgRD9XXE390UdtI+lh2KvRCgr8w+q85W2V8hjQvynm1d9Hit/QCFmNRMvmCYzD
 P0+g==
X-Gm-Message-State: AOAM532XWiy0obLJnxlnxaxaMeheTPuhHqBS/WSyyLNilYEja1y+U5Rw
 md7yOfYTQUA4BQgBzN1VJrcCzK4eBb+olA==
X-Google-Smtp-Source: ABdhPJymqwn3NljCdCbOQeyyr0ZTI3oZyygLS3N4VQg4kvqELBLfd0eJyTJvGy67/hPnLAz4Fxj2/Q==
X-Received: by 2002:a65:6a52:: with SMTP id o18mr17601325pgu.177.1624162904719; 
 Sat, 19 Jun 2021 21:21:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b6sm11923156pfv.16.2021.06.19.21.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 21:21:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/9] target/cris: Replace DISAS_TB_JUMP with DISAS_NORETURN
Date: Sat, 19 Jun 2021 21:21:34 -0700
Message-Id: <20210620042141.1235541-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620042141.1235541-1-richard.henderson@linaro.org>
References: <20210620042141.1235541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only semantic of DISAS_TB_JUMP is that we've done goto_tb,
which is the same as DISAS_NORETURN -- we've exited the tb.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index bed7a7ed10..2ff4319dd1 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -55,7 +55,6 @@
 /* is_jmp field values */
 #define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
 #define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
-#define DISAS_TB_JUMP DISAS_TARGET_2 /* only pc was modified statically */
 #define DISAS_SWI     DISAS_TARGET_3
 
 /* Used by the decoder.  */
@@ -3243,12 +3242,12 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
                     gen_goto_tb(dc, 1, dc->jmp_pc);
                     gen_set_label(l1);
                     gen_goto_tb(dc, 0, dc->pc);
-                    dc->base.is_jmp = DISAS_TB_JUMP;
+                    dc->base.is_jmp = DISAS_NORETURN;
                     dc->jmp = JMP_NOJMP;
                 } else if (dc->jmp == JMP_DIRECT) {
                     cris_evaluate_flags(dc);
                     gen_goto_tb(dc, 0, dc->jmp_pc);
-                    dc->base.is_jmp = DISAS_TB_JUMP;
+                    dc->base.is_jmp = DISAS_NORETURN;
                     dc->jmp = JMP_NOJMP;
                 } else {
                     TCGv c = tcg_const_tl(dc->pc);
@@ -3311,7 +3310,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
             tcg_gen_exit_tb(NULL, 0);
             break;
         case DISAS_SWI:
-        case DISAS_TB_JUMP:
+        case DISAS_NORETURN:
             /* nothing more to generate */
             break;
         }
-- 
2.25.1


