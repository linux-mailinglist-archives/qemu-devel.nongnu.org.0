Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 787894C9830
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:13:23 +0100 (CET)
Received: from localhost ([::1]:59316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPAkE-0004h6-IS
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:13:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXi-0001MT-1K
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:26 -0500
Received: from [2607:f8b0:4864:20::1029] (port=45892
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXg-00055C-9x
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:25 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so47918pjl.4
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iuG8ohkKwqyyIJ7svsXNRHI3s70BPYfliw43HdSQEsk=;
 b=v6vhctFGtQ9+UuTVknMXPWTTC4GFlxgV3M6vlHVEU/BYRvyePLI+kh8gjOG3ssREou
 xGKIwLKegECDh3fqaNNJ9iNWIchFv9H5qJtgE82VNlL9UsBRp867UZGfb8aarEz1hDbs
 2nWXGx43oqz53sQdyrF/AX9Ar66/YUvRcDTxGzZjcOK0fL/ij/iiT5aLL605pK98RQ8Q
 bJL1Snj0/4hkQRAiW0U+CS0cK7Cl6I7TmttvfkxzR1MTH3rcsykpWlIw7yhIf0z9KGqt
 HhRahD9ThmgunpeEXKtV6vaL+j0JlSgfslCeasi9GjAfLAOPH6NuMVWE/9TE01GN1j4K
 COWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iuG8ohkKwqyyIJ7svsXNRHI3s70BPYfliw43HdSQEsk=;
 b=4sebbOTtnVkDY8perr9VIz3c0JasYTJn/EtPTCph31Zju7r8HMQfKR16KCJIWc4fdP
 iWRnsIp3ALLEtl+7cdww5UCMm5DVpE70gXbI8HnQNXE9xBFMjTlcFVK1gPGONpq2JXeG
 74PUNjqS7MwnHGmnfu1Q4qnsjDq8pP6TCiim8eTnsdBDFX856OCsmu+Nsjs9uWMGD2TJ
 /GbEkZzzzVbHuyrHlAqk4L/Rd05umgrlr2BLyA/VJ9+SgYhfqfMhay0twALrKahdx5RR
 9QnnJMbnsbXA2V76xCScJnnD4eLH8nUcm+ijjoEciWLo2LNQGz7KEapMvGOt9xLBDaoY
 Me7w==
X-Gm-Message-State: AOAM532KFL820gU3HD6eVBsCO2auqTDIfzRWUry2/rJjfzNJuyZmInep
 lYirpJN6IMVGO0Qdol4ZDJCk/LiX9+vSXQ==
X-Google-Smtp-Source: ABdhPJx63VH1HkkCCGZSNnq+d5LdDpI55pWB7Us0oU6YEXNa7dgpWE8Q68A0y4b/I61qb2cfHoG4CA==
X-Received: by 2002:a17:902:cacb:b0:14f:ef7f:b0c4 with SMTP id
 y11-20020a170902cacb00b0014fef7fb0c4mr26480658pld.135.1646172023148; 
 Tue, 01 Mar 2022 14:00:23 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:00:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/18] target/arm: Fix TLBIRange.base for 16k and 64k pages
Date: Tue,  1 Mar 2022 11:59:53 -1000
Message-Id: <20220301215958.157011-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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


