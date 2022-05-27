Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BBB53674A
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:03:03 +0200 (CEST)
Received: from localhost ([::1]:50320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufEk-0001yH-Is
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYc-000702-Ts
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:30 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:34497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYZ-0003bJ-D9
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:30 -0400
Received: by mail-pf1-x432.google.com with SMTP id c65so4412712pfb.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3b6oJsf272bBUvknuTekfS8egmhm3vac1GqETP8gKmo=;
 b=UO1E1bI8D890zqnqvhUMIP65Wd86esUYdtVn2ogkyJbwV0lEcmq4jad88tFAGfojHT
 6hqVHDcbcGlw1M3Ndx4NzsavE/Gu4ilWfVN89ynsKoo4NNTC6HNYJCNH+JjqCfbk38mC
 D5svG2BgS5rdDmRP5r7S8jn34yZFDMh9dpC9mkR0hxeGwdGJ7SoFZ4gna+0Uuiu9pwDZ
 GACQO8kwjzOkgZJ3S2AzGUfB/r2hnqGJI6dJxK8NQNj7urT8resHH0rNd6VPHh+vW6+c
 tjGJSlS2gGxEgnQ2Iv/sh3TjED2pA7LaewVFbcflTq4TacyC6tFaSIITSgjbMPMEOhfX
 YR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3b6oJsf272bBUvknuTekfS8egmhm3vac1GqETP8gKmo=;
 b=nAMEDyYT91D4+o4tGFuopS7NaOUBNp5cMdEc4L1VUrd7hXUE/wzW7jJsWAskpPl01S
 i7Ll4rO5WjintMMzIrD+AbBqGtRD2uB/fl0Qn7if5qiUDZJyDzVNXdFt4qKSaf1jNFTo
 DyIJZCPlZq3LXGA/BHGIttpUNqzMY133ljDhnmAqbuGH84dKic+lJhSqc4uTe3TUH4Sk
 hfBui0nyYz3k5ZlFidNRKREXyR/XtHjbg5yKUSSmCDDaZJH0PGPRwzeAmXTuwceLMNgZ
 4b6SoIuL8RCGRm8cq5LWfwZn9O8TKWQ/iAqFeRtJQS8FwyWGeo/CfLL3ppuT67KdUo0e
 OCtg==
X-Gm-Message-State: AOAM531QStl8154ojz6hPc7ubLm06x+X9T/9oSnI7quhgp2xlVrhhttr
 u8WR7NkjEDe3rVDRyZkuGnUBtDm3uOTT9Q==
X-Google-Smtp-Source: ABdhPJzUDng3C7TpDChDQ2L1uWsdhMyhp9lbQ9b7KLNB4ZhUAQungV1xffyp6SF3FumXWWFGidS9kQ==
X-Received: by 2002:a63:8342:0:b0:3fb:c6b3:23ae with SMTP id
 h63-20020a638342000000b003fbc6b323aemr1329287pge.154.1653675566082; 
 Fri, 27 May 2022 11:19:26 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 018/114] target/arm: Use TRANS_FEAT for USDOT_zzzz
Date: Fri, 27 May 2022 11:17:31 -0700
Message-Id: <20220527181907.189259-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

This is the last direct user of tcg_gen_gvec_4_ool.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2347b60d8e..b4307f062c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8044,21 +8044,8 @@ static gen_helper_gvec_4 * const sqrdcmlah_fns[] = {
 TRANS_FEAT(SQRDCMLAH_zzzz, aa64_sve2, gen_gvec_ool_zzzz,
            sqrdcmlah_fns[a->esz], a->rd, a->rn, a->rm, a->ra, a->rot)
 
-static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
-{
-    if (a->esz != 2 || !dc_isar_feature(aa64_sve_i8mm, s)) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_4_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vec_full_reg_offset(s, a->ra),
-                           vsz, vsz, 0, gen_helper_gvec_usdot_b);
-    }
-    return true;
-}
+TRANS_FEAT(USDOT_zzzz, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
+           a->esz == 2 ? gen_helper_gvec_usdot_b : NULL, a, 0)
 
 TRANS_FEAT(AESMC, aa64_sve2_aes, gen_gvec_ool_zz,
            gen_helper_crypto_aesmc, a->rd, a->rd, a->decrypt)
-- 
2.34.1


