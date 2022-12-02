Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D33BB6400B5
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 07:54:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0zuF-0007dH-IX; Fri, 02 Dec 2022 01:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zuD-0007cf-Nn
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:17 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zuB-0003je-K3
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:17 -0500
Received: by mail-pl1-x630.google.com with SMTP id k7so3828048pll.6
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 22:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x4OQMsd27euNjrg+Wz7g0qoeJXgmOpScKCYJD/Ut1GE=;
 b=WXaUhzOV+hSOl1IfDON4/iWoIVrz8ptl15RAMHwEV+xOELrjkKLkeckmgL23jZ9++K
 rdQV8TE67JsoY+6clVgMf2hfsawt9EbqbFZFHVZI0/lQAr4W7egjj1BA/Cya3XltQPkS
 jU8gHggy+TNv2grLHrGWKfx678xfOjZht8FNXy0ibPViLUL+GLAkDz7h/onOQLIsRr7u
 DyuuXF7oJtD04cfkiC8VzdwAiWWh0a+JhoynhKyCNYy+mAsXW/d7YjzkLxh/Citl36TC
 upaI/1Tfq+paXJcYXBVkfTwvZ5VOkfNmm/Ezeq81S3yHC9V3TImFahVU5kd7rTFuvoOh
 cCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x4OQMsd27euNjrg+Wz7g0qoeJXgmOpScKCYJD/Ut1GE=;
 b=P7CZGUPMUdTN4EAUfyq7R90IdNeFlnmit8T9HBEk9RZdIqabNZrGe/TP8TTiax2e0E
 7I3q7up5ztQd387PWUSQVOxt9wmTOGek0RvDKazNQyr6e/+6C0Y4JZV4+o9YRRVNRRzM
 BHS/TUZVs3HPL47k9nf2LM3j7lIYgSmiEBOXPYQHOWf/NupCzW6gvKMWPZZM5uObRyp5
 ir7luMt0G8KHTteSfAtfUPVAFXXpcLN0LMn8axHhm/HTtboesj0F1RCZUevTeqcC0sZA
 jt7kTmTjffpOO7dEc+X39/4VzrvEpMDi1fgl8o4pD5LJWNnUKF3tG44x+9FR3g/UMyhG
 P34A==
X-Gm-Message-State: ANoB5pk7mVXxzFZrN4e5reXowcQpHqffq/zVG+udJ7ZDndVhE4FTjA2W
 3S3neKQPlVWizYW6IuN+FXl1W7uYiqZ4Cyye
X-Google-Smtp-Source: AA0mqf5usPgOyzyWGLMvyicnhvpfPL5XbjEA6AG1XrxrQzL7yXif6Ff6H47wqbfxIAamHRwGMfhsEQ==
X-Received: by 2002:a17:902:fe81:b0:189:b732:7671 with SMTP id
 x1-20020a170902fe8100b00189b7327671mr4437853plm.26.1669963934211; 
 Thu, 01 Dec 2022 22:52:14 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 q61-20020a17090a17c300b00218d894fac3sm6056649pja.3.2022.12.01.22.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 22:52:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v3 13/13] tcg/s390x: Implement ctpop operation
Date: Thu,  1 Dec 2022 22:52:00 -0800
Message-Id: <20221202065200.224537-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202065200.224537-1-richard.henderson@linaro.org>
References: <20221202065200.224537-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

There is an older form that produces per-byte results,
and a newer form that produces per-register results,
and a vector form that produces per-element results.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     |  5 ++--
 tcg/s390x/tcg-target.c.inc | 51 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 191c6a073e..5d184d8e14 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -62,6 +62,7 @@ typedef enum TCGReg {
 #define FACILITY_LOAD_ON_COND         45
 #define FACILITY_FAST_BCR_SER         FACILITY_LOAD_ON_COND
 #define FACILITY_DISTINCT_OPS         FACILITY_LOAD_ON_COND
+#define FACILITY_POPCOUNT             FACILITY_LOAD_ON_COND
 #define FACILITY_LOAD_ON_COND2        53
 #define FACILITY_MISC_INSN_EXT2       58
 #define FACILITY_MISC_INSN_EXT3       61
@@ -91,7 +92,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_nor_i32        HAVE_FACILITY(MISC_INSN_EXT3)
 #define TCG_TARGET_HAS_clz_i32        0
 #define TCG_TARGET_HAS_ctz_i32        0
-#define TCG_TARGET_HAS_ctpop_i32      0
+#define TCG_TARGET_HAS_ctpop_i32      HAVE_FACILITY(POPCOUNT)
 #define TCG_TARGET_HAS_deposit_i32    HAVE_FACILITY(GEN_INST_EXT)
 #define TCG_TARGET_HAS_extract_i32    HAVE_FACILITY(GEN_INST_EXT)
 #define TCG_TARGET_HAS_sextract_i32   0
@@ -128,7 +129,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_nor_i64        HAVE_FACILITY(MISC_INSN_EXT3)
 #define TCG_TARGET_HAS_clz_i64        HAVE_FACILITY(EXT_IMM)
 #define TCG_TARGET_HAS_ctz_i64        0
-#define TCG_TARGET_HAS_ctpop_i64      0
+#define TCG_TARGET_HAS_ctpop_i64      HAVE_FACILITY(POPCOUNT)
 #define TCG_TARGET_HAS_deposit_i64    HAVE_FACILITY(GEN_INST_EXT)
 #define TCG_TARGET_HAS_extract_i64    HAVE_FACILITY(GEN_INST_EXT)
 #define TCG_TARGET_HAS_sextract_i64   0
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 23cbb10168..7744c6ad54 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -208,6 +208,7 @@ typedef enum S390Opcode {
 
     RRFc_LOCR   = 0xb9f2,
     RRFc_LOCGR  = 0xb9e2,
+    RRFc_POPCNT = 0xb9e1,
 
     RR_AR       = 0x1a,
     RR_ALR      = 0x1e,
@@ -259,6 +260,7 @@ typedef enum S390Opcode {
     RXY_LRVG    = 0xe30f,
     RXY_LRVH    = 0xe31f,
     RXY_LY      = 0xe358,
+    RXY_MSG     = 0xe30c,
     RXY_NG      = 0xe380,
     RXY_OG      = 0xe381,
     RXY_STCY    = 0xe372,
@@ -276,6 +278,7 @@ typedef enum S390Opcode {
     RX_L        = 0x58,
     RX_LA       = 0x41,
     RX_LH       = 0x48,
+    RX_MS       = 0x71,
     RX_ST       = 0x50,
     RX_STC      = 0x42,
     RX_STH      = 0x40,
@@ -1568,6 +1571,45 @@ static void tgen_clz(TCGContext *s, TCGReg dest, TCGReg a1,
     tgen_movcond_int(s, TCG_TYPE_I64, dest, a2, a2const, TCG_REG_R0, 8, 2);
 }
 
+static void tgen_ctpop(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
+{
+    /* With MIE3, and bit 0 of m4 set, we get the complete result. */
+    if (HAVE_FACILITY(MISC_INSN_EXT3)) {
+        if (type == TCG_TYPE_I32) {
+            tgen_ext32u(s, dest, src);
+            src = dest;
+        }
+        tcg_out_insn(s, RRFc, POPCNT, dest, src, 8);
+        return;
+    }
+
+    /* Without MIE3, each byte gets the count of bits for the byte. */
+    tcg_out_insn(s, RRFc, POPCNT, dest, src, 0);
+
+    /* Multiply to sum each byte at the top of the word. */
+    if (type == TCG_TYPE_I32 && HAVE_FACILITY(GEN_INST_EXT)) {
+        tcg_out_insn(s, RIL, MSFI, dest, 0x01010101);
+    } else {
+        /* No space to save: share the constant between TCG_TYPE_I32/I64. */
+        tcg_out_insn(s, RIL, LARL, TCG_TMP0, 0);
+        new_pool_label(s, 0x0101010101010101ull,
+                       R_390_PC32DBL, s->code_ptr - 2, 2);
+
+        if (type == TCG_TYPE_I32) {
+            tcg_out_insn(s, RX, MS, dest, TCG_TMP0, TCG_REG_NONE, 0);
+        } else {
+            tcg_out_insn(s, RXY, MSG, dest, TCG_TMP0, TCG_REG_NONE, 0);
+        }
+    }
+
+    /* Shift result down from the top byte. */
+    if (type == TCG_TYPE_I32) {
+        tcg_out_sh32(s, RS_SRL, dest, TCG_REG_NONE, 24);
+    } else {
+        tcg_out_sh64(s, RSY_SRLG, dest, dest, TCG_REG_NONE, 56);
+    }
+}
+
 static void tgen_deposit(TCGContext *s, TCGReg dest, TCGReg src,
                          int ofs, int len, int z)
 {
@@ -2733,6 +2775,13 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tgen_clz(s, args[0], args[1], args[2], const_args[2]);
         break;
 
+    case INDEX_op_ctpop_i32:
+        tgen_ctpop(s, TCG_TYPE_I32, args[0], args[1]);
+        break;
+    case INDEX_op_ctpop_i64:
+        tgen_ctpop(s, TCG_TYPE_I64, args[0], args[1]);
+        break;
+
     case INDEX_op_mb:
         /* The host memory model is quite strong, we simply need to
            serialize the instruction stream.  */
@@ -3302,6 +3351,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_extu_i32_i64:
     case INDEX_op_extract_i32:
     case INDEX_op_extract_i64:
+    case INDEX_op_ctpop_i32:
+    case INDEX_op_ctpop_i64:
         return C_O1_I1(r, r);
 
     case INDEX_op_qemu_ld_i32:
-- 
2.34.1


