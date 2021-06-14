Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A423A5EA9
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:55:08 +0200 (CEST)
Received: from localhost ([::1]:57126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiN9-00088X-NA
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6s-0002Du-LV
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:18 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:54218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6i-0003Xw-CP
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:18 -0400
Received: by mail-pj1-x102e.google.com with SMTP id ei4so9286940pjb.3
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=efhM15NF3CwbPhiaHPmRN5qTN9aiv7TZSEdl+6oiGJA=;
 b=O7qvuFfny6UZxSJSSIpgm/I0oEcDflN5S+g1lMvMwEy6KIhLmkCEbiaye/AMto0d9q
 38w4hXKO5sAkY8YKTOYweFVljZlQX+rZU5LPzZBYrvikBAZkKqkrHbeOyXkB5J/p1T31
 1Oa0WlZQLSBVTFNSEBUslIKx9bPtyDZklvinFwNSAU2N9BM1GK6jgm2nGFO26xKa77Bk
 BcpxF+mkJYKxhHo2HPzcWd+7JC+OimFxb6x7y9q4Z5GMnlQwe9TVeM+gGAsPCF9WELwY
 AOBqcy7tDExTGiFYRKoHQNDVNgWnoLcN6EjujrO0NDkaWqADa25GjMDzh0wyh5xq9nNa
 e3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=efhM15NF3CwbPhiaHPmRN5qTN9aiv7TZSEdl+6oiGJA=;
 b=jGEoYlPK9j1aT3CkIQXKIXhkj2Lf/9KEZ8ra3WM18YfBqX5a9axjmhV/9yZa494SGh
 liXP8BCb291mEj+OmnkqQGzdgCB4WlcnQSu4OCU00noYHvntzvp2t3i6mtqlsidpYn5V
 95ULWcxpZdj/D3z3B96Fs3rL1PH7h+UPzp1ra5XrSFKSQu7AjG0L1Eifyc8o2vgjOiXD
 gm4+xd5L0il9caqH9RnH9SwEdzyN72wFCX18108L2d6QxX8F+O3I/Hjdbx9SvS1DDW8p
 hL06RKIOhmhG/Tu8+YVLQu235pTM+ktGEPChMFeOWOFJnGtMOa8t9P54Lw0eI3U3Ti6p
 3HOg==
X-Gm-Message-State: AOAM530I/Nc+OgW2IaQYZ1aBYQn3bakk1nZsrnm+VVTxzY1gVc53ZnQi
 6glwVUzNbtFa3VY9glPCfID2NPHA2VTTrw==
X-Google-Smtp-Source: ABdhPJxAppJBRSsSA7W15u13HEgGQf0ad/ywVBeym5nQrdhqQUBiUw9GjCyP2PwPczEcadb5Bj+G+Q==
X-Received: by 2002:a17:90b:393:: with SMTP id
 ga19mr17665224pjb.182.1623659887072; 
 Mon, 14 Jun 2021 01:38:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/28] tcg/ppc: Split out tcg_out_bswap64
Date: Mon, 14 Jun 2021 01:37:41 -0700
Message-Id: <20210614083800.1166166-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 51 +++++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index f0e42e4b88..690c77b4da 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -809,6 +809,26 @@ static void tcg_out_bswap32(TCGContext *s, TCGReg dst, TCGReg src)
     tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
 }
 
+static void tcg_out_bswap64(TCGContext *s, TCGReg dst, TCGReg src)
+{
+    TCGReg t0 = dst == src ? TCG_REG_R0 : dst;
+    TCGReg t1 = dst == src ? dst : TCG_REG_R0;
+
+                                                   /* src = abcd efgh */
+    tcg_out_rlw(s, RLWINM, t0, src, 8, 0, 31);     /* t0  = 0000 fghe */
+    tcg_out_rlw(s, RLWIMI, t0, src, 24, 0, 7);     /* t0  = 0000 hghe */
+    tcg_out_rlw(s, RLWIMI, t0, src, 24, 16, 23);   /* t0  = 0000 hgfe */
+
+    tcg_out_rld(s, RLDICL, t0, t0, 32, 0);         /* t0  = hgfe 0000 */
+    tcg_out_rld(s, RLDICL, t1, src, 32, 0);        /* t1  = efgh abcd */
+
+    tcg_out_rlw(s, RLWIMI, t0, t1, 8, 0, 31);      /* t0  = hgfe bcda */
+    tcg_out_rlw(s, RLWIMI, t0, t1, 24, 0, 7);      /* t0  = hgfe dcda */
+    tcg_out_rlw(s, RLWIMI, t0, t1, 24, 16, 23);    /* t0  = hgfe dcba */
+
+    tcg_out_mov(s, TCG_TYPE_REG, dst, t0);
+}
+
 /* Emit a move into ret of arg, if it can be done in one insn.  */
 static bool tcg_out_movi_one(TCGContext *s, TCGReg ret, tcg_target_long arg)
 {
@@ -2806,37 +2826,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
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


