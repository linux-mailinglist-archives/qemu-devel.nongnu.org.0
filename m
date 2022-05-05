Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95B751BCE9
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:13:35 +0200 (CEST)
Received: from localhost ([::1]:39876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYUI-0007wR-2v
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWj-00053M-Kf
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:01 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:52032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWh-0003Hd-U5
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:01 -0400
Received: by mail-wm1-x329.google.com with SMTP id q20so2247239wmq.1
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ArM5vDP/EbKZawRU57Aqm2WP6vjT8p7Zzo7XHj++yzg=;
 b=CjHMDuHYM8Nk/cP8pe5ZJtiSurn/naPnyefnFzK5ZTV/ajoCFkaArmGmNEj1Hwcb5M
 UwU0wWhJ+2vjcS7QbehH6b4vCcYkykQgn54/dDys3ye01kR0ammrph6mdGTKSA5BXUnr
 dOUc9m0RIH9VCUa7yG5WImBBBPBNGGiKvbP1NgbMbNOpomsVyfLLXjdGUWV/0JOh1azN
 0e41K2VA/WwqnPzMCl4Bd/YNIVP8xb/Ti6wxFQy33Y2esaPinA6Po2pZaN12J+cceJgs
 mJ6sg0r2ZFjNTZSEX4orMbZBYVbmqCB90u2Mq3rp6WLk+w0Mxzo6Z6XNAwtiSJFH773p
 /ugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ArM5vDP/EbKZawRU57Aqm2WP6vjT8p7Zzo7XHj++yzg=;
 b=lgbt3hwfwPkDg+php2ON7S8RZ2Vuvs3qdT3F3cZZ0zOyZiNYfn2gvzBb0qTBZ7wOfJ
 3SlGLad9ocWLlz4DmdCSISuvAL2y6FOOZ3c902GbbuA2oUSpWv+kRvEFSPR3dfuFmEuD
 P/ahxmzM0rig5H9VYLbFYAuU5AnuniFdYP56xB9jIH9YtVK+z+FIFOTsP05i/gSOg5YA
 DJJmgavQQsnlOP++CvvI8Ct3SVqWLTNL1ZVI26+uahwFNFWct07po7XY08yaado28J+7
 moXu1EFI5sxfQ2loVDcf26Sb/6BuEGgwBX9DCkmczw1jdMaZpO+Mpslpl3fdk3WAcwjA
 PDww==
X-Gm-Message-State: AOAM531hvVZKaCPeOX6aJn0ag8fK4kY+q5vjfHeXkPgCIVmCmRJ0jzqo
 Pk4v13hY264NnkfqQgCHquwzd71t3dVUeQ==
X-Google-Smtp-Source: ABdhPJxDpvMOoQjSoA8SlytKssm3LRBRgzAEtd69HIND31ZHVw4Ei/wZXWsmlif5iweLZHM2izSltg==
X-Received: by 2002:a05:600c:3391:b0:393:fbba:3789 with SMTP id
 o17-20020a05600c339100b00393fbba3789mr3618049wmp.206.1651741918389; 
 Thu, 05 May 2022 02:11:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfe50e000000b0020c6a524fd5sm841612wrm.99.2022.05.05.02.11.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:11:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/23] target/arm: Change cpreg access permissions to enum
Date: Thu,  5 May 2022 10:11:32 +0100
Message-Id: <20220505091147.2657652-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505091147.2657652-1-peter.maydell@linaro.org>
References: <20220505091147.2657652-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Create a typedef as well, and use it in ARMCPRegInfo.
This won't be perfect for debugging, but it'll nicely
display the most common cases.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220501055028.646596-8-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpregs.h | 44 +++++++++++++++++++++++---------------------
 target/arm/helper.c |  2 +-
 2 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index ff3817decbd..858c5da57d8 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -154,31 +154,33 @@ enum {
  * described with these bits, then use a laxer set of restrictions, and
  * do the more restrictive/complex check inside a helper function.
  */
-#define PL3_R 0x80
-#define PL3_W 0x40
-#define PL2_R (0x20 | PL3_R)
-#define PL2_W (0x10 | PL3_W)
-#define PL1_R (0x08 | PL2_R)
-#define PL1_W (0x04 | PL2_W)
-#define PL0_R (0x02 | PL1_R)
-#define PL0_W (0x01 | PL1_W)
+typedef enum {
+    PL3_R = 0x80,
+    PL3_W = 0x40,
+    PL2_R = 0x20 | PL3_R,
+    PL2_W = 0x10 | PL3_W,
+    PL1_R = 0x08 | PL2_R,
+    PL1_W = 0x04 | PL2_W,
+    PL0_R = 0x02 | PL1_R,
+    PL0_W = 0x01 | PL1_W,
 
-/*
- * For user-mode some registers are accessible to EL0 via a kernel
- * trap-and-emulate ABI. In this case we define the read permissions
- * as actually being PL0_R. However some bits of any given register
- * may still be masked.
- */
+    /*
+     * For user-mode some registers are accessible to EL0 via a kernel
+     * trap-and-emulate ABI. In this case we define the read permissions
+     * as actually being PL0_R. However some bits of any given register
+     * may still be masked.
+     */
 #ifdef CONFIG_USER_ONLY
-#define PL0U_R PL0_R
+    PL0U_R = PL0_R,
 #else
-#define PL0U_R PL1_R
+    PL0U_R = PL1_R,
 #endif
 
-#define PL3_RW (PL3_R | PL3_W)
-#define PL2_RW (PL2_R | PL2_W)
-#define PL1_RW (PL1_R | PL1_W)
-#define PL0_RW (PL0_R | PL0_W)
+    PL3_RW = PL3_R | PL3_W,
+    PL2_RW = PL2_R | PL2_W,
+    PL1_RW = PL1_R | PL1_W,
+    PL0_RW = PL0_R | PL0_W,
+} CPAccessRights;
 
 typedef enum CPAccessResult {
     /* Access is permitted */
@@ -262,7 +264,7 @@ struct ARMCPRegInfo {
     /* Register type: ARM_CP_* bits/values */
     int type;
     /* Access rights: PL*_[RW] */
-    int access;
+    CPAccessRights access;
     /* Security state: ARM_CP_SECSTATE_* bits/values */
     int secure;
     /*
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 06f8864c778..a19e04bb0bf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8711,7 +8711,7 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
      * to encompass the generic architectural permission check.
      */
     if (r->state != ARM_CP_STATE_AA32) {
-        int mask = 0;
+        CPAccessRights mask;
         switch (r->opc1) {
         case 0:
             /* min_EL EL1, but some accessible to EL0 via kernel ABI */
-- 
2.25.1


