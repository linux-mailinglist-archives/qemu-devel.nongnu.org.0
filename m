Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7CB3906DA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:46:00 +0200 (CEST)
Received: from localhost ([::1]:49752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llaBr-0005cP-Ad
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYfB-0003nb-7d
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:08:09 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYex-0007AC-Lh
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:08:08 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so3852569wmk.1
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ny9TpZ+mxC93RDaUaoiednPrC7PmQA5749ObmmV6eo8=;
 b=drcOa/1kRwABYRQ+Sr0+WSftiJLuX4Zehcm+kUMdhyzk1kjcX1ecICBtvISRVQFRo+
 p8U4qzJ+lYv9ckiUcZBRqJ4O5A1z/XV/V1YqZ8RcgxgUPYxqU8PqaHch0PFR9hoDCcQu
 GHePSrUW5x1D4mTePk5oroL4uaAVYowuSEVPgDLFkno8pFNfI110MEKG4LcuMYbkHOnH
 JW6vyK/6e90ywcmQNQLQjB3UZrf6apFxIgjTFPKP3M2yGRbALF5f4yVgtGwt/1/JRFRZ
 lue/0IKyF3eImWe029kE4HpBS4o3kF0nm5Iv3HgUJU+I+BeGUAlqLVaroMZLK0zRGPrm
 IxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ny9TpZ+mxC93RDaUaoiednPrC7PmQA5749ObmmV6eo8=;
 b=XzMLLshR2WPLaMQvYGe23SjBSMJMM/Uw29DjwUs2FyoWT6AW7zhzg4gmV0ecSjIUcq
 B/53NQLV3QUOu3pHHrhy0dA03JGn0bhB3NaEDU7s3seJjJSgaCvM4Q02ATpCSnCtM7kn
 c1DhoFroM0riwFdJXtEQFHnIb7WVfRvOBI2GZgWh5qBeIs1wGjsDKAgflcmaKUraaEhw
 Ly1Z35sGQsvLb5KgeyEWGSD+vT49RvlPUsf1OmandIStoyKY7YNhVBRDw013R5idfmdm
 MqUbw5xvX96xmjyl6ZZ4DN4e4QhMyJZIdVeosXnVQoz5kS0MSDYlOhtBTZJyghFa7Xm6
 eHSw==
X-Gm-Message-State: AOAM530511wzp+dK3luC88Rf/tnJSDYgtQrrEUzCiRnFivM3lZYsJ5Jn
 FlATRS5xn0hvVRZ3X9GPUr/81VfzXV2pdjVn
X-Google-Smtp-Source: ABdhPJwqpgURQCZik6/z4yBNgE5/ok0jEa8xchWX8iXFiHyqKqAuPKyY2G+6DJ5cQhA70Yj3uPQk+A==
X-Received: by 2002:a1c:7c03:: with SMTP id x3mr4376934wmc.168.1621955274298; 
 Tue, 25 May 2021 08:07:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a11sm16643357wrr.48.2021.05.25.08.07.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 113/114] linux-user/aarch64: Enable hwcap bits for sve2 and
 related extensions
Date: Tue, 25 May 2021 16:07:35 +0100
Message-Id: <20210525150736.32695-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150736.32695-1-peter.maydell@linaro.org>
References: <20210525150736.32695-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Message-id: 20210525010358.152808-92-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/elfload.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 0e832b2649f..1ab97e38e08 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -648,8 +648,18 @@ static uint32_t get_elf_hwcap2(void)
     uint32_t hwcaps = 0;
 
     GET_FEATURE_ID(aa64_dcpodp, ARM_HWCAP2_A64_DCPODP);
+    GET_FEATURE_ID(aa64_sve2, ARM_HWCAP2_A64_SVE2);
+    GET_FEATURE_ID(aa64_sve2_aes, ARM_HWCAP2_A64_SVEAES);
+    GET_FEATURE_ID(aa64_sve2_pmull128, ARM_HWCAP2_A64_SVEPMULL);
+    GET_FEATURE_ID(aa64_sve2_bitperm, ARM_HWCAP2_A64_SVEBITPERM);
+    GET_FEATURE_ID(aa64_sve2_sha3, ARM_HWCAP2_A64_SVESHA3);
+    GET_FEATURE_ID(aa64_sve2_sm4, ARM_HWCAP2_A64_SVESM4);
     GET_FEATURE_ID(aa64_condm_5, ARM_HWCAP2_A64_FLAGM2);
     GET_FEATURE_ID(aa64_frint, ARM_HWCAP2_A64_FRINT);
+    GET_FEATURE_ID(aa64_sve_i8mm, ARM_HWCAP2_A64_SVEI8MM);
+    GET_FEATURE_ID(aa64_sve_f32mm, ARM_HWCAP2_A64_SVEF32MM);
+    GET_FEATURE_ID(aa64_sve_f64mm, ARM_HWCAP2_A64_SVEF64MM);
+    GET_FEATURE_ID(aa64_i8mm, ARM_HWCAP2_A64_I8MM);
     GET_FEATURE_ID(aa64_rndr, ARM_HWCAP2_A64_RNG);
     GET_FEATURE_ID(aa64_bti, ARM_HWCAP2_A64_BTI);
     GET_FEATURE_ID(aa64_mte, ARM_HWCAP2_A64_MTE);
-- 
2.20.1


