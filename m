Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0F355BA1F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 15:48:51 +0200 (CEST)
Received: from localhost ([::1]:33942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5p6g-0006t9-UJ
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 09:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5p4M-00048P-HN
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 09:46:26 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:35727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5p4K-0004Rw-Kg
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 09:46:26 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l2-20020a05600c4f0200b0039c55c50482so7580456wmq.0
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 06:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=14MEsEjQiz9IfzX6JeiSVtQX16foo13qJMvs/LfidH4=;
 b=QIyBX7wHvxhqHt0CuA3FbRCsu+Hz8sh6RgiWfaHDfYOkYruJ9Rk+ZNYc6ie5h5/ELc
 71qoiSd39x5VlO0WGOgF6L0flm4Dz3veTnwXKtd8Mysc5DN6pqndGrhGWK4nUeoHMsu2
 QWb9gRbz3Zt+pLJjusdWq5s8zrQLSU+CnCoXaJZ7dVqwcq8ibeSlqkA7A0xOno4KkViQ
 KOmSAxesFmKq50/E8gZaqE6LiIRRS5o946A7fQ2WtJIXiN2x/c1QEltNyfwo5iLNhAsq
 fEZH23yivPa/g/ThjQ8a5BsVEhTHp15fSHyguROVCHBY3C6ACeXKNoymXFsqrK1SZWGD
 Q81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=14MEsEjQiz9IfzX6JeiSVtQX16foo13qJMvs/LfidH4=;
 b=VWU/spJiIS9seF8ob/O04E5rJ/B5ifK28/xRiayBv/X34a9yYxA8apltgx+82C5PE+
 IcbbrInSP+dQKrDAhC/NrrsYh2q2mB2OvIpDhAkJLapY3mhZAUBC05qQFIx2zg/ttsU0
 b4pomQFXxW/y40ChLGBqmh3+qa5KsnZxn8ob2LCBvrrGR1kdEcocIIUfuMi1YNaV1M+Z
 2FAieKT4VBu0llbWASUJVQOYWIKX33iO32iFBkreydmlPxZWozg3mWqwrHXDd0kKcP0q
 M7sy+uDLZOBNcUQT0CDJTit9UWKRNdqopusOPhRBruQHfxhZ6aupfXzFaKZqhTVe5nsG
 tUWg==
X-Gm-Message-State: AJIora+Cs0Pb+3yCpDrR1xiblIaFpFmwzKLedG2BVvMXdPKMYiSe6s2w
 2UMtvkLc1o64IWr5ZJmsQW78DQ==
X-Google-Smtp-Source: AGRyM1uk+pQ1ncgMBPaOVEVDXtDDi2sss2NNFMin4zjO+WctSIZOyrEMiwHciTpevZKNxtZIOXVeeg==
X-Received: by 2002:a05:600c:190b:b0:39c:7704:74a4 with SMTP id
 j11-20020a05600c190b00b0039c770474a4mr15387727wmq.92.1656337582786; 
 Mon, 27 Jun 2022 06:46:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a056000100300b0021b943a50b3sm10736528wrx.85.2022.06.27.06.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 06:46:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 He Zhe <zhe.he@windriver.com>
Subject: [PATCH] target/arm: Fix qemu-system-arm handling of LPAE block
 descriptors for highmem
Date: Mon, 27 Jun 2022 14:46:20 +0100
Message-Id: <20220627134620.3190252-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

In commit 39a1fd25287f5d we fixed a bug in the handling of LPAE block
descriptors where we weren't correctly zeroing out some RES0 bits.
However this fix has a bug because the calculation of the mask is
done at the wrong width: in
  descaddr &= ~(page_size - 1);
page_size is a target_ulong, so in the 'qemu-system-arm' binary it is
only 32 bits, and the effect is that we always zero out the top 32
bits of the calculated address.  Fix the calculation by forcing the
mask to be calculated with the same type as descaddr.

This only affects 32-bit CPUs which support LPAE (e.g. cortex-a15)
when used on board models which put RAM or devices above the 4GB
mark and when the 'qemu-system-arm' executable is being used.
It was also masked in 7.0 by the main bug reported in
https://gitlab.com/qemu-project/qemu/-/issues/1078 where the
virt board incorrectly does not enable 'highmem' for 32-bit CPUs.

The workaround is to use 'qemu-system-aarch64' with the same
command line.

Reported-by: He Zhe <zhe.he@windriver.com>
Fixes: 39a1fd25287f5de
("target/arm: Fix handling of LPAE block descriptors")
Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index da478104f05..e71fc1f4293 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1257,7 +1257,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
          * clear the lower bits here before ORing in the low vaddr bits.
          */
         page_size = (1ULL << ((stride * (4 - level)) + 3));
-        descaddr &= ~(page_size - 1);
+        descaddr &= ~(hwaddr)(page_size - 1);
         descaddr |= (address & (page_size - 1));
         /* Extract attributes from the descriptor */
         attrs = extract64(descriptor, 2, 10)
-- 
2.25.1


