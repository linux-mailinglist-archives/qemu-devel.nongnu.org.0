Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9FB5108D9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:19:47 +0200 (CEST)
Received: from localhost ([::1]:45818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQiw-00018C-BN
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPpw-0001po-7n
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:22:56 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:44835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPpu-0005PE-EQ
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:22:55 -0400
Received: by mail-pg1-x52e.google.com with SMTP id v10so5647632pgl.11
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=puwqanA1QPFvLkvLJfGYt1sTnByIkGWrO6X4uNsWXMs=;
 b=EH+jfnIkVys1xf9YxFCfF3rIQnJvYCwB6q6YEhHGzR8ZIS+g4QBkI54ah6lKnHVxd4
 YGH+6XKYEibbjyxO5xA1nX7nqtyJ+jp/70YWANOJD6WLQwo7X3uxJbe1I13ix9AVMOQA
 1Le4Lj6q7nqaMzZsmUvPLBmxo/Att2NaXcZKyqATfSZl/cCcbUP7IJgLJAvWKe+gkWMO
 uX5N7L/LELSS50yrTj8ix9Sd99yv746GjQFEm0lzq4Y+cy29FHLVigECX0P/hxRuJ7FL
 Ucb0eKseQMzeTHCAWG7N42mGn6Mcc20zaNg2TwqtO0/w4VkmrWsya0gNeqeLzWG56Y7R
 +FwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=puwqanA1QPFvLkvLJfGYt1sTnByIkGWrO6X4uNsWXMs=;
 b=p/bTtkuv9FKAUWKmIpLhq/FIjlLhjzvdwC4DbbPYs2htJ8V2y+yUekDG40Cep9ewEr
 ONSll0uF07LlY2qoFiK5sa9k0Mab7f3Bm0K/v2MqhUQFFLSgj0p2wowCVeGbjVYuSiwd
 +a3iqWTNjiB+/yEYPiUq3mynwD7kW0LrYlMbfFxlFLDLCE5k2urwYKJ2igmX8TwkGaQL
 h2GWosqddn/KeSm4Eqms5kE2Z2fb7seAtHFDm9dGbeUmUAYaHyWX/yIVg9U+UAb952ED
 QGgF+XBA2uuvk05Jq1bVIsnrroBqNhN5CR5vdsKZbDDN7y1CPSuSHmhv3sP/rtXl6Qq5
 wQBg==
X-Gm-Message-State: AOAM532y3ysYE1xhPXu4uydwsvhD/kFb9KOYsPkPq/ueusaHbWjbCd5A
 3d8BnIjmtM/P69Ee7y7kYBAHonZJq/cHSQ==
X-Google-Smtp-Source: ABdhPJy/MkNcGLhleC+HdidGIi9Kg10gJ24MXsiyHzyW8czMaBC5HwA+rSfB/nrEUruyZuXd1M/1GA==
X-Received: by 2002:a63:ee0d:0:b0:39d:8637:6706 with SMTP id
 e13-20020a63ee0d000000b0039d86376706mr20725966pgi.510.1650997373070; 
 Tue, 26 Apr 2022 11:22:53 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b003983a01b896sm13585053pgc.90.2022.04.26.11.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:22:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 48/68] target/nios2: Split out helpers for gen_rr_shift
Date: Tue, 26 Apr 2022 11:18:47 -0700
Message-Id: <20220426181907.103691-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

Do as little work as possible within the macro.
Split out helper functions and pass in arguments instead.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 5979427c8e..f2dcaa3fbb 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -690,23 +690,28 @@ gen_rr_mul_high(mulxss, muls2)
 gen_rr_mul_high(mulxuu, mulu2)
 gen_rr_mul_high(mulxsu, mulsu2)
 
-#define gen_r_shift_s(fname, insn)                                         \
-static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)       \
-{                                                                          \
-    R_TYPE(instr, (code));                                                 \
-    if (likely(instr.c != R_ZERO)) {                                       \
-        TCGv t0 = tcg_temp_new();                                          \
-        tcg_gen_andi_tl(t0, load_gpr((dc), instr.b), 31);                  \
-        tcg_gen_##insn(cpu_R[instr.c], load_gpr((dc), instr.a), t0);       \
-        tcg_temp_free(t0);                                                 \
-    }                                                                      \
+static void do_rr_shift(DisasContext *dc, uint32_t insn, GenFn3 *fn)
+{
+    R_TYPE(instr, insn);
+
+    if (likely(instr.c != R_ZERO)) {
+        TCGv sh = tcg_temp_new();
+
+        tcg_gen_andi_tl(sh, load_gpr(dc, instr.b), 31);
+        fn(cpu_R[instr.c], load_gpr(dc, instr.a), sh);
+        tcg_temp_free(sh);
+    }
 }
 
-gen_r_shift_s(sra, sar_tl)
-gen_r_shift_s(srl, shr_tl)
-gen_r_shift_s(sll, shl_tl)
-gen_r_shift_s(rol, rotl_tl)
-gen_r_shift_s(ror, rotr_tl)
+#define gen_rr_shift(fname, insn)                                           \
+    static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)    \
+    { do_rr_shift(dc, code, tcg_gen_##insn##_tl); }
+
+gen_rr_shift(sra, sar)
+gen_rr_shift(srl, shr)
+gen_rr_shift(sll, shl)
+gen_rr_shift(rol, rotl)
+gen_rr_shift(ror, rotr)
 
 static void divs(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-- 
2.34.1


