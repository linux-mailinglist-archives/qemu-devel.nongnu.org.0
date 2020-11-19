Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C252B9D8C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:22:59 +0100 (CET)
Received: from localhost ([::1]:59310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfsKQ-0006Sz-PC
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:22:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvJ-00015J-3W
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:57:01 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:39734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrv4-0004Es-TE
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:57:00 -0500
Received: by mail-wm1-x32b.google.com with SMTP id s13so8060678wmh.4
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=muF03FIBUNjZmHA9ePjBGJ37JzD55SGiha97SZN8IOk=;
 b=LNSGrqMCuRgAepOKkGnCY8Il1Hai1AenwzHczZ+hlPqbBXT3VM70xBqA403YN2Q5Se
 LhyNOfqT9mtUarm8U9bmlKosznj1FTbIW0Sx0ZgPDKd03ke/9rOcNUMXYJCWpLKWT620
 qpGCFq5vlPjd5OUDsbkqjRJcTWyZvMFgdzUozumFNm1/0mpMf1ZzWmJjYYAuQYVOzaTk
 wFU933felh2fG8xtsjT/yd8Xaa02PV/mY3eoGMam0XfS8nBrs32hg0EHHd0p4eY+2HKJ
 P3ZDQbDQy8yz39xNUBTJYCvOX6gjXbTBjX/Sp73ccPtFxWMmlgk9sOdISDPl2Ds0xYL0
 skHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=muF03FIBUNjZmHA9ePjBGJ37JzD55SGiha97SZN8IOk=;
 b=uFyAYscPB3AQ0hWoiVXcT9DzChXT72ERGdnV93X2eRkSnadTZ7oMqDKEhvdDZ4zADm
 ux4wInsufUpsSQLW8JKuq/D08NJLzkMaXcBdVXtVZYmpDPk/QUK/fGU8KJw4P2l5v5Ib
 w2ca2h2urk/BT7SFlDZ3dJ7wyPMcEIbdU+PJiJtduORKzHGLfD3cRfpusCMb3l7/M2UG
 PXWeieOmT5WYwSIr6B+adljdQ4woLlJ+Wg4c48OCFQWCHjirnlZoBvsvvHRxLADuWAuF
 mqx2tNKCcGfhv8Oqer/4BWuRkYc2tDg3tCQr1qpAf61vW9qjKnO378RtmnmoeGrq+9By
 J6wA==
X-Gm-Message-State: AOAM5334zA+bnr3qHd1gZTbaN+iBhI9GMrIAA/LqxIEw2NSVMYH5MlHa
 bBYEYaFzf81nFbHy9j3TqaMVvw==
X-Google-Smtp-Source: ABdhPJyrRe7WC9rYZU4zM+T2QsvPbJ3R6A6PUt9K8FVjeRo+C4WQ5fkvznW13B6k9nJp6oN0THDxwQ==
X-Received: by 2002:a1c:4e06:: with SMTP id g6mr3363475wmh.119.1605823003029; 
 Thu, 19 Nov 2020 13:56:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 20/28] target/arm: Implement new v8.1M VLLDM and VLSTM
 encodings
Date: Thu, 19 Nov 2020 21:56:09 +0000
Message-Id: <20201119215617.29887-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

v8.1M adds new encodings of VLLDM and VLSTM (where bit 7 is set).
The only difference is that:
 * the old T1 encodings UNDEF if the implementation implements 32
   Dregs (this is currently architecturally impossible for M-profile)
 * the new T2 encodings have the implementation-defined option to
   read from memory (discarding the data) or write UNKNOWN values to
   memory for the stack slots that would be D16-D31

We choose not to make those accesses, so for us the two
instructions behave identically assuming they don't UNDEF.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/m-nocp.decode       |  2 +-
 target/arm/translate-vfp.c.inc | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/target/arm/m-nocp.decode b/target/arm/m-nocp.decode
index ccd62e8739a..6699626d7cb 100644
--- a/target/arm/m-nocp.decode
+++ b/target/arm/m-nocp.decode
@@ -36,7 +36,7 @@
 
 {
   # Special cases which do not take an early NOCP: VLLDM and VLSTM
-  VLLDM_VLSTM  1110 1100 001 l:1 rn:4 0000 1010 0000 0000
+  VLLDM_VLSTM  1110 1100 001 l:1 rn:4 0000 1010 op:1 000 0000
   # VSCCLRM (new in v8.1M) is similar:
   VSCCLRM      1110 1100 1.01 1111 .... 1011 imm:7 0   vd=%vd_dp size=3
   VSCCLRM      1110 1100 1.01 1111 .... 1010 imm:8     vd=%vd_sp size=2
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 1c2d31f6f30..c974d5b0e16 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -3814,6 +3814,31 @@ static bool trans_VLLDM_VLSTM(DisasContext *s, arg_VLLDM_VLSTM *a)
         !arm_dc_feature(s, ARM_FEATURE_V8)) {
         return false;
     }
+
+    if (a->op) {
+        /*
+         * T2 encoding ({D0-D31} reglist): v8.1M and up. We choose not
+         * to take the IMPDEF option to make memory accesses to the stack
+         * slots that correspond to the D16-D31 registers (discarding
+         * read data and writing UNKNOWN values), so for us the T2
+         * encoding behaves identically to the T1 encoding.
+         */
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
+            return false;
+        }
+    } else {
+        /*
+         * T1 encoding ({D0-D15} reglist); undef if we have 32 Dregs.
+         * This is currently architecturally impossible, but we add the
+         * check to stay in line with the pseudocode. Note that we must
+         * emit code for the UNDEF so it takes precedence over the NOCP.
+         */
+        if (dc_isar_feature(aa32_simd_r32, s)) {
+            unallocated_encoding(s);
+            return true;
+        }
+    }
+
     /*
      * If not secure, UNDEF. We must emit code for this
      * rather than returning false so that this takes
-- 
2.20.1


