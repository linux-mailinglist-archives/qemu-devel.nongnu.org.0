Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC2F3DA26A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:46:52 +0200 (CEST)
Received: from localhost ([::1]:51212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94V1-0002LG-GG
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941X-0001LQ-UY
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:24 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:56222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9415-0001Q8-P5
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:23 -0400
Received: by mail-wm1-x335.google.com with SMTP id n21so3461557wmq.5
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hZoXvoCnZRqFIIUh7VxjDF986CnTtjaaiZusPA7tfs8=;
 b=nhY4KIem0tqLbQDewOxpT0Dfez4pSsZezW2AiLxC+Vq3qioL6SFWbatt0U7Fm7NWsM
 IfuuA9km/36oEnWte8nsvQBN4Lrb3ZRS0fs2iLlGCtwCboYpmNGEAdyR73OEIyKPE6ex
 rPj2grxFJ4vx+S/HHAE5fWXrFVub49ObQBXY3rj7PW+BnJwbheNm6V7mA1PY//wxhs2l
 XVQ/yZiBDLcYw41upOzomBePpHu19789b9en6i8+Uc3r7iSlgGGRG89kAarSsiY8Rgnq
 3NRX1o/NDh3PlEtFGvERQjPgkR2rvucI7ri3cfiyHaKO6vX9KESp1SiZnTm3KzwXHOZC
 LTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hZoXvoCnZRqFIIUh7VxjDF986CnTtjaaiZusPA7tfs8=;
 b=leKBdVpeg4QEk/PjHHOY/ho7Cd5kVcDWFuWf7UJDjT4mbgzA3MwrpkuL0eQegHPDWo
 /2rt0ULGwWow60Ix2Hgp8DlZSIXY4YB3Hd8MHxd8Migry45ocEBsdL6HF1olrMX7gmJK
 N1PCA+1vHQpgvuvei0uQTE6NmGFMFOYalDPlCGrK/znAJFZXvGpOYO49RPY2gMw/khJI
 uDbnKyqfGs5S+KtrQHeJQH8wZBCxcOXx2p0VA2Z4pGsnwEDp9Hop/aUKU8g3C+Mclv1H
 OApNrznxkmFDDvCOAP4u/hs3ZQWhZcYEdlYCHrRGGK88W5Eoe5v7fkQSWM3egHZLtX0v
 LQiA==
X-Gm-Message-State: AOAM530Bq1HlIUsIeGmUI2G+yWFBUSSBT3BkOVrFCbzIA8Re6AcbYyoL
 kD1zxrQGBRPmi2mEaRsb8dYK2MGc1eDbcQ==
X-Google-Smtp-Source: ABdhPJwjEl1n+Ox2a+Et4xUGg61ebc7mMTUvUlWWCXx8SB+rZ6dTOwIFNkbmPJVqzOydlDRvQ4fLag==
X-Received: by 2002:a7b:c255:: with SMTP id b21mr4296737wmj.100.1627557351563; 
 Thu, 29 Jul 2021 04:15:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 44/53] softfloat: Remove assertion preventing
 silencing of NaN in default-NaN mode
Date: Thu, 29 Jul 2021 12:15:03 +0100
Message-Id: <20210729111512.16541-45-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

In commit a777d6033447a we added an assertion to parts_silence_nan() that
prohibits calling float*_silence_nan() when in default-NaN mode.
This ties together a property of the output ("do we generate a default
NaN when the result is a NaN?") with an operation on an input ("silence
this input NaN").

It's true that most of the time when in default-NaN mode you won't
need to silence an input NaN, because you can just produce the
default NaN as the result instead.  But some functions like
float*_maxnum() are defined to be able to work with quiet NaNs, so
silencing an input SNaN is still reasonable.  In particular, the
upcoming implementation of MVE VMAXNMV would fall over this assertion
if we didn't delete it.

Delete the assertion.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 fpu/softfloat-specialize.c.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 12467bb9bba..f2ad0f335e6 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -198,7 +198,6 @@ static void parts128_default_nan(FloatParts128 *p, float_status *status)
 static uint64_t parts_silence_nan_frac(uint64_t frac, float_status *status)
 {
     g_assert(!no_signaling_nans(status));
-    g_assert(!status->default_nan_mode);
 
     /* The only snan_bit_is_one target without default_nan_mode is HPPA. */
     if (snan_bit_is_one(status)) {
-- 
2.20.1


