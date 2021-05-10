Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4733791D7
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 17:03:44 +0200 (CEST)
Received: from localhost ([::1]:43748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg7Rf-0003ky-3B
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 11:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg7OR-0001A0-EH
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:00:23 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg7OO-0004tz-Mi
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:00:23 -0400
Received: by mail-wr1-x435.google.com with SMTP id l2so16964191wrm.9
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 08:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K/FNff2LAuvSwfSN8kNH1SIRafomx8yjd+eXfYkv1a0=;
 b=y4O8BTsXHQwap60+p6j11NiScwk73IhhFX+F0vVFLwqQzU06QwwIo8+4Tf+idppOdn
 0sOj6JG3HDeQ6DY5XnnIf19X2v1uQBUaY3Q7xi+3RtnrjtBIMEADRcqPRVqUOFsL6mhS
 s0qxjuXPNoD9vbSRzOOHH4u+iJQtAB6hctqHlg6vWQc3h22O+ZGvY+j02l5zPJbzk/wE
 oyz1boXrW553tjIQcDMzHCUU5tTg6iC9Xi1bjYreJC9yr4PuqeSiJpVTHzXXF2jlKO7r
 hMJNdKapK+FexCcwTxA8vZaaoZxsa1kD52l8JcgRZXgsdGtzxoEw0+nk5tzXuQ220QsN
 Kk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K/FNff2LAuvSwfSN8kNH1SIRafomx8yjd+eXfYkv1a0=;
 b=KZSbeJtH2w4DfEyH9VYS5VcdhBzdafjcTJD+MjDotLfRNlJWe6tSmIzDRt/oGcFjfW
 a34ley/nvnvgymMuSSOMHKVAdVRJ8rU2xG0nHenjH9ZFEhpOoi8hgpY/Zrd2MyLTVoFs
 dumFCQS5uWTCfgIbJfZlGjTSCk1fFduy/Qq3tuwlVifQ6g9KOZnB3sRgSuZeG0z595a1
 lNOWOrTDlQTBSpw7L8xQCGddJALL9gax+xMttgln9kgSqM/GOHDjN9PVL0PGlF3f+Ijp
 +eNGGLAivCAC/4hYlR4AF7lDeEIxG2KtOoq8DzlgLZ1a8jsTruANEh5SyT5JNRozObh0
 z+Dw==
X-Gm-Message-State: AOAM532nTzYAHwX3GB0CT+SNyTUiMyH6lF9nscnTxg4evJyd5IfBXYTN
 ngN2z/JSnPNqJv54/FpRpNBBoQ==
X-Google-Smtp-Source: ABdhPJw0eJFXTPLLXNo6uPbV5BDqk0Vg5YC7/4UNPrBWVaN3p+K8XzXMHim70bGmyhUodhsIUO23NA==
X-Received: by 2002:adf:fa4c:: with SMTP id y12mr31165040wrr.393.1620658819088; 
 Mon, 10 May 2021 08:00:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p10sm22499619wrr.58.2021.05.10.08.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 08:00:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/intc/arm_gicv3_cpuif: Fix EOIR write access check logic
Date: Mon, 10 May 2021 16:00:16 +0100
Message-Id: <20210510150016.24910-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Chan Kim <ckim@etri.re.kr>
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


