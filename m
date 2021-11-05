Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAC0445F05
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 05:07:03 +0100 (CET)
Received: from localhost ([::1]:44244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miqVI-0001B9-Fw
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 00:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipmA-0004u7-0a
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:20:22 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:45772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipm8-0004FS-3W
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:20:21 -0400
Received: by mail-il1-x12e.google.com with SMTP id i12so8228475ila.12
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 20:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d3aDuQc168bTErAstWZqiEF/2xZcEqXziJxXaVtJ/MI=;
 b=EClI2ibuBVDGCzc8ryOoMsNHWVWIPJmvzUJGLqnw0n5bWH5h0yPjFVZ1y/dOZi4oxO
 IjPPfwgfahypFLxBjyxMf6X2bgO4nUa7D0NMr47wDeAzdJ72b9cOP73+TAESiDMGycvo
 UjZgiGjiqNjMA/6YEzcHZ43kr9lgAMcA0RhloekhMY7rTCkfdE1kTIy3ERDlbcm0q9Q0
 a7EWqiA/jkNcYgUzcIBZbUTK/gFSnSOaOf5kszh5b4Tmnfaxr0DoKZAddhT8DzJc9dv6
 Z3Zg3xltyPGF0JN2lw4clhc9lboCucV0lGt5N9cOSR0tCOcS4I4C4cS8f0gs9GGYs0a/
 bV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d3aDuQc168bTErAstWZqiEF/2xZcEqXziJxXaVtJ/MI=;
 b=TL/kF/NaALgkTlbP0YvliVDx7tqn26kO+czMZGGzpxqKE6+XWF8tlgRwVgwlTwHhjs
 7OXZxv6A6Ca6O7Ut9rKFKkhKWY4rhu0P9F4MJQqYkQjlQimnGrfcUWRjDQKs5o63cb4C
 tmUl7ePuch/OFxRvinYFRYfYqFU7RyNLPv4Rz/AYK2DWiF6wmhcJ2yFZmt/SUT/DDrVi
 o8kEdRSbgbuKUHc+FEVToOk8xFQHJ7wwhBXDBeNv9IxZZum5CAIcq4lw3VIdg/iLrYxQ
 Z9XGApjwLT+md2ALmggPQbRoGhtfwrP3fxwTlG8IErhjbsGfjZymsBHutn2XIXSfEDFI
 z5wg==
X-Gm-Message-State: AOAM5304gV2Va5mA0/e3IHhA18NYsvPu6ettazzWif+W2URKzrL+JnD+
 8EK29jwo8BTKlrMSYMo+MOWryXmTwNtnSg==
X-Google-Smtp-Source: ABdhPJxET9OEMAu0qEX4XIrzEX/h2aGF5vyQke1n1DFhNgpQKKLGIL47/aoi4pC0cUYVNwTfgv/R0g==
X-Received: by 2002:a05:6e02:19c8:: with SMTP id
 r8mr8568510ill.47.1636082418753; 
 Thu, 04 Nov 2021 20:20:18 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:18 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 31/36] bsd-user/arm/target_arch_signal.c: arm
 set_sigtramp_args
Date: Thu,  4 Nov 2021 21:19:12 -0600
Message-Id: <20211105031917.87837-32-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
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
 Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement set_sigtramp_args to setup the arguments to the sigtramp
calls.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/signal.c             | 60 +++++++++++++++++++++++++++++++
 bsd-user/arm/target_arch_signal.h |  5 +++
 2 files changed, 65 insertions(+)
 create mode 100644 bsd-user/arm/signal.c

diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
new file mode 100644
index 0000000000..3c0db30a85
--- /dev/null
+++ b/bsd-user/arm/signal.c
@@ -0,0 +1,60 @@
+/*
+ *  arm signal functions
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu.h"
+
+/*
+ * Compare to arm/arm/machdep.c sendsig()
+ * Assumes that target stack frame memory is locked.
+ */
+abi_long set_sigtramp_args(CPUARMState *env, int sig,
+                           struct target_sigframe *frame,
+                           abi_ulong frame_addr,
+                           struct target_sigaction *ka)
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
diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index f1844dbf22..8286aa5d6e 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -85,4 +85,9 @@ struct target_sigframe {
     target_mcontext_vfp_t sf_vfp; /* actual saved VFP context */
 };
 
+abi_long set_sigtramp_args(CPUARMState *regs, int sig,
+                           struct target_sigframe *frame,
+                           abi_ulong frame_addr,
+                           struct target_sigaction *ka);
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.0


