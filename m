Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 101C44C307D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 16:56:15 +0100 (CET)
Received: from localhost ([::1]:43860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNGTW-0004KY-5s
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 10:56:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNGHZ-0003tN-Bq
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:43:54 -0500
Received: from [2607:f8b0:4864:20::532] (port=42676
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNGHX-0008Lr-3I
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:43:52 -0500
Received: by mail-pg1-x532.google.com with SMTP id o8so2038598pgf.9
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 07:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2T8Cy1usNOzD6NJsQzXyt+P4N3Ig0I8CKaStY4AJvBk=;
 b=ymELVw1J6M/VOaNKlVraFDNAnuUnMSkrg3pY1dn8OG0uRkJNscywETNOP/OcbqteU/
 dVgcD5W0i2AXkgUCUtORwPtZV/DU6FqEcTdU6fbY66DGwxNCyK9QyKJeiwB9+rQsx4QL
 MifrhDOscCywFpWfZGcorV6HRMADw+xYDDlmyN2HlmQnVyIK3mjgMgXW8qoiiOnXuNy7
 fW0diNCmvYZqqqiDjC0l3CHLWP2azd1heOFJzJv9swfUspOsEBw0um7m6xEh30qcb75p
 4Og60ynGUocgAERJaY0Cv9EnpP9l0YD2j1Hm2QKMCNKd0/qUizGXELZILxTFkBX/F80B
 Zr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2T8Cy1usNOzD6NJsQzXyt+P4N3Ig0I8CKaStY4AJvBk=;
 b=GpLxfc/ZnCD1vg7SB1VqhZn6jTvGIpePT4IaFEwldKOzwbXhat9IgM5Cd6YEcAoHhs
 yxnFM0mXjZUMFykhOts9Qjbs9cOF/CeDBbjYHEVDinuVckC1mWqcenjivT4vF+wtV9D0
 yoCEtRN/y/bOUWki2i8Bk775nOFw/SRyUPmoYBz8TeK11IWIAFgfTvbz6CU30IYDqI2A
 iPzVtwYRQeTA9q5592NqGRL2Of6hnkEvq8nuuGFS55jtU3TWMPE97hqxmWI3AYVMbVhS
 e7EERS+1fAdcJb2n1o8VtKVOmuyIB3beSVqMj/CNaSs9R3nWZym7xwJrMoNhbvx+gZhM
 ZRPw==
X-Gm-Message-State: AOAM531kb0g9KRxJP7NxmA5uLiu7EPa1i0LjuYxDYE60W3+xd4MMhZwT
 vl8WATbGjzTMTT9TRRlFA2fJSRXEDXDG5Q==
X-Google-Smtp-Source: ABdhPJwVlEmj8BlQ2ITnEAxhKdYhD9UBlcBUslK66pNLXMRkTYdJEGnyt9eiSt1dTtIzbBTCWYUduw==
X-Received: by 2002:a63:1719:0:b0:373:9a4a:368d with SMTP id
 x25-20020a631719000000b003739a4a368dmr2729987pgl.134.1645717429651; 
 Thu, 24 Feb 2022 07:43:49 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id v20sm3198062pju.9.2022.02.24.07.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 07:43:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/10] tcg/s390x: Use vector ctz for integer ctz
Date: Thu, 24 Feb 2022 05:43:32 -1000
Message-Id: <20220224154333.125185-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224154333.125185-1-richard.henderson@linaro.org>
References: <20220224154333.125185-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, david@redhat.com, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no integer version of ctz, but there is a vector one.
Push the values to and fro, then fix up as required for the
semantics of the tcg operation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     |  4 ++--
 tcg/s390x/tcg-target.c.inc | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 53c4da7730..4aff59b7c0 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -90,7 +90,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_nand_i32       HAVE_FACILITY(MISC_INSN_EXT3)
 #define TCG_TARGET_HAS_nor_i32        HAVE_FACILITY(MISC_INSN_EXT3)
 #define TCG_TARGET_HAS_clz_i32        0
-#define TCG_TARGET_HAS_ctz_i32        0
+#define TCG_TARGET_HAS_ctz_i32        HAVE_FACILITY(VECTOR)
 #define TCG_TARGET_HAS_ctpop_i32      0
 #define TCG_TARGET_HAS_deposit_i32    HAVE_FACILITY(GEN_INST_EXT)
 #define TCG_TARGET_HAS_extract_i32    HAVE_FACILITY(GEN_INST_EXT)
@@ -127,7 +127,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_nand_i64       HAVE_FACILITY(MISC_INSN_EXT3)
 #define TCG_TARGET_HAS_nor_i64        HAVE_FACILITY(MISC_INSN_EXT3)
 #define TCG_TARGET_HAS_clz_i64        HAVE_FACILITY(EXT_IMM)
-#define TCG_TARGET_HAS_ctz_i64        0
+#define TCG_TARGET_HAS_ctz_i64        HAVE_FACILITY(VECTOR)
 #define TCG_TARGET_HAS_ctpop_i64      0
 #define TCG_TARGET_HAS_deposit_i64    HAVE_FACILITY(GEN_INST_EXT)
 #define TCG_TARGET_HAS_extract_i64    HAVE_FACILITY(GEN_INST_EXT)
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index e32eddf584..9c3f8f365e 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -64,6 +64,7 @@
 
 /* A scratch register that may be be used throughout the backend.  */
 #define TCG_TMP0        TCG_REG_R1
+#define TCG_TMPV        TCG_REG_V31
 
 /* A scratch register that holds a pointer to the beginning of the TB.
    We don't need this when we have pc-relative loads with the general
@@ -291,6 +292,7 @@ typedef enum S390Opcode {
     VRIb_VGM    = 0xe746,
     VRIc_VREP   = 0xe74d,
 
+    VRRa_VCTZ   = 0xe752,
     VRRa_VLC    = 0xe7de,
     VRRa_VLP    = 0xe7df,
     VRRa_VLR    = 0xe756,
@@ -1669,6 +1671,29 @@ static void tgen_clz(TCGContext *s, TCGReg dest, TCGReg a1,
     tgen_movcond_int(s, TCG_TYPE_I64, dest, a2, a2const, TCG_REG_R0, 8, 2);
 }
 
+static void tgen_ctz(TCGContext *s, TCGType type, TCGReg dest,
+                     TCGReg a1, TCGArg a2, int a2const)
+{
+    MemOp vece = type == TCG_TYPE_I32 ? MO_32 : MO_64;
+    int width = 8 << vece;
+    int cc, inv_cc;
+    TCGReg src;
+
+    tcg_out_mov(s, type, TCG_TMPV, a1);
+    tcg_out_insn(s, VRRa, VCTZ, TCG_TMPV, TCG_TMPV, vece);
+
+    if (a2const && a2 == width) {
+        tcg_out_mov(s, type, dest, TCG_TMPV);
+        return;
+    }
+
+    cc = tgen_cmp2(s, type, TCG_COND_EQ, a1, 0, true, false, &inv_cc);
+
+    src = (a2const || dest != a2 ? dest : TCG_TMP0);
+    tcg_out_mov(s, type, src, TCG_TMPV);
+    tgen_movcond_int(s, type, dest, a2, a2const, src, cc, inv_cc);
+}
+
 static void tgen_deposit(TCGContext *s, TCGReg dest, TCGReg src,
                          int ofs, int len, int z)
 {
@@ -2826,6 +2851,13 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tgen_clz(s, args[0], args[1], args[2], const_args[2]);
         break;
 
+    case INDEX_op_ctz_i32:
+        tgen_ctz(s, TCG_TYPE_I32, args[0], args[1], args[2], const_args[2]);
+        break;
+    case INDEX_op_ctz_i64:
+        tgen_ctz(s, TCG_TYPE_I64, args[0], args[1], args[2], const_args[2]);
+        break;
+
     case INDEX_op_mb:
         /* The host memory model is quite strong, we simply need to
            serialize the instruction stream.  */
@@ -3303,6 +3335,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         return C_O1_I2(r, r, ri);
 
     case INDEX_op_clz_i64:
+    case INDEX_op_ctz_i32:
+    case INDEX_op_ctz_i64:
         return C_O1_I2(r, r, rI);
 
     case INDEX_op_sub_i32:
@@ -3557,6 +3591,7 @@ static void tcg_target_init(TCGContext *s)
 
     s->reserved_regs = 0;
     tcg_regset_set_reg(s->reserved_regs, TCG_TMP0);
+    tcg_regset_set_reg(s->reserved_regs, TCG_TMPV);
     /* XXX many insns can't be used with R0, so we better avoid it for now */
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_R0);
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_CALL_STACK);
-- 
2.25.1


