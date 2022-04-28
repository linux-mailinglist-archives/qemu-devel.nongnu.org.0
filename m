Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 841F75137F1
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:16:46 +0200 (CEST)
Received: from localhost ([::1]:40510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5sr-0006Bu-La
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K2-0005dD-KQ
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:48 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:41652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jy-0006TK-H3
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:46 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 u9-20020a05600c00c900b00393e729e655so3194974wmm.0
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=RSvbg9lzmkgK8LV+z2YK8viBCyRR08JOpFwVOfj1TWs=;
 b=UJwsOO1w0KUwvvCnD7YFjAJYXIiUS15WnYhlLLnR+PUyBpNtO4zoWFH2syMFTmFb81
 XgsDAKR1SdBUgayoRYxMmcCJ9KWjRpLl2fiyBoNQNmQrYPj1d5dC1ug0SIlA82m9aK3y
 or/ILumIT/t46YvHGPYOeJEG5gV3vwgfq6+6KmQQuW3u8cOz7ageM9nkNsj3ZtkJXJGf
 EIDyuDnwD+RElbdcH/GnuBd5Tv0iROu4+fgk02bvsJZd9mA0cQ7AJgc7F6Z97sbYXUAW
 t76PsskATbbparHMWDaQh2o8dn446lY/1otGbQXRJzcoEsQxlT+pVadigs5I8wtdkpgZ
 G6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RSvbg9lzmkgK8LV+z2YK8viBCyRR08JOpFwVOfj1TWs=;
 b=ytOd48h4g/p9lJARNZ6UXky/NzooayhX7VVcKakrYpFM5IpyMSGINjAkFfRz87auyO
 GxSx9V+6kXOROWdaPAAVNBBuFxRFn0mBNzueM/45TBTkMa658vnwsthuuX/lyRawQQ4j
 IFUk2nAag2QR+2Nvd5zG283RRoCgGwaVY9UGFpEAbB0ywfWieeHGaXo4AjSpu9EZnIPN
 kiYPBF4yfoE7/2dsHlB3uFJOmIglavhYU0hrOPul0I64E6eNNHVem82OUaW2fQ5ATOLv
 l+doNXRfrMetIC/Oq3Jzp3SRJLUOnt+qy9DJV9qBQKtg680BucslhIrgEUPWKiKadcu9
 WDGA==
X-Gm-Message-State: AOAM532s02COPxYlAiiPuWzGkUoG+sPWWoCLsck0LjUNaM/nuOFA1xzW
 vAAKCtmdja/3Kir3XMtClvLwPSBb6CZQLQ==
X-Google-Smtp-Source: ABdhPJxBX/wVReYtHWXc2l7JtubUom7NLDmWYE1ZluA/PD5T/ECGC8slWzrXmMqqmNSgoscRFyRuyw==
X-Received: by 2002:a05:600c:5020:b0:38f:f83b:e773 with SMTP id
 n32-20020a05600c502000b0038ff83be773mr31395813wmr.57.1651156841024; 
 Thu, 28 Apr 2022 07:40:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 42/54] target/arm: Use tcg_constant in LD1, ST1
Date: Thu, 28 Apr 2022 15:39:46 +0100
Message-Id: <20220428143958.2451229-43-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-43-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 727f5cca36f..fcab15a6ecc 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6426,7 +6426,6 @@ static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a)
     gen_helper_gvec_mem_scatter *fn = NULL;
     bool be = s->be_data == MO_BE;
     bool mte = s->mte_active[0];
-    TCGv_i64 imm;
 
     if (a->esz < a->msz || (a->esz == a->msz && !a->u)) {
         return false;
@@ -6448,9 +6447,8 @@ static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a)
     /* Treat LD1_zpiz (zn[x] + imm) the same way as LD1_zprz (rn + zm[x])
      * by loading the immediate into the scalar parameter.
      */
-    imm = tcg_const_i64(a->imm << a->msz);
-    do_mem_zpz(s, a->rd, a->pg, a->rn, 0, imm, a->msz, false, fn);
-    tcg_temp_free_i64(imm);
+    do_mem_zpz(s, a->rd, a->pg, a->rn, 0,
+               tcg_constant_i64(a->imm << a->msz), a->msz, false, fn);
     return true;
 }
 
@@ -6609,7 +6607,6 @@ static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
     gen_helper_gvec_mem_scatter *fn = NULL;
     bool be = s->be_data == MO_BE;
     bool mte = s->mte_active[0];
-    TCGv_i64 imm;
 
     if (a->esz < a->msz) {
         return false;
@@ -6631,9 +6628,8 @@ static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
     /* Treat ST1_zpiz (zn[x] + imm) the same way as ST1_zprz (rn + zm[x])
      * by loading the immediate into the scalar parameter.
      */
-    imm = tcg_const_i64(a->imm << a->msz);
-    do_mem_zpz(s, a->rd, a->pg, a->rn, 0, imm, a->msz, true, fn);
-    tcg_temp_free_i64(imm);
+    do_mem_zpz(s, a->rd, a->pg, a->rn, 0,
+               tcg_constant_i64(a->imm << a->msz), a->msz, true, fn);
     return true;
 }
 
-- 
2.25.1


