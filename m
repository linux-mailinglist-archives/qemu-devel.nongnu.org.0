Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8873F4C1F20
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:52:06 +0100 (CET)
Received: from localhost ([::1]:52286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN0UP-000766-Js
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:52:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0B7-0007BX-MI
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:32:11 -0500
Received: from [2607:f8b0:4864:20::431] (port=35512
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0B3-0001HK-6D
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:32:08 -0500
Received: by mail-pf1-x431.google.com with SMTP id l19so217576pfu.2
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 14:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WFTKQrLiJ3VwSgvkt/IhaEgBVQ3+b8tLX7nUBsUG9rM=;
 b=nWPSZzl1BCWj/NZFxKS0xZWxznh190caDQn90GNbYNatDKrYpUUZ3tmS4mTitmHWkE
 AG+o+jKuOmr+O5p96aQWAW/3vlYCRsjsKjWmZ2kmvc0pRcoYv7pCjgHd1KhAdetf3Q7C
 oYeiOyArEHmyEbapSM+Jtla6f6/ghxgR2NE9rmRe5OUCXR2dQGv2jPpV+XT0Qrx+Z6ct
 n2qXuKa/nBKsuxKLtNdh9jfKGIjNmdSnVoDO4GFck3++1YGDmXyS2bTTlkhRy2NpH3RO
 dCzBZ/FEzAtY7R2DqizVc6YUjHvd5ns/BsTwCc9gZIFZiFi7caXsjbG42OfotEjcrU48
 pl7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WFTKQrLiJ3VwSgvkt/IhaEgBVQ3+b8tLX7nUBsUG9rM=;
 b=S0NQauqCwUEHkI7EHByoy0xi4+mUoEmmUKUYeHu30I7qEav+aB2zK9C3TZb9kAYk76
 7nxQrFJ/g69Y8aCDVqSPNGu4MAwW+B9gCvyuUpshxTYWmqcVKQub/nltKq8YrHPlXdMa
 B/DwjwabGBjZ9xdY2vJkoJZK8FIEkToxzWCo/tA6u+UgXM5s49l7AJHbene87x9161nP
 B1LPQFDxvO3KV/+qKkEdwsEP9HVPkD/GabO3oEZNjL1/HWeDyBY/nJM67tzkHM0DVeNi
 qP0usEeLG2PIypmsj5OSwqlPChW4Oy6d8hsk8kOwDdHZTtlw0Gq4otRFTBCJBH1uweYR
 RcXA==
X-Gm-Message-State: AOAM5319XTEPDMoXytEyDFVqiNDw4PLlVuaRo8hiu8i6yz52hGQ4VGqd
 RHJlbMHSC2zOPyudaDK9JA1da6ruug/vYA==
X-Google-Smtp-Source: ABdhPJzdvp4M0CYcaaD1NMp+5V42ZMV/tr1v7F3yUcuDyunIzXZhdl1kdcx6YZqq7gfB9O5upxPf/w==
X-Received: by 2002:a63:af02:0:b0:375:57f0:8af1 with SMTP id
 w2-20020a63af02000000b0037557f08af1mr1400927pge.188.1645655523076; 
 Wed, 23 Feb 2022 14:32:03 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 14:32:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/17] target/arm: Validate tlbi TG matches translation
 granule in use
Date: Wed, 23 Feb 2022 12:31:34 -1000
Message-Id: <20220223223137.114264-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For FEAT_LPA2, we will need other ARMVAParameters, which themselves
depend on the translation granule in use.  We might as well validate
that the given TG matches; the architecture "does not require that
the instruction invalidates any entries" if this is not true.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e455397fb5..3a7f5cf6f0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4520,12 +4520,16 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
                                      uint64_t value)
 {
     unsigned int page_size_granule, page_shift, num, scale, exponent;
+    /* Extract one bit to represent the va selector in use. */
+    uint64_t select = sextract64(value, 36, 1);
+    ARMVAParameters param = aa64_va_parameters(env, select, mmuidx, true);
     TLBIRange ret = { };
 
     page_size_granule = extract64(value, 46, 2);
 
-    if (page_size_granule == 0) {
-        qemu_log_mask(LOG_GUEST_ERROR, "Invalid page size granule %d\n",
+    /* The granule encoded in value must match the granule in use. */
+    if (page_size_granule != (param.using64k ? 3 : param.using16k ? 2 : 1)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid tlbi page size granule %d\n",
                       page_size_granule);
         return ret;
     }
@@ -4537,7 +4541,7 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
 
     ret.length = (num + 1) << (exponent + page_shift);
 
-    if (regime_has_2_ranges(mmuidx)) {
+    if (param.select) {
         ret.base = sextract64(value, 0, 37);
     } else {
         ret.base = extract64(value, 0, 37);
-- 
2.25.1


