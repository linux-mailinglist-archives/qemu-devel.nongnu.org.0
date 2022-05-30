Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FE1538676
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:58:47 +0200 (CEST)
Received: from localhost ([::1]:35258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvij8-0002b2-7u
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvk-0003MB-Iy
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:44 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:33972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvf-0007Ha-Kq
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:44 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 d5-20020a05600c34c500b0039776acee62so186885wmq.1
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/rDIgsE7rTUWcnLfgoxn3YYJ/pGQAuzcGv/WQmbeVtY=;
 b=ioCLUyrHfeFGLopwk2Z0wCxZLUxMlLlVqSkElBTCgzzVwQSo7UBuPhRw4zQpNGgiaJ
 OsmWyMcReDo/kH4X6OTO2XuzR+3lzF4YCvFyK4BQ2GiTByDHSwMxOHel9zfMpCuEWj3d
 qnJ7ZygWpaMaQkCEXVHFreGw/Rt6UpO8El7jCFVcj79b8hyQ3r1Bs8iLiFDdfoE4MQbU
 brZq8KiWX7lFHjRyz8gI+XPMsD9b1cIYh+CrfwTF4qnrH0vHQCHI+usNw7/pQsWfK6mJ
 7H9W4DegtL7mN+v6o2R5T6R1QK+KMlezu+y4jQuHNg2fepQ462cCEKXn18KZZuQiuQtN
 ApHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/rDIgsE7rTUWcnLfgoxn3YYJ/pGQAuzcGv/WQmbeVtY=;
 b=uyrNFEzpqpoEChVCrHkqYtxSZy23haGbFVmO8V92hfetRMOAPxBHnL9uPGlEamNLxo
 Xx3heAamAtOmvX4pPAsr18APdfy/z8tM3gnFlE7CrQ3rWUxwmP9gRMZUhTgXekkvDZXp
 t8+EzJvM9d1w8JT7FfzVD0jDDGioncXKs545qYScH5+Ey2uRqjt9Alvzo0lmYD/MVfAO
 mOYrapfpytYaZ3eSAekEVnWtB6blDgq3b9wepmb3T9Inka/m1nAzDN/LP4UWzEvGWNWx
 vn644w7wbL4vSCHwz4bLLxr24+I3w2Z/yJKCpmaBbmKC9gf17ZDvO8wbR3FB9qHr+jqS
 m+nA==
X-Gm-Message-State: AOAM532LDTGafFOs02tik3GR8L+TQMv0gBwvUhpD4GfHAe6K+1zdN/5V
 AZtNetT0UvlMf/SapfVUuoyX4l1GZl0G3w==
X-Google-Smtp-Source: ABdhPJzKoopP6TNNcuDtfEi3fMS1kzpWfDUtI6VdPG1dyxFIliNiLVPxUwVbZ/6JnfNgbtp52tJAeg==
X-Received: by 2002:a05:600c:268a:b0:397:48d4:f6ad with SMTP id
 10-20020a05600c268a00b0039748d4f6admr20222568wmt.134.1653926858208; 
 Mon, 30 May 2022 09:07:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 035/117] target/arm: More use of gen_gvec_fn_arg_zzz
Date: Mon, 30 May 2022 17:05:46 +0100
Message-Id: <20220530160708.726466-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Two uses of gen_gvec_fn_zzz can pass on arg_rrr_esz instead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-33-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 1b3afcc24cf..2dbf2961283 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6425,7 +6425,7 @@ static bool trans_MUL_zzz(DisasContext *s, arg_rrr_esz *a)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return gen_gvec_fn_zzz(s, tcg_gen_gvec_mul, a->esz, a->rd, a->rn, a->rm);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_mul, a);
 }
 
 static gen_helper_gvec_3 * const smulh_zzz_fns[4] = {
@@ -6946,7 +6946,7 @@ static bool do_sve2_fn_zzz(DisasContext *s, arg_rrr_esz *a, GVecGen3Fn *fn)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return gen_gvec_fn_zzz(s, fn, a->esz, a->rd, a->rn, a->rm);
+    return gen_gvec_fn_arg_zzz(s, fn, a);
 }
 
 static bool trans_SABA(DisasContext *s, arg_rrr_esz *a)
-- 
2.25.1


