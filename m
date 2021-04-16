Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20552362864
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:12:27 +0200 (CEST)
Received: from localhost ([::1]:35988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTtC-0000LS-7M
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTha-0003Tj-LX
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:28 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:36424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThI-0004H8-HC
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:26 -0400
Received: by mail-pl1-x62f.google.com with SMTP id z22so9349577plo.3
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cT3QO7VItfU2VrQhqJUimeA2gkAab7Ike6sYupHt1Ns=;
 b=OfrSZ+OMHSbYGaGqVds/CA0XLpHG8fQUkcOxqjtCIRNJvla5b0ZpPGx698A9KZv1RX
 9Lko5708APj3y2qm6pVVPSpJ2R2oqPApUidWVyeQcma9ZOrPreUoMXfmdsx4y5kRVofy
 1LhY1AHZHMY/vQwsFJdjaYwrn6akSs5DgehiaCX9Vdzpu8McgoLyWZtuT7N+u3UjE720
 K0jE4Pi6M8QMcgKYe8YE1aM8TN3Zszi40+D/DKI57nLhmUYxafJyUasLw4fGX/o/JDAc
 pVDU5DZQ0/6MwvVTVFnzSpmbQWmOpzu72LmX8ToH6/dzmZfFIGZ95/iFUrXe/BkFA50x
 jjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cT3QO7VItfU2VrQhqJUimeA2gkAab7Ike6sYupHt1Ns=;
 b=izBddjLQiF7uSquc4eLQJDrLNqdHfNnBlzsnBraPzjaYpVQTupHnO9cYw/H5o431Zx
 aMAKUE1PZEoM/4LiVtG/msE/Yu+sKTCQ+J9w0yLYoudGyKZjn8543JRUfRbvrw9dELo7
 i0N1ICTRQun+Ku7g4Y+opZwO0gO1+lfdT8hdm2Xsl7zh9W2keZ5HlwmO5kxZZMKluxgX
 tjChqMuEC1HQx/7zHnFJtIfzCPAuZyx4DaOyxJLHIwJQlyjXvsXmaL8xwkCay063OSj5
 6vp2FUOcLB/I7qgLMuRFrYrFf8gZlggqaf0GLTR+RABB9GX02xz3IcS80shXo9hPbYrG
 nunw==
X-Gm-Message-State: AOAM530cUQwR3/hTHHJwL2lIOV1Pj52tW8wvfaW9p17K5xGrP3b/pOjc
 L+LMSqXCvUru4ceLNmmOIkqYvci/8yu4BQ==
X-Google-Smtp-Source: ABdhPJwoVGCD50aSwUd7VIqxa+9tKmg+ZSiMJZIQgbBDPMDSy74cHSBWW/4rPqu1V2UUQ1sjeEMgew==
X-Received: by 2002:a17:90a:a22:: with SMTP id
 o31mr11466660pjo.127.1618599607144; 
 Fri, 16 Apr 2021 12:00:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/30] target/arm: Move TBFLAG_AM32 bits to the top
Date: Fri, 16 Apr 2021 11:59:36 -0700
Message-Id: <20210416185959.1520974-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that these bits have been moved out of tb->flags,
where TBFLAG_ANY was filling from the top, move AM32
to fill from the top, and A32 and M32 to fill from the
bottom.  This means fewer changes when adding new bits.

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


