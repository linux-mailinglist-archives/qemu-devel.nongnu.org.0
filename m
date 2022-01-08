Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F79E488299
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:49:35 +0100 (CET)
Received: from localhost ([::1]:45920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n67Pq-0006x2-MG
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 03:49:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66It-0005Tp-SV
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:19 -0500
Received: from [2607:f8b0:4864:20::d30] (port=40607
 helo=mail-io1-xd30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ir-0003Vw-Tk
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:19 -0500
Received: by mail-io1-xd30.google.com with SMTP id q5so10092729ioj.7
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 23:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xVAeEhWfPUcbULInn573PJBxHu7QnmbFB7C8wstKchQ=;
 b=ad1ljQig2DoGzbg0U9BOdq8ltQ2YNp541/0boMK5ZnMN804GFAQ8cWQxRDiErRiIr/
 PqGSX+vM4FgXibcAgMwqeliPfZ/UWM/kx7zUSZKjnn0yMWMVDC4khv8kPY+kBJy5ZXkp
 GqJmsO/hcAM6KxPZyi/sgqJVUJxYw0h62qcsMGgbZ7+HfYxB6H5H1rKwrnOCGTDtyGW8
 Wx7pzbYdedRwTtI/zlszV+7e5oxXJ+ygwIUTIv0iLzafpJ7hnq9LudpymNnpBrD9Ha1M
 sdhUFygSn5GQqVVT4tYgRGNwjchsgIbLdXcGn4/OecCFuwVLHHLfT7TgxoODjbUAC5zn
 9PHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xVAeEhWfPUcbULInn573PJBxHu7QnmbFB7C8wstKchQ=;
 b=kOs36YpCuL2ZDlay+kd1Aa+Vy64CZpndtCZaQZgogz2gZlRlcv5veecmy1NiQV9r7m
 A4vr8Dq9/oYlSgPXvuAB+RPbQecoYNH2Qve4tEY5T0Bmt/+WLSoDJQC4Nykr/ftCcid7
 foh7t4il2z2WK66akNkEX1wK0trN3sYlROg5a+7vFAeN/ug0FJ0BBo7q3iWHhqBncHLH
 8dNxF4YSyHDT3Dw1uz15QQ8NZp5LmmlCKPoqw1wly51Q7QQ1CFt5xGfZCyzzmjejElF8
 rqnsoESarSGx/UgfNLfGOkCi3axPYy4E2dykheC71wAQIYIAnNbMT0JqDsYHQiFa7Mhx
 jf3Q==
X-Gm-Message-State: AOAM531p0L30U2okHR2U771tamI8un6fZ5/vVNgUsaD8tQk+zD6BrTav
 k/rlwfFWQaYFmVZJVGqCsziAuFEt2C37UAnU
X-Google-Smtp-Source: ABdhPJzARJozL5Pp11oO2PvzUYPf7Ti5WesGVYzDbFOtu+8XS7WcKyarsIIXulK1Qn3tapHTH2xa2Q==
X-Received: by 2002:a02:ba8b:: with SMTP id g11mr30459453jao.20.1641627496074; 
 Fri, 07 Jan 2022 23:38:16 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:15 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 34/37] bsd-user/arm/signal.c: arm set_mcontext
Date: Sat,  8 Jan 2022 00:37:34 -0700
Message-Id: <20220108073737.5959-35-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d30
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the machine context to the CPU state.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/signal.c | 76 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
index 93c9bfc0d37..fb6228db6cf 100644
--- a/bsd-user/arm/signal.c
+++ b/bsd-user/arm/signal.c
@@ -109,3 +109,79 @@ abi_long get_mcontext(CPUARMState *env, target_mcontext_t *mcp, int flags)
     }
     return err;
 }
+
+/* Compare to arm/arm/exec_machdep.c set_mcontext() */
+abi_long set_mcontext(CPUARMState *env, target_mcontext_t *mcp, int srflag)
+{
+    int err = 0;
+    const uint32_t *gr = mcp->__gregs;
+    uint32_t cpsr, ccpsr = cpsr_read(env);
+    uint32_t fpscr, mask;
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
+     * The movs pc,lr instruction that implements the return to userland masks
+     * these bits out.
+     */
+    mask = cpsr & CPSR_T ? 0x1 : 0x3;
+
+    /*
+     * Make sure that we either have no vfp, or it's the correct size.
+     * FreeBSD just ignores it, though, so maybe we'll need to adjust
+     * things below instead.
+     */
+    if (mcp->mc_vfp_size != 0 && mcp->mc_vfp_size != sizeof(target_mcontext_vfp_t)) {
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
+    env->regs[15] = tswap32(gr[TARGET_REG_PC] & ~mask);
+    if (mcp->mc_vfp_size != 0 && mcp->mc_vfp_ptr != 0) {
+        /* see set_vfpcontext in sys/arm/arm/exec_machdep.c */
+        target_mcontext_vfp_t *vfp;
+
+        vfp = lock_user(VERIFY_READ, mcp->mc_vfp_ptr, sizeof(*vfp), 1);
+        for (int i = 0; i < 32; i++) {
+            __get_user(*aa32_vfp_dreg(env, i), &vfp->mcv_reg[i]);
+        }
+        __get_user(fpscr, &vfp->mcv_fpscr);
+        vfp_set_fpscr(env, fpscr);
+        unlock_user(vfp, mcp->mc_vfp_ptr, sizeof(target_ucontext_t));
+
+        /*
+         * linux-user sets fpexc, fpinst and fpinst2, but these aren't in
+         * FreeBSD's mcontext, what to do?
+         */
+    }
+    cpsr_write(env, cpsr, CPSR_USER | CPSR_EXEC, CPSRWriteByInstr);
+
+    return err;
+}
-- 
2.33.1


