Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A279390667
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:16:14 +0200 (CEST)
Received: from localhost ([::1]:48484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZj3-0004rN-1O
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYc8-0004qM-6z
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:05:03 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:51006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYc4-0004yI-9d
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:59 -0400
Received: by mail-wm1-x336.google.com with SMTP id t206so16960324wmf.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8+NyjK9O5KYrc+0nnzhwrGmdqQFTiMAvTs+dYwd1a90=;
 b=nqmnYLZ/wD5Oil+Xt/dOXQWSfFmK0pxH4gvY7QuUx4XSlJEJj8faEqYgzBk8Y1JGVD
 2x1oxOgc5YoW1CYrMazhue5jsdqagMFXXd+hNIunknMyGc1WWQ7KxQBtvOOoKLlOM+2v
 t1Le0QLGz7gUSG+6C8q+a628GzROa+PoiyXx7AkKVaINwkKvycZ8fyHbTsEk1ISXatWH
 2YSdV7ThRJ6QcDNyLxrOYGoI26OCsDofS/fe46yaX7DkjUQDi7pd5J7AjNpyVktyTonE
 2cilsekwbNIlaUL/wyN+pBTCyDYDWPZ6AH/XYBpcqEuorcdHzwXE7DS3dEzQ8T2Zz8MT
 FNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8+NyjK9O5KYrc+0nnzhwrGmdqQFTiMAvTs+dYwd1a90=;
 b=oaYDSZ3ZT1LXz5ovQr9JntPOzDzeDviMl858x/NN+N2aqOL+JAwovh/zD0pmILNFD2
 w50+Yw0SGb8FwrSNvpFVtXtWTGdE4e8dP5ylvieLP+kzyN920nEZuk+ZkpqoUXdgDceS
 U7Z3xEHZ+Z9MeQcLf857/MDAzRyooBlfiADCCEtJQQX+nOkNIs/1+3e9kYdodKSs1Y5k
 sxZphkYpNG7wA8gq/1XzJoLjF8lvAXyGq4v+8IhqpvxQKISauqOox+kwXyw1GUtdHXRI
 iQun5z4ZC3Mc1G9oaQvO9AXMXMu10a3IRBwg8vFqLm7YtxH38qJWehEEGwinZ75fexcX
 oNfA==
X-Gm-Message-State: AOAM532GXPfbbJv8F5E7ShSteuGgYSmHpkE8naBs7azBHc+IKgjEEc/0
 LZrdxhaijML5q6nVOuouKjjiMUfJqRX2PRDd
X-Google-Smtp-Source: ABdhPJyTSCA1TjXJbdmV2EWS8m0QyfnpMF5e4gHO9WLu0wHGPtNjhOkFT1Bke92nqz/cflwMwKWSoQ==
X-Received: by 2002:a7b:c93a:: with SMTP id h26mr4281795wml.141.1621955094878; 
 Tue, 25 May 2021 08:04:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 089/114] target/arm: Implement SVE mixed sign dot product
Date: Tue, 25 May 2021 16:02:59 +0100
Message-Id: <20210525150324.32370-90-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-68-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h        |  1 +
 target/arm/sve.decode      |  4 ++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 target/arm/vec_helper.c    |  1 +
 4 files changed, 22 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index e4c6458f989..2e212ae96be 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -612,6 +612,7 @@ DEF_HELPER_FLAGS_5(gvec_sdot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_udot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_sdot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_udot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_usdot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(gvec_sdot_idx_b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index c6b32a3f69d..9f037fe5a78 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1530,6 +1530,10 @@ UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
 CMLA_zzzz       01000100 esz:2 0 rm:5 0010 rot:2 rn:5 rd:5  ra=%reg_movprfx
 SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
 
+## SVE mixed sign dot product
+
+USDOT_zzzz      01000100 .. 0 ..... 011 110 ..... .....  @rda_rn_rm
+
 ### SVE2 floating point matrix multiply accumulate
 
 FMMLA           01100100 .. 1 ..... 111001 ..... .....  @rda_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 30894a4143b..ae078b095aa 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8132,3 +8132,19 @@ static bool trans_SQRDCMLAH_zzzz(DisasContext *s, arg_SQRDCMLAH_zzzz *a)
     }
     return true;
 }
+
+static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
+{
+    if (a->esz != 2 || !dc_isar_feature(aa64_sve_i8mm, s)) {
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
index f128b41eaca..21ae1258f2e 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -566,6 +566,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
 
 DO_DOT(gvec_sdot_b, int32_t, int8_t, int8_t)
 DO_DOT(gvec_udot_b, uint32_t, uint8_t, uint8_t)
+DO_DOT(gvec_usdot_b, uint32_t, uint8_t, int8_t)
 DO_DOT(gvec_sdot_h, int64_t, int16_t, int16_t)
 DO_DOT(gvec_udot_h, uint64_t, uint16_t, uint16_t)
 
-- 
2.20.1


