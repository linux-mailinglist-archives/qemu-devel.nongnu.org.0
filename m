Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2428D39062A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:05:36 +0200 (CEST)
Received: from localhost ([::1]:42984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZYk-0005wR-N5
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYc1-0004YO-SJ
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:53 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbu-0004rA-7h
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:53 -0400
Received: by mail-wr1-x433.google.com with SMTP id d11so32593745wrw.8
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YwVpnRzBlh9FFKcxklHcax3ieMdLVeQ/MQTfxDZSzEE=;
 b=BqssJkNLViRjHoEuJNVSw5u9mrpanMPY1HoZniiA+pa0p7KhUVYSinKAX2OvwzpAW0
 RNxmgn20K3HNbSFB+wLRElQepHVEOTRM7WZ/YL12ooNYa5EZHQ0fPpXMGonhps+WPT8O
 +fmZMrSeamHP3eIF6rjt9EC/3g8p0QSmhMQJoENvWQvq31UylxY+JQLbdyIeuiRXbwPJ
 JaGB56Ohftg7cHrGuTZsQBIzl6XUifEKcLfxbLn3n1lZ5afpQa/b8mKZqjb1X1X1diiB
 U5hjenKx7QKE+1R+ACMJnyeCqnKZIOOQPN8hZ6ea5tCN96jIMTKkkTCse+YPtG6OuPpa
 ca8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YwVpnRzBlh9FFKcxklHcax3ieMdLVeQ/MQTfxDZSzEE=;
 b=XvQZJI37VjxavgxSBkP1LR6EOxd6RDFWa3ZAFwA84HtDS9mYnTICcykuTXW6tDeCm4
 IbDZeFrwrh1PMELtrL4HQ+zj+EFTXzux6psyPLeY3M9kr7321Dx0ZwpT7fi15NpOQxZC
 2RhYX2Zu1kzAvq6/HZbaevzchBMZoyDuz/8TyQHQK21jhz6RjNnZiCHQrJU61XhDXdJc
 y4j/qcoLsjJkHJc7lNpJi8yx+cXp+RGXxAVe/+OWZb/PtKQ5QsPJbv62s+g/q4Gw7wqx
 BFVQn88ZRLsfdM/ApTSP3ULrEEPuF9a9Q0SjH1X3f9/p73i5R8mPKR0CJG+WSVOSOPE4
 644Q==
X-Gm-Message-State: AOAM531OjZq7HrRYvI8l15jD2/Slb01vSrfM87NXrtRNnFvxpilXyKLJ
 g0Msf4icB7iT6+nN1wShsDE9+XeiHNxaxgo2
X-Google-Smtp-Source: ABdhPJyY3nABJChAkBzhBuNvLaOHhztXFykly5DNMKljDMOUX5foRjmMS/nCFZsjnMQepBzel9PGiw==
X-Received: by 2002:a5d:50cf:: with SMTP id f15mr12853572wrt.287.1621955084856; 
 Tue, 25 May 2021 08:04:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 082/114] target/arm: Implement SVE2 multiply-add long (indexed)
Date: Tue, 25 May 2021 16:02:52 +0100
Message-Id: <20210525150324.32370-83-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-61-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sve.h    | 17 +++++++++++++++++
 target/arm/sve.decode      | 18 ++++++++++++++++++
 target/arm/sve_helper.c    | 16 ++++++++++++++++
 target/arm/translate-sve.c | 20 ++++++++++++++++++++
 4 files changed, 71 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 0be0d90bee7..4a0e70ee914 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2693,3 +2693,20 @@ DEF_HELPER_FLAGS_4(sve2_sqdmull_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqdmull_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_smlal_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smlal_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smlsl_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smlsl_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umlal_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umlal_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umlsl_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umlsl_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 35010d755fb..dd50b9b5c0a 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -823,6 +823,24 @@ SQDMLSLB_zzxw_d 01000100 11 1 ..... 0011.0 ..... .....   @rrxr_2a esz=3
 SQDMLSLT_zzxw_s 01000100 10 1 ..... 0011.1 ..... .....   @rrxr_3a esz=2
 SQDMLSLT_zzxw_d 01000100 11 1 ..... 0011.1 ..... .....   @rrxr_2a esz=3
 
+# SVE2 multiply-add long (indexed)
+SMLALB_zzxw_s   01000100 10 1 ..... 1000.0 ..... .....   @rrxr_3a esz=2
+SMLALB_zzxw_d   01000100 11 1 ..... 1000.0 ..... .....   @rrxr_2a esz=3
+SMLALT_zzxw_s   01000100 10 1 ..... 1000.1 ..... .....   @rrxr_3a esz=2
+SMLALT_zzxw_d   01000100 11 1 ..... 1000.1 ..... .....   @rrxr_2a esz=3
+UMLALB_zzxw_s   01000100 10 1 ..... 1001.0 ..... .....   @rrxr_3a esz=2
+UMLALB_zzxw_d   01000100 11 1 ..... 1001.0 ..... .....   @rrxr_2a esz=3
+UMLALT_zzxw_s   01000100 10 1 ..... 1001.1 ..... .....   @rrxr_3a esz=2
+UMLALT_zzxw_d   01000100 11 1 ..... 1001.1 ..... .....   @rrxr_2a esz=3
+SMLSLB_zzxw_s   01000100 10 1 ..... 1010.0 ..... .....   @rrxr_3a esz=2
+SMLSLB_zzxw_d   01000100 11 1 ..... 1010.0 ..... .....   @rrxr_2a esz=3
+SMLSLT_zzxw_s   01000100 10 1 ..... 1010.1 ..... .....   @rrxr_3a esz=2
+SMLSLT_zzxw_d   01000100 11 1 ..... 1010.1 ..... .....   @rrxr_2a esz=3
+UMLSLB_zzxw_s   01000100 10 1 ..... 1011.0 ..... .....   @rrxr_3a esz=2
+UMLSLB_zzxw_d   01000100 11 1 ..... 1011.0 ..... .....   @rrxr_2a esz=3
+UMLSLT_zzxw_s   01000100 10 1 ..... 1011.1 ..... .....   @rrxr_3a esz=2
+UMLSLT_zzxw_d   01000100 11 1 ..... 1011.1 ..... .....   @rrxr_2a esz=3
+
 # SVE2 saturating multiply (indexed)
 SQDMULLB_zzx_s  01000100 10 1 ..... 1110.0 ..... .....   @rrx_3a esz=2
 SQDMULLB_zzx_d  01000100 11 1 ..... 1110.0 ..... .....   @rrx_2a esz=3
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 3953e2f502a..2ec936a8b1b 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1551,6 +1551,20 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
     }                                                                     \
 }
 
+#define DO_MLA(N, M, A)  (A + N * M)
+
+DO_ZZXW(sve2_smlal_idx_s, int32_t, int16_t, H1_4, H1_2, DO_MLA)
+DO_ZZXW(sve2_smlal_idx_d, int64_t, int32_t,     , H1_4, DO_MLA)
+DO_ZZXW(sve2_umlal_idx_s, uint32_t, uint16_t, H1_4, H1_2, DO_MLA)
+DO_ZZXW(sve2_umlal_idx_d, uint64_t, uint32_t,     , H1_4, DO_MLA)
+
+#define DO_MLS(N, M, A)  (A - N * M)
+
+DO_ZZXW(sve2_smlsl_idx_s, int32_t, int16_t, H1_4, H1_2, DO_MLS)
+DO_ZZXW(sve2_smlsl_idx_d, int64_t, int32_t,     , H1_4, DO_MLS)
+DO_ZZXW(sve2_umlsl_idx_s, uint32_t, uint16_t, H1_4, H1_2, DO_MLS)
+DO_ZZXW(sve2_umlsl_idx_d, uint64_t, uint32_t,     , H1_4, DO_MLS)
+
 #define DO_SQDMLAL_S(N, M, A)  DO_SQADD_S(A, do_sqdmull_s(N, M))
 #define DO_SQDMLAL_D(N, M, A)  do_sqadd_d(A, do_sqdmull_d(N, M))
 
@@ -1563,6 +1577,8 @@ DO_ZZXW(sve2_sqdmlal_idx_d, int64_t, int32_t,     , H1_4, DO_SQDMLAL_D)
 DO_ZZXW(sve2_sqdmlsl_idx_s, int32_t, int16_t, H1_4, H1_2, DO_SQDMLSL_S)
 DO_ZZXW(sve2_sqdmlsl_idx_d, int64_t, int32_t,     , H1_4, DO_SQDMLSL_D)
 
+#undef DO_MLA
+#undef DO_MLS
 #undef DO_ZZXW
 
 #define DO_ZZX(NAME, TYPEW, TYPEN, HW, HN, OP) \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a03fce003e8..1f6a61bf55d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3944,6 +3944,26 @@ DO_SVE2_RRXR_TB(trans_SQDMLSLB_zzxw_d, gen_helper_sve2_sqdmlsl_idx_d, false)
 DO_SVE2_RRXR_TB(trans_SQDMLSLT_zzxw_s, gen_helper_sve2_sqdmlsl_idx_s, true)
 DO_SVE2_RRXR_TB(trans_SQDMLSLT_zzxw_d, gen_helper_sve2_sqdmlsl_idx_d, true)
 
+DO_SVE2_RRXR_TB(trans_SMLALB_zzxw_s, gen_helper_sve2_smlal_idx_s, false)
+DO_SVE2_RRXR_TB(trans_SMLALB_zzxw_d, gen_helper_sve2_smlal_idx_d, false)
+DO_SVE2_RRXR_TB(trans_SMLALT_zzxw_s, gen_helper_sve2_smlal_idx_s, true)
+DO_SVE2_RRXR_TB(trans_SMLALT_zzxw_d, gen_helper_sve2_smlal_idx_d, true)
+
+DO_SVE2_RRXR_TB(trans_UMLALB_zzxw_s, gen_helper_sve2_umlal_idx_s, false)
+DO_SVE2_RRXR_TB(trans_UMLALB_zzxw_d, gen_helper_sve2_umlal_idx_d, false)
+DO_SVE2_RRXR_TB(trans_UMLALT_zzxw_s, gen_helper_sve2_umlal_idx_s, true)
+DO_SVE2_RRXR_TB(trans_UMLALT_zzxw_d, gen_helper_sve2_umlal_idx_d, true)
+
+DO_SVE2_RRXR_TB(trans_SMLSLB_zzxw_s, gen_helper_sve2_smlsl_idx_s, false)
+DO_SVE2_RRXR_TB(trans_SMLSLB_zzxw_d, gen_helper_sve2_smlsl_idx_d, false)
+DO_SVE2_RRXR_TB(trans_SMLSLT_zzxw_s, gen_helper_sve2_smlsl_idx_s, true)
+DO_SVE2_RRXR_TB(trans_SMLSLT_zzxw_d, gen_helper_sve2_smlsl_idx_d, true)
+
+DO_SVE2_RRXR_TB(trans_UMLSLB_zzxw_s, gen_helper_sve2_umlsl_idx_s, false)
+DO_SVE2_RRXR_TB(trans_UMLSLB_zzxw_d, gen_helper_sve2_umlsl_idx_d, false)
+DO_SVE2_RRXR_TB(trans_UMLSLT_zzxw_s, gen_helper_sve2_umlsl_idx_s, true)
+DO_SVE2_RRXR_TB(trans_UMLSLT_zzxw_d, gen_helper_sve2_umlsl_idx_d, true)
+
 #undef DO_SVE2_RRXR_TB
 
 /*
-- 
2.20.1


