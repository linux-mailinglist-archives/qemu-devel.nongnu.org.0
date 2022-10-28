Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19B3611299
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:25:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPLI-0001cS-Ph; Fri, 28 Oct 2022 09:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKV-00015g-Mu
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKU-0005Hi-1n
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666963401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NJFYjp/49tnLnWktDSS1pOxfsOSIZTMrymtDYBXC+8U=;
 b=S7jkgULs19YZwke2O2CPjwfupOoBPhf0E2xTThKygWeF6h/xaT/0TaqyNZwlqwcbQBTToL
 VVMdj5CYmRvQvmPN4/Q9SJCdEyPeUXX33tlyyNBKbzghu723HzP+o/HiD7H0D0AGsaiEBb
 GC0PGhvRi7d7JHMJTEEV/E8nYT23AZw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-b1n_xqEAMo6g6SwnkVocOA-1; Fri, 28 Oct 2022 09:23:17 -0400
X-MC-Unique: b1n_xqEAMo6g6SwnkVocOA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B5A7185A78B;
 Fri, 28 Oct 2022 13:23:17 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27CDD1121319;
 Fri, 28 Oct 2022 13:23:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 06/21] tests/tcg/s390x: Add a test for the vistr instruction
Date: Fri, 28 Oct 2022 15:22:49 +0200
Message-Id: <20221028132304.829103-7-thuth@redhat.com>
In-Reply-To: <20221028132304.829103-1-thuth@redhat.com>
References: <20221028132304.829103-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This test can be used to verify that the change in the previous
commit is indeed fixing the problem with the M3 vs. M4 field
mixup.

Message-Id: <20221012182755.1014853-4-thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/s390x/vistr.c         | 45 +++++++++++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target |  4 +++
 2 files changed, 49 insertions(+)
 create mode 100644 tests/tcg/s390x/vistr.c

diff --git a/tests/tcg/s390x/vistr.c b/tests/tcg/s390x/vistr.c
new file mode 100644
index 0000000000..8e3e987d71
--- /dev/null
+++ b/tests/tcg/s390x/vistr.c
@@ -0,0 +1,45 @@
+/*
+ * Test the VECTOR ISOLATE STRING (vistr) instruction
+ */
+#include <stdint.h>
+#include <stdio.h>
+#include "vx.h"
+
+static inline void vistr(S390Vector *v1, S390Vector *v2,
+                         const uint8_t m3, const uint8_t m5)
+{
+    asm volatile("vistr %[v1], %[v2], %[m3], %[m5]\n"
+                 : [v1] "=v" (v1->v)
+                 : [v2]  "v" (v2->v)
+                 , [m3]  "i" (m3)
+                 , [m5]  "i" (m5)
+                 : "cc");
+}
+
+int main(int argc, char *argv[])
+{
+    S390Vector vd = {};
+    S390Vector vs16 = {
+        .h[0] = 0x1234, .h[1] = 0x0056, .h[2] = 0x7800, .h[3] = 0x0000,
+        .h[4] = 0x0078, .h[5] = 0x0000, .h[6] = 0x6543, .h[7] = 0x2100
+    };
+    S390Vector vs32 = {
+        .w[0] = 0x12340000, .w[1] = 0x78654300,
+        .w[2] = 0x0, .w[3] = 0x12,
+    };
+
+    vistr(&vd, &vs16, 1, 0);
+    if (vd.h[0] != 0x1234 || vd.h[1] != 0x0056 || vd.h[2] != 0x7800 ||
+        vd.h[3] || vd.h[4] || vd.h[5] || vd.h[6] || vd.h[7]) {
+        puts("ERROR: vitrh failed!");
+        return 1;
+    }
+
+    vistr(&vd, &vs32, 2, 0);
+    if (vd.w[0] != 0x12340000 || vd.w[1] != 0x78654300 || vd.w[2] || vd.w[3]) {
+        puts("ERROR: vitrf failed!");
+        return 1;
+    }
+
+    return 0;
+}
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 29c8af8207..07fcc6d0ce 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -25,6 +25,10 @@ TESTS+=signals-s390x
 TESTS+=branch-relative-long
 TESTS+=noexec
 
+Z13_TESTS=vistr
+$(Z13_TESTS): CFLAGS+=-march=z13 -O2
+TESTS+=$(Z13_TESTS)
+
 ifneq ($(CROSS_CC_HAS_Z14),)
 Z14_TESTS=vfminmax
 vfminmax: LDFLAGS+=-lm
-- 
2.31.1


