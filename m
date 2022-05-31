Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9A1539660
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 20:41:16 +0200 (CEST)
Received: from localhost ([::1]:40116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw6nq-00022p-Vd
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 14:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gautamnagrawal@gmail.com>)
 id 1nw6iR-0007jG-Kt; Tue, 31 May 2022 14:35:39 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:42869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gautamnagrawal@gmail.com>)
 id 1nw6iO-0008Uq-Bc; Tue, 31 May 2022 14:35:39 -0400
Received: by mail-pg1-x52c.google.com with SMTP id d129so13585284pgc.9;
 Tue, 31 May 2022 11:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=af7lqGtYARSp3nCBiYdoAnbEGuLpUQ6yE0duFC4iDu4=;
 b=CMe9hosCtiqXUkAtVUVOLXl9EBI8S4Jghnef5/dG4x2UBrneDj9FJzmWMFuTy0uL65
 Z9DqLX0P5aeN7loVrFKgnvT5eDuW82JSXXaYV56KhU/7OjdqbmdaTbaMZpar0MY9hrdb
 Xvq9y+zMhz/p6KSJRuiYuACVUe4WmZYhxGMUpdNaKgRKKwXf+JBzgNwSlxMH8gaLQYeK
 FdQG7Vmsmm7XEc1wyFH/4FzPHQ0Qo58XfjmFIbfIv+VizHXFK8+E+w+D9NBatnR+XYMS
 U1p0bj4oWuel2Dhih7LPgVl+CaUBipcPLQ8+nWw80LUQWI4xuvNu3C15yS5jaBqWELkZ
 NEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=af7lqGtYARSp3nCBiYdoAnbEGuLpUQ6yE0duFC4iDu4=;
 b=sl+gHvSiWSfzZaM39lp1OAuyjo4ckuRjpWYP6e3ktspko2Ds9mAEQISi27oGVfMogS
 JukY1GEVQuSngT1yU44DP98OXFgdIAaIdAWnL82i6OKtb06yJy1pYTjaERYVxQ3GA9Cw
 I/px97tre3LgnQeaCNpREyd8Nyvqt9OQhqZyduK77O9C9R0sQuw6lipLnDOSKPnZpzye
 wi1SKCO9JYrXgwLIbE0jo3ISBjQsYhJusuSP8UTe8UelVUbbjcMP+2jOzkdirQ3vy+lF
 v/6px0c1uVRoKqs6FM5BvKNpEMigTxaCQOo71SEGHrFGWd9u/ZpB0EdeYjBarc+jizc+
 fXkw==
X-Gm-Message-State: AOAM531EiLtA8ZWSJ7XUAzmgMWJAd5OKhYvZ7U61V02UNvY4BVQsDke5
 MNFpqfJzyIlJiSoTtRlyGp1Mb7k2YnJNMFIg
X-Google-Smtp-Source: ABdhPJyHWVrbfOE8n7sX3TViAq6DWqHRZ9D8amEoaSTqGEjrD5ALmci95Uz8NMEiuRwLVVYIvDpmTw==
X-Received: by 2002:a65:5688:0:b0:3c2:1015:988e with SMTP id
 v8-20020a655688000000b003c21015988emr53862686pgs.280.1654022134085; 
 Tue, 31 May 2022 11:35:34 -0700 (PDT)
Received: from localhost.localdomain ([2409:4040:e14:de30:918d:3d12:382f:45df])
 by smtp.gmail.com with ESMTPSA id
 fh6-20020a17090b034600b001cd4989fec6sm2301749pjb.18.2022.05.31.11.35.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 31 May 2022 11:35:33 -0700 (PDT)
From: Gautam Agrawal <gautamnagrawal@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, thuth@redhat.com, cohuck@redhat.com,
 david@redhat.com, richard.henderson@linaro.org, gautamnagrawal@gmail.com
Subject: [PATCH v2] tests/tcg/s390x: Test overflow conditions
Date: Wed,  1 Jun 2022 00:05:24 +0530
Message-Id: <20220531183524.40948-1-gautamnagrawal@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=gautamnagrawal@gmail.com; helo=mail-pg1-x52c.google.com
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
Changes since v1:
- Corrected the "long" data type to "long long"
- Changed local variable name in overflow function to "res" 

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
index 0000000000..1c59c2cb70
--- /dev/null
+++ b/tests/tcg/s390x/overflow.c
@@ -0,0 +1,58 @@
+#include <stdio.h>
+
+int overflow_add_32(int x, int y)
+{
+    int res;
+    return __builtin_add_overflow(x, y, &res);
+}
+
+int overflow_add_64(long long x, long long y)
+{
+    long long res;
+    return __builtin_add_overflow(x, y, &res);
+}
+
+int overflow_sub_32(int x, int y)
+{
+    int res;
+    return __builtin_sub_overflow(x, y, &res);
+}
+
+int overflow_sub_64(long long x, long long y)
+{
+    long long res;
+    return __builtin_sub_overflow(x, y, &res);
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


