Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3081376E89
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:27:06 +0200 (CEST)
Received: from localhost ([::1]:56800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCgL-00036Z-PP
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC5E-0004pG-3m
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:44 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:46740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC50-0003gC-UF
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:43 -0400
Received: by mail-pl1-x62f.google.com with SMTP id s20so6128494plr.13
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MnGbP0t9ipMuFDDfgVLV3xJxRcipksJ9kWE5+MnyCZM=;
 b=tijmRvN3nJP+w/YSkX7nG8pcWswdCBBCCN9akvBgFgKdbtEeMRbNwBwuIs3zXG1f2R
 ijrMr6pn2X03jmO8CGPK5S1hBCN7MnxtI/tm1UxcEAS39tt9qvxUyxumRzrzYNorwIGW
 BYTTE3Dqg6aYAbjQHrv9rMbFA7HdvLpMlXUCGejPkDjpR/20VEfIb0HlVV2tHDt0WRFF
 zAL1GiV4sAbu4fT3iodC1DZSCDTRveVg+Op/l4RXeERTfp/85em/OqNaiRhqRbZiMgun
 EgVO7lfCTC2m9sd0MI3LLsP8LFJ6/J6O4eReSRN/1kb/t6IropD+P5JFH7szjDISDbW3
 scCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MnGbP0t9ipMuFDDfgVLV3xJxRcipksJ9kWE5+MnyCZM=;
 b=dPdktfxHNM9aBYkhE/dusScA4avpLFc6PkcZy1GUEw4SNfd8DEZ74524ayt9yoMcOi
 2Uda5znABO3Sm1aWrFS4UnKoOZ6FhYgYh/eKEpgg8Ffg45FP7LTjAiTfkg7qW/XHNL1q
 1Y9v999AdVcaGzVhSS06OtK3tamoc7OxfZvrbrxzGViJd648wzirkmWZM74/xB5P6LnJ
 /PvRwH5S+0k79U43r2Tdxhhzrj04wFxPGUehmqQKe2lWZqRZctJtdvD2yfV5LMuvuRBW
 u5f0+JhXLBN44M7GgmSMcW3nUb7+YbOQGPWl4psEFZp19Rh7HTKn/nOBxBtkSLID28uh
 nAKA==
X-Gm-Message-State: AOAM531q6XXV3fvr92sU7spIeL4NRQWPGfJuK6jCDV9oBMrMbu6HcLPj
 4v+vcOGOfup1K5jX5hwM0nLYjX6emVLPVg==
X-Google-Smtp-Source: ABdhPJw0gFDm1v5eqyaa2iwxpbBqISPGXG+/AWCv8KIygkGQOjkRm6dP/TKWCyUZxgCVL9+GHY5x0w==
X-Received: by 2002:a17:903:230a:b029:ee:a909:4f92 with SMTP id
 d10-20020a170903230ab02900eea9094f92mr13467728plh.44.1620438508939; 
 Fri, 07 May 2021 18:48:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 39/72] softfloat: Use add192 in mul128To256
Date: Fri,  7 May 2021 18:47:29 -0700
Message-Id: <20210508014802.892561-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can perform the operation in 6 total adds instead of 8.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-macros.h | 37 +++++++++++-----------------------
 1 file changed, 12 insertions(+), 25 deletions(-)

diff --git a/include/fpu/softfloat-macros.h b/include/fpu/softfloat-macros.h
index f6dfbe108d..76327d844d 100644
--- a/include/fpu/softfloat-macros.h
+++ b/include/fpu/softfloat-macros.h
@@ -511,34 +511,21 @@ static inline void
 | the locations pointed to by `z0Ptr', `z1Ptr', `z2Ptr', and `z3Ptr'.
 *----------------------------------------------------------------------------*/
 
-static inline void
- mul128To256(
-     uint64_t a0,
-     uint64_t a1,
-     uint64_t b0,
-     uint64_t b1,
-     uint64_t *z0Ptr,
-     uint64_t *z1Ptr,
-     uint64_t *z2Ptr,
-     uint64_t *z3Ptr
- )
+static inline void mul128To256(uint64_t a0, uint64_t a1,
+                               uint64_t b0, uint64_t b1,
+                               uint64_t *z0Ptr, uint64_t *z1Ptr,
+                               uint64_t *z2Ptr, uint64_t *z3Ptr)
 {
-    uint64_t z0, z1, z2, z3;
-    uint64_t more1, more2;
+    uint64_t z0, z1, z2;
+    uint64_t m0, m1, m2, n1, n2;
 
-    mul64To128( a1, b1, &z2, &z3 );
-    mul64To128( a1, b0, &z1, &more2 );
-    add128( z1, more2, 0, z2, &z1, &z2 );
-    mul64To128( a0, b0, &z0, &more1 );
-    add128( z0, more1, 0, z1, &z0, &z1 );
-    mul64To128( a0, b1, &more1, &more2 );
-    add128( more1, more2, 0, z2, &more1, &z2 );
-    add128( z0, z1, 0, more1, &z0, &z1 );
-    *z3Ptr = z3;
-    *z2Ptr = z2;
-    *z1Ptr = z1;
-    *z0Ptr = z0;
+    mul64To128(a1, b0, &m1, &m2);
+    mul64To128(a0, b1, &n1, &n2);
+    mul64To128(a1, b1, &z2, z3Ptr);
+    mul64To128(a0, b0, &z0, &z1);
 
+    add192( 0, m1, m2,  0, n1, n2, &m0, &m1, &m2);
+    add192(m0, m1, m2, z0, z1, z2, z0Ptr, z1Ptr, z2Ptr);
 }
 
 /*----------------------------------------------------------------------------
-- 
2.25.1


