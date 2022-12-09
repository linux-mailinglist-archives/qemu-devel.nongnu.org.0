Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D18647C24
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:18:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3SmZ-00067h-I4; Thu, 08 Dec 2022 21:06:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Sm8-000648-Jd
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:06:08 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Sm2-0001uN-Bw
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:06:03 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 t19-20020a9d7753000000b0066d77a3d474so1974409otl.10
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 18:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7jUA9/ifCEteEPBnCrvu2FZgUNzc6y0gw3a24gfdjs4=;
 b=HxAveCWgvQLvuwx7kmTfdN3yu1EjNH74nOXqhBuLg63HFSva9vsVdLlwVv7os42ZQj
 D/gnwvn/I4HmSkdaCRjNj1sTijskSprI8uVCAfk8+P1ac+Nro4EbZFtxwctXbG/kXCv+
 IrbWwFH52y5KuFI/292r0bx7ow62S0xwxlbJN4fUHpbDqXH68yu2Ph+lgTkfefk2uSQr
 PBDbNt9WH92DLcgbmgpO6tR5Gi85JD+ga6anfsBx0GXmc42+Z6i5/YsgP8xOJDq5g4p/
 kueN/GPu7wYipk2GrorhMQ1jstJ8wjovMTTuobi07gP1BPWMGYcOejP41/7FGTp43CSZ
 q92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7jUA9/ifCEteEPBnCrvu2FZgUNzc6y0gw3a24gfdjs4=;
 b=YS/1IBJPrrX+XNONpwBiz4dmiY88onmtFczFyDmnAMCrN+vbyF3yBLbrqSbZcuRKbo
 8fcp79m81YAlfIEp5+sNcyVFb9xi4fOUh9qqUOrdziW1D5PlsqZ9wr3d+iaAZvQWzSpe
 WhWiYdOn1loBQfHa27hLHS2EVoGC57+jnQFSg3SylFeq1Alm52J90eRDZdh2ZlBEJ+jp
 IQCzbVEgUh25di8wPBDQgpgmmO36OM6uZrMGxs+5Om4iBwZnDbYSd6AJP4ma05Xiz5Sj
 l5yLqWIHun8/tkC8p/oSOY6NGSUAK/l9Ved7LG7GZBEw+fwDrVfFhJoJ+x97I9hZN6j9
 Fxqg==
X-Gm-Message-State: ANoB5pnZzk7vF2Xa8qPEWtLLYYRRMZq6V4L8xNXpz2bussbSLU1rLim0
 M+f8L5uMa7KlncPjbwO+6dvpld28J6N1XceeZiM=
X-Google-Smtp-Source: AA0mqf5cKiuCkWIl2QeT1/pImPIPEpJYLlxhJWdYBDtRHmWmyB72UgMvThE0vh4iY9nANLLjcXFSEQ==
X-Received: by 2002:a05:6830:3809:b0:66e:7670:e684 with SMTP id
 bh9-20020a056830380900b0066e7670e684mr3294666otb.20.1670551560689; 
 Thu, 08 Dec 2022 18:06:00 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:d298:de6f:2ed:87a4])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05683004ce00b0066f7e1188f0sm53531otd.68.2022.12.08.18.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 18:06:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v4 24/27] tcg/s390x: Implement ctpop operation
Date: Thu,  8 Dec 2022 20:05:27 -0600
Message-Id: <20221209020530.396391-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209020530.396391-1-richard.henderson@linaro.org>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
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


