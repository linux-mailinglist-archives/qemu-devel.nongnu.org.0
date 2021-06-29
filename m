Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A361C3B78DD
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:50:53 +0200 (CEST)
Received: from localhost ([::1]:59132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJky-000470-ON
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:50:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwN-00040v-0H
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:36 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:42876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwC-0002xi-8g
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:32 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 ce18-20020a17090aff12b0290170a3e3eb07so3093332pjb.1
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+KG72/HkSkkW/EnHZzWfX4mj5faPrZ7wY+xxoD2yGxc=;
 b=G859DM/LoMEcQliF0zGqf5jbuXDOtmfhbHTmy+XTD4xYMX7GhJPNtkD2eedpX3u2tl
 0lz7mG63WWrzSMmIb/+Fs2bQtIG9R/ym9yfU5awy3ebS8sygS6+2h28HWlp0+SO1J4P5
 PUyuCk2f24d8kk8glVqEAPj7T8xoKbNtR7vf9uyMYpz0sUbGygi/PF9mRnshr2d3BTKM
 QMsOLrPdPjNclyt+nXFKi04gU0K4+DZtVe+YNeX4t0va1MJReq86hg0NF6rYoJrCS45W
 l6FyHPAkliO2z8J8Ql82IaidHlzi4WKwWFwxueDpcOJjbKGzjPAwfb6r/Wt0H8cHr98U
 Cu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+KG72/HkSkkW/EnHZzWfX4mj5faPrZ7wY+xxoD2yGxc=;
 b=mHvNa1HSS8hBbMLmCy38b2c0RvGz6VGiDQVmg4LyVzppkFcvbbnWbaGtfwBHBDxffD
 YeQWJltt6SuPGDzQ/TyVFiuo1cJrtUOl2YOW1fX4CHRK0Cmwq4n6SL7SvooxazHGe2iI
 01sp9oKrsC8AjdmbEfqZHPeYkOkkXBB1zdTUiopFVnF7tOWA843yyOS07hT2jbOTQgIQ
 WqN+Qx7u4wJIbNVTM/4x67ID2xBRIbWbylAy3NAwVGoIFy1hKxp7OKhASmA2V94hPPvL
 vtEzW/5x7hSuhV0L2AFbPpxAAXOkDJi336Tw5kEGn2UV2En/sjUhRFWmps2lMoGNBxU6
 rodw==
X-Gm-Message-State: AOAM530yP/0r/D1LACL0Ymw19xhjxPMBYXPVSnrk18eayaIx8fj5sLiS
 krvGGLsYTyiU+fn/LeG+pJP0pSaZKuwNNg==
X-Google-Smtp-Source: ABdhPJy2gfbMYYDZJLvyRvWAx6RdEL+5ud4J7NnIphqNf94Jbb1pglL9V/0hZ+4WIkvyXMp2ZswMAg==
X-Received: by 2002:a17:90a:a607:: with SMTP id
 c7mr35657392pjq.199.1624993103032; 
 Tue, 29 Jun 2021 11:58:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm18002849pfh.103.2021.06.29.11.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:58:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 42/63] tcg/ppc: Split out tcg_out_bswap16
Date: Tue, 29 Jun 2021 11:54:34 -0700
Message-Id: <20210629185455.3131172-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the use of a suitable temporary, we can use the same
algorithm when src overlaps dst.  The result is the same
number of instructions either way.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 50347182d7..ad46ce32ca 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -789,6 +789,24 @@ static inline void tcg_out_sari64(TCGContext *s, TCGReg dst, TCGReg src, int c)
     tcg_out32(s, SRADI | RA(dst) | RS(src) | SH(c & 0x1f) | ((c >> 4) & 2));
 }
 
+static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src)
+{
+    TCGReg tmp = dst == src ? TCG_REG_R0 : dst;
+
+    /*
+     * In the following,
+     *   dep(a, b, m) -> (a & ~m) | (b & m)
+     *
+     * Begin with:                              src = xxxxabcd
+     */
+    /* tmp = rol32(src, 24) & 0x000000ff            = 0000000c */
+    tcg_out_rlw(s, RLWINM, tmp, src, 24, 24, 31);
+    /* tmp = dep(tmp, rol32(src, 8), 0x0000ff00)    = 000000dc */
+    tcg_out_rlw(s, RLWIMI, tmp, src, 8, 16, 23);
+
+    tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
+}
+
 /* Emit a move into ret of arg, if it can be done in one insn.  */
 static bool tcg_out_movi_one(TCGContext *s, TCGReg ret, tcg_target_long arg)
 {
@@ -2779,21 +2797,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_bswap16_i32:
     case INDEX_op_bswap16_i64:
-        a0 = args[0], a1 = args[1];
-        /* a1 = abcd */
-        if (a0 != a1) {
-            /* a0 = (a1 r<< 24) & 0xff # 000c */
-            tcg_out_rlw(s, RLWINM, a0, a1, 24, 24, 31);
-            /* a0 = (a0 & ~0xff00) | (a1 r<< 8) & 0xff00 # 00dc */
-            tcg_out_rlw(s, RLWIMI, a0, a1, 8, 16, 23);
-        } else {
-            /* r0 = (a1 r<< 8) & 0xff00 # 00d0 */
-            tcg_out_rlw(s, RLWINM, TCG_REG_R0, a1, 8, 16, 23);
-            /* a0 = (a1 r<< 24) & 0xff # 000c */
-            tcg_out_rlw(s, RLWINM, a0, a1, 24, 24, 31);
-            /* a0 = a0 | r0 # 00dc */
-            tcg_out32(s, OR | SAB(TCG_REG_R0, a0, a0));
-        }
+        tcg_out_bswap16(s, args[0], args[1]);
         break;
 
     case INDEX_op_bswap32_i32:
-- 
2.25.1


