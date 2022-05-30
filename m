Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B8B538671
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:56:04 +0200 (CEST)
Received: from localhost ([::1]:57394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvigV-0006mu-PY
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvl-0003Pe-Pr
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:45 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvj-0007By-Mo
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:45 -0400
Received: by mail-wr1-x42f.google.com with SMTP id e2so15315033wrc.1
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=r5qhhsn0mn03eMfaTsnMqO5VRQUM6D3Dyd4VEozedA8=;
 b=Yi2uUxwy9UrQNKP/Gcbnq1MAmUKXlQlPxbmU2IMT60bzNM+NXcXO4q8YP1t1ac6XGz
 oDM/NOhZGMhcHHSIw020SylhoU0Le9vI+DqqhKo9DfxkPBdchym5m15c8/Z171UqZX+C
 tzTKxgCpUIPVqCvClpVbab/AMvLa37D9Ly/o3TC6/03Y335lYsEIbae3to8pT3neGsjk
 Nv5WyeINGgiK4UaRrVqBiSSHNFB4so2b0aEvknqqR5T39eJ2ScyBBhdZa/gYUtAg2OtE
 bEIOt6S4wBIsfvCmlXyDSotK8k7Mb/kQbhnWq5Dmg8VNXJpYSpZIvV6bJLZWH3XfZgwY
 /fTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r5qhhsn0mn03eMfaTsnMqO5VRQUM6D3Dyd4VEozedA8=;
 b=6MS86CGUnLhInaWjX651PhqGLf794Axei78N3TFX+pvh8Uk0iPamAMDVBEnPOrzbW7
 Pqs28MYqWSNHY8sKVGORgb2Tza1nRhn5mOKnCiVvwx2/x8Uyv7YyoCEEFRHay6LOtD4O
 hFbcmo/3BtVmeVw8ySG6iJFER6YDa9mbZm6rGb6oAepcwRXt1mBmoHONZgB5Je/j8xv+
 Y0dSO2thlkZbWvzvSzFppF+hEm4Ao0cm3BlZnUrcEDrJPiT3OIIwJf/v6B+Xx7nQc/Kp
 WWNX7t0g6fSTFmRBnWoH22EN3+O/E8vLK5LWFUle+wuD66xg2YVna8dbD8HcynzQgsaX
 i/UA==
X-Gm-Message-State: AOAM531Cjw16TjZjXA38IfweXdKHs44ShsW8ChfJj4vqVZSb4Mpoaqc4
 pklChOLaVCjZ2Z3G6FR1c845VUGTaiMwog==
X-Google-Smtp-Source: ABdhPJwbI6Kq3WfGQVy6w7PASaggC+6tNh0RpQZEXNSyDD7VkLgdnKp0792B4KRBMbOq9L/c8KjFtw==
X-Received: by 2002:a5d:4302:0:b0:210:824:48ee with SMTP id
 h2-20020a5d4302000000b00210082448eemr18896425wrq.471.1653926860552; 
 Mon, 30 May 2022 09:07:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 038/117] target/arm: Use TRANS_FEAT for RAX1
Date: Mon, 30 May 2022 17:05:49 +0100
Message-Id: <20220530160708.726466-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

The decode for RAX1 sets esz to MO_8, because that's what
we use by default for "no esz present".  We changed that
to MO_64 during translation because it is more logical for
the operation.  However, the esz argument to gen_gvec_rax1
is unused and forces MO_64 within that function, so there
is no need to do it here as well.

Simplify to use gen_gvec_fn_arg_zzz and TRANS_FEAT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-36-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e92fef23041..36d739d7b2c 100644
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
2.25.1


