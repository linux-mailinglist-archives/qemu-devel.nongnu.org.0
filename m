Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E475FB04F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 12:19:45 +0200 (CEST)
Received: from localhost ([::1]:34146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiCMS-0005yr-3v
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 06:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiCH8-0003m9-Jz
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:14:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiCH5-0000Ow-GM
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:14:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665483249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LTOdInNAoq0fZjqRsRCPHHJo/6MtqBXZGRW0gSWUZqs=;
 b=G7xu0UEAXdLufuCzTiaXHD+ypGsaFxcE1jV97CfhGxTE6cW9SuG3enF4SVkE6rQFruiYPU
 TVN980hfrjstYDBNAdwsTkRyKc8i9zFVcjN3y4GLmdx+avrIzV+aDDBhGLaKrMPKZI9Q7P
 1W4dJVSpIJvXq2OVvUa8HwsYL8qBNow=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-vQvuHAs1MOOIUbq5FQPcaw-1; Tue, 11 Oct 2022 06:14:06 -0400
X-MC-Unique: vQvuHAs1MOOIUbq5FQPcaw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C3E8858F13;
 Tue, 11 Oct 2022 10:14:06 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9C712166B26;
 Tue, 11 Oct 2022 10:14:04 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: [PATCH] target/s390x: Fix emulation of the VISTR instruction
Date: Tue, 11 Oct 2022 12:14:01 +0200
Message-Id: <20221011101401.81849-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The element size is encoded in the M3 field, not in the M4
field. Let's also add a TCG test that shows the failing
behavior without this fix.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1248
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/s390x/vf.c                | 50 +++++++++++++++++++++++++++++
 target/s390x/tcg/translate_vx.c.inc |  2 +-
 tests/tcg/s390x/Makefile.target     |  6 ++++
 3 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/s390x/vf.c

diff --git a/tests/tcg/s390x/vf.c b/tests/tcg/s390x/vf.c
new file mode 100644
index 0000000000..fdc424ce7c
--- /dev/null
+++ b/tests/tcg/s390x/vf.c
@@ -0,0 +1,50 @@
+/*
+ * vf: vector facility tests
+ */
+#include <stdint.h>
+#include <stdio.h>
+#include "vx.h"
+
+static inline void vistr(S390Vector *v1, S390Vector *v2,
+                         const uint8_t m3, const uint8_t m5)
+{
+    asm volatile("vistr %[v1], %[v2], %[m3], %[m5]\n"
+                : [v1] "=v" (v1->v)
+                : [v2]  "v" (v2->v)
+                , [m3]  "i" (m3)
+                , [m5]  "i" (m5)
+                : "cc");
+}
+
+static int test_vistr(void)
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
+
+int main(int argc, char *argv[])
+{
+    return test_vistr();
+}
diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index 3526ba3e3b..b69c1a111c 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -2723,7 +2723,7 @@ static DisasJumpType op_vfene(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_vistr(DisasContext *s, DisasOps *o)
 {
-    const uint8_t es = get_field(s, m4);
+    const uint8_t es = get_field(s, m3);
     const uint8_t m5 = get_field(s, m5);
     static gen_helper_gvec_2 * const g[3] = {
         gen_helper_gvec_vistr8,
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index c830313e67..f8e71a9439 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -18,6 +18,12 @@ TESTS+=signals-s390x
 TESTS+=branch-relative-long
 TESTS+=noexec
 
+Z13_TESTS=vf
+vf: LDFLAGS+=-lm
+$(Z13_TESTS): CFLAGS+=-march=z13 -O2
+TESTS+=$(if $(shell $(CC) -march=z13 -S -o /dev/null -xc /dev/null \
+			 >/dev/null 2>&1 && echo OK),$(Z13_TESTS))
+
 Z14_TESTS=vfminmax
 vfminmax: LDFLAGS+=-lm
 $(Z14_TESTS): CFLAGS+=-march=z14 -O2
-- 
2.31.1


