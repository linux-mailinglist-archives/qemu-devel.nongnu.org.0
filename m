Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FE944794D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 05:22:20 +0100 (CET)
Received: from localhost ([::1]:35466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjwAm-0006Cf-34
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 23:22:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvi8-00070n-BT
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:44 -0500
Received: from [2607:f8b0:4864:20::d32] (port=36642
 helo=mail-io1-xd32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvi5-0002xx-EI
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:44 -0500
Received: by mail-io1-xd32.google.com with SMTP id e144so17446095iof.3
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 19:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OeOnvHCc2lg5sRstjwa89XicYu0PFuIOGrd2TLaUNlw=;
 b=Wit1wQA/xvMwxTN2yOyYJg7JMtwSwipR01hdkizigcgO1VwQyasnV6ssK1MJbVrVvh
 H+xNO1kaypudARdB8iXgSBB3JnF9sIFkgFcW3Xj36AciWwnR2aqXeiwAvvCc0hzT8myF
 MrokW1k9rDVuMGGCeOMFKFbS8LN0ltKUFOk9YSLB527UQUvtCW1LSUFlkeqGjVG/U2Zq
 Dvu6tcLtMO14gT5UwnzMIfZD0T8Lmg25Hc3sNgSME3KXofKZJ36u4DoPVLjZohRB+NuV
 NzCnLgWpSORK7/FeNyEVmH0m34ojYuWyeBUVULSTM0dIG3pFPEef3XC2X2ivOYggRFzY
 Nr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OeOnvHCc2lg5sRstjwa89XicYu0PFuIOGrd2TLaUNlw=;
 b=LDt3moRLs0EOQ7ZCNLLrHBcXAjxF60ShNNkUSR+8UMpjOTWqRLml0tr8s7Qv7d6pfU
 ruWKnIz1suByjMZ1mJWp6YUBpOckI+mbmCazbGYaSbGYa6121qEr3LO+1Akx4oAtj8IE
 QT3K+oVqfalwQluEWBqkiOVEnAqHV+af8JHOvA7aBIU701m9xGfj+OBoqIfF167n/IG3
 B4eCQveo9XYPySYzxuy1+E91X0to5axJjWcVggXWtUBBgavgiv6ypiQnPsCEYLUZo1M1
 qooB+IqK2HqFetpkmK/bghLZgLaI/RpuD5457pm3iFW/SMQ0fQY5eM/0qDDnVJwg+9DN
 seLg==
X-Gm-Message-State: AOAM532xewYMCoNSPtjeEri3FjwT5cH1SIEdjd1mFXoLtVJWRj7ar4Li
 oe/JXddWZgCFDeibJ8ytdMh+WNGVqghvDA==
X-Google-Smtp-Source: ABdhPJy75qhii/YZkVWw4CX2YVSlf9mc5ISYtZwapQbYPT6aBjFZULcvCOoPAJbk6BfSoGtBf7Povw==
X-Received: by 2002:a5e:d505:: with SMTP id e5mr11685739iom.217.1636343559773; 
 Sun, 07 Nov 2021 19:52:39 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:39 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 32/37] bsd-user/arm/signal.c: arm set_sigtramp_args
Date: Sun,  7 Nov 2021 20:51:31 -0700
Message-Id: <20211108035136.43687-33-imp@bsdimp.com>
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
 bsd-user/arm/signal.c | 60 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
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
-- 
2.33.0


