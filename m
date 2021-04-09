Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20911359142
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 03:16:43 +0200 (CEST)
Received: from localhost ([::1]:56878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUflK-0007kv-2x
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 21:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lUfdX-0006YS-AH
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 21:08:39 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:6275)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lUfdV-0001F4-71
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 21:08:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617930517; x=1649466517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6NoCeIa//Kvq62CeI5mq63zgzz/NC9qlSqY9bYcN30c=;
 b=PznFcomNLAGd7BZamE5VxHfxX9JHN1kWKBWIke1Sh17Ihrar9PXSvmkB
 CNrTv8vrczsQcMFuzF2LcVle4eweOzhrfyKzjZZ4RtzPtnXFOFrhPZO+S
 cMNwjlEs6j8ABdawmNxQlDCeG6zmXlHFeq2P5DzzOUuzWypwIs8WooW5d E=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 08 Apr 2021 18:07:58 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 08 Apr 2021 18:07:58 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 8EB4C168B; Thu,  8 Apr 2021 20:07:56 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/26] Hexagon (target/hexagon) add A5_ACS (vacsh)
Date: Thu,  8 Apr 2021 20:07:47 -0500
Message-Id: <1617930474-31979-20-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617930474-31979-1-git-send-email-tsimpson@quicinc.com>
References: <1617930474-31979-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

Rxx32,Pe4 = vacsh(Rss32, Rtt32)
    Add compare and select elements of two vectors

Test cases in tests/tcg/hexagon/multi_result.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/gen_tcg.h              |  5 +++
 target/hexagon/helper.h               |  2 +
 target/hexagon/imported/alu.idef      | 19 ++++++++++
 target/hexagon/imported/encode_pp.def |  1 +
 target/hexagon/op_helper.c            | 33 +++++++++++++++++
 tests/tcg/hexagon/multi_result.c      | 69 +++++++++++++++++++++++++++++++++++
 6 files changed, 129 insertions(+)

diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
index d78e7b8..93310c5 100644
--- a/target/hexagon/gen_tcg.h
+++ b/target/hexagon/gen_tcg.h
@@ -199,6 +199,11 @@
  * Mathematical operations with more than one definition require
  * special handling
  */
+#define fGEN_TCG_A5_ACS(SHORTCODE) \
+    do { \
+        gen_helper_vacsh_pred(PeV, cpu_env, RxxV, RssV, RttV); \
+        gen_helper_vacsh_val(RxxV, cpu_env, RxxV, RssV, RttV); \
+    } while (0)
 
 /*
  * Approximate reciprocal
diff --git a/target/hexagon/helper.h b/target/hexagon/helper.h
index cb7508f..3824ae0 100644
--- a/target/hexagon/helper.h
+++ b/target/hexagon/helper.h
@@ -26,6 +26,8 @@ DEF_HELPER_2(commit_store, void, env, int)
 DEF_HELPER_FLAGS_4(fcircadd, TCG_CALL_NO_RWG_SE, s32, s32, s32, s32, s32)
 DEF_HELPER_3(sfrecipa, i64, env, f32, f32)
 DEF_HELPER_2(sfinvsqrta, i64, env, f32)
+DEF_HELPER_4(vacsh_val, s64, env, s64, s64, s64)
+DEF_HELPER_FLAGS_4(vacsh_pred, TCG_CALL_NO_RWG_SE, s32, env, s64, s64, s64)
 
 /* Floating point */
 DEF_HELPER_2(conv_sf2df, f64, env, f32)
diff --git a/target/hexagon/imported/alu.idef b/target/hexagon/imported/alu.idef
index 45cc529..e8cc52c 100644
--- a/target/hexagon/imported/alu.idef
+++ b/target/hexagon/imported/alu.idef
@@ -1240,6 +1240,25 @@ MINMAX(uw,WORD,UWORD,2)
 #undef VMINORMAX3
 
 
+Q6INSN(A5_ACS,"Rxx32,Pe4=vacsh(Rss32,Rtt32)",ATTRIBS(),
+"Add Compare and Select elements of two vectors, record the maximums and the decisions ",
+{
+        fHIDE(int i;)
+        fHIDE(int xv;)
+        fHIDE(int sv;)
+        fHIDE(int tv;)
+        for (i = 0; i < 4; i++) {
+                xv = (int) fGETHALF(i,RxxV);
+                sv = (int) fGETHALF(i,RssV);
+                tv = (int) fGETHALF(i,RttV);
+                xv = xv + tv;           //assumes 17bit datapath
+                sv = sv - tv;           //assumes 17bit datapath
+                fSETBIT(i*2,  PeV,  (xv > sv));
+                fSETBIT(i*2+1,PeV,  (xv > sv));
+                fSETHALF(i,   RxxV, fSATH(fMAX(xv,sv)));
+        }
+})
+
 /**********************************************/
 /* Vector Min/Max                             */
 /**********************************************/
diff --git a/target/hexagon/imported/encode_pp.def b/target/hexagon/imported/encode_pp.def
index 18fe45d..87e0426 100644
--- a/target/hexagon/imported/encode_pp.def
+++ b/target/hexagon/imported/encode_pp.def
@@ -1017,6 +1017,7 @@ MPY_ENC(M7_dcmpyiwc_acc,     "1010","xxxxx","1","0","1","0","10")
 
 
 
+MPY_ENC(A5_ACS,              "1010","xxxxx","0","1","0","1","ee")
 /*
 */
 
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index a25fb98..f9fb655 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -347,6 +347,39 @@ uint64_t HELPER(sfinvsqrta)(CPUHexagonState *env, float32 RsV)
     return ((uint64_t)RdV << 32) | PeV;
 }
 
+int64_t HELPER(vacsh_val)(CPUHexagonState *env,
+                           int64_t RxxV, int64_t RssV, int64_t RttV)
+{
+    for (int i = 0; i < 4; i++) {
+        int xv = sextract64(RxxV, i * 16, 16);
+        int sv = sextract64(RssV, i * 16, 16);
+        int tv = sextract64(RttV, i * 16, 16);
+        int max;
+        xv = xv + tv;
+        sv = sv - tv;
+        max = xv > sv ? xv : sv;
+        /* Note that fSATH can set the OVF bit in usr */
+        RxxV = deposit64(RxxV, i * 16, 16, fSATH(max));
+    }
+    return RxxV;
+}
+
+int32_t HELPER(vacsh_pred)(CPUHexagonState *env,
+                           int64_t RxxV, int64_t RssV, int64_t RttV)
+{
+    int32_t PeV = 0;
+    for (int i = 0; i < 4; i++) {
+        int xv = sextract64(RxxV, i * 16, 16);
+        int sv = sextract64(RssV, i * 16, 16);
+        int tv = sextract64(RttV, i * 16, 16);
+        xv = xv + tv;
+        sv = sv - tv;
+        PeV = deposit32(PeV, i * 2, 1, (xv > sv));
+        PeV = deposit32(PeV, i * 2 + 1, 1, (xv > sv));
+    }
+    return PeV;
+}
+
 /*
  * mem_noshuf
  * Section 5.5 of the Hexagon V67 Programmer's Reference Manual
diff --git a/tests/tcg/hexagon/multi_result.c b/tests/tcg/hexagon/multi_result.c
index 67aa462..c21148f 100644
--- a/tests/tcg/hexagon/multi_result.c
+++ b/tests/tcg/hexagon/multi_result.c
@@ -45,8 +45,41 @@ static int sfinvsqrta(int Rs, int *pred_result)
   return result;
 }
 
+static long long vacsh(long long Rxx, long long Rss, long long Rtt,
+                       int *pred_result, int *ovf_result)
+{
+  long long result = Rxx;
+  int predval;
+  int usr;
+
+  /*
+   * This instruction can set bit 0 (OVF/overflow) in usr
+   * Clear the bit first, then return that bit to the caller
+   */
+  asm volatile("r2 = usr\n\t"
+               "r2 = clrbit(r2, #0)\n\t"        /* clear overflow bit */
+               "usr = r2\n\t"
+               "%0,p0 = vacsh(%3, %4)\n\t"
+               "%1 = p0\n\t"
+               "%2 = usr\n\t"
+               : "+r"(result), "=r"(predval), "=r"(usr)
+               : "r"(Rss), "r"(Rtt)
+               : "r2", "p0", "usr");
+  *pred_result = predval;
+  *ovf_result = (usr & 1);
+  return result;
+}
+
 int err;
 
+static void check_ll(long long val, long long expect)
+{
+    if (val != expect) {
+        printf("ERROR: 0x%016llx != 0x%016llx\n", val, expect);
+        err++;
+    }
+}
+
 static void check(int val, int expect)
 {
     if (val != expect) {
@@ -87,10 +120,46 @@ static void test_sfinvsqrta()
     check_p(pred_result, 0x0);
 }
 
+static void test_vacsh()
+{
+    long long res64;
+    int pred_result;
+    int ovf_result;
+
+    res64 = vacsh(0x0004000300020001LL,
+                  0x0001000200030004LL,
+                  0x0000000000000000LL, &pred_result, &ovf_result);
+    check_ll(res64, 0x0004000300030004LL);
+    check_p(pred_result, 0xf0);
+    check(ovf_result, 0);
+
+    res64 = vacsh(0x0004000300020001LL,
+                  0x0001000200030004LL,
+                  0x000affff000d0000LL, &pred_result, &ovf_result);
+    check_ll(res64, 0x000e0003000f0004LL);
+    check_p(pred_result, 0xcc);
+    check(ovf_result, 0);
+
+    res64 = vacsh(0x00047fff00020001LL,
+                  0x00017fff00030004LL,
+                  0x000a0fff000d0000LL, &pred_result, &ovf_result);
+    check_ll(res64, 0x000e7fff000f0004LL);
+    check_p(pred_result, 0xfc);
+    check(ovf_result, 1);
+
+    res64 = vacsh(0x0004000300020001LL,
+                  0x0001000200030009LL,
+                  0x000affff000d0001LL, &pred_result, &ovf_result);
+    check_ll(res64, 0x000e0003000f0008LL);
+    check_p(pred_result, 0xcc);
+    check(ovf_result, 0);
+}
+
 int main()
 {
     test_sfrecipa();
     test_sfinvsqrta();
+    test_vacsh();
 
     puts(err ? "FAIL" : "PASS");
     return err;
-- 
2.7.4


