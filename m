Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3701D3DA1FE
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:21:04 +0200 (CEST)
Received: from localhost ([::1]:60918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9462-0001g6-UU
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940j-0000Pv-UA
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:37 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940a-000113-67
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:31 -0400
Received: by mail-wr1-x433.google.com with SMTP id b7so6454517wri.8
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lutAo5Z1ewFuThzfMPVLqlhd9Ml/H60A8yYUE67fuT0=;
 b=S4g7euqEWzT7bP4rdD2sYvFbBbwSftKuNMyQE+CZ1s+ARt7R9TS3+C6p/2rOJT2HJg
 fEYHxyHOEqppsnGzSzfi6kwZ+0tSKYqQdnQPRfA+0ITUNmrRQmLfmKLAzRSgF3FnaPJf
 rKhPjpt6l+TA72FhplyEOLwY1x8abyO0hdMG1jNnSWFuvIuUgsuNj6rWphl71XXmJnrV
 CSX+UBH6SwsI2o1Oog/UqklRbIHVd28P/8v6MPRqZsNn+F3SZ8mgNx4/k0f7C9BZzEQJ
 RSlZJOFqtShsAJuSXlp3146YPX2up/EAjLeV6fF9/Pg07V8v44hRn+v5Bo882sMevKaw
 dXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lutAo5Z1ewFuThzfMPVLqlhd9Ml/H60A8yYUE67fuT0=;
 b=g8mf7njnT41GCC8zqwe4yciHUEMbMA3Z7Y1ye3ZM1418z5MFH+YJU4522fhq5zTh9W
 KAitZzRLug5KFJ6aICL3Z+CqmLB9GD5FmvWWZ07w+5YeQPP9Y/1ICnFKS6D7zlKqun1K
 2F71v0vkmX3OZ3mpplsaF6cVMe9MhR+0wDKULF7tCE7jf4oZwRXnAKGEkw53tsmsWnD+
 yjkXFcHVmGB3P4ZxoldLQa0TxvySRoIW4LgVlFAHp4vrxQiBApBfa8OAXXnuUCJEWY8B
 AVqnVZuvqLrTvSjcGcPKKBcjnMjST8mXM/ym1xhCrs/FdBlI1OXJ0lAMFDf5o+xxb4AA
 vOeg==
X-Gm-Message-State: AOAM531pG+Kqz2XpZXi2ajOqRoPoL9qi5PKdnLM0jByKyybgkQLSZMMR
 NlqYpfPLLBldUb0LpmFoCh4uLsbS+jRTKQ==
X-Google-Smtp-Source: ABdhPJzk77pGfWEVLyH1Tqx247JuOFLjPe6wUnNFyhlz6FKsK9xMzbAEy5x6Vep7yRIGLWhNebxy+w==
X-Received: by 2002:adf:e10c:: with SMTP id t12mr4264501wrz.36.1627557321312; 
 Thu, 29 Jul 2021 04:15:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 08/53] target/arm: Fix calculation of LTP mask when LR
 is 0
Date: Thu, 29 Jul 2021 12:14:27 +0100
Message-Id: <20210729111512.16541-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

In mve_element_mask(), we calculate a mask for tail predication which
should have a number of 1 bits based on the value of LR.  However,
our MAKE_64BIT_MASK() macro has undefined behaviour when passed a
zero length.  Special case this to give the all-zeroes mask we
require.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 1a4b2ef8075..bc67b86e700 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -64,7 +64,8 @@ static uint16_t mve_element_mask(CPUARMState *env)
          */
         int masklen = env->regs[14] << env->v7m.ltpsize;
         assert(masklen <= 16);
-        mask &= MAKE_64BIT_MASK(0, masklen);
+        uint16_t ltpmask = masklen ? MAKE_64BIT_MASK(0, masklen) : 0;
+        mask &= ltpmask;
     }
 
     if ((env->condexec_bits & 0xf) == 0) {
-- 
2.20.1


