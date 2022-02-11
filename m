Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CC14B1BEA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 03:07:45 +0100 (CET)
Received: from localhost ([::1]:54948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nILLd-0007Ri-07
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 21:07:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKo6-0005Uh-Ik
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:33:06 -0500
Received: from [2607:f8b0:4864:20::102a] (port=50721
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnz-0007TV-Ca
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:33:06 -0500
Received: by mail-pj1-x102a.google.com with SMTP id m7so6793928pjk.0
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gnA8hzIESQl5O1aIfCztJlw8cTUepzPhnQX56XahBLg=;
 b=B9GCi5THLac5y9J1TUd45HvlxD2Tr6LPbXYWHjkP7XcyBp/c5v65PAiTv6TzZkcjki
 EVoLQKrSUc1kAmdT3l37lHOSmlZs55+UP73wVFaxDCjICLVUy/WEJVF8WAoK1EBMivj6
 N28tfiX7ceE1tDeKi3y035mT2YQCNicam1IP+pPU5InUSxoO+h2jMTIRj+yG8ktfYBPc
 usG8Nxv/11Y3MWkFYB5+MqcUoPeOFRElvfodR7cUX36Rg/slYIyra9A6BT5UVQ30W7Od
 GjnwZj1pa3ZoYPbuGguqg1kENvG0wADtPq5vqWvTQNKCRZlYxAB9YYTL+KzksbWgmOoG
 XZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gnA8hzIESQl5O1aIfCztJlw8cTUepzPhnQX56XahBLg=;
 b=ns8/y3tg9JNEc6mLYonyCoR4fraRvY6UcISTx/HwyNiLbCAGRg+VoZy8Ps8nsg7EOI
 pu3+xa7TC+GL78Mzo6Q6Vr17WRDkwiRlSTIaPc8/a1Swuw3uYzbVkcm99nbEK0KZMXrf
 f3wICZBuDw33vCU2eGwaxaPw/nw60Abf48yyNoP26p2vikTbzPacfkmCjOshTZUGS4jy
 Lz6AJrvd6gDWXBGgMBVbQ6SAYmNzdMp34VZDkVfMbVLi2LnE2AlyOdVbnJfwNTEkW9Jo
 fdNEnCLh3Lrt04dXj12tDPA9bqYX413misfDO+oETRqWSp9OLB2k8I7zuE0NO1jOPZkX
 OQ9Q==
X-Gm-Message-State: AOAM531pqzyLkLw8r1QzPkC26pnGaMwDzxI9fto47ScdYSHFokLY4lGr
 wDKNu9L0puKtkNlw74GPaYRLApjFzoy+/w4H
X-Google-Smtp-Source: ABdhPJzha7Z7vuKaleBpI/k7GSeDZUdIh+7qr7ugcYHosvsoSD3Ejyqca0aDg63Dj+SAZy6sQAxJbw==
X-Received: by 2002:a17:902:8609:: with SMTP id
 f9mr9949638plo.80.1644543163026; 
 Thu, 10 Feb 2022 17:32:43 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:32:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/34] tcg/sparc: Split out tcg_out_movi_imm32
Date: Fri, 11 Feb 2022 12:30:52 +1100
Message-Id: <20220211013059.17994-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Handle 32-bit constants with a separate function, so that
tcg_out_movi_int does not need to recurse.  This slightly
rearranges the order of tests for small constants, but
produces the same output.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 8d5992ef29..2f7c8dcb0a 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -413,15 +413,30 @@ static void tcg_out_movi_imm13(TCGContext *s, TCGReg ret, int32_t arg)
     tcg_out_arithi(s, ret, TCG_REG_G0, arg, ARITH_OR);
 }
 
+static void tcg_out_movi_imm32(TCGContext *s, TCGReg ret, int32_t arg)
+{
+    if (check_fit_i32(arg, 13)) {
+        /* A 13-bit constant sign-extended to 64-bits.  */
+        tcg_out_movi_imm13(s, ret, arg);
+    } else {
+        /* A 32-bit constant zero-extended to 64 bits.  */
+        tcg_out_sethi(s, ret, arg);
+        if (arg & 0x3ff) {
+            tcg_out_arithi(s, ret, ret, arg & 0x3ff, ARITH_OR);
+        }
+    }
+}
+
 static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
                              tcg_target_long arg, bool in_prologue)
 {
     tcg_target_long hi, lo = (int32_t)arg;
     tcg_target_long test, lsb;
 
-    /* Make sure we test 32-bit constants for imm13 properly.  */
-    if (type == TCG_TYPE_I32) {
-        arg = lo;
+    /* A 32-bit constant, or 32-bit zero-extended to 64-bits.  */
+    if (type == TCG_TYPE_I32 || arg == (uint32_t)arg) {
+        tcg_out_movi_imm32(s, ret, arg);
+        return;
     }
 
     /* A 13-bit constant sign-extended to 64-bits.  */
@@ -439,15 +454,6 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
         }
     }
 
-    /* A 32-bit constant, or 32-bit zero-extended to 64-bits.  */
-    if (type == TCG_TYPE_I32 || arg == (uint32_t)arg) {
-        tcg_out_sethi(s, ret, arg);
-        if (arg & 0x3ff) {
-            tcg_out_arithi(s, ret, ret, arg & 0x3ff, ARITH_OR);
-        }
-        return;
-    }
-
     /* A 32-bit constant sign-extended to 64-bits.  */
     if (arg == lo) {
         tcg_out_sethi(s, ret, ~arg);
@@ -471,13 +477,13 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     /* A 64-bit constant decomposed into 2 32-bit pieces.  */
     if (check_fit_i32(lo, 13)) {
         hi = (arg - lo) >> 32;
-        tcg_out_movi(s, TCG_TYPE_I32, ret, hi);
+        tcg_out_movi_imm32(s, ret, hi);
         tcg_out_arithi(s, ret, ret, 32, SHIFT_SLLX);
         tcg_out_arithi(s, ret, ret, lo, ARITH_ADD);
     } else {
         hi = arg >> 32;
-        tcg_out_movi(s, TCG_TYPE_I32, ret, hi);
-        tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_T2, lo);
+        tcg_out_movi_imm32(s, ret, hi);
+        tcg_out_movi_imm32(s, TCG_REG_T2, lo);
         tcg_out_arithi(s, ret, ret, 32, SHIFT_SLLX);
         tcg_out_arith(s, ret, ret, TCG_REG_T2, ARITH_OR);
     }
-- 
2.25.1


