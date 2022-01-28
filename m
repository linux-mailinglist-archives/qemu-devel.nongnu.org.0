Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 294194A0441
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:34:36 +0100 (CET)
Received: from localhost ([::1]:36382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDalH-0003YY-0H
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:34:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDaf1-0008Ts-Io
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:07 -0500
Received: from [2607:f8b0:4864:20::132] (port=42581
 helo=mail-il1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDaez-0001XP-GY
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:07 -0500
Received: by mail-il1-x132.google.com with SMTP id u5so6739919ilq.9
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TqTK+KI3YcgM6rmeXyGDTKC+kTxHQQ89yzMVSFkLyKI=;
 b=Hd3Wq8I+R5yACIFm7mqb87NukpSthJMdFfp6JthvEn/Dub3rMSoh+iNY3ckKygSIzx
 W/ohQCfHMM6Wn32PkYR6fVznnDTt/rBH9hEQHFC3r39VCxpXMMzMExZRcFceUEJO2Sax
 lz9FrJMNTiDdGL4pvKNzTFnvBFXLCZc4H47pOXZhd4NhS0wJpJGM3hXkBmN3CgdPXW2c
 IXjPde9fa5OdZvxQqFJJ02Ilmd6whKUmmY8Ak5SpWkzL1steoj7QcCZ08csnC+NXfcgo
 XRZV6ixxJVIFm8MPZvEuYYNZaxYx/WQZ81awvR3JKHBiPMFvX6RPvlWvU2h00Eacu+pV
 pUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TqTK+KI3YcgM6rmeXyGDTKC+kTxHQQ89yzMVSFkLyKI=;
 b=jgGEMM+793gSbPDzVfF5IzlokbwEd5/v2BrUrFpCNwWHZYx6zfV8t1GeJ/Ok5l3Lob
 WK4Tbsn4VzT/myklyteHQeUQ00zer19TccjZfOs2dsB5WRVto00QUY+g9+p6dEGUpG/i
 IDIrW/WFpi2EYQqz70J09H0hNz3S94T1E2J3g4Nl5mSO0wNbvIGrUOB2NKBSJrhN9Srz
 ywzWmz9eNUp5mBXJFujblRXaje7tIVBTfh6ONwkPNAsZeB3j6X6em68Y6X7hXcN8Mv24
 oDInyxqyhb9GoqMrP78FgLjycdPwFnU6bvxgq9sDVudHg42WSHRCpt47tODfu5Lj8Uz4
 v/Lg==
X-Gm-Message-State: AOAM533NPTm8fMTpyO7iDJb6BWXGCHsuJz4iYrJEofFFkiQ70dM4yrWx
 kqZaQa5RNNRAzXW72st8kL1XZB9+u3KENg==
X-Google-Smtp-Source: ABdhPJy4uqiMyXj5pnSF0x6xhE1ZvN6lLGENU2mPcoZr90Ou5PpG7odY9SQs7zIpCVL5xqtZw1NCwQ==
X-Received: by 2002:a92:c569:: with SMTP id b9mr2686601ilj.132.1643412484109; 
 Fri, 28 Jan 2022 15:28:04 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:03 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/40] bsd-user/arm/signal.c: Implement setup_sigframe_arch
 for arm
Date: Fri, 28 Jan 2022 16:27:28 -0700
Message-Id: <20220128232805.86191-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::132
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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


