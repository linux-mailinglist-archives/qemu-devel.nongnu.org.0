Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D986536713
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:45:52 +0200 (CEST)
Received: from localhost ([::1]:41684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuey6-0008U6-SX
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYs-0007rx-U9
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:46 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:44546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYp-0003hW-0i
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:45 -0400
Received: by mail-pg1-x529.google.com with SMTP id v15so4552536pgk.11
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iu8acu9RCo4jIFhvkjv0YYU2f3pMZTp/RdBsaZCJTTk=;
 b=vOABR0WflFONDwCic3zR5TxRzB4XE0acF/TTQNf2RcvAvWa0tMZ8yLk2cAOnJz8G21
 rcQuYZoi3MS9RAAWZFaQrbboP5XKeuRJSjppMrktukjFShvToixyOr0ocrcK2hk+xZt/
 7LoJSbLAVMYt7wXTGQT5Harr0VpkJuxfDU9PPNAibN2eWR/kToYd4UQ1RLyPCABoRS8T
 MDooyjs6y93/k1fsLlphLWRA0SRYEDPYEwEIfQw7yz9ZY7lmWLiChQmjWlqXze2Cbgkz
 UzwBhMtWJX7aP+btip4HcUm9lCGDFZBkmebS0Joc4x/kbWaCwL2oIfPuKjWyE+eTneoD
 KI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iu8acu9RCo4jIFhvkjv0YYU2f3pMZTp/RdBsaZCJTTk=;
 b=h3H+Xoo1zr1I14UXjNRFxFzgywP5HPvdNGJY2BE77EPqJxe3W+1RqKYqcCSRqJMdot
 9+uiQiiylscXFguSWANxE6ScERZKoQqNyaOTrAnBZSEVLf0/gLHB2T+ALHX5yqPfWxIi
 amRjICJImLdo8ZNBEADiF2WGBIw725JWr0D2ltdaeGe/T5BMunEGuMoF7rq3LspM+4Yb
 jgasz2e4r+gHJs8QhGXvSmWFicbDE60P3TfiIzfNaYQtBcTwF1RhZBG1MbxrEde1Mlvv
 gGvN6u9Hf9uTuf8a4EVvzVdKbL+p8WYgPS8XxEi+S/O+TA5NxVqzB6mqRNDfCC78z7pQ
 vSrw==
X-Gm-Message-State: AOAM530gF/6JSAOSUPw69cTE7wCp2Kzdleoc6z9a8eORFKXF/EsbTE6y
 g6Cmadf0q5l1fk+0V9EpEyhFjzb2mjTWWw==
X-Google-Smtp-Source: ABdhPJwDmLYYiO1bQagjPjLp1drptAd8pDYDq5TCh5+hEltLYMdUzMNzi78HbSD6F+26NvqZLy/Npg==
X-Received: by 2002:a05:6a00:2a03:b0:518:2d8d:8c46 with SMTP id
 ce3-20020a056a002a0300b005182d8d8c46mr44825281pfb.15.1653675581764; 
 Fri, 27 May 2022 11:19:41 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 035/114] target/arm: Use TRANS_FEAT for RAX1
Date: Fri, 27 May 2022 11:17:48 -0700
Message-Id: <20220527181907.189259-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The decode for RAX1 sets esz to MO_8, because that's what
we use by default for "no esz present".  We changed that
to MO_64 during translation because it is more logical for
the operation.  However, the esz argument to gen_gvec_rax1
is unused and forces MO_64 within that function, so there
is no need to do it here as well.

Simplify to use gen_gvec_fn_arg_zzz and TRANS_FEAT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e92fef2304..36d739d7b2 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7814,13 +7814,7 @@ TRANS_FEAT(SM4E, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
 TRANS_FEAT(SM4EKEY, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
            gen_helper_crypto_sm4ekey, a, 0)
 
-static bool trans_RAX1(DisasContext *s, arg_rrr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve2_sha3, s)) {
-        return false;
-    }
-    return gen_gvec_fn_zzz(s, gen_gvec_rax1, MO_64, a->rd, a->rn, a->rm);
-}
+TRANS_FEAT(RAX1, aa64_sve2_sha3, gen_gvec_fn_arg_zzz, gen_gvec_rax1, a)
 
 static bool trans_FCVTNT_sh(DisasContext *s, arg_rpr_esz *a)
 {
-- 
2.34.1


