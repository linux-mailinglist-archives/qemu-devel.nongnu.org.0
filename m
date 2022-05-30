Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F164A5386D1
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:36:14 +0200 (CEST)
Received: from localhost ([::1]:44606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjJO-0000jp-34
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwU-0003xW-Mh
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:31 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:32840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwS-0007Lc-0p
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:30 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 o29-20020a05600c511d00b00397697f172dso202732wms.0
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8FfE1VcOazzOS1uCYip/LEQfgsBGZ40XQqaUaIsLZxc=;
 b=uvv8rk8GsFkj74jheJF2qRGd905awQUghdRF4j6NaJzSdMHYlLI4LYTm0OPma0x/0p
 BMyEwNdzoQghxNIhjEPmPOCnnmQZYNGtZN/Vo/44J++2sInkkmw6m4eCsIP2D37mFUaY
 roPqtmqhfw/NQWSUKrmJIa5A7+FfQDO6k0X2msZoOHZO/NDSxpp0sgIgsiIGdTSZTn2G
 f9NtQ6P8NsW5dBQsWLod4VpvRVFbwgphA8YyCOZ9HRNZATcja8omDoogERpQ9T9C61F6
 V9+P0XLIN3HQoh0D/engyHetbSCSH0KrrifF/l1qI6zQZBkMhS3chqpQ590/YMa0+Yc5
 /C6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8FfE1VcOazzOS1uCYip/LEQfgsBGZ40XQqaUaIsLZxc=;
 b=rBTM6bWAv7C+zrj1Nu8YlBli1zI3D2+1cVpeKwF9b6HLXJ7oDX6MxwUC0JmEtcFVuv
 KeO0jvnRjpEiCwGWdzWjnYL4XbFV4H/kkhlHfWAuuaSgroo2RYhxGh9bGFycw3o6WTlr
 xJZVuuMqEkJOU5NbNoH17qTscUwxCr9qJRoIiu5k/zHKb4lAYKZZuy+9GR+2yPcp04+F
 sS4HwYBOVgRjRip8NmX7SDuh0pSJy5Jl8wuYpCvL0uaQSecEPFhVbi/LiSFLK8HWEB0q
 6oz4pp7SYznART8nUn1yD9Taqf4fzP50W+BvfjFp52PD+Ey5loa3vSBv7skASecCyTEe
 8cyg==
X-Gm-Message-State: AOAM531xYyDonC7ggJbHdq3CuhR3xgIXisG/oR6Ao5pxGnbBwcdlCjMD
 iLtWjcU8HbnP5avKiDVcL1gi9qrpPaithA==
X-Google-Smtp-Source: ABdhPJzrOBtewK2O8+U3A9+FWs3RtTXlilIFihXCpYJ9iaXxcomF7nM4ZKuQ14AeEqLO1f39tm1E9g==
X-Received: by 2002:a05:600c:20c6:b0:397:408f:effb with SMTP id
 y6-20020a05600c20c600b00397408feffbmr19795845wmm.1.1653926907190; 
 Mon, 30 May 2022 09:08:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 084/117] target/arm: Use TRANS_FEAT for SEL_zpzz
Date: Mon, 30 May 2022 17:06:35 +0100
Message-Id: <20220530160708.726466-85-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Message-id: 20220527181907.189259-82-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b6b5980e2db..a040d694eab 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -795,10 +795,7 @@ static gen_helper_gvec_4 * const udiv_fns[4] = {
 };
 TRANS_FEAT(UDIV_zpzz, aa64_sve, gen_gvec_ool_arg_zpzz, udiv_fns[a->esz], a, 0)
 
-static bool trans_SEL_zpzz(DisasContext *s, arg_rprr_esz *a)
-{
-    return do_sel_z(s, a->rd, a->rn, a->rm, a->pg, a->esz);
-}
+TRANS_FEAT(SEL_zpzz, aa64_sve, do_sel_z, a->rd, a->rn, a->rm, a->pg, a->esz)
 
 /*
  *** SVE Integer Arithmetic - Unary Predicated Group
-- 
2.25.1


