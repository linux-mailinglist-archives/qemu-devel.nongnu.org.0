Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4A753676D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:21:33 +0200 (CEST)
Received: from localhost ([::1]:43932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufWe-0002jt-B5
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec9-0003RP-VO
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:09 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:34713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueby-0004Ku-NF
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:06 -0400
Received: by mail-pg1-x531.google.com with SMTP id g184so4605453pgc.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q8eVOO27T1eTVvhBhOHT3ScJ5qcCv6qSE3AQ8VJ4hjQ=;
 b=uL3a4GTiR7RPmhvtXksuRo7IgmHhWnzr9ewbOXbVhB8ceKW96d/o/bRS/uX1tP58K0
 llhmBW1uo2lvO+aighhe+V6nRWgJ5OC45E9pPHVE4VGBzkPkOj3XdCINXn5Qkha4h6uU
 5Qodg1NMNdQ8dvz8Fn8dPeSJcdxar9B0HaBhH47M1t0eMaLeaTvlzaQH1lFHvlwnLdI/
 SMYKFAEfGdkFwTTwX3QUdqR3KGbUz1Wz2YkC15d72DGa6HSsktXQvDXWtud4TUMBkj6h
 VVK7i0qD0g4UdG4tiL5SYLNb3vSQz0Vcu+ebNghIdlAJoC9XvsQb8wZiA57HOXlOyfrA
 HaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q8eVOO27T1eTVvhBhOHT3ScJ5qcCv6qSE3AQ8VJ4hjQ=;
 b=4fBygVZ8Ah72C6rBPj6JArwYHqxZGlR5r3op5ieEC5FZDslYNdXlh/0FFe5gEDZTvN
 K6BTst7RX5ropWwvk9abxeg7hGC8QMH/ClpgJIXsiuXodmE65vIL+yc/Q641VjprPhDe
 x3oGRYEOQbDtDwwheOO/mjHoBqSub+Iqx4tJOxwRxWD+aJylBHmUjpKsbzI/J/Q61bYO
 8P9EcShcgm1iRYjolZhnYi/pBi+wLfAFjWBx1EGaUaUNdg2uM/QJWJxGq94dbC41iMnp
 /tzt08IT71loHjNcfIAOw6OYCgQGK6m5X7k91Z0r2DnbfnTd/JqGTYX0p1UbIbWzl7NN
 Kegg==
X-Gm-Message-State: AOAM5313aX4ogx0l65Hs0wz29gqGZJJjNAOZ7QaB1GHb/YsbDiLF2P97
 MCiCmBO7IWNKpxZUgYOKtLsviEqf5av7cA==
X-Google-Smtp-Source: ABdhPJzvj2bJejISQDBHBTIfunKiQlNCFs46f1VS7iNOkrcTbs0Jxs/nrpSCb96sgjaBzFJAMbumQw==
X-Received: by 2002:a05:6a00:1307:b0:50d:b02e:11df with SMTP id
 j7-20020a056a00130700b0050db02e11dfmr45290631pfu.4.1653675769960; 
 Fri, 27 May 2022 11:22:49 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:22:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 044/114] target/arm: Use TRANS_FEAT for do_shift_imm
Date: Fri, 27 May 2022 11:17:57 -0700
Message-Id: <20220527181907.189259-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6103bd7f1d..f15e9a30b3 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1054,20 +1054,9 @@ static bool do_shift_imm(DisasContext *s, arg_rri_esz *a, bool asr,
     return true;
 }
 
-static bool trans_ASR_zzi(DisasContext *s, arg_rri_esz *a)
-{
-    return do_shift_imm(s, a, true, tcg_gen_gvec_sari);
-}
-
-static bool trans_LSR_zzi(DisasContext *s, arg_rri_esz *a)
-{
-    return do_shift_imm(s, a, false, tcg_gen_gvec_shri);
-}
-
-static bool trans_LSL_zzi(DisasContext *s, arg_rri_esz *a)
-{
-    return do_shift_imm(s, a, false, tcg_gen_gvec_shli);
-}
+TRANS_FEAT(ASR_zzi, aa64_sve, do_shift_imm, a, true, tcg_gen_gvec_sari)
+TRANS_FEAT(LSR_zzi, aa64_sve, do_shift_imm, a, false, tcg_gen_gvec_shri)
+TRANS_FEAT(LSL_zzi, aa64_sve, do_shift_imm, a, false, tcg_gen_gvec_shli)
 
 #define DO_ZZW(NAME, name) \
     static gen_helper_gvec_3 * const name##_zzw_fns[4] = {                \
-- 
2.34.1


