Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527466C1296
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:05:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFBR-0001N8-2C; Mon, 20 Mar 2023 09:04:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFBG-0001Jr-GI
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:04:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFBD-0006LD-M8
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:04:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679317443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YIRlkPX33qd6XO1+ZwUn8Ud9UfDrR0B+DCHfeBH+oQY=;
 b=fpJvAlTCXnRY4PQtNwKMYb+JATbdfsxyrorC88ho1i3YtLn3IraIzKng2gFYlDMwJCuqsM
 5CnkyDyIwNpBnFEKcio4bSQL/5jNoLB7SuFg9xnFtP5rcFXHO/0Bve4mojxy5xuCaQGCyg
 I695+Q8h6orH5XGruBdxOaeWONT5usk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-1KKFNFSoO2uPPxzUoaSTZA-1; Mon, 20 Mar 2023 09:03:59 -0400
X-MC-Unique: 1KKFNFSoO2uPPxzUoaSTZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D034855300;
 Mon, 20 Mar 2023 13:03:59 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 921D0C15BA0;
 Mon, 20 Mar 2023 13:03:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 20/24] tests/tcg/s390x: Test unaligned accesses
Date: Mon, 20 Mar 2023 14:03:26 +0100
Message-Id: <20230320130330.406378-21-thuth@redhat.com>
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

Add a number of small test that check whether accessing unaligned
addresses in various ways leads to a specification exception.

Run these test both in softmmu and user configurations; expect a PGM
in one case and SIGILL in the other.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230316164428.275147-13-iii@linux.ibm.com>
[thuth: Added -Wl,--build-id=none to LDFLAGS]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/s390x/pgm-specification.mak       | 15 ++++++++
 tests/tcg/s390x/pgm-specification-user.c    | 37 +++++++++++++++++++
 tests/tcg/s390x/Makefile.softmmu-target     | 15 ++++++--
 tests/tcg/s390x/Makefile.target             |  8 +++++
 tests/tcg/s390x/br-odd.S                    | 16 +++++++++
 tests/tcg/s390x/cgrl-unaligned.S            | 16 +++++++++
 tests/tcg/s390x/clrl-unaligned.S            | 16 +++++++++
 tests/tcg/s390x/crl-unaligned.S             | 16 +++++++++
 tests/tcg/s390x/ex-odd.S                    | 17 +++++++++
 tests/tcg/s390x/lgrl-unaligned.S            | 16 +++++++++
 tests/tcg/s390x/llgfrl-unaligned.S          | 16 +++++++++
 tests/tcg/s390x/lpswe-unaligned.S           | 18 ++++++++++
 tests/tcg/s390x/lrl-unaligned.S             | 16 +++++++++
 tests/tcg/s390x/pgm-specification-softmmu.S | 40 +++++++++++++++++++++
 tests/tcg/s390x/softmmu.ld                  | 20 +++++++++++
 tests/tcg/s390x/stgrl-unaligned.S           | 16 +++++++++
 tests/tcg/s390x/strl-unaligned.S            | 16 +++++++++
 17 files changed, 311 insertions(+), 3 deletions(-)
 create mode 100644 tests/tcg/s390x/pgm-specification.mak
 create mode 100644 tests/tcg/s390x/pgm-specification-user.c
 create mode 100644 tests/tcg/s390x/br-odd.S
 create mode 100644 tests/tcg/s390x/cgrl-unaligned.S
 create mode 100644 tests/tcg/s390x/clrl-unaligned.S
 create mode 100644 tests/tcg/s390x/crl-unaligned.S
 create mode 100644 tests/tcg/s390x/ex-odd.S
 create mode 100644 tests/tcg/s390x/lgrl-unaligned.S
 create mode 100644 tests/tcg/s390x/llgfrl-unaligned.S
 create mode 100644 tests/tcg/s390x/lpswe-unaligned.S
 create mode 100644 tests/tcg/s390x/lrl-unaligned.S
 create mode 100644 tests/tcg/s390x/pgm-specification-softmmu.S
 create mode 100644 tests/tcg/s390x/softmmu.ld
 create mode 100644 tests/tcg/s390x/stgrl-unaligned.S
 create mode 100644 tests/tcg/s390x/strl-unaligned.S

diff --git a/tests/tcg/s390x/pgm-specification.mak b/tests/tcg/s390x/pgm-specification.mak
new file mode 100644
index 0000000000..2999aee26e
--- /dev/null
+++ b/tests/tcg/s390x/pgm-specification.mak
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# List of specification exception tests.
+# Shared between the softmmu and the user makefiles.
+PGM_SPECIFICATION_TESTS = \
+	br-odd \
+	cgrl-unaligned \
+	clrl-unaligned \
+	crl-unaligned \
+	ex-odd \
+	lgrl-unaligned \
+	llgfrl-unaligned \
+	lpswe-unaligned \
+	lrl-unaligned \
+	stgrl-unaligned \
+	strl-unaligned
diff --git a/tests/tcg/s390x/pgm-specification-user.c b/tests/tcg/s390x/pgm-specification-user.c
new file mode 100644
index 0000000000..9ee6907b7c
--- /dev/null
+++ b/tests/tcg/s390x/pgm-specification-user.c
@@ -0,0 +1,37 @@
+/*
+ * Common user code for specification exception testing.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include <assert.h>
+#include <signal.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+extern void test(void);
+extern long expected_old_psw[2];
+
+static void handle_sigill(int sig, siginfo_t *info, void *ucontext)
+{
+    if ((long)info->si_addr != expected_old_psw[1]) {
+        _exit(EXIT_FAILURE);
+    }
+    _exit(EXIT_SUCCESS);
+}
+
+int main(void)
+{
+    struct sigaction act;
+    int err;
+
+    memset(&act, 0, sizeof(act));
+    act.sa_sigaction = handle_sigill;
+    act.sa_flags = SA_SIGINFO;
+    err = sigaction(SIGILL, &act, NULL);
+    assert(err == 0);
+
+    test();
+
+    return EXIT_FAILURE;
+}
diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
index 607f6ba21a..3e7f72abcd 100644
--- a/tests/tcg/s390x/Makefile.softmmu-target
+++ b/tests/tcg/s390x/Makefile.softmmu-target
@@ -1,10 +1,14 @@
 S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
 VPATH+=$(S390X_SRC)
 QEMU_OPTS=-action panic=exit-failure -kernel
+LINK_SCRIPT=$(S390X_SRC)/softmmu.ld
+LDFLAGS=-nostdlib -static -Wl,-T$(LINK_SCRIPT) -Wl,--build-id=none
 
-%: %.S
-	$(CC) -march=z13 -m64 -nostdlib -static -Wl,-Ttext=0 \
-		-Wl,--build-id=none $< -o $@
+%.o: %.S
+	$(CC) -march=z13 -m64 -c $< -o $@
+
+%: %.o $(LINK_SCRIPT)
+	$(CC) $< -o $@ $(LDFLAGS)
 
 TESTS += unaligned-lowcore
 TESTS += bal
@@ -14,3 +18,8 @@ TESTS += lpswe-early
 TESTS += ssm-early
 TESTS += stosm-early
 TESTS += exrl-ssm-early
+
+include $(S390X_SRC)/pgm-specification.mak
+$(PGM_SPECIFICATION_TESTS): pgm-specification-softmmu.o
+$(PGM_SPECIFICATION_TESTS): LDFLAGS+=pgm-specification-softmmu.o
+TESTS += $(PGM_SPECIFICATION_TESTS)
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 510bbd9b28..0031868b13 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -2,6 +2,9 @@ S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
 VPATH+=$(S390X_SRC)
 CFLAGS+=-march=zEC12 -m64
 
+%.o: %.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -c $< -o $@
+
 config-cc.mak: Makefile
 	$(quiet-@)( \
 	    $(call cc-option,-march=z14, CROSS_CC_HAS_Z14); \
@@ -37,6 +40,11 @@ cdsg: LDFLAGS+=-pthread
 
 rxsbg: CFLAGS+=-O2
 
+include $(S390X_SRC)/pgm-specification.mak
+$(PGM_SPECIFICATION_TESTS): pgm-specification-user.o
+$(PGM_SPECIFICATION_TESTS): LDFLAGS+=pgm-specification-user.o
+TESTS += $(PGM_SPECIFICATION_TESTS)
+
 Z13_TESTS=vistr
 $(Z13_TESTS): CFLAGS+=-march=z13 -O2
 TESTS+=$(Z13_TESTS)
diff --git a/tests/tcg/s390x/br-odd.S b/tests/tcg/s390x/br-odd.S
new file mode 100644
index 0000000000..2fae47a9e3
--- /dev/null
+++ b/tests/tcg/s390x/br-odd.S
@@ -0,0 +1,16 @@
+/*
+ * Test BRanching to a non-mapped odd address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .globl test
+test:
+    lgrl %r1,odd_addr
+    br %r1
+
+    .align 8
+odd_addr:
+    .quad 0xDDDDDDDDDDDDDDDD
+    .globl expected_old_psw
+expected_old_psw:
+    .quad 0x180000000,0xDDDDDDDDDDDDDDDD
diff --git a/tests/tcg/s390x/cgrl-unaligned.S b/tests/tcg/s390x/cgrl-unaligned.S
new file mode 100644
index 0000000000..164d68f2e6
--- /dev/null
+++ b/tests/tcg/s390x/cgrl-unaligned.S
@@ -0,0 +1,16 @@
+/*
+ * Test CGRL with a non-doubleword aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .globl test
+test:
+    cgrl %r1,unaligned
+
+    .align 8
+    .globl expected_old_psw
+expected_old_psw:
+    .quad 0x180000000,test
+    .long 0
+unaligned:
+    .quad 0
diff --git a/tests/tcg/s390x/clrl-unaligned.S b/tests/tcg/s390x/clrl-unaligned.S
new file mode 100644
index 0000000000..182b1b6462
--- /dev/null
+++ b/tests/tcg/s390x/clrl-unaligned.S
@@ -0,0 +1,16 @@
+/*
+ * Test CLRL with a non-word aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .globl test
+test:
+    clrl %r1,unaligned
+
+    .align 8
+    .globl expected_old_psw
+expected_old_psw:
+    .quad 0x180000000,test
+    .short 0
+unaligned:
+    .long 0
diff --git a/tests/tcg/s390x/crl-unaligned.S b/tests/tcg/s390x/crl-unaligned.S
new file mode 100644
index 0000000000..b86fbe0ef3
--- /dev/null
+++ b/tests/tcg/s390x/crl-unaligned.S
@@ -0,0 +1,16 @@
+/*
+ * Test CRL with a non-word aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .globl test
+test:
+    crl %r1,unaligned
+
+    .align 8
+    .globl expected_old_psw
+expected_old_psw:
+    .quad 0x180000000,test
+    .short 0
+unaligned:
+    .long 0
diff --git a/tests/tcg/s390x/ex-odd.S b/tests/tcg/s390x/ex-odd.S
new file mode 100644
index 0000000000..4e42a47df3
--- /dev/null
+++ b/tests/tcg/s390x/ex-odd.S
@@ -0,0 +1,17 @@
+/*
+ * Test EXECUTing a non-mapped odd address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .globl test
+test:
+    lgrl %r1,odd_addr
+fail:
+    ex 0,0(%r1)
+
+    .align 8
+odd_addr:
+    .quad 0xDDDDDDDDDDDDDDDD
+    .globl expected_old_psw
+expected_old_psw:
+    .quad 0x180000000,fail
diff --git a/tests/tcg/s390x/lgrl-unaligned.S b/tests/tcg/s390x/lgrl-unaligned.S
new file mode 100644
index 0000000000..ef8d51d47c
--- /dev/null
+++ b/tests/tcg/s390x/lgrl-unaligned.S
@@ -0,0 +1,16 @@
+/*
+ * Test LGRL from a non-doubleword aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .globl test
+test:
+    lgrl %r1,unaligned
+
+    .align 8
+    .globl expected_old_psw
+expected_old_psw:
+    .quad 0x180000000,test
+    .long 0
+unaligned:
+    .quad 0
diff --git a/tests/tcg/s390x/llgfrl-unaligned.S b/tests/tcg/s390x/llgfrl-unaligned.S
new file mode 100644
index 0000000000..c9b4eeaecf
--- /dev/null
+++ b/tests/tcg/s390x/llgfrl-unaligned.S
@@ -0,0 +1,16 @@
+/*
+ * Test LLGFRL from a non-word aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .globl test
+test:
+    llgfrl %r1,unaligned
+
+    .align 8
+    .globl expected_old_psw
+expected_old_psw:
+    .quad 0x180000000,test
+    .short 0
+unaligned:
+    .long 0
diff --git a/tests/tcg/s390x/lpswe-unaligned.S b/tests/tcg/s390x/lpswe-unaligned.S
new file mode 100644
index 0000000000..989f249a6a
--- /dev/null
+++ b/tests/tcg/s390x/lpswe-unaligned.S
@@ -0,0 +1,18 @@
+/*
+ * Test LPSWE from a non-doubleword aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .globl test
+test:
+    larl %r1,unaligned
+fail:
+    lpswe 0(%r1)
+
+    .align 8
+    .globl expected_old_psw
+expected_old_psw:
+    .quad 0x180000000,fail
+    .long 0
+unaligned:
+    .quad 0
diff --git a/tests/tcg/s390x/lrl-unaligned.S b/tests/tcg/s390x/lrl-unaligned.S
new file mode 100644
index 0000000000..11eb07f93a
--- /dev/null
+++ b/tests/tcg/s390x/lrl-unaligned.S
@@ -0,0 +1,16 @@
+/*
+ * Test LRL from a non-word aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .globl test
+test:
+    lrl %r1,unaligned
+
+    .align 8
+    .globl expected_old_psw
+expected_old_psw:
+    .quad 0x180000000,test
+    .short 0
+unaligned:
+    .long 0
diff --git a/tests/tcg/s390x/pgm-specification-softmmu.S b/tests/tcg/s390x/pgm-specification-softmmu.S
new file mode 100644
index 0000000000..d534f4e505
--- /dev/null
+++ b/tests/tcg/s390x/pgm-specification-softmmu.S
@@ -0,0 +1,40 @@
+/*
+ * Common softmmu code for specification exception testing.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .section .head
+    .org 0x8d
+ilc:
+    .org 0x8e
+program_interruption_code:
+    .org 0x150
+program_old_psw:
+    .org 0x1D0                         /* program new PSW */
+    .quad 0x180000000,pgm              /* 64-bit mode */
+    .org 0x200                         /* lowcore padding */
+
+    .globl _start
+_start:
+    lpswe test_psw
+
+pgm:
+    chhsi program_interruption_code,0x6          /* PGM_SPECIFICATION? */
+    jne failure
+    lg %r0,expected_old_psw+8                    /* ilc adjustment */
+    llgc %r1,ilc
+    agr %r0,%r1
+    stg %r0,expected_old_psw+8
+    clc expected_old_psw(16),program_old_psw     /* correct location? */
+    jne failure
+    lpswe success_psw
+failure:
+    lpswe failure_psw
+
+    .align 8
+test_psw:
+    .quad 0x180000000,test             /* 64-bit mode */
+success_psw:
+    .quad 0x2000180000000,0xfff        /* see is_special_wait_psw() */
+failure_psw:
+    .quad 0x2000180000000,0            /* disabled wait */
diff --git a/tests/tcg/s390x/softmmu.ld b/tests/tcg/s390x/softmmu.ld
new file mode 100644
index 0000000000..ea944eaa3c
--- /dev/null
+++ b/tests/tcg/s390x/softmmu.ld
@@ -0,0 +1,20 @@
+/*
+ * Linker script for the softmmu test kernels.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+ENTRY(_start)
+
+SECTIONS {
+    . = 0;
+
+    .text : {
+        *(.head)
+        *(.text)
+    }
+
+    /DISCARD/ : {
+        *(*)
+    }
+}
diff --git a/tests/tcg/s390x/stgrl-unaligned.S b/tests/tcg/s390x/stgrl-unaligned.S
new file mode 100644
index 0000000000..32df37780a
--- /dev/null
+++ b/tests/tcg/s390x/stgrl-unaligned.S
@@ -0,0 +1,16 @@
+/*
+ * Test STGRL to a non-doubleword aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .globl test
+test:
+    stgrl %r1,unaligned
+
+    .align 8
+    .globl expected_old_psw
+expected_old_psw:
+    .quad 0x180000000,test
+    .long 0
+unaligned:
+    .quad 0
diff --git a/tests/tcg/s390x/strl-unaligned.S b/tests/tcg/s390x/strl-unaligned.S
new file mode 100644
index 0000000000..1d248819f0
--- /dev/null
+++ b/tests/tcg/s390x/strl-unaligned.S
@@ -0,0 +1,16 @@
+/*
+ * Test STRL to a non-word aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .globl test
+test:
+    strl %r1,unaligned
+
+    .align 8
+    .globl expected_old_psw
+expected_old_psw:
+    .quad 0x180000000,test
+    .short 0
+unaligned:
+    .long 0
-- 
2.31.1


