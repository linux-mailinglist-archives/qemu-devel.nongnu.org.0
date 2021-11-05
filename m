Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD240445E90
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 04:23:51 +0100 (CET)
Received: from localhost ([::1]:58524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mippW-0000W2-Ro
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 23:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplk-0004Gq-92
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:19:56 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:37603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipli-00044l-1v
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:19:56 -0400
Received: by mail-il1-x130.google.com with SMTP id h23so8255999ila.4
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 20:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jsIdVmjKOIUEZ1G1O3ibGx2Ed5U+hmNQGqNLw2OjQ6c=;
 b=hb6W+ObEwC+zujrIs9OyIVgVJx8DnBF3k2gWNWWjbBsge/WX9bugH9sQNhKW754WkB
 XBAdiuAg5mA0pk8sKvwerDt+WeAcbtf8ATd9JrC5HUdyP8kh0pSADfPbBr/kSCNzIja/
 Pwbc1ZTPioGosCPpDuQbW8rierGO/lcKb6+Gh6aUMhqfUJn+6/gnXBXUpnTxpuxVmsqT
 tyQfM5IYnUSPA9Cq2e9rrhemcxR1TXAiubG9zQLEn44uo346bmrXvC36wMiVHpJRN3ae
 0f4vUEym8rNnJQAtsK6h6IDT0cEEXFQ+TDdl8FinRsR9W9Z18U12orDQPvBd2z0ToQ/+
 e5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jsIdVmjKOIUEZ1G1O3ibGx2Ed5U+hmNQGqNLw2OjQ6c=;
 b=m67B0/wEDm31bn7WgeBONi6Z8v8KgU5YdY8elrJIpcQGf2GXMjIpH5QoWQzVYp6Uiz
 FUy5ENwKFwxqgdf4kfwJIaK7fw022NU+5xln3OqAnkTNShvFpYaxe+VSksTCeiJ0C/n8
 ciVIXvs/zyh6QOC1gQvq/Ankr0MetwoX8bU3vbI5Rbfm/Jxk/d6PM/PXDEkTAovXuLm5
 5Z1VKhjUeM5hOZTAM6O4+Vy3qzXPeBC9QV3IR2q5iXq9MNYuDDOgPiFTuMcirqQRxavV
 Q5uAqbp0W1D6wgjNGbUyO299jonX+HRA4w7dSRjXBgDpoBLaf9C0ssb/y1OpACGjeXpC
 rIcw==
X-Gm-Message-State: AOAM533MrWuA2MaNVHFlSYADsN8gYou4rOGTi27PMONBy2osou4fpEqU
 zsIqXyyBM+A00BTW9suuNh9+DkdVF+cQmA==
X-Google-Smtp-Source: ABdhPJwzm1qGR41d5bGkndxttj2JpPv0jtWLYWKQhb4J96q8ihMUArXteM/PVKYERYPIQeCkyQyxtA==
X-Received: by 2002:a92:ca0b:: with SMTP id j11mr36127551ils.289.1636082392775; 
 Thu, 04 Nov 2021 20:19:52 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:19:52 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/36] bsd-user/i386: Move the inlines into signal.c
Date: Thu,  4 Nov 2021 21:18:48 -0600
Message-Id: <20211105031917.87837-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the (now stubbed out) inlines into bsd-user/i386/signal.c.

Signed-off-by: Warner Losh <imp@bsdimp.com>
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


