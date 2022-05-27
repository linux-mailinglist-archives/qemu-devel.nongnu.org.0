Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 595EF536779
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:27:58 +0200 (CEST)
Received: from localhost ([::1]:58938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufcr-00069f-Cp
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYw-000888-Ls
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:50 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:43529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYt-0003jT-Gn
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:50 -0400
Received: by mail-pl1-x62c.google.com with SMTP id b5so4787459plx.10
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9GzR6SjGne04dpMjKvt4tLmGUCZGiEsDKCfPsqE6Vfw=;
 b=aL7jzVUAxLavkWm0lX19L2yatPqzz1mwh6tKfNZ5Q2cYXVo9Ef4CJi+wd0Mq4DZWUC
 ZkEgEbIHpld9Zy1vhtSuh1M9xJFoyXaaVEMR6A0Mlf9rILGE8fp2iD9liHPH73Yb7S/7
 IZIQmjBNCqScx2mjbms3cqd2/dPC3oMMCGc2BFgCTN/1fa9wQQV0hXMZdeEa/pWRpDgj
 pXgj2CdppVcGSWIZQe3VkP3Q67ROeuR+jwHv90SbSWDbOetRCaBLTzP/lRzXu4upu8Sz
 6XCABu/YLGJV/dka0JE6A+h3ggOV4zgVeZQdq/3Dl0BhAL0AzZO0eSJyjq5xgFriqjaU
 hOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9GzR6SjGne04dpMjKvt4tLmGUCZGiEsDKCfPsqE6Vfw=;
 b=3Ged3jM2Z8yo15/FGdF+PNZtHmPiSQwmvbW4Fzl1UzGSg2PEXLlVJl6F48AHoMSYYz
 5k07eHzrYYGm+1lbzm4c3uwbSIKLEdn3ivD5dXBmPRzAVTcs52eXd99hCemk1a0yGoa/
 8CX49AlUZV3nVs7zDD1j9qg7PMiMOkKaFuiMH1Qx+5bQythqyssZ2PVkdZuEOe/GZflP
 oAP49rYruYhaayCxBoplee7Bal5eyOOlkSmT3xG8Q0p63RtvIFWkfDRl5qsoycWyFBnm
 PfG6oMXl+g+HEWPYbrGYAZ6gCbgDh36HIzISBj5X8gtMaYpnXZCuzrWkdxFOtqdK47Wr
 2k6g==
X-Gm-Message-State: AOAM531srLZWgOqyyq9MYMHX8ANj3wp0v78XrBRH7dVJk/RbG8hpEb0s
 JuwxxOF2raIw18eJBxWQlTQXq6Pqac9i0A==
X-Google-Smtp-Source: ABdhPJy1aUeJOGtO25srSb1Tamh7jwtmG5n6rl6n8SOCvAxCryCAw6v7HPd+dS8X7fh0s7DikrIs8g==
X-Received: by 2002:a17:902:820e:b0:161:b3df:46ea with SMTP id
 x14-20020a170902820e00b00161b3df46eamr43037530pln.13.1653675585169; 
 Fri, 27 May 2022 11:19:45 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 039/114] target/arm: Use TRANS_FEAT for do_zz_dbm
Date: Fri, 27 May 2022 11:17:52 -0700
Message-Id: <20220527181907.189259-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
 target/arm/translate-sve.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7938c5393e..6fa721eca6 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2046,20 +2046,9 @@ static bool do_zz_dbm(DisasContext *s, arg_rr_dbm *a, GVecGen2iFn *gvec_fn)
     return gen_gvec_fn_zzi(s, gvec_fn, MO_64, a->rd, a->rn, imm);
 }
 
-static bool trans_AND_zzi(DisasContext *s, arg_rr_dbm *a)
-{
-    return do_zz_dbm(s, a, tcg_gen_gvec_andi);
-}
-
-static bool trans_ORR_zzi(DisasContext *s, arg_rr_dbm *a)
-{
-    return do_zz_dbm(s, a, tcg_gen_gvec_ori);
-}
-
-static bool trans_EOR_zzi(DisasContext *s, arg_rr_dbm *a)
-{
-    return do_zz_dbm(s, a, tcg_gen_gvec_xori);
-}
+TRANS_FEAT(AND_zzi, aa64_sve, do_zz_dbm, a, tcg_gen_gvec_andi)
+TRANS_FEAT(ORR_zzi, aa64_sve, do_zz_dbm, a, tcg_gen_gvec_ori)
+TRANS_FEAT(EOR_zzi, aa64_sve, do_zz_dbm, a, tcg_gen_gvec_xori)
 
 static bool trans_DUPM(DisasContext *s, arg_DUPM *a)
 {
-- 
2.34.1


