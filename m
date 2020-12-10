Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DED2D59D4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 12:58:20 +0100 (CET)
Received: from localhost ([::1]:54184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKaR-0001xc-JT
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 06:58:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR2-0001Uw-2C
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:36 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQm-00075u-Ft
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:35 -0500
Received: by mail-wm1-x331.google.com with SMTP id a3so4988066wmb.5
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CzFRHLXYHbAS+zng3Ry2pyEty5FizGBShW7cxULP69c=;
 b=amsbYZGgtpOozFCidXkYouBgpB4n7YFkvp5kJAok4R9Krc9FKtX+t5k3UTZZSh1I1y
 nZolu+4MGWnC9mG5Vu8axZM8v3eOa2WNy9585ejjTCqr4l3in38CUYpm6YqIU2LhlmRY
 kObs0Cb+EpvtDrO35x6w1dSDaPRMLzZa1T5yzEnRigjSoks9a/+F0JlXBuAEDJnxGVIn
 l8bLpA0gd/sre90VABkVxI9rvU6IUtPbfXubKHp32lQvBk3ViAraTc/fRNwkMc3LlaVP
 XkKcm7hVNNKUyXlzYVYvLE0knP/SqDQoMq9GKi3r9La+96DiuiFWWrvq/dR29Bb5075c
 RlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CzFRHLXYHbAS+zng3Ry2pyEty5FizGBShW7cxULP69c=;
 b=eoqlP0PoW/+YwchOX6qzyyBc1ZpvvkMj+P/Sg72FyhxkAudiqHDeINXgdUAuPqfcHG
 XyRSUteOmt+2aheZVrdm7FVmBvbKhFfhfXaQaltI8Fm8jo0FGT3SLMsx2RIOYevqPiaF
 3wLmx3bqQ1+An/lEob0mnj91FRWVlTVQBtktRf5oTC2EtRTndb9Oh1vJKyr9xTHBXpvg
 7GtNzueeGPR7cETjgcnaNRvPfLjuBzOpguggmMbTqhBfE5/Za7eHs6Tjg4bP4JC1cCZ2
 mEam8EGTxBEV1oZYxOEBeeSQ4KLhb/lw8wRfS9OnDLrTyCZQBrCT3wZUZhiNDxWm/has
 rR2Q==
X-Gm-Message-State: AOAM532trB2FKS2hBjJ0bxCScRNW3y5u+CXbO+6/J6OvKwYAvaYijssF
 iJnIVEpk+cHt1M22p2U/62nxpnYvU3GhzQ==
X-Google-Smtp-Source: ABdhPJzTw7vKi7FlhTgSjNaDadl6lvdzFQyMRe157fVqKFHdyfJ3ypOuO75M97WSoFA8Tob5B0FVOQ==
X-Received: by 2002:a1c:46c5:: with SMTP id t188mr7796849wma.3.1607600897619; 
 Thu, 10 Dec 2020 03:48:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/36] target/arm: Implement CLRM instruction
Date: Thu, 10 Dec 2020 11:47:36 +0000
Message-Id: <20201210114756.16501-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In v8.1M the new CLRM instruction allows zeroing an arbitrary set of
the general-purpose registers and APSR.  Implement this.

The encoding is a subset of the LDMIA T2 encoding, using what would
be Rn=0b1111 (which UNDEFs for LDMIA).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201119215617.29887-6-peter.maydell@linaro.org
---
 target/arm/t32.decode  |  6 +++++-
 target/arm/translate.c | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index cfcc71bfb0a..f045eb62c84 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -609,7 +609,11 @@ UXTAB            1111 1010 0101 .... 1111 .... 10.. ....      @rrr_rot
 
 STM_t32          1110 1000 10.0 .... ................         @ldstm i=1 b=0
 STM_t32          1110 1001 00.0 .... ................         @ldstm i=0 b=1
-LDM_t32          1110 1000 10.1 .... ................         @ldstm i=1 b=0
+{
+  # Rn=15 UNDEFs for LDM; M-profile CLRM uses that encoding
+  CLRM           1110 1000 1001 1111 list:16
+  LDM_t32        1110 1000 10.1 .... ................         @ldstm i=1 b=0
+}
 LDM_t32          1110 1001 00.1 .... ................         @ldstm i=0 b=1
 
 &rfe             !extern rn w pu
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9f2b6018a21..47a1a5739c8 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7968,6 +7968,44 @@ static bool trans_LDM_t16(DisasContext *s, arg_ldst_block *a)
     return do_ldm(s, a, 1);
 }
 
+static bool trans_CLRM(DisasContext *s, arg_CLRM *a)
+{
+    int i;
+    TCGv_i32 zero;
+
+    if (!dc_isar_feature(aa32_m_sec_state, s)) {
+        return false;
+    }
+
+    if (extract32(a->list, 13, 1)) {
+        return false;
+    }
+
+    if (!a->list) {
+        /* UNPREDICTABLE; we choose to UNDEF */
+        return false;
+    }
+
+    zero = tcg_const_i32(0);
+    for (i = 0; i < 15; i++) {
+        if (extract32(a->list, i, 1)) {
+            /* Clear R[i] */
+            tcg_gen_mov_i32(cpu_R[i], zero);
+        }
+    }
+    if (extract32(a->list, 15, 1)) {
+        /*
+         * Clear APSR (by calling the MSR helper with the same argument
+         * as for "MSR APSR_nzcvqg, Rn": mask = 0b1100, SYSM=0)
+         */
+        TCGv_i32 maskreg = tcg_const_i32(0xc << 8);
+        gen_helper_v7m_msr(cpu_env, maskreg, zero);
+        tcg_temp_free_i32(maskreg);
+    }
+    tcg_temp_free_i32(zero);
+    return true;
+}
+
 /*
  * Branch, branch with link
  */
-- 
2.20.1


