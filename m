Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9325A4A50AF
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:59:21 +0100 (CET)
Received: from localhost ([::1]:43986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdlg-0007eL-NC
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:59:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcni-000526-8s
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:22 -0500
Received: from [2607:f8b0:4864:20::130] (port=42924
 helo=mail-il1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002eS-Ld
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:21 -0500
Received: by mail-il1-x130.google.com with SMTP id u5so12377696ilq.9
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1mpwYZNs4mJXgxPDyP8VAeZVM/ryFURuOJnVXj3MG+M=;
 b=nKEYO/7CHzriQbLWuFHMcY04draIWrhA+9IGrcCA6hE+GbMamelk1FQHllIajU8G4z
 U38MB8FUq+MevkswhvhKGoHAI/V2vlsjTVqCFXvyLwsGgkDBIM1ZFLpHmmmgjl8hFNYw
 PV1SHP9F2zF5PQbKNJCSuLTtzus5IGwKJq7oytn6Lt0PCX5l9jxOAqetb5XKPrp3KOHQ
 pf+DCZyms+KjRj2M/jTQaVeiO0Yy+uKHJdoR72lo4AEZQQzS/WGxtM9UzqbUqxDgt9PJ
 Qo45DA+6Qj7m4BrKncI6eiPscaTIO9gSH4YjnXP0264kFDE8Id45HjVZPXRV2mMBfx0W
 MZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1mpwYZNs4mJXgxPDyP8VAeZVM/ryFURuOJnVXj3MG+M=;
 b=u4W6tmeBQ3AoCSj+Hvq/mkXTXn3p3sVLFS6UaKnop4of+vYQ88tKeFS5w88jWRq4Nz
 pp+yFRoCz9f8++J+VlYek79QsB3qR4deQemqd1xFmEnvScOF4RLV8SZxr7I5Dgq6vJpS
 2rM08Kp2Iem3nXbVZYVECaYASYneKBkJp1LOaIXtyWpNxuw76QwiZDhL8AkZHjDorynK
 ancvIvAZM1QyAOAj2yPi0QuC7E+tLFgHfQ1d6F0vnvC+PD54zWtdA9cyMSpGGGq5Ec/N
 aejp3ntdsbG5iQ7ZuJ6/lm4FzZuos9YiB/qPZDQvZ3uZ9WwuzWp680AcFDkputTBFOFF
 mRpQ==
X-Gm-Message-State: AOAM531qSaleFFqwQjVWmYqypMkQY0Pmq4Yk+Yr0jpW3OdDeh/saBtgJ
 l5yKnTjeZbYaXXNu6vDQ8pGW3oP7N1ffgg==
X-Google-Smtp-Source: ABdhPJz5yW3FBCXlmO2sZ9eo+cXfsvxfdlCKDcvdjzGaY8T/TgqnGo02mySyKrIAzBc5bkHNB0KqVw==
X-Received: by 2002:a05:6e02:170c:: with SMTP id
 u12mr2183746ill.135.1643659009354; 
 Mon, 31 Jan 2022 11:56:49 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:48 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/40] bsd-user/host/arm/host-signal.h: Implement host_signal_*
Date: Mon, 31 Jan 2022 12:56:15 -0700
Message-Id: <20220131195636.31991-20-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::130
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement host_signal_pc, host_signal_set_pc and host_signal_write for
arm.

Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/host/arm/host-signal.h | 35 +++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 bsd-user/host/arm/host-signal.h

diff --git a/bsd-user/host/arm/host-signal.h b/bsd-user/host/arm/host-signal.h
new file mode 100644
index 00000000000..56679bd6993
--- /dev/null
+++ b/bsd-user/host/arm/host-signal.h
@@ -0,0 +1,35 @@
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
+     * si_info.si_trapno.
+     */
+    uint32_t fsr = info->si_trapno;
+
+    return extract32(fsr, 11, 1);
+}
+
+#endif
-- 
2.33.1


