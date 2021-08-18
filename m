Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F063F0BE5
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:38:22 +0200 (CEST)
Received: from localhost ([::1]:37462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGROH-0006Cf-LO
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9m-0006wY-CJ
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:22 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:42826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9k-0002hg-SZ
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:22 -0400
Received: by mail-pg1-x52a.google.com with SMTP id o2so3321107pgr.9
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JXEm0LQzBp7FYdF62IKS2HTHAwaTAwDqUq6VzQ5+a94=;
 b=OJ9ARlXAKpe6HnHZg5cvb29ZHSPVC/71Ca5wVU9Tm7G5az3cRuU5+rygL8RV7vK5Ce
 Yasfs9JPUqdUKDo5hIXiEya8ge8s4sbNlwzaOdM/MvSUxhnK9gii17ixWL64rcPh964c
 2J2jxDdN4AlRlaAN35zI92MfCjVS3ScDX8w2DFJlJnJrjieETDLEl8CDiHvrAS2olkuA
 b3s59hh2aiPI3uFkMbQeSy0lT0dh3BNiDyu5jZAT86E4KxM89j1uUGHGJiVm0blosiq1
 6MZ6DOLrHuIBHkBap1XrIRZ+p0ky8GfdwftQWcDTjckZscDNevmpxM26kP1N2r/RUpqW
 bPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JXEm0LQzBp7FYdF62IKS2HTHAwaTAwDqUq6VzQ5+a94=;
 b=ClDorK50aJ15O/QKpC6Ublf2WtW6bm/Yo8OckrxzR0dRm8FWrLsaLEc6Yg0yJoLVNu
 3z6MHPIstVZ6r3ry/7UFoWHhn4LRhwBElrfVI4n5eSt72itkPFpeKtWomUn/q8DZqV3D
 ZspaoiMr49X0IbdeBF+qnaZ1limEGnkmo4Vx90735RfZj15CBu/U8UuM8WYOHXTGwiln
 eUbKtg5HyIVeWrUinLVMiwSf/JlzIWEoN1evV1fPks9PgOADFQATvJKIwNQkgSFbvwkd
 xb6VT+4Lovy6lOgdaw5PQP15rDqBFUShQSGmGjo0BxM4PdlKZAYsGzQODsBbFuSiYww1
 gkKQ==
X-Gm-Message-State: AOAM531WV0dZ0kI6753LcAfw3960nOOe9qJd52+0Fbl5NHThFCkpNb6D
 RCugwwg0UlFIklePMHb+jzaOKEou1TQxhA==
X-Google-Smtp-Source: ABdhPJz7KqSUsLpvTbpXkWtxNREOl2mORkO8FD9uq1/2k3hYM0PdKkEou1f9DSxqIv05CkT7YdW48g==
X-Received: by 2002:a63:475f:: with SMTP id w31mr10439984pgk.5.1629314599598; 
 Wed, 18 Aug 2021 12:23:19 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w82sm569302pff.112.2021.08.18.12.23.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:23:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 45/66] tests/tcg/multiarch: Add sigbus.c
Date: Wed, 18 Aug 2021 09:18:59 -1000
Message-Id: <20210818191920.390759-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

A mostly generic test for unaligned access raising SIGBUS.

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


