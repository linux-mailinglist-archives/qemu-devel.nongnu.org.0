Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF4D4D9262
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 02:58:37 +0100 (CET)
Received: from localhost ([::1]:33446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTwSK-0003hX-6M
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 21:58:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1nTwRY-00031d-3i; Mon, 14 Mar 2022 21:57:48 -0400
Received: from [2607:f8b0:4864:20::435] (port=39615
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1nTwRW-0007au-D2; Mon, 14 Mar 2022 21:57:47 -0400
Received: by mail-pf1-x435.google.com with SMTP id h2so13156147pfh.6;
 Mon, 14 Mar 2022 18:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tsXaWPDFCIJL0eFGJmxAgDPaflUaGUSFFZi4g7kU/vk=;
 b=YyTx60fFksv5WtCaZ24fSHoAx2g2IRHW+FbeD/Jbd60M6evvoPPU8FaZQhSk266U7y
 LI+OfBUIyuci3uS7iKXnLvdfEGQVJXshPDb0HbkkEvpYohnv+f1T2zJOPJjUG0ji5xSt
 fWP7jRuk+/fkEyWrG5nOeAWZY6VGZFN2Ug22FBLLW9nfYutTGckcnfgRhgZm8juabD1Z
 sxemVcpZm9tLh6TDJkGTNR6CeranpXcWn0bpf8re6eujpAoo4RAxuKZIyFYWROhhC8sP
 4v63BVnaqz4TIRHUKZ6EaPaC+DKQdWTPj3Lm2hkoWzffETmW8cmYL+8k4XtQ48aotuWY
 rqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tsXaWPDFCIJL0eFGJmxAgDPaflUaGUSFFZi4g7kU/vk=;
 b=m2HI3Lb/XhuY7/6AirmXaUqikm7EFJQGLlqt+YNZqeeQ+xXgc5LLcUjWSLXWvKMlqp
 VPUYhkvaWMgx2j+Q9woK0ggmya5tFT+pDJY91vRfFh2DVFokQJUOr4eeNj87AxdOy254
 iAgrOVlTE+i3sNgWGr5c/Ok0Wyep36Q0zp0lnI1Hp5rdZ9OnQNyvTHtTPAzIhHVYv+5q
 KiHXSGbwhn+MH0YB+Umi+HjMOhZZlt4tEDLsSJc/YZveyc7eN5k006fGVswbK8XqdUqp
 TfXwIO7mf87fN8Rqe6ct8XdHgXk5VQHO8lhqbPnm/RWCYJ9BLq6oii4uepMz7LHAoXIz
 ufZQ==
X-Gm-Message-State: AOAM5310W2otxHdZlylfJVcz+m23nelFOjYazXPz70YBo5LsJ7J81xlt
 OO8r+38Jkv30VjNLqpq/OoyEzhSnOIqchg==
X-Google-Smtp-Source: ABdhPJyKbXSZREVR6ff7qdzpq733sNK8n+y6nl4ujacgOvIx4e1KShgz2devTypw57fVOzefoiNyJQ==
X-Received: by 2002:a05:6a00:2482:b0:4f7:644b:97b5 with SMTP id
 c2-20020a056a00248200b004f7644b97b5mr26487261pfv.37.1647309464271; 
 Mon, 14 Mar 2022 18:57:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
 by smtp.gmail.com with ESMTPSA id
 63-20020a630942000000b00372a99c1821sm17617557pgj.21.2022.03.14.18.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 18:57:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4] ppc64: Avoid pt_regs struct definition
Date: Mon, 14 Mar 2022 18:57:40 -0700
Message-Id: <20220315015740.847370-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=raj.khem@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Khem Raj <raj.khem@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove pt_regs indirection and instead reference gp_regs directly, this
makes it portable across musl/glibc

Use PT_* constants defined in asm/ptrace.h

Move the file to ppc64 subdir and leave ppc empty

Fixes
../qemu-6.2.0/linux-user/host/ppc64/../ppc/host-signal.h:16:32: error: incomplete definition of type 'struct pt_regs'
    return uc->uc_mcontext.regs->nip;
           ~~~~~~~~~~~~~~~~~~~~^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
---
v2: Drop ifdef __powerpc__
v3: Access go_regs directly and move the file to ppc64 dir
v4: Use PT_* constants defined in asm/ptrace.h

 linux-user/include/host/ppc/host-signal.h   | 38 -------------------
 linux-user/include/host/ppc64/host-signal.h | 42 ++++++++++++++++++++-
 2 files changed, 41 insertions(+), 39 deletions(-)
 delete mode 100644 linux-user/include/host/ppc/host-signal.h

diff --git a/linux-user/include/host/ppc/host-signal.h b/linux-user/include/host/ppc/host-signal.h
deleted file mode 100644
index b80384d135..0000000000
--- a/linux-user/include/host/ppc/host-signal.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/*
- * host-signal.h: signal info dependent on the host architecture
- *
- * Copyright (c) 2003-2005 Fabrice Bellard
- * Copyright (c) 2021 Linaro Limited
- *
- * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef PPC_HOST_SIGNAL_H
-#define PPC_HOST_SIGNAL_H
-
-/* The third argument to a SA_SIGINFO handler is ucontext_t. */
-typedef ucontext_t host_sigcontext;
-
-static inline uintptr_t host_signal_pc(host_sigcontext *uc)
-{
-    return uc->uc_mcontext.regs->nip;
-}
-
-static inline void host_signal_set_pc(host_sigcontext *uc, uintptr_t pc)
-{
-    uc->uc_mcontext.regs->nip = pc;
-}
-
-static inline void *host_signal_mask(host_sigcontext *uc)
-{
-    return &uc->uc_sigmask;
-}
-
-static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
-{
-    return uc->uc_mcontext.regs->trap != 0x400
-        && (uc->uc_mcontext.regs->dsisr & 0x02000000);
-}
-
-#endif
diff --git a/linux-user/include/host/ppc64/host-signal.h b/linux-user/include/host/ppc64/host-signal.h
index a353c22a90..c4ea866472 100644
--- a/linux-user/include/host/ppc64/host-signal.h
+++ b/linux-user/include/host/ppc64/host-signal.h
@@ -1 +1,41 @@
-#include "../ppc/host-signal.h"
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (c) 2003-2005 Fabrice Bellard
+ * Copyright (c) 2021 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef PPC_HOST_SIGNAL_H
+#define PPC_HOST_SIGNAL_H
+
+/* Needed for PT_* constants */
+#include <asm/ptrace.h>
+
+/* The third argument to a SA_SIGINFO handler is ucontext_t. */
+typedef ucontext_t host_sigcontext;
+
+static inline uintptr_t host_signal_pc(host_sigcontext *uc)
+{
+    return uc->uc_mcontext.gp_regs[PT_NIP];
+}
+
+static inline void host_signal_set_pc(host_sigcontext *uc, uintptr_t pc)
+{
+    uc->uc_mcontext.gp_regs[PT_NIP] = pc;
+}
+
+static inline void *host_signal_mask(host_sigcontext *uc)
+{
+    return &uc->uc_sigmask;
+}
+
+static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
+{
+    return uc->uc_mcontext.gp_regs[PT_TRAP] != 0x400
+        && (uc->uc_mcontext.gp_regs[PT_DSISR] & 0x02000000);
+}
+
+#endif
-- 
2.35.1


