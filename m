Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8B338F7B9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:51:44 +0200 (CEST)
Received: from localhost ([::1]:57404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMER-0008FU-Rh
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYR-0000hC-D2
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:19 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:44639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXs-00043p-47
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:19 -0400
Received: by mail-pf1-x42b.google.com with SMTP id 22so21881753pfv.11
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=znRmUtPpPzNdkgxhCUoIISqXwMWpCGz1tEvasknwhl0=;
 b=j5YHUEF77esK3OhPf0DtpTYt1FX9GDFvdcZc7maAJDS4GFZXr0eAmaCmAvgE47qJ7D
 QteP1209u6dym2+wu/HoFeq4i7DIwOjG9GuzNw+SfF1cqMQDxO0iE+bRtlUyL0pmLyx6
 RNpSYkj6NI6ASGsx11QylxiVbfvC21W95LYHRcYspEw9lbTEdBiaIErZtaJn+jUXPMNF
 XMiRZscE9L9z0WtN+S3kXRLH14eD92bXyzHNHDbLQmNTQMiMOwMZcamOA9ioXLunmhdh
 Ecu+b2wPbnB2oshTy6hcRTt7+p2j3jPLhX/Vo3hkjt3dxBJjE8vNeBJUQbJLS65vzj/K
 4tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=znRmUtPpPzNdkgxhCUoIISqXwMWpCGz1tEvasknwhl0=;
 b=KJSe1I6KdEYWwQrb/5h5Mx3pCwB8e2sOypyKemiQaHfHpy9lfGGb2C/M4bwMdWfyyL
 Mvez9FOGjbv8laFKOXcZRPM2Hwpt6kgfzfM06RhA7xYgv7cIK48i6p8Wg9ZEKP/8jDzd
 WX5WGrvyWFWHVRdcLBHlnhB+/V8YbAjaMXX8F1prQ6JN/65/jP/foBqtz+xBsOU3Bqrv
 sVkCyEMNxcphqxIZ+2U3ZHVB6NPu1DIaPK5K28CnrV1hB5J/qkODiFm2ULEOy9W7wrd8
 fw8z1wEZuzH2SUe9hWVA40z8ZPWToYW7xBUdvfB8o2F8ezJyF5vZ1pmG0Fy4UbUsb+9M
 cv5Q==
X-Gm-Message-State: AOAM530AVJD5kzNBnDK70VXM6u14hO941wWrzgCp9tv56WwTwL82aPlA
 G9WdBfB4BJe9hLgdi042QV9/UgbAP4ivyg==
X-Google-Smtp-Source: ABdhPJzr1jAeRfDJk1A7VsqZMT5OLnaGSXyVPvocWYRomHNDH/WAPOFvOEMwusJwHorJk0GPvz9ioQ==
X-Received: by 2002:a63:6f8e:: with SMTP id
 k136mr16602341pgc.326.1621904852971; 
 Mon, 24 May 2021 18:07:32 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 54/92] target/arm: Implement SVE2 integer multiply-add
 (indexed)
Date: Mon, 24 May 2021 18:03:20 -0700
Message-Id: <20210525010358.152808-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v7: Split arguments to do_sve2_zzzz_data.
---
 target/arm/sve.decode      |  8 ++++++++
 target/arm/translate-sve.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 65cb0a2206..9bfaf737b7 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -783,6 +783,14 @@ SDOT_zzxw_d     01000100 11 1 ..... 000000 ..... .....   @rrxr_1 esz=3
 UDOT_zzxw_s     01000100 10 1 ..... 000001 ..... .....   @rrxr_2 esz=2
 UDOT_zzxw_d     01000100 11 1 ..... 000001 ..... .....   @rrxr_1 esz=3
 
+# SVE2 integer multiply-add (indexed)
+MLA_zzxz_h      01000100 0. 1 ..... 000010 ..... .....   @rrxr_3 esz=1
+MLA_zzxz_s      01000100 10 1 ..... 000010 ..... .....   @rrxr_2 esz=2
+MLA_zzxz_d      01000100 11 1 ..... 000010 ..... .....   @rrxr_1 esz=3
+MLS_zzxz_h      01000100 0. 1 ..... 000011 ..... .....   @rrxr_3 esz=1
+MLS_zzxz_s      01000100 10 1 ..... 000011 ..... .....   @rrxr_2 esz=2
+MLS_zzxz_d      01000100 11 1 ..... 000011 ..... .....   @rrxr_1 esz=3
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 0. 1 ..... 111110 ..... .....   @rrx_3 esz=1
 MUL_zzx_s       01000100 10 1 ..... 111110 ..... .....   @rrx_2 esz=2
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index dbab067a53..39a6839de4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3866,6 +3866,37 @@ DO_SVE2_RRX(trans_MUL_zzx_d, gen_helper_gvec_mul_idx_d)
 
 #undef DO_SVE2_RRX
 
+static bool do_sve2_zzzz_data(DisasContext *s, int rd, int rn, int rm, int ra,
+                              int data, gen_helper_gvec_4 *fn)
+{
+    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_4_ool(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_full_reg_offset(s, rm),
+                           vec_full_reg_offset(s, ra),
+                           vsz, vsz, data, fn);
+    }
+    return true;
+}
+
+#define DO_SVE2_RRXR(NAME, FUNC) \
+    static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
+    { return do_sve2_zzzz_data(s, a->rd, a->rn, a->rm, a->ra, a->index, FUNC); }
+
+DO_SVE2_RRXR(trans_MLA_zzxz_h, gen_helper_gvec_mla_idx_h)
+DO_SVE2_RRXR(trans_MLA_zzxz_s, gen_helper_gvec_mla_idx_s)
+DO_SVE2_RRXR(trans_MLA_zzxz_d, gen_helper_gvec_mla_idx_d)
+
+DO_SVE2_RRXR(trans_MLS_zzxz_h, gen_helper_gvec_mls_idx_h)
+DO_SVE2_RRXR(trans_MLS_zzxz_s, gen_helper_gvec_mls_idx_s)
+DO_SVE2_RRXR(trans_MLS_zzxz_d, gen_helper_gvec_mls_idx_d)
+
+#undef DO_SVE2_RRXR
+
 /*
  *** SVE Floating Point Multiply-Add Indexed Group
  */
-- 
2.25.1


