Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EF43C7550
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:51:30 +0200 (CEST)
Received: from localhost ([::1]:51148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Ld3-0008NY-Fo
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LUE-0006u8-JR
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:22 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:33373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LUC-0005gn-7X
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:22 -0400
Received: by mail-pl1-x629.google.com with SMTP id d1so6185095plg.0
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l5PqM6iGSweKZSS09TGPy9jM/MAv4I7LtiO9ZGckioo=;
 b=Qp1pi/xijJ3l5zDukur8AAb6SI1qrJBbW7UckSBVDBlFdjZJ48z7ty7P2gijabMufK
 lbyXKyYR07XKWWlvWOiLW71yfzv7Gv3OcUWtoRIObzxn+ggaxUrf+i8SVNXj86CbqdXg
 j7Y9JV9SacZpCxtlDbILTayDgTcmgg9NLmEJsH4cIPlqacB21DHoQJzC0S6jpaOjtseC
 qveKbvHZT+2de3w7/HMHzIyF5B0UKvRUi3UaXejTRVQBT8Ufbs6g+B1kGtqxEKEXVXaY
 9eUCD79JR3XKg6WOWbSPvt/vlzWGpGOp5SGEK1GCqUw9oH8AcXXVpthYZs2zaSt6tvHg
 umGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l5PqM6iGSweKZSS09TGPy9jM/MAv4I7LtiO9ZGckioo=;
 b=VF6SVArPiR6kHkp7WMREJ7+bM5JbdZxIutGUre9BEKm/QJQPoSITursw88NO58p8Nx
 A6CnJg/FZHddI/IZJujHK0IMfCFnhi45qTb7moxq0S709PDRDf4mOfSkf1Mud0nCqbLS
 Varu/LEl94LDa4W0xnzVPSvV1vitrcjSs6dd8uxj2pd0uCHApe2v/EqHN1hJN1DLsu4m
 rOwFTF9yQ64l+HIl5bF2Oe94GTgvvJ/nwl6eCt7/LCwPFXB35786KL0dv40gNO6bfrn+
 2/U5RRNDtNNOORKqJHEO7t+bBcjdE99lChVgVyR2Z5g4Q8XtemnqbiewWc8Nj2DGxLaQ
 Z0OA==
X-Gm-Message-State: AOAM533KmLGUKFwkl4sahM6PSWj0UYSyeo8dsbwUYF0mDy1svokSHffW
 bh6Tm3zTMabpNM4fYYXHXWRszq7Q5eBCPA==
X-Google-Smtp-Source: ABdhPJw/j8vPhV9o305iKrm1WHU/e2EVydTUbGC3S7jusvhKHv/SQ/nfuzh1+9UMLR34YTjgzMBE7A==
X-Received: by 2002:a17:90a:a60f:: with SMTP id
 c15mr5029285pjq.187.1626194538823; 
 Tue, 13 Jul 2021 09:42:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z13sm4947865pfn.94.2021.07.13.09.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 09:42:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/14] target/openrisc: Cache constant 0 in DisasContext
Date: Tue, 13 Jul 2021 09:42:08 -0700
Message-Id: <20210713164211.1520109-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210713164211.1520109-1-richard.henderson@linaro.org>
References: <20210713164211.1520109-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are virtually certain to have fetched constant 0 once, at the
beginning of the TB, so we might as well use it elsewhere.

Reviewed-by: Stafford Horne <shorne@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/translate.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 2db529b7de..6aba4c2ffc 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -52,6 +52,8 @@ typedef struct DisasContext {
 
     /* The temporary corresponding to register 0 for this compilation.  */
     TCGv R0;
+    /* The constant zero. */
+    TCGv zero;
 } DisasContext;
 
 static inline bool is_user(DisasContext *dc)
@@ -536,10 +538,8 @@ static bool trans_l_extbz(DisasContext *dc, arg_da *a)
 
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
@@ -630,9 +630,8 @@ static void do_bf(DisasContext *dc, arg_l_bf *a, TCGCond cond)
     target_ulong tmp_pc = dc->base.pc_next + a->n * 4;
     TCGv t_next = tcg_constant_tl(dc->base.pc_next + 8);
     TCGv t_true = tcg_constant_tl(tmp_pc);
-    TCGv t_zero = tcg_constant_tl(0);
 
-    tcg_gen_movcond_tl(cond, jmp_pc, cpu_sr_f, t_zero, t_true, t_next);
+    tcg_gen_movcond_tl(cond, jmp_pc, cpu_sr_f, dc->zero, t_true, t_next);
     dc->delayed_branch = 2;
 }
 
@@ -1594,8 +1593,9 @@ static void openrisc_tr_tb_start(DisasContextBase *db, CPUState *cs)
 
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


