Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38683B78E1
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:52:45 +0200 (CEST)
Received: from localhost ([::1]:37524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJmm-0000FS-No
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwQ-00041o-Ff
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:38 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:44913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwD-0002y0-OT
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:38 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so3085556pjo.3
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=znXqyANfADmzCCKcOL9UkCkEB0KOFuEYMH60SU5HgB4=;
 b=vNOV8a/yi6eF686/WEQ5ay1dw+fDKoDET9uth6jpbGO+8R4vWn00YWm5HYSzPGgmOB
 /p2SrRj1rRQAw2By3ZV+5rAI9mamVPnEqxdQicqaygXBsqvTCNbQjTCZWmN7klwInqzd
 SNsntcEou2Tssv8tJqbqDP72HyyX7BKoTfQIY4Itr/HqLwbgq2kuhMR6fFffVJuoOgUz
 1qy+klt5E4ocWPhPFdydV/X1UeMNTpsUeP54Cxd1sDQlQs8/JezjLRUMF18Xfbejxrj1
 irFvm4foOklcTV8zi9FT0oZG/R1CCW06wNhxsmEqjkmUao5qZqNvsGp2QMYk81i1w1Ft
 QkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=znXqyANfADmzCCKcOL9UkCkEB0KOFuEYMH60SU5HgB4=;
 b=O8L3pGt007Z71jDTD6Neot6C/akDppUdg2JX8vurN+pXwMRjp2gQ4aV1lGV9iiFI2/
 T7VVwjrOe4+ifZJuh5L2Q/Slvd5CeCQvUcdy8MDFMALiEEAfED6hbPJFk2v+Pt4FtUUI
 0piaunpnZzEPeIenIJRH+UlEhUerEWLxY++l7HNgkrcVDowIf0nhRO8QmAKB4cAKd8YY
 NzP66EDff92JO+j7WXrahW2V6t250FUt5AE0AhSggTvr9jCpn4oQd4vtmEf2DArPNe79
 +7hM1/1CSgDTu/5tGy7ylTU/qm1S9WX2MglkJaO+mcaQFMxaDsaeh7sKUAN1HXnyUaCy
 1OuQ==
X-Gm-Message-State: AOAM530fUl+xinqPfcmGUNEanW0kr/FdOFExmiqMHcDPrJXyEF4iXAmW
 FxuHYsI+Tj3FJN8P/QbHrLicbgPeBcgC3Q==
X-Google-Smtp-Source: ABdhPJygFTyyj23KfEFB/ahHwvOci8YrShSyGDvDbj9t/k0WeimmsvBmz+ZO2KHnTR0FiXnEbqGxnQ==
X-Received: by 2002:a17:90a:4e0b:: with SMTP id
 n11mr35599378pjh.155.1624993104196; 
 Tue, 29 Jun 2021 11:58:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm18002849pfh.103.2021.06.29.11.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:58:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 44/63] tcg/ppc: Split out tcg_out_bswap64
Date: Tue, 29 Jun 2021 11:54:36 -0700
Message-Id: <20210629185455.3131172-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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


