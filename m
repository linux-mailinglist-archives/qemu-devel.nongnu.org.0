Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D97F244553F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:23:01 +0100 (CET)
Received: from localhost ([::1]:43372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1middt-0005eX-1A
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNx-0007Jq-HA
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:33 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:34372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNu-000135-Eh
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:33 -0400
Received: by mail-io1-xd2c.google.com with SMTP id 2so3674710iou.1
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 07:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UDa9HzRQ7CJfd0GskHe2GGqy1pUzJiRt9/dQp1olxaU=;
 b=v+ktPMfEWv0Tek+Vh7smTkbkWLg7HE0y4q8xtMdVTAcWWyavqblSRKjGvCMC27mwBd
 yZBM4iwKws05U1yHBJhgcS81AIQhXMYfgYbhWq93AiQs19FBdLx3BhipTKpl5954WihK
 +xJqM9XYbydTK4wmw2DDkxAA2LPv5mUuvUcQ2/tgfS/XmBQ9SbdqNYMrgENQCcAH7DGi
 9xEwA8b26RSHyyuWj4JaAGq4Pbzzigsu2Z1jddTFobE8JFBTPlazWKDFXxgX/gJwLcN6
 2wgKx4pUZnzvLRkKZclXdI/KJ6xbwFhmjAaUGNlvHSFhumTzRx1sifnsgKCnoB3NHEw5
 X5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UDa9HzRQ7CJfd0GskHe2GGqy1pUzJiRt9/dQp1olxaU=;
 b=fmgcTatRJCtrblwdWudl3fvOwVxLAWti1E9zk/kK3SAfViBGzLRhL1Moi31yk/soPt
 snGsgeo3o7yD57eqUj8LL+OpQ7O+p8qw7kXmtWpq9ZNF1k8nkdr1iBPr4GYvo28xHmM7
 7v/VDAcqBCeeNhlA2cNvhkYIjY8B6qO2vTChsN0kv/86WIGOiV543PsxNUh4/AlX74rv
 8SEILe6TPCwDrLfFmT/G/OUDUM7Eab0pnwH/hPZAYDD1j9eEc+Lg//THUiI9VGxmuW/n
 9qppsPMv1Js0PDEWIEnirK9yDNS88mOpBklGnW8ZK7Culk+IZ3bCI7gOSXPq835hjIUR
 y0VQ==
X-Gm-Message-State: AOAM531h9I/XHARQ4ZqanPsG0TDaZU738/HzdfRh589M+kXRyO/XMGgf
 ofdEF9A/pO1ZY7qbgYdSWmXeKSxJTTvw9g==
X-Google-Smtp-Source: ABdhPJzeFq0jxwawumw2h5/KKJfh7zo80XA0jRfIcG2468fkVAh1ZXFK3zUSWoC70f59dU8/op6yFA==
X-Received: by 2002:a05:6638:2107:: with SMTP id
 n7mr4058346jaj.70.1636034789174; 
 Thu, 04 Nov 2021 07:06:29 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:28 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/29] bsd-user/arm/target_arch_signal.h: arm
 set_sigtramp_args
Date: Thu,  4 Nov 2021 08:05:28 -0600
Message-Id: <20211104140536.42573-22-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
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
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement set_sigtramp_args to setup the arguments to the sigtramp
calls.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_signal.h | 39 +++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 4bdfcbb8d7..e673132c68 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -82,4 +82,43 @@ struct target_sigframe {
     target_mcontext_vfp_t sf_vfp; /* actual saved VFP context */
 };
 
+/*
+ * Compare to arm/arm/machdep.c sendsig()
+ * Assumes that target stack frame memory is locked.
+ */
+static inline abi_long
+set_sigtramp_args(CPUARMState *env, int sig, struct target_sigframe *frame,
+    abi_ulong frame_addr, struct target_sigaction *ka)
+{
+    /*
+     * Arguments to signal handler:
+     *  r0 = signal number
+     *  r1 = siginfo pointer
+     *  r2 = ucontext pointer
+     *  r5 = ucontext pointer
+     *  pc = signal handler pointer
+     *  sp = sigframe struct pointer
+     *  lr = sigtramp at base of user stack
+     */
+
+    env->regs[0] = sig;
+    env->regs[1] = frame_addr +
+        offsetof(struct target_sigframe, sf_si);
+    env->regs[2] = frame_addr +
+        offsetof(struct target_sigframe, sf_uc);
+
+    /* the trampoline uses r5 as the uc address */
+    env->regs[5] = frame_addr +
+        offsetof(struct target_sigframe, sf_uc);
+    env->regs[TARGET_REG_PC] = ka->_sa_handler & ~1;
+    env->regs[TARGET_REG_SP] = frame_addr;
+    env->regs[TARGET_REG_LR] = TARGET_PS_STRINGS - TARGET_SZSIGCODE;
+    /*
+     * Low bit indicates whether or not we're entering thumb mode.
+     */
+    cpsr_write(env, (ka->_sa_handler & 1) * CPSR_T, CPSR_T, CPSRWriteByInstr);
+
+    return 0;
+}
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.0


