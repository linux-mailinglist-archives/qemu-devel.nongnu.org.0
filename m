Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B68CE538675
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:58:45 +0200 (CEST)
Received: from localhost ([::1]:35188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvij6-0002YK-Q2
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwJ-0003rG-Pq
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:26 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwH-0007Mu-9B
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:19 -0400
Received: by mail-wr1-x42d.google.com with SMTP id s24so7959037wrb.10
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=N2EMzwUbSz2wYg9OsvTZrafs2t7/0p40URA47hEKcmo=;
 b=eW+1Wpaf6f9p7tvcr5cMmtWcMDy4KX/ATxUW8CfLP/4QDnHTw0qUeE1XUv4yDIIEvF
 y6GJ2BLGubS47SCYYCsDtTf+DGYgmmozJR5Dct16W4rujKZmoExhOHnHDEZIZZseX3eY
 OAzTarT3jpXkzOU8c/Zo3ZcCXEbNfYczklR+P+gpImlzy/FubLjrJ9Qi2T5MemGYhBp3
 NfuI14kikBlVc2SSEOhJI7iwbwJlt7J9Ofb8CuahTy6X65Gh69zhQFT0heTU5srUVNvd
 3zzvD6HENBStGxNn+/E7ukvnoyNYwU2ZKdO6ejUuEMcEVvyMZXqX7vnC/PCUpSegFl9T
 lk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N2EMzwUbSz2wYg9OsvTZrafs2t7/0p40URA47hEKcmo=;
 b=XaD15/XPGmkwvMUAZmDbKbHD7QM4XhnOwlctDyNX7Iz165MxHNE8SMok5EUR79/CCC
 mhbNTo4LJehRTepnappMHU4BCr+K+xUfnkWiqBTvsi1ZZsNReMaUEc2JxoPlj/jPUFCW
 Lp0XxSK7kBgzgh2ZqhV+34FShoavVkdtzp6bFPxTXb3dt2EUZVDIWG58YUYhf/FsuHKp
 aOGCMN4Ko8DoldZ3oHzIHybAEu5jkg3S2PR+vU4r02vC27/N5MYuBq586EytCA/Z3yVg
 2WGm0Re3SyDtsedgzd5nI9O88scqNh0kMwcOCCytR6gCt95S+71elwlz+Le56GrzCbQ2
 TdMw==
X-Gm-Message-State: AOAM532oyAsV5/P+P2p5ERy14Ktb51EVO7ntX0waJ6EQY+t+Nw2x1xO0
 nWsBQi9vxpiGlT/Zuo9MUYnzD8uEnS7YIg==
X-Google-Smtp-Source: ABdhPJz0E4k0hCIf5F92zZzUUEQSl7ErABzcY5E13QcDRUq4V0xzh5Eu/BdNXC/pFpwIQ8hbnwszPQ==
X-Received: by 2002:a5d:5150:0:b0:210:1d71:3dcb with SMTP id
 u16-20020a5d5150000000b002101d713dcbmr13143281wrt.412.1653926894758; 
 Mon, 30 May 2022 09:08:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 068/117] target/arm: Use TRANS_FEAT for SPLICE
Date: Mon, 30 May 2022 17:06:19 +0100
Message-Id: <20220530160708.726466-69-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-66-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index caa587506c4..8eb70fd56f3 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2658,20 +2658,11 @@ TRANS_FEAT(REVH, aa64_sve, gen_gvec_ool_arg_zpz, revh_fns[a->esz], a, 0)
 TRANS_FEAT(REVW, aa64_sve, gen_gvec_ool_arg_zpz,
            a->esz == 3 ? gen_helper_sve_revw_d : NULL, a, 0)
 
-static bool trans_SPLICE(DisasContext *s, arg_rprr_esz *a)
-{
-    return gen_gvec_ool_zzzp(s, gen_helper_sve_splice,
-                             a->rd, a->rn, a->rm, a->pg, a->esz);
-}
+TRANS_FEAT(SPLICE, aa64_sve, gen_gvec_ool_arg_zpzz,
+           gen_helper_sve_splice, a, a->esz)
 
-static bool trans_SPLICE_sve2(DisasContext *s, arg_rpr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_zzzp(s, gen_helper_sve_splice,
-                             a->rd, a->rn, (a->rn + 1) % 32, a->pg, a->esz);
-}
+TRANS_FEAT(SPLICE_sve2, aa64_sve2, gen_gvec_ool_zzzp, gen_helper_sve_splice,
+           a->rd, a->rn, (a->rn + 1) % 32, a->pg, a->esz)
 
 /*
  *** SVE Integer Compare - Vectors Group
-- 
2.25.1


