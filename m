Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 205D244794F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 05:23:49 +0100 (CET)
Received: from localhost ([::1]:37828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjwCC-0007ol-9o
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 23:23:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvi9-00074m-8w
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:45 -0500
Received: from [2607:f8b0:4864:20::d32] (port=34568
 helo=mail-io1-xd32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvi6-0002ya-PT
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:45 -0500
Received: by mail-io1-xd32.google.com with SMTP id w22so2907234ioa.1
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 19:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GncYDfjxwlhtNC69qwkoQdNduf0of/aApvZ39YXAJoM=;
 b=MZjh9XbOL3nSD5GrxFCTTHblUVD7kYo+b0aqw6vqmdMG+KNb+gpniGELksu5JUwe6q
 3TywRb2JIPcQ72jRUJCtG4yIKjHCZ05Mu7bnjj5rGmvvuNwzaCwK1S+6I/0wwqT75qUB
 nvYDg3idd9+tpsRwpZaRhPNYyibmOYNXaFTtgoBB75YmZxKWr7Z8wExWVdn3vdcoogLA
 +lPDN8bH5/dbmSzQUHqMfl6QIelz1frOqlNfrSkmqBHAzsX5oHYF0l13TFk67LDbosq7
 dbj02bx1WSC9zF7hrhGwqKg2i3MTcD1AT0OsaqzTc4xHmJkOQt7+TrQHzAsMPZ6n6y2E
 GvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GncYDfjxwlhtNC69qwkoQdNduf0of/aApvZ39YXAJoM=;
 b=XpzkeEhWUCeLXyR7s595RG9w1XK91MFF6YIC7qwKn+pwLOHfF3Q0bzIM0sj+BXYYh2
 32n8QsqQSNDY5vlw6/utugG4p147H5HlhPO00jl5IPheZolI0R1sahPGyEyyqUiDPuoU
 zw9ADygg7xhm4z8kEkjRljza6C7pISlYn5pCF7/TClOwV1KtK3y8LTgoKen+mbxHAJs1
 sN5CvzV7a9UFvsQTkoPvqcyCHEL46lRRxl/EW78yU+yPbgpwaZwC7iLZcfVeP6ZEiDfx
 /5h+3m1nLZvtz5vVNQCYfh/AU0ZyXR0KtVb87Y9++fzhScsvIrJfIEfTYfw9AGR3Sakv
 8IBA==
X-Gm-Message-State: AOAM533UnxgkynFjEjZo9WRk6O6gaqn4okG85DfxYbGt6hfDtQWWYvrI
 8QN+9TaDjxvOa9ATwYHNhicF14ceqUYPsw==
X-Google-Smtp-Source: ABdhPJw5dRmeBg31Ywv/z67GW9FozmVAXGBZWBL3mHCn1zW5GCseV+PxQmUVPDJydOHFQef25eCzlA==
X-Received: by 2002:a5d:8c83:: with SMTP id g3mr11200078ion.24.1636343561515; 
 Sun, 07 Nov 2021 19:52:41 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:41 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 34/37] bsd-user/arm/signal.c: arm set_mcontext
Date: Sun,  7 Nov 2021 20:51:33 -0700
Message-Id: <20211108035136.43687-35-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d32
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
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
---
 bsd-user/arm/signal.c | 76 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
index 93c9bfc0d3..fb6228db6c 100644
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
2.33.0


