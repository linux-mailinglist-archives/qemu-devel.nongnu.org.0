Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAF6670CE1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 00:12:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHv6m-0003Sp-Ls; Tue, 17 Jan 2023 18:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6d-0003Lr-Av
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:03 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6b-0001Ii-O4
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:03 -0500
Received: by mail-pf1-x429.google.com with SMTP id i65so21334112pfc.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 15:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wUYQPBlH/qzZ5WTuP7xVeHsTvUI8XJZA1GrAVh3Poro=;
 b=dgPgGnYiJJ009ewH0j6Sjk6hH7hAu2VhWfpzn8lBZlC2VHbW5ilTyOv1hf7o4hgwiY
 RoHRctFOKwMRoabqJjn7FPV9jIE+ehmIJWevF+ApWnTxJtdoicTL1BJUXW9zzZs9EW8D
 RlxHXSugLqpUjEqRHv+k+yWMIF0EkVEMqjR5gD7bXLJD2YzYxgqUUeVX1orxNrhM+WI2
 ZR5CFnrU8Sn0QTiTb9YFQ99GoD3UPklyb2zE/gqnBSCETOVy6eHJs7w8N0D4WW3QrmOI
 GFIlQg9BSYJm+8RaiFqBw+P8yyDb2BL+Gima1LjEu5p6mWKA5aJogwbjSyrFbFSaMYiw
 HzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wUYQPBlH/qzZ5WTuP7xVeHsTvUI8XJZA1GrAVh3Poro=;
 b=M9iQOntai/deUR8ECPaIqdTSPapHPtR4vCYltpxkK2Z/T2HkztiF7y1c7Ew1oAR0s/
 GrDedw6+tIvBRpYHveb91uOSA1rxosU+HoLvidlpv8SaOiZ/wWOpsJyyRVVgjJPbyqyC
 oD430CI+gxFg78+tRlxNBqKioJH4bGXxryGlL/omNUyOjeac9lIpQInn1Q1M4aG1BEIs
 wxeJqsfoW39doby8gTigwH+aVp5o8uU7+I/lyzdHR0gEUtbNodqslDRakFT4IbU7+1PJ
 9aYBj/G2KHqUnDYB0XwHuifmOznReXFiXHCBznr5R4eJMXqHZgdaojFmNoIxWq4HCdyb
 Fk4Q==
X-Gm-Message-State: AFqh2kpzvrk89+2LP/b/vIIL4CmJFHPQe/KRAtMLL+c9hxnQwfif83xK
 0EDnBRsnwGXQxxAbzREci08atuhRLzAVKVO2
X-Google-Smtp-Source: AMrXdXsbO65LC0KiCmy6LMl8+du8HSPboAsEgbWjk/igjxnYZd/u1PRYu2u32Q6qPJfMBp5s36df0g==
X-Received: by 2002:a05:6a00:3006:b0:58b:5f9d:c2fe with SMTP id
 ay6-20020a056a00300600b0058b5f9dc2femr4730472pfb.29.1673997060267; 
 Tue, 17 Jan 2023 15:11:00 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 b193-20020a621bca000000b005810c4286d6sm20747070pfb.0.2023.01.17.15.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 15:10:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 03/22] tcg/ppc: Remove unused goto_tb code for indirect jump
Date: Tue, 17 Jan 2023 13:10:32 -1000
Message-Id: <20230117231051.354444-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117231051.354444-1-richard.henderson@linaro.org>
References: <20230117231051.354444-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 32 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index a95e4001d3..b72e266990 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2630,27 +2630,21 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        if (s->tb_jmp_insn_offset) {
-            /* Direct jump. */
-            if (TCG_TARGET_REG_BITS == 64) {
-                /* Ensure the next insns are 8 or 16-byte aligned. */
-                while ((uintptr_t)s->code_ptr & (have_isa_2_07 ? 15 : 7)) {
-                    tcg_out32(s, NOP);
-                }
-                s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
-                tcg_out32(s, ADDIS | TAI(TCG_REG_TB, TCG_REG_TB, 0));
-                tcg_out32(s, ADDI | TAI(TCG_REG_TB, TCG_REG_TB, 0));
-            } else {
-                s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
-                tcg_out32(s, B);
-                s->tb_jmp_reset_offset[args[0]] = tcg_current_code_size(s);
-                break;
+        qemu_build_assert(TCG_TARGET_HAS_direct_jump);
+        /* Direct jump. */
+        if (TCG_TARGET_REG_BITS == 64) {
+            /* Ensure the next insns are 8 or 16-byte aligned. */
+            while ((uintptr_t)s->code_ptr & (have_isa_2_07 ? 15 : 7)) {
+                tcg_out32(s, NOP);
             }
+            s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
+            tcg_out32(s, ADDIS | TAI(TCG_REG_TB, TCG_REG_TB, 0));
+            tcg_out32(s, ADDI | TAI(TCG_REG_TB, TCG_REG_TB, 0));
         } else {
-            /* Indirect jump. */
-            tcg_debug_assert(s->tb_jmp_insn_offset == NULL);
-            tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TB, 0,
-                       (intptr_t)(s->tb_jmp_insn_offset + args[0]));
+            s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
+            tcg_out32(s, B);
+            s->tb_jmp_reset_offset[args[0]] = tcg_current_code_size(s);
+            break;
         }
         tcg_out32(s, MTSPR | RS(TCG_REG_TB) | CTR);
         tcg_out32(s, BCCTR | BO_ALWAYS);
-- 
2.34.1


