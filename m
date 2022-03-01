Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C67B54C9850
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:23:10 +0100 (CET)
Received: from localhost ([::1]:49560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPAth-0000ik-MJ
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:23:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXk-0001Pl-AR
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:28 -0500
Received: from [2607:f8b0:4864:20::436] (port=36661
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXi-00055s-L3
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:27 -0500
Received: by mail-pf1-x436.google.com with SMTP id z16so78132pfh.3
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WFTKQrLiJ3VwSgvkt/IhaEgBVQ3+b8tLX7nUBsUG9rM=;
 b=P9uQd+BdqGTZoNjJTkEoT791LDyZo+Oj0K1NYCqCUgd+0+XDDTII2RZ8AVqLUe0ZRo
 8At3d44SYIuYRD8xuNIUBi6SJeJHz8ndIIZKu3IBPCLn5MLA6oJk0BrlUXyLQggC2UYm
 NEEflUTNywky58oWCAA+XQ+cUjUvexun1gwvaN9xonC7n2A7GUPGBgbFJYMPKWm+blS4
 oc1XOsfbotBpBjNIFhV/Hjb9gH2g/q/tmCBuNnzIpnyQy+3dDp4SXpOuJhMXGDuTJurQ
 ZerktgMKgfG3sy1oAexIdoZwlQNAgAK/o6lJjCOtbB233Ym/PUzHQXTv9W7MAn23xGd/
 3Djg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WFTKQrLiJ3VwSgvkt/IhaEgBVQ3+b8tLX7nUBsUG9rM=;
 b=Epti4JH+2TrfKBmnHmp4WGHmUkgh1/tgQLRv86GQEEhdn3IJNa4D4zhWxsHLX6mudl
 A2CyIeSl9sxJpBqUBqEeDqFn50jqR/nx/mt2pHPemS/UFmPmr/Rh/7woLBBDyEOoNPAL
 jlbO+StMZRm9D/ufDUqdAi59JEpUPyBRBUilErNVKDFdxL62rOQBJq2LQDwJTA0qP4fG
 /nAlu9Q2tKjE9z1tEr0jUR7+mhreKyJGJT3Ngy0yyUDjofTJGJjHIykM/ox7e7t1L+We
 ZTHokWUr0uQq7RaKuKJyvDyv13hCDEkjYcCSfNxAAHgwzskS1b1wNdKllZYjedEu7GVz
 wCOw==
X-Gm-Message-State: AOAM530SuEEdi9o3j9cxDUBvQ05mme0vEpYCwa5jvRvU2UIHr96oIICm
 LEXDYK6Onw7w3QVF5lhg8/C9VJUegJqO7w==
X-Google-Smtp-Source: ABdhPJyRcISYU/7qW1rlLZsHyaEDMprDLPFsHy5nt+k1QyBfkho6CL1xoCjZCmonLmizjG/lLNjUoQ==
X-Received: by 2002:a63:114:0:b0:34d:efd0:762a with SMTP id
 20-20020a630114000000b0034defd0762amr23191092pgb.71.1646172024683; 
 Tue, 01 Mar 2022 14:00:24 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:00:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/18] target/arm: Validate tlbi TG matches translation
 granule in use
Date: Tue,  1 Mar 2022 11:59:54 -1000
Message-Id: <20220301215958.157011-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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


