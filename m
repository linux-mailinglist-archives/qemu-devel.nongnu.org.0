Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E643370D88
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 17:01:39 +0200 (CEST)
Received: from localhost ([::1]:58236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldDbG-0000UQ-Gs
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 11:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKp-0001fC-Go
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:39 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKn-0005Hn-DY
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:39 -0400
Received: by mail-pl1-x630.google.com with SMTP id y2so1461651plr.5
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 07:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZQszf2n9Vu77nBFizeiELUUngyh4LSUTsvPP7YhmnWw=;
 b=JOT0mcp1pzmm2UjBYz9SqMbVYrDcBzRHf6wJLTa+G39egYLp7kWzPMePrt5/pI3/5S
 ftK7R1jdgMTHTzVPNVpagiefWMBsBtpAIvyUk4cJOtrV+azf17gh1M1OC+vidDOT8qPR
 4FpZzmVlODeaNlf3pJdQpIXtXfSZpXpIIPoVyialX+oAS4VieuWy02Z2P9fb+B3eFpYx
 h9Kfavia+1YOh+Dlf5ULS3XfZMsvHjwmrnWJ/pSEZskfQP5cFdTASULN7rZibet5tdeq
 CochnH6A8KQQDjvzvEOm2rD5yEaDuT/3tOLToMT7fXmeKKZr1t4mR9k44qXWKHGEoAEZ
 T/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZQszf2n9Vu77nBFizeiELUUngyh4LSUTsvPP7YhmnWw=;
 b=YAuiy8OVkZw7oUoCyR/B7pVhiFr4PTH39Y2i8JE35PkvyLqouwouKzvCVjWnzuEagg
 HpUWHvzoFq1e+lOrh55y3D0x6cKuu6WSdZytn2mUH1y7l75ISZ2wCoacwdYN6t5dpzqi
 rmghSMd+Dd2ag0bZJTP16tsPyKL7xYWiVEQKbxbp86m5YOOWQVUvXHV4LuWRdd5LF7qm
 lK6CTsRi/RU3PuDKao0iidmg2MlCG7EtHEOyEXXxBBB4tcoDOp1T83pK8kX6X3VHpVzm
 XVk3z4ELiTvSns0dtYkziRXkXPDdGAqZJuVEdwQMRkAOgDTITTJm5OZljiwwSeIH3WFf
 GE2Q==
X-Gm-Message-State: AOAM531+/pJ+xZgfYVZhOpogvbaQoiQbc9Sp2QsSFZyfWv96/UPnKs+g
 ZE3zzsDd46MxHY/e9gQO8WVoK3FI/VCxGQ==
X-Google-Smtp-Source: ABdhPJzG8FUR+sLaO26DwTC9/d9MJFH26/yozxfRzrPzQRFmxuxcC1wum6x7ZevnIsmLc4FYagDSpQ==
X-Received: by 2002:a17:902:6b05:b029:e9:2810:7e59 with SMTP id
 o5-20020a1709026b05b02900e928107e59mr15810389plk.76.1619966676093; 
 Sun, 02 May 2021 07:44:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w14sm6889110pff.94.2021.05.02.07.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 07:44:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 24/31] Hexagon (target/hexagon) add A5_ACS (vacsh)
Date: Sun,  2 May 2021 07:44:12 -0700
Message-Id: <20210502144419.1659844-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502144419.1659844-1-richard.henderson@linaro.org>
References: <20210502144419.1659844-1-richard.henderson@linaro.org>
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


