Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EDC447922
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 05:09:48 +0100 (CET)
Received: from localhost ([::1]:60284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjvyd-0001f9-Tq
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 23:09:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvi8-00070c-8I
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:44 -0500
Received: from [2607:f8b0:4864:20::130] (port=35442
 helo=mail-il1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvi5-0002y3-U3
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:43 -0500
Received: by mail-il1-x130.google.com with SMTP id w15so15558584ill.2
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 19:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U3NE49HODa5ve+oXzRvqylTHNWY8RpTmmQhoDiFbJDo=;
 b=If5wLTNQHcW/v2Nq6mErBbK1M18ydWGBtAMfaJ2cO5j9RifgdDyGyowYVI0T+WEeph
 ZB5JbyLLAwQHa+HFFPaG+08Zfh/epC62mpyNdUC3bKzBySwYjPcmWQCM3AdLJS3bBsI7
 fgJQnetiM6OwoxAQgc7ZJ1H6zOvC+QRITjSjkaX4bMS6zGK8ogeb6VAMXSFtLo0f8I2K
 Yg7Eq7DOY/+8S+q87mbQGG9PBdBq2PRBFwyG2Bv4OImj0LZ6hIF0p3f6rvioGK+NHdJO
 qbJWdoQX88APRkkF9ifzyzXziVjdJJFQcDNsJgJYNp65PqeG/FG71eFvYPUPFVkY7Fs9
 Znkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U3NE49HODa5ve+oXzRvqylTHNWY8RpTmmQhoDiFbJDo=;
 b=jiI1JlXGLbNaxUI/CDZYBWvDDfxW1DTsj0BNDrQm7nUUW+TZK8IZXcBxhNuCjF2J7z
 wGvgwBrx9JgXjBgQoxx5Bmv6gm4YZdlevrhPSvJWcNk25qEk8ZfPJ7OdIaWZKfWCcti/
 Y4ytAMEhJ0O2lVF/e4S1eqxCFvdBTcKb8kUAgDYUtqKIarVm83Kyq9z4M98zb2WR0PBS
 s44J6AB40WdJdptrLiu+Q0RQUEGymRncmujn0VxTCitCiAAVMDN9atH3ajSro3VptZab
 9QDTtndiDgdKoKKduYDOI8bQo4/f4snpabGNP0VbkMs8ocPhVydQlxYKzLcsczlYfaXn
 Lnfw==
X-Gm-Message-State: AOAM533s8Tj+30nuTS1Mq9IM5ZDvxozYBVyYraOmxDrBrLZC093ZJFud
 qcH3jdTZTtiIssiYqhJotivlfZOGJjXT4A==
X-Google-Smtp-Source: ABdhPJzL6kakMTUq2pFbMI+pQ/96aPiPp8+OeYvOu2p7+sO906c7qAEbS2uYqtw9x1MbHw34Cl5rmg==
X-Received: by 2002:a92:c8c6:: with SMTP id c6mr42754088ilq.54.1636343560668; 
 Sun, 07 Nov 2021 19:52:40 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:40 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 33/37] bsd-user/arm/signal.c: arm get_mcontext
Date: Sun,  7 Nov 2021 20:51:32 -0700
Message-Id: <20211108035136.43687-34-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::130
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
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

Get the machine context from the CPU state.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/signal.c | 51 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
index 3c0db30a85..93c9bfc0d3 100644
--- a/bsd-user/arm/signal.c
+++ b/bsd-user/arm/signal.c
@@ -58,3 +58,54 @@ abi_long set_sigtramp_args(CPUARMState *env, int sig,
 
     return 0;
 }
+
+/*
+ * Compare to arm/arm/machdep.c get_mcontext()
+ * Assumes that the memory is locked if mcp points to user memory.
+ */
+abi_long get_mcontext(CPUARMState *env, target_mcontext_t *mcp, int flags)
+{
+    int err = 0;
+    uint32_t *gr = mcp->__gregs;
+
+    if (mcp->mc_vfp_size != 0 && mcp->mc_vfp_size != sizeof(target_mcontext_vfp_t)) {
+        return -TARGET_EINVAL;
+    }
+
+    gr[TARGET_REG_CPSR] = tswap32(cpsr_read(env));
+    if (flags & TARGET_MC_GET_CLEAR_RET) {
+        gr[TARGET_REG_R0] = 0;
+        gr[TARGET_REG_CPSR] &= ~CPSR_C;
+    } else {
+        gr[TARGET_REG_R0] = tswap32(env->regs[0]);
+    }
+
+    gr[TARGET_REG_R1] = tswap32(env->regs[1]);
+    gr[TARGET_REG_R2] = tswap32(env->regs[2]);
+    gr[TARGET_REG_R3] = tswap32(env->regs[3]);
+    gr[TARGET_REG_R4] = tswap32(env->regs[4]);
+    gr[TARGET_REG_R5] = tswap32(env->regs[5]);
+    gr[TARGET_REG_R6] = tswap32(env->regs[6]);
+    gr[TARGET_REG_R7] = tswap32(env->regs[7]);
+    gr[TARGET_REG_R8] = tswap32(env->regs[8]);
+    gr[TARGET_REG_R9] = tswap32(env->regs[9]);
+    gr[TARGET_REG_R10] = tswap32(env->regs[10]);
+    gr[TARGET_REG_R11] = tswap32(env->regs[11]);
+    gr[TARGET_REG_R12] = tswap32(env->regs[12]);
+
+    gr[TARGET_REG_SP] = tswap32(env->regs[13]);
+    gr[TARGET_REG_LR] = tswap32(env->regs[14]);
+    gr[TARGET_REG_PC] = tswap32(env->regs[15]);
+
+    if (mcp->mc_vfp_size != 0 && mcp->mc_vfp_ptr != 0) {
+        /* see get_vfpcontext in sys/arm/arm/exec_machdep.c */
+        target_mcontext_vfp_t *vfp;
+        vfp = lock_user(VERIFY_WRITE, mcp->mc_vfp_ptr, sizeof(*vfp), 0);
+        for (int i = 0; i < 32; i++) {
+            vfp->mcv_reg[i] = tswap64(*aa32_vfp_dreg(env, i));
+        }
+        vfp->mcv_fpscr = tswap32(vfp_get_fpscr(env));
+        unlock_user(vfp, mcp->mc_vfp_ptr, sizeof(*vfp));
+    }
+    return err;
+}
-- 
2.33.0


