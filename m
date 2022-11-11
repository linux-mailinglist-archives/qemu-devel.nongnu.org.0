Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7B8625541
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:28:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otP6H-0001F7-0e; Fri, 11 Nov 2022 03:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otP5a-00012y-Io
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 03:08:39 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otP5Z-0002EW-45
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 03:08:38 -0500
Received: by mail-pl1-x630.google.com with SMTP id u6so3649005plq.12
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 00:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wHZLFNNm0ZFp31ulDF75QeL44+XwFwYbg39T7b6YDuI=;
 b=lrvExQqH1w6XjkIQYK2d419/m7ZliWnB2NPGas5ara0PexBj0NzQQYMqdYn/E2S6qn
 jHyP5QR5vsAypg2dYuKrGPR3FTW/vUtQXiXY2kw5IiwYCXnVM6ZJeBzkzaxQN0qGj7U3
 xCo3HVk20Ht0uihAGa5qv9ASgpUP7AbL+lUjPYmg2ftaGLAaWCXhmuN5EvCoLRcXVNLW
 A+HjPkjQeKxIsDvoY+x15GIXL0sef4dCMvoz4bnBuEsEmVOLv3tnGSW88i2M5rAixeJl
 zruW0MpVDO7SCQrr4AtuEecAhP6Hfp9h+AHLFAhN1HDwBo4EDL6cbJzd7vMlvMEn3N2f
 Wi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wHZLFNNm0ZFp31ulDF75QeL44+XwFwYbg39T7b6YDuI=;
 b=PWOmsCSBFpob8xdWEa7fTqbb+VU+NgS0rG8gon+r4tpNPJLUBTF5GsHx7rNblHbLDt
 zosl83pFTpbkYBRD0XQpagY8264ugcIKugyKCM3baaf6dxh+fBWqh457VAluDKRK4h+L
 Q4uHuXvLym8QL+fIoHDnkSzb9eeP5QQWwayixJM6NkJLqjX1um3AWk1va7M0Qnzx2LIu
 SiEj4j21XpoLRToYluGjp9UsDbEvBA/VLq8XXh3sowY46CHN43Q+JE5GTBdLhQimnCir
 oLkL+rXY1nuYM+2PJwylNxvXF2kPFvYoXbAdQw43Z0lwkPtIx8UlUC9Fa115smu3kRQi
 Gyxw==
X-Gm-Message-State: ANoB5pnTNN4m/d9Kh7+HLsQUE1HBxi3XJ7lEVNTxcsatC6rqA4RJ8B2O
 Yh2IDVh0g9vzUYgDdA8wJMT6DUDx9twk/XBa
X-Google-Smtp-Source: AA0mqf5KE0Oq+9UjrXgdVdBpAwu3qI+eEcC49qAwoV00Je5vKGq/dONtUlXbE2yIq6zgrWpbJP41MA==
X-Received: by 2002:a17:902:b781:b0:185:40ca:68b8 with SMTP id
 e1-20020a170902b78100b0018540ca68b8mr1541673pls.16.1668154115458; 
 Fri, 11 Nov 2022 00:08:35 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a170902c3c400b00186a2dd3ffdsm1046341plj.15.2022.11.11.00.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 00:08:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com, david@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.0 v2 03/13] tests/tcg/s390x: Add long-double.c
Date: Fri, 11 Nov 2022 18:08:10 +1000
Message-Id: <20221111080820.2132412-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111080820.2132412-1-richard.henderson@linaro.org>
References: <20221111080820.2132412-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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


