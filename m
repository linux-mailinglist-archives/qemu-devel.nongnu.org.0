Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251CF38F7C2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:55:00 +0200 (CEST)
Received: from localhost ([::1]:42898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMHb-0000RJ-1q
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYF-0008Q7-Hu
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:07 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:35618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXr-00043Y-JI
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:06 -0400
Received: by mail-pg1-x52c.google.com with SMTP id m190so21413146pga.2
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J0U7o9nxMC5lTXFPuzpsH42oZtV01Y61hMVi7cku2iM=;
 b=NM/c2nD/9H9lClDfTd3VxN949tjLzbs23VKEJbEheD9Nary0ovqdvqMXwru5HkDhzd
 NtroxpNPyjUZjcdmTdLRf5KRC4Je5JlJz4E9jHsAvl+Vj2y3qGNhufb/JB3igcuNdv1w
 mqsF1WT0IyRLA6Rt6YZPK2HsxgmKkhugUXjJzimA7eIHOUgrM7SRzqZJYvwqPhlwxBnA
 ZDAOiXT+iJ8WkA9uoAU7dcTiizmRwO/ksk5IESW1fE82WT/FVHeY/hDcgn+lo/KSmT7w
 A0jfW1tMViXt1phgBIomVzmlZQ8ANU6vkiTgtia3EokytYPPqRxSt9XOttVTnZQwBhqg
 qC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J0U7o9nxMC5lTXFPuzpsH42oZtV01Y61hMVi7cku2iM=;
 b=m9TYXjH5a8+5rmBEkoR8OttPedq4cfeLZO+NY7NWNkyjoZ3vr2B7nteJkQL5Llh5JC
 eujZv2Qzhg0FDS91DuGRjRzb2hije7R430/8ZwpUUFeBkiW0NmHixhN64BLcN6f4UOFQ
 pkxLxPrDN7I7rTXKhGBuvGcaYu017TBkO6MeiUREWqLF1JHPcCdvWaaYLil7+UUSNQ5O
 BAnoPBDZ1/xFOplljGkZ3B9CL00REsDUMf5GAWupA/O+BY09z5Ff2flvUr47k5+/Vdv2
 slT85newzE8TJRS9CSvgJ1MkNJ9yfaYokcxJ97w7OlKG0bxvCOkVWctldvAf5NDZbZgx
 jsBw==
X-Gm-Message-State: AOAM533qawApQrgXHg3uSvKhlLiLuZHNH23vv+VMbYsKMAY0nQG/VwWe
 SLZ8X0bdhkd58HsIeJZ4/p9qFbodxuwW4w==
X-Google-Smtp-Source: ABdhPJxFbfyOVM4E9D/SQbmpHiFaBnzrCdh9iJfvdiXs+/SsnlhQVR9/4Vx2D+J1yJETdBBHyVkutA==
X-Received: by 2002:a62:ea03:0:b029:2e7:8445:243c with SMTP id
 t3-20020a62ea030000b02902e78445243cmr13102091pfh.54.1621904851700; 
 Mon, 24 May 2021 18:07:31 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 52/92] target/arm: Split out formats for 3 vectors + 1 index
Date: Mon, 24 May 2021 18:03:18 -0700
Message-Id: <20210525010358.152808-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Used by FMLA and DOT, but will shortly be used more.
Split FMLA from FMLS to avoid an extra sub field;
similarly for SDOT from UDOT.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 29 +++++++++++++++++++----------
 target/arm/translate-sve.c | 38 ++++++++++++++++++++++++++++----------
 2 files changed, 47 insertions(+), 20 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a504b55dad..74ac72bdbd 100644
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
@@ -252,6 +253,14 @@
 @rrx_2          ........ .. . index:2 rm:3 ...... rn:5 rd:5  &rrx_esz
 @rrx_1          ........ .. . index:1 rm:4 ...... rn:5 rd:5  &rrx_esz
 
+# Three registers and a scalar by N-bit index
+@rrxr_3         ........ .. . ..      rm:3 ...... rn:5 rd:5 \
+                &rrxr_esz ra=%reg_movprfx index=%index3_22_19
+@rrxr_2         ........ .. . index:2 rm:3 ...... rn:5 rd:5 \
+                &rrxr_esz ra=%reg_movprfx
+@rrxr_1         ........ .. . index:1 rm:4 ...... rn:5 rd:5 \
+                &rrxr_esz ra=%reg_movprfx
+
 ###########################################################################
 # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
 
@@ -767,10 +776,10 @@ DOT_zzzz        01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5 \
                 ra=%reg_movprfx
 
 # SVE integer dot product (indexed)
-DOT_zzxw        01000100 101 index:2 rm:3 00000 u:1 rn:5 rd:5 \
-                sz=0 ra=%reg_movprfx
-DOT_zzxw        01000100 111 index:1 rm:4 00000 u:1 rn:5 rd:5 \
-                sz=1 ra=%reg_movprfx
+SDOT_zzxw_s     01000100 10 1 ..... 000000 ..... .....   @rrxr_2 esz=2
+SDOT_zzxw_d     01000100 11 1 ..... 000000 ..... .....   @rrxr_1 esz=3
+UDOT_zzxw_s     01000100 10 1 ..... 000001 ..... .....   @rrxr_2 esz=2
+UDOT_zzxw_d     01000100 11 1 ..... 000001 ..... .....   @rrxr_1 esz=3
 
 # SVE floating-point complex add (predicated)
 FCADD           01100100 esz:2 00000 rot:1 100 pg:3 rm:5 rd:5 \
@@ -789,12 +798,12 @@ FCMLA_zzxz      01100100 11 1 index:1 rm:4 0001 rot:2 rn:5 rd:5 \
 ### SVE FP Multiply-Add Indexed Group
 
 # SVE floating-point multiply-add (indexed)
-FMLA_zzxz       01100100 0.1 .. rm:3 00000 sub:1 rn:5 rd:5 \
-                ra=%reg_movprfx index=%index3_22_19 esz=1
-FMLA_zzxz       01100100 101 index:2 rm:3 00000 sub:1 rn:5 rd:5 \
-                ra=%reg_movprfx esz=2
-FMLA_zzxz       01100100 111 index:1 rm:4 00000 sub:1 rn:5 rd:5 \
-                ra=%reg_movprfx esz=3
+FMLA_zzxz       01100100 0. 1 ..... 000000 ..... .....  @rrxr_3 esz=1
+FMLA_zzxz       01100100 10 1 ..... 000000 ..... .....  @rrxr_2 esz=2
+FMLA_zzxz       01100100 11 1 ..... 000000 ..... .....  @rrxr_1 esz=3
+FMLS_zzxz       01100100 0. 1 ..... 000001 ..... .....  @rrxr_3 esz=1
+FMLS_zzxz       01100100 10 1 ..... 000001 ..... .....  @rrxr_2 esz=2
+FMLS_zzxz       01100100 11 1 ..... 000001 ..... .....  @rrxr_1 esz=3
 
 ### SVE FP Multiply Indexed Group
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4f4b383e52..ae443f3b20 100644
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


