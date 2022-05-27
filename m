Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB235367BC
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:57:24 +0200 (CEST)
Received: from localhost ([::1]:46854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nug5K-0007Ln-0T
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefS-0001fT-Bh
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:34 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:33564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefN-0005IH-6F
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:33 -0400
Received: by mail-pl1-x62f.google.com with SMTP id f18so4856920plg.0
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pr1PckvI4GfXO3bbXjP+Iw41YIPqzsw06R/vMa2yI4A=;
 b=vhE8HMgkGXIv24j5Zm5Sav9MzwYtP3WwSG1hReEy+D3KB45Z8qdS4Uj6xU6TugivMS
 CfZ2yQO3+gOuvBbNNg2/COBovLHEQIEAC6EPr6yuRzuQFgnzYBMo3aTd1ZIlpIAMP4tB
 B5Ib2TGOaAR7w/acsl7yWEF1kUKUDwOTOfO1I63Mdz2r5T9fF+tUCxzmrekWwn4wkuAk
 T8GbdYwE1zHiBAgkKUnPrSPjS48bFPR4k6MzHoNzA8tTmFrMMT5njEe2zpX55uiuPlTb
 y2Y0l1sxHA6JtzqUvN38tFu7G1cZDjhqZGtEXa6G7sMAbSIjIn8fXCqhhpH/NXhlubLo
 JD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pr1PckvI4GfXO3bbXjP+Iw41YIPqzsw06R/vMa2yI4A=;
 b=i6ljoTh3t3MK84C+GI5PHcqLzwKN0PwX7QfP2+zJtW5R7fW9ZIJXSkOIBPuNDJsxyf
 Qp+0KPcD6Pf2GWPKDnZv95Q0vlRSdIhUUxKrG8txD4/8btgWJB6IxxasY36GMjW+p/yW
 /PMm6L/PwxjYFKDx9VZ9p79IHZg13AxSqYAMXhZSUsC8/fhdVfCXEVF6SjzVwHdoRXx6
 u0GiWvV9+wVcBcEBWnqX++EayEb4NMTZmnBQMqNu5vzmjpEHd+dObEdGamAll6nOnorS
 WPA5q/07fJs/4goTbhZu5ILTJkphWtARHyBgSGkZ2L7eQXpPe3Pumv5Sie/DoPiPzewU
 SCew==
X-Gm-Message-State: AOAM531CIXPyCbs4jA9OgVsVDZJ4drstoUWefl+ac5JjyMXXX0oPYuPN
 /fBfG54Eh8kPBP+EJQlgPHkCfVgjRNmjlw==
X-Google-Smtp-Source: ABdhPJy+4LUC0Ypb+nGm7RpgFwYFJZOnAaVZQE3awBaDthZhT2pslUvbkVqG2kjTY1H97yLUfVz+tg==
X-Received: by 2002:a17:902:e5cb:b0:161:872d:6ed3 with SMTP id
 u11-20020a170902e5cb00b00161872d6ed3mr17325253plf.62.1653675986987; 
 Fri, 27 May 2022 11:26:26 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 084/114] target/arm: Use TRANS_FEAT for BFMLA
Date: Fri, 27 May 2022 11:18:37 -0700
Message-Id: <20220527181907.189259-85-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 target/arm/translate-sve.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5aa3e477cf..f2939fbeb9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7568,39 +7568,19 @@ TRANS_FEAT(BFMMLA, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
 
 static bool do_BFMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
 {
-    if (!dc_isar_feature(aa64_sve_bf16, s)) {
-        return false;
-    }
     return gen_gvec_fpst_zzzz(s, gen_helper_gvec_bfmlal,
                               a->rd, a->rn, a->rm, a->ra, sel, FPST_FPCR);
 }
 
-static bool trans_BFMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_BFMLAL_zzzw(s, a, false);
-}
-
-static bool trans_BFMLALT_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_BFMLAL_zzzw(s, a, true);
-}
+TRANS_FEAT(BFMLALB_zzzw, aa64_sve_bf16, do_BFMLAL_zzzw, a, false)
+TRANS_FEAT(BFMLALT_zzzw, aa64_sve_bf16, do_BFMLAL_zzzw, a, true)
 
 static bool do_BFMLAL_zzxw(DisasContext *s, arg_rrxr_esz *a, bool sel)
 {
-    if (!dc_isar_feature(aa64_sve_bf16, s)) {
-        return false;
-    }
     return gen_gvec_fpst_zzzz(s, gen_helper_gvec_bfmlal_idx,
                               a->rd, a->rn, a->rm, a->ra,
                               (a->index << 1) | sel, FPST_FPCR);
 }
 
-static bool trans_BFMLALB_zzxw(DisasContext *s, arg_rrxr_esz *a)
-{
-    return do_BFMLAL_zzxw(s, a, false);
-}
-
-static bool trans_BFMLALT_zzxw(DisasContext *s, arg_rrxr_esz *a)
-{
-    return do_BFMLAL_zzxw(s, a, true);
-}
+TRANS_FEAT(BFMLALB_zzxw, aa64_sve_bf16, do_BFMLAL_zzxw, a, false)
+TRANS_FEAT(BFMLALT_zzxw, aa64_sve_bf16, do_BFMLAL_zzxw, a, true)
-- 
2.34.1


