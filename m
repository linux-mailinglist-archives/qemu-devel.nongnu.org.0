Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77913AF94A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:28:03 +0200 (CEST)
Received: from localhost ([::1]:56520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTKk-0003af-Kw
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC1-0000ed-An
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:01 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:36564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTBz-0005x3-9g
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:01 -0400
Received: by mail-pf1-x431.google.com with SMTP id t8so4602497pfe.3
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=znXqyANfADmzCCKcOL9UkCkEB0KOFuEYMH60SU5HgB4=;
 b=fonwhDTk+cXOO72skZGVcbXqKpu5VRhs3EkKWfCAUYF2gPwGZNlIgzj0CVToDcEuwo
 nfRZdwt6S/BJFy8QGOsq0+zfjVtgsR/pk84P3vjCVeGLHpWV3S8H6kPVXrJDyxZSTX31
 iAnrMjRfNjLJrMvqPGwQAAk1QmJqRmoRNTLdQgzhPmJodm4YXV5r872javCvhSBgjbLm
 qJ7eQgvMBAy8CCiiTBzIPBcJbLcOcS6jwoCyD2tTMYuVyXMLGbxHsPWx6QIilKtMz8Ry
 4tLcb1D4n+QY/3gnq+HCjOLNoxvPZPXAYiYPCHe1JP6aIf4F6kSIzeu9FKmfVUcDEd6c
 uLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=znXqyANfADmzCCKcOL9UkCkEB0KOFuEYMH60SU5HgB4=;
 b=idwvpKsDtjgSUn5FHpBSR34yCvfb7NYmPj+drf6DnuXHf6K/LpZOH5hpWyS7QJtXee
 Blq5dgvYtoREPpihvSwWMg4gwcb3yGKtIYNijaDtcrN0fgkxSBNxYeAAj7FfBc9QMB1a
 8AspGA95OIFsNwNJmXovjd2fF7gmIHaeSz4nF8WsThWzf56ToY5SFGcjZUSOx2uesN9b
 n3BuPZRj7wa805LMj5T74EeaDmzBAYZtagb7byK9vfjdYUmo7nxBd35+R74ZXJ21KUhb
 BcxnKJXZ6RQoGlkA5u4MmLWciE9Azyxbwmi8gX3qeBWBkyhGi7aD5EHXMIuemiqq+jgK
 Gy8w==
X-Gm-Message-State: AOAM532GhIVlymZmdAY5UtEWIw7H4YSIeVvg4iLBbzEFjW+ILtM8I+41
 hgYwJ/NERzeSGNzZsalQ4U+lG+mn+XiEwQ==
X-Google-Smtp-Source: ABdhPJxR6KObeNCwr8SPqWL4bFCgNtslfQlQYhhaDnQZIAKfCrmaPsqwa+A8olaeltKj+4InH3natw==
X-Received: by 2002:a62:1c05:0:b029:305:5230:79f7 with SMTP id
 c5-20020a621c050000b0290305523079f7mr229638pfc.80.1624317537835; 
 Mon, 21 Jun 2021 16:18:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:18:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/29] tcg/ppc: Split out tcg_out_bswap64
Date: Mon, 21 Jun 2021 16:18:30 -0700
Message-Id: <20210621231849.1871164-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621231849.1871164-1-richard.henderson@linaro.org>
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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


