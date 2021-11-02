Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0857443992
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:23:06 +0100 (CET)
Received: from localhost ([::1]:43476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi37R-0005TD-3f
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f5-0007XG-BR
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:47 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:38833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f1-0002sX-Np
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:46 -0400
Received: by mail-io1-xd2d.google.com with SMTP id v65so584918ioe.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z1Wl9T8L67x7bSGj83CIsbFNGgACyBDJDUbwpvxuohI=;
 b=YKxiVfyqx92Al9EOD//eWmoDlwcHD2a7uNpaN4JH/gscWMTJj0AYcW+0KAKksa4Sed
 /9B+6/YKyEZauAZh9cWdGvFZ3fHav9H/S4DkcNc0//PnEDclCU2JJGqOc/uNoM/h6q+Z
 XJH1UqLLVrF8g0Sxma4tlpXaELufMUxKthcTWo8bLmBOt0dhhoFVZ/m5Y7/LobxBjVJB
 aP9LIgH8DOarAGGHswacrCLE5lpOnuj4dNj9SpYAmwcMpg3yH+YViWuDuKAoWZ2jEg3I
 ue0XW36S51RYJMksYLAFPCvl5jswccfg7vkFjdmb0WFhndhRhrjA0V9n42CLUuIdudFp
 W4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z1Wl9T8L67x7bSGj83CIsbFNGgACyBDJDUbwpvxuohI=;
 b=DUyij2trxZyuKPTrgiYanm3wknn+MNEAWDp2AjmjgZ9j0koXGtmIQai5qqGwDLQRVr
 mTVXzeLS1fUXb0fPLC/OIZl7SZJPljMExva9rpuL6MG31UT/pC/55QQcokhoKcwdgJDZ
 FtJu2eQ6dEqzH8+elNgvbT3sH0GMzsQiY92Z1h3zBF61zNFjUQkJhDfXPOzYC+5KIFK5
 ZoBG4bZ2mJ5nP4rdzV7xzUCnJ89ffmp1iHlbMwurs78kW/5B1FfjQh60MuEsq2zH+lKp
 4S39SLqWZp2PoF9Jjdkk+8YOtOPPFObczawWEiu8S2nBpcAPAuiGhmL7AzD6KrZ9iNrc
 HL1g==
X-Gm-Message-State: AOAM530F7ZMg0mqATyg68zSwf2z9LhUs/qUn/aXRl5ffZoDuVEnLwDa0
 Efn39y+oK6iau7/SvfCBpsqfm23enR4oiQ==
X-Google-Smtp-Source: ABdhPJy/s4GnIXvCoV0Af6f51xFUMtjGtgZc6P9QgVo1Kwd3cBL2y3OOl5KcgiIzX+6hmminh8x+7Q==
X-Received: by 2002:a05:6602:15d3:: with SMTP id
 f19mr17319677iow.14.1635893622540; 
 Tue, 02 Nov 2021 15:53:42 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:42 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/30] bsd-user/arm/target_arch_signal.h: arm
 set_sigtramp_args
Date: Tue,  2 Nov 2021 16:52:40 -0600
Message-Id: <20211102225248.52999-23-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
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
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement set_sigtramp_args to setup the arguments to the sigtramp
calls.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_signal.h | 47 +++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 4bdfcbb8d7..61440b51b4 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -82,4 +82,51 @@ struct target_sigframe {
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
+    abi_ulong cpsr;
+
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
+    cpsr = cpsr_read(env);
+    if (ka->_sa_handler & 1) {
+        cpsr |= CPSR_T;
+    } else {
+        cpsr &= ~CPSR_T;
+    }
+    cpsr_write(env, cpsr, CPSR_T, CPSRWriteByInstr);
+
+    return 0;
+}
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.0


