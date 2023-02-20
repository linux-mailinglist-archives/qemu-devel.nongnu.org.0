Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0649569C47A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 04:25:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTwmV-0001Bb-U0; Sun, 19 Feb 2023 22:23:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTwmT-0001BL-O4
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 22:23:57 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTwmS-0005r1-3S
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 22:23:57 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 o17-20020a17090ab89100b002349a303ca5so1791277pjr.4
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 19:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XxLQVkzo6u05XRu/oTQ+Gc3Lg7Bmhol2RuzS9iezzHg=;
 b=XxN1MgoxJd+U40U4KikY3FrdJHZe589HIYBw2KbcFVTsXOSHr947bsO/hYW81ogxaM
 0YPWov4BhN37Ze4ehJsn+9pBNfPZZnayfudgoV5Vqxw4UwnyI0sHOrp7NXs7xD2t0bjF
 z9AxvXyG1SA+jsR68THjoSEInFg51zg8RNVCian6a02l4lgh+wDNsxqTTTekgt00MpYB
 Lri8SOiAlZPxbZdwYRU/CIW01+eZ4fM/4aX1ufBOo+OpszIQvyH0P0iTEw7SZRbutJUq
 jJYZ0VYPfPxtpB3r1YfcTo1m2Gwdkbcx//1rZeufODgZe2gIz4BJjh8JOe4vPFef9uoX
 L9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XxLQVkzo6u05XRu/oTQ+Gc3Lg7Bmhol2RuzS9iezzHg=;
 b=MofwVnMCuw4hkFbeBZ5yJ969s44fHysU+4GLpO+tlOE0E6KLG9EOa6PUiicGnIFt9E
 OJpkQbNafnFEjSpI1BGK05xqntQM1gPxettutCsV5j5p2JmQKnbnH1ODrcmiANzPxTkX
 WH0Cc3EJsi1zX62oiKi9YWNB0RdX4Jlb8Dc/MAr1pXiEUokSNe4GB18JuWXNzRAloNPy
 GqfJbZH9nZafpDVDfmFAG+vslOBg69kJALu+BRBPs38OMeoq8boI6PxnB43rRhQEjkyN
 CmtsBDH1wW2YFzye/Of5KdDbjcoRCQGhFyus4FrMS+TBUzmVEZqWgDm53yEFbMsker0k
 8rrA==
X-Gm-Message-State: AO0yUKWHj89zascypSFmzuG9C1SX9WHKHbEIHSvbaNuUwzexJCay4QuL
 43jL9I8g7eBzX+RlJxI4X0S8lZozfRoskJpTpJw=
X-Google-Smtp-Source: AK7set9uxK+HDTJoRdsXkkbD997dMEu5rZ7VDDAc65WLhr597mRiurSSYIHvB3w9RuUpRzEV1w+b/g==
X-Received: by 2002:a17:902:c408:b0:19a:9984:5590 with SMTP id
 k8-20020a170902c40800b0019a99845590mr1393472plk.5.1676863434603; 
 Sun, 19 Feb 2023 19:23:54 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a170902d34b00b00198e1bc9d83sm6621302plk.266.2023.02.19.19.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 19:23:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 6/7] tests/tcg/linux-test: Add linux-fork-trap test
Date: Sun, 19 Feb 2023 17:23:37 -1000
Message-Id: <20230220032338.5619-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220032338.5619-1-richard.henderson@linaro.org>
References: <20230220032338.5619-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Check that dying due to a signal does not deadlock.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20230214140829.45392-5-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/multiarch/linux/linux-fork-trap.c | 51 +++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 tests/tcg/multiarch/linux/linux-fork-trap.c

diff --git a/tests/tcg/multiarch/linux/linux-fork-trap.c b/tests/tcg/multiarch/linux/linux-fork-trap.c
new file mode 100644
index 0000000000..2bfef800c3
--- /dev/null
+++ b/tests/tcg/multiarch/linux/linux-fork-trap.c
@@ -0,0 +1,51 @@
+/*
+ * Test that a fork()ed process terminates after __builtin_trap().
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include <assert.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/resource.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+int main(void)
+{
+    struct rlimit nodump;
+    pid_t err, pid;
+    int wstatus;
+
+    pid = fork();
+    assert(pid != -1);
+    if (pid == 0) {
+        /* We are about to crash on purpose; disable core dumps. */
+        if (getrlimit(RLIMIT_CORE, &nodump)) {
+            return EXIT_FAILURE;
+        }
+        nodump.rlim_cur = 0;
+        if (setrlimit(RLIMIT_CORE, &nodump)) {
+            return EXIT_FAILURE;
+        }
+        /*
+         * An alternative would be to dereference a NULL pointer, but that
+         * would be an UB in C.
+         */
+        printf("about to trigger fault...\n");
+#if defined(__MICROBLAZE__)
+        /*
+         * gcc emits "bri 0", which is an endless loop.
+         * Take glibc's ABORT_INSTRUCTION.
+         */
+        asm volatile("brki r0,-1");
+#else
+        __builtin_trap();
+#endif
+    }
+    err = waitpid(pid, &wstatus, 0);
+    assert(err == pid);
+    assert(WIFSIGNALED(wstatus));
+    printf("faulting thread exited cleanly\n");
+
+    return EXIT_SUCCESS;
+}
-- 
2.34.1


