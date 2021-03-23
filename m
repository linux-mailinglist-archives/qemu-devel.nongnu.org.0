Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA16346932
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:38:39 +0100 (CET)
Received: from localhost ([::1]:35600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmrO-0005YT-K3
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOm0y-0008PB-HZ
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:44:28 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36]:45749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOm0V-0003iv-0E
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:44:28 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 n6-20020a4ac7060000b02901b50acc169fso5176859ooq.12
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 11:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3FXi8snd//6e3eo194okSdd2MkYemigNkupkO7nrNNk=;
 b=yCF3E+0Dv0xrsHmfPUUMtN8UHDFFGLfLjoKwiA02xWM9tTre+sb3pcSXwCGwSTziG8
 hX3nwXzOqQ5GoThNfaR4WGqErsj2c8wOBbQI6DBERIhcAP3fMUuQ4fX/Pi1tDgxRzzPT
 PhlD+FGWUiwQ6IKsZObmkO1Jp+TkOtlPCBpQLohNe6qnBiu9uFRQCYrvNMW52xb86Qy8
 12eJ7Dlglm3yTYl2COnzK89xYhcDmZAwT6wzUWjN5UoMsxdpa1VOVdUoYM1ARPdD3D5i
 b/3wpFbNTlTqEMARy/lxHQpbHTgvTwOuJSqVrGlqdBzm6lMNxm8GrSQUNatHLQJ4x2aZ
 bsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3FXi8snd//6e3eo194okSdd2MkYemigNkupkO7nrNNk=;
 b=H5jC79IrqFsSj0LtQwOgKTbMN5Tua8IhpJKi0xomX3lrYl7YJGL9Mql0OoI7KBDOdv
 21jln8XZCYvXdvwQWQiERrK1PtGM2lQNuz+C+nICRgYdhMtVa5N5/Qvhz0scdohuT8e8
 aj1NzjUKpKrP37Dh36KvjhqAuZshEC+NN/u/zaaoZ5kBaDjWqkn+l16ASMo8yvx5+Frl
 wDpqt8NR5qPql3P38GA+T/wEa3jpKbXwWFIhoz8z1gxcAFf4PvjsuBoH08szN6uGgJTS
 1Cvjc32dZAu/heLndq7fvZCHMLv1l0Zg5L/QeEt7vFJBVDvxirc9GmDXA0m58JzyKLOy
 B+dA==
X-Gm-Message-State: AOAM531f4MD45EBo3TAbs0CCZ9SMhjYUGAqgp7JJ1i5stw7C4vTGx3Lu
 X25vbrf+NI8WNMPDywDNzWL3ksdl89u3f/UL
X-Google-Smtp-Source: ABdhPJxZOTGAWNQn05C5gp6R99azuMcOHCfkeBayZcX2emT0Z5DE3vVTBxbK7zOWGF2X5CecfFXa3g==
X-Received: by 2002:a4a:4958:: with SMTP id z85mr4900641ooa.3.1616525032684;
 Tue, 23 Mar 2021 11:43:52 -0700 (PDT)
Received: from localhost.localdomain (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id x23sm3902825ood.28.2021.03.23.11.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 11:43:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/10] target/ppc: Remove MSR_SA and MSR_AP from hflags
Date: Tue, 23 Mar 2021 12:43:37 -0600
Message-Id: <20210323184340.619757-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323184340.619757-1-richard.henderson@linaro.org>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc36.google.com
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nothing within the translator -- or anywhere else for that
matter -- checks MSR_SA or MSR_AP on the 602.  This may be
a mistake.  However, for the moment, we need not record these
bits in hflags.

This allows us to simplify HFLAGS_VSX computation by moving
it to overlap with MSR_VSX.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h         |  4 +---
 target/ppc/helper_regs.c | 10 ++++------
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 3c28ddb331..2f72f83ee3 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -600,14 +600,12 @@ enum {
     HFLAGS_DR = 4,   /* MSR_DR */
     HFLAGS_IR = 5,   /* MSR_IR */
     HFLAGS_SPE = 6,  /* from MSR_SPE if cpu has SPE; avoid overlap w/ MSR_VR */
-    HFLAGS_VSX = 7,  /* from MSR_VSX if cpu has VSX; avoid overlap w/ MSR_AP */
     HFLAGS_TM = 8,   /* computed from MSR_TM */
     HFLAGS_BE = 9,   /* MSR_BE -- from elsewhere on embedded ppc */
     HFLAGS_SE = 10,  /* MSR_SE -- from elsewhere on embedded ppc */
     HFLAGS_FP = 13,  /* MSR_FP */
     HFLAGS_PR = 14,  /* MSR_PR */
-    HFLAGS_SA = 22,  /* MSR_SA */
-    HFLAGS_AP = 23,  /* MSR_AP */
+    HFLAGS_VSX = 23, /* MSR_VSX if cpu has VSX */
     HFLAGS_VR = 25,  /* MSR_VR if cpu has VRE */
 };
 
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index f85bb14d1d..dd3cd770a3 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -99,11 +99,8 @@ void hreg_compute_hflags(CPUPPCState *env)
     QEMU_BUILD_BUG_ON(MSR_DR != HFLAGS_DR);
     QEMU_BUILD_BUG_ON(MSR_IR != HFLAGS_IR);
     QEMU_BUILD_BUG_ON(MSR_FP != HFLAGS_FP);
-    QEMU_BUILD_BUG_ON(MSR_SA != HFLAGS_SA);
-    QEMU_BUILD_BUG_ON(MSR_AP != HFLAGS_AP);
     msr_mask = ((1 << MSR_LE) | (1 << MSR_PR) |
-                (1 << MSR_DR) | (1 << MSR_IR) |
-                (1 << MSR_FP) | (1 << MSR_SA) | (1 << MSR_AP));
+                (1 << MSR_DR) | (1 << MSR_IR) | (1 << MSR_FP));
 
     if (ppc_flags & POWERPC_FLAG_HID0_LE) {
         /*
@@ -143,8 +140,9 @@ void hreg_compute_hflags(CPUPPCState *env)
         QEMU_BUILD_BUG_ON(MSR_VR != HFLAGS_VR);
         msr_mask |= 1 << MSR_VR;
     }
-    if ((ppc_flags & POWERPC_FLAG_VSX) && (msr & (1 << MSR_VSX))) {
-        hflags |= 1 << HFLAGS_VSX;
+    if (ppc_flags & POWERPC_FLAG_VSX) {
+        QEMU_BUILD_BUG_ON(MSR_VSX != HFLAGS_VSX);
+        msr_mask |= 1 << MSR_VSX;
     }
     if ((ppc_flags & POWERPC_FLAG_TM) && (msr & (1ull << MSR_TM))) {
         hflags |= 1 << HFLAGS_TM;
-- 
2.25.1


