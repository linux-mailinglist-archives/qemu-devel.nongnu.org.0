Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9A5A9D16
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Sep 2019 10:34:42 +0200 (CEST)
Received: from localhost ([::1]:43230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5nE1-00019N-AP
	for lists+qemu-devel@lfdr.de; Thu, 05 Sep 2019 04:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33121)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1i5nAW-0007qN-Ct
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 04:31:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1i5nAS-0005qR-M3
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 04:31:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43598)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1i5nAS-0005q2-Ba
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 04:31:00 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8F63180038D;
 Thu,  5 Sep 2019 08:30:59 +0000 (UTC)
Received: from thuth.com (ovpn-116-96.ams2.redhat.com [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E2925D704;
 Thu,  5 Sep 2019 08:30:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  5 Sep 2019 10:30:46 +0200
Message-Id: <20190905083049.11645-6-thuth@redhat.com>
In-Reply-To: <20190905083049.11645-1-thuth@redhat.com>
References: <20190905083049.11645-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Thu, 05 Sep 2019 08:30:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 5/8] tests/libqtest: Move global_test wrapper
 function into a separate header
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want libqtest.h to become completely independent from global_qtest
(so that the wrapper functions are not used by accident anymore). As
a first step, move the wrapper functions into a separate header file.

The new header is only included from libqtest.h for now, so that there
is no difference to the users of libqtest.h yet. In the next patch, we
will switch this, so that the users of the global_qtest-related
functions will be using libqtest-single.h directly and libqtest.h
becomes completely independent of this.

Message-Id: <20190904130047.25808-6-thuth@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS             |   2 +-
 tests/libqtest-single.h | 311 ++++++++++++++++++++++++++++++++++++++++
 tests/libqtest.c        |  11 --
 tests/libqtest.h        | 287 +-----------------------------------
 4 files changed, 313 insertions(+), 298 deletions(-)
 create mode 100644 tests/libqtest-single.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c4c90f732d..65d8a7c2d2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2079,7 +2079,7 @@ R: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
 F: qtest.c
 F: accel/qtest.c
-F: tests/libqtest.*
+F: tests/libqtest*
 F: tests/libqos/
 F: tests/*-test.c
 
diff --git a/tests/libqtest-single.h b/tests/libqtest-single.h
new file mode 100644
index 0000000000..49259558a5
--- /dev/null
+++ b/tests/libqtest-single.h
@@ -0,0 +1,311 @@
+/*
+ * QTest - wrappers for test with single QEMU instances
+ *
+ * Copyright IBM, Corp. 2012
+ * Copyright Red Hat, Inc. 2012
+ * Copyright SUSE LINUX Products GmbH 2013
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef LIBQTEST_SINGLE_H
+#define LIBQTEST_SINGLE_H
+
+/**
+ * qtest_start:
+ * @args: other arguments to pass to QEMU
+ *
+ * Start QEMU and assign the resulting #QTestState to a global variable.
+ * The global variable is used by "shortcut" functions documented below.
+ *
+ * Returns: #QTestState instance.
+ */
+static inline QTestState *qtest_start(const char *args)
+{
+    global_qtest = qtest_init(args);
+    return global_qtest;
+}
+
+/**
+ * qtest_end:
+ *
+ * Shut down the QEMU process started by qtest_start().
+ */
+static inline void qtest_end(void)
+{
+    if (!global_qtest) {
+        return;
+    }
+    qtest_quit(global_qtest);
+    global_qtest = NULL;
+}
+
+/**
+ * qmp:
+ * @fmt...: QMP message to send to qemu, formatted like
+ * qobject_from_jsonf_nofail().  See parse_escape() for what's
+ * supported after '%'.
+ *
+ * Sends a QMP message to QEMU and returns the response.
+ */
+GCC_FMT_ATTR(1, 2)
+static inline QDict *qmp(const char *fmt, ...)
+{
+    va_list ap;
+    QDict *response;
+
+    va_start(ap, fmt);
+    response = qtest_vqmp(global_qtest, fmt, ap);
+    va_end(ap);
+    return response;
+}
+
+/**
+ * qmp_eventwait:
+ * @s: #event event to wait for.
+ *
+ * Continuously polls for QMP responses until it receives the desired event.
+ */
+static inline void qmp_eventwait(const char *event)
+{
+    return qtest_qmp_eventwait(global_qtest, event);
+}
+
+/**
+ * get_irq:
+ * @num: Interrupt to observe.
+ *
+ * Returns: The level of the @num interrupt.
+ */
+static inline bool get_irq(int num)
+{
+    return qtest_get_irq(global_qtest, num);
+}
+
+/**
+ * outb:
+ * @addr: I/O port to write to.
+ * @value: Value being written.
+ *
+ * Write an 8-bit value to an I/O port.
+ */
+static inline void outb(uint16_t addr, uint8_t value)
+{
+    qtest_outb(global_qtest, addr, value);
+}
+
+/**
+ * outw:
+ * @addr: I/O port to write to.
+ * @value: Value being written.
+ *
+ * Write a 16-bit value to an I/O port.
+ */
+static inline void outw(uint16_t addr, uint16_t value)
+{
+    qtest_outw(global_qtest, addr, value);
+}
+
+/**
+ * outl:
+ * @addr: I/O port to write to.
+ * @value: Value being written.
+ *
+ * Write a 32-bit value to an I/O port.
+ */
+static inline void outl(uint16_t addr, uint32_t value)
+{
+    qtest_outl(global_qtest, addr, value);
+}
+
+/**
+ * inb:
+ * @addr: I/O port to read from.
+ *
+ * Reads an 8-bit value from an I/O port.
+ *
+ * Returns: Value read.
+ */
+static inline uint8_t inb(uint16_t addr)
+{
+    return qtest_inb(global_qtest, addr);
+}
+
+/**
+ * inw:
+ * @addr: I/O port to read from.
+ *
+ * Reads a 16-bit value from an I/O port.
+ *
+ * Returns: Value read.
+ */
+static inline uint16_t inw(uint16_t addr)
+{
+    return qtest_inw(global_qtest, addr);
+}
+
+/**
+ * inl:
+ * @addr: I/O port to read from.
+ *
+ * Reads a 32-bit value from an I/O port.
+ *
+ * Returns: Value read.
+ */
+static inline uint32_t inl(uint16_t addr)
+{
+    return qtest_inl(global_qtest, addr);
+}
+
+/**
+ * writeb:
+ * @addr: Guest address to write to.
+ * @value: Value being written.
+ *
+ * Writes an 8-bit value to guest memory.
+ */
+static inline void writeb(uint64_t addr, uint8_t value)
+{
+    qtest_writeb(global_qtest, addr, value);
+}
+
+/**
+ * writew:
+ * @addr: Guest address to write to.
+ * @value: Value being written.
+ *
+ * Writes a 16-bit value to guest memory.
+ */
+static inline void writew(uint64_t addr, uint16_t value)
+{
+    qtest_writew(global_qtest, addr, value);
+}
+
+/**
+ * writel:
+ * @addr: Guest address to write to.
+ * @value: Value being written.
+ *
+ * Writes a 32-bit value to guest memory.
+ */
+static inline void writel(uint64_t addr, uint32_t value)
+{
+    qtest_writel(global_qtest, addr, value);
+}
+
+/**
+ * writeq:
+ * @addr: Guest address to write to.
+ * @value: Value being written.
+ *
+ * Writes a 64-bit value to guest memory.
+ */
+static inline void writeq(uint64_t addr, uint64_t value)
+{
+    qtest_writeq(global_qtest, addr, value);
+}
+
+/**
+ * readb:
+ * @addr: Guest address to read from.
+ *
+ * Reads an 8-bit value from guest memory.
+ *
+ * Returns: Value read.
+ */
+static inline uint8_t readb(uint64_t addr)
+{
+    return qtest_readb(global_qtest, addr);
+}
+
+/**
+ * readw:
+ * @addr: Guest address to read from.
+ *
+ * Reads a 16-bit value from guest memory.
+ *
+ * Returns: Value read.
+ */
+static inline uint16_t readw(uint64_t addr)
+{
+    return qtest_readw(global_qtest, addr);
+}
+
+/**
+ * readl:
+ * @addr: Guest address to read from.
+ *
+ * Reads a 32-bit value from guest memory.
+ *
+ * Returns: Value read.
+ */
+static inline uint32_t readl(uint64_t addr)
+{
+    return qtest_readl(global_qtest, addr);
+}
+
+/**
+ * readq:
+ * @addr: Guest address to read from.
+ *
+ * Reads a 64-bit value from guest memory.
+ *
+ * Returns: Value read.
+ */
+static inline uint64_t readq(uint64_t addr)
+{
+    return qtest_readq(global_qtest, addr);
+}
+
+/**
+ * memread:
+ * @addr: Guest address to read from.
+ * @data: Pointer to where memory contents will be stored.
+ * @size: Number of bytes to read.
+ *
+ * Read guest memory into a buffer.
+ */
+static inline void memread(uint64_t addr, void *data, size_t size)
+{
+    qtest_memread(global_qtest, addr, data, size);
+}
+
+/**
+ * memwrite:
+ * @addr: Guest address to write to.
+ * @data: Pointer to the bytes that will be written to guest memory.
+ * @size: Number of bytes to write.
+ *
+ * Write a buffer to guest memory.
+ */
+static inline void memwrite(uint64_t addr, const void *data, size_t size)
+{
+    qtest_memwrite(global_qtest, addr, data, size);
+}
+
+/**
+ * clock_step_next:
+ *
+ * Advance the QEMU_CLOCK_VIRTUAL to the next deadline.
+ *
+ * Returns: The current value of the QEMU_CLOCK_VIRTUAL in nanoseconds.
+ */
+static inline int64_t clock_step_next(void)
+{
+    return qtest_clock_step_next(global_qtest);
+}
+
+/**
+ * clock_step:
+ * @step: Number of nanoseconds to advance the clock by.
+ *
+ * Advance the QEMU_CLOCK_VIRTUAL by @step nanoseconds.
+ *
+ * Returns: The current value of the QEMU_CLOCK_VIRTUAL in nanoseconds.
+ */
+static inline int64_t clock_step(int64_t step)
+{
+    return qtest_clock_step(global_qtest, step);
+}
+
+#endif
diff --git a/tests/libqtest.c b/tests/libqtest.c
index 2713b86cf7..e5101d9d3a 100644
--- a/tests/libqtest.c
+++ b/tests/libqtest.c
@@ -1106,17 +1106,6 @@ void qtest_memset(QTestState *s, uint64_t addr, uint8_t pattern, size_t size)
     qtest_rsp(s, 0);
 }
 
-QDict *qmp(const char *fmt, ...)
-{
-    va_list ap;
-    QDict *response;
-
-    va_start(ap, fmt);
-    response = qtest_vqmp(global_qtest, fmt, ap);
-    va_end(ap);
-    return response;
-}
-
 void qtest_qmp_assert_success(QTestState *qts, const char *fmt, ...)
 {
     va_list ap;
diff --git a/tests/libqtest.h b/tests/libqtest.h
index 07ea35867c..6a7d7e41ad 100644
--- a/tests/libqtest.h
+++ b/tests/libqtest.h
@@ -628,45 +628,6 @@ void qtest_add_data_func_full(const char *str, void *data,
 
 void qtest_add_abrt_handler(GHookFunc fn, const void *data);
 
-/**
- * qtest_start:
- * @args: other arguments to pass to QEMU
- *
- * Start QEMU and assign the resulting #QTestState to a global variable.
- * The global variable is used by "shortcut" functions documented below.
- *
- * Returns: #QTestState instance.
- */
-static inline QTestState *qtest_start(const char *args)
-{
-    global_qtest = qtest_init(args);
-    return global_qtest;
-}
-
-/**
- * qtest_end:
- *
- * Shut down the QEMU process started by qtest_start().
- */
-static inline void qtest_end(void)
-{
-    if (!global_qtest) {
-        return;
-    }
-    qtest_quit(global_qtest);
-    global_qtest = NULL;
-}
-
-/**
- * qmp:
- * @fmt...: QMP message to send to qemu, formatted like
- * qobject_from_jsonf_nofail().  See parse_escape() for what's
- * supported after '%'.
- *
- * Sends a QMP message to QEMU and returns the response.
- */
-QDict *qmp(const char *fmt, ...) GCC_FMT_ATTR(1, 2);
-
 /**
  * qtest_qmp_assert_success:
  * @qts: QTestState instance to operate on
@@ -680,253 +641,7 @@ QDict *qmp(const char *fmt, ...) GCC_FMT_ATTR(1, 2);
 void qtest_qmp_assert_success(QTestState *qts, const char *fmt, ...)
     GCC_FMT_ATTR(2, 3);
 
-/*
- * qmp_eventwait:
- * @s: #event event to wait for.
- *
- * Continuously polls for QMP responses until it receives the desired event.
- */
-static inline void qmp_eventwait(const char *event)
-{
-    return qtest_qmp_eventwait(global_qtest, event);
-}
-
-/**
- * get_irq:
- * @num: Interrupt to observe.
- *
- * Returns: The level of the @num interrupt.
- */
-static inline bool get_irq(int num)
-{
-    return qtest_get_irq(global_qtest, num);
-}
-
-/**
- * outb:
- * @addr: I/O port to write to.
- * @value: Value being written.
- *
- * Write an 8-bit value to an I/O port.
- */
-static inline void outb(uint16_t addr, uint8_t value)
-{
-    qtest_outb(global_qtest, addr, value);
-}
-
-/**
- * outw:
- * @addr: I/O port to write to.
- * @value: Value being written.
- *
- * Write a 16-bit value to an I/O port.
- */
-static inline void outw(uint16_t addr, uint16_t value)
-{
-    qtest_outw(global_qtest, addr, value);
-}
-
-/**
- * outl:
- * @addr: I/O port to write to.
- * @value: Value being written.
- *
- * Write a 32-bit value to an I/O port.
- */
-static inline void outl(uint16_t addr, uint32_t value)
-{
-    qtest_outl(global_qtest, addr, value);
-}
-
-/**
- * inb:
- * @addr: I/O port to read from.
- *
- * Reads an 8-bit value from an I/O port.
- *
- * Returns: Value read.
- */
-static inline uint8_t inb(uint16_t addr)
-{
-    return qtest_inb(global_qtest, addr);
-}
-
-/**
- * inw:
- * @addr: I/O port to read from.
- *
- * Reads a 16-bit value from an I/O port.
- *
- * Returns: Value read.
- */
-static inline uint16_t inw(uint16_t addr)
-{
-    return qtest_inw(global_qtest, addr);
-}
-
-/**
- * inl:
- * @addr: I/O port to read from.
- *
- * Reads a 32-bit value from an I/O port.
- *
- * Returns: Value read.
- */
-static inline uint32_t inl(uint16_t addr)
-{
-    return qtest_inl(global_qtest, addr);
-}
-
-/**
- * writeb:
- * @addr: Guest address to write to.
- * @value: Value being written.
- *
- * Writes an 8-bit value to guest memory.
- */
-static inline void writeb(uint64_t addr, uint8_t value)
-{
-    qtest_writeb(global_qtest, addr, value);
-}
-
-/**
- * writew:
- * @addr: Guest address to write to.
- * @value: Value being written.
- *
- * Writes a 16-bit value to guest memory.
- */
-static inline void writew(uint64_t addr, uint16_t value)
-{
-    qtest_writew(global_qtest, addr, value);
-}
-
-/**
- * writel:
- * @addr: Guest address to write to.
- * @value: Value being written.
- *
- * Writes a 32-bit value to guest memory.
- */
-static inline void writel(uint64_t addr, uint32_t value)
-{
-    qtest_writel(global_qtest, addr, value);
-}
-
-/**
- * writeq:
- * @addr: Guest address to write to.
- * @value: Value being written.
- *
- * Writes a 64-bit value to guest memory.
- */
-static inline void writeq(uint64_t addr, uint64_t value)
-{
-    qtest_writeq(global_qtest, addr, value);
-}
-
-/**
- * readb:
- * @addr: Guest address to read from.
- *
- * Reads an 8-bit value from guest memory.
- *
- * Returns: Value read.
- */
-static inline uint8_t readb(uint64_t addr)
-{
-    return qtest_readb(global_qtest, addr);
-}
-
-/**
- * readw:
- * @addr: Guest address to read from.
- *
- * Reads a 16-bit value from guest memory.
- *
- * Returns: Value read.
- */
-static inline uint16_t readw(uint64_t addr)
-{
-    return qtest_readw(global_qtest, addr);
-}
-
-/**
- * readl:
- * @addr: Guest address to read from.
- *
- * Reads a 32-bit value from guest memory.
- *
- * Returns: Value read.
- */
-static inline uint32_t readl(uint64_t addr)
-{
-    return qtest_readl(global_qtest, addr);
-}
-
-/**
- * readq:
- * @addr: Guest address to read from.
- *
- * Reads a 64-bit value from guest memory.
- *
- * Returns: Value read.
- */
-static inline uint64_t readq(uint64_t addr)
-{
-    return qtest_readq(global_qtest, addr);
-}
-
-/**
- * memread:
- * @addr: Guest address to read from.
- * @data: Pointer to where memory contents will be stored.
- * @size: Number of bytes to read.
- *
- * Read guest memory into a buffer.
- */
-static inline void memread(uint64_t addr, void *data, size_t size)
-{
-    qtest_memread(global_qtest, addr, data, size);
-}
-
-/**
- * memwrite:
- * @addr: Guest address to write to.
- * @data: Pointer to the bytes that will be written to guest memory.
- * @size: Number of bytes to write.
- *
- * Write a buffer to guest memory.
- */
-static inline void memwrite(uint64_t addr, const void *data, size_t size)
-{
-    qtest_memwrite(global_qtest, addr, data, size);
-}
-
-/**
- * clock_step_next:
- *
- * Advance the QEMU_CLOCK_VIRTUAL to the next deadline.
- *
- * Returns: The current value of the QEMU_CLOCK_VIRTUAL in nanoseconds.
- */
-static inline int64_t clock_step_next(void)
-{
-    return qtest_clock_step_next(global_qtest);
-}
-
-/**
- * clock_step:
- * @step: Number of nanoseconds to advance the clock by.
- *
- * Advance the QEMU_CLOCK_VIRTUAL by @step nanoseconds.
- *
- * Returns: The current value of the QEMU_CLOCK_VIRTUAL in nanoseconds.
- */
-static inline int64_t clock_step(int64_t step)
-{
-    return qtest_clock_step(global_qtest, step);
-}
+#include "libqtest-single.h"
 
 QDict *qmp_fd_receive(int fd);
 void qmp_fd_vsend_fds(int fd, int *fds, size_t fds_num,
-- 
2.18.1


