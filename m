Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B792C14EC
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:02:48 +0100 (CET)
Received: from localhost ([::1]:49674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khI2w-00015v-Tq
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:02:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpP-0006CH-W9
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:48:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpO-0007lv-94
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:48:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606160925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HUVglx5cApY8wRNog8RxQhhyuyvT2BUOaImb2qBRLoE=;
 b=bnk0Av/rfF9zsi1nuFuGFUuHfEdoEY78EwPONpTvd1dMn7fA1Vlt2yXge9Qv60NCU+tHl1
 5A6O0KRQqTrMW27seOREuyI5WxNA4vrACeG/AB8/YTo5tBW+yCyWNgmNK/hMMGoAZQwdA8
 aBchPHtKAE1GzX4r/z1qoozAZYf2Kjw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-eDtTNRP5NpqFMU8s8pGGkw-1; Mon, 23 Nov 2020 14:48:41 -0500
X-MC-Unique: eDtTNRP5NpqFMU8s8pGGkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76453105207B
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 19:48:29 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2520660C04;
 Mon, 23 Nov 2020 19:48:29 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/19] qnum: qnum_value_is_equal() function
Date: Mon, 23 Nov 2020 14:48:03 -0500
Message-Id: <20201123194818.2773508-5-ehabkost@redhat.com>
In-Reply-To: <20201123194818.2773508-1-ehabkost@redhat.com>
References: <20201123194818.2773508-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Extract the QNum value comparison logic to a function that takes
QNumValue* as argument.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v2 -> v3:
* Rename function parameters to val_x/val_y
* Insert blank line after variable declarations at
  qnum_is_equal()
---
 include/qapi/qmp/qnum.h |  1 +
 qobject/qnum.c          | 24 ++++++++++++++++--------
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/include/qapi/qmp/qnum.h b/include/qapi/qmp/qnum.h
index 03193dca20..3dcb020689 100644
--- a/include/qapi/qmp/qnum.h
+++ b/include/qapi/qmp/qnum.h
@@ -87,6 +87,7 @@ double qnum_get_double(const QNum *qn);
 
 char *qnum_to_string(QNum *qn);
 
+bool qnum_value_is_equal(const QNumValue *val_x, const QNumValue *val_y);
 bool qnum_is_equal(const QObject *x, const QObject *y);
 void qnum_destroy_obj(QObject *obj);
 
diff --git a/qobject/qnum.c b/qobject/qnum.c
index 94e668db60..53c637f46d 100644
--- a/qobject/qnum.c
+++ b/qobject/qnum.c
@@ -202,7 +202,7 @@ char *qnum_to_string(QNum *qn)
 }
 
 /**
- * qnum_is_equal(): Test whether the two QNums are equal
+ * qnum_value_is_equal(): Test whether two QNumValues are equal
  *
  * Negative integers are never considered equal to unsigned integers,
  * but positive integers in the range [0, INT64_MAX] are considered
@@ -210,13 +210,8 @@ char *qnum_to_string(QNum *qn)
  *
  * Doubles are never considered equal to integers.
  */
-bool qnum_is_equal(const QObject *x, const QObject *y)
+bool qnum_value_is_equal(const QNumValue *val_x, const QNumValue *val_y)
 {
-    const QNum *num_x = qobject_to(QNum, x);
-    const QNum *num_y = qobject_to(QNum, y);
-    const QNumValue *val_x = &num_x->value;
-    const QNumValue *val_y = &num_y->value;
-
     switch (val_x->kind) {
     case QNUM_I64:
         switch (val_y->kind) {
@@ -234,7 +229,7 @@ bool qnum_is_equal(const QObject *x, const QObject *y)
     case QNUM_U64:
         switch (val_y->kind) {
         case QNUM_I64:
-            return qnum_is_equal(y, x);
+            return qnum_value_is_equal(val_y, val_x);
         case QNUM_U64:
             /* Comparison in native uint64_t type */
             return val_x->u.u64 == val_y->u.u64;
@@ -257,6 +252,19 @@ bool qnum_is_equal(const QObject *x, const QObject *y)
     abort();
 }
 
+/**
+ * qnum_is_equal(): Test whether the two QNums are equal
+ *
+ * See qnum_value_is_equal() for details on the comparison rules.
+ */
+bool qnum_is_equal(const QObject *x, const QObject *y)
+{
+    const QNum *qnum_x = qobject_to(QNum, x);
+    const QNum *qnum_y = qobject_to(QNum, y);
+
+    return qnum_value_is_equal(&qnum_x->value, &qnum_y->value);
+}
+
 /**
  * qnum_destroy_obj(): Free all memory allocated by a
  * QNum object
-- 
2.28.0


