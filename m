Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AD1332E7F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:48:12 +0100 (CET)
Received: from localhost ([::1]:45246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhOt-0001Cq-1i
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:48:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf80-0000RS-4j
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:41 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:46170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7k-0002p9-1f
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:35 -0500
Received: by mail-ot1-x331.google.com with SMTP id r24so6274043otq.13
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n5+mVnW6j6a5LEyFP98f4FS2kW0fwkO2c1u4z0El7gk=;
 b=hsiAzyPXdjdgysBMTktOGPo6fAPQzYOum+zleUo4r3I/1eJM6vezTRuBIbhEHnvPSg
 9v8MMKzXgnSxz816g5Zz7JCOlN0JlKlhJP3+MXgvrDnOvkknL0tXi17fjMAW/o76UTRo
 LEtZm5hJOlLagHWikzMzqR5N2QpECWsasQTkLRTiaTInKLan6H7rv7V8hhNAZzhZ9fFi
 w1PQLe0582JoQCm2nOjCIaTUecjVa0rZ7rBbJPjc0xyTnHMP5ZSJ1YLdS97W8Q7whDR4
 oaorxmEM2/DJjv4ei1QX2Tgbb49bglBniDckXj/zeUCfLt3JjmZSwAUdEZzMMMaOa2xr
 2yDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n5+mVnW6j6a5LEyFP98f4FS2kW0fwkO2c1u4z0El7gk=;
 b=OLc+aRDtMghBPIpuwih1G9A7aflpNcyRqsNIRVZ93xSNbBQQ7W8z9AkPJI0Dr7crBL
 3k3ay/yl4X7ViVvDIm3j/uI0pgfU6DMij40QyF57RRhh6PiD1O+KUGC1HOhN7BBr50Yj
 gvENIz8GyjhsxTupZYxXC4kHLRtTvoKX+I420JKwUUiqx/NJyrFJacflmtSEq4OvV4su
 fqMdniWVAyrM2l6pu421b3lGGLj9EM7OC7zb/dYEzFfreq9B9L7Nknp+TRg/rFxcGH9/
 SsIazqjbvO5ocSH4SAyoFo8cqZ3n8XhWNR/B0Pq3agXHIvIVZaQ++r9NJlCzahRmvzX/
 GUkQ==
X-Gm-Message-State: AOAM533bJtOxX7U5P88w1LIDmzTffAo8c3cyUYY4ad/dYBhD2SO2KcXF
 SWuwu+puSGpu0P/cdZ4LztdV5VI4E9fKWGTG
X-Google-Smtp-Source: ABdhPJxguUGoYh2s8rxva6EzUyG2LKTdUh3P/gNkV+vzaw5aeVTFccdAR4k8/ldO33YMreRQyFmnYA==
X-Received: by 2002:a9d:4e1a:: with SMTP id p26mr903207otf.202.1615306938661; 
 Tue, 09 Mar 2021 08:22:18 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:22:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 57/78] target/arm: Implement SVE2 saturating multiply
 (indexed)
Date: Tue,  9 Mar 2021 08:20:20 -0800
Message-Id: <20210309162041.23124-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 5 +++++
 target/arm/sve.decode      | 6 ++++++
 target/arm/sve_helper.c    | 3 +++
 target/arm/translate-sve.c | 5 +++++
 4 files changed, 19 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index a3690082af..548dedf24c 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2693,3 +2693,8 @@ DEF_HELPER_FLAGS_4(sve2_smull_idx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_smull_idx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_umull_idx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_umull_idx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sqdmull_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmull_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index ebb892748b..a0c930ed66 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -835,6 +835,12 @@ UMULLB_zzx_d    01000100 .. 1 ..... 1101.0 ..... .....          @rrxl_d
 UMULLT_zzx_s    01000100 .. 1 ..... 1101.1 ..... .....          @rrxl_s
 UMULLT_zzx_d    01000100 .. 1 ..... 1101.1 ..... .....          @rrxl_d
 
+# SVE2 saturating multiply (indexed)
+SQDMULLB_zzx_s  01000100 .. 1 ..... 1110.0 ..... .....          @rrxl_s
+SQDMULLB_zzx_d  01000100 .. 1 ..... 1110.0 ..... .....          @rrxl_d
+SQDMULLT_zzx_s  01000100 .. 1 ..... 1110.1 ..... .....          @rrxl_s
+SQDMULLT_zzx_d  01000100 .. 1 ..... 1110.1 ..... .....          @rrxl_d
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 .. 1 ..... 111110 ..... .....          @rrx_h
 MUL_zzx_s       01000100 .. 1 ..... 111110 ..... .....          @rrx_s
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index b64e1f243d..95bda0ae38 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1581,6 +1581,9 @@ DO_ZZX(sve2_smull_idx_d, int64_t, int32_t,     , H1_4, DO_MUL)
 DO_ZZX(sve2_umull_idx_s, uint32_t, uint16_t, H1_4, H1_2, DO_MUL)
 DO_ZZX(sve2_umull_idx_d, uint64_t, uint32_t,     , H1_4, DO_MUL)
 
+DO_ZZX(sve2_sqdmull_idx_s, int32_t, int16_t, H1_4, H1_2, do_sqdmull_s)
+DO_ZZX(sve2_sqdmull_idx_d, int64_t, int32_t,     , H1_4, do_sqdmull_d)
+
 #undef DO_ZZX
 
 #define DO_BITPERM(NAME, TYPE, OP) \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6376a21b98..9b27f32b54 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3880,6 +3880,11 @@ DO_SVE2_RRX_TB(trans_UMULLB_zzx_d, gen_helper_sve2_umull_idx_d, false)
 DO_SVE2_RRX_TB(trans_UMULLT_zzx_s, gen_helper_sve2_umull_idx_s, true)
 DO_SVE2_RRX_TB(trans_UMULLT_zzx_d, gen_helper_sve2_umull_idx_d, true)
 
+DO_SVE2_RRX_TB(trans_SQDMULLB_zzx_s, gen_helper_sve2_sqdmull_idx_s, false)
+DO_SVE2_RRX_TB(trans_SQDMULLB_zzx_d, gen_helper_sve2_sqdmull_idx_d, false)
+DO_SVE2_RRX_TB(trans_SQDMULLT_zzx_s, gen_helper_sve2_sqdmull_idx_s, true)
+DO_SVE2_RRX_TB(trans_SQDMULLT_zzx_d, gen_helper_sve2_sqdmull_idx_d, true)
+
 #undef DO_SVE2_RRX_TB
 
 static bool do_sve2_zzxz_data(DisasContext *s, arg_rrxr_esz *a,
-- 
2.25.1


