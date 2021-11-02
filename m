Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D804439A5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:26:44 +0100 (CET)
Received: from localhost ([::1]:55234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi3Ax-00058J-T1
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f6-0007dm-UN
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:48 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:35538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f3-0002tL-Ii
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:48 -0400
Received: by mail-il1-x12a.google.com with SMTP id w15so680094ill.2
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X7DlPXDNylgG9L9OMjAZVuV6McHnJtmGCnJP66iZ/V0=;
 b=0GrDpzGzUnL2q7QcKNjyFF3psE1nmF5w4V9g67GR2ZcHRVnx8cOsLDkI+wm+oEIgOH
 lDixzT9W5OD2wpSzzdyLLyT45r6zn1pHs2AtKqhn7EGI/6btIxbCllwyAMrPo3CzgQip
 PgGTUmPwX2ZXPWWNmiIUq8Zsa3ewVNvIxezzYbx++rpAveQPV+vOOV4vddPDHVz1uA1Z
 /DeML1s/xzKsRA3QaeHWk/LZlyl4wsi6s/w8dqCvcfRf6sQyVUfo6Ag9sQhoI/A/tnsq
 cx5gMCKlr80AGSL0PQ9b73CVaWYApZAT9NBqAcP65cjDp2KrB4mNLwLJhXjn07OdqeEN
 +y/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X7DlPXDNylgG9L9OMjAZVuV6McHnJtmGCnJP66iZ/V0=;
 b=CQQut+v8AJDglITIr+sb60XfR2G8YG/I7JpUVkQfnSDsKIjAzf+MOcJ5tp/nLoqTfD
 iR/kWWezCZ+J5t2gRg+5SeEjbVGCakq237YJ04EXUlm7vRcDusTegca5Z7EIXfGGWuDc
 ZR2vA2m7ofRRDkoVnSnbyKPYrrx+cNHB0oEwfv2ror7KX72xIpvPVEeM8NRINjiup/Uc
 x730NE0ELeAY3Ppay41U9b2GXAiLtc0vvcAOBWoYL46MWdvzVwih6btDct+07Aqgrq5t
 yG0mkUxLqznO3JMG6AC5XtP+fY7KUzDYG/OAGReHHugBPLmtI4i6dLYAFJ79w7IfoZg+
 GIKQ==
X-Gm-Message-State: AOAM530s5gveEgzPxHE2yjo7IWFjt/zkmgFYB3xaE3jDo0djcyg0xs3X
 h6SFrXJXc/5lvvJERKG1PPjlWXotuxPwIQ==
X-Google-Smtp-Source: ABdhPJwnVMcNJE/vEy3wejnae1l4MChnUEKQjYo18du4HPTjIW2as+8C6A8BlLQ76iElKdK1ROUlRw==
X-Received: by 2002:a05:6e02:1a4f:: with SMTP id
 u15mr5506251ilv.115.1635893624300; 
 Tue, 02 Nov 2021 15:53:44 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:43 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/30] bsd-user/arm/target_arch_signal.h: arm set_mcontext
Date: Tue,  2 Nov 2021 16:52:42 -0600
Message-Id: <20211102225248.52999-25-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12a;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the machine context to the CPU state.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_signal.h | 75 +++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index b42d08402f..3b2f56ffab 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -179,4 +179,79 @@ static inline abi_long get_mcontext(CPUARMState *env, target_mcontext_t *mcp,
     return err;
 }
 
+/* Compare to arm/arm/exec_machdep.c set_mcontext() */
+static inline abi_long set_mcontext(CPUARMState *env, target_mcontext_t *mcp,
+        int srflag)
+{
+    int err = 0;
+    const uint32_t *gr = mcp->__gregs;
+    uint32_t cpsr, ccpsr = cpsr_read(env);
+    uint32_t fpscr;
+
+    cpsr = tswap32(gr[TARGET_REG_CPSR]);
+    /*
+     * Only allow certain bits to change, reject attempted changes to non-user
+     * bits. In addition, make sure we're headed for user mode and none of the
+     * interrupt bits are set.
+     */
+    if ((ccpsr & ~CPSR_USER) != (cpsr & ~CPSR_USER)) {
+        return -TARGET_EINVAL;
+    }
+    if ((cpsr & CPSR_M) != ARM_CPU_MODE_USR ||
+        (cpsr & (CPSR_I | CPSR_F)) != 0) {
+        return -TARGET_EINVAL;
+    }
+
+    /*
+     * Make sure that we either have no vfp, or it's the correct size.
+     * FreeBSD just ignores it, though, so maybe we'll need to adjust
+     * things below instead.
+     */
+    if (mcp->mc_vfp_size != 0 && mcp->mc_vfp_size != sizeof(target_mcontext_vfp_t)) {
+        return -TARGET_EINVAL;
+    }
+    /*
+     * Make sure T mode matches the PC's notion of thumb mode, although
+     * FreeBSD lets the processor sort this out, so we may need remove
+     * this check, or generate a signal...
+     */
+    if (!!(tswap32(gr[TARGET_REG_PC]) & 1) != !!(cpsr & CPSR_T)) {
+        return -TARGET_EINVAL;
+    }
+
+    env->regs[0] = tswap32(gr[TARGET_REG_R0]);
+    env->regs[1] = tswap32(gr[TARGET_REG_R1]);
+    env->regs[2] = tswap32(gr[TARGET_REG_R2]);
+    env->regs[3] = tswap32(gr[TARGET_REG_R3]);
+    env->regs[4] = tswap32(gr[TARGET_REG_R4]);
+    env->regs[5] = tswap32(gr[TARGET_REG_R5]);
+    env->regs[6] = tswap32(gr[TARGET_REG_R6]);
+    env->regs[7] = tswap32(gr[TARGET_REG_R7]);
+    env->regs[8] = tswap32(gr[TARGET_REG_R8]);
+    env->regs[9] = tswap32(gr[TARGET_REG_R9]);
+    env->regs[10] = tswap32(gr[TARGET_REG_R10]);
+    env->regs[11] = tswap32(gr[TARGET_REG_R11]);
+    env->regs[12] = tswap32(gr[TARGET_REG_R12]);
+
+    env->regs[13] = tswap32(gr[TARGET_REG_SP]);
+    env->regs[14] = tswap32(gr[TARGET_REG_LR]);
+    env->regs[15] = tswap32(gr[TARGET_REG_PC]);
+    if (mcp->mc_vfp_size != 0 && mcp->mc_vfp_ptr != NULL) {
+        /* see set_vfpcontext in sys/arm/arm/exec_machdep.c */
+        target_mcontext_vfp_t *vfp = (target_mcontext_vfp_t *)mcp->mc_vfp_ptr;
+        for (int i = 0; i < 32; i++) {
+            *aa32_vfp_dreg(env, i) = tswap64(vfp->mcv_reg[i]);
+        }
+        fpscr =  tswap32(vfp->mcv_fpscr);
+        vfp_set_fpscr(env, fpscr);
+        /*
+         * linux-user sets fpexc, fpinst and fpinst2, but these aren't in
+         * FreeBSD's mcontext, what to do?
+         */
+    }
+    cpsr_write(env, cpsr, CPSR_USER | CPSR_EXEC, CPSRWriteByInstr);
+
+    return err;
+}
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.0


