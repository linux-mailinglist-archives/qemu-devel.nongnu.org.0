Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2706062FE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:27:35 +0200 (CEST)
Received: from localhost ([::1]:47788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWW5-0005xg-JS
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:27:31 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWSM-0003dI-Am
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU79-0003x1-KD
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:53:35 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:43650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU76-0000wD-Pn
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:53:30 -0400
Received: by mail-pf1-x434.google.com with SMTP id 204so20017489pfx.10
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+XZZb+kD5PLDfiZzYREY/FqgovJZfyA/XfR3p9NEW64=;
 b=XXplLCy0Th4xQhKj1Qhp/ev466vofCOwgYoopGr8pPPzBTD7LagcMj1vfocfHqGrHJ
 k0OhtrtHzSbvRlvGhUOJW7BJwZ4arSddsZkGShCTI23JmvGoX1BeovICMHqjw27/IzZ3
 x1nkXjL6ecVC+jWFQ5IwRYS6IGSAnwpFaRkNwtm+LNMxsp972mLkqQfjvAIbmEGQuXIL
 pQ0yvH0xEvlO49SbvZiXq7ewUyD9oskBIO9/IiVdxDhpd7mFoBCSOjVRxWNAtK1TctTE
 MeUIVIiJiYdMnvvA9gNAzAjJFtlMmppm6w77P9dF0LEulRWoxht+iWgSvknryCRVObSX
 2gVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+XZZb+kD5PLDfiZzYREY/FqgovJZfyA/XfR3p9NEW64=;
 b=dZPYSN/nhOz2Gh4M6CWKS+i+UNHcwtHdIAWzgosbF+13vgyNt0+mvy+F612OCxuyoI
 h8yirxI2uJpQKyCHL4PzQZEqagSwMrfoExaRvArvACT41V3sgyFmIZiiwEhj8JXKlLvH
 lsW0/0BaQyf2leTGaJryv6sww/k5l9rmih7Ef0Qf3XinArmq6I43XfCG5LXck331Q6bK
 nsLKXhxNKSB2S5GQOpARsskECa4jAbZYbvoghUToLaHQUp0gYz9MNTZNSUnd6yjnzCxd
 +5GixN8Qj5GFbDQrclCpu02N5A05thyMQASJRobz5wflCnFnC9a85zT2mK3nVTE50Nw4
 xKyQ==
X-Gm-Message-State: ACrzQf2/8JR6QPX54Z518ZTDeaEAj74l9RQx7+wmEixbK2+3wmV91AVy
 H2vZ3a3m6B84Ab/c6s8jl2NKqaPtD8DBeGOh
X-Google-Smtp-Source: AMsMyM6u7jLorOUj3XDV5j5RqjC4raI3UdoNMIMxJfL99W73HBVLFctsMaNPRQyqMJVKrSn5S9Vryw==
X-Received: by 2002:a05:6a00:1304:b0:555:6d3f:1223 with SMTP id
 j4-20020a056a00130400b005556d3f1223mr13881923pfu.60.1666266807285; 
 Thu, 20 Oct 2022 04:53:27 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.53.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:53:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/31] tcg/s390x: Use register pair allocation for div and
 mulu2
Date: Thu, 20 Oct 2022 21:52:14 +1000
Message-Id: <20221020115242.2301066-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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


