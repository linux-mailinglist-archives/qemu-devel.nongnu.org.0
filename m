Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3123DF6CD
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 23:20:10 +0200 (CEST)
Received: from localhost ([::1]:60266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB1pZ-0007IF-E3
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 17:20:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mB1oe-0006bx-P4
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 17:19:12 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:41735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mB1od-0001ba-C9
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 17:19:12 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 q17-20020a17090a2e11b02901757deaf2c8so706691pjd.0
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 14:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aAMZcSuFBZhLZaX+UiDABnHJSJdTgWQItOdKopp79hc=;
 b=r6y/QLUoCD7n50GB7LQPaKqy7bv7MqjA/nQsvQ9sYN9MnZwr2K3i1yYmsnSriJS9IM
 StCAbwRmI8E1Hor/t7eQQreNI6psTkLPjMehMlHCQO4yWwdjoOHhNJEG+sqPTo2BwF58
 3JNcaIHrGFgYmoMI3KxGXwRSf4fkC+wcQLmpzX2Z/EOYiv3Ruc83RK83ZPZab/aJZD1D
 HGUCp//PXMLOOLfXRn2K2lO/JC2KWuRgJgIYT6NCX+Aq6oYLZjjGQdJxsZG9g/1MLFcG
 r+JhD5koUOJfKEa1BzffIHPFnop/EC8qb3OynSHFIyXcXdv6lC+zrqDKEM+lZoeZMvGL
 sMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aAMZcSuFBZhLZaX+UiDABnHJSJdTgWQItOdKopp79hc=;
 b=RBmyGztPZsHw5OaoeCl49EWc/D46Kp27ReOseDYC79kTlBp+4ra8doaJVs+h7TFUlj
 S3Ak6YkLZ7fTW59G5fb4ofi+Yov9eZUCpHcCvLv9PN4SwTBq2cgqAkO6wVHNZF51sC6H
 OGqsZbyfLldTmms1ARynNtU9TGax4blAI2rS2skwhg8f1YKJAYjaBhVn4yQYwIVUPtZt
 WOT6ocN4ip9oVHV0iQiczWJCFJruEwa0p17rdl+t0u1adUfpmqpRn/ijk+P8iVaSUdyb
 wixZrb7fo382PC0Lnqs7kCYn7sTYjRY5P7LGMUqWJc8w1qUzMYefmNltUdlc3SEa+pgH
 Ydxg==
X-Gm-Message-State: AOAM53028FIqlWd/9k6t0+3h1c03iMHesGOLDO8mgosirWSywzN0hsq+
 i5S9bKSwiULPC8mK2wOzAM6uSHR91otXQQ==
X-Google-Smtp-Source: ABdhPJzjn63rjm0RPMzWNFGpqsoyScd61oG9U3t9l4ud6ncdQLtfsgKVb8cGZeAGCPVXgxw4d2MAsA==
X-Received: by 2002:a63:1d41:: with SMTP id d1mr1104244pgm.199.1628025549759; 
 Tue, 03 Aug 2021 14:19:09 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id u16sm14481pgh.53.2021.08.03.14.19.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 14:19:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1?] util: Suppress -Wstringop-overflow in
 qemu_thread_start
Date: Tue,  3 Aug 2021 11:19:07 -1000
Message-Id: <20210803211907.150525-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

This seems to be either a glibc or gcc bug, but the code
appears to be fine with the warning suppressed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

The host is running Centos 7.9, so technically, this is out-of-support. 
But this is a gcc compile farm machine, so I'm stuck with it.  The rest
of qemu is still working fine with a locally refreshed compiler.


r~

---
 util/qemu-thread-posix.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index fd9d714038..6c5004220d 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -537,9 +537,28 @@ static void *qemu_thread_start(void *args)
     QEMU_TSAN_ANNOTATE_THREAD_NAME(qemu_thread_args->name);
     g_free(qemu_thread_args->name);
     g_free(qemu_thread_args);
+
+    /*
+     * GCC 11 with glibc 2.17 on PowerPC reports
+     *
+     * qemu-thread-posix.c:540:5: error: ‘__sigsetjmp’ accessing 656 bytes
+     *   in a region of size 528 [-Werror=stringop-overflow=]
+     * 540 |     pthread_cleanup_push(qemu_thread_atexit_notify, NULL);
+     *     |     ^~~~~~~~~~~~~~~~~~~~
+     *
+     * which is clearly nonsense.
+     */
+#pragma GCC diagnostic push
+#ifndef __clang__
+#pragma GCC diagnostic ignored "-Wstringop-overflow"
+#endif
+
     pthread_cleanup_push(qemu_thread_atexit_notify, NULL);
     r = start_routine(arg);
     pthread_cleanup_pop(1);
+
+#pragma GCC diagnostic pop
+
     return r;
 }
 
-- 
2.25.1


