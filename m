Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182855048EB
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:29:33 +0200 (CEST)
Received: from localhost ([::1]:47382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9eO-0004aD-5z
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xI-0001Ea-Nv
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:45:00 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:37667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xE-0003OD-J6
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:45:00 -0400
Received: by mail-pg1-x531.google.com with SMTP id t184so1964636pgd.4
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cNQuYWlWJo1H5z1dgSCS+oQAsg1LmaUsgazYdgc9pgo=;
 b=ym3Y2Isq+BXoC2A9zRIR6pePFMeZnt2Y7+I1qAuS3ZvonwR7P9BlWi84Y5W2XNzSpR
 LpvPOjMiAahrDGD1fqOOMl/a0P/pEgv1/g7sB2O2Q+U0AVgmbBRTEROPJ4SLStTw0UiR
 UDJcMIArWg4UjD8Gagg+1rzUto7+LWZdpURYxmesbMtCS+Uqq1khyUtNF5DvzVSO5Cmp
 gwsAB+P/+cVQPaPQnxN+xFLLCyrwklEkyu0QAeqm4RMmteRe/yJbORbp6vEAKvCo0J8n
 SqvVl4NmghpXqHWuZsjCeawVvU33rPsB+ufwwGhnNWmDuGsvhik4DXyZ6MdRMJ0dkKjb
 Wg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cNQuYWlWJo1H5z1dgSCS+oQAsg1LmaUsgazYdgc9pgo=;
 b=fUb6QVc8/0okXtPpI2feN7dTrftreMidqcGK3QZu0EWNS4OUnJ44hJAYcmLCsj+N2O
 bCusd9EHtLjhV99b3ZSxxjyz5LuppKFonIcT4Ok66M5FZtK4QEdMcgRwQZETwOov/Hqa
 R18k9i94/07AplrFkyIAnJa0dqnlWC1+WMBCG56p9KPM2dKdI6bynqUNnSEprdzgpAna
 4O75mrEhgbRqBVPsXoDeB7IU0/2LNQy1jaTELhRwJcC8rGed6dRVrk/5CgCuLWFd/1NG
 yYRjA08nj6x/dj2UIN6grSxt9vIn6nf6Oe4KHKqlepYEsoXSIvxpo0ZgxR5xDGitQS5Y
 C1kQ==
X-Gm-Message-State: AOAM532ThEyv3CJ4jjqczoWksX+/wyefRVtU+/38oVOGW65Mm/QPFWUp
 K0X9YDgQUpcDS4b3iJWM4HSJPn/KIrRdqw==
X-Google-Smtp-Source: ABdhPJzwn59B6UjD+PKR0F9QtQ8noDL9+7s/Kg4HbwFSN8E5LEUGWKPsdQYUyzjFeY+Ae3a1nWIzcw==
X-Received: by 2002:a63:cf0c:0:b0:380:fb66:fa2a with SMTP id
 j12-20020a63cf0c000000b00380fb66fa2amr7099075pgg.273.1650217495172; 
 Sun, 17 Apr 2022 10:44:55 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 29/60] target/arm: Change cpreg access permissions to enum
Date: Sun, 17 Apr 2022 10:43:55 -0700
Message-Id: <20220417174426.711829-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create a typedef as well, and use it in ARMCPRegInfo.
This won't be perfect for debugging, but it'll nicely
display the most common cases.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h | 44 +++++++++++++++++++++++---------------------
 target/arm/helper.c |  5 ++---
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 031e4b7ec8..2c991ab5df 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -156,31 +156,33 @@ enum {
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
@@ -264,7 +266,7 @@ struct ARMCPRegInfo {
     /* Register type: ARM_CP_* bits/values */
     int type;
     /* Access rights: PL*_[RW] */
-    int access;
+    CPAccessRights access;
     /* Security state: ARM_CP_SECSTATE_* bits/values */
     int secure;
     /*
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1bbaf0a3af..33ba77890b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8712,7 +8712,7 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
      * to encompass the generic architectural permission check.
      */
     if (r->state != ARM_CP_STATE_AA32) {
-        int mask = 0;
+        CPAccessRights mask;
         switch (r->opc1) {
         case 0:
             /* min_EL EL1, but some accessible to EL0 via kernel ABI */
@@ -8741,8 +8741,7 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
             break;
         default:
             /* broken reginfo with out-of-range opc1 */
-            assert(false);
-            break;
+            g_assert_not_reached();
         }
         /* assert our permissions are not too lax (stricter is fine) */
         assert((r->access & ~mask) == 0);
-- 
2.25.1


