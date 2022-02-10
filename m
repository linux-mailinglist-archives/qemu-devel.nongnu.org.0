Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 196C24B0475
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 05:26:34 +0100 (CET)
Received: from localhost ([::1]:56966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI12P-0006Z5-7Y
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 23:26:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0jd-0004OK-0N
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:07:09 -0500
Received: from [2607:f8b0:4864:20::1036] (port=43962
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0jU-0004ME-PT
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:07:04 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 t14-20020a17090a3e4e00b001b8f6032d96so4321719pjm.2
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 20:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/PyGX3z0esgQKjWtAq0OXlyQ3FBYa3KsBIg46iOmGfg=;
 b=kfqC3NK4ri29kF9NBPjhhpz6IjztxGGBsIcc2ETKQDQVMot/koXli4OmLUFxRRQdf6
 4fPCqGpCdyHxBjxgkX5fpmzdI+4n6xHK1Dbfpz2UMBEwq0MIjUInvqnZVzXhAzkcRy0w
 avttEZx4P4phkTLj6EtCAL4Sb9IFwISptCpcweYvX70tpCJi2Tg2nSnqI16q7Ig+2ILw
 K7OvAh23uar0xAKByTOcWDbqR1hlRqcPWMzrIliaZleexRI1KDAzUk101vd1q2kyRJTD
 RaNws58VWuIkaXJVSm0w4cmLlvWAKl1TNmGYgQX8BVp9LqlAyWlADlie3Rni/P5KvDdb
 5FAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/PyGX3z0esgQKjWtAq0OXlyQ3FBYa3KsBIg46iOmGfg=;
 b=pQJxlPHYDwamhiUfBAGz36ull/W+ofW+wdaIscFaqDRMLR4MjKlnVPDWvj8TtkWPBV
 lyPASX7fvrM3DYHCa4XC+LQVf/DN+5caTucE3jn/PReHRackDqzQz3pASq1LhGv1nrpI
 y48+oOVsRCel2GMVuhGo3l+oyoVxVtfTyaRb8V2BaNKmyETvyLPUtIkSc9B5yTul143E
 JjHtB0mvsNC/Pxg33rx/dhpAoGxsRZbQAtz9xsgvcX0vVO3rgI3YRPH9CP3AcSGnZR+A
 QR+clFi340pe8Tbwf2EZGpOgaKmfUGu06X3QDyhW3dm84eLm2TtswCCLViNpvPywTL0s
 WY1g==
X-Gm-Message-State: AOAM5304i1s0zd5MdZwYjzazP98FCxgcoa2CApIkgZjY+YpDQWoTQfqL
 KiqwQ9mA+AUgJ6J4089CnH21OLuJOf1YfVQP
X-Google-Smtp-Source: ABdhPJxdORFKGt+AH+E+Z1p3QTMgjDJlZZiIFKYSfNOSKjfZPvQgifrV+te5bdK7mhZSV1uAGckLOw==
X-Received: by 2002:a17:90a:19c2:: with SMTP id 2mr744294pjj.132.1644465911851; 
 Wed, 09 Feb 2022 20:05:11 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 20:05:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/15] target/arm: Validate tlbi TG matches translation
 granule in use
Date: Thu, 10 Feb 2022 15:04:22 +1100
Message-Id: <20220210040423.95120-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e2551e693b..771de959dd 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4518,12 +4518,16 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
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
@@ -4535,7 +4539,7 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
 
     ret.length = (num + 1) << (exponent + page_shift);
 
-    if (regime_has_2_ranges(mmuidx)) {
+    if (param.select) {
         ret.base = sextract64(value, 0, 37);
     } else {
         ret.base = extract64(value, 0, 37);
-- 
2.25.1


