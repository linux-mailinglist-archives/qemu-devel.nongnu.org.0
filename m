Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEA53F3C81
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 23:13:21 +0200 (CEST)
Received: from localhost ([::1]:58552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHYIq-0002AI-G6
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 17:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a1925f3bb2560f2f19558dbc6d4309d3bb17529d@lizzy.crudebyte.com>)
 id 1mHYHG-00007H-Eh
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 17:11:42 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:43873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a1925f3bb2560f2f19558dbc6d4309d3bb17529d@lizzy.crudebyte.com>)
 id 1mHYHC-0001WJ-6e
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 17:11:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=Ihfx/i5DNU+G4x66QNtBztFtNjftz3znLfp5inBsl2c=; b=XH5Oz
 LhB+4tiX0w5g+MfP7h1502rt6GzM1ecxyGrj3tpwIHxLt0UYF2kw17qEfUWqH/phA+nzNFQljROa6
 KD8/I54KKd08lUaxXIBEFbhCuOMtFkWZoUY5VgWrT1tt8S7OCDxdqnkLOnX4UbBsRTAetdb8bWlEH
 M5O/Efh2+zCr9oPmo+IJqgFlCOXDwRpMpS+LP1tqZUNE5B9iLDtPen4Wbdc1uVd7oWgeJ4J9x9VLt
 yUdfzd/wWr9L4z2E3q5RK896a9PWhNQ5icSQoOEguWJJbq0it0sjZMUb9pK9t4oKak5BUltmVuSyT
 /cnEfUSLRfU68vpBuhkIXyXbFLQqQ==;
Message-Id: <a1925f3bb2560f2f19558dbc6d4309d3bb17529d.1629578875.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1629578875.git.qemu_oss@crudebyte.com>
References: <cover.1629578875.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sat, 21 Aug 2021 22:18:18 +0200
Subject: [PATCH 1/5] qemu/qarray.h: introduce QArray
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=a1925f3bb2560f2f19558dbc6d4309d3bb17529d@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implements deep auto free of arrays while retaining common C-style
squared bracket access.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 include/qemu/qarray.h | 148 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)
 create mode 100644 include/qemu/qarray.h

diff --git a/include/qemu/qarray.h b/include/qemu/qarray.h
new file mode 100644
index 0000000000..230a556e81
--- /dev/null
+++ b/include/qemu/qarray.h
@@ -0,0 +1,148 @@
+/*
+ * QArray - deep auto free C-array
+ *
+ * Copyright (c) 2021 Crudebyte
+ *
+ * Authors:
+ *   Christian Schoenebeck <qemu_oss@crudebyte.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+#ifndef QEMU_QARRAY_H
+#define QEMU_QARRAY_H
+
+/**
+ * QArray provides a mechanism to access arrays in common C-style (e.g. by
+ * square bracket [] operator) in conjunction with reference variables that
+ * perform deep auto free of the array when leaving the scope of the auto
+ * reference variable. That means not only is the array itself automatically
+ * freed, but also memory dynamically allocated by the individual array
+ * elements.
+ *
+ * Example:
+ *
+ * Consider the following user struct @c Foo which shall be used as scalar
+ * (element) type of an array:
+ * @code
+ * typedef struct Foo {
+ *     int i;
+ *     char *s;
+ * } Foo;
+ * @endcode
+ * and assume it has the following function to free memory allocated by @c Foo
+ * instances:
+ * @code
+ * void free_foo(Foo *foo) {
+ *     free(foo->s);
+ * }
+ * @endcode
+ * Add the following to a shared header file:
+ * @code
+ * DECLARE_QARRAY_TYPE(Foo);
+ * @endcode
+ * and the following to a C unit file:
+ * @code
+ * DEFINE_QARRAY_TYPE(Foo, free_foo);
+ * @endcode
+ * Finally the array may then be used like this:
+ * @code
+ * void doSomething(int n) {
+ *     QArrayRef(Foo) foos = NULL;
+ *     QARRAY_CREATE(Foo, foos, n);
+ *     for (size_t i = 0; i < n; ++i) {
+ *         foos[i].i = i;
+ *         foos[i].s = calloc(4096, 1);
+ *         snprintf(foos[i].s, 4096, "foo %d", i);
+ *     }
+ * }
+ * @endcode
+ */
+
+/**
+ * Declares an array for the passed @a scalar_type.
+ *
+ * This is typically used from a shared header file.
+ *
+ * @param scalar_type - type of the individual array elements
+ */
+#define DECLARE_QARRAY_TYPE(scalar_type) \
+    typedef struct QArray##scalar_type { \
+        size_t len; \
+        scalar_type first[]; \
+    } QArray##scalar_type; \
+    \
+    void qarray_create_##scalar_type(scalar_type **auto_var, size_t len); \
+    void qarray_auto_free_##scalar_type(scalar_type **auto_var); \
+
+/**
+ * Defines an array for the passed @a scalar_type and appropriate
+ * @a scalar_cleanup_func.
+ *
+ * @param scalar_type - type of the individual array elements
+ * @param scalar_cleanup_func - appropriate function to free memory dynamically
+ *                              allocated by individual array elements before
+ */
+#define DEFINE_QARRAY_TYPE(scalar_type, scalar_cleanup_func) \
+    void qarray_create_##scalar_type(scalar_type **auto_var, size_t len) \
+    { \
+        qarray_auto_free_##scalar_type(auto_var); \
+        QArray##scalar_type *arr = g_malloc0(sizeof(QArray##scalar_type) + \
+            len * sizeof(scalar_type)); \
+        arr->len = len; \
+        *auto_var = &arr->first[0]; \
+    } \
+    \
+    void qarray_auto_free_##scalar_type(scalar_type **auto_var) \
+    { \
+        scalar_type *first = (*auto_var); \
+        if (!first) { \
+            return; \
+        } \
+        QArray##scalar_type *arr = (QArray##scalar_type *) ( \
+            ((char *)first) - offsetof(QArray##scalar_type, first) \
+        ); \
+        for (size_t i = 0; i < arr->len; ++i) { \
+            scalar_cleanup_func(&arr->first[i]); \
+        } \
+        g_free(arr); \
+    } \
+
+/**
+ * Used to declare a reference variable (unique pointer) for an array. After
+ * leaving the scope of the reference variable, the associated array is
+ * automatically freed.
+ *
+ * @param scalar_type - type of the individual array elements
+ */
+#define QArrayRef(scalar_type) \
+    __attribute((__cleanup__(qarray_auto_free_##scalar_type))) scalar_type*
+
+/**
+ * Allocates a new array of passed @a scalar_type with @a len number of array
+ * elements and assigns the created array to the reference variable
+ * @a auto_var.
+ *
+ * @param scalar_type - type of the individual array elements
+ * @param auto_var - destination reference variable
+ * @param len - amount of array elements to be allocated immediately
+ */
+#define QARRAY_CREATE(scalar_type, auto_var, len) \
+    qarray_create_##scalar_type((&auto_var), len)
+
+#endif /* QEMU_QARRAY_H */
-- 
2.20.1


