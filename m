Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F5959CC8B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 01:54:47 +0200 (CEST)
Received: from localhost ([::1]:45306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHFm-0005Jn-Hu
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 19:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvZ-0006AH-6a
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:56 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:33412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvW-0007Fs-9F
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:52 -0400
Received: by mail-pg1-x52f.google.com with SMTP id l64so10798323pge.0
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=kxgqCCWuJTk37ZVQTycQC25Ehrr1bCZKZB4kFGqdRhM=;
 b=NVh60Onj0olOZMWd/6N4G21DugD/WQnwsLNPton8TfNIpzNMsEsreF0TqTeIjDQOtq
 +DihU1zhaAR92USQouYfIeMG2lLQpp47oi1yEDr8nreyUw8QUlbU1ubgCeDbZfuMMm9W
 b5Ujru3+mBulXSAPPZ6Wx6OTAU8uolYNqas8bwkIhSA/uD0Se1c/0Ynr7gIReW0J6dFl
 yyYnIhulW+vvP9ax8WF4+FI9DOwLVivG5zdDlTREK6gMt3xY/L5s6kUcMZfmJ+xCULAA
 yt/C2Uz8bH74cz+/Qg0I3ZGuND894Dzyo+2mot2/4pKEd6WL8ByyXlmEDtjuoyK1h24M
 CwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=kxgqCCWuJTk37ZVQTycQC25Ehrr1bCZKZB4kFGqdRhM=;
 b=urSMCzwtN9l+l5ZWn9Av06x7hpUfYdwWf5iBVlp7xOXQZAuzg8N+Wh4t0zBD3B0aY7
 W+Y6xeAJm2ObSuOaTgDG268kMjGEntqpFTf2aM6Zdxys89OfSCK4Dh0WJx8Ui0bT6Ppb
 V80CAgz/u3vmF4sTFUoxvP4tHYVDeb5ENgTfXKZsaDxndN5KTabmqelYVPMVRuSRGgju
 kpVKNq68Vxs2jE6Z/rMWtBYix/utU763gDEgc06R0J/J9rJxCmnyJk5dklIxMjnbt1J5
 Qy18XaB5WdfSfITviJDpCSx4HLJG2GB+ZWY5mFxw1mPSf/ibS5R0QRZK+0RKeFHvfPHt
 fdmw==
X-Gm-Message-State: ACgBeo1O6mYkgvw6j/6TxJlMrE3rV2s91Zr4PoqJFErwFlJ7q465d8c5
 NyvQNkAe9IMQm0y3zZJSqUzHu42aoX3k+Q==
X-Google-Smtp-Source: AA6agR70gfyBksPS/gxWNlHfi1p9xdBFO5JEX6ddjxTJ9ysFrt6GZOsH44GC6v6nLj6zA12ym5b+Qg==
X-Received: by 2002:a63:85c1:0:b0:42a:1230:e3c2 with SMTP id
 u184-20020a6385c1000000b0042a1230e3c2mr17898944pgd.370.1661211216878; 
 Mon, 22 Aug 2022 16:33:36 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 82-20020a621555000000b0053655af14easm5133124pfv.45.2022.08.22.16.33.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:33:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/22] target/i386: Truncate values for lcall_real to i32
Date: Mon, 22 Aug 2022 16:33:09 -0700
Message-Id: <20220822233318.1728621-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822233318.1728621-1-richard.henderson@linaro.org>
References: <20220822233318.1728621-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Use i32 not int or tl for eip and cs arguments.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/helper.h         | 2 +-
 target/i386/tcg/seg_helper.c | 6 ++----
 target/i386/tcg/translate.c  | 3 ++-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index ac3b4d1ee3..39a3c24182 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -37,7 +37,7 @@ DEF_HELPER_2(lldt, void, env, int)
 DEF_HELPER_2(ltr, void, env, int)
 DEF_HELPER_3(load_seg, void, env, int, int)
 DEF_HELPER_4(ljmp_protected, void, env, int, tl, tl)
-DEF_HELPER_5(lcall_real, void, env, int, tl, int, int)
+DEF_HELPER_5(lcall_real, void, env, i32, i32, int, i32)
 DEF_HELPER_5(lcall_protected, void, env, int, tl, int, tl)
 DEF_HELPER_2(iret_real, void, env, int)
 DEF_HELPER_3(iret_protected, void, env, int, int)
diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index bffd82923f..539189b4d1 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -1504,14 +1504,12 @@ void helper_ljmp_protected(CPUX86State *env, int new_cs, target_ulong new_eip,
 }
 
 /* real mode call */
-void helper_lcall_real(CPUX86State *env, int new_cs, target_ulong new_eip1,
-                       int shift, int next_eip)
+void helper_lcall_real(CPUX86State *env, uint32_t new_cs, uint32_t new_eip,
+                       int shift, uint32_t next_eip)
 {
-    int new_eip;
     uint32_t esp, esp_mask;
     target_ulong ssp;
 
-    new_eip = new_eip1;
     esp = env->regs[R_ESP];
     esp_mask = get_sp_mask(env->segs[R_SS].flags);
     ssp = env->segs[R_SS].base;
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 367a7a335a..13577f5d7b 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -5189,7 +5189,8 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                                            tcg_const_tl(s->pc - s->cs_base));
             } else {
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-                gen_helper_lcall_real(cpu_env, s->tmp2_i32, s->T1,
+                tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
+                gen_helper_lcall_real(cpu_env, s->tmp2_i32, s->tmp3_i32,
                                       tcg_const_i32(dflag - 1),
                                       tcg_const_i32(s->pc - s->cs_base));
             }
-- 
2.34.1


