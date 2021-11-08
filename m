Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2B3447902
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 04:56:39 +0100 (CET)
Received: from [::1] (port=46222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjvlu-0006Ic-Vl
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 22:56:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhl-0006GI-8l
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:21 -0500
Received: from [2607:f8b0:4864:20::d31] (port=34565
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhi-0002pS-5r
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:21 -0500
Received: by mail-io1-xd31.google.com with SMTP id w22so2906641ioa.1
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 19:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u970cXhT5ZzSUK7ShiWcU4teDFPc9gbTYz14X9qwV6Q=;
 b=Z5cNkfc+8qYuTIRQBHztdLN8ukDPPaal6Zzz4mMxjLXWj5sN3dvZbHBNPkTuNQ2i8H
 D00GJtArkapHbzB3uq8TJkT6ylN0Ct4CrGBMV09MkLYJt7HFPFibYGzW5BSZ+ZaWieNO
 DF+C7Vr73Dl6ISAzILgkgBFV8xL2jZ1ycWsWop/TGTZ6yW2Ac6Oy0jmmYLbAz1sFgFrk
 foWzqT6c8ReuZSUaNkCg0VlyVXJqyVL/GF7HiolT4WO8ROClMarl7I4JwcWIGQwpSIqf
 wEL/ADC5NyA6PK6Nb5VX3r62za+81V1c/sh7tV/bYeLf7mxZJzTXysTc5Tew1M6vFCNJ
 lYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u970cXhT5ZzSUK7ShiWcU4teDFPc9gbTYz14X9qwV6Q=;
 b=nllGhjxJDt1q39ZbB1Axk+Mn3AA1JlOkUv/MFqj/JPoHa3jZrHZ6l6YFOjaY9I4g4t
 x8/FAK58ghFyPlL964x5Z7K6RJq/IpraOKHeOhv/2shxbolkH8B141c2TJOhHS8Ly8pd
 J6H+ifB/gOafiVPU/kWV/4uQzECAzTwPfuNeJbsaz58padS1OtLvHWm8AVDN66jDrnQO
 3VhgNugpb4BgV7+heUrdw2bvR5FRxd42ObKyMmddkJen60s1gweh+UVhAJbp5zyWo2Z7
 2MzpT5DCRxX719X4Pc0zg6K3bxCIS0NB4c2gI4Y8CNmE4nSYtUXpR2Qw3dzgskyfBDxO
 ylbA==
X-Gm-Message-State: AOAM532bzuAl/mFlCh8zNV54RcCBajkK/wCsShJ3qyga7rq7PvzuOoPY
 6cM9F0+gKG0EfZnkuFzZXxoBRcSsve/qtw==
X-Google-Smtp-Source: ABdhPJzCSUBG6TBaWRgt3fMMXVVuo+2fYWl8DtICId5COPR69QZTHItMzyv42hMs8Pk2EQm1uUG60A==
X-Received: by 2002:a5d:8242:: with SMTP id n2mr11062722ioo.170.1636343536370; 
 Sun, 07 Nov 2021 19:52:16 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:16 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/37] bsd-user/i386: Move the inlines into signal.c
Date: Sun,  7 Nov 2021 20:51:06 -0700
Message-Id: <20211108035136.43687-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
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

Move the (now stubbed out) inlines into bsd-user/i386/signal.c.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/i386/signal.c             | 56 +++++++++++++++++++++++++++++-
 bsd-user/i386/target_arch_signal.h | 43 +++++------------------
 2 files changed, 63 insertions(+), 36 deletions(-)

diff --git a/bsd-user/i386/signal.c b/bsd-user/i386/signal.c
index ac90323365..2939d32400 100644
--- a/bsd-user/i386/signal.c
+++ b/bsd-user/i386/signal.c
@@ -1 +1,55 @@
-/* Placeholder for signal.c */
+/*
+ *  i386 dependent signal definitions
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
+ * Compare to i386/i386/machdep.c sendsig()
+ * Assumes that target stack frame memory is locked.
+ */
+abi_long set_sigtramp_args(CPUX86State *env, int sig,
+                           struct target_sigframe *frame,
+                           abi_ulong frame_addr,
+                           struct target_sigaction *ka)
+{
+    /* XXX return -TARGET_EOPNOTSUPP; */
+    return 0;
+}
+
+/* Compare to i386/i386/machdep.c get_mcontext() */
+abi_long get_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int flags)
+{
+    /* XXX */
+    return -TARGET_EOPNOTSUPP;
+}
+
+/* Compare to i386/i386/machdep.c set_mcontext() */
+abi_long set_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int srflag)
+{
+    /* XXX */
+    return -TARGET_EOPNOTSUPP;
+}
+
+abi_long get_ucontext_sigreturn(CPUX86State *regs, abi_ulong target_sf,
+                                abi_ulong *target_uc)
+{
+    /* XXX */
+    *target_uc = 0;
+    return -TARGET_EOPNOTSUPP;
+}
diff --git a/bsd-user/i386/target_arch_signal.h b/bsd-user/i386/target_arch_signal.h
index 701c6f964f..982c7035c7 100644
--- a/bsd-user/i386/target_arch_signal.h
+++ b/bsd-user/i386/target_arch_signal.h
@@ -88,40 +88,13 @@ struct target_sigframe {
     uint32_t    __spare__[2];
 };
 
-/*
- * Compare to i386/i386/machdep.c sendsig()
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
-/* Compare to i386/i386/machdep.c get_mcontext() */
-static inline abi_long get_mcontext(CPUX86State *regs,
-        target_mcontext_t *mcp, int flags)
-{
-    /* XXX */
-    return -TARGET_EOPNOTSUPP;
-}
-
-/* Compare to i386/i386/machdep.c set_mcontext() */
-static inline abi_long set_mcontext(CPUX86State *regs,
-        target_mcontext_t *mcp, int srflag)
-{
-    /* XXX */
-    return -TARGET_EOPNOTSUPP;
-}
-
-static inline abi_long get_ucontext_sigreturn(CPUX86State *regs,
-                        abi_ulong target_sf, abi_ulong *target_uc)
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
 
 #endif /* TARGET_ARCH_SIGNAL_H */
-- 
2.33.0


