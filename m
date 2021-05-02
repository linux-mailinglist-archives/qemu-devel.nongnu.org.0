Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC2F370D97
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 17:12:09 +0200 (CEST)
Received: from localhost ([::1]:53236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldDlQ-0002jz-KQ
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 11:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKr-0001jT-5P
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:41 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:36771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKo-0005Hy-7u
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:40 -0400
Received: by mail-pg1-x535.google.com with SMTP id j7so1926394pgi.3
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 07:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dT+w9JygmnLwtPadRmzu3U6SgMiBL3bicGhZHH25Tfk=;
 b=Nbp+yzn/oLcRNX+pnrmfTxMctHvLBRL6N6yG2O8/McVBOv14VBmsVpTlCwV2qP8COo
 l11Bj5E1JuogQFDCC/3IVfe8CzkLH+4TxtDJ2DD2YciQy6MymitXjp+VxJUSZp9y6Rvn
 LUh/dPIilz8zzDRRMmXYlHa0T0i0QgRnVdUf/M6sYuHIDR8L964IiSGtHJBk0b9lQsBN
 jNnuRtf7TyU+AnNDnNaF95daJDD70oBcP6DzYGE3YvUbNARc7GrCWPj6DUQDt9/Fra+Z
 BJ1HpkZGUrtkrkDdFTCmT2qCORXZ4PrmGcof+AmUFUPAV2Ej3J52QExk+7BPzvBhOKeh
 Eh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dT+w9JygmnLwtPadRmzu3U6SgMiBL3bicGhZHH25Tfk=;
 b=q4Vm5lVMHPWKph1ypD3AyA1+y8lbwVS/XekCteWrf/bVPzcHneDYtDfi3BBbUG81wa
 63vr/kk41P4XEmAJb5evPmYXcKlZ7n9obFt4uXiM0hJH9d4M+HInk1qt3JbV0KrMfdfv
 ZBTS/LUezzkFV0TzCVkfmZZ9+k174eKwQi7SCt3LAzFadngPXOl+bKrG/pTa9HOzI2yn
 uYJs3r85t+r98ldv88+YoWUcHIH8ySOhM9AXBMAXhBJk6fK6c+YvjgCLtXDkHyrlxTDE
 v8Ii409yYaIHgjhfDSAtalY+B+r+4l6i48w9V7LJxOZm3U6AqGeRtBLu9eq+S60e9ffi
 LWRw==
X-Gm-Message-State: AOAM532CaeJWNwek8unt5UzkF04/LKPIdkT6lM6gPNQUOrUHOMlSddlE
 Ejf9xsmVM5YJ8PifhJK7H2tG3jFd/Lc8og==
X-Google-Smtp-Source: ABdhPJwNxk2D/GPx3WnWr5r3apHMKN6vD+LzezwtBb7Sy2etGCQ1QTkQM7hOu5gqlg8e7b79HeSWEg==
X-Received: by 2002:a62:f202:0:b029:28e:96e7:a084 with SMTP id
 m2-20020a62f2020000b029028e96e7a084mr1015019pfh.59.1619966676812; 
 Sun, 02 May 2021 07:44:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w14sm6889110pff.94.2021.05.02.07.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 07:44:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 25/31] Hexagon (target/hexagon) add A6_vminub_RdP
Date: Sun,  2 May 2021 07:44:13 -0700
Message-Id: <20210502144419.1659844-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502144419.1659844-1-richard.henderson@linaro.org>
References: <20210502144419.1659844-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

Rdd32,Pe4 = vminub(Rtt32, Rss32)
    Vector min of bytes

Test cases in tests/tcg/hexagon/multi_result.c

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-21-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/gen_tcg.h              | 27 +++++++++++++++++++++
 target/hexagon/genptr.c               | 22 +++++++++++++++++
 tests/tcg/hexagon/multi_result.c      | 34 +++++++++++++++++++++++++++
 target/hexagon/imported/alu.idef      | 10 ++++++++
 target/hexagon/imported/encode_pp.def |  1 +
 5 files changed, 94 insertions(+)

diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
index 93310c5edc..aea0c55564 100644
--- a/target/hexagon/gen_tcg.h
+++ b/target/hexagon/gen_tcg.h
@@ -237,6 +237,33 @@
         tcg_temp_free_i64(tmp); \
     } while (0)
 
+/*
+ * Compare each of the 8 unsigned bytes
+ * The minimum is placed in each byte of the destination.
+ * Each bit of the predicate is set true if the bit from the first operand
+ * is greater than the bit from the second operand.
+ * r5:4,p1 = vminub(r1:0, r3:2)
+ */
+#define fGEN_TCG_A6_vminub_RdP(SHORTCODE) \
+    do { \
+        TCGv left = tcg_temp_new(); \
+        TCGv right = tcg_temp_new(); \
+        TCGv tmp = tcg_temp_new(); \
+        tcg_gen_movi_tl(PeV, 0); \
+        tcg_gen_movi_i64(RddV, 0); \
+        for (int i = 0; i < 8; i++) { \
+            gen_get_byte_i64(left, i, RttV, false); \
+            gen_get_byte_i64(right, i, RssV, false); \
+            tcg_gen_setcond_tl(TCG_COND_GT, tmp, left, right); \
+            tcg_gen_deposit_tl(PeV, PeV, tmp, i, 1); \
+            tcg_gen_umin_tl(tmp, left, right); \
+            gen_set_byte_i64(i, RddV, tmp); \
+        } \
+        tcg_temp_free(left); \
+        tcg_temp_free(right); \
+        tcg_temp_free(tmp); \
+    } while (0)
+
 /* Floating point */
 #define fGEN_TCG_F2_conv_sf2df(SHORTCODE) \
     gen_helper_conv_sf2df(RddV, cpu_env, RsV)
diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 24d575853c..9dbebc64b5 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -266,6 +266,28 @@ static inline void gen_write_ctrl_reg_pair(DisasContext *ctx, int reg_num,
     }
 }
 
+static TCGv gen_get_byte_i64(TCGv result, int N, TCGv_i64 src, bool sign)
+{
+    TCGv_i64 res64 = tcg_temp_new_i64();
+    if (sign) {
+        tcg_gen_sextract_i64(res64, src, N * 8, 8);
+    } else {
+        tcg_gen_extract_i64(res64, src, N * 8, 8);
+    }
+    tcg_gen_extrl_i64_i32(result, res64);
+    tcg_temp_free_i64(res64);
+
+    return result;
+}
+
+static void gen_set_byte_i64(int N, TCGv_i64 result, TCGv src)
+{
+    TCGv_i64 src64 = tcg_temp_new_i64();
+    tcg_gen_extu_i32_i64(src64, src);
+    tcg_gen_deposit_i64(result, result, src64, N * 8, 8);
+    tcg_temp_free_i64(src64);
+}
+
 static inline void gen_load_locked4u(TCGv dest, TCGv vaddr, int mem_index)
 {
     tcg_gen_qemu_ld32u(dest, vaddr, mem_index);
diff --git a/tests/tcg/hexagon/multi_result.c b/tests/tcg/hexagon/multi_result.c
index c21148fc20..95d99a0c90 100644
--- a/tests/tcg/hexagon/multi_result.c
+++ b/tests/tcg/hexagon/multi_result.c
@@ -70,6 +70,21 @@ static long long vacsh(long long Rxx, long long Rss, long long Rtt,
   return result;
 }
 
+static long long vminub(long long Rtt, long long Rss,
+                        int *pred_result)
+{
+  long long result;
+  int predval;
+
+  asm volatile("%0,p0 = vminub(%2, %3)\n\t"
+               "%1 = p0\n\t"
+               : "=r"(result), "=r"(predval)
+               : "r"(Rtt), "r"(Rss)
+               : "p0");
+  *pred_result = predval;
+  return result;
+}
+
 int err;
 
 static void check_ll(long long val, long long expect)
@@ -155,11 +170,30 @@ static void test_vacsh()
     check(ovf_result, 0);
 }
 
+static void test_vminub()
+{
+    long long res64;
+    int pred_result;
+
+    res64 = vminub(0x0807060504030201LL,
+                   0x0102030405060708LL,
+                   &pred_result);
+    check_ll(res64, 0x0102030404030201LL);
+    check_p(pred_result, 0xf0);
+
+    res64 = vminub(0x0802060405030701LL,
+                   0x0107030504060208LL,
+                   &pred_result);
+    check_ll(res64, 0x0102030404030201LL);
+    check_p(pred_result, 0xaa);
+}
+
 int main()
 {
     test_sfrecipa();
     test_sfinvsqrta();
     test_vacsh();
+    test_vminub();
 
     puts(err ? "FAIL" : "PASS");
     return err;
diff --git a/target/hexagon/imported/alu.idef b/target/hexagon/imported/alu.idef
index e8cc52c290..f0c9bb47ec 100644
--- a/target/hexagon/imported/alu.idef
+++ b/target/hexagon/imported/alu.idef
@@ -1259,6 +1259,16 @@ Q6INSN(A5_ACS,"Rxx32,Pe4=vacsh(Rss32,Rtt32)",ATTRIBS(),
         }
 })
 
+Q6INSN(A6_vminub_RdP,"Rdd32,Pe4=vminub(Rtt32,Rss32)",ATTRIBS(),
+"Vector minimum of bytes, records minimum and decision vector",
+{
+        fHIDE(int i;)
+        for (i = 0; i < 8; i++) {
+            fSETBIT(i, PeV,     (fGETUBYTE(i,RttV) > fGETUBYTE(i,RssV)));
+            fSETBYTE(i,RddV,fMIN(fGETUBYTE(i,RttV),fGETUBYTE(i,RssV)));
+        }
+})
+
 /**********************************************/
 /* Vector Min/Max                             */
 /**********************************************/
diff --git a/target/hexagon/imported/encode_pp.def b/target/hexagon/imported/encode_pp.def
index 87e0426c05..46193984c5 100644
--- a/target/hexagon/imported/encode_pp.def
+++ b/target/hexagon/imported/encode_pp.def
@@ -1018,6 +1018,7 @@ MPY_ENC(M7_dcmpyiwc_acc,     "1010","xxxxx","1","0","1","0","10")
 
 
 MPY_ENC(A5_ACS,              "1010","xxxxx","0","1","0","1","ee")
+MPY_ENC(A6_vminub_RdP,       "1010","ddddd","0","1","1","1","ee")
 /*
 */
 
-- 
2.25.1


