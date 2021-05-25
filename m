Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE1A38F7C0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:54:54 +0200 (CEST)
Received: from localhost ([::1]:42284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMHV-0008TY-L5
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLY3-0008CS-Si
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:07:55 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXp-00045K-8g
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:07:55 -0400
Received: by mail-pf1-x431.google.com with SMTP id d78so21402934pfd.10
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XxyJoHFLZ6IEaEoSZY3UlLt3WrNUJc/LLzbZKvHo7/o=;
 b=m0I0Ix3PUGxTJ9A4r9zv0GnGDoZUeNOPHHblWSfq7wf+iHxAecA/5IlX03dSmN5+lQ
 xwAWPHfiAALtFbZqYvc4mDXmrhZhNoUypgWmJ2hfNTryX+bNWi7smVmriQnO5FIiRQe1
 A2vjHAKKcDsHhVbGFP4L0bd2XEgC1qIs3OPMTkO4zKat+LpeyEG1FMO+tT84B3VjvhHT
 Stjoiub0xMn6lJp7Rjb+8/NNHHGKzn7CmfinFFUjUTXHnA9wCx6jgUTZgsTe8R/lKw/L
 n4rbRNpChq3yASczl4FV4faZdbSg9gI5JKdkf5cvDkWvNIG+uCSMpvE/hkTnicAyPhYL
 3qJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XxyJoHFLZ6IEaEoSZY3UlLt3WrNUJc/LLzbZKvHo7/o=;
 b=NDN7G+pLTmsg2rl1ZT9QyGCdJyjYaYncvQOGvib/+XdJruRi8AcC7YArw8SzwNeiyE
 74XuClBMsp4x/wt+P1Dm0Whvc0E8mz4/GWqBohAQiOd7K/nXDwSrgztMXCAi8AL3q7XZ
 /pHMPXF0sxTtfN7OASVB1XiRkjpxjyTK4OwxukQ/kxzbfIqSTn8c3USMtELTX01T7K9s
 3PskCt3brERIh33PrmsHAfktRey5A3ZH4CJXO2NFfDfVsYPkwWCqvlbORM6Tpfw/y2d5
 g3TyPUPoI2MgyqWnU6vPz8AOX4nKm9GMG+4cSX7Bhl3xktGt5gzgTKtNozzVvpgpI1hS
 ubVQ==
X-Gm-Message-State: AOAM5334sLzBp4H8mRykQjJHzUixaa5nm7umKNguszEKLl0+m3z/UWrD
 wiPca4KPQ7vPuEtUuJrzy+NmNHE9a5pMMQ==
X-Google-Smtp-Source: ABdhPJwocGlYY+VczoefeFwXwzxdj28ZIbBHDDuKcFOIsCdkuc81967ch8GPHhARX7/3hvgCRcr/3A==
X-Received: by 2002:a63:5158:: with SMTP id r24mr16324643pgl.41.1621904856574; 
 Mon, 24 May 2021 18:07:36 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 60/92] target/arm: Implement SVE2 multiply-add long
 (indexed)
Date: Mon, 24 May 2021 18:03:26 -0700
Message-Id: <20210525010358.152808-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v7: Rebasing dropped from v6.
---
 target/arm/helper-sve.h    | 17 +++++++++++++++++
 target/arm/sve.decode      | 18 ++++++++++++++++++
 target/arm/sve_helper.c    | 16 ++++++++++++++++
 target/arm/translate-sve.c | 20 ++++++++++++++++++++
 4 files changed, 71 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 0be0d90bee..4a0e70ee91 100644
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
index 35010d755f..dd50b9b5c0 100644
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
index 3953e2f502..2ec936a8b1 100644
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
index a03fce003e..1f6a61bf55 100644
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
2.25.1


