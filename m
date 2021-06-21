Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 438A13AF896
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 00:33:51 +0200 (CEST)
Received: from localhost ([::1]:35460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvSUI-0001nr-9K
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 18:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lvST0-0008Bg-Vj; Mon, 21 Jun 2021 18:32:30 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:5262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lvSSy-0002Fp-UG; Mon, 21 Jun 2021 18:32:30 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15LM4Bgm131368; Mon, 21 Jun 2021 18:32:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=LKwgmpdWsaxNIXMXuq64ft+M0XYiL+koNYESKIBEJ+s=;
 b=a3191L1pFdB9wvYLJIHb4tMlTZpvvYlSYuBVIfLTD7tmcHRRQn5P0ell6yO36NnebSVA
 WjlLF5G8bhH1RVikNJ/Q/Iv6y9NgndvCcMIfltle3HOMUobrhNqV18Rip0/mHuZ0c7Vk
 76OzVQmpYbQDpGK+bKjQWrG84Fe3qvDKqo9IvyBps/qJrD6VmueI1FXlLTKKr2MHRYrV
 RZ0t8G/w6RwDqQRazCbnp2OZx1lC0Ol4kk3V50z6/31SvbhYn6w2PA29n9/oHRi641le
 oXkXLRLRj8Ah/FQ8d8p6bBIQAAEA14iz45I8W79PHwQOrlGE22UKKcVwp+xd/iuRmntX uQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39b31u0u3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 18:32:26 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15LMWQhZ103005;
 Mon, 21 Jun 2021 18:32:26 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39b31u0u2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 18:32:26 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15LMFwwT016562;
 Mon, 21 Jun 2021 22:32:24 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3998788m4a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 22:32:23 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15LMWKO318153828
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Jun 2021 22:32:21 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DED3242176;
 Mon, 21 Jun 2021 22:32:20 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E13942175;
 Mon, 21 Jun 2021 22:32:20 +0000 (GMT)
Received: from vm.lan (unknown [9.145.39.144])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 Jun 2021 22:32:20 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v4 2/2] tests/tcg/s390x: Test SIGILL and SIGSEGV handling
Date: Tue, 22 Jun 2021 00:32:17 +0200
Message-Id: <20210621223217.3642303-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621223217.3642303-1-iii@linux.ibm.com>
References: <20210621223217.3642303-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Jss6YgzrkaVQInnJBb9Oo6wikWXf8gg8
X-Proofpoint-ORIG-GUID: luWGIKPJTQbLCHk0m0PvQd403pPb82ml
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-21_13:2021-06-21,
 2021-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106210130
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "jonathan . albrecht" <jonathan.albrecht@linux.vnet.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Verify that s390x-specific uc_mcontext.psw.addr is reported correctly.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/Makefile.target |   1 +
 tests/tcg/s390x/signal.c        | 165 ++++++++++++++++++++++++++++++++
 2 files changed, 166 insertions(+)
 create mode 100644 tests/tcg/s390x/signal.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 241ef28f61..cdb7d85316 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -8,3 +8,4 @@ TESTS+=exrl-trtr
 TESTS+=pack
 TESTS+=mvo
 TESTS+=mvc
+TESTS+=signal
diff --git a/tests/tcg/s390x/signal.c b/tests/tcg/s390x/signal.c
new file mode 100644
index 0000000000..37c6665075
--- /dev/null
+++ b/tests/tcg/s390x/signal.c
@@ -0,0 +1,165 @@
+#include <assert.h>
+#include <signal.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <ucontext.h>
+#include <unistd.h>
+
+/*
+ * Various instructions that generate SIGILL and SIGSEGV. They could have been
+ * defined in a separate .s file, but this would complicate the build, so the
+ * inline asm is used instead.
+ */
+
+void illegal_op(void);
+void after_illegal_op(void);
+asm(".globl\tillegal_op\n"
+    "illegal_op:\t.byte\t0x00,0x00\n"
+    "\t.globl\tafter_illegal_op\n"
+    "after_illegal_op:\tbr\t%r14");
+
+void stg(void *dst, unsigned long src);
+asm(".globl\tstg\n"
+    "stg:\tstg\t%r3,0(%r2)\n"
+    "\tbr\t%r14");
+
+void mvc_8(void *dst, void *src);
+asm(".globl\tmvc_8\n"
+    "mvc_8:\tmvc\t0(8,%r2),0(%r3)\n"
+    "\tbr\t%r14");
+
+static void safe_puts(const char *s)
+{
+    write(0, s, strlen(s));
+    write(0, "\n", 1);
+}
+
+enum exception {
+    exception_operation,
+    exception_translation,
+    exception_protection,
+};
+
+static struct {
+    int sig;
+    void *addr;
+    unsigned long psw_addr;
+    enum exception exception;
+} expected;
+
+static void handle_signal(int sig, siginfo_t *info, void *ucontext)
+{
+    void *page;
+    int err;
+
+    if (sig != expected.sig) {
+        safe_puts("[  FAILED  ] wrong signal");
+        _exit(1);
+    }
+
+    if (info->si_addr != expected.addr) {
+        safe_puts("[  FAILED  ] wrong si_addr");
+        _exit(1);
+    }
+
+    if (((ucontext_t *)ucontext)->uc_mcontext.psw.addr != expected.psw_addr) {
+        safe_puts("[  FAILED  ] wrong psw.addr");
+        _exit(1);
+    }
+
+    switch (expected.exception) {
+    case exception_translation:
+        page = mmap(expected.addr, 4096, PROT_READ | PROT_WRITE,
+                    MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0);
+        if (page != expected.addr) {
+            safe_puts("[  FAILED  ] mmap() failed");
+            _exit(1);
+        }
+        break;
+    case exception_protection:
+        err = mprotect(expected.addr, 4096, PROT_READ | PROT_WRITE);
+        if (err != 0) {
+            safe_puts("[  FAILED  ] mprotect() failed");
+            _exit(1);
+        }
+        break;
+    default:
+        break;
+    }
+}
+
+static void check_sigsegv(void *func, enum exception exception,
+                          unsigned long val)
+{
+    int prot;
+    unsigned long *page;
+    unsigned long *addr;
+    int err;
+
+    prot = exception == exception_translation ? PROT_NONE : PROT_READ;
+    page = mmap(NULL, 4096, prot, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+    assert(page != MAP_FAILED);
+    if (exception == exception_translation) {
+        /* Hopefully nothing will be mapped at this address. */
+        err = munmap(page, 4096);
+        assert(err == 0);
+    }
+    addr = page + (val & 0x1ff);
+
+    expected.sig = SIGSEGV;
+    expected.addr = page;
+    expected.psw_addr = (unsigned long)func;
+    expected.exception = exception;
+    if (func == stg) {
+        stg(addr, val);
+    } else {
+        assert(func == mvc_8);
+        mvc_8(addr, &val);
+    }
+    assert(*addr == val);
+
+    err = munmap(page, 4096);
+    assert(err == 0);
+}
+
+int main(void)
+{
+    struct sigaction act;
+    int err;
+
+    memset(&act, 0, sizeof(act));
+    act.sa_sigaction = handle_signal;
+    act.sa_flags = SA_SIGINFO;
+    err = sigaction(SIGILL, &act, NULL);
+    assert(err == 0);
+    err = sigaction(SIGSEGV, &act, NULL);
+    assert(err == 0);
+
+    safe_puts("[ RUN      ] Operation exception");
+    expected.sig = SIGILL;
+    expected.addr = illegal_op;
+    expected.psw_addr = (unsigned long)after_illegal_op;
+    expected.exception = exception_operation;
+    illegal_op();
+    safe_puts("[       OK ]");
+
+    safe_puts("[ RUN      ] Translation exception from stg");
+    check_sigsegv(stg, exception_translation, 42);
+    safe_puts("[       OK ]");
+
+    safe_puts("[ RUN      ] Translation exception from mvc");
+    check_sigsegv(mvc_8, exception_translation, 4242);
+    safe_puts("[       OK ]");
+
+    safe_puts("[ RUN      ] Protection exception from stg");
+    check_sigsegv(stg, exception_protection, 424242);
+    safe_puts("[       OK ]");
+
+    safe_puts("[ RUN      ] Protection exception from mvc");
+    check_sigsegv(mvc_8, exception_protection, 42424242);
+    safe_puts("[       OK ]");
+
+    safe_puts("[  PASSED  ]");
+
+    return 0;
+}
-- 
2.31.1


