Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A5F6C129D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:05:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFB3-0001DH-Dn; Mon, 20 Mar 2023 09:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFAw-0001BU-SU
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:03:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFAt-0006Aa-MD
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:03:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679317421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5D82ZElhu3SNpr6BvVZ4dy/q8S0YCRhrxSrjSftshiI=;
 b=BqT8OnXt75nhXdRbf6TAT25RXIAsOn3Hk5Ga5IemXSW4vubjySi8sbkWo4rHU3LS+vynUV
 9grHMp4FZFsRdi/Z+enZ66tecn5G3eSP2FcQZb76z5n8a18X9Mq6zYoHcvWI9zrPdc1CAo
 Fkg1s65/cl28SrvvaOKsebG0g2qW2VY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-UBTLW1FZPdWGFT1NOZsXnw-1; Mon, 20 Mar 2023 09:03:38 -0400
X-MC-Unique: UBTLW1FZPdWGFT1NOZsXnw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4B228065C5;
 Mon, 20 Mar 2023 13:03:37 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12F47C15BA0;
 Mon, 20 Mar 2023 13:03:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 04/24] tests/tcg/s390x: Add PSW modification tests
Date: Mon, 20 Mar 2023 14:03:10 +0100
Message-Id: <20230320130330.406378-5-thuth@redhat.com>
In-Reply-To: <20230320130330.406378-1-thuth@redhat.com>
References: <20230320130330.406378-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

Add several small tests that check the PSW modification instructions:

* lpsw.S checks whether LPSW works correctly in the "happy" case.

* lpswe-early.S checks whether early exceptions are recognized and
  whether the correct ILC and old PSW are stored when they happen.

* ssm-early.S, stosm-early.S and exrl-ssm-early.S check the special
  handling of SSM and STOSM with respect to early exceptions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20230315020408.384766-4-iii@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/s390x/Makefile.softmmu-target |  5 +++
 tests/tcg/s390x/exrl-ssm-early.S        | 43 +++++++++++++++++++++++++
 tests/tcg/s390x/lpsw.S                  | 36 +++++++++++++++++++++
 tests/tcg/s390x/lpswe-early.S           | 38 ++++++++++++++++++++++
 tests/tcg/s390x/ssm-early.S             | 41 +++++++++++++++++++++++
 tests/tcg/s390x/stosm-early.S           | 41 +++++++++++++++++++++++
 6 files changed, 204 insertions(+)
 create mode 100644 tests/tcg/s390x/exrl-ssm-early.S
 create mode 100644 tests/tcg/s390x/lpsw.S
 create mode 100644 tests/tcg/s390x/lpswe-early.S
 create mode 100644 tests/tcg/s390x/ssm-early.S
 create mode 100644 tests/tcg/s390x/stosm-early.S

diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
index 725b6c598d..607f6ba21a 100644
--- a/tests/tcg/s390x/Makefile.softmmu-target
+++ b/tests/tcg/s390x/Makefile.softmmu-target
@@ -9,3 +9,8 @@ QEMU_OPTS=-action panic=exit-failure -kernel
 TESTS += unaligned-lowcore
 TESTS += bal
 TESTS += sam
+TESTS += lpsw
+TESTS += lpswe-early
+TESTS += ssm-early
+TESTS += stosm-early
+TESTS += exrl-ssm-early
diff --git a/tests/tcg/s390x/exrl-ssm-early.S b/tests/tcg/s390x/exrl-ssm-early.S
new file mode 100644
index 0000000000..68fbd87b3a
--- /dev/null
+++ b/tests/tcg/s390x/exrl-ssm-early.S
@@ -0,0 +1,43 @@
+/*
+ * Test early exception recognition using EXRL + SSM.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .org 0x8d
+ilc:
+    .org 0x8e
+program_interruption_code:
+    .org 0x150
+program_old_psw:
+    .org 0x1D0                         /* program new PSW */
+    .quad 0,pgm
+    .org 0x200                         /* lowcore padding */
+
+    .globl _start
+_start:
+    exrl %r0,ssm
+expected_pswa:
+    j failure
+ssm:
+    ssm ssm_op
+
+pgm:
+    chhsi program_interruption_code,0x6          /* specification exception? */
+    jne failure
+    cli ilc,6                                    /* ilc for EXRL? */
+    jne failure
+    clc program_old_psw(16),expected_old_psw     /* correct old PSW? */
+    jne failure
+    lpswe success_psw
+failure:
+    lpswe failure_psw
+
+ssm_op:
+    .byte 0x08                                   /* bit 4 set */
+    .align 8
+expected_old_psw:
+    .quad 0x0800000180000000,expected_pswa       /* bit 2 set */
+success_psw:
+    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
+failure_psw:
+    .quad 0x2000000000000,0            /* disabled wait */
diff --git a/tests/tcg/s390x/lpsw.S b/tests/tcg/s390x/lpsw.S
new file mode 100644
index 0000000000..b37dec59b7
--- /dev/null
+++ b/tests/tcg/s390x/lpsw.S
@@ -0,0 +1,36 @@
+/*
+ * Test the LPSW instruction.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .org 0x140
+svc_old_psw:
+    .org 0x1c0                         /* supervisor call new PSW */
+    .quad 0x80000000,svc               /* 31-bit mode */
+    .org 0x200                         /* lowcore padding */
+
+    .globl _start
+_start:
+    lpsw short_psw
+lpsw_target:
+    svc 0
+expected_pswa:
+    j failure
+
+svc:
+    clc svc_old_psw(16),expected_psw   /* correct full PSW? */
+    jne failure
+    lpswe success_psw
+failure:
+    lpswe failure_psw
+
+    .align 8
+short_psw:
+    .long 0x90001,0x80000000+lpsw_target         /* problem state,
+                                                    64-bit mode */
+expected_psw:
+    .quad 0x1000180000000,expected_pswa          /* corresponds to short_psw */
+success_psw:
+    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
+failure_psw:
+    .quad 0x2000000000000,0            /* disabled wait */
diff --git a/tests/tcg/s390x/lpswe-early.S b/tests/tcg/s390x/lpswe-early.S
new file mode 100644
index 0000000000..90a7f213df
--- /dev/null
+++ b/tests/tcg/s390x/lpswe-early.S
@@ -0,0 +1,38 @@
+/*
+ * Test early exception recognition using LPSWE.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .org 0x8d
+ilc:
+    .org 0x8e
+program_interruption_code:
+    .org 0x150
+program_old_psw:
+    .org 0x1D0                         /* program new PSW */
+    .quad 0,pgm
+    .org 0x200                         /* lowcore padding */
+
+    .globl _start
+_start:
+    lpswe bad_psw
+    j failure
+
+pgm:
+    chhsi program_interruption_code,0x6          /* specification exception? */
+    jne failure
+    cli ilc,0                                    /* ilc zero? */
+    jne failure
+    clc program_old_psw(16),bad_psw              /* correct old PSW? */
+    jne failure
+    lpswe success_psw
+failure:
+    lpswe failure_psw
+
+    .align 8
+bad_psw:
+    .quad 0x8000000000000000,0xfedcba9876543210  /* bit 0 set */
+success_psw:
+    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
+failure_psw:
+    .quad 0x2000000000000,0            /* disabled wait */
diff --git a/tests/tcg/s390x/ssm-early.S b/tests/tcg/s390x/ssm-early.S
new file mode 100644
index 0000000000..6dfe40c597
--- /dev/null
+++ b/tests/tcg/s390x/ssm-early.S
@@ -0,0 +1,41 @@
+/*
+ * Test early exception recognition using SSM.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .org 0x8d
+ilc:
+    .org 0x8e
+program_interruption_code:
+    .org 0x150
+program_old_psw:
+    .org 0x1D0                         /* program new PSW */
+    .quad 0,pgm
+    .org 0x200                         /* lowcore padding */
+
+    .globl _start
+_start:
+    ssm ssm_op
+expected_pswa:
+    j failure
+
+pgm:
+    chhsi program_interruption_code,0x6          /* specification exception? */
+    jne failure
+    cli ilc,4                                    /* ilc for SSM? */
+    jne failure
+    clc program_old_psw(16),expected_old_psw     /* correct old PSW? */
+    jne failure
+    lpswe success_psw
+failure:
+    lpswe failure_psw
+
+ssm_op:
+    .byte 0x20                                   /* bit 2 set */
+    .align 8
+expected_old_psw:
+    .quad 0x2000000180000000,expected_pswa       /* bit 2 set */
+success_psw:
+    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
+failure_psw:
+    .quad 0x2000000000000,0            /* disabled wait */
diff --git a/tests/tcg/s390x/stosm-early.S b/tests/tcg/s390x/stosm-early.S
new file mode 100644
index 0000000000..0689924f3a
--- /dev/null
+++ b/tests/tcg/s390x/stosm-early.S
@@ -0,0 +1,41 @@
+/*
+ * Test early exception recognition using STOSM.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .org 0x8d
+ilc:
+    .org 0x8e
+program_interruption_code:
+    .org 0x150
+program_old_psw:
+    .org 0x1D0                         /* program new PSW */
+    .quad 0,pgm
+    .org 0x200                         /* lowcore padding */
+
+    .globl _start
+_start:
+    stosm ssm_op,0x10                            /* bit 3 set */
+expected_pswa:
+    j failure
+
+pgm:
+    chhsi program_interruption_code,0x6          /* specification exception? */
+    jne failure
+    cli ilc,4                                    /* ilc for STOSM? */
+    jne failure
+    clc program_old_psw(16),expected_old_psw     /* correct old PSW? */
+    jne failure
+    lpswe success_psw
+failure:
+    lpswe failure_psw
+
+ssm_op:
+    .byte 0
+    .align 8
+expected_old_psw:
+    .quad 0x1000000180000000,expected_pswa       /* bit 3 set */
+success_psw:
+    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
+failure_psw:
+    .quad 0x2000000000000,0            /* disabled wait */
-- 
2.31.1


