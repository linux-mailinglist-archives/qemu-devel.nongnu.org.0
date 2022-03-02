Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC094CB0B1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:09:54 +0100 (CET)
Received: from localhost ([::1]:44972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPWEL-0007V3-9J
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:09:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxw-0005uD-0P
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:57 -0500
Received: from [2a00:1450:4864:20::42d] (port=39428
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxs-0008Sw-BY
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:54 -0500
Received: by mail-wr1-x42d.google.com with SMTP id ay10so4678027wrb.6
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SM320yQbplZVI8Mj8lk3kp4hv9BTspAqO+QUiQG4O/o=;
 b=NkLPESjWQnirCgbc9i98Cr+nsjeG6gDrRGGYyL2TspfsR38laJx8HNldshMrek/mTK
 94/U8Z5U6VIMDJrF5a2cQZ2zDza1CgPjBkm/YDhgFmbFkE0VfYjMibQTJvMo9YKRzs1m
 ALLOiyDhFBIhgZ/0P+JfsuOympSh3Lz18ri8xI9PDvM+T7wP0M5DatXbgwEYQvX0jzfU
 P9YOUj9ysJtke833yOfBYPkQ++M4Px49fSsBvr3DYrJQ5+3/MOK0hrSa2iyFbP4zI1U0
 daQaRngqnl/2OZ0hha+MsNu53bXCRCRUQhTZG2obbh4ZEDyAVoeW+03GWBGlprTgCzUB
 Ph2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SM320yQbplZVI8Mj8lk3kp4hv9BTspAqO+QUiQG4O/o=;
 b=mONyRruBvam590Nf4meGGVHTe2Styqj+gxOSMfM4zz8QFnolrwUFU/zeb9fPtwQNnk
 IIpTn+CW5Qc6PZVlX4Bj38pHIKLZIXmrWodb/Rgl4H2LKgaevTnqZVnhQ2nQT5zlgCIh
 0swvotlaiIF1KFWtDn4oQwEirIDepMInL+1C8EvNni34PF+4btBK6DjjRw61qrxNdflY
 49cvkPqbbnfxhRo8z5mJ85yVJHkPPfdcbfakEPBLp0EYApiI0wGxDvbnM/CbYAED4nHt
 gBvcTxud2oJQViK1u5+NI1VFqW3FIM0nChd9KA40GjoNpt9SCBX9gj5heYNoh+SIJSez
 jARA==
X-Gm-Message-State: AOAM532o8iCvnJ2+njfIjfhhvdGNfG+1bm/o2eNvz7WkCuGN4jDHvMpi
 4FRt3sUVUoogH4yutKE3RlfAfuLpxlBo5g==
X-Google-Smtp-Source: ABdhPJyIkRMcgrKcEhxbLKktKJ9ObPaKURzcQt1I/fNjQuiNDu6UVq07IheOF1W53OJlkSXrDUV1hg==
X-Received: by 2002:a5d:64ae:0:b0:1f0:490e:159f with SMTP id
 m14-20020a5d64ae000000b001f0490e159fmr1387979wrp.143.1646254371103; 
 Wed, 02 Mar 2022 12:52:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b001e31279cc38sm90801wrn.11.2022.03.02.12.52.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 12:52:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/26] target/arm: Validate tlbi TG matches translation granule
 in use
Date: Wed,  2 Mar 2022 20:52:25 +0000
Message-Id: <20220302205230.2122390-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302205230.2122390-1-peter.maydell@linaro.org>
References: <20220302205230.2122390-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

For FEAT_LPA2, we will need other ARMVAParameters, which themselves
depend on the translation granule in use.  We might as well validate
that the given TG matches; the architecture "does not require that
the instruction invalidates any entries" if this is not true.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220301215958.157011-15-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e455397fb57..3a7f5cf6f08 100644
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


