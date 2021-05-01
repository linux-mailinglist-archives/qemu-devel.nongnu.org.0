Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE863708B5
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 21:12:08 +0200 (CEST)
Received: from localhost ([::1]:34318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcv27-0000bo-CI
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 15:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuav-0008WL-Ba
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:44:01 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:39714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuag-0000Ar-3p
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:44:01 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 z6-20020a17090a1706b0290155e8a752d8so3447482pjd.4
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 11:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZQszf2n9Vu77nBFizeiELUUngyh4LSUTsvPP7YhmnWw=;
 b=MThKinSCOgvwH4p43GvFpVPpEzWY0okt6DwkUI+I8zzcP6rqYg/BH4Oajew+KlgF/P
 upJcxkP5GScJAAbS9odh2rOi0kGfS+wazcMCyTIUR28rphShPuKBctVuERoNs6LehK4W
 eud1w9S4H82U24e8ghIFgE66E5N0iSpz46m0rPIOHtEwWw2cs85QoUorJq5N2zFCjOxI
 m+vAJtY9jXT08/YB5ts2uWMjjc/aXK9a9PjF2VcUuf1OwNzVfyj/LtoglnPDKK6ZNrJM
 h7t7uD++VMt0pYKHaJ11L12oaJQH5U93mmlTbDYfUpthQUYzZLM7pLwR60uXQucp+8hb
 /GEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZQszf2n9Vu77nBFizeiELUUngyh4LSUTsvPP7YhmnWw=;
 b=EiTbA1+4KsLkEX9eVTTMtv62sEkIeEQ09xL9vRL4d2EB15drvzSKJ4a2QndCJQAaZa
 FtweYYg53FiK00dhFSLdqZwd7X1lmRK0PFtfm9i+S1QcGu4clvxITDlBkwNuZmHlQ6aT
 KrG14DqnOV/IRObC1WcVTjQv2lR2gDDpKGCyV00Z9YQjDOZ5JJa5Dc6S67EXgdqq0sAM
 f0MdEMF5yzTjDZvPME3ytZhYoq0nbd0L76YVlL162Y6hRLRkMFis81S88a9SKw/BWp0I
 lLb65a/POns0wNpPbVrL4fEVoEjLJF06zgQTk2jvWwvBgYMkDYvErdxwiG7/kVvzfsv5
 H4zA==
X-Gm-Message-State: AOAM531X/szeC8mWtV3plh31zO3cdza8+LfLyACfQqOl+Nwim9zNOxM0
 jSL3OEs/PvssNEnN8xychP0EhaCrKy2v9Q==
X-Google-Smtp-Source: ABdhPJzVUTioh3jeDjyucqntLyeHkO55pJcm630BIC/0H7FLdU+wsAO+T1QG7SLNHyNmy4kYfUjskg==
X-Received: by 2002:a17:90b:1a8b:: with SMTP id
 ng11mr18361727pjb.93.1619894620626; 
 Sat, 01 May 2021 11:43:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id i11sm5309088pfa.108.2021.05.01.11.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 11:43:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/31] Hexagon (target/hexagon) add A5_ACS (vacsh)
Date: Sat,  1 May 2021 11:43:17 -0700
Message-Id: <20210501184324.1338186-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501184324.1338186-1-richard.henderson@linaro.org>
References: <20210501184324.1338186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Rxx32,Pe4 = vacsh(Rss32, Rtt32)
    Add compare and select elements of two vectors

Test cases in tests/tcg/hexagon/multi_result.c

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-20-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/gen_tcg.h              |  5 ++
 target/hexagon/helper.h               |  2 +
 target/hexagon/op_helper.c            | 33 +++++++++++++
 tests/tcg/hexagon/multi_result.c      | 69 +++++++++++++++++++++++++++
 target/hexagon/imported/alu.idef      | 19 ++++++++
 target/hexagon/imported/encode_pp.def |  1 +
 6 files changed, 129 insertions(+)

diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
index d78e7b8e5c..93310c5edc 100644
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
index cb7508f746..3824ae01ea 100644
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
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index a25fb98f24..f9fb65555b 100644
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
index 67aa46249b..c21148fc20 100644
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
diff --git a/target/hexagon/imported/alu.idef b/target/hexagon/imported/alu.idef
index 45cc529fbc..e8cc52c290 100644
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
index 18fe45d696..87e0426c05 100644
--- a/target/hexagon/imported/encode_pp.def
+++ b/target/hexagon/imported/encode_pp.def
@@ -1017,6 +1017,7 @@ MPY_ENC(M7_dcmpyiwc_acc,     "1010","xxxxx","1","0","1","0","10")
 
 
 
+MPY_ENC(A5_ACS,              "1010","xxxxx","0","1","0","1","ee")
 /*
 */
 
-- 
2.25.1


