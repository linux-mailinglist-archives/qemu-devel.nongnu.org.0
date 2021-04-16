Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83089362AFC
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 00:18:27 +0200 (CEST)
Received: from localhost ([::1]:39482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXWnC-00063a-J1
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 18:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdm-0006Rj-U5
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:38 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:35442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdV-0001lt-GO
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:38 -0400
Received: by mail-pl1-x62c.google.com with SMTP id q11so1533196plx.2
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T7nNbpS6ns3g2zobopRt+7U4FUmG0OZq/G9VxwXU/Zw=;
 b=rfNu+dMV1j0nPvjskRRCyQ8nmXth8IiyW2qUy9Ar4e/AoGB2YpQpDV8UCPF8o8qtxU
 j2YqsCwPrIp9XiBEopnpratnY1Xs4qCIiIN2MHsr7gpSweimOfBStJr1dkBmMctAgY3W
 AiqPyx6XCG7WHaNroeBQ3ltLvKeB/ukycFpUzJzKSuPC8XJ0H/Z7W2IXoSppTxAIH5kd
 YYvvQKytuMJs4xBNRZ4EhqbQ5Q4r9GJdkRiTm4fQFt1Ml1tzkHV8kSNlrxNG8cnbbwFh
 c5TdOanjReKKBJOSDX0EBnmtAzSuC59gUoNigRTrJzh15g8DTV/HFfA1mwvVdinmytx7
 Bw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T7nNbpS6ns3g2zobopRt+7U4FUmG0OZq/G9VxwXU/Zw=;
 b=Pj8YjZdSGnOFrxd8QOCYKlronjOHwCFG1I2ZD5XMS2NfmklKtPiW4YVqXuAKX6Ph6q
 +rIIyY1ANJPN0M53LPdd6Etm6mPZMSXrz6Qc34d6HcaoXB354c9uU2Hr+Axw4uxCiiBx
 2Wh9FFGLvvoJfx0PG4KMjk7mMXxQQS045pK5lmRApcJJ28ZKp1v3JdDCkqCrLLEiUo01
 rsQDWIxeoQDIf2xQAQLMlysr556etHdXxxVzMDXgxNuiaKgsi5rjlzr90yxWF9V8M5K2
 RSFwYO6YwAKfWAdDEOxNZdK35NkI84gGrPwXUGTV94qzUl3wAU8Ck5zO9Hhq7ZmUim4R
 a1Ag==
X-Gm-Message-State: AOAM530XyZuFbALAWbz45vZol2xdmefXos05ZSOysmZXi0lvaVYBYlTA
 kt6VHcZ+vmHrxs43rQTcimt1x+++Gqa8Dw==
X-Google-Smtp-Source: ABdhPJxGT6QYgg6iOHJ7Q8S4UXiV7PSm3o58c00yKpzVO6KdrTr5GFxwZceJ+gzILDQOI+YbiIwLog==
X-Received: by 2002:a17:90b:390f:: with SMTP id
 ob15mr11485296pjb.100.1618607058029; 
 Fri, 16 Apr 2021 14:04:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 67/81] target/arm: Implement SVE2 FCVTXNT, FCVTX
Date: Fri, 16 Apr 2021 14:02:26 -0700
Message-Id: <20210416210240.1591291-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200428174332.17162-4-steplong@quicinc.com>
[rth: Use do_frint_mode, which avoids a specific runtime helper.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  2 ++
 target/arm/translate-sve.c | 49 ++++++++++++++++++++++++++++++--------
 2 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index fb998f5f34..46153d6a84 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1533,6 +1533,8 @@ SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
 RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
 
 ### SVE2 floating-point convert precision odd elements
+FCVTXNT_ds      01100100 00 0010 10 101 ... ..... .....  @rd_pg_rn_e0
+FCVTX_ds        01100101 00 0010 10 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_sh       01100100 10 0010 00 101 ... ..... .....  @rd_pg_rn_e0
 FCVTLT_hs       01100100 10 0010 01 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_ds       01100100 11 0010 10 101 ... ..... .....  @rd_pg_rn_e0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 9cad93cb98..5b78298777 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4715,11 +4715,9 @@ static bool trans_FRINTX(DisasContext *s, arg_rpr_esz *a)
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz == MO_16, fns[a->esz - 1]);
 }
 
-static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a, int mode)
+static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
+                          int mode, gen_helper_gvec_3_ptr *fn)
 {
-    if (a->esz == 0) {
-        return false;
-    }
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
         TCGv_i32 tmode = tcg_const_i32(mode);
@@ -4730,7 +4728,7 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a, int mode)
         tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
                            vec_full_reg_offset(s, a->rn),
                            pred_full_reg_offset(s, a->pg),
-                           status, vsz, vsz, 0, frint_fns[a->esz - 1]);
+                           status, vsz, vsz, 0, fn);
 
         gen_helper_set_rmode(tmode, tmode, status);
         tcg_temp_free_i32(tmode);
@@ -4741,27 +4739,42 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a, int mode)
 
 static bool trans_FRINTN(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_frint_mode(s, a, float_round_nearest_even);
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_nearest_even, frint_fns[a->esz - 1]);
 }
 
 static bool trans_FRINTP(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_frint_mode(s, a, float_round_up);
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_up, frint_fns[a->esz - 1]);
 }
 
 static bool trans_FRINTM(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_frint_mode(s, a, float_round_down);
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_down, frint_fns[a->esz - 1]);
 }
 
 static bool trans_FRINTZ(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_frint_mode(s, a, float_round_to_zero);
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_to_zero, frint_fns[a->esz - 1]);
 }
 
 static bool trans_FRINTA(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_frint_mode(s, a, float_round_ties_away);
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_ties_away, frint_fns[a->esz - 1]);
 }
 
 static bool trans_FRECPX(DisasContext *s, arg_rpr_esz *a)
@@ -8202,3 +8215,19 @@ static bool trans_FCVTLT_sd(DisasContext *s, arg_rpr_esz *a)
     }
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtlt_sd);
 }
+
+static bool trans_FCVTX_ds(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_to_odd, gen_helper_sve_fcvt_ds);
+}
+
+static bool trans_FCVTXNT_ds(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_to_odd, gen_helper_sve2_fcvtnt_ds);
+}
-- 
2.25.1


