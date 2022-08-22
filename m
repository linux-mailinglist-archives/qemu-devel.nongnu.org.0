Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E3459CC46
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 01:36:36 +0200 (CEST)
Received: from localhost ([::1]:35514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQGyA-0000Hu-Pk
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 19:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlz-0005jS-2p
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:24:00 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:46949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlx-0005ey-7G
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:23:58 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 o14-20020a17090a0a0e00b001fabfd3369cso12896490pjo.5
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=sptqSn2q1MUxoiSJ0oXgREmv1FSN9FwBedSu534JEYA=;
 b=Y4HA7aueTTLEjKrTksc2JhCldaozROqYR6Gx02urcSo8z+bmaYmwHNY6eVslVM5R2L
 dV7Awf/nQjTEoeBIeQhF159q8CAqUDZo7ez8TbHoIoKbAhaUA4ENU3y/PMhd/fcFi9TH
 hEP3l9hbzq1A57fXUzs9V5xbqjbeEn80m0g0QaXqMUaseNZSz6wHq5kF7ZYjLsX2prPX
 vCdFkydOP2UO9+HpNYz8/Tri4SV6n3ROQPYiomAOF73OMLAyd1+bYxI5N/EWhoCTMRAm
 GGb8eaTB8DMFZ2CKo/7TAJbrS8KnYB5rra5A8by9LaSraV4RdHGaLRCBja9DbedNol6z
 Q4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=sptqSn2q1MUxoiSJ0oXgREmv1FSN9FwBedSu534JEYA=;
 b=Y077C/SYcrG3Zhf6XqX2ivpcViWEp9SJgO0aCSQcmoVuKA2wMtKfYjp9YliNWzS+zr
 i+AThCxCQ8s1xyftfGr6BH6L4hA/KPsolj1VfHCT+TFMoo7SgFYlewAw+QzXATTaCsuO
 jPXopYnxNLCM9oVfKFC4hX0yuZ6AAGUlDUFwZiy/gDGw6ApEM/eaOJkc/zG9RUM9488/
 lWLBkQDd2768zgRiAe3W4HldA0SHM98fO8OFwYhEN0C35xh9EKqiXs18cgCsc7dk2S81
 Q6ILmZ7isWVEgtzy1KnTBq6Joci3ANuQ/xWqtXEp/HztG4/cU+LfHAbzlHaxzCzvEB/0
 C20Q==
X-Gm-Message-State: ACgBeo2ss3IOaY1mlWQQ0CGfoziU7I0So7uffrVeI8Vd8sbksxKUjnDp
 au11pXljiLOW7KpAqovCPN+5PGzf6ny/zg==
X-Google-Smtp-Source: AA6agR4AdK0/clLVMX6SBug0HZ3QSIxFtjor9PQ+hrQRcaX+EA9PXei7gVZSatff6/6kD4s56H/Vbw==
X-Received: by 2002:a17:90b:4b47:b0:1f7:2e06:5752 with SMTP id
 mi7-20020a17090b4b4700b001f72e065752mr584289pjb.187.1661210634918; 
 Mon, 22 Aug 2022 16:23:54 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa79731000000b0052d3899f8c2sm3809112pfg.4.2022.08.22.16.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:23:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 13/17] target/arm: Change gen_exception_internal to work on
 displacements
Date: Mon, 22 Aug 2022 16:23:34 -0700
Message-Id: <20220822232338.1727934-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822232338.1727934-1-richard.henderson@linaro.org>
References: <20220822232338.1727934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
index 422ce9288d..b777742643 100644
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


