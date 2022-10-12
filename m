Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D2B5FCACB
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 20:39:41 +0200 (CEST)
Received: from localhost ([::1]:51036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oigdn-0004Jc-Oy
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 14:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oigSg-0002Jn-AK
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:28:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oigSe-0002yz-R7
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:28:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665599288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ic1Z/fuoED9JpLTkBXsxU+qPtK+cLrnnrf/sxAUcYwY=;
 b=Xdl0rc2eVpvjW7RUBwAyU6xqyf0Bg9klFDlbq4jp2P8KffK162d0ST55/Wxcc0q+Bj/oZc
 HGzGV2h5u2Z/KxQzEpjNrIffgreoacGtKo8bVXwey+aYw2J6njPwO1A2ZP0Gy1ZLaPgKjb
 20+bEgErxyaOcqd65WKmgu+T+Gy/yZI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-3Aa1n8NBMIiWJrWxq_fYQA-1; Wed, 12 Oct 2022 14:28:05 -0400
X-MC-Unique: 3Aa1n8NBMIiWJrWxq_fYQA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95EFC803D48;
 Wed, 12 Oct 2022 18:28:04 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F3D540449D8;
 Wed, 12 Oct 2022 18:28:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: [PATCH 3/3] tests/tcg/s390x: Add a test for the vistr instruction
Date: Wed, 12 Oct 2022 20:27:55 +0200
Message-Id: <20221012182755.1014853-4-thuth@redhat.com>
In-Reply-To: <20221012182755.1014853-1-thuth@redhat.com>
References: <20221012182755.1014853-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This test can be used to verify that the change in the previous
commit is indeed fixing the problem with the M3 vs. M4 field
mixup.

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


