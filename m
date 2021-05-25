Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF32639049B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:08:28 +0200 (CEST)
Received: from localhost ([::1]:35344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYfT-0002f8-OK
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYan-0001Z7-AC
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:37 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:50986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYal-00041d-5S
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:36 -0400
Received: by mail-wm1-x329.google.com with SMTP id t206so16957573wmf.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Yo1MfDnp94wK0ymgIb3UiHs+gEMuLI/bBaHKJqCU1io=;
 b=Cye3kIVViPVCkNd6MekmJWWrA3y07BI+RcFdWmimxaJlQvpZWZikzHP1e7L7Kg2hXi
 9sXheB3ws6khaN7Ck1Za3ZNmZPzk6pYvq91V7zrlbqjZoaW8+7xBOM0diCsybuTXOmix
 iQ5GGNaZk6VXS+P6kri8JfAG/NhNA6ug67aWCD58Q3lGtKw1CJST8BcByXb6Pp1NuUx/
 mpEWmufJ3XgQWr6HZI5p70B1VRwifzfmg5v1N6CR83dhIBSFtDWOY4jJga9ixHf8eYFJ
 LzvnXptDAcP/4yFHS5Y2uZibuW7oeP27yXdrDZVQ3DcUWxcJIOXFGcuWXP8034pAOuvb
 woIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yo1MfDnp94wK0ymgIb3UiHs+gEMuLI/bBaHKJqCU1io=;
 b=hY6qu5C8r559wIttTtMa0bBFYzo3kp2L0X/7hLLAGgCBjjYSR0Ay6pIBfb7RVkEAMW
 LNDY2LF9fERgjQ3cozh3qTP/6jH2EoNv/pNLIkKlvGgjR5+7LIctkotpUIRqn7dGn6No
 leWg5sDDE8xcDAyBKvsCzrx1MD1DssdJXYaOsPbVpEDEVETH6E6i2Gb757SigwPAnuAZ
 oDNDLLj8c+9Q6hRiTT4txXy3NWZSk1JGXNpVMdD6EyEJV4hB7DCJ/WxBTLop67VnftF7
 sDq/47FBjFHrlbFo1UvrtJ9lQGKDTLmAxd69tRLDLTZC0OSjiJKdJ959aDe9VELVg5gR
 QkzA==
X-Gm-Message-State: AOAM531aPr0Ua2VkXMM+w2youf1aQRTgSGmjL0qe6CvueQah/ZZHn6Os
 BO8PBzPq1NHbnjOAC7G8CIi6epP/0Dwe4QLT
X-Google-Smtp-Source: ABdhPJy9l7+nnC+8qYU2HCMWTKHd+jvLQqG0peY5A/BISbw8XI9l7l5QURXGc5LNZcnaI1QI6qGUTg==
X-Received: by 2002:a1c:1f4f:: with SMTP id f76mr24417490wmf.62.1621955007895; 
 Tue, 25 May 2021 08:03:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.03.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:03:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 002/114] hw/intc/arm_gicv3_cpuif: Fix EOIR write access check
 logic
Date: Tue, 25 May 2021 16:01:32 +0100
Message-Id: <20210525150324.32370-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

In icc_eoir_write() we assume that we can identify the group of the
IRQ being completed based purely on which register is being written
to and the current CPU state, and that "CPU state matches group
indicated by register" is the only necessary access check.

This isn't correct: if the CPU is not in Secure state then EOIR1 will
only complete Group 1 NS IRQs, but if the CPU is in EL3 it can
complete both Group 1 S and Group 1 NS IRQs.  (The pseudocode
ICC_EOIR1_EL1 makes this clear.) We were also missing the logic to
prevent EOIR0 writes completing G0 IRQs when they should not.

Rearrange the logic to first identify the group of the current
highest priority interrupt and then look at whether we should
complete it or ignore the access based on which register was accessed
and the state of the CPU.  The resulting behavioural change is:
 * EL3 can now complete G1NS interrupts
 * G0 interrupt completion is now ignored if the GIC
   and the CPU have the security extension enabled and
   the CPU is not secure

Reported-by: Chan Kim <ckim@etri.re.kr>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210510150016.24910-1-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_cpuif.c | 48 ++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 43ef1d7a840..81f94c7f4ad 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -1307,27 +1307,16 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
     GICv3CPUState *cs = icc_cs_from_env(env);
     int irq = value & 0xffffff;
     int grp;
+    bool is_eoir0 = ri->crm == 8;
 
-    if (icv_access(env, ri->crm == 8 ? HCR_FMO : HCR_IMO)) {
+    if (icv_access(env, is_eoir0 ? HCR_FMO : HCR_IMO)) {
         icv_eoir_write(env, ri, value);
         return;
     }
 
-    trace_gicv3_icc_eoir_write(ri->crm == 8 ? 0 : 1,
+    trace_gicv3_icc_eoir_write(is_eoir0 ? 0 : 1,
                                gicv3_redist_affid(cs), value);
 
-    if (ri->crm == 8) {
-        /* EOIR0 */
-        grp = GICV3_G0;
-    } else {
-        /* EOIR1 */
-        if (arm_is_secure(env)) {
-            grp = GICV3_G1;
-        } else {
-            grp = GICV3_G1NS;
-        }
-    }
-
     if (irq >= cs->gic->num_irq) {
         /* This handles two cases:
          * 1. If software writes the ID of a spurious interrupt [ie 1020-1023]
@@ -1340,8 +1329,35 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
         return;
     }
 
-    if (icc_highest_active_group(cs) != grp) {
-        return;
+    grp = icc_highest_active_group(cs);
+    switch (grp) {
+    case GICV3_G0:
+        if (!is_eoir0) {
+            return;
+        }
+        if (!(cs->gic->gicd_ctlr & GICD_CTLR_DS)
+            && arm_feature(env, ARM_FEATURE_EL3) && !arm_is_secure(env)) {
+            return;
+        }
+        break;
+    case GICV3_G1:
+        if (is_eoir0) {
+            return;
+        }
+        if (!arm_is_secure(env)) {
+            return;
+        }
+        break;
+    case GICV3_G1NS:
+        if (is_eoir0) {
+            return;
+        }
+        if (!arm_is_el3_or_mon(env) && arm_is_secure(env)) {
+            return;
+        }
+        break;
+    default:
+        g_assert_not_reached();
     }
 
     icc_drop_prio(cs, grp);
-- 
2.20.1


