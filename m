Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20EC66132C
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 03:49:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pELa7-0005ms-4W; Sat, 07 Jan 2023 21:38:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELa1-0005iT-Ij
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:38:37 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZD-0004hO-EE
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:38:37 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 fz16-20020a17090b025000b002269d6c2d83so8701502pjb.0
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 18:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wHZLFNNm0ZFp31ulDF75QeL44+XwFwYbg39T7b6YDuI=;
 b=yz/Vv9hfx11fLSInlmwJJ1MiPWzE7D/6OdyIY8MRsTs5VPjdFjXiWqOie9g2r6ox8f
 xOqANbE5cvmgQPJkBPDFqa5M2lDwRmrPO5Ps35nPdBDp/2jfCaf6CekDebjqcusMcNtI
 e7wjIooMErSThlYi6DKx+5bT78BY7IWdlWjBAxF/xzojETPLYpH5Z/I+a8obKDiWp/ee
 bJzNJbVRYOKS6Q8NF8c1Y86wXQ9zdyEsto8R0ACvTaT20gzVGLqEhlTB+5Y/1jRRtwpr
 V35qfYdz/Kax42wBGbUZfcRkscrNi0Rw4aNaCmMirA+Hmopcpyj06pGB8fvY153nHJ0P
 tosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wHZLFNNm0ZFp31ulDF75QeL44+XwFwYbg39T7b6YDuI=;
 b=6Sp3fGbH7Hegs+W7hFgYyXgCafv4rZoChLADLkEri1W7NK5DqU4aGarr4IMQgBQdtH
 qfQVvAhPC8VuE8Pswqz+0+bCi9TGBO4EeNqpZgy9+TShh96OQEmxIP8KAYNn3M+5B0Aq
 0ggQy6tV3A8e2wPfjBB6YEB+3TQAn4bjyquwWWFl7NDF7RIWrlBC1PUpdHrbQu58dOUQ
 PMzZIXyuc6MWJj+4DeXSRLuJnvOpVoVVTz8Gv6a1zWlxMCOz3zCZal7362QCSvg/Fv+N
 nL9r379Igrojg2ZJy+UbSLpUakSBw3MtP1RT2kaa/Bfa7AL9bbUiapj1FBu43MnJ08Vk
 Lb8w==
X-Gm-Message-State: AFqh2kq5YMztFQ2DUdjWM6pIkdgcjk6LWeGw1nytwa+4a5A5vbVtXUvL
 PdJXXmZ8l4E46zmEldIriRXC24AcHg+/76b2
X-Google-Smtp-Source: AMrXdXsidKN8kV3QYovayg1TOWMn+v7UTYaTQDgzkZLYCWEoLtEOwPlF3xckO4uBp2FDg1YRVww9LQ==
X-Received: by 2002:a17:902:f791:b0:192:5ec4:6656 with SMTP id
 q17-20020a170902f79100b001925ec46656mr61538487pln.3.1673145466046; 
 Sat, 07 Jan 2023 18:37:46 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 23/36] tests/tcg/s390x: Add long-double.c
Date: Sat,  7 Jan 2023 18:37:06 -0800
Message-Id: <20230108023719.2466341-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/s390x/long-double.c   | 24 ++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 tests/tcg/s390x/long-double.c

diff --git a/tests/tcg/s390x/long-double.c b/tests/tcg/s390x/long-double.c
new file mode 100644
index 0000000000..757a6262fd
--- /dev/null
+++ b/tests/tcg/s390x/long-double.c
@@ -0,0 +1,24 @@
+/*
+ * Perform some basic arithmetic with long double, as a sanity check.
+ * With small integral numbers, we can cross-check with integers.
+ */
+
+#include <assert.h>
+
+int main()
+{
+    int i, j;
+
+    for (i = 1; i < 5; i++) {
+        for (j = 1; j < 5; j++) {
+            long double la = (long double)i + j;
+            long double lm = (long double)i * j;
+            long double ls = (long double)i - j;
+
+            assert(la == i + j);
+            assert(lm == i * j);
+            assert(ls == i - j);
+        }
+    }
+    return 0;
+}
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 79250f31dd..1d454270c0 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -26,6 +26,7 @@ TESTS+=branch-relative-long
 TESTS+=noexec
 TESTS+=div
 TESTS+=clst
+TESTS+=long-double
 
 Z13_TESTS=vistr
 $(Z13_TESTS): CFLAGS+=-march=z13 -O2
-- 
2.34.1


