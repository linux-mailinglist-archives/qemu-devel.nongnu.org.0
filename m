Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF746400A9
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 07:53:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0zu5-0007YR-2w; Fri, 02 Dec 2022 01:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zu2-0007Y0-P1
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:06 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zu0-0003dF-SP
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:06 -0500
Received: by mail-pf1-x431.google.com with SMTP id l127so3448550pfl.2
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 22:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UrI6q1gXGjCLU/ugzjf2mM2L+vv/WF4h7OD1AmvhVf4=;
 b=EXFSyKS+duHe4AOyVBPq4qLyR53xR0oZpnOHWRZeFTwwdIK/ipUzmco4ynwVNWh8Qa
 mGEowMyrht7S/ulGOPF9xqjZqZQAv0IQ1G/2lPmcODM2PUgNCdpl0oW2OlKPpQfUcbzQ
 M6vWe6m4HW1qyynqlju6IB9aBAwJPoVJyWc6tmaaIbJD/tvRtwHJ7exsmQHtSyQu5A1+
 NNawneC9nB4G7xQNpK+L1PULP2KznpVSJ5ayK0sQF6CDqrMyM2D5UKb1+L3P7BdbSL5s
 w61dKKhHCv2enBxljqTTUy2vWdURVxsw/c5s530B3MiHR0nlbywEVjKtP3lz+eTGd3rv
 0egA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UrI6q1gXGjCLU/ugzjf2mM2L+vv/WF4h7OD1AmvhVf4=;
 b=aRJMWDcf5l9PTh2O84gfXRYs0GlQEThVk281eYDn74kcPLCyMfG/hk8G1URR22asgG
 LgqJAMxAkYooLQCeUxFWv6Lrv4+EaeyjTOx1bghT86h09x7vTrDU5Fr6RoUPjG6VZJVL
 LyRY5FAatrhTw3SbCwjSkkyd+ro0F9E0Q0LSywsOXMhMKZAr8ypyfTS3zFu4j8zYCl23
 qsG8N8NDLqai6qcyoCeV//SxUsZ5YGGCjywwzlHiOK3Ig79vauI6ycDhzYaQLtjowTgm
 By2OIMlEVZoQ1X11LF0wFh8T69FgDdfudNFFefrGW7iywqcT3fYahhqKEr/dL6jcMozy
 WKNg==
X-Gm-Message-State: ANoB5pmSLXkKFwM0EMnRH/j2tvO48g+45pZef9IP0WxjVJGpaOnMzIGv
 sQn0zfm2cC+HRKZDgmMlLMLPeoSL4e+6+eCi
X-Google-Smtp-Source: AA0mqf7eqw3jDX4lPiM5PXXFNDymRw8rqQ+3mDnZjtiEaJFcljVIqok/Q3hOVqONf8LAlRqUJDeSNg==
X-Received: by 2002:a63:2584:0:b0:478:5d6b:d1fd with SMTP id
 l126-20020a632584000000b004785d6bd1fdmr9910494pgl.249.1669963922633; 
 Thu, 01 Dec 2022 22:52:02 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 q61-20020a17090a17c300b00218d894fac3sm6056649pja.3.2022.12.01.22.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 22:52:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v3 01/13] tcg/s390x: Use register pair allocation for div and
 mulu2
Date: Thu,  1 Dec 2022 22:51:48 -0800
Message-Id: <20221202065200.224537-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202065200.224537-1-richard.henderson@linaro.org>
References: <20221202065200.224537-1-richard.henderson@linaro.org>
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
index b9ba7b605e..cb00bb6999 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2264,10 +2264,18 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
@@ -2521,17 +2529,30 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
@@ -3226,10 +3247,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
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


