Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A01454A4FDE
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:11:20 +0100 (CET)
Received: from localhost ([::1]:58750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEd18-0007g7-B0
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:11:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnZ-0004jm-M0
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:14 -0500
Received: from [2607:f8b0:4864:20::12b] (port=47044
 helo=mail-il1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcmx-0002bH-Gu
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:56:39 -0500
Received: by mail-il1-x12b.google.com with SMTP id e8so12374887ilm.13
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TqTK+KI3YcgM6rmeXyGDTKC+kTxHQQ89yzMVSFkLyKI=;
 b=tiWu/j6yeog5QGhlaMi9YcMXSIx0nlA9nvIGwSmyVz84woDTY78CCYolEQb8lKLD/P
 6wQR4lJMYE4oQS43TIvHsPkB20x5pXk6Tr2OVorQWLEPfX66x0Hwld7djmFiqGGo5aCP
 cv0++lv/+GyBZHiHzeqQ5N/ZlA5Wl6j7gw06/USqbmcVCzVCSRNgLLURadRu34temJRy
 BygVaeapNwR3CEzM6w56PlC1J52QKmls37Pr8oe5X2JsTDVP/4nqLxz3NdDsCUuOI7v2
 cpGsEqo/pyOebJqlisduuI592aBuzjQRDSNya9piHHvvrx/r0q9mDliPJzl6yD3JA/1s
 eg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TqTK+KI3YcgM6rmeXyGDTKC+kTxHQQ89yzMVSFkLyKI=;
 b=aFNN6RN93wv69ON//9bwOvGYXKmFmp1HDJZs76Fq8WXcEg4mxsireBseQRZrqWT6w5
 d6m5kCy9+qocFfAR/o7p9JMAtNqVXhoGDMu/kN4L6HAPId/xkEGdNnZr7rtP8QVp3/aL
 14M6AL187EwNEQK3AtYSKKXpVOBYLyYS6cR48m/c4BTDqOok30hsjUc/T/InuFk/rqHr
 lbQiX4m71/8LuUfvcQ2b+Wpp5t19/3OHfbHoObdvgknvKfxIDtqs3GKUGvSfzKreNdom
 JQrraf64iMz7BAlte0+ctttJgIHEDPYmT2P+nkvUOffzytCYzb02MA5tMCXwF8UAIwzK
 qE8Q==
X-Gm-Message-State: AOAM530ZOVbiTYgAhliGxJ140X9a2ywmae6qvIzVPfJNdA0KPGP4UeLq
 kLSXAIfmXG2s5Dcovw48YYSixQNGgUU8jg==
X-Google-Smtp-Source: ABdhPJyy4s/2X9smHpzk4azP4zgyWHUgywSO1/ICM4kJokeKbS9U4f2bTARAfbH5lji9Tjk5ckcrPw==
X-Received: by 2002:a05:6e02:198b:: with SMTP id
 g11mr13787306ilf.25.1643658993523; 
 Mon, 31 Jan 2022 11:56:33 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:33 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/40] bsd-user/arm/signal.c: Implement setup_sigframe_arch for
 arm
Date: Mon, 31 Jan 2022 12:55:59 -0700
Message-Id: <20220131195636.31991-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix the broken context setting for arm. FreeBSD's get_mcontext does not
fill in the vfp info. It's filled in in sigframe(). This corresponds to
the new setup_sigframe_arch which fills in mcontext, then adjusts it to
point to the vfp context in the sigframe and fills in that context as
well. Add pointer to where this code is done.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/signal.c | 50 ++++++++++++++++++++++++++++---------------
 1 file changed, 33 insertions(+), 17 deletions(-)

diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
index 1478f008d13..9026343b478 100644
--- a/bsd-user/arm/signal.c
+++ b/bsd-user/arm/signal.c
@@ -59,19 +59,31 @@ abi_long set_sigtramp_args(CPUARMState *env, int sig,
     return 0;
 }
 
+static abi_long get_vfpcontext(CPUARMState *env, abi_ulong frame_addr,
+                               struct target_sigframe *frame)
+{
+    /* see sendsig and get_vfpcontext in sys/arm/arm/exec_machdep.c */
+    target_mcontext_vfp_t *vfp = &frame->sf_vfp;
+    target_mcontext_t *mcp = &frame->sf_uc.uc_mcontext;
+
+    /* Assumes that mcp and vfp are locked */
+    for (int i = 0; i < 32; i++) {
+        vfp->mcv_reg[i] = tswap64(*aa32_vfp_dreg(env, i));
+    }
+    vfp->mcv_fpscr = tswap32(vfp_get_fpscr(env));
+    mcp->mc_vfp_size = tswap32(sizeof(*vfp));
+    mcp->mc_vfp_ptr = tswap32(frame_addr + ((uintptr_t)vfp - (uintptr_t)frame));
+    return 0;
+}
+
 /*
- * Compare to arm/arm/machdep.c get_mcontext()
+ * Compare to arm/arm/exec_machdep.c get_mcontext()
  * Assumes that the memory is locked if mcp points to user memory.
  */
 abi_long get_mcontext(CPUARMState *env, target_mcontext_t *mcp, int flags)
 {
-    int err = 0;
     uint32_t *gr = mcp->__gregs;
 
-    if (mcp->mc_vfp_size != 0 && mcp->mc_vfp_size != sizeof(target_mcontext_vfp_t)) {
-        return -TARGET_EINVAL;
-    }
-
     gr[TARGET_REG_CPSR] = tswap32(cpsr_read(env));
     if (flags & TARGET_MC_GET_CLEAR_RET) {
         gr[TARGET_REG_R0] = 0;
@@ -97,17 +109,21 @@ abi_long get_mcontext(CPUARMState *env, target_mcontext_t *mcp, int flags)
     gr[TARGET_REG_LR] = tswap32(env->regs[14]);
     gr[TARGET_REG_PC] = tswap32(env->regs[15]);
 
-    if (mcp->mc_vfp_size != 0 && mcp->mc_vfp_ptr != 0) {
-        /* see get_vfpcontext in sys/arm/arm/exec_machdep.c */
-        target_mcontext_vfp_t *vfp;
-        vfp = lock_user(VERIFY_WRITE, mcp->mc_vfp_ptr, sizeof(*vfp), 0);
-        for (int i = 0; i < 32; i++) {
-            vfp->mcv_reg[i] = tswap64(*aa32_vfp_dreg(env, i));
-        }
-        vfp->mcv_fpscr = tswap32(vfp_get_fpscr(env));
-        unlock_user(vfp, mcp->mc_vfp_ptr, sizeof(*vfp));
-    }
-    return err;
+    return 0;
+}
+
+/*
+ * Compare to arm/arm/exec_machdep.c sendsig()
+ * Assumes that the memory is locked if frame points to user memory.
+ */
+abi_long setup_sigframe_arch(CPUARMState *env, abi_ulong frame_addr,
+                             struct target_sigframe *frame, int flags)
+{
+    target_mcontext_t *mcp = &frame->sf_uc.uc_mcontext;
+
+    get_mcontext(env, mcp, flags);
+    get_vfpcontext(env, frame_addr, frame);
+    return 0;
 }
 
 /* Compare to arm/arm/exec_machdep.c set_mcontext() */
-- 
2.33.1


