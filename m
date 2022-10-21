Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8383E60712E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 09:33:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmWm-0005KP-5r
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:33:12 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmGz-00036J-J3
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmGm-0002wL-Ex
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:16:41 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmGk-0005cd-Mc
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:16:40 -0400
Received: by mail-pl1-x632.google.com with SMTP id c24so1560457pls.9
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+XZZb+kD5PLDfiZzYREY/FqgovJZfyA/XfR3p9NEW64=;
 b=AceTDJUdB6BqpwvfOC88MYN1lkhrIHQnsO0Ih5ym5HFangUeALvATOU/kDCvPIffio
 0e+fV7CGWYD8RScoei0hGjOzy0ksW/rKVqOtuQWSA/1AHwIM8f7XJD1m5NHtHc4rDGph
 R62lv9GDJ46jVOcJnabQjjcTm0TiyaWTuSVD8n36V9DaukISTQjdzyBOGQ4bwejSVcSd
 eUUWVUyl4CtQPDRUW73x9gSVmBz/YvW5QdoH+vZqE7NsJaJCiyTLGGhfbFh46J9feopR
 zOPPhbuFSuR880cKXMScU4BxHvnOzs81t25NsCiNl6tstATe+1VVddz2wOMGn2FYA/Wz
 xhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+XZZb+kD5PLDfiZzYREY/FqgovJZfyA/XfR3p9NEW64=;
 b=ryf5hnQ/0ilUQELMZ9QK+4BMwaCM0EB8ju4t8Gzqx3LSG8qVeGI4zG1bsm+oNZGR1b
 /gzcHRdZnNKtP7YPOIqT62+tqHSiflbx9yi0u57BZShP/iQMS06uC6W4Xnu3kIlopPci
 Xy3yF4+gm1vs300w2C3O343tkXnA8KjWwyvRlhBwHUgCyr/CqcgI6f1sWhzAOBkiRTFF
 nGPFXfKSqR2GoPxQjxw6AUp12tK4Ja9PRIK6yR0rTNTky+Z25wREX7zGObEAzTh3Oss0
 5uh3ff6ofQVfutKdDjm2LHPh+YBTfCf+FKGHXdhHJu79J0mV/ol9yD2cqCs8L0EgLxe9
 a6dg==
X-Gm-Message-State: ACrzQf0aAc3m6QBh9lqf7Zp2dmixK3/BNk5YB2KcALynHrcW9XJ7FlCo
 ozWBnTJJIhBi+UP/vzlgTTGjBarVJq8lqCS1
X-Google-Smtp-Source: AMsMyM7+v6sVXyMr4DETckzRXRdpLJl9BYaWkvY3oLTnGCylqomIASL9vC9GDgGZ9RUHAVqIv60aLA==
X-Received: by 2002:a17:902:e5c5:b0:186:5f09:8468 with SMTP id
 u5-20020a170902e5c500b001865f098468mr9282058plf.122.1666336596594; 
 Fri, 21 Oct 2022 00:16:36 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.16.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:16:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/36] tcg/s390x: Use register pair allocation for div and
 mulu2
Date: Fri, 21 Oct 2022 17:15:17 +1000
Message-Id: <20221021071549.2398137-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
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


