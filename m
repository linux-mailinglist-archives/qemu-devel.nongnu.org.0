Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD913708B9
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 21:14:07 +0200 (CEST)
Received: from localhost ([::1]:41018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcv42-0003IU-FH
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 15:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuaw-00007C-5q
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:44:02 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:45912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuag-0000BE-3D
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:44:01 -0400
Received: by mail-pg1-x52d.google.com with SMTP id d10so825804pgf.12
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 11:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bko11SHAX916ignYkLJOit9Le7a99eo2cbUa1LPPGg8=;
 b=WuwXWHJ2dcraQkar9tf5kxRSB7KdrsH7qACpX7hqqroG9QJ+Geo3gLG4PTMGWEuq9y
 U09mWe+oUVyZW1xMPnTuQWDQ9pw9wVwD0XyemIaWPSa00bFVSS3JDfD/8Ah6JZ5KbhcE
 s6mcTlZxY2KKnK/D9SiEX69YPz6A+sFaMpSWNR8pIlJSTFAnSTDUVIARWcX96KBGlVaK
 vmgpjTGGh0AnyHfQTX6ECIS7sCojSd0Z/WkgGAfMDUnHzm2x+pKOZm5pp4WY0tfLGUSp
 7bnPFzN7J68e6hbv4c125kNi/ROnMOXCgha44Enf/mXNIhHC3EtfphF0kyHQE6EXfHuu
 Se4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bko11SHAX916ignYkLJOit9Le7a99eo2cbUa1LPPGg8=;
 b=NAoTWoh/TdHpCkNfQ3w4iYiW9NcpDSlsku1bE1Cm9+ZaMT1qASZTU03WLdYJqV9y71
 vwzeyQ+N5EypkUPke/xd0WdFmso9GWbAmrQuxMWs7SE/EXQkEjdhw3iq4D3vpiikLWaG
 FrZAQJuB3tE4fbcG13UFCFuKM2ztaIL9ACxHEXdbba33fpIsa9xJzi37UjmEdiHnBVD6
 jhkbb5mFlRW+KX/1Pht5pHGKLjs2aDa7aFjUermePb5ESPZhabatSk1VWrnTzVFPF9tj
 GKy13Dh+Y1nv7O5QlLGsl02XL7D+5aQUMN/lLd3wMwH8rQ66JZqwOdelzXmYsPh65a86
 c+WA==
X-Gm-Message-State: AOAM533m2kzrPfe1YDs1EoGvCUXNUlJyEXn2HeL7KzYQ7zUI3TFJRFk0
 L+fzUM93cs1suos7gflFBlv7/30KUAEUKQ==
X-Google-Smtp-Source: ABdhPJwhS1zAsGZYEWJ9GnMVVlhfPucq97PBBQz29xF0mS6pJoxhtScMODRhvI1BB9bP6U03NxVAiQ==
X-Received: by 2002:a65:4341:: with SMTP id k1mr10258061pgq.178.1619894621989; 
 Sat, 01 May 2021 11:43:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id i11sm5309088pfa.108.2021.05.01.11.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 11:43:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/31] Hexagon (target/hexagon) add A4_addp_c/A4_subp_c
Date: Sat,  1 May 2021 11:43:19 -0700
Message-Id: <20210501184324.1338186-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501184324.1338186-1-richard.henderson@linaro.org>
References: <20210501184324.1338186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Rdd32 = add(Rss32, Rtt32, Px4):carry
    Add with carry
Rdd32 = sub(Rss32, Rtt32, Px4):carry
    Sub with carry

Test cases in tests/tcg/hexagon/multi_result.c

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-22-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/gen_tcg.h              | 37 ++++++++++++
 target/hexagon/genptr.c               | 11 ++++
 tests/tcg/hexagon/multi_result.c      | 82 +++++++++++++++++++++++++++
 target/hexagon/imported/alu.idef      | 15 +++++
 target/hexagon/imported/encode_pp.def |  2 +
 5 files changed, 147 insertions(+)

diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
index aea0c55564..6bc578dfda 100644
--- a/target/hexagon/gen_tcg.h
+++ b/target/hexagon/gen_tcg.h
@@ -237,6 +237,43 @@
         tcg_temp_free_i64(tmp); \
     } while (0)
 
+/*
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
 /*
  * Compare each of the 8 unsigned bytes
  * The minimum is placed in each byte of the destination.
diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 9dbebc64b5..333f7d74bf 100644
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
diff --git a/tests/tcg/hexagon/multi_result.c b/tests/tcg/hexagon/multi_result.c
index 95d99a0c90..52997b3128 100644
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
@@ -188,12 +220,62 @@ static void test_vminub()
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
diff --git a/target/hexagon/imported/alu.idef b/target/hexagon/imported/alu.idef
index f0c9bb47ec..58477ae40a 100644
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
index 46193984c5..514c2404ce 100644
--- a/target/hexagon/imported/encode_pp.def
+++ b/target/hexagon/imported/encode_pp.def
@@ -1749,6 +1749,8 @@ SH_RRR_ENC(S4_extractp_rp,      "0001","11-","-","10-","ddddd")
 DEF_FIELDROW_DESC32(ICLASS_S3op" 0010 -------- PP------ --------","[#2] Rdd=(Rss,Rtt,Pu)")
 SH_RRR_ENC(S2_valignrb,         "0010","0--","-","-uu","ddddd")
 SH_RRR_ENC(S2_vsplicerb,        "0010","100","-","-uu","ddddd")
+SH_RRR_ENC(A4_addp_c,           "0010","110","-","-xx","ddddd")
+SH_RRR_ENC(A4_subp_c,           "0010","111","-","-xx","ddddd")
 
 
 DEF_FIELDROW_DESC32(ICLASS_S3op" 0011 -------- PP------ --------","[#3] Rdd=(Rss,Rt)")
-- 
2.25.1


