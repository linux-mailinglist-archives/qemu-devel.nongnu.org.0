Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD383D73DE
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 12:58:06 +0200 (CEST)
Received: from localhost ([::1]:35372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Kmj-0005Hn-Dr
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 06:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8KdB-0001tc-JL
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:13 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Kd9-0004wL-TZ
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:13 -0400
Received: by mail-wr1-x432.google.com with SMTP id n12so11095602wrr.2
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 03:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iUbjtNnRqrk7535NLiLOddt55EKxFB+7vT/kNGnsiqE=;
 b=DvSWTo6mocLSSb6Emt9JY2EnbkMh+qK2bAOliZCyIXQkEK/hY95Bk1moYZY+7lSbkt
 +/OUWZLk8CjDS1Ow4dgCXL866XpQ1H7dds53erl4I6KjRQXEYQU4tgl3Meui4+Ehd5wv
 Tx8SAwPdnSsslh880Wd5mWfBHyHcljj2k7PPyT8VfOiQE5MwAJUB18IvJ33OR38lCIG3
 Ssxm6CjHPVD+E3sWzQHEkcmqcq8MNmscxp0GkDZN/t/+NksLBgByubXprJkt8F7TBqLa
 Wa9c9za4YsVt3i1B60sT1WemSoWU6xT7rrMncudl5EEfmvLDrdKAc+ryucBBLt6UNBh/
 +n2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iUbjtNnRqrk7535NLiLOddt55EKxFB+7vT/kNGnsiqE=;
 b=DQaXBmRs4wKuidZ0uiD7L9L19m1Rl+dhHj4/vOiuWYBAt0bVMrVEQtOSkVikIMLzOs
 uIJ9T447/GaxAdAWHASLsRSAhe2t74ioKEdALfWdCh0fg8My0OGmFvXUZxg464TcqXq3
 MTMKO42DDAS5PyxIPND5WM2H+wdTRb1R9HMAi/eqQ+g+mWOReY5E7vGyAs6K0d8Z3ghs
 i88NSxRv8Ay9mvsyo5hCBnAX1caf2JaysUNWuKB7R/7kp/d3aV+th04k/14PjEZAn9EH
 w18sR0aiWKeXyqbI96wsJP1A7cxETKYAQIZRjzF3i6dqchhuoa1I8e+9wyDsfQBDtmlD
 mNkw==
X-Gm-Message-State: AOAM533Ks5rHcbVBIJrPpZDJqh2LBOdzw1D2EexMCPlaq9VNMl2yCqXV
 hylHVci3g6xyba0tPo5f8Q14hHMLn1rjuQ==
X-Google-Smtp-Source: ABdhPJzDFqJnMcmNeKcZ3vA0NpbgQVL29jQMr3uxlSa5DYv05y5bs5AWwzFho5XB//tH0q8RaAfMLg==
X-Received: by 2002:adf:dfcb:: with SMTP id q11mr18707675wrn.16.1627382890575; 
 Tue, 27 Jul 2021 03:48:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm2413598wmi.33.2021.07.27.03.48.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 03:48:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/14] target/arm: Correctly bound length in
 sve_zcr_get_valid_len
Date: Tue, 27 Jul 2021 11:47:57 +0100
Message-Id: <20210727104801.29728-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210727104801.29728-1-peter.maydell@linaro.org>
References: <20210727104801.29728-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

Currently, our only caller is sve_zcr_len_for_el, which has
already masked the length extracted from ZCR_ELx, so the
masking done here is a nop.  But we will shortly have uses
from other locations, where the length will be unmasked.

Saturate the length to ARM_MAX_VQ instead of truncating to
the low 4 bits.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210723203344.968563-2-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0c07ca98376..8c1d8dbce36 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6461,7 +6461,9 @@ static uint32_t sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
 {
     uint32_t end_len;
 
-    end_len = start_len &= 0xf;
+    start_len = MIN(start_len, ARM_MAX_VQ - 1);
+    end_len = start_len;
+
     if (!test_bit(start_len, cpu->sve_vq_map)) {
         end_len = find_last_bit(cpu->sve_vq_map, start_len);
         assert(end_len < start_len);
-- 
2.20.1


