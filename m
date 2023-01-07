Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F6C660CE4
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 09:03:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE3zZ-0003p0-Qe; Sat, 07 Jan 2023 02:51:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zU-0003lH-R7
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:44 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zT-0004Eo-4v
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:44 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 z9-20020a17090a468900b00226b6e7aeeaso4148429pjf.1
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 23:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7jUA9/ifCEteEPBnCrvu2FZgUNzc6y0gw3a24gfdjs4=;
 b=uW4Ldb5C9Xn+WLwPsP6sLC/FBnVvOM4ORbX1CzcvrYXb4YDYa+ydg35fiHKVuuIbuK
 XojcN1fwVrVNUyEOjOEoOD7/u2/DHAE/OqjBHgHqDzkTUoWhEneMzt/4Tun8/iIdx3y+
 J2fHu9JR0pWPmn0uEtoUCFlXBfKMGkNieYeyfA/eF9k05UkkeuR0lzG07qg3sNnHmbMO
 pDJQtRQGrW0OLFIdZKZiICKPu2rrnVH56tkb+nqrqF1Wpi57zF60wRDpA4VgEwY9tNO+
 lj7R2yjT8CrxkvGj20yCtoxPE4yvTt4hAhv7WBmeChzDYCwulPjJxen4bEK6ceC2qa/J
 38lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7jUA9/ifCEteEPBnCrvu2FZgUNzc6y0gw3a24gfdjs4=;
 b=Xs8/5YLaJSNfKmFITSo+pdmjy3dx42FgCY2/qafpX4f1lqG4w4Qyx3Zv8v59aeuygB
 R+yVbTVL8mCmjXqG4gMpqhL/ureZFetnmJSynKNnmSZ2PLx3ZfPPBedrqMRkoctO4dei
 mhL1Irhdt6oocZWhXKB19bZxzeaD0b4jd1VOjSmo5GffOmid1r8rKCWus3ormtdiExIm
 vN115BG9VkSBi4z167D+Sf+pgYmEk6SBWrZ61VDCEsx28U4dfhyuaHYyBb6hkatrWOSm
 Vk2T70hthru/L0sdUMtzu398HTvek4o8wFCeiItvpF/osXJypojiu3J0RugHwZB7ohBY
 mbvQ==
X-Gm-Message-State: AFqh2kqYIyFdlxpR9hQQhexzyH7aFmnQikpoimvPpRNtpdGpATYWAVXG
 ++KKUNGX29CT9wZ7WmL6102YEdepmyFmJKtH
X-Google-Smtp-Source: AMrXdXuxBgLwleMCYX0dttYUMeKgEBU950JzAdYjr1f6Jlw+dyOcLQUekVbORvVgzDqfGG2SRotjhA==
X-Received: by 2002:a17:90a:e616:b0:226:62bb:3257 with SMTP id
 j22-20020a17090ae61600b0022662bb3257mr22550188pjy.10.1673077902189; 
 Fri, 06 Jan 2023 23:51:42 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 bj5-20020a17090b088500b00212e5068e17sm1945119pjb.40.2023.01.06.23.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 23:51:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 24/27] tcg/s390x: Implement ctpop operation
Date: Fri,  6 Jan 2023 23:51:15 -0800
Message-Id: <20230107075118.1814503-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107075118.1814503-1-richard.henderson@linaro.org>
References: <20230107075118.1814503-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
and a newer form that produces per-register results.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     |  4 ++--
 tcg/s390x/tcg-target.c.inc | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index dabdae1e84..68dcbc6645 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -91,7 +91,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_nor_i32        HAVE_FACILITY(MISC_INSN_EXT3)
 #define TCG_TARGET_HAS_clz_i32        0
 #define TCG_TARGET_HAS_ctz_i32        0
-#define TCG_TARGET_HAS_ctpop_i32      0
+#define TCG_TARGET_HAS_ctpop_i32      1
 #define TCG_TARGET_HAS_deposit_i32    1
 #define TCG_TARGET_HAS_extract_i32    1
 #define TCG_TARGET_HAS_sextract_i32   0
@@ -128,7 +128,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_nor_i64        HAVE_FACILITY(MISC_INSN_EXT3)
 #define TCG_TARGET_HAS_clz_i64        1
 #define TCG_TARGET_HAS_ctz_i64        0
-#define TCG_TARGET_HAS_ctpop_i64      0
+#define TCG_TARGET_HAS_ctpop_i64      1
 #define TCG_TARGET_HAS_deposit_i64    1
 #define TCG_TARGET_HAS_extract_i64    1
 #define TCG_TARGET_HAS_sextract_i64   0
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 8254f9f650..c0434fa2f8 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -206,6 +206,7 @@ typedef enum S390Opcode {
 
     RRFc_LOCR   = 0xb9f2,
     RRFc_LOCGR  = 0xb9e2,
+    RRFc_POPCNT = 0xb9e1,
 
     RR_AR       = 0x1a,
     RR_ALR      = 0x1e,
@@ -1435,6 +1436,32 @@ static void tgen_clz(TCGContext *s, TCGReg dest, TCGReg a1,
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
+    if (type == TCG_TYPE_I32) {
+        tcg_out_insn(s, RIL, MSFI, dest, 0x01010101);
+        tcg_out_sh32(s, RS_SRL, dest, TCG_REG_NONE, 24);
+    } else {
+        tcg_out_movi(s, TCG_TYPE_I64, TCG_TMP0, 0x0101010101010101ull);
+        tcg_out_insn(s, RRE, MSGR, dest, TCG_TMP0);
+        tcg_out_sh64(s, RSY_SRLG, dest, dest, TCG_REG_NONE, 56);
+    }
+}
+
 static void tgen_deposit(TCGContext *s, TCGReg dest, TCGReg src,
                          int ofs, int len, int z)
 {
@@ -2584,6 +2611,13 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
@@ -3146,6 +3180,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_extu_i32_i64:
     case INDEX_op_extract_i32:
     case INDEX_op_extract_i64:
+    case INDEX_op_ctpop_i32:
+    case INDEX_op_ctpop_i64:
         return C_O1_I1(r, r);
 
     case INDEX_op_qemu_ld_i32:
-- 
2.34.1


