Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A194A4D8F18
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 22:52:50 +0100 (CET)
Received: from localhost ([::1]:57844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTscT-0003hB-F2
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 17:52:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1nTsbT-0002K7-Te; Mon, 14 Mar 2022 17:51:47 -0400
Received: from [2607:f8b0:4864:20::636] (port=34354
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1nTsbS-00012s-65; Mon, 14 Mar 2022 17:51:47 -0400
Received: by mail-pl1-x636.google.com with SMTP id r12so14673130pla.1;
 Mon, 14 Mar 2022 14:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=in3iROJeFG25tett3Ov3ylKhsKzH7+okoPDqyE0tPOs=;
 b=N6x01I8l81FGlJ58oxZWwfm/Euk69JLPgBU6MF9iQXd+ZhKX1MoEYPxQpq4IVzqfIU
 39o48SETKeLuhunJ3+F0YztAzts5WWjiVPbCWqEndUHFWwgBl/wjN8Wp2+94sIIb81Jb
 8kAvEfS1pFFtO99pLPvkTdk4AU6e0+6y83jewfZcOEDr4NvoLQFa8Ym1Raw/TjWTjWXn
 hswfbPTh5GGOdE4WHw0T/kqQT5kW3mtYkFPyXB2T0VMgCV0LoiOL2dvftZvczcM3G+K6
 Nj09DjX3jRZFJhRGU6pwv6zX/LgE6pJ1L9ffrc4Vag7mCNzzK3KN0XMM+LTMeUe/ITDa
 wiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=in3iROJeFG25tett3Ov3ylKhsKzH7+okoPDqyE0tPOs=;
 b=HNbmi9ZaJCVjm1zF6or9jtKGlmisjkbAvi8hs1v8ua7bKaXtGX8xBydMP45FK+pus5
 lhuqgTGvv9AknAUUbwSZaEcaqPClFqVMuBfcOPgR/XUG1lRHY7ZrRe6WmrZeVicDnrKX
 cf+NZUQRs7BExgq+Ga8qo3uEqhD0F0TZ2hi8P0tIjjuvMM+bh/vMDu5zrFlDWHL61/RF
 mWRtvZ3zqXWCEc92QED5Unc0FgGTlAMRgXbMUbuOrKyQ+UtlptqKXNT9lw4SE1/EAF8o
 w5dN8reeHA876+CGPgcTXjMI4LrZc3flGK/f3bLo9JcsXdwnn/0mEkkOqlZlrnUdkoIx
 9cIA==
X-Gm-Message-State: AOAM532FewZiGsw1kbgNJo4CKBJbDYVBM8wn7dXuoi49nkzbZM75KYc0
 bhpnY8S1C+pnn1L9otPmuc3Ik1iv6TZjdA==
X-Google-Smtp-Source: ABdhPJyHal2lHo4Ylm2ApF7pahWgTmBhRzFzXRUJCw5c87NXx+MScRrcGZqrtsZYPclRdM+TrwtsPQ==
X-Received: by 2002:a17:902:bd95:b0:14f:40ab:270e with SMTP id
 q21-20020a170902bd9500b0014f40ab270emr25338171pls.101.1647294704106; 
 Mon, 14 Mar 2022 14:51:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a654006000000b00346193b405fsm17356528pgp.44.2022.03.14.14.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 14:51:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] ppc64: Avoid pt_regs struct definition
Date: Mon, 14 Mar 2022 14:51:38 -0700
Message-Id: <20220314215138.1355256-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=raj.khem@gmail.com; helo=mail-pl1-x636.google.com
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

 linux-user/include/host/ppc/host-signal.h   | 38 --------------------
 linux-user/include/host/ppc64/host-signal.h | 39 ++++++++++++++++++++-
 2 files changed, 38 insertions(+), 39 deletions(-)
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
index a353c22a90..b46143c2f0 100644
--- a/linux-user/include/host/ppc64/host-signal.h
+++ b/linux-user/include/host/ppc64/host-signal.h
@@ -1 +1,38 @@
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
+/* The third argument to a SA_SIGINFO handler is ucontext_t. */
+typedef ucontext_t host_sigcontext;
+
+static inline uintptr_t host_signal_pc(host_sigcontext *uc)
+{
+    return uc->uc_mcontext.gp_regs[32];
+}
+
+static inline void host_signal_set_pc(host_sigcontext *uc, uintptr_t pc)
+{
+    uc->uc_mcontext.gp_regs[32] = pc;
+}
+
+static inline void *host_signal_mask(host_sigcontext *uc)
+{
+    return &uc->uc_sigmask;
+}
+
+static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
+{
+    return uc->uc_mcontext.gp_regs[40] != 0x400
+        && (uc->uc_mcontext.gp_regs[42] & 0x02000000);
+}
+
+#endif
-- 
2.35.1


