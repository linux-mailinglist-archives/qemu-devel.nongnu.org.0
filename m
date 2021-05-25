Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D7138F7E7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:08:19 +0200 (CEST)
Received: from localhost ([::1]:57624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMUU-0003pB-Ig
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYN-0000Rd-Uz
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:15 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:45855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXs-00046H-13
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:15 -0400
Received: by mail-pl1-x62f.google.com with SMTP id s4so13951527plg.12
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nAnCZLz+MRigDJDZpVvfWKaVfWlaQMDaEQ15z1KDlqw=;
 b=X2Boind6meauKW67aXkIfxA9DnmqGVI+R8Rs1fAzr+5FbaoTWPbL30HMmneSGcrxjd
 qizAh16aUCgDQ7wc9qLe+5Z0e0SbB7jGz9OiwW75o68db/jOgplcEXOojFEbSjzxtsyO
 CDTy6nev7t6luKXmXDnXy4FUK4umTdMVZCqBOx7B1dFXlmUVQ2FMpr2S/tIVPjQMSa6J
 G3EHjSkvy7BC+pzH/u2Qkn19ZuShWfhcFqjIlUxI8JGp/623/b+nYl594E1BKWdExRrD
 vva8Q48PN+6cJCd82AC6H352CJgz6NKCA03w7jdHKk74/HfN1nFc9RnMFSJu6X5khpRf
 dJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nAnCZLz+MRigDJDZpVvfWKaVfWlaQMDaEQ15z1KDlqw=;
 b=SFRv4urLvCDfPZidUnZAf7deh098/tgvuNSZp2eYFsU81dDioEgz8G0UqmOYbYPDQ3
 51X/3DCC2hRNMtqujVYEl4XpngUlbT/xRbXavomoOTVlWyV3JPZmWpu0vVyVP2FD6NdW
 8UKarU/UxNMdDUxse6WLI0AZst+ccsHhRcMGlovkwesivq3vNAJWCIYO3gEp5vxC57ts
 ZEWdIWKBNeK7IzubNi6Jsx6CDe/elgCe1MaC2p9IIxnQklvykmQft01OzWI/cWU08qGa
 rwAaafZWihu3SX500vyr+oN51SC6cZKIj+H+nmOcwnpEEHsgrOnnddOEPMs+g+vHrtlt
 XihQ==
X-Gm-Message-State: AOAM533tMTvRCkNjntLYsTdsKreU39kf+EyA83TXXa0YKr/Eb62Qx/PH
 nZBaMKqBeXkdwHDtQDyqxuV2bLztWERLYg==
X-Google-Smtp-Source: ABdhPJyb+EH9b8PnageFqUTTzzJEYhdFjKO3u1We+DFhGR2k5NgF3JxtMr1vt15zPP+20zqMeWNWMQ==
X-Received: by 2002:a17:90a:b796:: with SMTP id
 m22mr2058749pjr.146.1621904860670; 
 Mon, 24 May 2021 18:07:40 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 67/92] target/arm: Implement SVE mixed sign dot product
Date: Mon, 24 May 2021 18:03:33 -0700
Message-Id: <20210525010358.152808-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  1 +
 target/arm/sve.decode      |  4 ++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 target/arm/vec_helper.c    |  1 +
 4 files changed, 22 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index e4c6458f98..2e212ae96b 100644
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
index c6b32a3f69..9f037fe5a7 100644
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
index 30894a4143..ae078b095a 100644
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
index f128b41eac..21ae1258f2 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -566,6 +566,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
 
 DO_DOT(gvec_sdot_b, int32_t, int8_t, int8_t)
 DO_DOT(gvec_udot_b, uint32_t, uint8_t, uint8_t)
+DO_DOT(gvec_usdot_b, uint32_t, uint8_t, int8_t)
 DO_DOT(gvec_sdot_h, int64_t, int16_t, int16_t)
 DO_DOT(gvec_udot_h, uint64_t, uint16_t, uint16_t)
 
-- 
2.25.1


