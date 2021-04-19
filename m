Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B04364C5E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:51:41 +0200 (CEST)
Received: from localhost ([::1]:41676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYars-0004cI-Tt
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQS-00077h-C7
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:20 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:40531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQP-0002Uw-Pv
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:20 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id i3so11997807qvj.7
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/4C6soQQ2UF5+ReqTTpmW8mt3pgISFVYnIcWMzWl4kI=;
 b=aC/nVnJOB2h5gN7XGjlZgdlaBGJyO3ay0iyMDBGX9Ux9X6Y17AXNHTPctjp+t4F1HA
 AAdqXwmQD2z3iN0C6+F8/ckxY9GTm31Kf1zttTUILYHx5r2pdwem0hVsUte9vXNjMW/8
 TcUdlPWssRxTYxMOCb4zSI5EmuGxTHOVd00ePzXC6tXwJ7+JurLZH5N5NaziK+VY3tRS
 g/HaQPnHW86CqsKj4fdQ6STJ9bHCP/KNU+9mATwCHugvjYig1PraVK5LnuvuscQhFGg0
 00bm/pI4ghH8LRH5Hd4fjM6c8odPrwbcmkgtfSocVoClc0bbABc2NXDqzBXEocaBWehF
 IPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/4C6soQQ2UF5+ReqTTpmW8mt3pgISFVYnIcWMzWl4kI=;
 b=rsnU+avvFv0F9OUpHTBRu3B4G6acCUn+pvz8QGKaGg6WGpvA+iNoyCSBC3MU1pFZkd
 NTZqR/gnEYda5Rb0r9m2B9u9RDamq5ksVGAZy3Zt5U76lJUB6rEii4ztm+tdVf//CJt0
 PiSiISypwZVsUP9YUFYwgandPQxlJTgCfh6FCH3T7Ugo8xpg4bRcsNBTQGvtA2Tkncfz
 g+91YAI51wpR5fn3GCPZsO1Rb7FlbaqbLoKEH/qfX12Ny/Kg3m5hg1aDqhKbwBmFPynn
 oxmV/Iy8r1xMMkoJ7OnvvMpdBbbWxuehQWGQzdbscvv0TIf9wn/uBSf6u9FDxvFgLvd8
 qamA==
X-Gm-Message-State: AOAM5332waz7H5KysdGyO0vP9AfQDEsgw3uSUm+rotwH7BUmlTvIZBkg
 5CD6KkFmZK3a966Jst+2Qf/FRscotVJucEy2
X-Google-Smtp-Source: ABdhPJxeGesL2aPE2eo9QPdUU1dysDwt9SG873SmU7LlYNrDu0USnL8WooHd0gSpDN18Px+0ypoLgA==
X-Received: by 2002:a0c:a956:: with SMTP id z22mr22760803qva.22.1618863796699; 
 Mon, 19 Apr 2021 13:23:16 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/31] target/arm: Move TBFLAG_AM32 bits to the top
Date: Mon, 19 Apr 2021 13:22:34 -0700
Message-Id: <20210419202257.161730-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that these bits have been moved out of tb->flags,
where TBFLAG_ANY was filling from the top, move AM32
to fill from the top, and A32 and M32 to fill from the
bottom.  This means fewer changes when adding new bits.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a8da7c55a6..15104e1440 100644
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
2.25.1


