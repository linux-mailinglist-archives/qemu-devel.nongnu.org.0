Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148E553675E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:13:28 +0200 (CEST)
Received: from localhost ([::1]:51332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufOp-0005Wh-6O
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:13:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecT-0003jU-2L
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:29 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:52776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecK-0004TT-L7
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:27 -0400
Received: by mail-pj1-x102b.google.com with SMTP id gz24so5289348pjb.2
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Uu1Iz88Pfa1YxbpojNLWlSogo5RsY8Uf8XVdMlY3c8=;
 b=IdMGFv//Fe3J9y4CggQXdoeyIEXJYkTX7T2DFM3Ofh8pi1LMR3sBfNoYeQCAiya/Cp
 uFTtwJwjYqo3JdGt1h2B25qAb0d82rib/9ND5CDfaHa8kh1AJL0msqBECA42JE7gURuy
 Ewa1fB3cCR5iGT89jamjMPa9wz0bQuGZ800P4jgVGeEETL5e1wtGFTEzm4nUZDkUXHj9
 4hZTm9HJwvEkB7REzHA+rJJIknILzGMpdhfKb/mB6MEX5+NCEFFxqa+rxSl+dWhC5CoB
 FWbPDlXBLD2wHva5WmnVGDhdPhgnBofNbpD2hfnGYk1G93Arrauo1IlY9nVr0B2odQVj
 6JXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Uu1Iz88Pfa1YxbpojNLWlSogo5RsY8Uf8XVdMlY3c8=;
 b=DRV2h5y+/dHHLEguWVSTfYbKGi5I1RS7ktkBocWPqyGPyXp50E9E6k3yM04qUeKZfW
 85jJjKZPRpDifyNlMi1wkBYMWPDaFf+KFjTx1j57WZ52cWbaXriT8VIfaIaDfaZQMAY1
 K8q4f7DoJoeZdIC1L3xzsLHZEV9ZWIAoqW9cuVF7Jae0vpotnUH0LwjyUTs45Go43g6u
 aJrU5RSETgHZxhNuB/4b7Hg0+tO+W1hHVfpgA0DkbIRxpTMUiB+VFpR9PL+7n3zNP7LE
 dN3mJPiw2XJKXtCiI2xtk3tXCaBBYO8ZYwHRmyXRgdGevns07F7Wz3qANMxOxFWWNJCY
 Bf2Q==
X-Gm-Message-State: AOAM532sHP7zBPd90Zas1UyVHmPqSaNnKxUw6XFOTR/pddmmjiCI4Nip
 MfhrBqWcdQ0V1Yf/wUMb3vQWvIp8DL2J5g==
X-Google-Smtp-Source: ABdhPJwjpW643sW0holfrDtjY+6ROabe6sMZeIqvd54g3fyTD0M2AVKQiIPcNDJ2v50k/ZuuE0gACQ==
X-Received: by 2002:a17:90a:5d04:b0:1e0:83d7:413c with SMTP id
 s4-20020a17090a5d0400b001e083d7413cmr9739805pji.201.1653675790551; 
 Fri, 27 May 2022 11:23:10 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 067/114] target/arm: Use TRANS_FEAT for do_sve2_ppzz_flags
Date: Fri, 27 May 2022 11:18:20 -0700
Message-Id: <20220527181907.189259-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 73b5b67c25..22acd5ead0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7319,27 +7319,15 @@ DO_SVE2_ZZZ_NARROW(SUBHNT, subhnt)
 DO_SVE2_ZZZ_NARROW(RSUBHNB, rsubhnb)
 DO_SVE2_ZZZ_NARROW(RSUBHNT, rsubhnt)
 
-static bool do_sve2_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
-                               gen_helper_gvec_flags_4 *fn)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return do_ppzz_flags(s, a, fn);
-}
+static gen_helper_gvec_flags_4 * const match_fns[4] = {
+    gen_helper_sve2_match_ppzz_b, gen_helper_sve2_match_ppzz_h, NULL, NULL
+};
+TRANS_FEAT(MATCH, aa64_sve2, do_ppzz_flags, a, match_fns[a->esz])
 
-#define DO_SVE2_PPZZ_MATCH(NAME, name)                                      \
-static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)                  \
-{                                                                           \
-    static gen_helper_gvec_flags_4 * const fns[4] = {                       \
-        gen_helper_sve2_##name##_ppzz_b, gen_helper_sve2_##name##_ppzz_h,   \
-        NULL,                            NULL                               \
-    };                                                                      \
-    return do_sve2_ppzz_flags(s, a, fns[a->esz]);                           \
-}
-
-DO_SVE2_PPZZ_MATCH(MATCH, match)
-DO_SVE2_PPZZ_MATCH(NMATCH, nmatch)
+static gen_helper_gvec_flags_4 * const nmatch_fns[4] = {
+    gen_helper_sve2_nmatch_ppzz_b, gen_helper_sve2_nmatch_ppzz_h, NULL, NULL
+};
+TRANS_FEAT(NMATCH, aa64_sve2, do_ppzz_flags, a, nmatch_fns[a->esz])
 
 static gen_helper_gvec_4 * const histcnt_fns[4] = {
     NULL, NULL, gen_helper_sve2_histcnt_s, gen_helper_sve2_histcnt_d
-- 
2.34.1


