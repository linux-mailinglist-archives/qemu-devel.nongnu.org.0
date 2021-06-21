Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B947D3AF940
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:24:33 +0200 (CEST)
Received: from localhost ([::1]:42560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTHM-0002iH-Mc
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC3-0000ko-8H
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:03 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:44908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTBx-0005us-5L
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:02 -0400
Received: by mail-pf1-x434.google.com with SMTP id u18so9489299pfk.11
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fXrizxcUnvvf6PXr7Yc72AhaPXA1gSYgiDq85iqI09c=;
 b=NOzJzQ1rK4iVrOabtS+/jX4IvUkap8Wo9jTJdUqfyPg1fNfNw3f8NCIoazY1XBuq2Z
 OZQNhHykQ/PzFO8PSNtSCA4Ihy/mrZCTAj9B9LDpzsByV+dsw9wUZEAlCcmZl4qgEa6D
 AtIxlTY91NBcymHrtXgRe1tnQ6KjiD1tKKuYV5XF4jmmmujNtxhpBSXFS+wTz9/MdMlF
 J/z8UNA632IgXQQs5ACxOkZNn3x6NX0q92GXlZ+JLX7YSa6mtKRjIuSRm9E/9+sE6Lfu
 +URtWSL3T6MWGO2BYW77w7xmKCQu4SWGJ2V0/SZH4AW5BpEd47Y6YaOeUv+/lKDTDntW
 ez+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fXrizxcUnvvf6PXr7Yc72AhaPXA1gSYgiDq85iqI09c=;
 b=FFlm9NdUvJj7J11qceE/78zDv1Hm9bqzaiDFy3MzvE2yMlBqyuORwA2iHK060l99tB
 6ZUVX55mTxWhSexLOMiLuMu53CCzBbfWMynPn88iAbS1YDxTJvMY0izkYvGO/eI+mi+f
 bfi+n4hf1K4E8Nbhu6B0HjVHP34kvLWAlfIYca52mxdtH85HJdE12FtL+QhS52G0Xeji
 75rgEnk7zsrOaJ/AwGOMNE+r+fCWmNm3kPDIZQDlG0akn/IyCqEnHinbh1uLup1hvtqG
 k0y9ajWJZzQ4sEnOheoNKhRe3/d8yIPSvbB+CzBzor2krx0/SOWrf9d3VQcmhqGlZYHT
 Vbww==
X-Gm-Message-State: AOAM531pn6xj5uLazDCls8ZaY1uzD5phMAV0TiIf9gmCqFeohr3rE+Db
 1YlW+L4QAYBmYs6CHayTl82I+HOgbCbDxQ==
X-Google-Smtp-Source: ABdhPJwQPy9PHZ/X4dXkP+/iTdk4BpJKD+A0gQcU9WqDO/smNfCHwh1R2hvOSqWaq2lSx0DlZPe2Nw==
X-Received: by 2002:a63:4906:: with SMTP id w6mr849139pga.212.1624317535909;
 Mon, 21 Jun 2021 16:18:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:18:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/29] tcg/ppc: Split out tcg_out_sari{32,64}
Date: Mon, 21 Jun 2021 16:18:27 -0700
Message-Id: <20210621231849.1871164-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621231849.1871164-1-richard.henderson@linaro.org>
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will shortly require sari in other context;
split out both for cleanliness sake.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index aa35ff8250..50347182d7 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -768,6 +768,12 @@ static inline void tcg_out_shli64(TCGContext *s, TCGReg dst, TCGReg src, int c)
     tcg_out_rld(s, RLDICR, dst, src, c, 63 - c);
 }
 
+static inline void tcg_out_sari32(TCGContext *s, TCGReg dst, TCGReg src, int c)
+{
+    /* Limit immediate shift count lest we create an illegal insn.  */
+    tcg_out32(s, SRAWI | RA(dst) | RS(src) | SH(c & 31));
+}
+
 static inline void tcg_out_shri32(TCGContext *s, TCGReg dst, TCGReg src, int c)
 {
     tcg_out_rlw(s, RLWINM, dst, src, 32 - c, c, 31);
@@ -778,6 +784,11 @@ static inline void tcg_out_shri64(TCGContext *s, TCGReg dst, TCGReg src, int c)
     tcg_out_rld(s, RLDICL, dst, src, 64 - c, c);
 }
 
+static inline void tcg_out_sari64(TCGContext *s, TCGReg dst, TCGReg src, int c)
+{
+    tcg_out32(s, SRADI | RA(dst) | RS(src) | SH(c & 0x1f) | ((c >> 4) & 2));
+}
+
 /* Emit a move into ret of arg, if it can be done in one insn.  */
 static bool tcg_out_movi_one(TCGContext *s, TCGReg ret, tcg_target_long arg)
 {
@@ -2601,8 +2612,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_sar_i32:
         if (const_args[2]) {
-            /* Limit immediate shift count lest we create an illegal insn.  */
-            tcg_out32(s, SRAWI | RS(args[1]) | RA(args[0]) | SH(args[2] & 31));
+            tcg_out_sari32(s, args[0], args[1], args[2]);
         } else {
             tcg_out32(s, SRAW | SAB(args[1], args[0], args[2]));
         }
@@ -2690,8 +2700,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_sar_i64:
         if (const_args[2]) {
-            int sh = SH(args[2] & 0x1f) | (((args[2] >> 5) & 1) << 1);
-            tcg_out32(s, SRADI | RA(args[0]) | RS(args[1]) | sh);
+            tcg_out_sari64(s, args[0], args[1], args[2]);
         } else {
             tcg_out32(s, SRAD | SAB(args[1], args[0], args[2]));
         }
-- 
2.25.1


