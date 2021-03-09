Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025E7332E64
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:39:48 +0100 (CET)
Received: from localhost ([::1]:58340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhGl-00023D-1V
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:39:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf8E-0000i6-A5
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:55 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:33980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7x-0002qG-N6
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:50 -0500
Received: by mail-oi1-x236.google.com with SMTP id x78so15565386oix.1
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SdeTKTulbQDqH8eRRD1J9G4EQUVyNG3m/VHui2jrnMM=;
 b=ss2LAf/2SGarxL80xk5r+s4Miq0am4KEwjBvd8Z9Xvpvz+EDk1V2pcfRn7rRkC4s0P
 dTOwxKU276Byn5TKIgeRanQkeXD5efa5a8IYGDuIfjtSQ228khHcYT5ZbmY3NwFWbFXP
 LbjXSTLnTN+MTGN7Y/v7DY1GdvJvEX+hfFVqkVPGoXSOCYrxZUOvnwvmaF4lNeE3lvpZ
 7xOXdpPIiBfUJNO1hXUBD+E2bLA0daAQy9Ky4fT3EVdNNht2/bI6GnvopNxJ69dQT09L
 ASUih0K34IKpTiuiLKv3pOT8Pqw+0jk5PHfDLG2O7Yq445oraiQJDX7L195M6MvYkSFK
 ftrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SdeTKTulbQDqH8eRRD1J9G4EQUVyNG3m/VHui2jrnMM=;
 b=IKWh+0YIdHxj0B0apfvKrkOSQBksTvR8UPbwzuwKG8FXgRoBt8ll9/3N32Cp+Ht3UQ
 vWl6pRRvd989y41vljPmukjaImqdal3ZAP8b7lu5nGmu9j+lMU+jvrOd3jxP6gt66o3P
 mSyXXGbZAbRZ3OGynDED1tbnzqeVzIdyDg6V7KVcl640nZSNy5OwW3hIVEaex4wjtp8H
 tBtKjvQARFDRupbdm9yiy/SRKpZPBDvQsQ6Dzm5TFvYdJpCETb8Hl1J9ugnzgPvEcFZO
 JUWcapEZ69foObDERG5rEzXFpvVpebikRlLtC2Pd2HOI3a7c7r1cnU9IgvAuwi6NIHpK
 zPMA==
X-Gm-Message-State: AOAM532OmZjKakVmhbTpNgSkNj+/SWRZ3JpngyVWWvdSLBuUpCTKK8av
 iEo0t0HPi5ZNwSlnnP3z3tQgQFiNVDytwTvy
X-Google-Smtp-Source: ABdhPJx13w292cOtqBa273/tS7c4K+Feji9RngnYSpJv1uo3oNQKRKbg0PMhP4nTnRBlg8W3VC360Q==
X-Received: by 2002:aca:4e13:: with SMTP id c19mr3571969oib.40.1615306945414; 
 Tue, 09 Mar 2021 08:22:25 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:22:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 63/78] target/arm: Implement SVE mixed sign dot product
Date: Tue,  9 Mar 2021 08:20:26 -0800
Message-Id: <20210309162041.23124-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
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
 target/arm/helper.h        |  2 ++
 target/arm/sve.decode      |  4 ++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 target/arm/vec_helper.c    | 18 ++++++++++++++++++
 4 files changed, 40 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index e4c6458f98..86f938c938 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -612,6 +612,8 @@ DEF_HELPER_FLAGS_5(gvec_sdot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_udot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_sdot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_udot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_usdot_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(gvec_sdot_idx_b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 499d989087..6c4002de60 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1523,6 +1523,10 @@ UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
 CMLA_zzzz       01000100 esz:2 0 rm:5 0010 rot:2 rn:5 rd:5  ra=%reg_movprfx
 SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
 
+## SVE mixed sign dot product
+
+USDOT_zzzz      01000100 .. 0 ..... 011 110 ..... .....  @rda_rn_rm
+
 ### SVE2 floating point matrix multiply accumulate
 
 FMMLA           01100100 .. 1 ..... 111001 ..... .....  @rda_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6f80c944d3..23ffad33b0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8107,3 +8107,19 @@ static bool trans_SQRDCMLAH_zzzz(DisasContext *s, arg_SQRDCMLAH_zzzz *a)
     }
     return true;
 }
+
+static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
+{
+    if (a->esz != 2 || !dc_isar_feature(aa64_sve2_i8mm, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_4_ool(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vec_full_reg_offset(s, a->ra),
+                           vsz, vsz, 0, gen_helper_gvec_usdot_b);
+    }
+    return true;
+}
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 98b707f4f5..9b2a4d5b7e 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -579,6 +579,24 @@ void HELPER(gvec_udot_b)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
+void HELPER(gvec_usdot_b)(void *vd, void *vn, void *vm,
+                          void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int32_t *d = vd, *a = va;
+    uint8_t *n = vn;
+    int8_t *m = vm;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = (a[i] +
+                n[i * 4 + 0] * m[i * 4 + 0] +
+                n[i * 4 + 1] * m[i * 4 + 1] +
+                n[i * 4 + 2] * m[i * 4 + 2] +
+                n[i * 4 + 3] * m[i * 4 + 3]);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
 void HELPER(gvec_sdot_h)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
-- 
2.25.1


