Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F5338B367
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:41:06 +0200 (CEST)
Received: from localhost ([::1]:41190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljknJ-0001wU-AW
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbW-0008Hb-Vb
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:28:55 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:50747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbR-0000hT-Sd
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:28:54 -0400
Received: by mail-wm1-x32c.google.com with SMTP id t206so9468229wmf.0
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 08:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=nycRzRnC22+MMRKklZmpFxoGXgNbpGqBimi8PnwOL/E=;
 b=AaPDH5X8ibid2VkKdGpr8XjN4Mbsf0ECm3KzJ1doR2AIHpYo2t8vDOOm58xtVGln+V
 tpPV05U6xQOTafqiSzzAy1F1rfZsqN7g1/QOCxMHjtKU6RF9tp4by80HlWzHwASYMvDG
 yksU0+6gI5d+zkTxKXXsaHaQcJrqcB8e1NgxRGNdMAWTiIWRC0LSgRzvA2IhvdOSr8jI
 8S1oPwTMDh3zpPUOi888AtjU2Uz99Sn/f2BPySFHZAqTXrOt+JSbiVBNKwWqEPOqGqUM
 PVRlY34/7QNQiOAC60jqe6djMHQQLiGLD5XUV+lNUPEhlcf30Kg6PRBNEs/udtrgpvgH
 eWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nycRzRnC22+MMRKklZmpFxoGXgNbpGqBimi8PnwOL/E=;
 b=BZZtgcPkltsa7Qdr5XbNVTmne9Kqyy+VDuxsFr1lwaVJebcqNKp7WNOkBmd+V1BPib
 iuF6L6iMgoB+4KNpr0Fzb06ACYv6TSll6OZHeM38KQr14k5r2NeY+/9kWLcMspLVsLB9
 sXFaMMfXz8iVdewS6I6S67srkFNWZhNzVHDgnNnQE1Kf7Mtr+/AI5EftIP/ICPqrDxlK
 xddFbe9bVDr+BPooSarNbmtDzRZNdO6l8k4GganjYTPXdzHl2T9VYaXvCwM66nrb8rjN
 XW/DSqU8kYZCHwRrQ1w4O2/GgMIuhE8e3Y8zRaXfJOVgeS4s3tqb/QIRtE/sFudxPI5a
 wJZg==
X-Gm-Message-State: AOAM533qv1TjYN7yhUV6d1Iw0yYmNiYiHozGDdlA/IQ2fES1YoLtRCrR
 vTe1rMRLTLrzFiPXEsP86cOaLZPW4fI8dv6t
X-Google-Smtp-Source: ABdhPJxpja45Ak1JyfOFSbCLhsYLfpdgwbjpClzZrxQNoRZr6Dj7NNeSAbyl9+hY0VAXr3yFt6Gehg==
X-Received: by 2002:a1c:4602:: with SMTP id t2mr4488851wma.173.1621524528475; 
 Thu, 20 May 2021 08:28:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r2sm3916126wrv.39.2021.05.20.08.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 08:28:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 8/9] target/arm: Enable FPSCR.QC bit for MVE
Date: Thu, 20 May 2021 16:28:39 +0100
Message-Id: <20210520152840.24453-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520152840.24453-1-peter.maydell@linaro.org>
References: <20210520152840.24453-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

MVE has an FPSCR.QC bit similar to the A-profile Neon one;
when MVE is implemented make the bit writeable.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vfp_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index e0886ab5a56..11e1e087e81 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -220,7 +220,8 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
                                      FPCR_LTPSIZE_LENGTH);
     }
 
-    if (arm_feature(env, ARM_FEATURE_NEON)) {
+    if (arm_feature(env, ARM_FEATURE_NEON) ||
+        cpu_isar_feature(aa32_mve, cpu)) {
         /*
          * The bit we set within fpscr_q is arbitrary; the register as a
          * whole being zero/non-zero is what counts.
-- 
2.20.1


