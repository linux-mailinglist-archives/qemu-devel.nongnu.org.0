Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DDF3905F6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:56:36 +0200 (CEST)
Received: from localhost ([::1]:45568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZQ3-0005PZ-T3
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbw-0004C7-6d
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:48 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbo-0004kg-7q
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:47 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m18so2923693wrv.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dsajLD1IaKGxx53zZgCJF/LAxZtx2Jff2n3QwxW8W3M=;
 b=DIUvy5iUk+QntwAjeMP0wQIWV/ZmYKz/DPcncQL1I+ZS5AeDrnBHqUaiDSwWt11ii5
 FeMGxREgH6IVk55kRFBew/npRCSkK4izvA3iYVGbq+JPuckPSOeTVIFYfoFYYl6f5baz
 Z+GYPZg9Cfjttt5l3P/j99t1vV0+TUjlTKj4yin7CE9MBrR6RTuETffPx2MCJh3fVvg2
 TJ4Z85RjI1Z1aCKSNz/gPvP/q35DmLINJDSs+QqFaSeT3FsMJWc474RyEB5qE0alSn1l
 3h3BtoLV9iSeJVw8yopjd4bN3Gz0m2UNwDog6CPVctahEC/GpwmB0k0XSSKPX5NX584F
 xE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dsajLD1IaKGxx53zZgCJF/LAxZtx2Jff2n3QwxW8W3M=;
 b=qh6JuOS+S2Gtop0QMJs2WkQ8dRqxn63JjquYYAdzsuPdvFAivy9/fAnI32Ro2JUKsK
 MhEkQy5d1sXPExGz3Vi5U6JJ4TpGhgalQsdsEuFBklLsWylZCd+GqGLdHdJ4x6Z5tDSn
 RZO6SV62m+3q+r5WaLNIbafzLAWD3LG1TId+KtGdrrtiyBnFzt8qnGWQnoNGPq2Q883a
 eDuI1LEF0TrjJDwolWSN98d/6bxZPfnmKtAk1f6rpdxygj3vmufh/LT2p28dsOuDEQNQ
 kKVnaqDm9Dt5mqSRL9qD3nTa53WjZIHs+4gIluhoVUtEotSuBR1uMXuKAphD8jNtWdVK
 5Pfw==
X-Gm-Message-State: AOAM531hscO0/XiaKBod9T5nzOVmBQHFmEE2spDp0s507fME13LWZm3K
 VZhubBBGV0UMpKrchIj3UV0NmOvC/hO//eww
X-Google-Smtp-Source: ABdhPJwQSswCI2scpVdjXPPBzR/WjLQ7wOS7JLq1q/lAPRhQFS235X3LFOmgztaSn7sUofKSeeD+gg==
X-Received: by 2002:adf:a4c4:: with SMTP id h4mr27787927wrb.330.1621955078777; 
 Tue, 25 May 2021 08:04:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 074/114] target/arm: Split out formats for 3 vectors + 1 index
Date: Tue, 25 May 2021 16:02:44 +0100
Message-Id: <20210525150324.32370-75-peter.maydell@linaro.org>
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

Used by FMLA and DOT, but will shortly be used more.
Split FMLA from FMLS to avoid an extra sub field;
similarly for SDOT from UDOT.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-53-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve.decode      | 29 +++++++++++++++++++----------
 target/arm/translate-sve.c | 38 ++++++++++++++++++++++++++++----------
 2 files changed, 47 insertions(+), 20 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a504b55dad1..74ac72bdbd1 100644
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
index 4f4b383e528..ae443f3b20f 100644
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
2.20.1


