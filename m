Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D2D33C647
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:02:03 +0100 (CET)
Received: from localhost ([::1]:51206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsTZ-0002mF-NG
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEe-0007Vg-Bw
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:36 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:34962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEb-0001gV-SR
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:36 -0400
Received: by mail-oi1-x229.google.com with SMTP id u6so28161086oic.2
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bCT8Z895v2OzlUZ7cD3kW9yujJdvuk9uwCXjA4T3jIk=;
 b=S/l/QMh7JpW4qnOefRCyNXvksyo8S217mnklRgwRikpgnXDQydBS0T0GeGdqp/IzJh
 NKAznWgRc0arFaroB3NaXS0bGpwBfO4VQM5oxciFJGmFHXJsRRthu0qDObSoWqmbKdN5
 jVGrxJwPM3nmf1RXMDhWjoiw7u+ObDcte2JOUKmyk/uxaQNyaLvZT3oMG2R74aLDvSEg
 7sJbFzGPEerrce9CUNMapXG3qIzy3Ey0HBe2kSHe3nrrDf3BC+Qib2c96Y2jq47OxiN6
 QqOWHei4eQ+DYNAA0SMvzVrHABsPZdxAFe6e8Wbw13itqAFFEQXRKTXkoz31pkB0DO7G
 k+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bCT8Z895v2OzlUZ7cD3kW9yujJdvuk9uwCXjA4T3jIk=;
 b=uKCgz+oDlA4c/HIeXCZQsbFLU1sblCdkZi5pbm6tdUvIt8RgX9LScDgx+9vk/jW22M
 Rh3K+aOi0m5xk+uJFwGau/mVqhFyrVM0l4rfy+eZZxzYAkJdbBVcNPsg0UFLNszE9x+H
 hpylq+FE5Xoh3PnjV5uQjrJuVseDWL1Ym9iL+JFJMV3Agw5rKpsitP/iC0c4lCARfQom
 J0mEv34wuRQVHgk6oR9Dk6LB+x30jBXCNA0j98/kIhwaQ27bNyprC7QMOrgU+dgX1JXs
 hh4NYQqfCDH9TJy5YAu1iVM5Q038ymPwnWyLHi92Ja8cqGOOD+xTWiHv7a88vYKCVb13
 l37A==
X-Gm-Message-State: AOAM533e3Pilj0ncVux5jgHx0GE9/iAx8S5cTvy9btBO2sHv3rXodWCx
 CyawwR0A6SJfiT0ZHDkIMk3UGB861884lk3K
X-Google-Smtp-Source: ABdhPJyw4xp6BwoPdL1/z+0pPPUNrsM7ngpWey3PABSqi0OCU3hx0chDwTFeN+FLbrVBYuAOgTxrYA==
X-Received: by 2002:a54:4413:: with SMTP id k19mr387861oiw.72.1615833992777;
 Mon, 15 Mar 2021 11:46:32 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id o25sm7519851otk.11.2021.03.15.11.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 11:46:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/17] target/ppc: Remove MSR_SA and MSR_AP from hflags
Date: Mon, 15 Mar 2021 12:46:10 -0600
Message-Id: <20210315184615.1985590-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315184615.1985590-1-richard.henderson@linaro.org>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h         | 4 +---
 target/ppc/helper_regs.c | 7 +++----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 07a4331eec..23ff16c154 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -599,14 +599,12 @@ enum {
     HFLAGS_DR = 4,   /* MSR_DR */
     HFLAGS_IR = 5,   /* MSR_IR */
     HFLAGS_SPE = 6,  /* from MSR_SPE if cpu has SPE; avoid overlap w/ MSR_VR */
-    HFLAGS_VSX = 7,  /* from MSR_VSX if cpu has VSX; avoid overlap w/ MSR_AP */
     HFLAGS_TM = 8,   /* computed from MSR_TM */
     HFLAGS_BE = 9,   /* MSR_BE -- from elsewhere on embedded ppc */
     HFLAGS_SE = 10,  /* MSR_SE -- from elsewhere on embedded ppc */
     HFLAGS_GTSE = 11, /* computed from SPR_LPCR[GTSE] */
     HFLAGS_FP = 13,  /* MSR_FP */
-    HFLAGS_SA = 22,  /* MSR_SA */
-    HFLAGS_AP = 23,  /* MSR_AP */
+    HFLAGS_VSX = 23, /* MSR_VSX if cpu has VSX */
     HFLAGS_VR = 25,  /* MSR_VR if cpu has VRE */
 };
 
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 8479789e24..d62921c322 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -95,8 +95,7 @@ void hreg_compute_hflags(CPUPPCState *env)
 
     /* Some bits come straight across from MSR. */
     msr_mask = ((1 << MSR_LE) | (1 << MSR_PR) |
-                (1 << MSR_DR) | (1 << MSR_IR) |
-                (1 << MSR_FP) | (1 << MSR_SA) | (1 << MSR_AP));
+                (1 << MSR_DR) | (1 << MSR_IR) | (1 << MSR_FP));
 
     if (ppc_flags & POWERPC_FLAG_HID0_LE) {
         /*
@@ -133,8 +132,8 @@ void hreg_compute_hflags(CPUPPCState *env)
     if (ppc_flags & POWERPC_FLAG_VRE) {
         msr_mask |= 1 << MSR_VR;
     }
-    if ((ppc_flags & POWERPC_FLAG_VSX) && (msr & (1 << MSR_VSX))) {
-        hflags |= 1 << HFLAGS_VSX;
+    if (ppc_flags & POWERPC_FLAG_VSX) {
+        msr_mask |= 1 << MSR_VSX;
     }
     if ((ppc_flags & POWERPC_FLAG_TM) && (msr & (1ull << MSR_TM))) {
         hflags |= 1 << HFLAGS_TM;
-- 
2.25.1


