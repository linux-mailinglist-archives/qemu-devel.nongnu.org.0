Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D177C5138AE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:41:10 +0200 (CEST)
Received: from localhost ([::1]:43662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk6GT-0005Yy-Vf
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K3-0005dG-A7
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:48 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K1-0006TQ-0D
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:46 -0400
Received: by mail-wr1-x42a.google.com with SMTP id x18so7136901wrc.0
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CmRCgp9iP8k0YY+hOKKvzJ+UHw7n1gKJq5VZyEBUNmc=;
 b=FcL8jRszyoA69tIXHMBcQcgUW94Pqmqv5leqp2jLw7aMHD6WCyS/2CiC/8uUKq9xH+
 kgl+HVupK5HFPWgEA3pMuF+yt9i0t3BybYWDHoppLrxSrujFaKvxH9SAq6Aa6Spv2CEO
 Ex+JHAuffNthFMJJdprf4Ez+yS9SKfc6KHVdfUubg2j1X4ENqDFQCPqWOZXue2vIL0YH
 RUMA09SyUIwhWJfd6i2mAqB3AmXb+0VPg2nYT1YqmApwTUe82UjyrUH9HQ6y07AQCz7a
 LDfEIQOKEDdhm1rS+wQjQIwXonwb9E4s/+ULVLiIJF2F17g66ZhI/DlgsOml1UTBJ7e9
 xemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CmRCgp9iP8k0YY+hOKKvzJ+UHw7n1gKJq5VZyEBUNmc=;
 b=10pGlJjVAtSm2ZdsHlivnlPDsYEHnXZym0qabXwfp17ldG3iY6D0H1pp0hu7YV02fh
 h5TSlaMeylTsGpjD4QQ3/KBvRJH35LshWeMhg73IsMB22NMB152NvLfUr9geGIkFNvS9
 KAF/af56ourD9iL/igzQmZFZaO7obC6okDax4yN5onCyj7xT0iesmaQCPajletAumZCj
 8mCVA3FiNubl/RpQw5N2YZwpRGsegmxF0s3QozG36XCg212NHAoeF27gL2GN48lUrSO5
 0wwpTwTT7W5EV9GTy1DXmOLoCQN4d1kAZXrY/8pbBYCRnNO3iERQKAocLSO9GEVT7LJJ
 jiug==
X-Gm-Message-State: AOAM532HLnzLlBOsPZwWZneD2bJyEL013E0QG5HuMi6ZnZqwxfojrmLp
 34BSpG2QMJDcRYvYthiNJnfMHwN7yAJ2vA==
X-Google-Smtp-Source: ABdhPJw8iAi7Vi8OpGobHPLdXqjhwp5H7IekTyiqvcddOMk76jl7x+sQSiWGjhREQMonMIF7SPdz+g==
X-Received: by 2002:adf:eb11:0:b0:20a:edc7:6f89 with SMTP id
 s17-20020adfeb11000000b0020aedc76f89mr7603794wrn.662.1651156841749; 
 Thu, 28 Apr 2022 07:40:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 43/54] target/arm: Use tcg_constant in SUBR
Date: Thu, 28 Apr 2022 15:39:47 +0100
Message-Id: <20220428143958.2451229-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Message-id: 20220426163043.100432-44-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index fcab15a6ecc..92339a19e33 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3830,11 +3830,9 @@ static bool trans_SUBR_zzi(DisasContext *s, arg_rri_esz *a)
     }
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
-        TCGv_i64 c = tcg_const_i64(a->imm);
         tcg_gen_gvec_2s(vec_full_reg_offset(s, a->rd),
                         vec_full_reg_offset(s, a->rn),
-                        vsz, vsz, c, &op[a->esz]);
-        tcg_temp_free_i64(c);
+                        vsz, vsz, tcg_constant_i64(a->imm), &op[a->esz]);
     }
     return true;
 }
-- 
2.25.1


