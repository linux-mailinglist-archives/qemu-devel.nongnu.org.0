Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 363C4678DEA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 03:07:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK8gd-0008On-0o; Mon, 23 Jan 2023 21:05:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8ga-0008OJ-On
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:20 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8gY-0003oT-Ag
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:19 -0500
Received: by mail-pl1-x62a.google.com with SMTP id a18so789830plm.2
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 18:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CfRyloWDcwQ5PnWko6alt4B+5d+l5sPHbkZcyIVlTxE=;
 b=lWTxdJNpXyotrOLdViv5VBxkHWatqx597XhzkbfENSkcvsmY9qyGTquad9psZj1hGQ
 U8lqzsM8+PLH1HWXE/IfoKWrpd63UoLfhAMaZEdUNsE6QO/fLyvuYJawH48YSbtHzIQ6
 219k5ODe/LhptpNQiKRj+lKjqBTkWAucF+M+z6IYZU1tXD7wRO5PKAzN38bDHG3SS5wc
 F2Y7/qMcwnqQrtfMYiiAgHx7XzutcjZTrjFx8FzicweOYb5Fab5HmkQmKaecJHqm53IX
 TuzN29SfSy5mcvOW6k1+lYZXp4mcKaQjYYx4iXF170oUEINXQEHW3gnf9XmHb7tnuY6b
 ++Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CfRyloWDcwQ5PnWko6alt4B+5d+l5sPHbkZcyIVlTxE=;
 b=z3O1iU0r97lThc2flxYpXqOEmqetxDDHFLg+rIV6QSZQ+Zzrf6LQJG0ny6+n+Sk3dH
 fMFksHsB+JQ5F4G091l2k4IgcqjQetWftBXdBI/VCo//QzD5H0uHefiEThS3XMwbjgcs
 qaigjcngIfLSvVZK5W1/k44lwA5yrml90fS27/ztDg/NEiGL8VRS8mQPIi7U/SNh0q78
 7bTgD8z28w/HCWk/TCdk0VtdhAKhtYPXhET4I3eTbmgMNANNslhRW93KDpMR0R1TcaEf
 KRc/XCYGzK7eyLGQOmjZSCcpybjSwysF747iL7qRmaGtgrvszUM6O0KnhmBNDv7Vv9jA
 2fng==
X-Gm-Message-State: AFqh2kqVIvkry9ZAqzS0gFPm+xtf6kjGkhfyr31lO4DOmYuzgNkA4hCy
 bBzpoNd/UwsBIi1MMaTVdtltifoQPi5bWaRr
X-Google-Smtp-Source: AMrXdXvskSkykSQWRfzmX31nsxAdGCzkuFujXjMp/CBlff8nVJuNBWt3V7ydALb8GJiUbeLsx+xYiA==
X-Received: by 2002:a17:90a:460f:b0:227:23c3:5db1 with SMTP id
 w15-20020a17090a460f00b0022723c35db1mr27648486pjg.47.1674525916783; 
 Mon, 23 Jan 2023 18:05:16 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 fh3-20020a17090b034300b00228e56d375asm283936pjb.33.2023.01.23.18.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 18:05:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL v2 04/15] linux-user: Implment host/ppc/host-signal.h
Date: Mon, 23 Jan 2023 16:04:56 -1000
Message-Id: <20230124020507.3732200-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124020507.3732200-1-richard.henderson@linaro.org>
References: <20230124020507.3732200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This commit re-enables ppc32 as a linux-user host,
as existance of the directory is noted by configure.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1097
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220729172141.1789105-3-richard.henderson@linaro.org>
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


