Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DDB473992
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 01:33:06 +0100 (CET)
Received: from localhost ([::1]:41820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwvkd-0001jn-Vj
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 19:33:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwveA-0008GE-Vb
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:23 -0500
Received: from [2607:f8b0:4864:20::62b] (port=46997
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwve5-0005Sq-1t
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:22 -0500
Received: by mail-pl1-x62b.google.com with SMTP id p18so12332512plf.13
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 16:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HHuNKnhfo/1w0XhuBwX3/PDJWu35E1qSroF+d/Nu4gg=;
 b=xHAihF5fnAB24mFHo66RY38HsKkD9qqAanvezlTSRVowpXZMdQZjauxTbj7BZPZg8x
 3zbqgzje3dOYLG9y1DLIx5PSKvUzBK8i0StTpm0P7N0ovVaHfiYbQN8LRaP3PldJ5ddh
 xYuSP4BIvhvIimWLy2dTNuLlbNnOj+itSiDkdNWC9h/oU492JgBqDvymoeMT0kQRURw4
 qeylRZrss7wc9JmK5HykLwncXQeeGIrbNhYHszqYwbc4y936DqJLg3JzspVHnwQSFLKr
 8+eKc4eUXRfkDuNKWjaoSCQNUqmRrXO4yU72dwzzqHDebC5kjra6RTTKO4DSavxB0qte
 bv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HHuNKnhfo/1w0XhuBwX3/PDJWu35E1qSroF+d/Nu4gg=;
 b=CO6W7wYTyd4BF4AEYVpe3fw6Sd4913pIjpz42tADlhFpWFPZE2iWwDyPPkQXbQEWhy
 6zcDpij4x70DYNAMpkSNP09EioOSNkId+c3Tf73iRjk9C5ywovmcT6KR75c0fgQXyGPP
 ixvm8BEtPz95CN+E6Ku56CFuz1jwAY+iZnfc1wWbfMmREZ67tGH86mzaUCnOnwlVcSAC
 4Jm3EuLQovTjoXCNU3Fm0DygwbL4q32b53yGcEq7DrMInXYxPbv5dj2KK5onEvV7wSWH
 r95dQhytdJrl4zuOePurpyHAn0T041sqOzb5sbXgXc6LMX7KMuUZ9IcMJPG3bHezIy4z
 gSXw==
X-Gm-Message-State: AOAM533jP9X1NhFnJk4SAxTLbdxSUkAFSJvch7bVBrV6H4h8xq3AahN8
 ezYnokGhASMvrNVuur0P7LLiGeByy0ancg==
X-Google-Smtp-Source: ABdhPJx8KXvgi8DY+LQU7GeZMNwl4eQ8jruESvdyjNSOnFtlB0XNcH+kQvcDlIVUBrQUdWCMpzO+sw==
X-Received: by 2002:a17:90a:ec0a:: with SMTP id
 l10mr1755670pjy.92.1639441575802; 
 Mon, 13 Dec 2021 16:26:15 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id w7sm11320253pgo.56.2021.12.13.16.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 16:26:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 10/15] bsd-user: Create special-errno.h
Date: Mon, 13 Dec 2021 16:25:59 -0800
Message-Id: <20211214002604.161983-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214002604.161983-1-richard.henderson@linaro.org>
References: <20211214002604.161983-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: git@xen0n.name, laurent@vivier.eu, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pull the internal errno used by qemu internally its own
header file, for use by safe-syscall.S.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/errno_defs.h    |  6 +++++-
 bsd-user/special-errno.h | 24 ++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 bsd-user/special-errno.h

diff --git a/bsd-user/errno_defs.h b/bsd-user/errno_defs.h
index 141e08456c..73cfa24b7f 100644
--- a/bsd-user/errno_defs.h
+++ b/bsd-user/errno_defs.h
@@ -151,6 +151,10 @@
 /* Internal errors: */
 #define TARGET_EJUSTRETURN      254             /* Just return without modifing regs */
 #define TARGET_ERESTART         255             /* Restart syscall */
-#define QEMU_ERESTARTSYS        TARGET_ERESTART
+
+#include "special-errno.h"
+
+_Static_assert(TARGET_ERESTART == QEMU_ERESTARTSYS,
+               "TARGET_ERESTART and QEMU_ERESTARTSYS expected to match");
 
 #endif /* !  _ERRNO_DEFS_H_ */
diff --git a/bsd-user/special-errno.h b/bsd-user/special-errno.h
new file mode 100644
index 0000000000..03599d9b5a
--- /dev/null
+++ b/bsd-user/special-errno.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+/*
+ * QEMU internal errno values for implementing user-only POSIX.
+ *
+ *  Copyright (c) 2021 Linaro, Ltd.
+ */
+
+#ifndef SPECIAL_ERRNO_H
+#define SPECIAL_ERRNO_H
+
+/*
+ * All of these are QEMU internal, not visible to the guest.
+ * They should be chosen so as to not overlap with any host
+ * or guest errno.
+ */
+
+/*
+ * This is returned when a system call should be restarted, to tell the
+ * main loop that it should wind the guest PC backwards so it will
+ * re-execute the syscall after handling any pending signals.
+ */
+#define QEMU_ERESTARTSYS  255
+
+#endif /* SPECIAL_ERRNO_H */
-- 
2.25.1


