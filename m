Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFA9339ABB
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 02:12:41 +0100 (CET)
Received: from localhost ([::1]:36894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKspc-00048Y-IQ
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 20:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKse6-0007P9-5h
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:46 -0500
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:45677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKsdw-0003UR-R1
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:45 -0500
Received: by mail-qv1-xf2c.google.com with SMTP id t16so5173937qvr.12
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 17:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bCT8Z895v2OzlUZ7cD3kW9yujJdvuk9uwCXjA4T3jIk=;
 b=PoYu7Hh+Ja2LhhPKIzk27oJFb/bWhHAUsFNMf+iXWfRYJXb7ZyxJNthM9BuhL67plC
 18juVCfRPwbsa30PmLtgU+A7mPRVWDkgqToadqizQlheYvGaXl2YuPLBxj/kLW+ALJGw
 ciQ+6SBd/zcifDcLWUnKm8ApYiCP024aCSNIx9KJxJCF7Yx5GMVgQP1pIfKn2E5GALga
 AJVSZZDWlBrSnrzj4h5Aog3DbaGknrZLzZEt8oZk4CSbfHfvOAGc3I7yVoA7NkxDG9Gh
 RMzbk9oot5v2ewe/e4zQNEFGGKy1jQrq8QooAJsONVspeGxWo4lLY8JSCrlXi823+wOI
 UHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bCT8Z895v2OzlUZ7cD3kW9yujJdvuk9uwCXjA4T3jIk=;
 b=IvOaoO8pN7KUaR4Vip0rptlFOeNuV1dYNfu9wQultY7WH/6a0w0u7kqxjt0mr0zUuG
 5A666x8T6h8NC5k4rtmJtr4Ni0mN1OhrWatft/7rePphLZvPqNnqXPIB3a67Q+LH0ZRB
 +48EYkkEAPvjkjij+nvEfy1RIect+AxC6mVceDz4NKJI2R7yTW4RJ5CTJATUANcGC0+p
 yGGfFPzYcXRVvqloNlhcKi31UQ0GPiKeE9pUD39c4nk+GNScdNKbpp/o1Upd4urIB5S2
 Ke6ru/teB7+8IOeWIPYc2/3UfykbPoKkOcLS0EaN3vY6S5qpH9hzm9sO2UdxBZXFaFWD
 7Grg==
X-Gm-Message-State: AOAM533x2LhB7xtLIIHHKZji/oOs9bTRUrvXEuD4sL+w13OJS8yAvMb7
 kHfcFmav7QwHQ9C5x9iBEntFpQc93Ph+R1kt
X-Google-Smtp-Source: ABdhPJyDWXyVYOlL/Uu9B0/xBoAN1W4UUIUYYhHOcEDM8mLFw3oLRkcyA/RXc+SrztXP2pck+7knZw==
X-Received: by 2002:a05:6214:2b06:: with SMTP id
 jx6mr951565qvb.48.1615597235836; 
 Fri, 12 Mar 2021 17:00:35 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l129sm5602078qkd.76.2021.03.12.17.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 17:00:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/15] target/ppc: Remove MSR_SA and MSR_AP from hflags
Date: Fri, 12 Mar 2021 19:00:15 -0600
Message-Id: <20210313010018.819153-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210313010018.819153-1-richard.henderson@linaro.org>
References: <20210313010018.819153-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
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
Cc: ivan@vmfacility.fr, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
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


