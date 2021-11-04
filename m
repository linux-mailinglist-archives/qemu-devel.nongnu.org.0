Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F083445555
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:30:53 +0100 (CET)
Received: from localhost ([::1]:37220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1midlU-0004Dg-MS
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midO3-0007gI-1p
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:39 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:45672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNw-00013r-Ap
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:38 -0400
Received: by mail-io1-xd34.google.com with SMTP id q203so6867488iod.12
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 07:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/P38LtQec0uIYUAMSJlTTldDVAbwXFSq7552rd++NNs=;
 b=HyEneBZQm4PB4Xg7WVOYB5TPE7ysjAyCyRAWMFxIu3D6gJ24P7eAyK80OqGOtkb0w5
 cOYIoDWRY0nhmWWtO7Qjkqngi71EeFZoPm0evWjhNqr6K24ugcWj31+LHkdm0mo6TaA7
 DidkklqTnO8U4pkvCvQsrjlsCYcCKwKa78pHRYcyFHk8i0mN/caXHS/oHvfGnUOkf25p
 okePq4e+skQ+a0fw0dG+GFIcp6NGuHfYXBHZLA7My4FH9iyPeYUcrzgRYFFTO6qdWf+l
 GTtZO4r4hj05B7vSNNRi64OMgjTPPsf9KIbs+GQxSfy21MQ5XZnayIpxnosncxRburwM
 C9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/P38LtQec0uIYUAMSJlTTldDVAbwXFSq7552rd++NNs=;
 b=hJu1A83R2k52YWEL15aCrEdxxzqKCCkRcQri6lmj8biQt8zyAI7KgW5cfAtizbUNcT
 zow8fwe4Iper0w3E7ZVIzQXfL+Cqm4PSlH9Sla8BQwbEWScprJbn5HR9ykG1e6GJOXtU
 2J493+fJsDhFKgIywAaepcfCjQQGJdFuVYEAm0ZccykDn6CJUQ93s182Xgeb3rNOgeHN
 fJcQr/qSm/wAXaCKpgXXZYwbSnGoQlWKfpMTUDzCWYAUzJcUplig+5bvUZtTKCnnBRnZ
 ODh7B8nYjzzHiU6xn1yU1d2NDObrgCUHmKNt77Sriw9nd3Z25iUl4uMzKswE8qAU243X
 Z/kA==
X-Gm-Message-State: AOAM533Wh16eSoKbHmL+NbAesxSkDhnNoHn6TJzmFjAkfE3HZwBz1YpT
 FTGg2GGjCO/VKHiIviCJWkFY3VBUEPE/Sg==
X-Google-Smtp-Source: ABdhPJzlQ8eSa30BwHaOga3iU9opZvVyOglggKBKENXjfC0Y9w9laYtOpH8fQIE8ZOrG0GfM02EWQg==
X-Received: by 2002:a05:6602:1242:: with SMTP id
 o2mr25613626iou.183.1636034791046; 
 Thu, 04 Nov 2021 07:06:31 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:30 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/29] bsd-user/arm/target_arch_signal.h: arm set_mcontext
Date: Thu,  4 Nov 2021 08:05:30 -0600
Message-Id: <20211104140536.42573-24-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
 Kyle Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the machine context to the CPU state.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_signal.h | 75 +++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index ebb44d10dc..177617ea8b 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -171,4 +171,79 @@ static inline abi_long get_mcontext(CPUARMState *env, target_mcontext_t *mcp,
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


