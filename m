Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 587F758546E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 19:24:46 +0200 (CEST)
Received: from localhost ([::1]:36214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHTjB-0007WI-EU
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 13:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHTgM-0002pq-C4
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 13:21:50 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:34415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHTgJ-0003nm-FP
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 13:21:49 -0400
Received: by mail-pl1-x632.google.com with SMTP id z19so5190057plb.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 10:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0q4lynJszics53xcZKYUS9IEsGSast3cy0Ggpgs4xg4=;
 b=rt0qJ1Xj3xiS3VZPwZe413MA0FzWOr8P+yzdbdX/mhWGiRaoS907oCWvpH9mUcDQve
 nm2YkLen9Unm4jTHLYERCK/JpNeqW/j/f0ZTbuKkG3PHrPEz7FJefowONfRkV95x8ALx
 PSzVt4CXioxGHwc05UIzWSNbkk3iFE1iK3J4IRNzu4AEQYVkJMmHXnEFQC9SqVcsa5DP
 ROV3X4zQcFNrPp3LZVYqZtR+fotr9Q2bNNQhq7QrvPA/9cPYMXtvm6ML1L52SaoDc1W1
 CApwoQLhZecYVfvj+bAFBg39TOhSmQjlH9UQRv0l/zFOmT3Vxj/DTi7Z2Kk/otlKAJQS
 Ogsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0q4lynJszics53xcZKYUS9IEsGSast3cy0Ggpgs4xg4=;
 b=VnM3K1KA/NGNqneG3iHk2A6bdy3Xlsn7A5pdkesfaRKIneRcOt+iZgZ6Ex0RRdK1sh
 9OHodzlb3l8SpxdkVKpKPS2+sjZatEKRGKdp/J2QYK2i8lSdaZDHRggxkRBL0g7vR3DA
 uGA22mGeDpzDkccFy4GojHuYW78Ul6Y8xutPNbEnrqtyKf9ehgBp6RNQRrQ+Es2idB9w
 WSPOwx7JRWzWnbcYPFCGpuOLg9q4e0EBkisjP5qwvC4cCQYoPptSHYEDPcM+9zsScDsX
 X/25OVQ4oZ64Xcj++FElvFWzWlQv/Aw51ybD3GOI98GSPYcLQWRIznZMETVcguZ+jpCL
 nXrw==
X-Gm-Message-State: ACgBeo00NJ0z0JNeNpBDArVdA0r707YZMIFJfxSkbNR6MvcR52gcpl5x
 IQwFxxIz6K7IErtelxswmP0pu+QqH4yAHA==
X-Google-Smtp-Source: AA6agR6R3frQmRLOROcArVyYIwMLHaH3GDQ7o+dK9QnSGm93SF7+OPk/+cvr4H3K+fmpkBQSYf+pOw==
X-Received: by 2002:a17:90a:1c01:b0:1f1:bf54:67ff with SMTP id
 s1-20020a17090a1c0100b001f1bf5467ffmr5782119pjs.172.1659115306036; 
 Fri, 29 Jul 2022 10:21:46 -0700 (PDT)
Received: from stoup.. ([2602:ae:1549:801:51c4:5cf0:5954:aeb6])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a170902aa9200b0016bb24f5d19sm3881039plr.209.2022.07.29.10.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 10:21:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk,
	qemu-ppc@nongnu.org,
	laurent@vivier.eu
Subject: [PATCH 2/2] linux-user: Implment host/ppc/host-signal.h
Date: Fri, 29 Jul 2022 10:21:41 -0700
Message-Id: <20220729172141.1789105-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220729172141.1789105-1-richard.henderson@linaro.org>
References: <20220729172141.1789105-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit re-enables ppc32 as a linux-user host,
as existance of the directory is noted by configure.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1097
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/include/host/ppc/host-signal.h | 39 +++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 linux-user/include/host/ppc/host-signal.h

diff --git a/linux-user/include/host/ppc/host-signal.h b/linux-user/include/host/ppc/host-signal.h
new file mode 100644
index 0000000000..de25c803f5
--- /dev/null
+++ b/linux-user/include/host/ppc/host-signal.h
@@ -0,0 +1,39 @@
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (c) 2022 Linaro Ltd.
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef PPC_HOST_SIGNAL_H
+#define PPC_HOST_SIGNAL_H
+
+#include <asm/ptrace.h>
+
+/* The third argument to a SA_SIGINFO handler is ucontext_t. */
+typedef ucontext_t host_sigcontext;
+
+static inline uintptr_t host_signal_pc(host_sigcontext *uc)
+{
+    return uc->uc_mcontext.regs->nip;
+}
+
+static inline void host_signal_set_pc(host_sigcontext *uc, uintptr_t pc)
+{
+    uc->uc_mcontext.regs->nip = pc;
+}
+
+static inline void *host_signal_mask(host_sigcontext *uc)
+{
+    return &uc->uc_sigmask;
+}
+
+static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
+{
+    return uc->uc_mcontext.regs->trap != 0x400
+        && (uc->uc_mcontext.regs->dsisr & 0x02000000);
+}
+
+#endif
-- 
2.34.1


