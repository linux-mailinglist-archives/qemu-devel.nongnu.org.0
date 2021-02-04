Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7E230EA60
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:46:18 +0100 (CET)
Received: from localhost ([::1]:50938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Uev-0006qa-TK
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:46:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tk3-0006Ke-Ld
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:31 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:43296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tjt-0004DG-Ho
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:31 -0500
Received: by mail-pg1-x52f.google.com with SMTP id n10so1017520pgl.10
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6fN3MzHzuWIrC3R6bdCZxAnV3xyNnPemffGo42IAOp8=;
 b=xkvRnbgWZeun6WPN2tb/1XcIyq7nwXk6TRMtnW3lWzWUgj7533DS+qXjYyvhmi+t1H
 iKh7ZYGF+oaBNEkWL9+9QtLSND/SZQAlW35PkpB8XzhyuYAujiaVH2+q7pzoD0iLXJsu
 x3GD5R6ocb/jbTF5OfWwtm/UoyXmdSObOCRJUOI4ZN3lZOosBEUHU2vTScwQXkpKtGdL
 8rICHYrITT7ip7Sm6/MA8sQw+Fz3rj7tkqkK8nQYwlAB+Wi2QLfbH1LaPORcwLNf1FcJ
 KZPGexkCPk9T6x9KMHjSVzP9SsZ2PJbMx1xzYhoZy7XFQxFxfiKL/dLazfsLZZoEHFtj
 ScKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6fN3MzHzuWIrC3R6bdCZxAnV3xyNnPemffGo42IAOp8=;
 b=uLMKslAsZMbkDuLgVgvfWA+PiDU9N6Tiebwf/C3sz1aEK6Dh7CqPoqN3tPDo0yEe44
 HG3bjcyxMAD4clMVEZ09GiguQ0FPknn4/ROJscW/bzj9DHOhGb16nMWiuqRQsCFGT+bc
 KRf1l95V/XFLCxoOlcx6KzR/1oE9z/8INQb92upeyYoLVplLVAKk7H6Whyky2VSWqsfE
 Pcr5FLnNw+iR4Xu8qKwx9MZOL1NL3g+ZQGgfxzuAbTosxPO7EVRqo3uSIm3M8zxmJgaT
 4AOTlc0xXS0YVDrm14d6N/0a7rLBmubx2r/V222fRMG7TZAEUGX1eYiFKXvhCNyut86G
 Pung==
X-Gm-Message-State: AOAM533zI8wYQiLFGnoT1/NO6vLWRQvLMPdlAyiEh8TpSLiOzfHvxE6a
 Yz0C5/1+tqjEK6VinvsNvQ75yl13w5XTKgd4
X-Google-Smtp-Source: ABdhPJyCVteZ6xwL1danXEXLagKHPeiZx0dPREJSJGlmm2kSQ6pk7PfkZ2/s2I4urJsm3cW8vp1f4Q==
X-Received: by 2002:a63:4c0e:: with SMTP id z14mr6535732pga.408.1612403239353; 
 Wed, 03 Feb 2021 17:47:19 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:47:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 74/93] tcg/tci: Split out tcg_out_op_rrrbb
Date: Wed,  3 Feb 2021 15:44:50 -1000
Message-Id: <20210204014509.882821-75-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 8eda159dde..6c743a8fbd 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -355,6 +355,21 @@ static void tcg_out_op_rrrc(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrrbb(TCGContext *s, TCGOpcode op, TCGReg r0,
+                             TCGReg r1, TCGReg r2, uint8_t b3, uint8_t b4)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out8(s, b3);
+    tcg_out8(s, b4);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 #if TCG_TARGET_REG_BITS == 32
 static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
@@ -538,7 +553,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     CASE_32_64(deposit)  /* Optional (TCG_TARGET_HAS_deposit_*). */
-        tcg_out_op_t(s, opc);
         {
             TCGArg pos = args[3], len = args[4];
             TCGArg max = opc == INDEX_op_deposit_i32 ? 32 : 64;
@@ -546,13 +560,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
             tcg_debug_assert(pos < max);
             tcg_debug_assert(pos + len <= max);
 
-            tcg_out_r(s, args[0]);
-            tcg_out_r(s, args[1]);
-            tcg_out_r(s, args[2]);
-            tcg_out8(s, pos);
-            tcg_out8(s, len);
+            tcg_out_op_rrrbb(s, opc, args[0], args[1], args[2], pos, len);
         }
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
 
     CASE_32_64(brcond)
-- 
2.25.1


