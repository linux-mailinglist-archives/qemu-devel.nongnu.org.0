Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F846F8ACD
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:25:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vB-0000cT-85; Fri, 05 May 2023 17:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2v8-0000aU-FT
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:54 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2v6-0004Nd-24
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:54 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3063891d61aso2161440f8f.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321889; x=1685913889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kq84wZCoWT9GZQmQJJ9plEHUAG17CGw73/IKgsrL81c=;
 b=yqf5s2/5Ctg/k8vcsCVocDjvzCPevSPPITah508l8bZMA6Ypn4bqQrCMZMjgyntug6
 NP7BbMELp7Toej3XNb4fhkv1drXpbD8dbMYcTa+9Clf8/RujNBcErG8fRmVf5zTkS49U
 qUN2jtJldgyb7/appwQ/DOBQvmjBbFRnu2Nl/UEBYv392+inBFvTWlAqpy/lYBmq80WM
 Er9nIMBpT1SCSbZMIFtLiczfvt8dR8bDPBykpTbRsmapeYOCcZflknBVgiJTeeHS9/KZ
 QGie9a+hGNSe09tx2VFYu8N35v4xfntiBLcopG7N5LdsZH9fNWAZINx/gODqla8KUSuI
 MunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321889; x=1685913889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kq84wZCoWT9GZQmQJJ9plEHUAG17CGw73/IKgsrL81c=;
 b=gfY/I7Jsyq5NEqLbNHlWOq+4arJakx8mhc8GI3uDykN1PLmsEFqIgML47k6P2p+8/S
 rZQXRPF6FMGat6WusfTSXpQXSLuFcZOXLqzDll587K8PNOfZLzbNiRDWtBQ65QIxiilM
 x1mKfj13ICdcXkJg8L+dotyG8YN9dyHnoN8tUc9Sr/fFDi0EiiMkR7UDbI344HC4RnKC
 g3iNZSprEFT0SX/O0Tn+3XjL+vrJSnKXmozlzE0svvSF2Knjd6mVgVxHIzOrHQZIMFIm
 8CRddto0nhpwXUQKElKnYicTLEjxXeiifD2fxOsgWR4Xh+tdEWvCNxuOsqh21vn93LIF
 Gseg==
X-Gm-Message-State: AC+VfDzHDfFQFy9IZspAchisDbOJpmPKIsHgy6o8y366jKl7ASfntvKX
 6R2YxhfME1hiuV8ZS+HouQ8yhgSPHwBHh0TzCIvgow==
X-Google-Smtp-Source: ACHHUZ4NLwbl6JXkbVK6XeFQxM+mv+TmnvsVR7eF2ieg1VmFfuALKxOMw+Hlk57f2B5TZzofQivcDw==
X-Received: by 2002:a5d:67c7:0:b0:306:2fd3:2edb with SMTP id
 n7-20020a5d67c7000000b003062fd32edbmr2027178wrw.61.1683321889486; 
 Fri, 05 May 2023 14:24:49 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:24:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Shivaprasad G Bhat <sbhat@linux.ibm.com>, qemu-stable@nongnu.org,
 Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: [PULL 01/42] softfloat: Fix the incorrect computation in float32_exp2
Date: Fri,  5 May 2023 22:24:06 +0100
Message-Id: <20230505212447.374546-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Shivaprasad G Bhat <sbhat@linux.ibm.com>

The float32_exp2 function is computing wrong exponent of 2.

For example, with the following set of values {0.1, 2.0, 2.0, -1.0},
the expected output would be {1.071773, 4.000000, 4.000000, 0.500000}.
Instead, the function is computing {1.119102, 3.382044, 3.382044, -0.191022}

Looking at the code, the float32_exp2() attempts to do this

                  2     3     4     5           n
  x        x     x     x     x     x           x
 e  = 1 + --- + --- + --- + --- + --- + ... + --- + ...
           1!    2!    3!    4!    5!          n!

But because of the typo it ends up doing

  x        x     x     x     x     x           x
 e  = 1 + --- + --- + --- + --- + --- + ... + --- + ...
           1!    2!    3!    4!    5!          n!

This is because instead of the xnp which holds the numerator, parts_muladd
is using the xp which is just 'x'.  Commit '572c4d862ff2' refactored this
function, and mistakenly used xp instead of xnp.

Cc: qemu-stable@nongnu.org
Fixes: 572c4d862ff2 "softfloat: Convert float32_exp2 to FloatParts"
Partially-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1623
Reported-By: Luca Barbato (https://gitlab.com/lu-zero)
Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
Message-Id: <168304110865.537992.13059030916325018670.stgit@localhost.localdomain>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index c7454c3eb1..108f9cb224 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -5135,7 +5135,7 @@ float32 float32_exp2(float32 a, float_status *status)
     float64_unpack_canonical(&rp, float64_one, status);
     for (i = 0 ; i < 15 ; i++) {
         float64_unpack_canonical(&tp, float32_exp2_coefficients[i], status);
-        rp = *parts_muladd(&tp, &xp, &rp, 0, status);
+        rp = *parts_muladd(&tp, &xnp, &rp, 0, status);
         xnp = *parts_mul(&xnp, &xp, status);
     }
 
-- 
2.34.1


