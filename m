Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AB64F97D6
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:18:32 +0200 (CEST)
Received: from localhost ([::1]:41048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpRX-0002K2-N4
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpP9-0006ia-Hg
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:04 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:38693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpP6-0002EO-Mh
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:03 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 r206-20020a1c44d7000000b0038ccb70e239so116688wma.3
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nWU/XAW1dTVCsMubCYBZ/twfuj48VjZonfG2m35ljcs=;
 b=AiFsdbvxZalYIWUBWmsVBmx4bqOzpcGd0CzWmVo7CKRHVQHyDnm4aeFndBGRLsPVLm
 H5ojcFxl+tIlqse/I4rxLtcqPjwYNPSpAD6XX3xJoaXx0unegPUUSYYDJ80F2GTazRSs
 V+g0YVnjRej4tQ/pjDoo8FZIlFhhk4TMTQYWlgTsfFKHyCFy2TA5qz3L16hTcQaznB8A
 mJhRCtDYfO8DFM0bflDxOrshiDuwhZqXLMgjtW27PtrNwIX/G+t5btQmaGUqg0efIN1B
 cazonjUu0PgNZrbo8QV/tMuuPosIlMJ5NZH4g9U+gu1nn8vFeVJWqcIXS43Jn3TXqJyN
 ajwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nWU/XAW1dTVCsMubCYBZ/twfuj48VjZonfG2m35ljcs=;
 b=pkhO6p+4gOhIvV08I7VN7sX+OqgYK8t4k40JzKxH5k7ZsmhDs1jA5y2H7UwPlwiwwR
 lk3Iju4HNCE2mvA8oEtPeefNbkqORzAxhTEuKwa9yYdq9ZPalj+kfdm0rQEBgI1pRBr3
 zGdnrfyBbQByYVEB/oE1+erUaqRBOO38KAEjazu5yhyDtc9XbCD74lIX04lfpC3osFg+
 qVxUkbgB1HkI1wCvHPP5CNJ0G75+A9D1PdPi7j3+vcp8XxFTPSuMdUlXpz+9PgLGbUvQ
 zV3dcD7QHIWxHjoHVQmlo1h4JuxbvfpB8x7DT+iV11hqP2bcs84Exkp8hkH7Zr7xxFEY
 gKmQ==
X-Gm-Message-State: AOAM531iSFPm4LDKb2dwfFLZX1BcjnmLCGS4Ivzt1V9dyp349Got3cRd
 6v0k3wZIJvUXG9TUO8NJdwogLg==
X-Google-Smtp-Source: ABdhPJwUbRzJpOwLzMj/BBQQnpUL6KYFUo98XyP1zZvRT1RcLWUombEOi/o6eXjYEn/nj0JVpBvXYA==
X-Received: by 2002:a7b:cb85:0:b0:38e:979a:3b94 with SMTP id
 m5-20020a7bcb85000000b0038e979a3b94mr7074845wmi.19.1649427357387; 
 Fri, 08 Apr 2022 07:15:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:15:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/41] hw/intc/arm_gicv3: Insist that redist region capacity
 matches CPU count
Date: Fri,  8 Apr 2022 15:15:12 +0100
Message-Id: <20220408141550.1271295-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Boards using the GICv3 need to configure it with both the total
number of CPUs and also the sizes of all the memory regions which
contain redistributors (one redistributor per CPU).  At the moment
the GICv3 checks that the number of CPUs specified is not too many to
fit in the defined redistributor regions, but in fact the code
assumes that the two match exactly.  For instance when we set the
GICR_TYPER.Last bit on the final redistributor in each region, we
assume that we don't need to consider the possibility of a region
being only half full of redistributors or even completely empty.  We
also assume in gicv3_redist_read() and gicv3_redist_write() that we
can calculate the CPU index from the offset within the MemoryRegion
and that this will always be in range.

Fortunately all the board code sets the redistributor region sizes to
exactly match the CPU count, so this isn't a visible bug.  We could
in theory make the GIC code handle non-full redistributor regions, or
have it automatically reduce the provided region sizes to match the
CPU count, but the simplest thing is just to strengthen the error
check and insist that the CPU count and redistributor region size
settings match exactly, since all the board code does that anyway.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 90204be25b6..c797c82786b 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -354,9 +354,9 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < s->nb_redist_regions; i++) {
         rdist_capacity += s->redist_region_count[i];
     }
-    if (rdist_capacity < s->num_cpu) {
+    if (rdist_capacity != s->num_cpu) {
         error_setg(errp, "Capacity of the redist regions(%d) "
-                   "is less than number of vcpus(%d)",
+                   "does not match the number of vcpus(%d)",
                    rdist_capacity, s->num_cpu);
         return;
     }
-- 
2.25.1


