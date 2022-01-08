Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D41488257
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:29:40 +0100 (CET)
Received: from localhost ([::1]:36418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n676Z-0004gC-JQ
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 03:29:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Is-0005Tl-6W
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:19 -0500
Received: from [2607:f8b0:4864:20::12a] (port=39660
 helo=mail-il1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ip-0003Uo-Lp
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:17 -0500
Received: by mail-il1-x12a.google.com with SMTP id o1so6333081ilo.6
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 23:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6Tbj1RmkZBzQdNFdHL2tew5V0kLNAuFym+h5lDLGqms=;
 b=WhELXPmxDVTzpR5TGLSMd4L2qaQkeImklEW7v9bUfNR37+ve0eKhd6GiZjZWnHsPXF
 OGaBBnXLdo5+umw+WMf48ATI+8H7RYot+AsNuZbrfoOE9Z7m6b2GjkeJU/X8n9xOIlxh
 LcpuGNG+DrF3bHnTA8XbXYXpIyZ3nSxZ3+fk/wgSaiOQFXcIsV3cti7YYCNQvCdTsVhL
 8THKRIO7WPoZtNftKhS+aOhujhXUmzNQ8PhNzQi0vL/zD9fhIDn+iNyYc+ZSfzHOatiM
 qEjEwuz7U0dXgFO0kSLSaNHpBoyvZ6duK/0NN2ri6YH8iI35Awtt8pcTD8bN3yeKS2KI
 VP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Tbj1RmkZBzQdNFdHL2tew5V0kLNAuFym+h5lDLGqms=;
 b=baHDe0wH3IMRR8p6zjfExBMGAMX3NPOE+3ep4vJmR7nWaZ2MD1CRbd1912SPDHLn7Z
 oaIGvkDA1/wSwPZW/EtCcuurPj2CxYjI5187X/BXP97YPkvW6rYGEzEzr+RLBmOG0lCS
 Ybtd/OMirSk+r/Arwijwsel3/dnW3cUG3CJCuCGSNEOz22XjGm3M0/An6yysPtS6oVuG
 2L/4Kzal2aALdE2N2ceioiAoeTDWbeIC80D7GadpCw23MSXeo/9WKpCKpeLTARMbVH04
 ojKJd5cmAlrxcyg1a49jTGab4fL2U+OUcP947AI32EAMS7AlzLfKlR5zDG+axMMlWgDf
 hiHw==
X-Gm-Message-State: AOAM530YMi2vfutINhsgGAokgVtEILTNt7p+MHYi01QMXAIMWIWGtwHu
 noN4XJ9DxzlboRmuaGJpir0p39+XAu+nd+b2
X-Google-Smtp-Source: ABdhPJza8BXEKY4YkjRdXPXdXHzpaBDkxsbJ6ye/76HNaZ11BRTfX22/MzAA2anbW+xy0W17F77f5Q==
X-Received: by 2002:a05:6e02:1ba6:: with SMTP id
 n6mr32992516ili.296.1641627494351; 
 Fri, 07 Jan 2022 23:38:14 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:14 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/37] bsd-user/arm/signal.c: arm set_sigtramp_args
Date: Sat,  8 Jan 2022 00:37:32 -0700
Message-Id: <20220108073737.5959-33-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12a;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12a.google.com
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org, kevans@freebsd.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>,
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
index 00000000000..3c0db30a85e
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
2.33.1


