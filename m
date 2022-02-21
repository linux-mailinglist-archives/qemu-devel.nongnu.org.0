Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391704BD8EC
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 11:05:39 +0100 (CET)
Received: from localhost ([::1]:44464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5Za-00085i-4K
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 05:05:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zf-00006I-D9
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:31 -0500
Received: from [2a00:1450:4864:20::32d] (port=44895
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zZ-00012o-4v
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:31 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 d14-20020a05600c34ce00b0037bf4d14dc7so10726887wmq.3
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eUdMWu06bcY55dS/XsZ8i6MlsWYYdQD9bxiTKRF3Fko=;
 b=hc0bS1xkNlepjaMBC0zbT6HGjw/soUjtVbaCHPO7O053Vuk10/48bfmleKMenOxnYu
 HJC3yEenXWMzgM9guZsg0ZbDThcT1XCD9TKeh+a/HOkBsLL30qXS8jMZZStJt2j6XC9s
 RufKFbYfP/rTGXaPX25Logqjwsq1C5tahBByQam85cf5Zg8SAMS3np0g49GJe+JdMbDL
 f6pCJQmnKptYDMW7xX9AUR0o+rrglP+wCHMsYD/rTz9GFDjCHAglVsPfGy+NgNogwwHz
 c8AAKUYf3kUH5oQ44+cJpqPfg95CovPc68MzmBq1iVDOxt8n37upQv9OI63aAWpf3Tfs
 pyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eUdMWu06bcY55dS/XsZ8i6MlsWYYdQD9bxiTKRF3Fko=;
 b=LmdXavRWlyeACQg+MZ8Lyx7cCcaQ7ZqGQNfxu8ULdCC/l6yQakNuUQ/DZE3aEngE5Q
 WS3xvmW0qKLfbxytzftrWSeBQOqxaBTgcltHxNrgTZ4d1JREmxDMl9F8BAIbbGmYBvcC
 mpi0d0eNezD3t3KyQlkSQ+7QG2d65gV7Sl6zevJ9+MeYMJvd+8UBYCSTQWF5WbQJWeXC
 VYbIKT47+MEGPUZXQcB7xBRzbg6beVbahNVaxPhp1qmZtIpzmt2scr/8KQrQggRsdOBC
 tSErJeg2Yk7XVdzVoDTUPXz8yngwi+e2heAMVU2iYvokdS9/0OsJ4VJHqTUY2bmXlcqI
 4h+g==
X-Gm-Message-State: AOAM531H6+OSR8fKZKoD4gVfV6ozsU3d/c+0vcSc/VCIP8QiJ5yFrgT9
 1jZ1AsG0aPDGEl99v6q7wki+dMRcFuGyfA==
X-Google-Smtp-Source: ABdhPJwJmX9wLqu3NdoXR2vmFqaytNWoHfVT+2jajjU4B9TH6ioY/CQwWrZobgGQqIWUy/Ep2WZPUg==
X-Received: by 2002:a7b:cb90:0:b0:37b:b88b:b4a2 with SMTP id
 m16-20020a7bcb90000000b0037bb88bb4a2mr17075674wmi.148.1645435696257; 
 Mon, 21 Feb 2022 01:28:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id q76sm7555778wme.1.2022.02.21.01.28.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:28:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/26] include: Move qemu_mprotect_*() to new qemu/mprotect.h
Date: Mon, 21 Feb 2022 09:27:51 +0000
Message-Id: <20220221092800.404870-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221092800.404870-1-peter.maydell@linaro.org>
References: <20220221092800.404870-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The qemu_mprotect_*() family of functions are used in very few files;
move them from osdep.h to a new qemu/mprotect.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220208200856.3558249-3-peter.maydell@linaro.org
---
 include/qemu/mprotect.h | 14 ++++++++++++++
 include/qemu/osdep.h    |  4 ----
 tcg/region.c            |  1 +
 util/osdep.c            |  1 +
 4 files changed, 16 insertions(+), 4 deletions(-)
 create mode 100644 include/qemu/mprotect.h

diff --git a/include/qemu/mprotect.h b/include/qemu/mprotect.h
new file mode 100644
index 00000000000..1e83d1433ee
--- /dev/null
+++ b/include/qemu/mprotect.h
@@ -0,0 +1,14 @@
+/*
+ * QEMU mprotect functions
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef QEMU_MPROTECT_H
+#define QEMU_MPROTECT_H
+
+int qemu_mprotect_rw(void *addr, size_t size);
+int qemu_mprotect_rwx(void *addr, size_t size);
+int qemu_mprotect_none(void *addr, size_t size);
+
+#endif
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 5ebd737aebb..ca00899bbd2 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -496,10 +496,6 @@ void sigaction_invoke(struct sigaction *action,
                       struct qemu_signalfd_siginfo *info);
 #endif
 
-int qemu_mprotect_rw(void *addr, size_t size);
-int qemu_mprotect_rwx(void *addr, size_t size);
-int qemu_mprotect_none(void *addr, size_t size);
-
 /*
  * Don't introduce new usage of this function, prefer the following
  * qemu_open/qemu_create that take an "Error **errp"
diff --git a/tcg/region.c b/tcg/region.c
index c46021d1604..7b4e65a52e8 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qemu/madvise.h"
+#include "qemu/mprotect.h"
 #include "qapi/error.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
diff --git a/util/osdep.c b/util/osdep.c
index 8c5cd6e4316..5181f86b82f 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -39,6 +39,7 @@ extern int madvise(char *, size_t, int);
 #include "qemu/sockets.h"
 #include "qemu/error-report.h"
 #include "qemu/madvise.h"
+#include "qemu/mprotect.h"
 #include "monitor/monitor.h"
 
 static bool fips_enabled = false;
-- 
2.25.1


