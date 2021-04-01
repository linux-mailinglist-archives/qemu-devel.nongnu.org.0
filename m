Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49CF350D5C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 05:58:30 +0200 (CEST)
Received: from localhost ([::1]:45362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRoTV-0006kx-GN
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 23:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lRoP5-0001a1-6w
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 23:53:55 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:2906)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lRoP1-0004rm-A6
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 23:53:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617249231; x=1648785231;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cONzYXBl1C48Cfg3/2yBzAV2FnkuCNWGmOyvf3d4Hl4=;
 b=qQYj2Vc2jP0mqvmOCr8EKeSIhwzW9F7GYgO2Ni5P9dYpaSDZ/Kcg8Jg7
 IwZK5pMkGeoqJs5imyQDXtWUd8/sedNRIwrK/pcU30HcLbfV7G6M5PtnQ
 65BMR60fdegwJGdVDBcXq4m1hHdkFxL2jHkvosuu1WEWrYfE4o2Rh3bDa I=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 31 Mar 2021 20:53:42 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 31 Mar 2021 20:53:41 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id D805C1777; Wed, 31 Mar 2021 22:53:40 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/21] Hexagon (target/hexagon) add A6_vminub_RdP
Date: Wed, 31 Mar 2021 22:53:27 -0500
Message-Id: <1617249213-22667-16-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
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

Rdd32,Pe4 = vminub(Rtt32, Rss32)
    Vector min of bytes

Test cases in tests/tcg/hexagon/multi_result.c

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/gen_tcg.h              | 27 +++++++++++++++++++++++++++
 target/hexagon/genptr.c               | 22 ++++++++++++++++++++++
 target/hexagon/imported/alu.idef      | 10 ++++++++++
 target/hexagon/imported/encode_pp.def |  1 +
 tests/tcg/hexagon/multi_result.c      | 34 ++++++++++++++++++++++++++++++++++
 5 files changed, 94 insertions(+)

diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
index 7a57808..d6ed5d9 100644
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
index dad5292..6755194 100644
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
diff --git a/target/hexagon/imported/alu.idef b/target/hexagon/imported/alu.idef
index e8cc52c..f0c9bb4 100644
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
index 87e0426..4619398 100644
--- a/target/hexagon/imported/encode_pp.def
+++ b/target/hexagon/imported/encode_pp.def
@@ -1018,6 +1018,7 @@ MPY_ENC(M7_dcmpyiwc_acc,     "1010","xxxxx","1","0","1","0","10")
 
 
 MPY_ENC(A5_ACS,              "1010","xxxxx","0","1","0","1","ee")
+MPY_ENC(A6_vminub_RdP,       "1010","ddddd","0","1","1","1","ee")
 /*
 */
 
diff --git a/tests/tcg/hexagon/multi_result.c b/tests/tcg/hexagon/multi_result.c
index 45be86e..aa2d586 100644
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
@@ -148,11 +163,30 @@ static void test_vacsh()
     check(ovf_result, 1);
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
-- 
2.7.4


