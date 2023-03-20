Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 625376C1290
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:04:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFBB-0001Gd-Oz; Mon, 20 Mar 2023 09:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFB0-0001D7-48
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:03:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFAy-0006D7-ME
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:03:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679317427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fLfQvRliqZ/1TXaxN2TFGLrmoHQCNGI6TGhXveIHPu0=;
 b=SwVgfY+dYXrkHz7+59YUHDWdfc3FgV5m9Kd/IrNc/nCvobdZ9tiaYcMsAs8EGTAw2z1S2+
 UD1spi2GvBBPyQlrtIvEuhLFg6IqLHg4plrH8x4MiS6/zjMCdbLGrTVqQg8b648WO5Kg6x
 +XpPH7vIBvlSvTiT7F8xcG1uVPLacog=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-cZNst9Y7Py6XUNGgkIudkA-1; Mon, 20 Mar 2023 09:03:40 -0400
X-MC-Unique: cZNst9Y7Py6XUNGgkIudkA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7E821818E58;
 Mon, 20 Mar 2023 13:03:39 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3521AC15BA0;
 Mon, 20 Mar 2023 13:03:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 06/24] tests/tcg/s390x: Add rxsbg.c
Date: Mon, 20 Mar 2023 14:03:12 +0100
Message-Id: <20230320130330.406378-7-thuth@redhat.com>
In-Reply-To: <20230320130330.406378-1-thuth@redhat.com>
References: <20230320130330.406378-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Add a small test for RXSBG with T=1 to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20230316172205.281369-3-iii@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/s390x/rxsbg.c         | 46 +++++++++++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target |  3 +++
 2 files changed, 49 insertions(+)
 create mode 100644 tests/tcg/s390x/rxsbg.c

diff --git a/tests/tcg/s390x/rxsbg.c b/tests/tcg/s390x/rxsbg.c
new file mode 100644
index 0000000000..4b155db304
--- /dev/null
+++ b/tests/tcg/s390x/rxsbg.c
@@ -0,0 +1,46 @@
+/*
+ * Test the RXSBG instruction.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include <assert.h>
+#include <stdlib.h>
+
+static inline __attribute__((__always_inline__)) void
+rxsbg(unsigned long *r1, unsigned long r2, int i3, int i4, int i5, int *cc)
+{
+    asm("rxsbg %[r1],%[r2],%[i3],%[i4],%[i5]\n"
+        "ipm %[cc]"
+        : [r1] "+r" (*r1), [cc] "=r" (*cc)
+        : [r2] "r" (r2) , [i3] "i" (i3) , [i4] "i" (i4) , [i5] "i" (i5)
+        : "cc");
+    *cc = (*cc >> 28) & 3;
+}
+
+void test_cc0(void)
+{
+    unsigned long r1 = 6;
+    int cc;
+
+    rxsbg(&r1, 3, 61 | 0x80, 62, 1, &cc);
+    assert(r1 == 6);
+    assert(cc == 0);
+}
+
+void test_cc1(void)
+{
+    unsigned long r1 = 2;
+    int cc;
+
+    rxsbg(&r1, 3, 61 | 0x80, 62, 1, &cc);
+    assert(r1 == 2);
+    assert(cc == 1);
+}
+
+int main(void)
+{
+    test_cc0();
+    test_cc1();
+
+    return EXIT_SUCCESS;
+}
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index cf93b96686..3c940ac952 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -29,10 +29,13 @@ TESTS+=clst
 TESTS+=long-double
 TESTS+=cdsg
 TESTS+=chrl
+TESTS+=rxsbg
 
 cdsg: CFLAGS+=-pthread
 cdsg: LDFLAGS+=-pthread
 
+rxsbg: CFLAGS+=-O2
+
 Z13_TESTS=vistr
 $(Z13_TESTS): CFLAGS+=-march=z13 -O2
 TESTS+=$(Z13_TESTS)
-- 
2.31.1


