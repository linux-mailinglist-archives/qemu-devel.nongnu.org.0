Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FB62C152A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:07:41 +0100 (CET)
Received: from localhost ([::1]:58290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khI7g-0005Ae-Py
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:07:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpR-0006EP-1d
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:48:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpO-0007ls-9q
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:48:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606160925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hEf6QWe1NZrQUT3H/uhkT2eCsB5nbcOOCywAEsktkNQ=;
 b=TPkllmr4F7bDPiekge11wOSocjYA/mSDzJ2VOcoEjje3/RiXYfLmu2tSZyEoQ7x6T7xaVX
 qhg+VYcTUBpjWiiD6/ICPay/mof0H8T2x7Lhi6Kwr3B8n4LiBtbCtXsPkGn/OYe6Dt6tis
 M8hroHTfQBufOSynDo4nxg82TgIa7C4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-T0nM2eQ_NUm9DRs8WLQgAQ-1; Mon, 23 Nov 2020 14:48:36 -0500
X-MC-Unique: T0nM2eQ_NUm9DRs8WLQgAQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A0B380B71D
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 19:48:28 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4C69620DE;
 Mon, 23 Nov 2020 19:48:27 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/19] qnum: QNumValue type for QNum value literals
Date: Mon, 23 Nov 2020 14:48:02 -0500
Message-Id: <20201123194818.2773508-4-ehabkost@redhat.com>
In-Reply-To: <20201123194818.2773508-1-ehabkost@redhat.com>
References: <20201123194818.2773508-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide a separate QNumValue type that can be used for QNum value
literals without the referencing counting and memory allocation
features provided by QObject.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v2 -> v3:
* Fixed copy-pasta at qnum_from_value() documentation
* Removed qnum_get_value() function
* Moved doc comment of qnum_from_value() to .c file, for
  consistency with other functions.
* Removed "private:" doc comment at QNumValue.
* Removed unnecessary kernel-doc noise (obvious
  parameter descriptions).
* Removed space after type cast in qnum_from_*().
* qnum_is_equal() variable const-ness & renames:
  * Renamed new QNumValue variables to val_x/val_y.
  * Keep existing QNum num_x/num_y variable names.
  * const-ness change of num_x/num_y was moved to a separate
    patch.

Changes v1 -> v2:
* Fix "make check" failure, by updating check-qnum unit test to
  use the new struct fields
---
 include/qapi/qmp/qnum.h | 23 ++++++++++-
 qobject/qnum.c          | 91 ++++++++++++++++++++++-------------------
 tests/check-qnum.c      | 14 +++----
 3 files changed, 76 insertions(+), 52 deletions(-)

diff --git a/include/qapi/qmp/qnum.h b/include/qapi/qmp/qnum.h
index 3e9ecd324e..03193dca20 100644
--- a/include/qapi/qmp/qnum.h
+++ b/include/qapi/qmp/qnum.h
@@ -44,16 +44,35 @@ typedef enum {
  * in range: qnum_get_try_int() / qnum_get_try_uint() check range and
  * convert under the hood.
  */
-struct QNum {
-    struct QObjectBase_ base;
+
+/**
+ * struct QNumValue: the value of a QNum
+ *
+ * QNumValue literals can be constructed using the `QNUM_VAL_INT`,
+ * `QNUM_VAL_UINT`, and `QNUM_VAL_DOUBLE` macros.
+ */
+typedef struct QNumValue {
     QNumKind kind;
     union {
         int64_t i64;
         uint64_t u64;
         double dbl;
     } u;
+} QNumValue;
+
+#define QNUM_VAL_INT(value) \
+    { .kind = QNUM_I64, .u.i64 = value }
+#define QNUM_VAL_UINT(value) \
+    { .kind = QNUM_U64, .u.u64 = value }
+#define QNUM_VAL_DOUBLE(value) \
+    { .kind = QNUM_DOUBLE, .u.dbl = value }
+
+struct QNum {
+    struct QObjectBase_ base;
+    QNumValue value;
 };
 
+QNum *qnum_from_value(QNumValue value);
 QNum *qnum_from_int(int64_t value);
 QNum *qnum_from_uint(uint64_t value);
 QNum *qnum_from_double(double value);
diff --git a/qobject/qnum.c b/qobject/qnum.c
index e5ea728638..94e668db60 100644
--- a/qobject/qnum.c
+++ b/qobject/qnum.c
@@ -16,21 +16,29 @@
 #include "qapi/qmp/qnum.h"
 
 /**
- * qnum_from_int(): Create a new QNum from an int64_t
+ * qnum_from_value(): Create a new QNum from a QNumValue
  *
  * Return strong reference.
  */
-QNum *qnum_from_int(int64_t value)
+QNum *qnum_from_value(QNumValue value)
 {
     QNum *qn = g_new(QNum, 1);
 
     qobject_init(QOBJECT(qn), QTYPE_QNUM);
-    qn->kind = QNUM_I64;
-    qn->u.i64 = value;
-
+    qn->value = value;
     return qn;
 }
 
+/**
+ * qnum_from_int(): Create a new QNum from an int64_t
+ *
+ * Return strong reference.
+ */
+QNum *qnum_from_int(int64_t value)
+{
+    return qnum_from_value((QNumValue)QNUM_VAL_INT(value));
+}
+
 /**
  * qnum_from_uint(): Create a new QNum from an uint64_t
  *
@@ -38,13 +46,7 @@ QNum *qnum_from_int(int64_t value)
  */
 QNum *qnum_from_uint(uint64_t value)
 {
-    QNum *qn = g_new(QNum, 1);
-
-    qobject_init(QOBJECT(qn), QTYPE_QNUM);
-    qn->kind = QNUM_U64;
-    qn->u.u64 = value;
-
-    return qn;
+    return qnum_from_value((QNumValue)QNUM_VAL_UINT(value));
 }
 
 /**
@@ -54,13 +56,7 @@ QNum *qnum_from_uint(uint64_t value)
  */
 QNum *qnum_from_double(double value)
 {
-    QNum *qn = g_new(QNum, 1);
-
-    qobject_init(QOBJECT(qn), QTYPE_QNUM);
-    qn->kind = QNUM_DOUBLE;
-    qn->u.dbl = value;
-
-    return qn;
+    return qnum_from_value((QNumValue)QNUM_VAL_DOUBLE(value));
 }
 
 /**
@@ -70,15 +66,17 @@ QNum *qnum_from_double(double value)
  */
 bool qnum_get_try_int(const QNum *qn, int64_t *val)
 {
-    switch (qn->kind) {
+    const QNumValue *qv = &qn->value;
+
+    switch (qv->kind) {
     case QNUM_I64:
-        *val = qn->u.i64;
+        *val = qv->u.i64;
         return true;
     case QNUM_U64:
-        if (qn->u.u64 > INT64_MAX) {
+        if (qv->u.u64 > INT64_MAX) {
             return false;
         }
-        *val = qn->u.u64;
+        *val = qv->u.u64;
         return true;
     case QNUM_DOUBLE:
         return false;
@@ -108,15 +106,17 @@ int64_t qnum_get_int(const QNum *qn)
  */
 bool qnum_get_try_uint(const QNum *qn, uint64_t *val)
 {
-    switch (qn->kind) {
+    const QNumValue *qv = &qn->value;
+
+    switch (qv->kind) {
     case QNUM_I64:
-        if (qn->u.i64 < 0) {
+        if (qv->u.i64 < 0) {
             return false;
         }
-        *val = qn->u.i64;
+        *val = qv->u.i64;
         return true;
     case QNUM_U64:
-        *val = qn->u.u64;
+        *val = qv->u.u64;
         return true;
     case QNUM_DOUBLE:
         return false;
@@ -146,13 +146,15 @@ uint64_t qnum_get_uint(const QNum *qn)
  */
 double qnum_get_double(const QNum *qn)
 {
-    switch (qn->kind) {
+    const QNumValue *qv = &qn->value;
+
+    switch (qv->kind) {
     case QNUM_I64:
-        return qn->u.i64;
+        return qv->u.i64;
     case QNUM_U64:
-        return qn->u.u64;
+        return qv->u.u64;
     case QNUM_DOUBLE:
-        return qn->u.dbl;
+        return qv->u.dbl;
     }
 
     assert(0);
@@ -161,14 +163,15 @@ double qnum_get_double(const QNum *qn)
 
 char *qnum_to_string(QNum *qn)
 {
+    const QNumValue *qv = &qn->value;
     char *buffer;
     int len;
 
-    switch (qn->kind) {
+    switch (qv->kind) {
     case QNUM_I64:
-        return g_strdup_printf("%" PRId64, qn->u.i64);
+        return g_strdup_printf("%" PRId64, qv->u.i64);
     case QNUM_U64:
-        return g_strdup_printf("%" PRIu64, qn->u.u64);
+        return g_strdup_printf("%" PRIu64, qv->u.u64);
     case QNUM_DOUBLE:
         /* FIXME: snprintf() is locale dependent; but JSON requires
          * numbers to be formatted as if in the C locale. Dependence
@@ -179,7 +182,7 @@ char *qnum_to_string(QNum *qn)
          * rounding errors; we should be using DBL_DECIMAL_DIG (17),
          * and only rounding to a shorter number if the result would
          * still produce the same floating point value.  */
-        buffer = g_strdup_printf("%f" , qn->u.dbl);
+        buffer = g_strdup_printf("%f" , qv->u.dbl);
         len = strlen(buffer);
         while (len > 0 && buffer[len - 1] == '0') {
             len--;
@@ -211,40 +214,42 @@ bool qnum_is_equal(const QObject *x, const QObject *y)
 {
     const QNum *num_x = qobject_to(QNum, x);
     const QNum *num_y = qobject_to(QNum, y);
+    const QNumValue *val_x = &num_x->value;
+    const QNumValue *val_y = &num_y->value;
 
-    switch (num_x->kind) {
+    switch (val_x->kind) {
     case QNUM_I64:
-        switch (num_y->kind) {
+        switch (val_y->kind) {
         case QNUM_I64:
             /* Comparison in native int64_t type */
-            return num_x->u.i64 == num_y->u.i64;
+            return val_x->u.i64 == val_y->u.i64;
         case QNUM_U64:
             /* Implicit conversion of x to uin64_t, so we have to
              * check its sign before */
-            return num_x->u.i64 >= 0 && num_x->u.i64 == num_y->u.u64;
+            return val_x->u.i64 >= 0 && val_x->u.i64 == val_y->u.u64;
         case QNUM_DOUBLE:
             return false;
         }
         abort();
     case QNUM_U64:
-        switch (num_y->kind) {
+        switch (val_y->kind) {
         case QNUM_I64:
             return qnum_is_equal(y, x);
         case QNUM_U64:
             /* Comparison in native uint64_t type */
-            return num_x->u.u64 == num_y->u.u64;
+            return val_x->u.u64 == val_y->u.u64;
         case QNUM_DOUBLE:
             return false;
         }
         abort();
     case QNUM_DOUBLE:
-        switch (num_y->kind) {
+        switch (val_y->kind) {
         case QNUM_I64:
         case QNUM_U64:
             return false;
         case QNUM_DOUBLE:
             /* Comparison in native double type */
-            return num_x->u.dbl == num_y->u.dbl;
+            return val_x->u.dbl == val_y->u.dbl;
         }
         abort();
     }
diff --git a/tests/check-qnum.c b/tests/check-qnum.c
index 4105015872..9499b0d845 100644
--- a/tests/check-qnum.c
+++ b/tests/check-qnum.c
@@ -30,8 +30,8 @@ static void qnum_from_int_test(void)
 
     qn = qnum_from_int(value);
     g_assert(qn != NULL);
-    g_assert_cmpint(qn->kind, ==, QNUM_I64);
-    g_assert_cmpint(qn->u.i64, ==, value);
+    g_assert_cmpint(qn->value.kind, ==, QNUM_I64);
+    g_assert_cmpint(qn->value.u.i64, ==, value);
     g_assert_cmpint(qn->base.refcnt, ==, 1);
     g_assert_cmpint(qobject_type(QOBJECT(qn)), ==, QTYPE_QNUM);
 
@@ -45,8 +45,8 @@ static void qnum_from_uint_test(void)
 
     qn = qnum_from_uint(value);
     g_assert(qn != NULL);
-    g_assert_cmpint(qn->kind, ==, QNUM_U64);
-    g_assert(qn->u.u64 == value);
+    g_assert_cmpint(qn->value.kind, ==, QNUM_U64);
+    g_assert(qn->value.u.u64 == value);
     g_assert(qn->base.refcnt == 1);
     g_assert(qobject_type(QOBJECT(qn)) == QTYPE_QNUM);
 
@@ -60,8 +60,8 @@ static void qnum_from_double_test(void)
 
     qn = qnum_from_double(value);
     g_assert(qn != NULL);
-    g_assert_cmpint(qn->kind, ==, QNUM_DOUBLE);
-    g_assert_cmpfloat(qn->u.dbl, ==, value);
+    g_assert_cmpint(qn->value.kind, ==, QNUM_DOUBLE);
+    g_assert_cmpfloat(qn->value.u.dbl, ==, value);
     g_assert_cmpint(qn->base.refcnt, ==, 1);
     g_assert_cmpint(qobject_type(QOBJECT(qn)), ==, QTYPE_QNUM);
 
@@ -74,7 +74,7 @@ static void qnum_from_int64_test(void)
     const int64_t value = 0x1234567890abcdefLL;
 
     qn = qnum_from_int(value);
-    g_assert_cmpint((int64_t) qn->u.i64, ==, value);
+    g_assert_cmpint((int64_t) qn->value.u.i64, ==, value);
 
     qobject_unref(qn);
 }
-- 
2.28.0


