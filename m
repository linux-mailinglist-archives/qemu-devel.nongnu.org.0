Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC799350D72
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 06:08:20 +0200 (CEST)
Received: from localhost ([::1]:49884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRod1-0003K0-UT
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 00:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lRoPH-0001my-Vm
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 23:54:09 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:46761)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lRoPE-0004ri-RK
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 23:54:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617249244; x=1648785244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v+bhglNwG8NpJm17TDY1q2nZ94MQtJKap+Gf+OKMGGQ=;
 b=ARZjSXduK4MOnTxk9vohUnSNwd1cZz8HRQB5g4ghh9EBcLaV6V9cDhrL
 sf5ZRy50SC8Zcl4zqJSY+nxEkKXmBfSKdi3OsvG2u8V7d6p65c59tUD9M
 w2+g9lcXiMzRyqICalFeta6C7clou5lo0aMcqStZ2wjNkZJ9O8hvUoPOL Y=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 31 Mar 2021 20:53:43 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg05-sd.qualcomm.com with ESMTP; 31 Mar 2021 20:53:42 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 0B82916AF; Wed, 31 Mar 2021 22:53:40 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/21] Hexagon (target/hexagon) add A4_addp_c/A4_subp_c
Date: Wed, 31 Mar 2021 22:53:28 -0500
Message-Id: <1617249213-22667-17-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: ale@rev.ng, philmd@redhat.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rdd32 = add(Rss32, Rtt32, Px4):carry
    Add with carry
Rdd32 = sub(Rss32, Rtt32, Px4):carry
    Sub with carry

Test cases in tests/tcg/hexagon/multi_result.c

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/gen_tcg.h              | 37 ++++++++++++++++
 target/hexagon/genptr.c               | 11 +++++
 target/hexagon/imported/alu.idef      | 15 +++++++
 target/hexagon/imported/encode_pp.def |  2 +
 tests/tcg/hexagon/multi_result.c      | 82 +++++++++++++++++++++++++++++++++++
 5 files changed, 147 insertions(+)

diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
index d6ed5d9..c6c9cf9 100644
--- a/target/hexagon/gen_tcg.h
+++ b/target/hexagon/gen_tcg.h
@@ -238,6 +238,43 @@
     } while (0)
 
 /*
+ * Add or subtract with carry.
+ * Predicate register is used as an extra input and output.
+ * r5:4 = add(r1:0, r3:2, p1):carry
+ */
+#define fGEN_TCG_A4_addp_c(SHORTCODE) \
+    do { \
+        TCGv_i64 carry = tcg_temp_new_i64(); \
+        TCGv_i64 zero = tcg_const_i64(0); \
+        tcg_gen_extu_i32_i64(carry, PxV); \
+        tcg_gen_andi_i64(carry, carry, 1); \
+        tcg_gen_add2_i64(RddV, carry, RssV, zero, carry, zero); \
+        tcg_gen_add2_i64(RddV, carry, RddV, carry, RttV, zero); \
+        tcg_gen_extrl_i64_i32(PxV, carry); \
+        gen_8bitsof(PxV, PxV); \
+        tcg_temp_free_i64(carry); \
+        tcg_temp_free_i64(zero); \
+    } while (0)
+
+/* r5:4 = sub(r1:0, r3:2, p1):carry */
+#define fGEN_TCG_A4_subp_c(SHORTCODE) \
+    do { \
+        TCGv_i64 carry = tcg_temp_new_i64(); \
+        TCGv_i64 zero = tcg_const_i64(0); \
+        TCGv_i64 not_RttV = tcg_temp_new_i64(); \
+        tcg_gen_extu_i32_i64(carry, PxV); \
+        tcg_gen_andi_i64(carry, carry, 1); \
+        tcg_gen_not_i64(not_RttV, RttV); \
+        tcg_gen_add2_i64(RddV, carry, RssV, zero, carry, zero); \
+        tcg_gen_add2_i64(RddV, carry, RddV, carry, not_RttV, zero); \
+        tcg_gen_extrl_i64_i32(PxV, carry); \
+        gen_8bitsof(PxV, PxV); \
+        tcg_temp_free_i64(carry); \
+        tcg_temp_free_i64(zero); \
+        tcg_temp_free_i64(not_RttV); \
+    } while (0)
+
+/*
  * Compare each of the 8 unsigned bytes
  * The minimum is placed in each byte of the destination.
  * Each bit of the predicate is set true if the bit from the first operand
diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 6755194..69a0202 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -361,5 +361,16 @@ static inline void gen_store_conditional8(CPUHexagonState *env,
     tcg_gen_movi_tl(hex_llsc_addr, ~0);
 }
 
+static TCGv gen_8bitsof(TCGv result, TCGv value)
+{
+    TCGv zero = tcg_const_tl(0);
+    TCGv ones = tcg_const_tl(0xff);
+    tcg_gen_movcond_tl(TCG_COND_NE, result, value, zero, ones, zero);
+    tcg_temp_free(zero);
+    tcg_temp_free(ones);
+
+    return result;
+}
+
 #include "tcg_funcs_generated.c.inc"
 #include "tcg_func_table_generated.c.inc"
diff --git a/target/hexagon/imported/alu.idef b/target/hexagon/imported/alu.idef
index f0c9bb4..58477ae 100644
--- a/target/hexagon/imported/alu.idef
+++ b/target/hexagon/imported/alu.idef
@@ -153,6 +153,21 @@ Q6INSN(A2_subp,"Rdd32=sub(Rtt32,Rss32)",ATTRIBS(),
 "Sub",
 { RddV=RttV-RssV;})
 
+/* 64-bit with carry */
+
+Q6INSN(A4_addp_c,"Rdd32=add(Rss32,Rtt32,Px4):carry",ATTRIBS(),"Add with Carry",
+{
+  RddV = RssV + RttV + fLSBOLD(PxV);
+  PxV = f8BITSOF(fCARRY_FROM_ADD(RssV,RttV,fLSBOLD(PxV)));
+})
+
+Q6INSN(A4_subp_c,"Rdd32=sub(Rss32,Rtt32,Px4):carry",ATTRIBS(),"Sub with Carry",
+{
+  RddV = RssV + ~RttV + fLSBOLD(PxV);
+  PxV = f8BITSOF(fCARRY_FROM_ADD(RssV,~RttV,fLSBOLD(PxV)));
+})
+
+
 /* NEG and ABS */
 
 Q6INSN(A2_negsat,"Rd32=neg(Rs32):sat",ATTRIBS(),
diff --git a/target/hexagon/imported/encode_pp.def b/target/hexagon/imported/encode_pp.def
index 4619398..514c240 100644
--- a/target/hexagon/imported/encode_pp.def
+++ b/target/hexagon/imported/encode_pp.def
@@ -1749,6 +1749,8 @@ SH_RRR_ENC(S4_extractp_rp,      "0001","11-","-","10-","ddddd")
 DEF_FIELDROW_DESC32(ICLASS_S3op" 0010 -------- PP------ --------","[#2] Rdd=(Rss,Rtt,Pu)")
 SH_RRR_ENC(S2_valignrb,         "0010","0--","-","-uu","ddddd")
 SH_RRR_ENC(S2_vsplicerb,        "0010","100","-","-uu","ddddd")
+SH_RRR_ENC(A4_addp_c,           "0010","110","-","-xx","ddddd")
+SH_RRR_ENC(A4_subp_c,           "0010","111","-","-xx","ddddd")
 
 
 DEF_FIELDROW_DESC32(ICLASS_S3op" 0011 -------- PP------ --------","[#3] Rdd=(Rss,Rt)")
diff --git a/tests/tcg/hexagon/multi_result.c b/tests/tcg/hexagon/multi_result.c
index aa2d586..4007b63 100644
--- a/tests/tcg/hexagon/multi_result.c
+++ b/tests/tcg/hexagon/multi_result.c
@@ -85,6 +85,38 @@ static long long vminub(long long Rtt, long long Rss,
   return result;
 }
 
+static long long add_carry(long long Rss, long long Rtt,
+                           int pred_in, int *pred_result)
+{
+  long long result;
+  int predval = pred_in;
+
+  asm volatile("p0 = %1\n\t"
+               "%0 = add(%2, %3, p0):carry\n\t"
+               "%1 = p0\n\t"
+               : "=r"(result), "+r"(predval)
+               : "r"(Rss), "r"(Rtt)
+               : "p0");
+  *pred_result = predval;
+  return result;
+}
+
+static long long sub_carry(long long Rss, long long Rtt,
+                           int pred_in, int *pred_result)
+{
+  long long result;
+  int predval = pred_in;
+
+  asm volatile("p0 = !cmp.eq(%1, #0)\n\t"
+               "%0 = sub(%2, %3, p0):carry\n\t"
+               "%1 = p0\n\t"
+               : "=r"(result), "+r"(predval)
+               : "r"(Rss), "r"(Rtt)
+               : "p0");
+  *pred_result = predval;
+  return result;
+}
+
 int err;
 
 static void check_ll(long long val, long long expect)
@@ -181,12 +213,62 @@ static void test_vminub()
     check_p(pred_result, 0xaa);
 }
 
+static void test_add_carry()
+{
+    long long res64;
+    int pred_result;
+
+    res64 = add_carry(0x0000000000000000LL,
+                      0xffffffffffffffffLL,
+                      1, &pred_result);
+    check_ll(res64, 0x0000000000000000LL);
+    check_p(pred_result, 0xff);
+
+    res64 = add_carry(0x0000000100000000LL,
+                      0xffffffffffffffffLL,
+                      0, &pred_result);
+    check_ll(res64, 0x00000000ffffffffLL);
+    check_p(pred_result, 0xff);
+
+    res64 = add_carry(0x0000000100000000LL,
+                      0xffffffffffffffffLL,
+                      0, &pred_result);
+    check_ll(res64, 0x00000000ffffffffLL);
+    check_p(pred_result, 0xff);
+}
+
+static void test_sub_carry()
+{
+    long long res64;
+    int pred_result;
+
+    res64 = sub_carry(0x0000000000000000LL,
+                      0x0000000000000000LL,
+                      1, &pred_result);
+    check_ll(res64, 0x0000000000000000LL);
+    check_p(pred_result, 0xff);
+
+    res64 = sub_carry(0x0000000100000000LL,
+                      0x0000000000000000LL,
+                      0, &pred_result);
+    check_ll(res64, 0x00000000ffffffffLL);
+    check_p(pred_result, 0xff);
+
+    res64 = sub_carry(0x0000000100000000LL,
+                      0x0000000000000000LL,
+                      0, &pred_result);
+    check_ll(res64, 0x00000000ffffffffLL);
+    check_p(pred_result, 0xff);
+}
+
 int main()
 {
     test_sfrecipa();
     test_sfinvsqrta();
     test_vacsh();
     test_vminub();
+    test_add_carry();
+    test_sub_carry();
 
     puts(err ? "FAIL" : "PASS");
     return err;
-- 
2.7.4


