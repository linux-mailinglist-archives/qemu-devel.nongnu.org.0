Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DAC36F8A9
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:48:28 +0200 (CEST)
Received: from localhost ([::1]:34434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQhA-0006Ta-0c
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQU5-0007cA-BM
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:57 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:42728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQU3-0001IZ-2Y
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:57 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 4-20020a05600c26c4b0290146e1feccd8so1394174wmv.1
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XelyLsE4aJXExt//pcxleFAQzG0HTjHRhGLlyhd1Bgo=;
 b=xoNA/8WPXoO3+WMM3hfIGFi4J2+DkEhSavVetUJpWp9v4V40JKQxpO9kzHv/Zj3PdF
 pTT2BbPhLwp3Ziy4fF9qQyIVbFXuVlAsEa4Z96zvlwzixcsOdV3fV9WqehXEJeEaKg/F
 /qjhrp1gpDo8U2B73CrP1LD/cAcmc/EFveFrXHYitOrfGo/1z5uhW8kWOHq/xNxVkNtu
 285rANW6F4ciVAs5VgV+WF8C5yVRfJm77ddlUe9LQuVyKJwzVwx2r1vVU6PLc1yitmT7
 1dgg6D5nPUsD3WSoZGVR9A4nMGTxHx8XnmhnAdsAzZAk/PzkARBNgwa3DPIGOExmGomO
 2iAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XelyLsE4aJXExt//pcxleFAQzG0HTjHRhGLlyhd1Bgo=;
 b=EqMTTJ4tuj1cEdOmBnsos1SCulJDrDOkwOYSEfFQ5bCOScR7pJc5ulXZQp+7YJsPol
 433k7BXVljc3amq1O/AAazVjJNzNim9B4luYF4FTYwAJg8C8g20L3nH5ZMZ7TkHSo767
 hviHurwld7YiELEGFqfo8YnmWgkBIYe8WcmX13KxObXmimEERt7Z3gLSEE8YsloWQhae
 Dfoc9Fj3K7/H2Lp65yqInVzm8RJAOKnSe6zq2lJuJEqThyzCN5Smtcnk8efzH0xts1od
 eNRZqLjv3YCAoZWOM+8grE2vYVKmanhv61MCVHDo2csmQJdgF9kmjmGZINoRdgo4L5Qm
 RO8A==
X-Gm-Message-State: AOAM531hSb6J4ZOV6auJ6fcq7pQIB1mZ6Mi5uyVq32BzoXmbl5IYRrsX
 l/FvfboLisoeHpZ99roO8XPolGU54Hgn48FA
X-Google-Smtp-Source: ABdhPJzrVOex7zkkFbd9WBxhwLaS+6OAZrrIeT+axVLw+BXwZiTmnIZNBGyDfin7KYR8K62XwtwSfA==
X-Received: by 2002:a05:600c:35d1:: with SMTP id
 r17mr5321073wmq.71.1619778893417; 
 Fri, 30 Apr 2021 03:34:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.34.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:34:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/43] target/arm: Move TBFLAG_AM32 bits to the top
Date: Fri, 30 Apr 2021 11:34:12 +0100
Message-Id: <20210430103437.4140-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
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

From: Richard Henderson <richard.henderson@linaro.org>

Now that these bits have been moved out of tb->flags,
where TBFLAG_ANY was filling from the top, move AM32
to fill from the top, and A32 and M32 to fill from the
bottom.  This means fewer changes when adding new bits.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210419202257.161730-9-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a8da7c55a6b..15104e14409 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3395,13 +3395,13 @@ typedef ARMCPU ArchCPU;
  *
  * The bits for 32-bit A-profile and M-profile partially overlap:
  *
- *  18             9              0
- * +----------------+--------------+
- * |   TBFLAG_A32   |              |
- * +-----+----------+  TBFLAG_AM32 |
- * |     |TBFLAG_M32|              |
- * +-----+----------+--------------+
- *     14          9              0
+ *  31         23         11 10             0
+ * +-------------+----------+----------------+
+ * |             |          |   TBFLAG_A32   |
+ * | TBFLAG_AM32 |          +-----+----------+
+ * |             |                |TBFLAG_M32|
+ * +-------------+----------------+----------+
+ *  31         23                5 4        0
  *
  * Unless otherwise noted, these bits are cached in env->hflags.
  */
@@ -3418,44 +3418,44 @@ FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 20, 2)
 /*
  * Bit usage when in AArch32 state, both A- and M-profile.
  */
-FIELD(TBFLAG_AM32, CONDEXEC, 0, 8)      /* Not cached. */
-FIELD(TBFLAG_AM32, THUMB, 8, 1)         /* Not cached. */
+FIELD(TBFLAG_AM32, CONDEXEC, 24, 8)      /* Not cached. */
+FIELD(TBFLAG_AM32, THUMB, 23, 1)         /* Not cached. */
 
 /*
  * Bit usage when in AArch32 state, for A-profile only.
  */
-FIELD(TBFLAG_A32, VECLEN, 9, 3)         /* Not cached. */
-FIELD(TBFLAG_A32, VECSTRIDE, 12, 2)     /* Not cached. */
+FIELD(TBFLAG_A32, VECLEN, 0, 3)         /* Not cached. */
+FIELD(TBFLAG_A32, VECSTRIDE, 3, 2)     /* Not cached. */
 /*
  * We store the bottom two bits of the CPAR as TB flags and handle
  * checks on the other bits at runtime. This shares the same bits as
  * VECSTRIDE, which is OK as no XScale CPU has VFP.
  * Not cached, because VECLEN+VECSTRIDE are not cached.
  */
-FIELD(TBFLAG_A32, XSCALE_CPAR, 12, 2)
-FIELD(TBFLAG_A32, VFPEN, 14, 1)         /* Partially cached, minus FPEXC. */
-FIELD(TBFLAG_A32, SCTLR__B, 15, 1)      /* Cannot overlap with SCTLR_B */
-FIELD(TBFLAG_A32, HSTR_ACTIVE, 16, 1)
+FIELD(TBFLAG_A32, XSCALE_CPAR, 5, 2)
+FIELD(TBFLAG_A32, VFPEN, 7, 1)         /* Partially cached, minus FPEXC. */
+FIELD(TBFLAG_A32, SCTLR__B, 8, 1)      /* Cannot overlap with SCTLR_B */
+FIELD(TBFLAG_A32, HSTR_ACTIVE, 9, 1)
 /*
  * Indicates whether cp register reads and writes by guest code should access
  * the secure or nonsecure bank of banked registers; note that this is not
  * the same thing as the current security state of the processor!
  */
-FIELD(TBFLAG_A32, NS, 17, 1)
+FIELD(TBFLAG_A32, NS, 10, 1)
 
 /*
  * Bit usage when in AArch32 state, for M-profile only.
  */
 /* Handler (ie not Thread) mode */
-FIELD(TBFLAG_M32, HANDLER, 9, 1)
+FIELD(TBFLAG_M32, HANDLER, 0, 1)
 /* Whether we should generate stack-limit checks */
-FIELD(TBFLAG_M32, STACKCHECK, 10, 1)
+FIELD(TBFLAG_M32, STACKCHECK, 1, 1)
 /* Set if FPCCR.LSPACT is set */
-FIELD(TBFLAG_M32, LSPACT, 11, 1)                 /* Not cached. */
+FIELD(TBFLAG_M32, LSPACT, 2, 1)                 /* Not cached. */
 /* Set if we must create a new FP context */
-FIELD(TBFLAG_M32, NEW_FP_CTXT_NEEDED, 12, 1)     /* Not cached. */
+FIELD(TBFLAG_M32, NEW_FP_CTXT_NEEDED, 3, 1)     /* Not cached. */
 /* Set if FPCCR.S does not match current security state */
-FIELD(TBFLAG_M32, FPCCR_S_WRONG, 13, 1)          /* Not cached. */
+FIELD(TBFLAG_M32, FPCCR_S_WRONG, 4, 1)          /* Not cached. */
 
 /*
  * Bit usage when in AArch64 state
-- 
2.20.1


