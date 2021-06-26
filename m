Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8243B4D2D
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:44:30 +0200 (CEST)
Received: from localhost ([::1]:44074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx23J-0004qv-RT
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vm-0001vV-1m
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:42 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:46920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vj-0000JF-Fu
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:41 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso6828498pjp.5
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4KCDwZJhSGT/duEyI86xO9oE0EnQq4V9nCdC3oQPAkE=;
 b=mPK4r/wE7OfuSR4UCKF+HIkA7DZirt+d8zNEe2m23wWFfZQtHc3J/PQ+b5+QmEyjca
 9fdfWekE2IGqWLtER/M86jM55Zyos05b3LpBV9HlpHUN02RweXjLek+0Ljj0FMeka0X/
 +h/2EP8ZpS9enhqqSmsPGT8i8ZXz8xqi2t82kyqRYXJIA/xuFMsjV7h1NyCo2ZaOMVPb
 5H2+SFoO9w1BN7SHi3e+s1xgQzTY0KYLyFQuoxEK50LjLT9mgHYSHw626BTXVw21+AbP
 Ng/gSXkc4PvjwrGmmgt4P0NgkmD7E9B1IXomif3Aij2rfqvLBB76aCEZU4fdWefb7to9
 pkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4KCDwZJhSGT/duEyI86xO9oE0EnQq4V9nCdC3oQPAkE=;
 b=BkH+pfowjrHnwLeTKtoVWYoup8ctE5uU3xn1FjxABvtQCvD3XBHOjonrkPhcq2kQvn
 bmNWsCCHd9jq/L5PASByeVxg0BV+kP89U6kOt5zwhAJnirLNIhUKCKcrvc35zey7swj9
 YnBoD1xCMR0iPzEZcf05YW8P3jn5HQB+S5W3aDZoLexvBn/n4sA4CfTN9mR5lMDAWeMt
 dPDalRQZ3l8ogQa4pXh/cdKMmZm4KAhsXwFbmQCyA47iWJ0p165h/s8n7fe6XZ5lnJjG
 fc4ecPDy7c/f6WnqP2IxyrYjjN8RFhulICK3WoWoTKeGMDVPtt1lCOWFL7zf9pJUH1Zh
 3pgw==
X-Gm-Message-State: AOAM531Lx8CdGqnrfIYrVk8/JwahIEK0Ge8TU5wmSbQ8amvhTxU2G36y
 vBjw1c20jSw+JpfpLwuDcPUR5kqczW6jbw==
X-Google-Smtp-Source: ABdhPJy/llEx6hBMz6UqoZwU9w9Hczlbjkwh2S45qvCIUQUDAz4y5AvheLn8Rqh513/oat3LpTADUw==
X-Received: by 2002:a17:90a:7785:: with SMTP id
 v5mr26141363pjk.20.1624689398238; 
 Fri, 25 Jun 2021 23:36:38 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm7724201pgq.54.2021.06.25.23.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 23:36:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/29] tcg/ppc: Split out tcg_out_bswap32
Date: Fri, 25 Jun 2021 23:36:11 -0700
Message-Id: <20210626063631.2411938-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626063631.2411938-1-richard.henderson@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: qemu-ppc@nongnu.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index ad46ce32ca..28b8671cba 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -807,6 +807,27 @@ static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src)
     tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
 }
 
+static void tcg_out_bswap32(TCGContext *s, TCGReg dst, TCGReg src)
+{
+    TCGReg tmp = dst == src ? TCG_REG_R0 : dst;
+
+    /*
+     * Stolen from gcc's builtin_bswap32.
+     * In the following,
+     *   dep(a, b, m) -> (a & ~m) | (b & m)
+     *
+     * Begin with:                              src = xxxxabcd
+     */
+    /* tmp = rol32(src, 8) & 0xffffffff             = 0000bcda */
+    tcg_out_rlw(s, RLWINM, tmp, src, 8, 0, 31);
+    /* tmp = dep(tmp, rol32(src, 24), 0xff000000)   = 0000dcda */
+    tcg_out_rlw(s, RLWIMI, tmp, src, 24, 0, 7);
+    /* tmp = dep(tmp, rol32(src, 24), 0x0000ff00)   = 0000dcba */
+    tcg_out_rlw(s, RLWIMI, tmp, src, 24, 16, 23);
+
+    tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
+}
+
 /* Emit a move into ret of arg, if it can be done in one insn.  */
 static bool tcg_out_movi_one(TCGContext *s, TCGReg ret, tcg_target_long arg)
 {
@@ -2799,24 +2820,9 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_bswap16_i64:
         tcg_out_bswap16(s, args[0], args[1]);
         break;
-
     case INDEX_op_bswap32_i32:
     case INDEX_op_bswap32_i64:
-        /* Stolen from gcc's builtin_bswap32 */
-        a1 = args[1];
-        a0 = args[0] == a1 ? TCG_REG_R0 : args[0];
-
-        /* a1 = args[1] # abcd */
-        /* a0 = rotate_left (a1, 8) # bcda */
-        tcg_out_rlw(s, RLWINM, a0, a1, 8, 0, 31);
-        /* a0 = (a0 & ~0xff000000) | ((a1 r<< 24) & 0xff000000) # dcda */
-        tcg_out_rlw(s, RLWIMI, a0, a1, 24, 0, 7);
-        /* a0 = (a0 & ~0x0000ff00) | ((a1 r<< 24) & 0x0000ff00) # dcba */
-        tcg_out_rlw(s, RLWIMI, a0, a1, 24, 16, 23);
-
-        if (a0 == TCG_REG_R0) {
-            tcg_out_mov(s, TCG_TYPE_REG, args[0], a0);
-        }
+        tcg_out_bswap32(s, args[0], args[1]);
         break;
 
     case INDEX_op_bswap64_i64:
-- 
2.25.1


