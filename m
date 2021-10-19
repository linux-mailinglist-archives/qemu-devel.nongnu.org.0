Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D67433CF2
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 19:04:48 +0200 (CEST)
Received: from localhost ([::1]:46162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcsXf-0005cT-JM
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 13:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsFE-0000Qq-PZ
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:47 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:41871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEy-0000XJ-Q9
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:43 -0400
Received: by mail-il1-x12b.google.com with SMTP id l7so5739778iln.8
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 09:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6Cf5sTAxUFGu9BSyltFuNOE2WbAFN6R6D/STx0Iy5tY=;
 b=ScHzN7hp4W9IjtjBBsbzOif3V45Jf/V3k80l8NU9wgDF7kxfo1hkAGsT8oVhhJYpHb
 6jgWUiNZkuCmp21tZDl4vqpOi6cESeZd8cRphLK5hF7Rhp67/epJY0jAXRoLpQL7Reh7
 ZamLJrTSmXoC6FPjL//YfKr2l30gCrEo/OUYn1cOKwyIhz1szeS+Jcw1/x4VqLFfNmPD
 lST5ilJ4CUd6oy/WHq4wai34XqH5ClH3362XmZAIxmpGWEn864YWtKvRDzYvUwfzg6Qt
 6cRtUY/FfNdPcuXezyqV0nldjwejdugZZ2DaOBno+lrjvkDm56jwsYL+R3TZH90g86hM
 Bdbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Cf5sTAxUFGu9BSyltFuNOE2WbAFN6R6D/STx0Iy5tY=;
 b=MLFuAIXnd+i0Dz95IonI17GRF0pRb6x/de2V6k9o+wRtaSivqZnkeaKQkkv007URvN
 HTdq2aOCFTzHRA/wufXe7svEJWDXqLVWL+RUdR+BqItF/+sHyIGhGCBQQmaJG/PgWpW/
 KBX8DEmSYnMgD3nMjjXpykBMOjqCEemucOsuY2wYaYOIlOFaCdpvOvRubhBTGD7XELqi
 2MqFCRdMVpOFiv6FQ2PYCa7NrNa9KhmAqeqw1MFQjmwawar0SzvfyJ5MYyyvlHIJGIM3
 KdGMarlMvciQWkrrpN7sT22Wg9/jMgSB01yZABidYC7raLE+KI8tO47YHxgDLdAQjX7a
 5bfw==
X-Gm-Message-State: AOAM533cCTUn6sSpZCAF8NPs4zn/TQts7K6UfC679zhbcbbxxvD8xr10
 X2Qi2RSKJRMndHDWb9IO445ytPhW/pMoNw==
X-Google-Smtp-Source: ABdhPJzHUBbhJqWT5ZltOimM0P63nZgbMtq3LyPD+ACa8jSuUVCi/hUITsYxv1d7kt2mXuldS8F3iw==
X-Received: by 2002:a05:6e02:158c:: with SMTP id
 m12mr18627535ilu.132.1634661927466; 
 Tue, 19 Oct 2021 09:45:27 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:27 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/24] bsd-user/arm/target_arch_signal.h: arm get_mcontext
Date: Tue, 19 Oct 2021 10:44:44 -0600
Message-Id: <20211019164447.16359-22-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 Klye Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Get the machine context from the CPU state.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Klye Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_signal.h | 38 +++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index b421c2522c..302fdc2846 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -163,4 +163,42 @@ set_sigtramp_args(CPUARMState *regs, int sig, struct target_sigframe *frame,
     return 0;
 }
 
+/*
+ * Compare to arm/arm/machdep.c get_mcontext()
+ * Assumes that the memory is locked if mcp points to user memory.
+ */
+static inline abi_long get_mcontext(CPUARMState *regs, target_mcontext_t *mcp,
+        int flags)
+{
+    int err = 0;
+    uint32_t *gr = mcp->__gregs;
+
+    gr[TARGET_REG_CPSR] = tswap32(cpsr_read(regs));
+    if (flags & TARGET_MC_GET_CLEAR_RET) {
+        gr[TARGET_REG_R0] = 0;
+        gr[TARGET_REG_CPSR] &= ~CPSR_C;
+    } else {
+        gr[TARGET_REG_R0] = tswap32(regs->regs[0]);
+    }
+
+    gr[TARGET_REG_R1] = tswap32(regs->regs[1]);
+    gr[TARGET_REG_R2] = tswap32(regs->regs[2]);
+    gr[TARGET_REG_R3] = tswap32(regs->regs[3]);
+    gr[TARGET_REG_R4] = tswap32(regs->regs[4]);
+    gr[TARGET_REG_R5] = tswap32(regs->regs[5]);
+    gr[TARGET_REG_R6] = tswap32(regs->regs[6]);
+    gr[TARGET_REG_R7] = tswap32(regs->regs[7]);
+    gr[TARGET_REG_R8] = tswap32(regs->regs[8]);
+    gr[TARGET_REG_R9] = tswap32(regs->regs[9]);
+    gr[TARGET_REG_R10] = tswap32(regs->regs[10]);
+    gr[TARGET_REG_R11] = tswap32(regs->regs[11]);
+    gr[TARGET_REG_R12] = tswap32(regs->regs[12]);
+
+    gr[TARGET_REG_SP] = tswap32(regs->regs[13]);
+    gr[TARGET_REG_LR] = tswap32(regs->regs[14]);
+    gr[TARGET_REG_PC] = tswap32(regs->regs[15]);
+
+    return err;
+}
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.32.0


