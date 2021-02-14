Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF34E31B1FE
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:29:00 +0100 (CET)
Received: from localhost ([::1]:50182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBM8g-00056N-BR
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:28:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLis-00015I-5a
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:02:18 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLiq-0004gc-HC
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:02:17 -0500
Received: by mail-wr1-x433.google.com with SMTP id 7so6167854wrz.0
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2vMyIhd6/VBZs5ihm1NaO9PG2ec31gzKDVWlQG7z8HU=;
 b=r3R1W83eptrSLJql6b+Bx6N2/n4fwaszbEkWzmiumAKJfaiiArM6KbU2Ai9TUUdn9b
 +49A3iJqqPb98lNeOKnNymwteN6hd/cxbu1mISpOJZ9MBevZcCCe9AgEaTotSpR52jIy
 xwfrUDrjV56F1s2uuvdqPIYktjZGs/srDKBrrqlVZv96hlowDAJT6k1mASlNuxC0fuxS
 NRfUlYHoprWWZtqFLiUZuUacOYeSlBzD2I1wue0z26T/g/I4wdeDGPPpceecFMHaaYh/
 Akj5licEsoMVpdTv5Rqugkz9bH94qpA63KS+xL6g20aZl8ey97L9EcUG9KfPS3C3zTdg
 mTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2vMyIhd6/VBZs5ihm1NaO9PG2ec31gzKDVWlQG7z8HU=;
 b=ki8pUFfydPjvWX9y7p5z+qpFkl8+U0I9q+TZzoEo/dK4I5lpoUHS5+WB6xFGOZWreP
 YAnwEqyAwFJI1zESG+wLLjzZuMF3QrHi7RcXlQ7BHrvMSucVBnsrcMixpDxRW/l85rTw
 +6eBtnqjBNymhLui5Kzd4Qx8VFEakA0wi+ahF+RXolzUspK5/eJtoxtu/uMzflHtIqfW
 6wwrm3wEkd2Ju3hGJP8Od1BXoDcXaAvqnrz3CDJuoYBhWFXW7jgTVYUkpDZKdikVAdBF
 Xr3LebvqzrZH4jMTEZfVVZScpFE0MFIiRe4ja/5ttrFBddDTXvnQJYouISPOQ4mFgIXv
 Ip4g==
X-Gm-Message-State: AOAM532a/m0cd9RzBYj0a25UKfsaq/8rcYav27kFKkhrf4ZAhyDS+m1r
 pji6wdYrP6VYVGgig4BV2KT89H2SpiU=
X-Google-Smtp-Source: ABdhPJxKuWc+zHmYIJFlZbqSkrb38ulUg+e4f8WKu8hLaqGvaMun3AsWWCoBGCQqzu9R1zpvILkH+Q==
X-Received: by 2002:a5d:6942:: with SMTP id r2mr9563940wrw.222.1613325735005; 
 Sun, 14 Feb 2021 10:02:15 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k11sm20150228wrl.84.2021.02.14.10.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:02:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 36/42] tests/tcg/mips: Test user mode DMULT for the R5900
Date: Sun, 14 Feb 2021 18:59:06 +0100
Message-Id: <20210214175912.732946-37-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fredrik Noring <noring@nocrew.org>

The R5900 reports itself as MIPS III but does not implement DMULT.
Verify that DMULT is emulated properly in user mode by multiplying
two 64-bit numbers to produce a 128-bit number.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
Message-Id: <b04427024562b10c852a5519b57033e094fcdc3b.1541701393.git.noring@nocrew.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/tcg/mips/mipsn32r5900/dmult.c  | 40 ++++++++++++++++++++++++++++
 tests/tcg/mips/mipsn32r5900/Makefile | 25 +++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 tests/tcg/mips/mipsn32r5900/dmult.c
 create mode 100644 tests/tcg/mips/mipsn32r5900/Makefile

diff --git a/tests/tcg/mips/mipsn32r5900/dmult.c b/tests/tcg/mips/mipsn32r5900/dmult.c
new file mode 100644
index 00000000000..2827ab5358f
--- /dev/null
+++ b/tests/tcg/mips/mipsn32r5900/dmult.c
@@ -0,0 +1,40 @@
+/*
+ * Test DMULT.
+ */
+
+#include <stdio.h>
+#include <inttypes.h>
+#include <assert.h>
+
+struct hi_lo { int64_t hi; uint64_t lo; };
+
+static struct hi_lo dmult(int64_t rs, int64_t rt)
+{
+    int64_t hi;
+    uint64_t lo;
+
+    /*
+     * The R5900 reports itself as MIPS III but does not implement DMULT.
+     * Verify that DMULT is emulated properly in user mode.
+     */
+    __asm__ __volatile__ (
+            "    .set  mips3\n"
+            "    dmult %2, %3\n"
+            "    mfhi  %0\n"
+            "    mflo  %1\n"
+            : "=r" (hi), "=r" (lo)
+            : "r" (rs), "r" (rt));
+
+    return (struct hi_lo) { .hi = hi, .lo = lo };
+}
+
+int main()
+{
+    /* Verify that multiplying two 64-bit numbers yields a 128-bit number. */
+    struct hi_lo r = dmult(2760727302517, 5665449960167);
+
+    assert(r.hi == 847887);
+    assert(r.lo == 7893651516417804947);
+
+    return 0;
+}
diff --git a/tests/tcg/mips/mipsn32r5900/Makefile b/tests/tcg/mips/mipsn32r5900/Makefile
new file mode 100644
index 00000000000..7dd16723fea
--- /dev/null
+++ b/tests/tcg/mips/mipsn32r5900/Makefile
@@ -0,0 +1,25 @@
+-include ../../config-host.mak
+
+CROSS=mips64r5900el-unknown-linux-gnu-
+
+SIM=qemu-mipsn32el
+SIM_FLAGS=-cpu R5900
+
+CC      = $(CROSS)gcc
+CFLAGS  = -Wall -mabi=n32 -march=r5900 -static
+
+TESTCASES = dmult.tst
+
+all: $(TESTCASES)
+
+%.tst: %.c
+	$(CC) $(CFLAGS) $< -o $@
+
+check: $(TESTCASES)
+	@for case in $(TESTCASES); do \
+        echo $(SIM) $(SIM_FLAGS) ./$$case;\
+        $(SIM) $(SIM_FLAGS) ./$$case; \
+	done
+
+clean:
+	$(RM) -rf $(TESTCASES)
-- 
2.26.2


