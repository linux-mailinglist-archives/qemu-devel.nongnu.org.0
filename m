Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 185CB6254BA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 08:56:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOfG-00065o-Rp; Fri, 11 Nov 2022 02:41:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfC-00064n-Bv
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:22 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOf9-0007XP-NF
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:21 -0500
Received: by mail-pl1-x632.google.com with SMTP id g24so3636911plq.3
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+XZZb+kD5PLDfiZzYREY/FqgovJZfyA/XfR3p9NEW64=;
 b=A9ZnMs44FGkMOtcTBHZ3GDg2bcOLHFu5ytM7tZDt++Q+yx7Fh1ur6sZaWNhFTlAX16
 dHqHCqeAN/9Sjz4/RGfukaGc7hHzv3yBWYKgoCDWHVDKK+cVOk0iEmHJV2lKANIuZjIM
 V9n+RKkTSgFrUwouxVXLJoeqG+5sqFL8Jz1gXRbuFe+vCjnmPR1GLmf5jyRVPk8rRj2m
 M5t0yLZ79D5itRDRJUt9Y6h5a7XlyGVCirr0cYc6BHNqrqzNT0XQekoTcbfrq5rx90gX
 djDbDMyvZ1iGNcZFQCSowz8T7Kfqxo3aOTGq8w1QtiYWtrUSk9mYtvxy+Cb/Y8bl/Ich
 Vflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+XZZb+kD5PLDfiZzYREY/FqgovJZfyA/XfR3p9NEW64=;
 b=5bM5YUWkWZg2BFMf/7j4syUlQIjPGFYPuU7fYF80Sov0Lk3ITOgregQhrxTU6ptPS/
 YfVpcKFPLAL1zgMzOeNHJNiNjMcmq5XExJ3vt4TUdPILgEy3Putel5PcqevNEtY6DtzP
 k9XwK2O8nfgLng1812wJEvYgKd+bZySGj6rovMOS3DXBCpcJvl5Osn6m+MBym3NMEyAl
 aU0YOiAImDYtEWFfDZgNwzWPEAUBPTwLlub70NseA15KaeNMOJRr4sXQ2JxpqB6CWQes
 9FFTB51O2yoZp/5BM+wUDWV6xW1/gZTSkgXChGgG/Wi5q+kgD76gWaEVnXBrkBgXRbXO
 8RVA==
X-Gm-Message-State: ANoB5pk1nl+JZlkzZ81FHtSsFaLZf78rtjqxjY8c9mDrHRWay4v7saZP
 hF89zzElVB5P6QmFkBUWrAWOJq+wbUhzh8Rn
X-Google-Smtp-Source: AA0mqf6QUsFquwmIP4IJGhOmCBKmZnCMxTxfLWdW71ukj2J4xvQU2Af6IsQSt9nAFOGjFXj+QD6N/w==
X-Received: by 2002:a17:90a:5a86:b0:214:291f:87b5 with SMTP id
 n6-20020a17090a5a8600b00214291f87b5mr624280pji.115.1668152477398; 
 Thu, 10 Nov 2022 23:41:17 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.41.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:41:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 04/45] tcg/s390x: Use register pair allocation for
 div and mulu2
Date: Fri, 11 Nov 2022 17:40:20 +1000
Message-Id: <20221111074101.2069454-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Previously we hard-coded R2 and R3.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h |  4 ++--
 tcg/s390x/tcg-target-con-str.h |  8 +------
 tcg/s390x/tcg-target.c.inc     | 43 +++++++++++++++++++++++++---------
 3 files changed, 35 insertions(+), 20 deletions(-)

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index 426dd92e51..00ba727b70 100644
--- a/tcg/s390x/tcg-target-con-set.h
+++ b/tcg/s390x/tcg-target-con-set.h
@@ -29,8 +29,8 @@ C_O1_I2(v, v, v)
 C_O1_I3(v, v, v, v)
 C_O1_I4(r, r, ri, r, 0)
 C_O1_I4(r, r, ri, rI, 0)
-C_O2_I2(b, a, 0, r)
-C_O2_I3(b, a, 0, 1, r)
+C_O2_I2(o, m, 0, r)
+C_O2_I3(o, m, 0, 1, r)
 C_O2_I4(r, r, 0, 1, rA, r)
 C_O2_I4(r, r, 0, 1, ri, r)
 C_O2_I4(r, r, 0, 1, r, r)
diff --git a/tcg/s390x/tcg-target-con-str.h b/tcg/s390x/tcg-target-con-str.h
index 8bb0358ae5..76446aecae 100644
--- a/tcg/s390x/tcg-target-con-str.h
+++ b/tcg/s390x/tcg-target-con-str.h
@@ -11,13 +11,7 @@
 REGS('r', ALL_GENERAL_REGS)
 REGS('L', ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
 REGS('v', ALL_VECTOR_REGS)
-/*
- * A (single) even/odd pair for division.
- * TODO: Add something to the register allocator to allow
- * this kind of regno+1 pairing to be done more generally.
- */
-REGS('a', 1u << TCG_REG_R2)
-REGS('b', 1u << TCG_REG_R3)
+REGS('o', 0xaaaa) /* odd numbered general regs */
 
 /*
  * Define constraint letters for constants:
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 33becd7694..47aaba7667 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2258,10 +2258,18 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_div2_i32:
-        tcg_out_insn(s, RR, DR, TCG_REG_R2, args[4]);
+        tcg_debug_assert(args[0] == args[2]);
+        tcg_debug_assert(args[1] == args[3]);
+        tcg_debug_assert((args[1] & 1) == 0);
+        tcg_debug_assert(args[0] == args[1] + 1);
+        tcg_out_insn(s, RR, DR, args[1], args[4]);
         break;
     case INDEX_op_divu2_i32:
-        tcg_out_insn(s, RRE, DLR, TCG_REG_R2, args[4]);
+        tcg_debug_assert(args[0] == args[2]);
+        tcg_debug_assert(args[1] == args[3]);
+        tcg_debug_assert((args[1] & 1) == 0);
+        tcg_debug_assert(args[0] == args[1] + 1);
+        tcg_out_insn(s, RRE, DLR, args[1], args[4]);
         break;
 
     case INDEX_op_shl_i32:
@@ -2515,17 +2523,30 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_div2_i64:
-        /* ??? We get an unnecessary sign-extension of the dividend
-           into R3 with this definition, but as we do in fact always
-           produce both quotient and remainder using INDEX_op_div_i64
-           instead requires jumping through even more hoops.  */
-        tcg_out_insn(s, RRE, DSGR, TCG_REG_R2, args[4]);
+        /*
+         * ??? We get an unnecessary sign-extension of the dividend
+         * into op0 with this definition, but as we do in fact always
+         * produce both quotient and remainder using INDEX_op_div_i64
+         * instead requires jumping through even more hoops.
+         */
+        tcg_debug_assert(args[0] == args[2]);
+        tcg_debug_assert(args[1] == args[3]);
+        tcg_debug_assert((args[1] & 1) == 0);
+        tcg_debug_assert(args[0] == args[1] + 1);
+        tcg_out_insn(s, RRE, DSGR, args[1], args[4]);
         break;
     case INDEX_op_divu2_i64:
-        tcg_out_insn(s, RRE, DLGR, TCG_REG_R2, args[4]);
+        tcg_debug_assert(args[0] == args[2]);
+        tcg_debug_assert(args[1] == args[3]);
+        tcg_debug_assert((args[1] & 1) == 0);
+        tcg_debug_assert(args[0] == args[1] + 1);
+        tcg_out_insn(s, RRE, DLGR, args[1], args[4]);
         break;
     case INDEX_op_mulu2_i64:
-        tcg_out_insn(s, RRE, MLGR, TCG_REG_R2, args[3]);
+        tcg_debug_assert(args[0] == args[2]);
+        tcg_debug_assert((args[1] & 1) == 0);
+        tcg_debug_assert(args[0] == args[1] + 1);
+        tcg_out_insn(s, RRE, MLGR, args[1], args[3]);
         break;
 
     case INDEX_op_shl_i64:
@@ -3220,10 +3241,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_div2_i64:
     case INDEX_op_divu2_i32:
     case INDEX_op_divu2_i64:
-        return C_O2_I3(b, a, 0, 1, r);
+        return C_O2_I3(o, m, 0, 1, r);
 
     case INDEX_op_mulu2_i64:
-        return C_O2_I2(b, a, 0, r);
+        return C_O2_I2(o, m, 0, r);
 
     case INDEX_op_add2_i32:
     case INDEX_op_sub2_i32:
-- 
2.34.1


