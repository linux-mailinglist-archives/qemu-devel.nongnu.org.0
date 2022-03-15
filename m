Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD964D9A4D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 12:24:02 +0100 (CET)
Received: from localhost ([::1]:34450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU5HV-0004KV-Jb
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 07:24:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU5Ek-0001Vb-TG
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:21:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU5Ej-0008W0-9Q
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:21:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647343268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vFXH84FyGSV6KzVJTVpiYHCQWqf3bzd2r0vOu3GR05A=;
 b=g3g9l4FpyBv/L/um59ZxNJyOKjvzzPw4RqhrD1SmDRN/3vI2GaouS/huA2ESU8XLqa3iEL
 RLJl0pOnTMl4mmLNvtRqxg2piofiFDgtbXKnSV7cTT9N2X3n+W4qrfX6LM96tvRyEKvmWA
 ZD7PaMIiW1QBm0Ld6F81ssBUhEW6/f4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-wmXGxNW4N5CohWg0MYPo5w-1; Tue, 15 Mar 2022 07:21:05 -0400
X-MC-Unique: wmXGxNW4N5CohWg0MYPo5w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFA50801585;
 Tue, 15 Mar 2022 11:21:04 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECF36C15D42;
 Tue, 15 Mar 2022 11:21:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/8] tests/tcg/s390x: Test BRASL and BRCL with large negative
 offsets
Date: Tue, 15 Mar 2022 12:20:48 +0100
Message-Id: <20220315112052.515467-5-thuth@redhat.com>
In-Reply-To: <20220315112052.515467-1-thuth@redhat.com>
References: <20220315112052.515467-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a small test in order to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20220314104232.675863-4-iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/s390x/Makefile.target        |  1 +
 tests/tcg/s390x/branch-relative-long.c | 68 ++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 tests/tcg/s390x/branch-relative-long.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 7aa502a557..f0d474a245 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -15,6 +15,7 @@ TESTS+=mvc
 TESTS+=shift
 TESTS+=trap
 TESTS+=signals-s390x
+TESTS+=branch-relative-long
 
 ifneq ($(HAVE_GDB_BIN),)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
diff --git a/tests/tcg/s390x/branch-relative-long.c b/tests/tcg/s390x/branch-relative-long.c
new file mode 100644
index 0000000000..94219afcad
--- /dev/null
+++ b/tests/tcg/s390x/branch-relative-long.c
@@ -0,0 +1,68 @@
+#include <stddef.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/mman.h>
+
+#define DEFINE_ASM(_name, _code) \
+    extern const char _name[]; \
+    extern const char _name ## _end[]; \
+    asm("    .globl " #_name "\n" \
+        #_name ":\n" \
+        "    " _code "\n" \
+        "    .globl " #_name "_end\n" \
+        #_name "_end:\n");
+
+DEFINE_ASM(br_r14, "br %r14");
+DEFINE_ASM(brasl_r0, "brasl %r0,.-0x100000000");
+DEFINE_ASM(brcl_0xf, "brcl 0xf,.-0x100000000");
+
+struct test {
+    const char *code;
+    const char *code_end;
+};
+
+static const struct test tests[] = {
+    {
+        .code = brasl_r0,
+        .code_end = brasl_r0_end,
+    },
+    {
+        .code = brcl_0xf,
+        .code_end = brcl_0xf_end,
+    },
+};
+
+int main(void)
+{
+    unsigned char *buf;
+    size_t length = 0;
+    size_t i;
+
+    for (i = 0; i < sizeof(tests) / sizeof(tests[0]); i++) {
+        size_t test_length = 0x100000000 + (tests[i].code_end - tests[i].code);
+
+        if (test_length > length) {
+            length = test_length;
+        }
+    }
+
+    buf = mmap(NULL, length, PROT_READ | PROT_WRITE | PROT_EXEC,
+               MAP_PRIVATE | MAP_ANONYMOUS | MAP_NORESERVE, -1, 0);
+    if (buf == MAP_FAILED) {
+        perror("SKIP: mmap() failed");
+        return 0;
+    }
+
+    memcpy(buf, br_r14, br_r14_end - br_r14);
+    for (i = 0; i < sizeof(tests) / sizeof(tests[0]); i++) {
+        void (*code)(void) = (void *)(buf + 0x100000000);
+
+        memcpy(code, tests[i].code, tests[i].code_end - tests[i].code);
+        code();
+        memset(code, 0, tests[i].code_end - tests[i].code);
+    }
+
+    munmap(buf, length);
+
+    return 0;
+}
-- 
2.27.0


