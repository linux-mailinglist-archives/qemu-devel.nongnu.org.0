Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B2D3DF042
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 16:26:54 +0200 (CEST)
Received: from localhost ([::1]:55996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAvNd-00023Q-JM
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 10:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mAvM5-0007fk-7D
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:25:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mAvM3-0001BV-Iv
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:25:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628000715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=szQs0x7Z8Z5OtOpqoWrJLc2bfaEiBx+Rzk3dJk7MMYA=;
 b=fgdhbDO8sNiS+fRUoLQKhFpXKwJ6w5HXugjw+/opvczmDYJFYKel/dSOfDvVWumkJNpJCp
 B3InRs0SbgvVc8k+8Q6MD8wKQNgiskXpV2ySpziLAk1ZmHJoj1+eDxXp8YJ6WjOfJss0/n
 cDntVRLeNkkZQig0amya9c05UDcLVLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-zG-rCUJxNmemm15laK-18w-1; Tue, 03 Aug 2021 10:25:13 -0400
X-MC-Unique: zG-rCUJxNmemm15laK-18w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 336011853024;
 Tue,  3 Aug 2021 14:25:12 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B406F19C44;
 Tue,  3 Aug 2021 14:25:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 3/3] tests/tcg: Test that compare-and-trap raises SIGFPE
Date: Tue,  3 Aug 2021 16:24:55 +0200
Message-Id: <20210803142455.89123-4-thuth@redhat.com>
In-Reply-To: <20210803142455.89123-1-thuth@redhat.com>
References: <20210803142455.89123-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>

Signed-off-by: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>
Message-Id: <20210709160459.4962-3-jonathan.albrecht@linux.vnet.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/s390x/Makefile.target |   2 +-
 tests/tcg/s390x/trap.c          | 102 ++++++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/s390x/trap.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 5d3de1b27a..bd084c7840 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -8,4 +8,4 @@ TESTS+=exrl-trtr
 TESTS+=pack
 TESTS+=mvo
 TESTS+=mvc
-
+TESTS+=trap
diff --git a/tests/tcg/s390x/trap.c b/tests/tcg/s390x/trap.c
new file mode 100644
index 0000000000..d4c61c7f52
--- /dev/null
+++ b/tests/tcg/s390x/trap.c
@@ -0,0 +1,102 @@
+/*
+ * Copyright 2021 IBM Corp.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at
+ * your option) any later version. See the COPYING file in the top-level
+ * directory.
+ */
+
+#include <stdarg.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <errno.h>
+#include <string.h>
+#include <signal.h>
+
+static void error1(const char *filename, int line, const char *fmt, ...)
+{
+    va_list ap;
+    va_start(ap, fmt);
+    fprintf(stderr, "%s:%d: ", filename, line);
+    vfprintf(stderr, fmt, ap);
+    fprintf(stderr, "\n");
+    va_end(ap);
+    exit(1);
+}
+
+static int __chk_error(const char *filename, int line, int ret)
+{
+    if (ret < 0) {
+        error1(filename, line, "%m (ret=%d, errno=%d/%s)",
+               ret, errno, strerror(errno));
+    }
+    return ret;
+}
+
+#define error(fmt, ...) error1(__FILE__, __LINE__, fmt, ## __VA_ARGS__)
+
+#define chk_error(ret) __chk_error(__FILE__, __LINE__, (ret))
+
+int sigfpe_count;
+int sigill_count;
+
+static void sig_handler(int sig, siginfo_t *si, void *puc)
+{
+    if (sig == SIGFPE) {
+        if (si->si_code != 0) {
+            error("unexpected si_code: 0x%x != 0", si->si_code);
+        }
+        ++sigfpe_count;
+        return;
+    }
+
+    if (sig == SIGILL) {
+        ++sigill_count;
+        return;
+    }
+
+    error("unexpected signal 0x%x\n", sig);
+}
+
+int main(int argc, char **argv)
+{
+    sigfpe_count = sigill_count = 0;
+
+    struct sigaction act;
+
+    /* Set up SIG handler */
+    act.sa_sigaction = sig_handler;
+    sigemptyset(&act.sa_mask);
+    act.sa_flags = SA_SIGINFO;
+    chk_error(sigaction(SIGFPE, &act, NULL));
+    chk_error(sigaction(SIGILL, &act, NULL));
+
+    uint64_t z = 0x0ull;
+    uint64_t lz = 0xffffffffffffffffull;
+    asm volatile (
+        "lg %%r13,%[lz]\n"
+        "cgitne %%r13,0\n" /* SIGFPE */
+        "lg %%r13,%[z]\n"
+        "cgitne %%r13,0\n" /* no trap */
+        "nopr\n"
+        "lg %%r13,%[lz]\n"
+        "citne %%r13,0\n" /* SIGFPE */
+        "lg %%r13,%[z]\n"
+        "citne %%r13,0\n" /* no trap */
+        "nopr\n"
+        :
+        : [z] "m" (z), [lz] "m" (lz)
+        : "memory", "r13");
+
+    if (sigfpe_count != 2) {
+        error("unexpected SIGFPE count: %d != 2", sigfpe_count);
+    }
+    if (sigill_count != 0) {
+        error("unexpected SIGILL count: %d != 0", sigill_count);
+    }
+
+    printf("PASS\n");
+    return 0;
+}
-- 
2.27.0


