Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BE6488A8C
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:28:56 +0100 (CET)
Received: from localhost ([::1]:43810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6b3v-00034B-FR
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:28:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6av4-0005l0-Nt
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:47 -0500
Received: from [2607:f8b0:4864:20::d2c] (port=34561
 helo=mail-io1-xd2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6av3-000779-AM
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:46 -0500
Received: by mail-io1-xd2c.google.com with SMTP id j1so4481629iob.1
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aSPn1D4N9Nfp4DBqbA7GxaN2fsEyfYy+UjlDYEXO52E=;
 b=T/5XNQKOm5MkT1yAtWuBkS05Faz0/OgwQdrRyV2AOfxw9lErd8L+kJZ/Z09j6PIPNr
 pquFEucrT2Gdj40PZbzMXpcl16dTKcSuRUJzkUIG6dZrGKnOCgzWr5VGw+4/bIjgT9uS
 fZsJc1Hr3Jh2jk63HYA5wVg6WZ9xudDH14YcdJX8SaV+CoVjW338YQmRLIXpZv6M0/Mw
 GDbmSJ52VXz4tomiCG6mZy4jxKU9kpKfTxO9lCFgZNjnOlANPTLyQ3OuSQDLGTYid5eq
 iIJSF6JKuuNZCQmqZCMpiRbRwgIO533o6VTFnFPd7xrVAm5KAoIXgsbICE8GGdxn/5PA
 dyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aSPn1D4N9Nfp4DBqbA7GxaN2fsEyfYy+UjlDYEXO52E=;
 b=2UMMMkvNMv2nXm9TleImiVBCVQ6H+nBbndZfY3s3L6LU0xdqSpLqE+Wj44IrOT4pI/
 3Bo42dXU5RvJ3NmGfM3E7LML7HSG6BUXhqZlX5v1h165dR2/mVTB8xYXppP60uL8fjHJ
 x1dR1QOCR1M5gQKxfD+2pEYNizEFkRtUG10izl3jdDb8RW6fKYPsItIiPpFta6q5AMPd
 1DPvhOsA66NevFmchcLZDRp5FHEXZNz+5qD7K4hU7nlY657jLTeQq8/R58rB4wT/CNM9
 4Qrrxq3rfO0ky7uxFvjjClXmjf5Sx5dE7K3Pbnaozk8sQpAxDbDnz85stNXUEq+Eqg3u
 a4xA==
X-Gm-Message-State: AOAM531rSFqIpzdeaXPscV93DGiaJ65HGebQWGAJeivlJz9vQjrWygjq
 3GT1pPe/S2OsSnuAU3iJHIdabeOB2oaAX67j
X-Google-Smtp-Source: ABdhPJx106QswmlYpK72eg5pf3KTSS7QG0HO5hO11iVaK5n4/KuCYB4cTk503yYEMcMP1ZC8NztonA==
X-Received: by 2002:a02:cc2a:: with SMTP id o10mr33727847jap.197.1641745183962; 
 Sun, 09 Jan 2022 08:19:43 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:43 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/30] bsd-user/host/i386/host-signal.h: Implement
 host_signal_*
Date: Sun,  9 Jan 2022 09:19:05 -0700
Message-Id: <20220109161923.85683-13-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement host_signal_pc, host_signal_set_pc and host_signal_write for
i386.

Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/host/i386/host-signal.h | 37 ++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 bsd-user/host/i386/host-signal.h

diff --git a/bsd-user/host/i386/host-signal.h b/bsd-user/host/i386/host-signal.h
new file mode 100644
index 00000000000..169e61b154c
--- /dev/null
+++ b/bsd-user/host/i386/host-signal.h
@@ -0,0 +1,37 @@
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (c) 2021 Warner Losh
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef I386_HOST_SIGNAL_H
+#define I386_HOST_SIGNAL_H
+
+#include <sys/ucontext.h>
+#include <machine/trap.h>
+#include <vm/pmap.h>
+#include <machine/pmap.h>
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.mc_eip;
+}
+
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+{
+    uc->uc_mcontext.mc_eip = pc;
+}
+
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+{
+    /*
+     * Look in sys/i386/i386/trap.c. NOTE: mc_err == tr_err due to type punning
+     * between a trapframe and mcontext on FreeBSD/i386.
+     */
+    return uc->uc_mcontext.mc_trapno == T_PAGEFLT &&
+        uc->uc_mcontext.mc_err & PGEX_W;
+}
+
+#endif
-- 
2.33.1


