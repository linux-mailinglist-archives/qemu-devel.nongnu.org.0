Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0B050A57C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:30:32 +0200 (CEST)
Received: from localhost ([::1]:56638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZhP-0008WM-Oo
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:30:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYcu-0005Ge-8P
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:48 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:46880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYcr-00075C-2U
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:47 -0400
Received: by mail-io1-xd2a.google.com with SMTP id g21so5609535iom.13
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9FhYqgUBmxsHbCT6l/0igDDpPwMQ5ePyATfk3NegcvI=;
 b=JU8umLF8coRVc6poxFZswPbXj4dHMO87pIBOmoncfjeisvOSu7p/aPgDY5QhXHzYHn
 jqk3YI+rLB77Y1Co5m4FZIYHWjSxQZo7XyG3r+Xf5VafrabaZBDzlsMe9NUWIs2FYdyI
 OXaBuW08Ay3/wVmBEKcOU9N489vYP0IqNi6o7qhH6c2wpnFugDWMdNO83tJANvBYA+8h
 t8/ywI/5z3gsEbIcnXkDsH16uugYUIuzkwVe5R05OT+YKujc66Qiq1kvUi/p21C8ALTE
 TBpz3GRC/bTzxF3HnRTe3+BSNi0iolHl1re72LvjHh2IPIGuAv747U6aXabny9KV+SAw
 099Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9FhYqgUBmxsHbCT6l/0igDDpPwMQ5ePyATfk3NegcvI=;
 b=vaWN7OKhBUT1E+xKM0FOkFbGqz4A1uIhYI/cSbK4lzs2NAX6yJdsRj8wUYGFHWvQxW
 w47lJF8WcwGrzzLw1K/h8BTi9BXw8/Og48vRqet8XWw5ao5OncSfkf7XdaIT6wPMoHcn
 qNYr0Lte4BENM5QQrSHcfAnCCcXjWyTj1PCXj1bOH1YTHsaPMVfTQOfD9zXInqdJC+za
 LBcVpKM3DN60yxvBtKdKvkrrF5e1+I5+L0OVYRXwdQM/D65ZFjgCowKYhLewrqyLF11I
 +dRZSfYYm+3SpQ4wNIK6eXQNy8YC2HBhY22/d6YnmuW/P8xb3JAQZBzRZo5oRcGUdmYG
 BQqw==
X-Gm-Message-State: AOAM533l5YPf/I4ORlfRQlkrJm7DG7o9buMwMBYU/YSwc4FzKA+N6S4O
 PANrV0kd5JPipKFV7fHwAcx2c+iKmcXP7A==
X-Google-Smtp-Source: ABdhPJw7Bk4Rp7FNugdNAnfwov6/810SEusVmAjAgAkXQyoiwN36nCNZkxhD9guN3Mlgfq2xkXXO5w==
X-Received: by 2002:a05:6638:b3b:b0:328:738a:3996 with SMTP id
 c27-20020a0566380b3b00b00328738a3996mr73549jab.86.1650554504085; 
 Thu, 21 Apr 2022 08:21:44 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a926e01000000b002cc52449a19sm3985402ilc.35.2022.04.21.08.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:21:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 42/64] target/nios2: Use tcg_constant_tl
Date: Thu, 21 Apr 2022 08:17:13 -0700
Message-Id: <20220421151735.31996-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace current uses of tcg_const_tl, and remove the frees.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index b27269bf08..f33015f942 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -99,7 +99,6 @@
 
 typedef struct DisasContext {
     DisasContextBase  base;
-    TCGv_i32          zero;
     target_ulong      pc;
     int               mem_idx;
     const ControlRegState *cr_state;
@@ -125,31 +124,20 @@ static uint8_t get_opxcode(uint32_t code)
     return instr.opx;
 }
 
-static TCGv load_zero(DisasContext *dc)
+static TCGv load_gpr(DisasContext *dc, unsigned reg)
 {
-    if (!dc->zero) {
-        dc->zero = tcg_const_i32(0);
-    }
-    return dc->zero;
-}
-
-static TCGv load_gpr(DisasContext *dc, uint8_t reg)
-{
-    if (likely(reg != R_ZERO)) {
-        return cpu_R[reg];
-    } else {
-        return load_zero(dc);
+    assert(reg < NUM_GP_REGS);
+    if (unlikely(reg == R_ZERO)) {
+        return tcg_constant_tl(0);
     }
+    return cpu_R[reg];
 }
 
 static void t_gen_helper_raise_exception(DisasContext *dc,
                                          uint32_t index)
 {
-    TCGv_i32 tmp = tcg_const_i32(index);
-
     tcg_gen_movi_tl(cpu_pc, dc->pc);
-    gen_helper_raise_exception(cpu_env, tmp);
-    tcg_temp_free_i32(tmp);
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(index));
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -876,14 +864,8 @@ static void nios2_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         return;
     }
 
-    dc->zero = NULL;
-
     instr = &i_type_instructions[op];
     instr->handler(dc, code, instr->flags);
-
-    if (dc->zero) {
-        tcg_temp_free(dc->zero);
-    }
 }
 
 static void nios2_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
-- 
2.34.1


