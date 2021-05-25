Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D66390635
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:07:53 +0200 (CEST)
Received: from localhost ([::1]:51428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZay-0003NB-BO
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYc2-0004b0-JY
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:54 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbv-0004sL-3r
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:54 -0400
Received: by mail-wr1-x435.google.com with SMTP id x7so13005100wrt.12
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Z2CEyP4V358W+dp7v+txYfuyt12zQxfTtTqi5DBBMto=;
 b=qawofzY8x2NE8rfHdwaB+XVvCg/RD6fJOLbSLqrGUDnvmT1Fq6HSLhwWJZPJeSZXUp
 1TJBedLPSbBw4GeFl6p3jnD/TU71SyITyzGGlvh3UlWfdneCgkAn+8wRDEOexMqa1lZp
 Tzg6dKXKQsa/ykgiiM3vKsx9imuaxFX1Fm7oYz6Nz+0iipJ2ArppA/62eeAt5ySYtp+W
 u9Hzaz4efJyQW37LSX0LSxPEcKaSIZ+h/+e/lTOjQGi3MG1/eG6qEcmeIVO4Mz8Cxq3p
 lOVFunhqkDI4KXOhcQFhyJWj9L1ait8P9rJ0Ml6e05WBk79li2E6Ia3+LBmBDH4N+jnI
 QCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z2CEyP4V358W+dp7v+txYfuyt12zQxfTtTqi5DBBMto=;
 b=iAU1UFwQTuRc4OOK2wYuq3jweylyLQc5pj5FcsSzqQseVXql6ZqYp/ej9X91GyNbZd
 wCi+UVkvfPu2n8TCxgi2qhghYpCfsU70kcCnnjODzRb9Bgm9iP7IpCUwUD/Vc1bZqQ3E
 G/g2JS67SbUyPTTG7N71LKIYVx7DHDCRNktvQ9c6yE0txLOjE/u9/k8kgKfcOW8Qcu5G
 4HrmHTnRvKgii91x00xlRbOScDqhdpF1McV5pYOV2ZgvPY4GZL9pHACH9W3ZCroJ7Bsm
 9Muv6Oe/XE+N83soNB+Sq1v4zZrJxoHGBSRHFZvxlG201jmBjyuD42zXFnj+PqUNZmtP
 rOHA==
X-Gm-Message-State: AOAM530zIFWqEwiD+hc14Aul8bJndGXzEGdWGpczFl5RoV+a3Tsk9tDp
 PrYmLp7NGrwB/RmkTOC4xjsyPc7JM1n5hpjl
X-Google-Smtp-Source: ABdhPJwI1zxLOfNVBado8M/ZREY1MKupIZ6mHxZM1wehRvd/QS90ZmyvXyi3BR7A6xPvBCSbcyyL3w==
X-Received: by 2002:adf:d231:: with SMTP id k17mr27030225wrh.78.1621955085561; 
 Tue, 25 May 2021 08:04:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 083/114] target/arm: Implement SVE2 integer multiply long
 (indexed)
Date: Tue, 25 May 2021 16:02:53 +0100
Message-Id: <20210525150324.32370-84-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Message-id: 20210525010358.152808-62-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve.decode      | 10 ++++++++++
 target/arm/sve_helper.c    |  6 ++++++
 target/arm/translate-sve.c | 10 ++++++++++
 4 files changed, 31 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 4a0e70ee914..3bec807e134 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2710,3 +2710,8 @@ DEF_HELPER_FLAGS_5(sve2_umlsl_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_umlsl_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_smull_idx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_smull_idx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_umull_idx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_umull_idx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index dd50b9b5c0a..9c5761347ad 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -841,6 +841,16 @@ UMLSLB_zzxw_d   01000100 11 1 ..... 1011.0 ..... .....   @rrxr_2a esz=3
 UMLSLT_zzxw_s   01000100 10 1 ..... 1011.1 ..... .....   @rrxr_3a esz=2
 UMLSLT_zzxw_d   01000100 11 1 ..... 1011.1 ..... .....   @rrxr_2a esz=3
 
+# SVE2 integer multiply long (indexed)
+SMULLB_zzx_s    01000100 10 1 ..... 1100.0 ..... .....   @rrx_3a esz=2
+SMULLB_zzx_d    01000100 11 1 ..... 1100.0 ..... .....   @rrx_2a esz=3
+SMULLT_zzx_s    01000100 10 1 ..... 1100.1 ..... .....   @rrx_3a esz=2
+SMULLT_zzx_d    01000100 11 1 ..... 1100.1 ..... .....   @rrx_2a esz=3
+UMULLB_zzx_s    01000100 10 1 ..... 1101.0 ..... .....   @rrx_3a esz=2
+UMULLB_zzx_d    01000100 11 1 ..... 1101.0 ..... .....   @rrx_2a esz=3
+UMULLT_zzx_s    01000100 10 1 ..... 1101.1 ..... .....   @rrx_3a esz=2
+UMULLT_zzx_d    01000100 11 1 ..... 1101.1 ..... .....   @rrx_2a esz=3
+
 # SVE2 saturating multiply (indexed)
 SQDMULLB_zzx_s  01000100 10 1 ..... 1110.0 ..... .....   @rrx_3a esz=2
 SQDMULLB_zzx_d  01000100 11 1 ..... 1110.0 ..... .....   @rrx_2a esz=3
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 2ec936a8b1b..20ed2f34bcc 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1599,6 +1599,12 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)            \
 DO_ZZX(sve2_sqdmull_idx_s, int32_t, int16_t, H1_4, H1_2, do_sqdmull_s)
 DO_ZZX(sve2_sqdmull_idx_d, int64_t, int32_t,     , H1_4, do_sqdmull_d)
 
+DO_ZZX(sve2_smull_idx_s, int32_t, int16_t, H1_4, H1_2, DO_MUL)
+DO_ZZX(sve2_smull_idx_d, int64_t, int32_t,     , H1_4, DO_MUL)
+
+DO_ZZX(sve2_umull_idx_s, uint32_t, uint16_t, H1_4, H1_2, DO_MUL)
+DO_ZZX(sve2_umull_idx_d, uint64_t, uint32_t,     , H1_4, DO_MUL)
+
 #undef DO_ZZX
 
 #define DO_BITPERM(NAME, TYPE, OP) \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 1f6a61bf55d..e8e2a4e948f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3886,6 +3886,16 @@ DO_SVE2_RRX_TB(trans_SQDMULLB_zzx_d, gen_helper_sve2_sqdmull_idx_d, false)
 DO_SVE2_RRX_TB(trans_SQDMULLT_zzx_s, gen_helper_sve2_sqdmull_idx_s, true)
 DO_SVE2_RRX_TB(trans_SQDMULLT_zzx_d, gen_helper_sve2_sqdmull_idx_d, true)
 
+DO_SVE2_RRX_TB(trans_SMULLB_zzx_s, gen_helper_sve2_smull_idx_s, false)
+DO_SVE2_RRX_TB(trans_SMULLB_zzx_d, gen_helper_sve2_smull_idx_d, false)
+DO_SVE2_RRX_TB(trans_SMULLT_zzx_s, gen_helper_sve2_smull_idx_s, true)
+DO_SVE2_RRX_TB(trans_SMULLT_zzx_d, gen_helper_sve2_smull_idx_d, true)
+
+DO_SVE2_RRX_TB(trans_UMULLB_zzx_s, gen_helper_sve2_umull_idx_s, false)
+DO_SVE2_RRX_TB(trans_UMULLB_zzx_d, gen_helper_sve2_umull_idx_d, false)
+DO_SVE2_RRX_TB(trans_UMULLT_zzx_s, gen_helper_sve2_umull_idx_s, true)
+DO_SVE2_RRX_TB(trans_UMULLT_zzx_d, gen_helper_sve2_umull_idx_d, true)
+
 #undef DO_SVE2_RRX_TB
 
 static bool do_sve2_zzzz_data(DisasContext *s, int rd, int rn, int rm, int ra,
-- 
2.20.1


