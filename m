Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F63B3A5E9E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:52:27 +0200 (CEST)
Received: from localhost ([::1]:48482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiKY-0002NI-7n
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6n-000285-G1
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:13 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:37410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6f-0003Vf-Vj
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:13 -0400
Received: by mail-pl1-x631.google.com with SMTP id h12so6158798plf.4
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WhSFZreDO53AzLKGFi8wjggrqQhc1QnKvAfjWIRryI8=;
 b=RgLOPHr4ymADW1P+bAuhcZbbNx5dsctX6D2MMCCWJ+aTw2/X9uLDi+SnGMMHmhpPj1
 iSK9dwNUxQP0t0H8Wjh1TqFZVJ8inCDbiTFnhkYTDq4IlQHDZ0aSrl15mFKrdR3S9A5v
 z+pZwUcAniXmEgVcgGmp+eo1sGC7zwXHwFAbNzf4u4r5Qz3lf8drptd8XGG9grVyWRdo
 fwxN1EOeskeHhb5FN6sU+/B6k2joO95FOd5POyMycWgMjWbbK7gGU4UTDlcrSZcG3taq
 oAPvltcB8NVN03v2/xWDi7HCJWE+t8tOjEjwlBtYn2kBsUFzq85Pm1wecKGMIWnZgR6T
 vrug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WhSFZreDO53AzLKGFi8wjggrqQhc1QnKvAfjWIRryI8=;
 b=IYXF3N77zgSxNt66Rb/dAJbpmpAY6fzOIiuUqtQYcDEqRCA5BzMbOoTaZBVMkk3FJV
 2m6iFX/avwDvNt6BdlJjYbgEan89Yjen+2qpdabbOmH2wBBfT7kA65IL8Mx+CA/11kF5
 hFnO88sF4BuzppkZvz9baEq9cKWrgrsZu5Pza0msghYaNnky9AfXFAsLpl/LfCAdz6Rx
 he6ikEwP/VfQ9RBcNqaZed4Rf1iqx9iRAurXip56J0+OcP7Pbw5QRsepiTDdjISNpqs9
 IiTLHDgaEJlGSEB78BWrUAnMBp1hlmN5pzXZQfaG95CONz+a4e8Hs9OprAsWFEIsarDM
 MkQw==
X-Gm-Message-State: AOAM530i0mOXAjZqz8R52+XI8y25yEyFntQERqiSvcUHtyCv2ghxOwwr
 aXAg8sLXYSiWBuju3B3LDpTcUbTR5QPBug==
X-Google-Smtp-Source: ABdhPJzWLo6V0043MDBIfP1b5+9GmkIwGTGZWtnz1WOWezWfZwJEmDgMOpoIChQ4tzWdfbo16csSIQ==
X-Received: by 2002:a17:902:e747:b029:114:af78:1776 with SMTP id
 p7-20020a170902e747b0290114af781776mr15981671plf.2.1623659884496; 
 Mon, 14 Jun 2021 01:38:04 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/28] tcg/ppc: Split out tcg_out_ext{8,16,32}s
Date: Mon, 14 Jun 2021 01:37:37 -0700
Message-Id: <20210614083800.1166166-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

We will shortly require these in other context;
make the expansion as clear as possible.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 795701442b..aa35ff8250 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -738,6 +738,21 @@ static inline void tcg_out_rlw(TCGContext *s, int op, TCGReg ra, TCGReg rs,
     tcg_out32(s, op | RA(ra) | RS(rs) | SH(sh) | MB(mb) | ME(me));
 }
 
+static inline void tcg_out_ext8s(TCGContext *s, TCGReg dst, TCGReg src)
+{
+    tcg_out32(s, EXTSB | RA(dst) | RS(src));
+}
+
+static inline void tcg_out_ext16s(TCGContext *s, TCGReg dst, TCGReg src)
+{
+    tcg_out32(s, EXTSH | RA(dst) | RS(src));
+}
+
+static inline void tcg_out_ext32s(TCGContext *s, TCGReg dst, TCGReg src)
+{
+    tcg_out32(s, EXTSW | RA(dst) | RS(src));
+}
+
 static inline void tcg_out_ext32u(TCGContext *s, TCGReg dst, TCGReg src)
 {
     tcg_out_rld(s, RLDICL, dst, src, 0, 32);
@@ -2322,7 +2337,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const int const_args[TCG_MAX_OP_ARGS])
 {
     TCGArg a0, a1, a2;
-    int c;
 
     switch (opc) {
     case INDEX_op_exit_tb:
@@ -2390,7 +2404,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ld8s_i32:
     case INDEX_op_ld8s_i64:
         tcg_out_mem_long(s, LBZ, LBZX, args[0], args[1], args[2]);
-        tcg_out32(s, EXTSB | RS(args[0]) | RA(args[0]));
+        tcg_out_ext8s(s, args[0], args[0]);
         break;
     case INDEX_op_ld16u_i32:
     case INDEX_op_ld16u_i64:
@@ -2728,18 +2742,15 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_ext8s_i32:
     case INDEX_op_ext8s_i64:
-        c = EXTSB;
-        goto gen_ext;
+        tcg_out_ext8s(s, args[0], args[1]);
+        break;
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
-        c = EXTSH;
-        goto gen_ext;
+        tcg_out_ext16s(s, args[0], args[1]);
+        break;
     case INDEX_op_ext_i32_i64:
     case INDEX_op_ext32s_i64:
-        c = EXTSW;
-        goto gen_ext;
-    gen_ext:
-        tcg_out32(s, c | RS(args[1]) | RA(args[0]));
+        tcg_out_ext32s(s, args[0], args[1]);
         break;
     case INDEX_op_extu_i32_i64:
         tcg_out_ext32u(s, args[0], args[1]);
-- 
2.25.1


