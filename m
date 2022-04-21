Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F33950A521
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:21:52 +0200 (CEST)
Received: from localhost ([::1]:35146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZZ1-0001JF-50
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYd2-0005R5-BU
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:58 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:37428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYd0-00077s-Qv
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:56 -0400
Received: by mail-io1-xd36.google.com with SMTP id p21so5635731ioj.4
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=80O9UC62w69RZGUELf5QYLlmzTQ8DTEKKG5MfMCcdh0=;
 b=pvlcq4zRxtxzF34TIHzUMgPtG2tGY51+nSZkRmIuS1DzhppNyREr1/qaSBl+t765rM
 rrxQaEOcGeOtTf0O4CBk5f3ulC3Kfka1FkmCEwVB+R32/exooIBlC+Kr0eh/eTg4toxA
 PJFRRgI8ajRr3qKyrQjcYKauWk9zKkHDIT9MZMAvkH8OH9ZNl+vffKWktTx7kct3Scie
 GXOXR8gxtb+7WwZbLS7n8ZHtA64rNyKByW+0pZ4q+VYHH1m56CK1OTJTrKBBSUOf6QUJ
 cfUQ1n7sRA2E5vFvrG1cOSFm2LUJxqr4sL7TqQA/zTD6INZnbPIYDju6qBNUNsxNkxOB
 g2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=80O9UC62w69RZGUELf5QYLlmzTQ8DTEKKG5MfMCcdh0=;
 b=CGj2GA/enJG/yGJPhr3S7LAMMwqNZXSbBbQLjbAgk4qTFgGbdOgKH0tzkzm+eHDVSj
 1yo1Aw9j4jcQ0VZ6oe96iQibacTQ6AqAp5kcXzydLoBQ7r4+bMTtfjXXnyGEqmehWbml
 yxpZj7VgWmu2TrJ0UKqQPvC0F1/zf1RT3TBxgFWPfs2/Xuo6p0hS4Ev+jUiju/6hdY+f
 9C8Ov577wdaTkj9NBbGQbBmYPW67oJN8zMsUnDJYHWjW7yHO33iOx9+IVOiVJOBnLpvW
 no2AUi6KB1C2IxEtU9kfzI49GsCjDiGTcM8IoDsfyIh+GcB5DpSJYULQwzb6r/iCJbcd
 pg0g==
X-Gm-Message-State: AOAM532AQ/2Vj2Ng8Jnj/89S0zz3gxweeC/Nq+MisoMEREbYhKWkt3h3
 Wtyq/3AtBjIbG4oguJS5FGkg48lKBb7gmw==
X-Google-Smtp-Source: ABdhPJxwn8X4PJ8diEbU0AmlpZG4F4egbgksmUcWaT+dDyniMsK39UJrS04bnoxHvhiKXjBgQWj2wg==
X-Received: by 2002:a02:bb01:0:b0:31a:a11:1c39 with SMTP id
 y1-20020a02bb01000000b0031a0a111c39mr31751jan.233.1650554512795; 
 Thu, 21 Apr 2022 08:21:52 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a926e01000000b002cc52449a19sm3985402ilc.35.2022.04.21.08.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:21:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 49/64] target/nios2: Hoist set of is_jmp into gen_goto_tb
Date: Thu, 21 Apr 2022 08:17:20 -0700
Message-Id: <20220421151735.31996-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd36.google.com
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

Rather than force all callers to set this, do it
within the subroutine.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index e39e349389..1686d2b82f 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -186,6 +186,7 @@ static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
         tcg_gen_movi_tl(cpu_pc, dest);
         tcg_gen_exit_tb(NULL, 0);
     }
+    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_jumpr(DisasContext *dc, int regno, bool is_call)
@@ -229,7 +230,6 @@ static void jmpi(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     J_TYPE(instr, code);
     gen_goto_tb(dc, 0, (dc->pc & 0xF0000000) | (instr.imm26 << 2));
-    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 static void call(DisasContext *dc, uint32_t code, uint32_t flags)
@@ -272,7 +272,6 @@ static void br(DisasContext *dc, uint32_t code, uint32_t flags)
     I_TYPE(instr, code);
 
     gen_goto_tb(dc, 0, dc->base.pc_next + (instr.imm16.s & -4));
-    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
@@ -284,7 +283,6 @@ static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
     gen_goto_tb(dc, 0, dc->base.pc_next);
     gen_set_label(l1);
     gen_goto_tb(dc, 1, dc->base.pc_next + (instr.imm16.s & -4));
-    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 /* Comparison instructions */
-- 
2.34.1


