Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 313C5625562
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:34:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otP6B-00019K-9g; Fri, 11 Nov 2022 03:09:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otP5X-00010b-KQ
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 03:08:38 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otP5V-0002EB-Sv
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 03:08:35 -0500
Received: by mail-pl1-x62d.google.com with SMTP id b21so3658913plc.9
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 00:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LHzGWvWFa4q7FhR/Zjnl6sZxcznG5V94Bca4nmBi0Ko=;
 b=qkhUeX01mXmwLEpnlMn4JGC+33leHf2BgJAFuiM5Szg4YM5J7/Sm8aXK5O3aSrl4Ox
 tZK453w4opLKeeAsAMGW77RLJ/U3hPcE5VXw0r1wbuFbqqinGPkjoZRiWqe07ilDvXlf
 HLxeTN07hdz1IBsqjrrZvojSmwid2fdlZWpfwIxp9Fcvf88qqV5+Nvey7K31oi/cIEwB
 RYdls/oNIPm/k0tzv7KUavdx8gbBTGMVyL7BVtdO5G50mbQ48IYp/wvOKmpVyDFHwhgl
 GiKbyRvNFVGa4zs5Lsps8mKMFASpOlpxxkozWe9P5OpQMb6CWyMhUZoylJlTUcgO1YaX
 cMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LHzGWvWFa4q7FhR/Zjnl6sZxcznG5V94Bca4nmBi0Ko=;
 b=AYDNyPAdyIYv3IYuYyScvbh5oUXTnQsNY35FMZE7yvMZqS5L1QwntxAy/CKO8Wer/7
 Gda4hMIaQvZOtPUXnBJpUlPatdQ9RloX+DAJEZZOmyYcqniIQGp/88nI1DM7jsLxh7Oe
 J+orlsWHYBvxMhiKu3/hkFlvTDKaUMl1JRrf1QPkqjqcor3SPUwWdv2JHhM5L4oL2tIP
 4FS4h0Dq/14IolLqnMMzA1kEPYzwaIWbmZ+OEZgtddVGx4kiqYvlX2cScQnQ8Zzy8rrD
 dHWAA1oYUk+lGJtGtnDTlfI5dw8ixkycXvutact1CMDiILi8ZZZStoSQ7t6evFHyBvpn
 3puQ==
X-Gm-Message-State: ANoB5pmNRjyFI7CzpVV9F/UGtY0XHA8pIoj6UCB63micame6W1XT11gu
 gA/IFz4RQI4LbztcwNZupUz+/Rq3NF3bQMMp
X-Google-Smtp-Source: AA0mqf5k0/bh04Q5ymkv90BiEJEF4igiXf8A5mJzijHzUTalhRLbyEuaGZRbNV3ydPMaUYyyiplR7Q==
X-Received: by 2002:a17:90a:2c4a:b0:206:f02a:cb4b with SMTP id
 p10-20020a17090a2c4a00b00206f02acb4bmr705255pjm.159.1668154112628; 
 Fri, 11 Nov 2022 00:08:32 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a170902c3c400b00186a2dd3ffdsm1046341plj.15.2022.11.11.00.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 00:08:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com,
	david@redhat.com
Subject: [PATCH for-8.0 v2 02/13] tests/tcg/s390x: Add clst.c
Date: Fri, 11 Nov 2022 18:08:09 +1000
Message-Id: <20221111080820.2132412-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111080820.2132412-1-richard.henderson@linaro.org>
References: <20221111080820.2132412-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a basic test to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20221025213008.2209006-2-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/s390x/clst.c          | 82 +++++++++++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 tests/tcg/s390x/clst.c

diff --git a/tests/tcg/s390x/clst.c b/tests/tcg/s390x/clst.c
new file mode 100644
index 0000000000..ed2fe7326c
--- /dev/null
+++ b/tests/tcg/s390x/clst.c
@@ -0,0 +1,82 @@
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <stdlib.h>
+
+static int clst(char sep, const char **s1, const char **s2)
+{
+    const char *r1 = *s1;
+    const char *r2 = *s2;
+    int cc;
+
+    do {
+        register int r0 asm("r0") = sep;
+
+        asm("clst %[r1],%[r2]\n"
+            "ipm %[cc]\n"
+            "srl %[cc],28"
+            : [r1] "+r" (r1), [r2] "+r" (r2), "+r" (r0), [cc] "=r" (cc)
+            :
+            : "cc");
+        *s1 = r1;
+        *s2 = r2;
+    } while (cc == 3);
+
+    return cc;
+}
+
+static const struct test {
+    const char *name;
+    char sep;
+    const char *s1;
+    const char *s2;
+    int exp_cc;
+    int exp_off;
+} tests[] = {
+    {
+        .name = "cc0",
+        .sep = 0,
+        .s1 = "aa",
+        .s2 = "aa",
+        .exp_cc = 0,
+        .exp_off = 0,
+    },
+    {
+        .name = "cc1",
+        .sep = 1,
+        .s1 = "a\x01",
+        .s2 = "aa\x01",
+        .exp_cc = 1,
+        .exp_off = 1,
+    },
+    {
+        .name = "cc2",
+        .sep = 2,
+        .s1 = "abc\x02",
+        .s2 = "abb\x02",
+        .exp_cc = 2,
+        .exp_off = 2,
+    },
+};
+
+int main(void)
+{
+    const struct test *t;
+    const char *s1, *s2;
+    size_t i;
+    int cc;
+
+    for (i = 0; i < sizeof(tests) / sizeof(tests[0]); i++) {
+        t = &tests[i];
+        s1 = t->s1;
+        s2 = t->s2;
+        cc = clst(t->sep, &s1, &s2);
+        if (cc != t->exp_cc ||
+                s1 != t->s1 + t->exp_off ||
+                s2 != t->s2 + t->exp_off) {
+            fprintf(stderr, "%s\n", t->name);
+            return EXIT_FAILURE;
+        }
+    }
+
+    return EXIT_SUCCESS;
+}
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index ab7a3bcfb2..79250f31dd 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -25,6 +25,7 @@ TESTS+=signals-s390x
 TESTS+=branch-relative-long
 TESTS+=noexec
 TESTS+=div
+TESTS+=clst
 
 Z13_TESTS=vistr
 $(Z13_TESTS): CFLAGS+=-march=z13 -O2
-- 
2.34.1


