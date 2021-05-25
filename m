Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF27390618
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:01:52 +0200 (CEST)
Received: from localhost ([::1]:34400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZV9-0008Sx-Tk
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbx-0004J2-Ux
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:49 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbo-0004lR-UJ
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:49 -0400
Received: by mail-wr1-x42e.google.com with SMTP id q5so32591029wrs.4
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NnxaeloDxYh11gwr9m9P4FS6dwIcRJvoJ5pDC2t102s=;
 b=sRkJL4qFE2y3A4pkEcjaYIpie8jVxtQIfmU2rWApCI4FWXzUNc5iuD5FhKwPfSLtO3
 5czwokN5f4HXSNIu8U44Z+cxpayEnkfMcCYYJ+FbLtc8B6V63jsb8krIu7CmbqRnzXqv
 cHSG6kNQDPOVItbYDD3vV3YWKBve+Cdboqu0LpnFkGPuScVSt6TZdrMu8v549ZtL4B+o
 7i7Box13G4bkMMEPWBrr1nD/dZn7BUapBqYpnAgEUf3ajsMtHT6PEMz3lh0QbCh2jGbr
 OF90R1Uz+aYhd2GEsw7aJcUPYKTrnBid8t4iZBvVOdBRkVW6xBwnHdbJw+VIsCEuMpXM
 UpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NnxaeloDxYh11gwr9m9P4FS6dwIcRJvoJ5pDC2t102s=;
 b=oUxosdRhUUrdqoH51lGT7CvElVdbRub1twScQPRaU5sn4NyvxDOFcMXxCQYu8P6EWt
 cNqZiVQ7Ai5VqmR3F2PW8lXOK0zzfHAPBL6syfSXCN5fVa1F57TIonW3X5a82CeyQkJV
 YepEgoC+Wt5+ToXogTr2VGsLGhI+wOXwkbAOw5M4sBj6b0mlewwogQuxWBBOPIl0vjzD
 wuAmrUmjsW/UfQv/Yq5/gUAtqZPIS/1lvEvwo+pBYSl9b913av6H9ud9SrFerbYUR35v
 IKswSsxpHUv+W69wKWFmeV5mBLJ635XPMLFFYC5AxEWsKrnLaK+64iOKBy4yZ3nUlYx+
 /MaA==
X-Gm-Message-State: AOAM531PDYvTaU3/H6XXdeKfIVtrT6xvC9sMBBwY4r7jX+kOPbg54IyV
 GG7B7PFyZ0xIKNd/QKCV+oWQ8LMdOWvUBbp9
X-Google-Smtp-Source: ABdhPJyZ7oPhX1dMPueP66sZIZom/5mNoekv22UP7BbmyCYze1uDGqriJpscHKvWPEa8k7GNkmG9ig==
X-Received: by 2002:adf:e4c4:: with SMTP id v4mr27996425wrm.346.1621955079492; 
 Tue, 25 May 2021 08:04:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 075/114] target/arm: Implement SVE2 integer multiply (indexed)
Date: Tue, 25 May 2021 16:02:45 +0100
Message-Id: <20210525150324.32370-76-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-54-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve.decode      |  7 +++++++
 target/arm/translate-sve.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 74ac72bdbd1..65cb0a22067 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -775,12 +775,19 @@ MUL_zzi         00100101 .. 110 000 110 ........ .....          @rdn_i8s
 DOT_zzzz        01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5 \
                 ra=%reg_movprfx
 
+#### SVE Multiply - Indexed
+
 # SVE integer dot product (indexed)
 SDOT_zzxw_s     01000100 10 1 ..... 000000 ..... .....   @rrxr_2 esz=2
 SDOT_zzxw_d     01000100 11 1 ..... 000000 ..... .....   @rrxr_1 esz=3
 UDOT_zzxw_s     01000100 10 1 ..... 000001 ..... .....   @rrxr_2 esz=2
 UDOT_zzxw_d     01000100 11 1 ..... 000001 ..... .....   @rrxr_1 esz=3
 
+# SVE2 integer multiply (indexed)
+MUL_zzx_h       01000100 0. 1 ..... 111110 ..... .....   @rrx_3 esz=1
+MUL_zzx_s       01000100 10 1 ..... 111110 ..... .....   @rrx_2 esz=2
+MUL_zzx_d       01000100 11 1 ..... 111110 ..... .....   @rrx_1 esz=3
+
 # SVE floating-point complex add (predicated)
 FCADD           01100100 esz:2 00000 rot:1 100 pg:3 rm:5 rd:5 \
                 rn=%reg_movprfx
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ae443f3b20f..dbab067a53e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3813,6 +3813,10 @@ static bool trans_DOT_zzzz(DisasContext *s, arg_DOT_zzzz *a)
     return true;
 }
 
+/*
+ * SVE Multiply - Indexed
+ */
+
 static bool do_zzxz_ool(DisasContext *s, arg_rrxr_esz *a,
                         gen_helper_gvec_4 *fn)
 {
@@ -3836,6 +3840,32 @@ DO_RRXR(trans_UDOT_zzxw_d, gen_helper_gvec_udot_idx_h)
 
 #undef DO_RRXR
 
+static bool do_sve2_zzz_data(DisasContext *s, int rd, int rn, int rm, int data,
+                             gen_helper_gvec_3 *fn)
+{
+    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_full_reg_offset(s, rm),
+                           vsz, vsz, data, fn);
+    }
+    return true;
+}
+
+#define DO_SVE2_RRX(NAME, FUNC) \
+    static bool NAME(DisasContext *s, arg_rrx_esz *a)  \
+    { return do_sve2_zzz_data(s, a->rd, a->rn, a->rm, a->index, FUNC); }
+
+DO_SVE2_RRX(trans_MUL_zzx_h, gen_helper_gvec_mul_idx_h)
+DO_SVE2_RRX(trans_MUL_zzx_s, gen_helper_gvec_mul_idx_s)
+DO_SVE2_RRX(trans_MUL_zzx_d, gen_helper_gvec_mul_idx_d)
+
+#undef DO_SVE2_RRX
+
 /*
  *** SVE Floating Point Multiply-Add Indexed Group
  */
-- 
2.20.1


