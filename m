Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49EF483A8E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 03:23:50 +0100 (CET)
Received: from localhost ([::1]:34178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ZUM-0005hv-0A
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 21:23:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4ZMd-0002mV-Em
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 21:15:51 -0500
Received: from [2607:f8b0:4864:20::533] (port=40477
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4ZMb-0008AY-P4
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 21:15:51 -0500
Received: by mail-pg1-x533.google.com with SMTP id l10so31434259pgm.7
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 18:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E7JCU1a/pkRMOjn44wnlj8F4Wtu8gz5MK8RJjxKzysE=;
 b=LlnvOaleMsTHTr5F9hF2bNEryy2962/e1nWidwAX+7EafwpH8JbIQAYfKuGERIHI1u
 pMiGVZ+948Q7XoO+polkah2l6mRFRQAe7eSTlEGG4zqavB6FlNSYDH0FrbbT4fwCwXU8
 8B/bTIKSCTIDlNKGnXri6eHq6MVpExzdur+ZGRe9uOWF5pHZWALx54Em2Fi/dn6cRaRG
 ZDKjTPSOMxnRJNkXgAfFgTJt37SQNcFNzuPJ+yIYjjEX7ZpafAfY+wlDpeQRzPyyhLNW
 BKaIRHhgqjC0JbU3Tw7V6fdTR16uRV2jphU7VWwfk1g8oX7VBigUK3X6rGSDjPIY0UTG
 3oIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E7JCU1a/pkRMOjn44wnlj8F4Wtu8gz5MK8RJjxKzysE=;
 b=Cgh5iWMOiaBoxUXR11kqDBTzYhdF4NClSUaieWr1e9QahNvO6UbRLy5b9qk4neNwlg
 KnHntfI2MH1LsXMPXTCLZ6MAIFAUlhiofxN4/p6ZSVSAfvA5Xz+7nPJv2ZYitZDWpeql
 cBrhDNrsFUYXWjBvN48If0kU+vbM2McV3hsXfz3SRB6FnWThU/+MReg5TDqbPKNGJDxd
 59Kh7ievMGRITlCGXO6Gx+v2MQj9sNSWAxvv0Ronw9ga9NJNYE0iRxG+ruWFd2LtmmK0
 Td/WUrJzbtMtBYyc+N67djNPwlZuObPMqhK7VxTQtTi9QylMk4nw/hLfniKMTmuRh37q
 3XuQ==
X-Gm-Message-State: AOAM532OgunogVHaJ0cq7FuGIjO/L433ryWMAAUb5pAbeYxmZMzwEQaP
 Ls7ccKwnEGJUf7MPEmqe7NqAdNqqJzeYHg==
X-Google-Smtp-Source: ABdhPJxW5qU7odljVwoSJIlfoR8UKdqHTRZJl+bAWduiRS4ypFs3dkkL+2UgAn2tREd7ogasfKpu1g==
X-Received: by 2002:a63:9854:: with SMTP id l20mr42317871pgo.536.1641262548536; 
 Mon, 03 Jan 2022 18:15:48 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b4sm37395501pjm.17.2022.01.03.18.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 18:15:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 7/7] tests/tcg/multiarch: Add sigbus.c
Date: Mon,  3 Jan 2022 18:15:43 -0800
Message-Id: <20220104021543.396571-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220104021543.396571-1-richard.henderson@linaro.org>
References: <20220104021543.396571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: git@xen0n.name, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A mostly generic test for unaligned access raising SIGBUS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/multiarch/sigbus.c | 68 ++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 tests/tcg/multiarch/sigbus.c

diff --git a/tests/tcg/multiarch/sigbus.c b/tests/tcg/multiarch/sigbus.c
new file mode 100644
index 0000000000..8134c5fd56
--- /dev/null
+++ b/tests/tcg/multiarch/sigbus.c
@@ -0,0 +1,68 @@
+#define _GNU_SOURCE 1
+
+#include <assert.h>
+#include <stdlib.h>
+#include <signal.h>
+#include <endian.h>
+
+
+unsigned long long x = 0x8877665544332211ull;
+void * volatile p = (void *)&x + 1;
+
+void sigbus(int sig, siginfo_t *info, void *uc)
+{
+    assert(sig == SIGBUS);
+    assert(info->si_signo == SIGBUS);
+#ifdef BUS_ADRALN
+    assert(info->si_code == BUS_ADRALN);
+#endif
+    assert(info->si_addr == p);
+    exit(EXIT_SUCCESS);
+}
+
+int main()
+{
+    struct sigaction sa = {
+        .sa_sigaction = sigbus,
+        .sa_flags = SA_SIGINFO
+    };
+    int allow_fail = 0;
+    int tmp;
+
+    tmp = sigaction(SIGBUS, &sa, NULL);
+    assert(tmp == 0);
+
+    /*
+     * Select an operation that's likely to enforce alignment.
+     * On many guests that support unaligned accesses by default,
+     * this is often an atomic operation.
+     */
+#if defined(__aarch64__)
+    asm volatile("ldxr %w0,[%1]" : "=r"(tmp) : "r"(p) : "memory");
+#elif defined(__alpha__)
+    asm volatile("ldl_l %0,0(%1)" : "=r"(tmp) : "r"(p) : "memory");
+#elif defined(__arm__)
+    asm volatile("ldrex %0,[%1]" : "=r"(tmp) : "r"(p) : "memory");
+#elif defined(__powerpc__)
+    asm volatile("lwarx %0,0,%1" : "=r"(tmp) : "r"(p) : "memory");
+#elif defined(__riscv_atomic)
+    asm volatile("lr.w %0,(%1)" : "=r"(tmp) : "r"(p) : "memory");
+#else
+    /* No insn known to fault unaligned -- try for a straight load. */
+    allow_fail = 1;
+    tmp = *(volatile int *)p;
+#endif
+
+    assert(allow_fail);
+
+    /*
+     * We didn't see a signal.
+     * We might as well validate the unaligned load worked.
+     */
+    if (BYTE_ORDER == LITTLE_ENDIAN) {
+        assert(tmp == 0x55443322);
+    } else {
+        assert(tmp == 0x77665544);
+    }
+    return EXIT_SUCCESS;
+}
-- 
2.25.1


