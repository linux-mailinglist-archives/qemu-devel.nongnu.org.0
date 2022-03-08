Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C17A4D1145
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:47:56 +0100 (CET)
Received: from localhost ([::1]:53604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUZT-0002qS-PE
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:47:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9K-0005GS-NF
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:52 -0500
Received: from [2607:f8b0:4864:20::52a] (port=39464
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9G-0006QY-1M
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:48 -0500
Received: by mail-pg1-x52a.google.com with SMTP id q19so3062198pgm.6
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9OTzOulpMcp9+HOcbK241jx0Fw2zaG+2rEyo8QB0mMM=;
 b=UlB3Be4w/c+6RcqhxFkxq/UBhORlgJDwTpX3WnxL36FzAa0W/AVEsBw0Pm/vvram+x
 S6u0evDOhIidRT20LE5D554C7ta2Bj6OziV46Ws0b5EcU34shsFsNvVRbk6qXbTtNNqQ
 ZtxCNBsib3TSqZEJyQOsAE+UQTvwLaUQxymFh372mIJBh+wtF7H+h87qNelAVc+EVZ8i
 ejZew3Y14I9Z7q9D7V1L3wS3MWtxKyFNkWJ7xU9YuhbJIuq4wpVAJmjQ7pS/812VtkPS
 eukqSZELXNMzRF7y8UhS/Nim7UXvoodIBLBHDnjQYyOf+FR1Chg3uOPsHKGs9Ldo5XAt
 6KjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9OTzOulpMcp9+HOcbK241jx0Fw2zaG+2rEyo8QB0mMM=;
 b=PlMrd7cehcA8BLDbZaDQNcOFTYaYxCvZUXYxKWipF4+1M5HnpvSJ5UqpR3RxG2CquN
 c+jyO1+QXfhg5IHrUo/jZ4zikAfd9m2m7gZOL+Q+/OLpc8W+QR1waxua9zBypfA8l42g
 t02y54VDhwayQj8fMc1W8Ooo1haVEyVq+DZh+t4qqMlG+aKWb4vpFKFTaCsoCBjaJRyJ
 2lUPlqNg3RUno91wVBGCuSFgeF1+8cF7va1v7xzBnnX1paXCc+mlCDpR5nd6OtmU6HKn
 rTDLGi3moIliRnVt3sClOUFcJsYxqv0uL11nb/npBazF3e3dR/ngwufWB+4NqIOiYl/C
 OjSQ==
X-Gm-Message-State: AOAM533LCQ+/xC6mG21ag5FrPkdpNl/gH3Svo0olmzdTmK4MDlSv972j
 WfuSe5D6yr6STvcrtxAxYxcEya6xwlIuSg==
X-Google-Smtp-Source: ABdhPJxn2jgx79nGqYV7m6V2PrsRVbR1ofwk6nwOtshnPeoXnedXYfUNYIejNpRHskT4Z9u7HKUEIg==
X-Received: by 2002:a63:8043:0:b0:380:959e:5bb7 with SMTP id
 j64-20020a638043000000b00380959e5bb7mr687890pgd.5.1646724042331; 
 Mon, 07 Mar 2022 23:20:42 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 21/33] target/nios2: Use tcg_constant_tl
Date: Mon,  7 Mar 2022 21:19:53 -1000
Message-Id: <20220308072005.307955-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace current uses of tcg_const_tl, and remove the frees.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 36 ++++++++----------------------------
 1 file changed, 8 insertions(+), 28 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 38e16df459..6ff9c18502 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -98,7 +98,6 @@
 
 typedef struct DisasContext {
     DisasContextBase  base;
-    TCGv_i32          zero;
     target_ulong      pc;
     int               mem_idx;
     const ControlRegState *cr_state;
@@ -124,31 +123,20 @@ static uint8_t get_opxcode(uint32_t code)
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
 
@@ -675,8 +663,8 @@ static void divu(DisasContext *dc, uint32_t code, uint32_t flags)
 
     TCGv t0 = tcg_temp_new();
     TCGv t1 = tcg_temp_new();
-    TCGv t2 = tcg_const_tl(0);
-    TCGv t3 = tcg_const_tl(1);
+    TCGv t2 = tcg_constant_tl(0);
+    TCGv t3 = tcg_constant_tl(1);
 
     tcg_gen_ext32u_tl(t0, load_gpr(dc, instr.a));
     tcg_gen_ext32u_tl(t1, load_gpr(dc, instr.b));
@@ -684,8 +672,6 @@ static void divu(DisasContext *dc, uint32_t code, uint32_t flags)
     tcg_gen_divu_tl(cpu_R[instr.c], t0, t1);
     tcg_gen_ext32s_tl(cpu_R[instr.c], cpu_R[instr.c]);
 
-    tcg_temp_free(t3);
-    tcg_temp_free(t2);
     tcg_temp_free(t1);
     tcg_temp_free(t0);
 }
@@ -863,14 +849,8 @@ static void nios2_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
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
2.25.1


