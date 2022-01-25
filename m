Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DAE49A219
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:44:42 +0100 (CET)
Received: from localhost ([::1]:57668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCAsz-00045l-O9
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:44:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAek-0001j0-S2
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:29:58 -0500
Received: from [2607:f8b0:4864:20::134] (port=44595
 helo=mail-il1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAej-0001KX-1a
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:29:58 -0500
Received: by mail-il1-x134.google.com with SMTP id i14so15512199ila.11
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QLlVji/Hrm3v4RO/pA+fXtXBOTfzZIpOWxrvHKyxFYs=;
 b=eWTcYnuDCqy1gf040EQWZK2UtWelRb0uOXJ7TwH+wYyC1h3Khla9QAK0vpMUphse4E
 KwxdjOo4mmEV2xC1cbAcKuunBAVKhuJN2LCY4SWbwhdh6zqHsbOGOgbJ6Mztzz1oQ2a8
 zAFu5b+TEI/OVLVF7yF/pU5bB41AuB4wdEuC6h+BfMwUj9dx4dxQz0GKDAcR33+CK8BR
 HxGRRm/kxMqeAGs5rVZRHYUsfjyaLZgZPtiIyu+R8+HKzFQdvjztkI7x3yiFegcaUEcY
 G8cRljRf/0n2jsssuiKO4gtAjACmvB51CGvJx2ytg5HrWWIPKQRi9sUY4dpaUEjT2oFm
 bUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QLlVji/Hrm3v4RO/pA+fXtXBOTfzZIpOWxrvHKyxFYs=;
 b=HbBev5s8qmZPJO/IXlovU8y1g9vLGIZPfZYr+voOIrsPYCHQSU3gPXBoDlI9B+5ND0
 von2fLwFeRA3U2NJ1Zf9ROfMuul7e0UNbUmaUnOwf4y9dGlkAtf9H7wK6et/Z7sQmaQ5
 nAaJfshjLXRyKrsh+X0xU24P0uw1id17Ed/qT/8uYxDKsEcIHkQcCT3tNmVgcCMcrwys
 hYBZ1JNIO8Vn13xW1w8FZ4WwgDikmeOi1+HYrQltDJ60L1kjeRIL8ZzI/d0Wz7OT9NlH
 ZM3D/smz/zMgyw7TsYXHtvJs/y7HGxVhiPBd25L7Hm5wB/MHe2DJGsozvRkKu0hFDd/e
 m2xw==
X-Gm-Message-State: AOAM531FAuFbP/LBbtv7cx+g94PxJy+AUKgPJz/jzGMnqN4c5V4bTkR9
 GpKULwmOYScSD/xNcxlLixZlOKs1oHsYdw==
X-Google-Smtp-Source: ABdhPJyxkaicv9Kfh+SL74lhwmCc3+z/2cyhmjJ/8bFKr7IyIQv4ncQGWv1hnJ3ZxD1kMnWViuSVUw==
X-Received: by 2002:a05:6e02:20ee:: with SMTP id
 q14mr10203513ilv.44.1643074195799; 
 Mon, 24 Jan 2022 17:29:55 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:29:55 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/40] bsd-user/arm/signal.c: Implement setup_sigframe_arch
 for arm
Date: Mon, 24 Jan 2022 18:29:10 -0700
Message-Id: <20220125012947.14974-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::134
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
---
 bsd-user/arm/signal.c               | 50 +++++++++++++++++++----------
 bsd-user/freebsd/target_os_signal.h |  2 +-
 2 files changed, 34 insertions(+), 18 deletions(-)

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
diff --git a/bsd-user/freebsd/target_os_signal.h b/bsd-user/freebsd/target_os_signal.h
index 7491629477a..43700d08f71 100644
--- a/bsd-user/freebsd/target_os_signal.h
+++ b/bsd-user/freebsd/target_os_signal.h
@@ -4,7 +4,7 @@
 #include "target_os_siginfo.h"
 #include "target_arch_signal.h"
 
-abi_long setup_sigframe_arch(CPUArchState *regs, abi_ulong frame_addr,
+abi_long setup_sigframe_arch(CPUArchState *env, abi_ulong frame_addr,
                              struct target_sigframe *frame, int flags);
 
 /* Compare to sys/signal.h */
-- 
2.33.1


