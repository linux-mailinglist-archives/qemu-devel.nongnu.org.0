Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DBD447906
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 04:59:24 +0100 (CET)
Received: from [::1] (port=54708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjvoZ-0003do-2v
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 22:59:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhr-0006PJ-En
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:27 -0500
Received: from [2607:f8b0:4864:20::12e] (port=45652
 helo=mail-il1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhl-0002qB-Lr
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:23 -0500
Received: by mail-il1-x12e.google.com with SMTP id i12so15533473ila.12
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 19:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JXp5/X8FRup4YPTNtkjA6+UNr6/HSMba1RzleezwTZc=;
 b=q6qWJjVXjlJ4UpUTip/FUv036mww5ap0HCwIp7bvzJ8+oL+D76+bVxhMjJiadvxoSf
 0CRIX1EEqz6mHe1gVT9PI/TwQliWbLrBh47U2/J8Ig8C//Lnu13vJ6XfhXR7HBcR9z6+
 8cVj83xv2j9P4JP2u3kzsRHQS06YdkbvdjCT+0ulGGD6FSJoXG0rgkZsYHTMYg9yCkd2
 mxfLfRPfdvJjn6pMCAZ51etNI6FlT447zDTPWQ8QzH1Lc6TzVYofeMJNnQyP/EEi/FQz
 h4xz90jZQj14DM4Nm3uz60xEQfmwO9Znn+dWpONVc7OiKkOPFJ6GMUKboXvTLx+FOFFO
 41DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JXp5/X8FRup4YPTNtkjA6+UNr6/HSMba1RzleezwTZc=;
 b=7Cxhb0Q8blXJkrvCOlzeCluoFcyMDXQQ6xLrtYlDQD01DO1+mvqG3keRHOGs2Q+pv7
 OQAuRt8K8nLEuQrEHzYd+PorsoxOWPIM7QWJXm8xLpm01s7w0YlMiZXyJ8wGnPJ39t0L
 nWiYkq8o5zfOBiNgdRW/u09kZKN49293iVcp1DDT7/++Cp9mXuKuWF21He4V1jVv4fFG
 HMmGUIPCB9w7u7k/atSnV4zucrF3+TYZwBeuI4QmMbb0TcOOFk8L7Mwd5SmMtztNxeAl
 Mtlx/YPx5yS8/QUzqf2Jb3jL139LGnyaxd+8omByKyZTb9KWQmBgoy7HqoeoHQ8Eu/yV
 hcAg==
X-Gm-Message-State: AOAM531oloBc2JFbdpNCUosytK43W6/HfuaMd8EfeQjs8JAy/zmeV6G6
 YVAMEnXCYJYFG5fTj+Aq1/bwkEbun1estw==
X-Google-Smtp-Source: ABdhPJx7Ia+Z8PL4EmBlYp5Ns75+WwEpj61N1pNEl3nzm33wwXNgdBWH7zrZfa1X+IkT1gJZqYxSAA==
X-Received: by 2002:a05:6e02:1a66:: with SMTP id
 w6mr28335978ilv.306.1636343540474; 
 Sun, 07 Nov 2021 19:52:20 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:20 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/37] bsd-user/x86_64: Move functions into signal.c
Date: Sun,  7 Nov 2021 20:51:10 -0700
Message-Id: <20211108035136.43687-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the current inline functions into sigal.c. This will increate the
flexibility of implementation in the future.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/x86_64/signal.c             | 56 +++++++++++++++++++++++++++-
 bsd-user/x86_64/target_arch_signal.h | 43 ++++-----------------
 2 files changed, 63 insertions(+), 36 deletions(-)

diff --git a/bsd-user/x86_64/signal.c b/bsd-user/x86_64/signal.c
index ac90323365..8885152a7d 100644
--- a/bsd-user/x86_64/signal.c
+++ b/bsd-user/x86_64/signal.c
@@ -1 +1,55 @@
-/* Placeholder for signal.c */
+/*
+ *  x86_64 signal definitions
+ *
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
+ * Compare to amd64/amd64/machdep.c sendsig()
+ * Assumes that target stack frame memory is locked.
+ */
+abi_long set_sigtramp_args(CPUX86State *regs,
+        int sig, struct target_sigframe *frame, abi_ulong frame_addr,
+        struct target_sigaction *ka)
+{
+    /* XXX return -TARGET_EOPNOTSUPP; */
+    return 0;
+}
+
+/* Compare to amd64/amd64/machdep.c get_mcontext() */
+abi_long get_mcontext(CPUX86State *regs,
+                target_mcontext_t *mcp, int flags)
+{
+    /* XXX */
+    return -TARGET_EOPNOTSUPP;
+}
+
+/* Compare to amd64/amd64/machdep.c set_mcontext() */
+abi_long set_mcontext(CPUX86State *regs,
+        target_mcontext_t *mcp, int srflag)
+{
+    /* XXX */
+    return -TARGET_EOPNOTSUPP;
+}
+
+abi_long get_ucontext_sigreturn(CPUX86State *regs,
+        abi_ulong target_sf, abi_ulong *target_uc)
+{
+    /* XXX */
+    *target_uc = 0;
+    return -TARGET_EOPNOTSUPP;
+}
diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/target_arch_signal.h
index 720e3939c3..b39b70466e 100644
--- a/bsd-user/x86_64/target_arch_signal.h
+++ b/bsd-user/x86_64/target_arch_signal.h
@@ -96,40 +96,13 @@ struct target_sigframe {
     uint32_t    __spare__[2];
 };
 
-/*
- * Compare to amd64/amd64/machdep.c sendsig()
- * Assumes that target stack frame memory is locked.
- */
-static inline abi_long set_sigtramp_args(CPUX86State *regs,
-        int sig, struct target_sigframe *frame, abi_ulong frame_addr,
-        struct target_sigaction *ka)
-{
-    /* XXX return -TARGET_EOPNOTSUPP; */
-    return 0;
-}
-
-/* Compare to amd64/amd64/machdep.c get_mcontext() */
-static inline abi_long get_mcontext(CPUX86State *regs,
-                target_mcontext_t *mcp, int flags)
-{
-    /* XXX */
-    return -TARGET_EOPNOTSUPP;
-}
-
-/* Compare to amd64/amd64/machdep.c set_mcontext() */
-static inline abi_long set_mcontext(CPUX86State *regs,
-        target_mcontext_t *mcp, int srflag)
-{
-    /* XXX */
-    return -TARGET_EOPNOTSUPP;
-}
-
-static inline abi_long get_ucontext_sigreturn(CPUX86State *regs,
-        abi_ulong target_sf, abi_ulong *target_uc)
-{
-    /* XXX */
-    *target_uc = 0;
-    return -TARGET_EOPNOTSUPP;
-}
+abi_long set_sigtramp_args(CPUX86State *env, int sig,
+                           struct target_sigframe *frame,
+                           abi_ulong frame_addr,
+                           struct target_sigaction *ka);
+abi_long get_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int flags);
+abi_long set_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int srflag);
+abi_long get_ucontext_sigreturn(CPUX86State *regs, abi_ulong target_sf,
+                                abi_ulong *target_uc);
 
 #endif /* !TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.0


