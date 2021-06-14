Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B278C3A5E83
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:44:33 +0200 (CEST)
Received: from localhost ([::1]:56990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiCu-00064G-NM
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6t-0002GG-O6
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:19 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:44826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6i-0003Yw-Vc
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:19 -0400
Received: by mail-pl1-x62f.google.com with SMTP id b12so6150998plg.11
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=W1aURk4AJbewcgeEluJrf0o5H8N61Ouoo0K7e9Jqy7w=;
 b=KXvZtjCfUhlAa4vzah3XrBukd2wIUlzFCFPjgSRC1uTyVwKWxEG6930xOcjbec1ANr
 wLDT5f8pgApPc0QieRufNiLFIB4j20x8v//GJe++0pUeeuvtj5x0ywwm3PT6ODXVtmSL
 iByo1yjo8fuPeLFwmWEVRRhT0AmWtsM9tWTeHsnj4CKjlnXawlUYV+TBeWFPOOxzRUuU
 kvYkU12V0J/Oea6yJAP+dM6mgUAKGyzJlQJ2YUZwg03Flkz/1FE+5FN6fi53mI078ALE
 zD2aB4F/5h8HknwFrxY8lj3braV/kD5mFcbM+fWkPq67OXlGbVj0h03AkWWku8+NamGc
 OyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W1aURk4AJbewcgeEluJrf0o5H8N61Ouoo0K7e9Jqy7w=;
 b=qIShkWlQmm7hb9A6i4cSxf0XEyX4pVysl5TR8jvyy5Dj2OeDHRvILfk9IB+O1MXDHv
 v65+58Vyiu+/OCH7vNCsM2GSdpkoQ8Q4MuhcF+QqcPGgZ2QaJ2oKVsVCn/lMX8zhuh/y
 mcgWVf9cViuz+tpNL7/H6dX2Itaf5xeRiLbbPYzm22l9BpKSOnEEaJOzLEDbVw4euqGi
 u61SAc1eOONQ01YKRbxVLlrVzSkXCvWSC6go402OgJTJc5dLR3Llu3fZIAMr1USA8VPR
 oz09XFRjSDcRTlkczGrb9sEHaLK3Xv9RM2Aj3D5T+yIrl7ym55ReU5FeWU+RGUn0V3vO
 Q2VA==
X-Gm-Message-State: AOAM533vQoJIgcG7lWG5a58oAEenS2EmFyhrDW/HdGjoclw/9z0f88Uo
 Ps1IXXDUxAOqvx2FS2FO2jCapmYvI7A+jg==
X-Google-Smtp-Source: ABdhPJwFtkV0IZmIicdHzb/KQPsNL5A7NBchk87Mqx6/hzy9Vr2zn48q5LbSjSt4DzdAnYxdqzk8rg==
X-Received: by 2002:a17:90a:2d8e:: with SMTP id
 p14mr17339899pjd.131.1623659887699; 
 Mon, 14 Jun 2021 01:38:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/28] tcg/ppc: Support bswap flags
Date: Mon, 14 Jun 2021 01:37:42 -0700
Message-Id: <20210614083800.1166166-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For INDEX_op_bswap32_i32, pass 0 for flags: input not zero-extended,
output does not need extension within the host 64-bit register.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 38 +++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 690c77b4da..e868417168 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -788,25 +788,35 @@ static inline void tcg_out_sari64(TCGContext *s, TCGReg dst, TCGReg src, int c)
     tcg_out32(s, SRADI | RA(dst) | RS(src) | SH(c & 0x1f) | ((c >> 4) & 2));
 }
 
-static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src)
+static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src, int flags)
 {
     TCGReg tmp = dst == src ? TCG_REG_R0 : dst;
 
-                                                   /* src = abcd */
-    tcg_out_rlw(s, RLWINM, tmp, src, 24, 24, 31);  /* tmp = 000c */
-    tcg_out_rlw(s, RLWIMI, tmp, src, 8, 16, 23);   /* tmp = 00dc */
-    tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
+                                                   /* src = xxxx abcd */
+    tcg_out_rlw(s, RLWINM, tmp, src, 24, 24, 31);  /* tmp = 0000 000c */
+    tcg_out_rlw(s, RLWIMI, tmp, src, 8, 16, 23);   /* tmp = 0000 00dc */
+
+    if (flags & TCG_BSWAP_OS) {
+        tcg_out_ext16s(s, dst, tmp);
+    } else {
+        tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
+    }
 }
 
-static void tcg_out_bswap32(TCGContext *s, TCGReg dst, TCGReg src)
+static void tcg_out_bswap32(TCGContext *s, TCGReg dst, TCGReg src, int flags)
 {
     TCGReg tmp = dst == src ? TCG_REG_R0 : dst;
 
-    /* Stolen from gcc's builtin_bswap32.             src = abcd */
-    tcg_out_rlw(s, RLWINM, tmp, src, 8, 0, 31);    /* tmp = bcda */
-    tcg_out_rlw(s, RLWIMI, tmp, src, 24, 0, 7);    /* tmp = dcda */
-    tcg_out_rlw(s, RLWIMI, tmp, src, 24, 16, 23);  /* tmp = dcba */
-    tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
+    /* Stolen from gcc's builtin_bswap32.             src = xxxx abcd */
+    tcg_out_rlw(s, RLWINM, tmp, src, 8, 0, 31);    /* tmp = 0000 bcda */
+    tcg_out_rlw(s, RLWIMI, tmp, src, 24, 0, 7);    /* tmp = 0000 dcda */
+    tcg_out_rlw(s, RLWIMI, tmp, src, 24, 16, 23);  /* tmp = 0000 dcba */
+
+    if (flags & TCG_BSWAP_OS) {
+        tcg_out_ext32s(s, dst, tmp);
+    } else {
+        tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
+    }
 }
 
 static void tcg_out_bswap64(TCGContext *s, TCGReg dst, TCGReg src)
@@ -2820,11 +2830,13 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_bswap16_i32:
     case INDEX_op_bswap16_i64:
-        tcg_out_bswap16(s, args[0], args[1]);
+        tcg_out_bswap16(s, args[0], args[1], args[2]);
         break;
     case INDEX_op_bswap32_i32:
+        tcg_out_bswap32(s, args[0], args[1], 0);
+        break;
     case INDEX_op_bswap32_i64:
-        tcg_out_bswap32(s, args[0], args[1]);
+        tcg_out_bswap32(s, args[0], args[1], args[2]);
         break;
     case INDEX_op_bswap64_i64:
         tcg_out_bswap64(s, args[0], args[1]);
-- 
2.25.1


