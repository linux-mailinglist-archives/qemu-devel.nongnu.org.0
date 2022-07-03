Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B61F25645EB
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:49:03 +0200 (CEST)
Received: from localhost ([::1]:35104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vHq-000739-Q5
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvl-0001Fg-Jp
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:26:13 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:38471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvk-00068N-1c
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:26:13 -0400
Received: by mail-pg1-x52d.google.com with SMTP id e132so6255935pgc.5
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UdWt/TITPMQtfVvFmAMORDuCVpC5zM3kt486JkKHmUA=;
 b=nXmvw1i0mfLzABD1tf4QozsKqhjU6+wWtxKqzmE7eudXuYyL63DPkvCi2Av7Q6KDVJ
 /78w7K2g0Ht13ar+GxHdEpMsSnbt0jYD8duK9NfIakNkpGNRNRPEKvV1NykCxey7OuVh
 4v/pu3TRp2fM6MBlUGcE5ZO6YOcZ3oBObgn+fc9jasGCKSPT7TuqgdeHUd8ujrLSTX1H
 /v0wkfpunxbAGBkQVCeQONJaMRFif726kXAgK5EcUX6Oi/bHxWibZyT0C0HDHvO0Z9Tw
 lERJiQ5ZIAvaJBoeEipLXX1MhIjxJeu7aHQzh6F2i/OJQGZnWUOOOUlLM/ROwwWt8Qj4
 0fkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UdWt/TITPMQtfVvFmAMORDuCVpC5zM3kt486JkKHmUA=;
 b=OydUTWWGZ6FFelz7ZyRcIk6D3hXAcfY5dbHDv+Fuq30eHAi8N2ldbhUPIW2453GyNl
 moIs5KtBOfg+UfMhAvq7xB/f/B52HXyLThXxgzO9TAad0hM5I7vvPNIbuQnD16m4VDLw
 yr5o+Pvvgjxp+zgs3QEl4r17ef6AZ8pbL2V4Kau4iWZWnOxNrsdooYnpSEh6VYYaiplJ
 sKgrIX2RR5qL+xbztls55DxNzu5PCCcMsEUVxIeX6+vMAPLeOW6+UZuhTbwRaSh+SFk4
 ZTFK/FI5GEqi1dwjYd5DaCP/IHvI/diDomtG7kt+yLtep/we1+ENzo0TYfu25FqHrxCv
 5eRg==
X-Gm-Message-State: AJIora/6mggVs8mfmFf72uKnGFEEcH3nbFa9x7nWe02AYW/sfdMXnopO
 Pl3FEOMZ1cWvQzubKF2BTxT60pvbfzmocI1y
X-Google-Smtp-Source: AGRyM1viA1AuI7PQEhLDuvni5QR+H4nXiuu/RwUocn2R5qej6tJvgwuVpp58RNSEs8+imdJc+VJZAA==
X-Received: by 2002:a65:6aa3:0:b0:40c:889d:4f16 with SMTP id
 x3-20020a656aa3000000b0040c889d4f16mr20274474pgu.106.1656836771216; 
 Sun, 03 Jul 2022 01:26:11 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:26:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 35/62] target/arm: Drop secure check for HCR.TGE vs SCTLR_EL1.M
Date: Sun,  3 Jul 2022 13:53:52 +0530
Message-Id: <20220703082419.770989-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

The effect of TGE does not only apply to non-secure state,
now that Secure EL2 exists.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8b80716e38..f76a8e931a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -157,8 +157,8 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     case ARMMMUIdx_E10_0:
     case ARMMMUIdx_E10_1:
     case ARMMMUIdx_E10_1_PAN:
-        /* TGE means that NS EL0/1 act as if SCTLR_EL1.M is zero */
-        if (!is_secure && (hcr_el2 & HCR_TGE)) {
+        /* TGE means that EL0/1 act as if SCTLR_EL1.M is zero */
+        if (hcr_el2 & HCR_TGE) {
             return true;
         }
         break;
-- 
2.34.1


