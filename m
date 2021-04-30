Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F23DA36F8F4
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:10:28 +0200 (CEST)
Received: from localhost ([::1]:58856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcR2S-0003jD-10
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUY-0007zb-TK
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:26 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUH-0001QG-Ve
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:26 -0400
Received: by mail-wr1-x436.google.com with SMTP id a4so70023180wrr.2
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=l5ZhQNfFgRjC4VV5SPAD8p8zlfBLoisPfhThQKIBK/g=;
 b=ix/STAkg6e0PqMYVDFNMjvGOtuWymQBuinatoRTovzAI13Rjxy/NNBVAOYv4HAERdE
 7ViGaZSTp3kkttlBvg0GsRll//6lKyssbyMfObVYGNgg7cPvqFOdAvWqeCBZlj5ceVBD
 Fgtqey3WWjr4SIfdrQl5pv/jhQCszHu4awMFpdtpF48GcxvZel5Be6CNhcMAzEizBm1k
 8jeZkY8X4dM2GQfnYVb/DjjJSIM6dnYjQz9NBg7UXOumuHCKZL1MFGZKEWQFrWKmk7li
 CcO2T72B3Fj2WBgyg8tgoJiGedrRvLEXWJ6kBVkGsu07I8XtiXSAd5434i3bm2mTDeFv
 kn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l5ZhQNfFgRjC4VV5SPAD8p8zlfBLoisPfhThQKIBK/g=;
 b=uAmmlrksRymMmt+2Zhc2OhwLNz57uSK8zq1rurIG9t9QU4iRcInhZ3mPt9f1Wdq32c
 XpTNbWjn5SFuXlG6VJ9EBz1idBHWVU+GIXNbYqY5/+WD6c4dQHSPRZhC2k4sdZyhuXLP
 Te+rvI/TR6di91US2Acn+x0fNDtYgJ//Nc9HOXE8YgAiXOmeA+dstzoRBE8J3YJCla2z
 1qLilufpN70hiCvcDUlIpKGQ6toyJip8urHqyBvyQogiyB3tj7U/bPv2N7F6VZ3Z+FF5
 5Pquu7xScvgNNd5JhG0UJNlX0KjRzhsCXF2uc9loG9SUbqM0cziC89Eq2WvqCfvfAWzZ
 RGPg==
X-Gm-Message-State: AOAM533c/TFf12JRC0Hasiqr3T/iXsGuMr1dl6AOXOB2dGFrrdW0DEau
 2riqGNpuNrGAPtN+5T2p6xPYqqPZr5UKgLBd
X-Google-Smtp-Source: ABdhPJwzwcPLZHAqug/l3ycXZr8aIQfodHIULPAiPF5jwhgbJXa/AmRJ0DMgfwOY258wPq5wJgnojw==
X-Received: by 2002:a5d:49c2:: with SMTP id t2mr5907814wrs.64.1619778908721;
 Fri, 30 Apr 2021 03:35:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.35.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:35:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 41/43] target/arm: Enforce alignment for sve LD1R
Date: Fri, 30 Apr 2021 11:34:35 +0100
Message-Id: <20210430103437.4140-42-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210419202257.161730-32-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 584c4d047c8..864ed669c44 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5001,7 +5001,7 @@ static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
     clean_addr = gen_mte_check1(s, temp, false, true, msz);
 
     tcg_gen_qemu_ld_i64(temp, clean_addr, get_mem_index(s),
-                        s->be_data | dtype_mop[a->dtype]);
+                        finalize_memop(s, dtype_mop[a->dtype]));
 
     /* Broadcast to *all* elements.  */
     tcg_gen_gvec_dup_i64(esz, vec_full_reg_offset(s, a->rd),
-- 
2.20.1


