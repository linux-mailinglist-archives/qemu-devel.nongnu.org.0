Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFFA3B4D27
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:39:56 +0200 (CEST)
Received: from localhost ([::1]:55960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx1yt-0002Q6-Ps
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vn-0001yG-0V
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:43 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vk-0000Je-5M
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:42 -0400
Received: by mail-pg1-x52b.google.com with SMTP id m2so10113642pgk.7
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ws9ROW8rbz4P5lFVUrXupQp9oqwT+htB4RqNqOUvE8Q=;
 b=ZDPsfKB1sKxdsBqml9VrSeXtLOPk3sDBmmzmArJLS+rLBw5QPZiovuryquV9Z8VZWK
 ELXdLq6Y7cir3bvVQuDx0fKvPtfuanMEHSZvgLqPgNZwnKeP0hCY3t0x06pEV8UWe7nN
 UTOR3QfCPLdU0sblZuxTVRpm4NEMkCLXY0ZI7xcGCrzyk/vcdUrUjmXS9BhH6kob7w3T
 DB2DQlabE74ipqLDPKT3KUkulNbDoC/8+gGU+QfUDz2WDmrz+b0MpPKpRAGnXdC4d9G6
 zsBiYGZcrL8mPnF5s0gd3EUtEpJm94Iqrdv11UR/xIPWZkmqkyWpjE5QzHzdoMa6oTdZ
 I4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ws9ROW8rbz4P5lFVUrXupQp9oqwT+htB4RqNqOUvE8Q=;
 b=Nl8xOXIJwXcmfuZB0MaHaFloOffBghT/4Z6vrOE9+27B7ge6mqwV4OTijPsgCSRT0D
 qhYcCg6xaaL0tyyfXRUY8/YpATJLcOPZ9mhUlwI9chm0tVHQIyy9KF5OvKnRhZQpArB6
 zM+BXIZxtptQHwEaSP3DXS2EuACLPyfn0+ilMlm6kwPI+Z4F8g7DYYpRrj/4L5iGP/ef
 Z8MyobSNQBzFG73UtVRViKUbapFJgq6TqySeukDalroaeebGfOnPoQcg7+/dUcywf/GX
 uLeUBlDlEGen69JpSbIzhGnPlyQOQjI7eNSROItXhdgf+QtxpOycfaBDoUPNfJuL2z4h
 cYFA==
X-Gm-Message-State: AOAM5316K2mI8Cwoucy7d+WR+HXztYPbmYyPSzVOAnVPmIzEu0F2cItA
 kimnUIyc4elNgaxMKJPkqGKUpLGyA9sHEA==
X-Google-Smtp-Source: ABdhPJwaHXjBv7M0bkHf0X2OAYuksWFHgubQjgB0J0ILFPAr8i4NUd4Rtu/aNsui8vbqF2OTWJvs+Q==
X-Received: by 2002:aa7:9e02:0:b029:309:c923:5068 with SMTP id
 y2-20020aa79e020000b0290309c9235068mr5323631pfq.30.1624689398811; 
 Fri, 25 Jun 2021 23:36:38 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm7724201pgq.54.2021.06.25.23.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 23:36:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/29] tcg/ppc: Split out tcg_out_bswap64
Date: Fri, 25 Jun 2021 23:36:12 -0700
Message-Id: <20210626063631.2411938-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626063631.2411938-1-richard.henderson@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 tcg/ppc/tcg-target.c.inc | 64 +++++++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 28b8671cba..da6d10722e 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -828,6 +828,39 @@ static void tcg_out_bswap32(TCGContext *s, TCGReg dst, TCGReg src)
     tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
 }
 
+static void tcg_out_bswap64(TCGContext *s, TCGReg dst, TCGReg src)
+{
+    TCGReg t0 = dst == src ? TCG_REG_R0 : dst;
+    TCGReg t1 = dst == src ? dst : TCG_REG_R0;
+
+    /*
+     * In the following,
+     *   dep(a, b, m) -> (a & ~m) | (b & m)
+     *
+     * Begin with:                              src = abcdefgh
+     */
+    /* t0 = rol32(src, 8) & 0xffffffff              = 0000fghe */
+    tcg_out_rlw(s, RLWINM, t0, src, 8, 0, 31);
+    /* t0 = dep(t0, rol32(src, 24), 0xff000000)     = 0000hghe */
+    tcg_out_rlw(s, RLWIMI, t0, src, 24, 0, 7);
+    /* t0 = dep(t0, rol32(src, 24), 0x0000ff00)     = 0000hgfe */
+    tcg_out_rlw(s, RLWIMI, t0, src, 24, 16, 23);
+
+    /* t0 = rol64(t0, 32)                           = hgfe0000 */
+    tcg_out_rld(s, RLDICL, t0, t0, 32, 0);
+    /* t1 = rol64(src, 32)                          = efghabcd */
+    tcg_out_rld(s, RLDICL, t1, src, 32, 0);
+
+    /* t0 = dep(t0, rol32(t1, 24), 0xffffffff)      = hgfebcda */
+    tcg_out_rlw(s, RLWIMI, t0, t1, 8, 0, 31);
+    /* t0 = dep(t0, rol32(t1, 24), 0xff000000)      = hgfedcda */
+    tcg_out_rlw(s, RLWIMI, t0, t1, 24, 0, 7);
+    /* t0 = dep(t0, rol32(t1, 24), 0x0000ff00)      = hgfedcba */
+    tcg_out_rlw(s, RLWIMI, t0, t1, 24, 16, 23);
+
+    tcg_out_mov(s, TCG_TYPE_REG, dst, t0);
+}
+
 /* Emit a move into ret of arg, if it can be done in one insn.  */
 static bool tcg_out_movi_one(TCGContext *s, TCGReg ret, tcg_target_long arg)
 {
@@ -2824,37 +2857,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_bswap32_i64:
         tcg_out_bswap32(s, args[0], args[1]);
         break;
-
     case INDEX_op_bswap64_i64:
-        a0 = args[0], a1 = args[1], a2 = TCG_REG_R0;
-        if (a0 == a1) {
-            a0 = TCG_REG_R0;
-            a2 = a1;
-        }
-
-        /* a1 = # abcd efgh */
-        /* a0 = rl32(a1, 8) # 0000 fghe */
-        tcg_out_rlw(s, RLWINM, a0, a1, 8, 0, 31);
-        /* a0 = dep(a0, rl32(a1, 24), 0xff000000) # 0000 hghe */
-        tcg_out_rlw(s, RLWIMI, a0, a1, 24, 0, 7);
-        /* a0 = dep(a0, rl32(a1, 24), 0x0000ff00) # 0000 hgfe */
-        tcg_out_rlw(s, RLWIMI, a0, a1, 24, 16, 23);
-
-        /* a0 = rl64(a0, 32) # hgfe 0000 */
-        /* a2 = rl64(a1, 32) # efgh abcd */
-        tcg_out_rld(s, RLDICL, a0, a0, 32, 0);
-        tcg_out_rld(s, RLDICL, a2, a1, 32, 0);
-
-        /* a0 = dep(a0, rl32(a2, 8), 0xffffffff)  # hgfe bcda */
-        tcg_out_rlw(s, RLWIMI, a0, a2, 8, 0, 31);
-        /* a0 = dep(a0, rl32(a2, 24), 0xff000000) # hgfe dcda */
-        tcg_out_rlw(s, RLWIMI, a0, a2, 24, 0, 7);
-        /* a0 = dep(a0, rl32(a2, 24), 0x0000ff00) # hgfe dcba */
-        tcg_out_rlw(s, RLWIMI, a0, a2, 24, 16, 23);
-
-        if (a0 == 0) {
-            tcg_out_mov(s, TCG_TYPE_REG, args[0], a0);
-        }
+        tcg_out_bswap64(s, args[0], args[1]);
         break;
 
     case INDEX_op_deposit_i32:
-- 
2.25.1


