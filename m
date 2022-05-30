Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3E25386E0
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:43:56 +0200 (CEST)
Received: from localhost ([::1]:55558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjQo-0008PV-FK
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwf-0004Cj-MB
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:41 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwd-0007MD-Bm
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:41 -0400
Received: by mail-wr1-x434.google.com with SMTP id q21so4089541wra.2
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=nOBen4gxaB/GNQ5+tb7fMVQd27qw+i1GIkH6L4Gx19A=;
 b=zXPjHzpQNUk3Nvj6lY2UlyMjh3ldipKdyR/VVDjQSZAkyuQh4F4PmJxfJovdqWRw/N
 KCtqrwbJ+R9f/chQ8HBiM8ed03qKn92WJ75Fe16JAn9Qq1frJkC01LOtXA7LSG6jQ+Y3
 1VqABL+IonY4g75HEyVdKyP5EcZ2Uoou5wmCv4YpL+Ga3/tlM6kimiDSBWqZ3yM1uP8J
 ASDuexz0iiYnaGRFgG+FJnDos72IUPA77PW8CDHe71ogkwL6ZSvXKC9oQ9IQ0UNBik8r
 vVSqpmcHTPgMSu74jFQqmVeELiMTMVAIG9u8zYbQjKFbS3dXAb0zMZR/tN19WkuNw6Z4
 Z8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nOBen4gxaB/GNQ5+tb7fMVQd27qw+i1GIkH6L4Gx19A=;
 b=rd3Eu3ZFKQPnP/4eAnnQDzFouR8ianPZMOtlX08XG7MndGjEwQiHyOMGqJrrNBZXAe
 sIN6itHcVAQQ+8FwYGAZU98jtNOFUUvnRy8pufYaxywe2KjsZIyb5oVGINPKtyEpktF/
 8TGf2fWQa/t3gKSeNUs7FllL7C00LzCnPV+j+/BYf6SDKCk+/Yo5Fsbja2fogy53YapR
 ks3Fxo5GpufT/hCKmIqOnZJwtz87fS5oEP8Otpa8FF/7ayBNJ0KTud1Zuit9vsQ8HQ0p
 1ZespGncz+RbMGXx2sXGxjdHtfWv9/QZLWFvfKi1V01G2d9hjTYlQ0oU9usenVo62c3r
 wu4g==
X-Gm-Message-State: AOAM531HW0qcgakXOhkA10pH0mMzudbJfmPyc3MLgeGI9amxGEEBqRr2
 gKcQf/rCjYz0TwldHs7EU8YqRO2ECgUpsA==
X-Google-Smtp-Source: ABdhPJz84OtNCpqFHush7PCppIc3n2ux8Kb8n7AaMChRyOFDyD1tdErQNu9PNftsLKkr+PsFXB3L+g==
X-Received: by 2002:adf:e0c3:0:b0:20c:5672:9577 with SMTP id
 m3-20020adfe0c3000000b0020c56729577mr45683145wri.466.1653926918497; 
 Mon, 30 May 2022 09:08:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 099/117] target/arm: Use TRANS_FEAT for FLOGB
Date: Mon, 30 May 2022 17:06:50 +0100
Message-Id: <20220530160708.726466-100-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Message-id: 20220527181907.189259-97-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 552a551fef3..2f96f52293d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7280,29 +7280,12 @@ TRANS_FEAT(FCVTX_ds, aa64_sve2, do_frint_mode, a,
 TRANS_FEAT(FCVTXNT_ds, aa64_sve2, do_frint_mode, a,
            float_round_to_odd, gen_helper_sve2_fcvtnt_ds)
 
-static bool trans_FLOGB(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_3_ptr * const fns[] = {
-        NULL,               gen_helper_flogb_h,
-        gen_helper_flogb_s, gen_helper_flogb_d
-    };
-
-    if (!dc_isar_feature(aa64_sve2, s) || fns[a->esz] == NULL) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        TCGv_ptr status =
-            fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-        unsigned vsz = vec_full_reg_size(s);
-
-        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           pred_full_reg_offset(s, a->pg),
-                           status, vsz, vsz, 0, fns[a->esz]);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
-}
+static gen_helper_gvec_3_ptr * const flogb_fns[] = {
+    NULL,               gen_helper_flogb_h,
+    gen_helper_flogb_s, gen_helper_flogb_d
+};
+TRANS_FEAT(FLOGB, aa64_sve2, gen_gvec_fpst_arg_zpz, flogb_fns[a->esz],
+           a, 0, a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
 static bool do_FMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sub, bool sel)
 {
-- 
2.25.1


