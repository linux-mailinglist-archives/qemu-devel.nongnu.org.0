Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633403F88CF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:26:19 +0200 (CEST)
Received: from localhost ([::1]:47682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFOc-0005Kv-D2
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGI-0005nO-Ao
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:45 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGC-00051a-Fy
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:40 -0400
Received: by mail-wr1-x429.google.com with SMTP id h13so5065253wrp.1
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DvhXlYYlfomJDUJCbAefggwT30WTKJdIb0Q3AVXh8mM=;
 b=uV7gnocg7QyoQ0SZEor8AWM3Qdw+JYPG2LcEXM/w3vp2ZUwg4Jmf374e57dbU7EFCr
 E53k3yNqo1qhUTMsLbuCIiasAnjjMfX1piRBL9+0h60A/OIOEmM2vEwsK40gbujyM0lH
 rQwJiZmNG1I2zz6ZJZYHwVUMZ6WYqhhTD+BgYrzrhdxo6WJJLiz5Qgcf3NQuzldGB12X
 sGNnROf0iLv6XPIxyEKl6vSlK2ElFKSgY7pSPf+re4go36Eo5rTZj30g3M+N2f83Ishg
 oDqkKCCRBZmdHdEF7hWn3j6ioMFSDg27aZxGQxffMx+Cnv5gTTZ7Irkd7rtvrOO3AVnN
 smwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DvhXlYYlfomJDUJCbAefggwT30WTKJdIb0Q3AVXh8mM=;
 b=K/7hZtLlyK/IObFdRtXaChewRxGCLpAwzQlCC6QmrQG3JLFJzPlRnXysdZBPDN5HVz
 s9CAHrm0txk/2J2XsPjZLiTRfM7ZK9X+ASiI2lUKkPmNMRc3rIhCrdg1lG3du71Isw+V
 Ug88tBtuDjsuduo8mIUNXeYCWkApR80cXmiTPSqx6gRaV2nr8pw1hRof5z+Lp3tFdqjj
 b5vePEj45PBMKpzzh+nq9qbr10T2zgdSjCTFtL5wF3Vrt767G8OuZcDpf2ONu6fH/TG/
 aikDPvzk1o7fhK1LT+u5l4YOff6I8XT0z9M5p0/yes2/z3zxN/jhJoG1Y4MzUFnWpMIx
 1C5A==
X-Gm-Message-State: AOAM532wGZjHVqz2omqG7B5Z4LxNpKrAIf0wR9RNtGSeYKU+NT7sPmHm
 i9bSHhkHCSFr7tNjTgAHY/YXwA==
X-Google-Smtp-Source: ABdhPJyArABX/7DWyhsQOI2w0W1grkTMzPOdXFCIw5G3dDUMiHXv8qU4k+YB1g1lAyaJVBrHoQzC9A==
X-Received: by 2002:adf:ec8b:: with SMTP id z11mr3986340wrn.122.1629983854977; 
 Thu, 26 Aug 2021 06:17:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i17sm1341908wrc.38.2021.08.26.06.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:17:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 09/18] softfloat: Remove assertion preventing silencing of
 NaN in default-NaN mode
Date: Thu, 26 Aug 2021 14:17:16 +0100
Message-Id: <20210826131725.22449-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826131725.22449-1-peter.maydell@linaro.org>
References: <20210826131725.22449-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


