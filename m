Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6A04DBE5F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:29:25 +0100 (CET)
Received: from localhost ([::1]:41552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUihQ-0004NW-4d
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:29:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKz-0001Ps-1s
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:13 -0400
Received: from [2607:f8b0:4864:20::535] (port=44585
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKx-0002IL-Gg
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:12 -0400
Received: by mail-pg1-x535.google.com with SMTP id c11so1810275pgu.11
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ryxSDJJrKjueVH0OEsU0bn5y9v3EMgUpEWxAYhSIfi0=;
 b=h0rN+dUoX4UY36TUym/+8CL6kOe6ysOPPaWRb3prqFEO0Qo9745uwLHfhSrgsywb2a
 sKOd0afqc8aLACaGDlrBWqMqgUyaUNGhtlQbBiiQ/DQVZcaTdxUchN9Dto+C5hA1UYYL
 a1aC+8n+TVutXy3DQLcWZG6aoP9h4QFy7wPAJjji9UGfomIeO5U5j7IFb0W52SfqeX2X
 SBon/QxWEClOTZUG68u1ij32ow4/fQTKx5q22Wfq8dEkH8BFje0e2FYwoUQ04WAaZVKf
 pb2BNWA4dt5GWd/8DDKKjdhcgrwezCY9MjUTuzQAsSLazdLeG/0PAWjE2c5cqUJ194Z0
 s1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ryxSDJJrKjueVH0OEsU0bn5y9v3EMgUpEWxAYhSIfi0=;
 b=aUOrALk0mCJ2qEvzSlp9kpPBL5eMSJtwcGkCDvQG5tpeD7DTRIQLyLzjqi+HDtQRM1
 lOwvTiF5jluntOZhuWu1ZqF3qajVjXcgPO3wKL8t4QTr/7ju1jq4/B+jNW/TpShXX1L4
 gLmbUyv5gYTdg8Fdyrqrmo5IFGL5XacOBTzLdz+fu6XZhzhrBj120Sme1R4xC0MYUWIB
 bqPOMwXej0nv1c/zM1HE811BepXsXrUVEroL1uqnQbGn94HpMv1MmwIayIfqQDW6M4TX
 0I7lKXHk+pYmUjQOVnneFpyJSs1LAhQmT1H3V3zBfZBzUEdmXlo0wGKrR5jY6vbRN3na
 rP+A==
X-Gm-Message-State: AOAM533sTeXUobTnX7cpRvlMR9lLds68ZyYNWXybuZEgapJ4UZ1nxRPX
 I8e+kL7JFMzncAClawQ9nqNfh+bBBYE++Q==
X-Google-Smtp-Source: ABdhPJztpTWP0r5m+vo76wBLgRrb7vd8zcTAMRnAkCPZmNHl0VRbcKu8ihyL+fYwc8cpYIzXEd8kuQ==
X-Received: by 2002:a63:41c5:0:b0:378:3b1e:7ac7 with SMTP id
 o188-20020a6341c5000000b003783b1e7ac7mr2296808pga.266.1647493570306; 
 Wed, 16 Mar 2022 22:06:10 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:06:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 31/51] target/nios2: Use tcg_constant_tl
Date: Wed, 16 Mar 2022 22:05:18 -0700
Message-Id: <20220317050538.924111-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>,
 amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace current uses of tcg_const_tl, and remove the frees.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index c8fb05a9cb..4ad47bb966 100644
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
2.25.1


