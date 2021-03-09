Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A01332E55
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:34:30 +0100 (CET)
Received: from localhost ([::1]:46730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhBd-0005aa-Bk
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:34:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7p-0000PZ-Qf
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:29 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:37042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7e-0002nb-C1
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:24 -0500
Received: by mail-ot1-x332.google.com with SMTP id 75so10096268otn.4
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XJukSUnh/ZapdqYElhaMrdNjfVgk9LJj1DVZruN+l2s=;
 b=NEvaxp3JgyvtJgZ8a914jHnXXBs9ScOzLYAnhMiVjNu0LrXN6LUUZkxy8EZXnVdeCB
 YPXBzHuGmdDoRe0v0B1Apqv76LYm2chAz8sg/Nvsnu7RCY+IKaHVaY4j+XGjLdIOuBhC
 c/BTrJaeUyLcwhbtw1nr2g1M7RiU8owhZEvNrjAoZbxOk5UpzpOLRvMJiAXMp1nHNuGM
 s2BzSj7E9y5TB7285FVOMQXRnxcMmPRg0PiNsFREfs8YTl2/qs6iN7VOohrPT0SyMSGw
 X0qoTARqMb0Fhwa4sTkF5DIHXliCjQeup7pLOoCZt41D4hrZ4aTSvecBu1NlmQwFv0mB
 D9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XJukSUnh/ZapdqYElhaMrdNjfVgk9LJj1DVZruN+l2s=;
 b=BFn51HDSbv+HGVZ3y6iC+9Q04et+KqCpY97T70riegBS2/c1lj1zhl2hTVVD1PIVem
 3XmCiVWYvFfvZSSn82gxr3Xres7dm28bpD0Xk1Y9cg3rWu6pVc60riUs/94oraBoW3rT
 4DX1NXA0/DIesXymOuQXirwCNNP8CbKZhsgPfsI7eryATYserBRnwzedubYJXoTYsh0B
 6u40V9UF5VJbDQuUz58OYzDMicCfBzCYLkxGtgjyyPRxUa9alJwEmAQx8yFsKIU+6vFH
 vQ2iuxGkOTKcLtoJTNnGmpLlHbIfxeQQ56WIN6lUfROdH+iDdtZ2IBqVU9Wk/7xVZOVW
 UodA==
X-Gm-Message-State: AOAM530vaPoXDBKvNNbQANqwRevo6hgictWVWh/o8H5G2nYhDNvPFfpr
 70B3NwW2D9gWTcrI6JCrI1if3nvgeEfY4EE6
X-Google-Smtp-Source: ABdhPJx56YQXd3eYQXaaTo5MBEbw9oF3oMHbDRmBzaiyhV6kcyWnRsGdIfPEShD4dlK2F1W+iKYAMw==
X-Received: by 2002:a05:6830:1404:: with SMTP id
 v4mr15878259otp.2.1615306933276; 
 Tue, 09 Mar 2021 08:22:13 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:22:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 52/78] target/arm: Implement SVE2 integer multiply (indexed)
Date: Tue,  9 Mar 2021 08:20:15 -0800
Message-Id: <20210309162041.23124-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  7 +++++++
 target/arm/translate-sve.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 87ee5b8629..5d20392887 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -777,12 +777,19 @@ MUL_zzi         00100101 .. 110 000 110 ........ .....          @rdn_i8s
 DOT_zzzz        01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5 \
                 ra=%reg_movprfx
 
+#### SVE Multiply - Indexed
+
 # SVE integer dot product (indexed)
 SDOT_zzxw_s     01000100 .. 1 ..... 000000 ..... .....          @rrxr_s
 SDOT_zzxw_d     01000100 .. 1 ..... 000000 ..... .....          @rrxr_d
 UDOT_zzxw_s     01000100 .. 1 ..... 000001 ..... .....          @rrxr_s
 UDOT_zzxw_d     01000100 .. 1 ..... 000001 ..... .....          @rrxr_d
 
+# SVE2 integer multiply (indexed)
+MUL_zzx_h       01000100 .. 1 ..... 111110 ..... .....          @rrx_h
+MUL_zzx_s       01000100 .. 1 ..... 111110 ..... .....          @rrx_s
+MUL_zzx_d       01000100 .. 1 ..... 111110 ..... .....          @rrx_d
+
 # SVE floating-point complex add (predicated)
 FCADD           01100100 esz:2 00000 rot:1 100 pg:3 rm:5 rd:5 \
                 rn=%reg_movprfx
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 35d02df493..ee2ef91355 100644
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
 
+static bool do_sve2_zzx_ool(DisasContext *s, arg_rrx_esz *a,
+                            gen_helper_gvec_3 *fn)
+{
+    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vsz, vsz, a->index, fn);
+    }
+    return true;
+}
+
+#define DO_SVE2_RRX(NAME, FUNC) \
+    static bool NAME(DisasContext *s, arg_rrx_esz *a)  \
+    { return do_sve2_zzx_ool(s, a, FUNC); }
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
2.25.1


