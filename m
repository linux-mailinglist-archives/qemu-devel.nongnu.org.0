Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 462A13C1B1C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 23:40:23 +0200 (CEST)
Received: from localhost ([::1]:48320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1bks-00021K-8k
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 17:40:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1bib-0008PZ-C5
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:38:01 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:45627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1biY-0008LW-Tq
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:38:01 -0400
Received: by mail-pf1-x434.google.com with SMTP id q10so6753456pfj.12
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 14:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kl6JnE7xohFEPb4Uv6igXK9acm2oRLRWePiQGSpIWy4=;
 b=tyIOlqKFHNiQ3qDfZ+BfKFbFyuhmaA2T+sVffHQvfZoEv7iVXeFKd5uYuzXQnB8v6L
 rD7rD65ESGk0zRdZonAApD00cqPVKYeVjRYBHauqfNyi0ogrpOjgN+D6xnK9L39JlWG8
 8hjoapyrEEOJzRhhpXIrOfpx4N3NaGm+c6+HYFu6j3ckUgesXpLlntW/08GSsyeFBxWw
 gRzcmX3HQ6BLkHRFIU8mC/rqugA/NTz5cREsLm3Vn6dN7WpJ3p8CXB+wuCkEyGEgADs7
 UBdat+nVT1ovbKKhBS1RdtdqFdLR8yxGPV0ATAdl4+gBF6diTaxhLh0y/HdtdqjLsqPx
 nQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kl6JnE7xohFEPb4Uv6igXK9acm2oRLRWePiQGSpIWy4=;
 b=cUpE7PNXIyOd7u5X/jIP0I+XqIPE9CVHJTuePOWSWHY+HeGPHa9BC1ttgLGVW2IHIS
 BmRcZamqTmjMbX9BbzKKZgV+UGVgALird6FqnCCaE5jgHekARdS9/7+St1X3vw8ejnyT
 emlis860pqoXOkd0/K57Ph7meJWsQrxFKuX09QKA4gS6vcBdygLNMUE5yQEy3jxUwJlS
 sJfjG+UDOx0bFcXArUrhGS7Me3BffInnbP6WIH95k3KJAnPPBkErg0xBAZulQrKcphLq
 FI12kHeWwH+hj6h+jgG6lcMxhm2ug7DP4+89OrLHitEFHywJH4ytK9/gcPf4rvHEULXv
 lNJA==
X-Gm-Message-State: AOAM530GZ+VdRx2K0GT4D52AIXB3XvpmSawMo6GF3ywWQC8GOjtwBabq
 3fbBuuiGDvidkeandZoOM8WdYFxn1HmD4g==
X-Google-Smtp-Source: ABdhPJzdVMbpAxd24iMXVNUBkJIfuuVbrVvXqSzkx0fcnBr1lGKau6Itgz7youGBS26zPV0+tbsgoA==
X-Received: by 2002:aa7:8158:0:b029:301:8d0b:3d09 with SMTP id
 d24-20020aa781580000b02903018d0b3d09mr32995086pfn.48.1625780277694; 
 Thu, 08 Jul 2021 14:37:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id g27sm4322800pgl.19.2021.07.08.14.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 14:37:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] target/openrisc: Cache constant 0 in DisasContext
Date: Thu,  8 Jul 2021 14:37:53 -0700
Message-Id: <20210708213754.830485-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708213754.830485-1-richard.henderson@linaro.org>
References: <20210708213754.830485-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: shorne@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are virtually certain to have fetched constant 0 once, at the
beginning of the TB, so we might as well use it elsewhere.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/translate.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 96df513fd3..3d86bdffaa 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -53,6 +53,8 @@ typedef struct DisasContext {
 
     /* The temporary corresponding to register 0 for this compilation.  */
     TCGv R0;
+    /* The constant zero. */
+    TCGv zero;
 } DisasContext;
 
 static inline bool is_user(DisasContext *dc)
@@ -537,10 +539,8 @@ static bool trans_l_extbz(DisasContext *dc, arg_da *a)
 
 static bool trans_l_cmov(DisasContext *dc, arg_dab *a)
 {
-    TCGv zero = tcg_constant_tl(0);
-
     check_r0_write(dc, a->d);
-    tcg_gen_movcond_tl(TCG_COND_NE, cpu_R(dc, a->d), cpu_sr_f, zero,
+    tcg_gen_movcond_tl(TCG_COND_NE, cpu_R(dc, a->d), cpu_sr_f, dc->zero,
                        cpu_R(dc, a->a), cpu_R(dc, a->b));
     return true;
 }
@@ -631,9 +631,8 @@ static void do_bf(DisasContext *dc, arg_l_bf *a, TCGCond cond)
     target_ulong tmp_pc = dc->base.pc_next + a->n * 4;
     TCGv t_next = tcg_constant_tl(dc->base.pc_next + 8);
     TCGv t_true = tcg_constant_tl(tmp_pc);
-    TCGv t_zero = tcg_constant_tl(0);
 
-    tcg_gen_movcond_tl(cond, jmp_pc, cpu_sr_f, t_zero, t_true, t_next);
+    tcg_gen_movcond_tl(cond, jmp_pc, cpu_sr_f, dc->zero, t_true, t_next);
     dc->delayed_branch = 2;
 }
 
@@ -1595,8 +1594,9 @@ static void openrisc_tr_tb_start(DisasContextBase *db, CPUState *cs)
 
     /* Allow the TCG optimizer to see that R0 == 0,
        when it's true, which is the common case.  */
+    dc->zero = tcg_constant_tl(0);
     if (dc->tb_flags & TB_FLAGS_R0_0) {
-        dc->R0 = tcg_constant_tl(0);
+        dc->R0 = dc->zero;
     } else {
         dc->R0 = cpu_regs[0];
     }
-- 
2.25.1


