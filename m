Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A973DA1F2
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:18:22 +0200 (CEST)
Received: from localhost ([::1]:51274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m943R-0003ey-Qe
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940a-0008SQ-EY
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:24 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:44552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940U-0000vR-Im
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:22 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 d131-20020a1c1d890000b02902516717f562so3766473wmd.3
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GGF4FybEKy96gYcYMu+JcP8KcGdVIAGNRtBK4g3nQ2Y=;
 b=CDDI2YZ3ES72TH9b5xS0B5e8W9Cg1RLQ98gNketTfJN72pYLOY/giiTD+xjj2kQnG6
 d3r/u1uQJRmY0HbVH0iIGLTt2mfXsa1aIeUUSTQ2Ub17R2Cgr/i71CQYIRK5I0SK2kXN
 YMhzkUujolcy8/uaLcpl3YxA2vkghvHqX9JVfYXQ7MRp/Un5Rq0R6IuBR/V0Z8Yr5gpN
 mYGEZL7W7Er9zHDMjXpNMyf8ADZapEfiCpwuIrXTR5did2uP4s8pL2vhauU64OqHVgXS
 zZldVBvs0mOiRcAXzNhirIIWK+jh4QEa65jS49e3PUg/zNvGjJSKlhcvDucbSD6lXMIr
 q23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GGF4FybEKy96gYcYMu+JcP8KcGdVIAGNRtBK4g3nQ2Y=;
 b=uXYFA1pOQ7LfGSb5npTKK+aPeEJeoTMX6Ku0FPBTJ5EeHUnKsjJmPPMJtX7OyCD+Yl
 MDakN793V55HHg9NQgTTgVGJu2qWSiVJl+cCvpTfOnSmMP6txtTe0yo0VF+xlGFsEwyv
 1Rg1RIE6iTZ6UGnge6kaIqNC0v/ig6xxpqP2N6BYz1ZGA3atD5JQAnR/YUDMooszebBW
 8pWbikEhx/CBf04W49XkaplIGyB3KVSVPSOZr2CV4FsayfKMmVCrNA3DLt7RlJTpZenG
 r29vbelqge39JJ4hScReHaDf6KiuB+qTQ/tJLhvkphIZoL5mElVhf2Wyx+vXycSbvOCR
 jPtA==
X-Gm-Message-State: AOAM533eoB8GmrOmoXz7IN/rdN7LFdf+RriTGQxfzb4ECqSMPWMii/S0
 bndUSatfPKAczpV8fptw7+a0MA==
X-Google-Smtp-Source: ABdhPJxua5/SAwlyDsfJZxaG65MFP2B14TaoJug1kIBchCfdBBn/ywYZU5mziOrqXnLbxD5SKq403w==
X-Received: by 2002:a05:600c:4c96:: with SMTP id
 g22mr13543761wmp.70.1627557317253; 
 Thu, 29 Jul 2021 04:15:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 03/53] target/arm: Fix MVE VSLI by 0 and VSRI by <dt>
Date: Thu, 29 Jul 2021 12:14:22 +0100
Message-Id: <20210729111512.16541-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

In the MVE shift-and-insert insns, we special case VSLI by 0
and VSRI by <dt>. VSRI by <dt> means "don't update the destination",
which is what we've implemented. However VSLI by 0 is "set
destination to the input", so we don't want to use the same
special-casing that we do for VSRI by <dt>.

Since the generic logic gives the right answer for a shift
by 0, just use that.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mve_helper.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index db5d6220854..f14fa914b68 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1279,11 +1279,12 @@ DO_2SHIFT_S(vrshli_s, DO_VRSHLS)
         uint16_t mask;                                                  \
         uint64_t shiftmask;                                             \
         unsigned e;                                                     \
-        if (shift == 0 || shift == ESIZE * 8) {                         \
+        if (shift == ESIZE * 8) {                                       \
             /*                                                          \
-             * Only VSLI can shift by 0; only VSRI can shift by <dt>.   \
-             * The generic logic would give the right answer for 0 but  \
-             * fails for <dt>.                                          \
+             * Only VSRI can shift by <dt>; it should mean "don't       \
+             * update the destination". The generic logic can't handle  \
+             * this because it would try to shift by an out-of-range    \
+             * amount, so special case it here.                         \
              */                                                         \
             goto done;                                                  \
         }                                                               \
-- 
2.20.1


