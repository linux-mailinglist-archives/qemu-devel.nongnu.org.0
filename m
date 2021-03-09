Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3E4332E27
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:22:39 +0100 (CET)
Received: from localhost ([::1]:44384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJh0A-0000rZ-IH
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:22:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7k-0000OJ-Dd
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:21 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:36524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7e-0002nM-5H
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:18 -0500
Received: by mail-ot1-x330.google.com with SMTP id t16so13349691ott.3
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s9kzQTeQJ4h6WpYSnNsPxeHmHj0fKNTfgZmJnvNGHZM=;
 b=xoHV7LlKDUSGz3Zt98i8ioNxeu69NIr4vq9Hnfh8QtMbaKIddpsBuAMQDsm2VlcgAG
 a/zmJaLAaF7vkxENoNX/2L92Z+SCqLoLU9opR3k5YQlT3SxuSyyiOEWHVPKkJf2k9Q6O
 EKI/VML1ODfF0qqTWMJtkS7vtBo9JO+vzC30X2VAY56abUuQHUN7Xc0Ku+CLmvhp4Ite
 6s95XHbwNYlgx63WCaBsZg4iLckTF4a/ztAza1W5TcU4AtqNYQxI+C4e2V2YiKvbTiyF
 l5kAeFE5yI6TGDkE5rsUwLDwSH7ccZ9j+6Jowc+0gvqock8HFgZrTfKmZGQ03zATWYx3
 whdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s9kzQTeQJ4h6WpYSnNsPxeHmHj0fKNTfgZmJnvNGHZM=;
 b=dHlnnKJwyaBRyk6Ouw7vZ9Y3EnmB7DUFU6ucO05UuseJb0jEuHoF9vDMgjl45WddjV
 UGT/K3tnlHiNqclRK2BTsFT4pDJIyFxZpiD33/13sJn2dTSr9BeM1c6EUDzcX/P3dNR3
 ck/R1tEVgoYyWvGpGf2Zl4y79TnZsu1hXlTAmOzFSYxor7kOlMeJqae0IGhMj+pIPsZ8
 A2EYtTMr3f0dIgY4XhrGOdbRcp3AFfMFpX0s478JaQ7gmvatvD/Rwv0h8bvgOc3C1kPS
 FugEO90aPYXSRdaUgUMkRhbvjsW7tMbiwkk+MQNpvJ5jjSx80XgqKF2hmWgqItOZMZI2
 gZ9A==
X-Gm-Message-State: AOAM5304l8Fj1OODgih+a0ulvoI9SkjnpPF78AQJnoCFJ/cMLJmqIP7c
 0crbaxyjfUQshIRU0giNXRWxxKKmxekK1mOp
X-Google-Smtp-Source: ABdhPJxmfnEL6cnmrwJusyVnzbDGg+oW49DwRwC//GhcMP1Dlf4IXENr34Sddz9AdaeKiWlHbh2fSw==
X-Received: by 2002:a05:6830:1e51:: with SMTP id
 e17mr24399527otj.292.1615306932220; 
 Tue, 09 Mar 2021 08:22:12 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:22:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 51/78] target/arm: Split out formats for 3 vectors + 1 index
Date: Tue,  9 Mar 2021 08:20:14 -0800
Message-Id: <20210309162041.23124-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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

Used by FMLA and DOT, but will shortly be used more.
Split FMLA from FMLS to avoid an extra sub field;
similarly for SDOT from UDOT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 29 +++++++++++++++++++----------
 target/arm/translate-sve.c | 38 ++++++++++++++++++++++++++++----------
 2 files changed, 47 insertions(+), 20 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index eb5d4b052e..87ee5b8629 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -73,6 +73,7 @@
 &rprr_s         rd pg rn rm s
 &rprr_esz       rd pg rn rm esz
 &rrrr_esz       rd ra rn rm esz
+&rrxr_esz       rd rn rm ra index esz
 &rprrr_esz      rd pg rn rm ra esz
 &rpri_esz       rd pg rn imm esz
 &ptrue          rd esz pat s
@@ -254,6 +255,14 @@
 @rrx_d          ........ 11 . index:1 rm:4 ...... rn:5 rd:5 \
                 &rrx_esz esz=3
 
+# Three registers and a scalar by index
+@rrxr_h         ........ 0. . ..      rm:3 ...... rn:5 rd:5 \
+                &rrxr_esz ra=%reg_movprfx index=%index3_22_19 esz=1
+@rrxr_s         ........ 10 . index:2 rm:3 ...... rn:5 rd:5 \
+                &rrxr_esz ra=%reg_movprfx esz=2
+@rrxr_d         ........ 11 . index:1 rm:4 ...... rn:5 rd:5 \
+                &rrxr_esz ra=%reg_movprfx esz=3
+
 ###########################################################################
 # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
 
@@ -769,10 +778,10 @@ DOT_zzzz        01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5 \
                 ra=%reg_movprfx
 
 # SVE integer dot product (indexed)
-DOT_zzxw        01000100 101 index:2 rm:3 00000 u:1 rn:5 rd:5 \
-                sz=0 ra=%reg_movprfx
-DOT_zzxw        01000100 111 index:1 rm:4 00000 u:1 rn:5 rd:5 \
-                sz=1 ra=%reg_movprfx
+SDOT_zzxw_s     01000100 .. 1 ..... 000000 ..... .....          @rrxr_s
+SDOT_zzxw_d     01000100 .. 1 ..... 000000 ..... .....          @rrxr_d
+UDOT_zzxw_s     01000100 .. 1 ..... 000001 ..... .....          @rrxr_s
+UDOT_zzxw_d     01000100 .. 1 ..... 000001 ..... .....          @rrxr_d
 
 # SVE floating-point complex add (predicated)
 FCADD           01100100 esz:2 00000 rot:1 100 pg:3 rm:5 rd:5 \
@@ -791,12 +800,12 @@ FCMLA_zzxz      01100100 11 1 index:1 rm:4 0001 rot:2 rn:5 rd:5 \
 ### SVE FP Multiply-Add Indexed Group
 
 # SVE floating-point multiply-add (indexed)
-FMLA_zzxz       01100100 0.1 .. rm:3 00000 sub:1 rn:5 rd:5 \
-                ra=%reg_movprfx index=%index3_22_19 esz=1
-FMLA_zzxz       01100100 101 index:2 rm:3 00000 sub:1 rn:5 rd:5 \
-                ra=%reg_movprfx esz=2
-FMLA_zzxz       01100100 111 index:1 rm:4 00000 sub:1 rn:5 rd:5 \
-                ra=%reg_movprfx esz=3
+FMLA_zzxz       01100100 .. 1 ..... 000000 ..... .....  @rrxr_h
+FMLA_zzxz       01100100 .. 1 ..... 000000 ..... .....  @rrxr_s
+FMLA_zzxz       01100100 .. 1 ..... 000000 ..... .....  @rrxr_d
+FMLS_zzxz       01100100 .. 1 ..... 000001 ..... .....  @rrxr_h
+FMLS_zzxz       01100100 .. 1 ..... 000001 ..... .....  @rrxr_s
+FMLS_zzxz       01100100 .. 1 ..... 000001 ..... .....  @rrxr_d
 
 ### SVE FP Multiply Indexed Group
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7439dd928b..35d02df493 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3813,26 +3813,34 @@ static bool trans_DOT_zzzz(DisasContext *s, arg_DOT_zzzz *a)
     return true;
 }
 
-static bool trans_DOT_zzxw(DisasContext *s, arg_DOT_zzxw *a)
+static bool do_zzxz_ool(DisasContext *s, arg_rrxr_esz *a,
+                        gen_helper_gvec_4 *fn)
 {
-    static gen_helper_gvec_4 * const fns[2][2] = {
-        { gen_helper_gvec_sdot_idx_b, gen_helper_gvec_sdot_idx_h },
-        { gen_helper_gvec_udot_idx_b, gen_helper_gvec_udot_idx_h }
-    };
-
+    if (fn == NULL) {
+        return false;
+    }
     if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, fns[a->u][a->sz], a->rd, a->rn, a->rm,
-                          a->ra, a->index);
+        gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, a->index);
     }
     return true;
 }
 
+#define DO_RRXR(NAME, FUNC) \
+    static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
+    { return do_zzxz_ool(s, a, FUNC); }
+
+DO_RRXR(trans_SDOT_zzxw_s, gen_helper_gvec_sdot_idx_b)
+DO_RRXR(trans_SDOT_zzxw_d, gen_helper_gvec_sdot_idx_h)
+DO_RRXR(trans_UDOT_zzxw_s, gen_helper_gvec_udot_idx_b)
+DO_RRXR(trans_UDOT_zzxw_d, gen_helper_gvec_udot_idx_h)
+
+#undef DO_RRXR
 
 /*
  *** SVE Floating Point Multiply-Add Indexed Group
  */
 
-static bool trans_FMLA_zzxz(DisasContext *s, arg_FMLA_zzxz *a)
+static bool do_FMLA_zzxz(DisasContext *s, arg_rrxr_esz *a, bool sub)
 {
     static gen_helper_gvec_4_ptr * const fns[3] = {
         gen_helper_gvec_fmla_idx_h,
@@ -3847,13 +3855,23 @@ static bool trans_FMLA_zzxz(DisasContext *s, arg_FMLA_zzxz *a)
                            vec_full_reg_offset(s, a->rn),
                            vec_full_reg_offset(s, a->rm),
                            vec_full_reg_offset(s, a->ra),
-                           status, vsz, vsz, (a->index << 1) | a->sub,
+                           status, vsz, vsz, (a->index << 1) | sub,
                            fns[a->esz - 1]);
         tcg_temp_free_ptr(status);
     }
     return true;
 }
 
+static bool trans_FMLA_zzxz(DisasContext *s, arg_FMLA_zzxz *a)
+{
+    return do_FMLA_zzxz(s, a, false);
+}
+
+static bool trans_FMLS_zzxz(DisasContext *s, arg_FMLA_zzxz *a)
+{
+    return do_FMLA_zzxz(s, a, true);
+}
+
 /*
  *** SVE Floating Point Multiply Indexed Group
  */
-- 
2.25.1


