Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D99337680
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:08:06 +0100 (CET)
Received: from localhost ([::1]:48376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMuz-00012x-Q8
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:08:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUn-0003p7-76
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:01 -0500
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:33786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUY-0006cf-Pw
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:00 -0500
Received: by mail-qk1-x72e.google.com with SMTP id l4so20794511qkl.0
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kpfe6JZmwXM15Cw7O9Ulgnnkm0DVoqv1s4+DGCwKajc=;
 b=BM1SzYEtyjptmduTwQ6JgEZP09novekLq3uO1o21XMCfsnLR6dKY+gPf/hhvDnq+PQ
 2xbCAeuEVn6OP9jGNTmpnSX7FkDgEr+DjdulAHoYdsHAG6Q90rdwNo0Rw2c4bOgPRLrW
 5qwQGtHwS7hhMkmmru1lWFJqejplv1oBqhcbDxwRv5l2rm5dHX4A7eNR3DrUKX2E6Ru3
 wxTwuSQP9cHKyOdb/rra0Inmvrwc9ayHzbyzkeeAPbmVHEyjAU2xDj+/dcAbQaBC5768
 Ai7vQJFj7LFLISCGnqknCap8YyKrnLgjmgohdt41Xgq1qN/s7PMqnhZASbOO18pE3kp+
 C5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kpfe6JZmwXM15Cw7O9Ulgnnkm0DVoqv1s4+DGCwKajc=;
 b=VVGSBjMJ2V7JsDmqpIaUTzhD2ScIJZqHM364n8PiUHE7M0Px+ocx+SSpipfuIIVa+f
 q82R4geJM1n4/ed/eQ5HHYK6uUMl33t+y+n9Zi+QhlMg5Dpd8pCo633cuUJXIm3sG8M/
 KfGWlRWu6/1G8ZPB0AX5mye51HU2hnvR/PLYsKy8mGPNzHQKCBLcRJXdJhQXCQpyevwM
 l+ZudPHQMmllI0JVDhas5+FTaN5GHIoBDnyiUmLeQ8cgBeuycYerw9bCrlBP9yehofrb
 p+PHjc2M6o3NQWUuCTkZFS8GHreIFsV/hTHTbj9689w32qfXEsRnAJG5leba5A9Mn7pz
 rTmQ==
X-Gm-Message-State: AOAM530LpjsNP4Poqr+hb9s+xDISZX3elHmK2zqY89cYRPDRSTV4IakM
 uQBupBA1OjytaeEo7+FUYqrthplS1uFDLHjF
X-Google-Smtp-Source: ABdhPJypXXvrEECWIY/qZMcNHexM6fBQgtEr0FUZ7QWDtHP7bR/ahZon477oPFdMQcVO5Ok4bXCYtQ==
X-Received: by 2002:a37:4b45:: with SMTP id y66mr7911064qka.179.1615473642537; 
 Thu, 11 Mar 2021 06:40:42 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 30/57] tcg/tci: Split out tcg_out_op_rr
Date: Thu, 11 Mar 2021 08:39:31 -0600
Message-Id: <20210311143958.562625-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the same time, validate the type argument in tcg_out_mov.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index cb0cbbb8da..272e3ca70b 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -303,6 +303,17 @@ static void tcg_out_op_p(TCGContext *s, TCGOpcode op, void *p0)
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rr(TCGContext *s, TCGOpcode op, TCGReg r0, TCGReg r1)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
                            TCGReg r0, TCGReg r1, intptr_t i2)
 {
@@ -337,16 +348,18 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
 
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
-    tcg_debug_assert(ret != arg);
-#if TCG_TARGET_REG_BITS == 32
-    tcg_out_op_t(s, INDEX_op_mov_i32);
-#else
-    tcg_out_op_t(s, INDEX_op_mov_i64);
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_out_op_rr(s, INDEX_op_mov_i32, ret, arg);
+        break;
+#if TCG_TARGET_REG_BITS == 64
+    case TCG_TYPE_I64:
+        tcg_out_op_rr(s, INDEX_op_mov_i64, ret, arg);
+        break;
 #endif
-    tcg_out_r(s, ret);
-    tcg_out_r(s, arg);
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+    default:
+        g_assert_not_reached();
+    }
     return true;
 }
 
@@ -534,10 +547,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     CASE_32_64(bswap16)  /* Optional (TCG_TARGET_HAS_bswap16_*). */
     CASE_32_64(bswap32)  /* Optional (TCG_TARGET_HAS_bswap32_*). */
     CASE_64(bswap64)     /* Optional (TCG_TARGET_HAS_bswap64_i64). */
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rr(s, opc, args[0], args[1]);
         break;
 
 #if TCG_TARGET_REG_BITS == 32
-- 
2.25.1


