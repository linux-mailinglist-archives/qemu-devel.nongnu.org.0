Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB435386BE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:25:47 +0200 (CEST)
Received: from localhost ([::1]:47342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvj9H-00089d-2Q
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwf-0004CH-9n
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:41 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwc-0007NQ-Kl
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:40 -0400
Received: by mail-wr1-x432.google.com with SMTP id h5so7199563wrb.0
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1FqwuUF6xMql33Kd+JvaXWCNaAvSVoqLBakEwazAero=;
 b=ym2uXKl/OiShvQWsq8MYRTukheTuWaO2AcJH9mezsouejyFfrLHaodeZX2oo41/OVk
 ++/jN57BShT9GRzOIRx/DozUTGflhUT04MUSfFWE+CLfa0e/XDMLaIQd9b5NodutaK5s
 WLWjssL887m3DT2gKjGIFD23UKX7nnLLyRftc0q+rjOJ8A2crS6rjP93yC/U2wL7o9tH
 IChXvF/tMz10bWa0mF0ioaRyTXw3xLfTO6AtxdSJJRr7CyducES5S72w6oHBbyXXeMnL
 hfEaDg+0wcnoiYz9YK10F74K3O/wazC2NZ5NaqHQ0IxUbt4w1lqfNFFck5exyVM4DTsR
 1bVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1FqwuUF6xMql33Kd+JvaXWCNaAvSVoqLBakEwazAero=;
 b=byC/RnIX82KASYNeCSm5loro1NIqjBQDB9O7AyJzTYwlDyVIOz2sk5ZoanOeVSVkYv
 STkBu2BjZzV/sUG9/7iGB29Bo6kohuvJ4XT75q/qj6lQMxwFJ5bmL7o/q+ygipoqhwrt
 V/bR0mU5uUiivaqgpHrxR8uRl0wPILu1az4a9XjNuxEETQC25kaQ0JNdPvo1M86U+h9M
 pIcXnALsHps0MWGOXhfqiC4fR7kUna5Cu8I0FKK75dhgikXE6WcOz9dQWlZemG+lf0lo
 p9sE7FBJaGtoTThwbtuTt9qp8vblcLJ+JtpXtHvanq2Iz55a9+5RPyVaK/YWDq3VZfud
 wiKQ==
X-Gm-Message-State: AOAM531AI+IfqedCzgugnADStokWmuCRayuAK8T5bU6W8atFr8CZOInq
 RdhtXpkFA/pQ04vn1B+rkjKhWP5ybz3HsQ==
X-Google-Smtp-Source: ABdhPJzp9zNS8ALevdU8GBzWmLEEHyHoB03prZF3nO20l4z1dlYSmYP8dCJp54Mp+a3V8y11sixYsg==
X-Received: by 2002:adf:fc01:0:b0:20c:ff9a:2c53 with SMTP id
 i1-20020adffc01000000b0020cff9a2c53mr45899449wrr.142.1653926917738; 
 Mon, 30 May 2022 09:08:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 098/117] target/arm: Use TRANS_FEAT for do_frint_mode
Date: Mon, 30 May 2022 17:06:49 +0100
Message-Id: <20220530160708.726466-99-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Message-id: 20220527181907.189259-96-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 53 ++++++++++----------------------------
 1 file changed, 14 insertions(+), 39 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 43cfd2818ea..552a551fef3 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4168,30 +4168,16 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
     return true;
 }
 
-static bool trans_FRINTN(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_frint_mode(s, a, float_round_nearest_even, frint_fns[a->esz]);
-}
-
-static bool trans_FRINTP(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_frint_mode(s, a, float_round_up, frint_fns[a->esz]);
-}
-
-static bool trans_FRINTM(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_frint_mode(s, a, float_round_down, frint_fns[a->esz]);
-}
-
-static bool trans_FRINTZ(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_frint_mode(s, a, float_round_to_zero, frint_fns[a->esz]);
-}
-
-static bool trans_FRINTA(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_frint_mode(s, a, float_round_ties_away, frint_fns[a->esz]);
-}
+TRANS_FEAT(FRINTN, aa64_sve, do_frint_mode, a,
+           float_round_nearest_even, frint_fns[a->esz])
+TRANS_FEAT(FRINTP, aa64_sve, do_frint_mode, a,
+           float_round_up, frint_fns[a->esz])
+TRANS_FEAT(FRINTM, aa64_sve, do_frint_mode, a,
+           float_round_down, frint_fns[a->esz])
+TRANS_FEAT(FRINTZ, aa64_sve, do_frint_mode, a,
+           float_round_to_zero, frint_fns[a->esz])
+TRANS_FEAT(FRINTA, aa64_sve, do_frint_mode, a,
+           float_round_ties_away, frint_fns[a->esz])
 
 static gen_helper_gvec_3_ptr * const frecpx_fns[] = {
     NULL,                    gen_helper_sve_frecpx_h,
@@ -7289,21 +7275,10 @@ TRANS_FEAT(FCVTLT_hs, aa64_sve2, gen_gvec_fpst_arg_zpz,
 TRANS_FEAT(FCVTLT_sd, aa64_sve2, gen_gvec_fpst_arg_zpz,
            gen_helper_sve2_fcvtlt_sd, a, 0, FPST_FPCR)
 
-static bool trans_FCVTX_ds(DisasContext *s, arg_rpr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return do_frint_mode(s, a, float_round_to_odd, gen_helper_sve_fcvt_ds);
-}
-
-static bool trans_FCVTXNT_ds(DisasContext *s, arg_rpr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return do_frint_mode(s, a, float_round_to_odd, gen_helper_sve2_fcvtnt_ds);
-}
+TRANS_FEAT(FCVTX_ds, aa64_sve2, do_frint_mode, a,
+           float_round_to_odd, gen_helper_sve_fcvt_ds)
+TRANS_FEAT(FCVTXNT_ds, aa64_sve2, do_frint_mode, a,
+           float_round_to_odd, gen_helper_sve2_fcvtnt_ds)
 
 static bool trans_FLOGB(DisasContext *s, arg_rpr_esz *a)
 {
-- 
2.25.1


