Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6992DEE79
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 12:17:55 +0100 (CET)
Received: from localhost ([::1]:50058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqaFG-00085R-LY
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 06:17:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtx-00056s-Gm
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtl-0007HY-Me
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608375340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lRD6uFJd0VXDs5x/i8afxBfXsoy7XklAaqM9TAjeGkY=;
 b=i0UJOXsi7taleHNQPgk5UhLduQ4ylTbc0kAwGKheXKF2307TxiKZze4E0tucLtb+Wtcx8g
 0zDQJYChhSALtF6tpv/92lq4jrh7uGvpRS6vviTrVOjxL6S5+C5JR+1eNiyzjiPjTt95Tp
 pWbz9fSN+jRjc++cFAe6RfJrlQJSKP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-fgwB4SEKO06No4mVhHnI9g-1; Sat, 19 Dec 2020 05:55:38 -0500
X-MC-Unique: fgwB4SEKO06No4mVhHnI9g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2912451E4;
 Sat, 19 Dec 2020 10:55:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAE546E51F;
 Sat, 19 Dec 2020 10:55:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AA92B11268B3; Sat, 19 Dec 2020 11:55:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/33] qobject: Move internals to qobject-internal.h
Date: Sat, 19 Dec 2020 11:55:20 +0100
Message-Id: <20201219105532.1734134-22-armbru@redhat.com>
In-Reply-To: <20201219105532.1734134-1-armbru@redhat.com>
References: <20201219105532.1734134-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201211171152.146877-9-armbru@redhat.com>
---
 include/qapi/qmp/qbool.h   |  2 --
 include/qapi/qmp/qdict.h   |  2 --
 include/qapi/qmp/qlist.h   |  2 --
 include/qapi/qmp/qnull.h   |  2 --
 include/qapi/qmp/qnum.h    |  3 ---
 include/qapi/qmp/qobject.h |  9 +--------
 include/qapi/qmp/qstring.h |  2 --
 qobject/qobject-internal.h | 39 ++++++++++++++++++++++++++++++++++++++
 qobject/qbool.c            |  1 +
 qobject/qdict.c            |  1 +
 qobject/qlist.c            |  1 +
 qobject/qnull.c            |  1 +
 qobject/qnum.c             |  1 +
 qobject/qobject.c          |  1 +
 qobject/qstring.c          |  1 +
 15 files changed, 47 insertions(+), 21 deletions(-)
 create mode 100644 qobject/qobject-internal.h

diff --git a/include/qapi/qmp/qbool.h b/include/qapi/qmp/qbool.h
index 5f61e38e64..2f888d1057 100644
--- a/include/qapi/qmp/qbool.h
+++ b/include/qapi/qmp/qbool.h
@@ -23,7 +23,5 @@ struct QBool {
 
 QBool *qbool_from_bool(bool value);
 bool qbool_get_bool(const QBool *qb);
-bool qbool_is_equal(const QObject *x, const QObject *y);
-void qbool_destroy_obj(QObject *obj);
 
 #endif /* QBOOL_H */
diff --git a/include/qapi/qmp/qdict.h b/include/qapi/qmp/qdict.h
index da942347a7..9934539c1b 100644
--- a/include/qapi/qmp/qdict.h
+++ b/include/qapi/qmp/qdict.h
@@ -39,10 +39,8 @@ void qdict_put_obj(QDict *qdict, const char *key, QObject *value);
 void qdict_del(QDict *qdict, const char *key);
 int qdict_haskey(const QDict *qdict, const char *key);
 QObject *qdict_get(const QDict *qdict, const char *key);
-bool qdict_is_equal(const QObject *x, const QObject *y);
 const QDictEntry *qdict_first(const QDict *qdict);
 const QDictEntry *qdict_next(const QDict *qdict, const QDictEntry *entry);
-void qdict_destroy_obj(QObject *obj);
 
 /* Helper to qdict_put_obj(), accepts any object */
 #define qdict_put(qdict, key, obj) \
diff --git a/include/qapi/qmp/qlist.h b/include/qapi/qmp/qlist.h
index 595b7943e1..06e98ad5f4 100644
--- a/include/qapi/qmp/qlist.h
+++ b/include/qapi/qmp/qlist.h
@@ -51,8 +51,6 @@ QObject *qlist_pop(QList *qlist);
 QObject *qlist_peek(QList *qlist);
 int qlist_empty(const QList *qlist);
 size_t qlist_size(const QList *qlist);
-bool qlist_is_equal(const QObject *x, const QObject *y);
-void qlist_destroy_obj(QObject *obj);
 
 static inline const QListEntry *qlist_first(const QList *qlist)
 {
diff --git a/include/qapi/qmp/qnull.h b/include/qapi/qmp/qnull.h
index c1426882c5..e84ecceedb 100644
--- a/include/qapi/qmp/qnull.h
+++ b/include/qapi/qmp/qnull.h
@@ -26,6 +26,4 @@ static inline QNull *qnull(void)
     return qobject_ref(&qnull_);
 }
 
-bool qnull_is_equal(const QObject *x, const QObject *y);
-
 #endif /* QNULL_H */
diff --git a/include/qapi/qmp/qnum.h b/include/qapi/qmp/qnum.h
index bbae0a5ec8..7f84e20bfb 100644
--- a/include/qapi/qmp/qnum.h
+++ b/include/qapi/qmp/qnum.h
@@ -68,7 +68,4 @@ double qnum_get_double(QNum *qn);
 
 char *qnum_to_string(QNum *qn);
 
-bool qnum_is_equal(const QObject *x, const QObject *y);
-void qnum_destroy_obj(QObject *obj);
-
 #endif /* QNUM_H */
diff --git a/include/qapi/qmp/qobject.h b/include/qapi/qmp/qobject.h
index fcfd549220..9003b71fd3 100644
--- a/include/qapi/qmp/qobject.h
+++ b/include/qapi/qmp/qobject.h
@@ -64,14 +64,6 @@ QEMU_BUILD_BUG_MSG(QTYPE__MAX != 7,
 #define qobject_to(type, obj)                                       \
     ((type *)qobject_check_type(obj, glue(QTYPE_CAST_TO_, type)))
 
-/* Initialize an object to default values */
-static inline void qobject_init(QObject *obj, QType type)
-{
-    assert(QTYPE_NONE < type && type < QTYPE__MAX);
-    obj->base.refcnt = 1;
-    obj->base.type = type;
-}
-
 static inline void qobject_ref_impl(QObject *obj)
 {
     if (obj) {
@@ -90,6 +82,7 @@ bool qobject_is_equal(const QObject *x, const QObject *y);
 
 /**
  * qobject_destroy(): Free resources used by the object
+ * For use via qobject_unref() only!
  */
 void qobject_destroy(QObject *obj);
 
diff --git a/include/qapi/qmp/qstring.h b/include/qapi/qmp/qstring.h
index ae5b4b44d2..e4ac761a22 100644
--- a/include/qapi/qmp/qstring.h
+++ b/include/qapi/qmp/qstring.h
@@ -33,7 +33,5 @@ const char *qobject_get_try_str(const QObject *qstring);
 void qstring_append_int(QString *qstring, int64_t value);
 void qstring_append(QString *qstring, const char *str);
 void qstring_append_chr(QString *qstring, int c);
-bool qstring_is_equal(const QObject *x, const QObject *y);
-void qstring_destroy_obj(QObject *obj);
 
 #endif /* QSTRING_H */
diff --git a/qobject/qobject-internal.h b/qobject/qobject-internal.h
new file mode 100644
index 0000000000..b310c8e1b5
--- /dev/null
+++ b/qobject/qobject-internal.h
@@ -0,0 +1,39 @@
+/*
+ * QObject internals
+ *
+ * Copyright (C) 2015 Red Hat, Inc.
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1
+ * or later.  See the COPYING.LIB file in the top-level directory.
+ */
+
+#ifndef QOBJECT_INTERNAL_H
+#define QOBJECT_INTERNAL_H
+
+#include "qapi/qmp/qobject.h"
+
+static inline void qobject_init(QObject *obj, QType type)
+{
+    assert(QTYPE_NONE < type && type < QTYPE__MAX);
+    obj->base.refcnt = 1;
+    obj->base.type = type;
+}
+
+void qbool_destroy_obj(QObject *obj);
+bool qbool_is_equal(const QObject *x, const QObject *y);
+
+void qdict_destroy_obj(QObject *obj);
+bool qdict_is_equal(const QObject *x, const QObject *y);
+
+void qlist_destroy_obj(QObject *obj);
+bool qlist_is_equal(const QObject *x, const QObject *y);
+
+bool qnull_is_equal(const QObject *x, const QObject *y);
+
+void qnum_destroy_obj(QObject *obj);
+bool qnum_is_equal(const QObject *x, const QObject *y);
+
+void qstring_destroy_obj(QObject *obj);
+bool qstring_is_equal(const QObject *x, const QObject *y);
+
+#endif
diff --git a/qobject/qbool.c b/qobject/qbool.c
index 06dfc43498..16a600abb9 100644
--- a/qobject/qbool.c
+++ b/qobject/qbool.c
@@ -13,6 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/qmp/qbool.h"
+#include "qobject-internal.h"
 
 /**
  * qbool_from_bool(): Create a new QBool from a bool
diff --git a/qobject/qdict.c b/qobject/qdict.c
index 1079bd3f6f..d84443391e 100644
--- a/qobject/qdict.c
+++ b/qobject/qdict.c
@@ -16,6 +16,7 @@
 #include "qapi/qmp/qbool.h"
 #include "qapi/qmp/qnull.h"
 #include "qapi/qmp/qstring.h"
+#include "qobject-internal.h"
 
 /**
  * qdict_new(): Create a new QDict
diff --git a/qobject/qlist.c b/qobject/qlist.c
index 1be95367d1..60562a1f52 100644
--- a/qobject/qlist.c
+++ b/qobject/qlist.c
@@ -17,6 +17,7 @@
 #include "qapi/qmp/qnum.h"
 #include "qapi/qmp/qstring.h"
 #include "qemu/queue.h"
+#include "qobject-internal.h"
 
 /**
  * qlist_new(): Create a new QList
diff --git a/qobject/qnull.c b/qobject/qnull.c
index 00870a1824..b26b368219 100644
--- a/qobject/qnull.c
+++ b/qobject/qnull.c
@@ -12,6 +12,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/qmp/qnull.h"
+#include "qobject-internal.h"
 
 QNull qnull_ = {
     .base = {
diff --git a/qobject/qnum.c b/qobject/qnum.c
index bf1240ecec..35ba41e61c 100644
--- a/qobject/qnum.c
+++ b/qobject/qnum.c
@@ -14,6 +14,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/qmp/qnum.h"
+#include "qobject-internal.h"
 
 /**
  * qnum_from_int(): Create a new QNum from an int64_t
diff --git a/qobject/qobject.c b/qobject/qobject.c
index 878dd76e79..d7077b8f2a 100644
--- a/qobject/qobject.c
+++ b/qobject/qobject.c
@@ -14,6 +14,7 @@
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qlist.h"
 #include "qapi/qmp/qstring.h"
+#include "qobject-internal.h"
 
 QEMU_BUILD_BUG_MSG(
     offsetof(QNull, base) != 0 ||
diff --git a/qobject/qstring.c b/qobject/qstring.c
index c1891beda0..d6724bd4e5 100644
--- a/qobject/qstring.c
+++ b/qobject/qstring.c
@@ -12,6 +12,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/qmp/qstring.h"
+#include "qobject-internal.h"
 
 /**
  * qstring_new(): Create a new empty QString
-- 
2.26.2


