Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D189488A92
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:32:27 +0100 (CET)
Received: from localhost ([::1]:55032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6b7K-0002FV-N1
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:32:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6av3-0005kK-T8
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:46 -0500
Received: from [2607:f8b0:4864:20::d34] (port=38776
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6av2-000770-F7
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:45 -0500
Received: by mail-io1-xd34.google.com with SMTP id u8so14396878iol.5
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m6zT6JmKfXUxNyMR/vcgYSHHm0Jg54YZ5K/1F7EtxxU=;
 b=6Rh1fTkPJDtjmQJAI/U6koy7sZ5zlBP2ELNeY7wGSLX1NEG7xKuSCdAyRU5jpSp6+l
 DsPT3nmJKB2XfWBEWY0Pu3NcuAuQg2ijU++T2il+8hmhgZLjPRkwGW89ayj1hZL8LOGC
 ufJYkzpLZqHEdf6XJF1t9vFQZvIFug6jNERXpY+o8KXaKsb7yRkdfT0BYJMZWZMF41ix
 5erRKXpuj08Sp0NQDlL4rApv8xjdHWoLv2/x6txLIBlJcjJN4bqPQN42zmX+9Zwr1HN/
 vr57SG31PlCcYRvOoF1YxGQUbDSwfDJMw5a+IMfBO9hSmokFwGHfWYfSWlDoDpkiWB5a
 topg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m6zT6JmKfXUxNyMR/vcgYSHHm0Jg54YZ5K/1F7EtxxU=;
 b=vXTPZljHZGi9xpdBeAbhn2ksxwwNWGMbsW86lPFtxe7rEst6FQNTnuu9OELMSr6ACp
 B3g1RU8faxmXrwtKa4UkiqKwUmm1Y8tv5nIk/vWAZDIQ97PqVcgbyP3pczYwSA0WtMeY
 TqB6qT8JODlF218xEQYHygGrbLAoXXLcOYFV6rfT5afj34JAIyy7r9tO8G62WHYW2vIH
 S2RlnTW+v/i4iKRRIhlofH3bVJMQsoFR784gfzGVYQ4SW4u0tjAL+LI8FzP+6p/kuSnh
 u37I8Y9wWXVOyFuNY8SJ+EegCeStIBRIJij/quuwwQRejMLk7GhJp2ErXM7XcoMYK1+U
 Qxhg==
X-Gm-Message-State: AOAM531DOcyMn8cldgn5QA8syXmTgjtO3DCE0lXOb5A4vEPTTs1Ru3zx
 yLV88n5K3f0kATJPn+OT/PYozl2Xs8nHws/8
X-Google-Smtp-Source: ABdhPJxXbTvIyf6WtyVmcjfUCYp98DDGTdNJjK8CWo4/qlt4YEQRohMuL3WlkJ08sKVIwXP/theTIA==
X-Received: by 2002:a05:6638:183:: with SMTP id
 a3mr30980033jaq.51.1641745183095; 
 Sun, 09 Jan 2022 08:19:43 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:41 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/30] bsd-user/host/arm/host-signal.h: Implement host_signal_*
Date: Sun,  9 Jan 2022 09:19:04 -0700
Message-Id: <20220109161923.85683-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
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
arm.

Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/host/arm/host-signal.h | 39 +++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 bsd-user/host/arm/host-signal.h

diff --git a/bsd-user/host/arm/host-signal.h b/bsd-user/host/arm/host-signal.h
new file mode 100644
index 00000000000..e403c26caed
--- /dev/null
+++ b/bsd-user/host/arm/host-signal.h
@@ -0,0 +1,39 @@
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (c) 2021 Warner Losh
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef ARM_HOST_SIGNAL_H
+#define ARM_HOST_SIGNAL_H
+
+#include <sys/ucontext.h>
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.__gregs[_REG_PC];
+}
+
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+{
+    uc->uc_mcontext.__gregs[_REG_PC] = pc;
+}
+
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+{
+    /*
+     * In the FSR, bit 11 is WnR. FreeBSD returns this as part of the
+     * si_info.si_trapno which we don't have access to here.  We assume that uc
+     * is part of a trapframe and reach around to get to the si_info that's in
+     * the sigframe just before it, though this may be unwise.
+     */
+    siginfo_t *si;
+    si = &((siginfo_t *)uc)[-1];
+    uint32_t fsr = si->si_trapno;
+
+    return extract32(fsr, 11, 1);
+}
+
+#endif
-- 
2.33.1


