Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820B83AF960
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:30:46 +0200 (CEST)
Received: from localhost ([::1]:36840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTNN-0000pD-Fc
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:30:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC1-0000fb-J0
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:01 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:46872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTBy-0005vz-FF
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:01 -0400
Received: by mail-pg1-x534.google.com with SMTP id n12so6659962pgs.13
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=geg8YV4vkZJiwMubrDP+L2xIQBW7poD/N+KgWkQ7RQQ=;
 b=fwAfAAcO8fHCoqYhxKl6HftvcKZ7pJw0Uy8Jy2O2U+q8PwImclLjkF+6q7Ibm4IYT4
 jtxl0M2BH6QXZDXjRwxgCFVXVZlKG4iynGCzgmgg75NWVtLIJJ0DR6uss7nRAf2cKUez
 bJ7PuWL1+Dhnkh6u3gbNmdf35lega8db1nYOrh/5/BzM/PXvy0nE2WCbYIv1Wjw5yE81
 KuASLKZojxrObcPvmQCSnhSWikoyFSJqff65Zb/QrTXA7sv/kH0C4rQosgG+VZf8Pocz
 oAdhdQOAUMCSxD8DU+Q6L/yFw+aTxWcCP+zpRIy91Nybf9KXahjpLNkSYri6pVygLEW7
 Xkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=geg8YV4vkZJiwMubrDP+L2xIQBW7poD/N+KgWkQ7RQQ=;
 b=Tvn0ZaW1VsVqPHnJ2/mGJOaR3kBOutvDcUtUaQ2veRP8i1PQKXsqYNPkhasbZvC8AH
 an3HD3Knaip6htBXvAl2DzHKPjMrEuH7vLk4uelhFds1ggZG4pXHmSgMDbwaQiKNNhjY
 c1V8tt2XCG6jGXL5+3ceog7TxlVGYsSDca3MdUiC8BGGUPIZXq7b37L/BAADZgEr3EQs
 CvWKoJ8Zn5QvAhxtcpL8/+GjGlvAWGraMw58EqMAXhVijXpIxGa5g6fcANHxKsW0aqX2
 ug55NL0iPfQgBlBcVJ7zlC6NUVdAEC/FOqNTi8SYH3sbWpihh4bJizs42vW94KpQFtaz
 VEcg==
X-Gm-Message-State: AOAM5305HhZed05rp+ikWxOO07Euj+UNhitK1k/bV/+wyIecTq0HLKzY
 ASOICzYppE/VpMnRuyvM9f/l5vg+mYM1Gg==
X-Google-Smtp-Source: ABdhPJyB6wgVnVXKMsqYAhpWd+XzpZ6e8A2agBWI5668nlnyU5PWdRo0Q97ovxfKpVAGK4h4PTiZkQ==
X-Received: by 2002:a63:104e:: with SMTP id 14mr814051pgq.331.1624317537148;
 Mon, 21 Jun 2021 16:18:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:18:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/29] tcg/ppc: Split out tcg_out_bswap32
Date: Mon, 21 Jun 2021 16:18:29 -0700
Message-Id: <20210621231849.1871164-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621231849.1871164-1-richard.henderson@linaro.org>
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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


