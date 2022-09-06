Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6415AE568
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 12:32:23 +0200 (CEST)
Received: from localhost ([::1]:46934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVVsU-0000vE-AV
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 06:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVSk-00046F-1I
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:05:46 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVSf-00034F-2z
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:05:45 -0400
Received: by mail-wr1-x434.google.com with SMTP id bq9so1738228wrb.4
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=A1suykGSR20eVXqFN1Yv/5dGPd3G7DCTm6fMJu/rgAk=;
 b=fdjAEDlL3QU314MN/5L1d70mTMcBszvfP4DRj5kmVJFoiqbbU+gPhu6IZcsw4FdqCR
 b0/wP/81PI2y4H5emPBuhflUVCyW3FmVmg1R9dekWUAjWLrV9o9dfxa4FFW2dpBFO0i5
 lT5y3pjZ6MKSHg67a9snHNfHEIWhwE5A+CiJcCpDwcqkFuSJX5DP4BqZcATLHC/ot1gv
 T6A/Gk+XC4kfmqmqXLWaR8nBRx7W1qfD6w9XEUhPu4BeJwi3Q0xNdUjZoIb1eSxM0NZs
 4UkLgnM4PetB7S/vA9SHwmZ3Fqq1yAL9VQWLgP/FqfcyRdGHDixCvka+aTGjOE53ABGa
 HM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=A1suykGSR20eVXqFN1Yv/5dGPd3G7DCTm6fMJu/rgAk=;
 b=7nJMWdrDShBJoKZGoVta7HwpHGby+DFU+c+CjRJiR2Og1ou86Laz6cvOnYFpnmU+QI
 d6wXfQWO0Xbd4iN0xpub8n6QU7whP1geUzqKDN7vAHgVVXvcN9iK1Bk7pliR4ejEAj7c
 f57+mfQBee99Bp1D6v8AohU8XfO1ERrtHc2StI2XQd+Faypnmdws3RA+nc7hpaLY5KyT
 adHDkmUmZIxAAtBjcTG/0n0Ws0sFJ1fsHdVlE7I3uFNVdMKmqprobLjNevc57wChlwTb
 TpVWDO3K6AJkGzp7Ce1Gv+k/EgE9x8UGNuzaHfRanhu8CSdqPmHdVIZZcP6rrGkIoAsQ
 3hfQ==
X-Gm-Message-State: ACgBeo3uKVRNq0k8cjag/X03P6ZulVoFxSB/SwCmmthGK311gNLGtSGD
 dvmSSvkymt+j0Yip/O9t4lGIor4Vi5ZBWSLE
X-Google-Smtp-Source: AA6agR7E6iZAbRhhR8xm7a+P5YWe7AXxO4Ljcw2QYJqoyM9+hfYt8DGbpoxC1eIXRM73urQ2QHGjBg==
X-Received: by 2002:adf:f54c:0:b0:228:d41f:9f86 with SMTP id
 j12-20020adff54c000000b00228d41f9f86mr2513227wrp.699.1662458736278; 
 Tue, 06 Sep 2022 03:05:36 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a5d6dcf000000b00225307f43fbsm12271081wrz.44.2022.09.06.03.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:05:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 5/9] target/arm: Change gen_exception_internal to work on
 displacements
Date: Tue,  6 Sep 2022 11:05:24 +0100
Message-Id: <20220906100528.343244-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100528.343244-1-richard.henderson@linaro.org>
References: <20220906100528.343244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c |  6 +++---
 target/arm/translate.c     | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 17ea8b5650..9bb744fad3 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -340,9 +340,9 @@ static void gen_exception_internal(int excp)
     gen_helper_exception_internal(cpu_env, tcg_constant_i32(excp));
 }
 
-static void gen_exception_internal_insn(DisasContext *s, uint64_t pc, int excp)
+static void gen_exception_internal_insn(DisasContext *s, int pc_diff, int excp)
 {
-    gen_a64_update_pc(s, pc - s->pc_curr);
+    gen_a64_update_pc(s, pc_diff);
     gen_exception_internal(excp);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -2229,7 +2229,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
                 break;
             }
 #endif
-            gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+            gen_exception_internal_insn(s, 0, EXCP_SEMIHOST);
         } else {
             unallocated_encoding(s);
         }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index d441e31d3a..63a41ed438 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1078,10 +1078,10 @@ static inline void gen_smc(DisasContext *s)
     s->base.is_jmp = DISAS_SMC;
 }
 
-static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
+static void gen_exception_internal_insn(DisasContext *s, int pc_diff, int excp)
 {
     gen_set_condexec(s);
-    gen_update_pc(s, pc - s->pc_curr);
+    gen_update_pc(s, pc_diff);
     gen_exception_internal(excp);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -1175,7 +1175,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
         s->current_el != 0 &&
 #endif
         (imm == (s->thumb ? 0x3c : 0xf000))) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, 0, EXCP_SEMIHOST);
         return;
     }
 
@@ -6565,7 +6565,7 @@ static bool trans_BKPT(DisasContext *s, arg_BKPT *a)
         !IS_USER(s) &&
 #endif
         (a->imm == 0xab)) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, 0, EXCP_SEMIHOST);
     } else {
         gen_exception_bkpt_insn(s, syn_aa32_bkpt(a->imm, false));
     }
@@ -8773,7 +8773,7 @@ static bool trans_SVC(DisasContext *s, arg_SVC *a)
         !IS_USER(s) &&
 #endif
         (a->imm == semihost_imm)) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, 0, EXCP_SEMIHOST);
     } else {
         gen_update_pc(s, curr_insn_len(s));
         s->svc_imm = a->imm;
-- 
2.34.1


