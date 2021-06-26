Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8B13B4D26
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:39:46 +0200 (CEST)
Received: from localhost ([::1]:54978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx1yj-0001mB-Tp
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vh-0001kc-V5
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:38 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:44974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vf-0000E2-7s
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:37 -0400
Received: by mail-pf1-x436.google.com with SMTP id g21so7559231pfc.11
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CHsyqcYhDcvH4VyWNUvcKr7ulIJabCuia+q5kv3FL14=;
 b=FuH8u5rhNurKkBQ0PWw2OoCvjQeEUh+d5tXxuZHJLo5gIYoRdubURNem2rvpIegh+6
 DuiuRCt3mBUhmLDWYd/rtcU3hprU5gDTExLq94cPCOx9lIDMmEISciLBPzpg6zB40k6k
 eBlnv8lJIJqeplxLVZxiGCKrCTH/SXf+8HqZ6WJwpspFHKgAqV1r/HSm8i3QIS8oh0uL
 VaVDMuenz6DZdH2XnEQkLJB9gKEPbA/OMTLrlNAyMqCjNgeE5tGqKEnagmdBKSppbQAa
 v5R7nmPqIllv35hWQJivwcjtGX5ufUplDTYoh4M6jPboP+w4Kuvj77cUNfqsayP5+wR6
 pfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CHsyqcYhDcvH4VyWNUvcKr7ulIJabCuia+q5kv3FL14=;
 b=Slhg+WtSJegikB5ChsfcXu7Ct0Bl3n/WdDf4AHI4BsiFH/af2p+DHY3ju/Ytav/tzs
 zQpg4b32QZWFshFZL5aNskJEM95xDti83H9caeQRuTGA9GGzTLlooZyfm/+YJI5udiw4
 51Cll8weCriOMKrcL/qbmx0kaZPy4a4Gy4/Hga8e/ty9Vr5Nz4w+LWMXoblY0MCPDy7B
 l3wLFg3SaVg3qfBnj4tpwIPpW2+G9qItXmyRsJ8Y+P3KHfeVGLyLBaqKG7Dmw6vtJSEC
 1eTC7bm0f3l0vqQ7HsUf6WKLAQjj2VLlUl7TCzp1AQOkpm0Sg2f45eckiFRvufLt3PXY
 slbw==
X-Gm-Message-State: AOAM532FfMUiUf9deJDMpYCRYPqxrO0keHjDiMVccuvvGA2pFAa44AYY
 rfK4SkqEfBL4kQa5fVieozkGsoN1OoZY9Q==
X-Google-Smtp-Source: ABdhPJzHGJWcABqYT/CGy11/C8/JgxaOkuSX08RcDeFS9hT9MRMdVGqrL9HocPaZVsE2RrpXLbl7bw==
X-Received: by 2002:aa7:9384:0:b029:2cc:5e38:933a with SMTP id
 t4-20020aa793840000b02902cc5e38933amr14122980pfe.81.1624689393854; 
 Fri, 25 Jun 2021 23:36:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm7724201pgq.54.2021.06.25.23.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 23:36:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/29] tcg/i386: Support bswap flags
Date: Fri, 25 Jun 2021 23:36:04 -0700
Message-Id: <20210626063631.2411938-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626063631.2411938-1-richard.henderson@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Retain the current rorw bswap16 expansion for the zero-in/zero-out case.
Otherwise, perform a wider bswap plus a right-shift or extend.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 34113388ef..98d924b91a 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2421,10 +2421,28 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     OP_32_64(bswap16):
-        tcg_out_rolw_8(s, a0);
+        if (a2 & TCG_BSWAP_OS) {
+            /* Output must be sign-extended. */
+            if (rexw) {
+                tcg_out_bswap64(s, a0);
+                tcg_out_shifti(s, SHIFT_SAR + rexw, a0, 48);
+            } else {
+                tcg_out_bswap32(s, a0);
+                tcg_out_shifti(s, SHIFT_SAR, a0, 16);
+            }
+        } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
+            /* Output must be zero-extended, but input isn't. */
+            tcg_out_bswap32(s, a0);
+            tcg_out_shifti(s, SHIFT_SHR, a0, 16);
+        } else {
+            tcg_out_rolw_8(s, a0);
+        }
         break;
     OP_32_64(bswap32):
         tcg_out_bswap32(s, a0);
+        if (rexw && (a2 & TCG_BSWAP_OS)) {
+            tcg_out_ext32s(s, a0, a0);
+        }
         break;
 
     OP_32_64(neg):
-- 
2.25.1


