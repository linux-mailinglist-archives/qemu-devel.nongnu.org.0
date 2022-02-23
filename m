Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8179C4C1F15
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:49:29 +0100 (CET)
Received: from localhost ([::1]:47548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN0Rs-0003nz-LF
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:49:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0B5-00079z-Sr
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:32:09 -0500
Received: from [2607:f8b0:4864:20::1033] (port=55291
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0B1-0001Gr-DQ
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:32:05 -0500
Received: by mail-pj1-x1033.google.com with SMTP id b8so295351pjb.4
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 14:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iuG8ohkKwqyyIJ7svsXNRHI3s70BPYfliw43HdSQEsk=;
 b=WddS2ivjSWfNCTiD1OOwywbmtXYERS9f9cKw9sBPsqwsdwF13gXFDZQXznIoHcZ6Z6
 VQyCOG8v3AIC8azqObcb5p1dJP4zfkF31qkZiNoGUpICs1dEeyge0k0egcw27mUk+1+G
 ZonCBG9cj/spNu8efQYMwJO0gZAVWYP/+ThksB3Cr9G0xgYPv1QrNAPT7iGieyS+nKsp
 wuHI/Aa+rIX+6PdRKmlm7b/toLTQ2r1sQtyJM2bckxJXM3t4BDGO53Albqq2N5sRin+n
 1F6vAsntLlGT/B78qOj2I3pbAG6husIZN2qPjs23rJMvmvKC4pKBZgyP/cUmjzIvHWL9
 nkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iuG8ohkKwqyyIJ7svsXNRHI3s70BPYfliw43HdSQEsk=;
 b=00mG6k8VeAgJ/34NIommAhV/CbuURrmKhHpLr6t+Mh3kpvr7izp7tBLmgituKJQBEW
 XnO6n3n6qEcZWGnhDzG5aYkYTDznP7br5aZ9UCxBAC9lA8Ix6a/BFrXC3/QpAMg7/4Ta
 lOZE59yFiFrTyQ06MsCGiFlkG3YUHJ+AqZy0qVcMIYm1DXlOUda/VFFTURPrWwcZk9WF
 eUVRF9ct9F/vFFVA0Aysjx3LtIWP9Eq4kk9PB/Bpuc+QFG51JmVvMXfX+21GER/GQU+h
 fq77csLWqfAq4b1J3+nT104wjguZMloaJ+QcbDzkS5B2y7Y/cB7hagV3n+E0Oh4Famqg
 tFWw==
X-Gm-Message-State: AOAM531MzTjarjewntJjU2xt86NU171pmcUm4plTwDdS0uZJobOzzsPP
 msAMD4hklPZGlEwObuG2koyYvsRsqg3s8w==
X-Google-Smtp-Source: ABdhPJwmGB7nO0T90zWZHjoGI3XAZh3emi1m3aJnIDJp2hxS6HdgwuBWUC4k9XZj+LAFEjQl4fbZrg==
X-Received: by 2002:a17:90a:4043:b0:1bc:450:df68 with SMTP id
 k3-20020a17090a404300b001bc0450df68mr11308406pjg.120.1645655521450; 
 Wed, 23 Feb 2022 14:32:01 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 14:32:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/17] target/arm: Fix TLBIRange.base for 16k and 64k pages
Date: Wed, 23 Feb 2022 12:31:33 -1000
Message-Id: <20220223223137.114264-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

The shift of the BaseADDR field depends on the translation
granule in use.

Fixes: 84940ed8255 ("target/arm: Add support for FEAT_TLBIRANGE")
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 31c2a716f2..e455397fb5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4538,10 +4538,11 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
     ret.length = (num + 1) << (exponent + page_shift);
 
     if (regime_has_2_ranges(mmuidx)) {
-        ret.base = sextract64(value, 0, 37) << TARGET_PAGE_BITS;
+        ret.base = sextract64(value, 0, 37);
     } else {
-        ret.base = extract64(value, 0, 37) << TARGET_PAGE_BITS;
+        ret.base = extract64(value, 0, 37);
     }
+    ret.base <<= page_shift;
 
     return ret;
 }
-- 
2.25.1


