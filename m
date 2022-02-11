Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 029EB4B1C16
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 03:16:49 +0100 (CET)
Received: from localhost ([::1]:41258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nILUO-0000oG-30
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 21:16:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKoZ-0005rm-UQ
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:33:36 -0500
Received: from [2607:f8b0:4864:20::434] (port=43564
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKo1-0007VW-Gs
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:33:11 -0500
Received: by mail-pf1-x434.google.com with SMTP id d187so13457799pfa.10
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E7JCU1a/pkRMOjn44wnlj8F4Wtu8gz5MK8RJjxKzysE=;
 b=fshm3hWQloyhBPjbfQtTna3OYyQUYODkY7XWqgbwLRrZgg9fQuLOK6RV7MSmk2mrJ1
 Oy2qg3/iWLu5Tkvw7hwm9mL12aW0buEXSFoUQ1GU6ZGOVQP1rpkThcte8cKI1x4D/fJb
 JPcufIPRP/telAky94qMvHZpw8DKonpMA9T7FgBERfJKDZwRkqbibT/f0ars1bwxW5Ka
 VFqgS4mcrn839gO1CKVaWDexOZo1Y5Q7M9XIe9YLBlPY1quMhwqZnX5aOdKpPNPZvqyB
 R/VCMZBO3q9L6LMfNLXu9kXyvUu/eA1ymW4rtwmgtPCyEJv+bJjk/5YQaFvKXvQLIxtC
 0WHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E7JCU1a/pkRMOjn44wnlj8F4Wtu8gz5MK8RJjxKzysE=;
 b=Ol1rjRwJS5ZB8AAPRSFrUfhBuaNrIZHc9k9n6SPnWSnDmhUQUUlpPfDm+JVzmPk2L9
 SE6MvgNACTxC4voRjDMBOVZseTJr1LB/3IGtNEWrMCiSUHfSjkwDcNWroAXnTpq+G9O3
 xL6HiSdmNWlWOM3Ohx25tSs3wj2HguTlEhn0PAT1bfPKoGfQgwjG56lr7e5rcmXHZDWT
 GZkQnR/WXeCzI7HkNnBAhRr8Dv4PDqshqnWdFVF+EX2oGY9t9Sw125xfmNpjmzc+wd1t
 gdXF/D6bExXP5UpwyOR9LkubucYZu1CqSTWewM0/fXzF0N33TbkVhcD+qLObz9UpBXml
 jTgQ==
X-Gm-Message-State: AOAM532/m2Du6XKEfb1Zq304mPSG207V+5TRFdXZrM901PVGZo3ptryu
 Di0q6T1l3hwFY2eO/najtF34kvMYxxLTnZAw
X-Google-Smtp-Source: ABdhPJwTuqdJha2W43dOMt73Fxi0CaeMrvonGqAigG3h7pD4pVzME9MQ0bc9eU5iWtW7W/KpteEqsA==
X-Received: by 2002:a63:5454:: with SMTP id e20mr8312601pgm.621.1644543180392; 
 Thu, 10 Feb 2022 17:33:00 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:33:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/34] tests/tcg/multiarch: Add sigbus.c
Date: Fri, 11 Feb 2022 12:30:59 +1100
Message-Id: <20220211013059.17994-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: peter.maydell@linaro.org
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


