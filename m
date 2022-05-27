Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9069535DF9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 12:14:42 +0200 (CEST)
Received: from localhost ([::1]:57024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuWzR-00015e-Ka
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 06:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gautamnagrawal@gmail.com>)
 id 1nuWw9-00085B-2E; Fri, 27 May 2022 06:11:17 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:41676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gautamnagrawal@gmail.com>)
 id 1nuWw6-0002Dv-Rn; Fri, 27 May 2022 06:11:16 -0400
Received: by mail-pg1-x535.google.com with SMTP id e66so3534162pgc.8;
 Fri, 27 May 2022 03:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QgXzX7rqFIzOie8yKk0i9BQTkjHLIySUe6k265LMzP8=;
 b=X2N7rpKLxjBbEwg8nfgR9vOk0fJstVO1rcMShnSOm2QYOWkRWSvWj3pz+RZxvyzR/b
 5yJRxMrHsJkPOrT3qDYQzv3gEP6BTsKa4lCCe8+4QHFvngpWlEeGHPQxFjij8P49/NYF
 B4ODYfTH7tKfLZt+0DWTS5zprn+vtZk8CBd2W9vHUKBNQ8YV/viTo06kqEo7Vr5I0PCG
 vjoeZNxLNlc10+hPsfCkyZXdZ20UGZSjMb4CugFmHknubi9DZwAxhmLfKwE92T7U/nW2
 zCFr0ppqP65BYE818H5yaF4+/qZqgq85N15HKOk3iPd3itdEew2j4EtEZJnvZKBcQ+ii
 ZaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QgXzX7rqFIzOie8yKk0i9BQTkjHLIySUe6k265LMzP8=;
 b=OChryv8dmzQ4FnL0Elq0mZfQEpAYNY+aTMZDwrAAHrnNFl6iSifPTTYgWSeDUhfTzf
 l7MurzMPAvRgIOVAJxS5sJ6+8ri2f7bMACaRAj6xYbA4jMywYidda0erMtDE3UR+7swv
 XpPJxdW86FN/eqQb0CzQdHrz/aeWscvvD8W/cJd7GGrJnSIqCbYA7wn4nvfdsDPTT7mO
 8LWIQihAL9lL90jDm41cC50eohL53//nPClc/OiL/QDM+Y7YUb3g5CUPlhsDxc6zbL9g
 SWDxW38U8hfSU3tvSshBfLOlkCFCgV9804Dk7GSqGpVqc/JwtU5CV5kY0ApRt3Ep3r4b
 cyNg==
X-Gm-Message-State: AOAM531oC0HyjgKeSroF3g7HH5RGOtQUGQKURsmCi8HOmznZwfEcCwlR
 CZZgQdBehv6z19+d+s8rD5bIM1rM1O8UuCAP
X-Google-Smtp-Source: ABdhPJxmpxg/sN51/qmD2cqglkcuAs3rVCsKsk3OrhJuX48LfpVN/48lZmJlWJShpIgUNnteuOmiSw==
X-Received: by 2002:a65:6cc9:0:b0:399:26da:29af with SMTP id
 g9-20020a656cc9000000b0039926da29afmr36483443pgw.489.1653646272239; 
 Fri, 27 May 2022 03:11:12 -0700 (PDT)
Received: from localhost.localdomain ([14.139.108.62])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a170902708400b00161478027f5sm3183324plk.150.2022.05.27.03.11.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 May 2022 03:11:11 -0700 (PDT)
From: Gautam Agrawal <gautamnagrawal@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, thuth@redhat.com, cohuck@redhat.com,
 david@redhat.com, richard.henderson@linaro.org,
 Gautam Agrawal <gautamnagrawal@gmail.com>
Subject: [PATCH] tests/tcg/s390x: Test overflow conditions
Date: Fri, 27 May 2022 15:41:04 +0530
Message-Id: <20220527101104.26679-1-gautamnagrawal@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=gautamnagrawal@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a test to check for overflow conditions in s390x.
This patch is based on the following patches :
* https://git.qemu.org/?p=qemu.git;a=commitdiff;h=5a2e67a691501
* https://git.qemu.org/?p=qemu.git;a=commitdiff;h=fc6e0d0f2db51
 
Signed-off-by: Gautam Agrawal <gautamnagrawal@gmail.com>
---
 tests/tcg/s390x/Makefile.target |  1 +
 tests/tcg/s390x/overflow.c      | 58 +++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 tests/tcg/s390x/overflow.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 3124172736..7f86de85b9 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -16,6 +16,7 @@ TESTS+=shift
 TESTS+=trap
 TESTS+=signals-s390x
 TESTS+=branch-relative-long
+TESTS+=overflow
 
 VECTOR_TESTS=vxeh2_vs
 VECTOR_TESTS+=vxeh2_vcvt
diff --git a/tests/tcg/s390x/overflow.c b/tests/tcg/s390x/overflow.c
new file mode 100644
index 0000000000..ea8a410b1a
--- /dev/null
+++ b/tests/tcg/s390x/overflow.c
@@ -0,0 +1,58 @@
+#include <stdio.h>
+
+int overflow_add_32(int x, int y)
+{
+    int sum;
+    return __builtin_add_overflow(x, y, &sum);
+}
+
+int overflow_add_64(long long x, long long y)
+{
+    long sum;
+    return __builtin_add_overflow(x, y, &sum);
+}
+
+int overflow_sub_32(int x, int y)
+{
+    int sum;
+    return __builtin_sub_overflow(x, y, &sum);
+}
+
+int overflow_sub_64(long long x, long long y)
+{
+    long sum;
+    return __builtin_sub_overflow(x, y, &sum);
+}
+
+int a1_add = -2147483648;
+int b1_add = -2147483648;
+long long a2_add = -9223372036854775808ULL;
+long long b2_add = -9223372036854775808ULL;
+
+int a1_sub;
+int b1_sub = -2147483648;
+long long a2_sub = 0L;
+long long b2_sub = -9223372036854775808ULL;
+
+int main()
+{
+    int ret = 0;
+
+    if (!overflow_add_32(a1_add, b1_add)) {
+        fprintf(stderr, "data overflow while adding 32 bits\n");
+        ret = 1;
+    }
+    if (!overflow_add_64(a2_add, b2_add)) {
+        fprintf(stderr, "data overflow while adding 64 bits\n");
+        ret = 1;
+    }
+    if (!overflow_sub_32(a1_sub, b1_sub)) {
+        fprintf(stderr, "data overflow while subtracting 32 bits\n");
+        ret = 1;
+    }
+    if (!overflow_sub_64(a2_sub, b2_sub)) {
+        fprintf(stderr, "data overflow while subtracting 64 bits\n");
+        ret = 1;
+    }
+    return ret;
+}
-- 
2.34.1


