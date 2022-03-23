Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663CB4E561A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:10:52 +0100 (CET)
Received: from localhost ([::1]:36614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX3ZT-0006AD-GD
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:10:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3OP-000421-Ru
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 11:59:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3OO-0004tu-8H
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 11:59:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648051163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lv/XVA0HM0Ke8tNM31mqsj8fu6Wq2HzcEz6kqkgzAv4=;
 b=XA56F8+0+syLN4qHskNzjuCqPCgfaKZk/aDTwhSgUgHbzLb2Zt/1aESpfNHf99G84Gzdn1
 sR9D8TV0yd4MhilKAracLFF97uTJBMk6mFxOEo1JBUB+NaJyNr0FjUslufGilO7RcaTp4N
 Iw4II5gBZSjggxYgnX8bOdK+Su9PMtg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-0rive4STM0CpVLe6ACX8cQ-1; Wed, 23 Mar 2022 11:59:22 -0400
X-MC-Unique: 0rive4STM0CpVLe6ACX8cQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CA643C01B8B
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 15:59:22 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30EBF2026D60;
 Wed, 23 Mar 2022 15:58:59 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 09/32] include/qapi: add g_autoptr support for qobject types
Date: Wed, 23 Mar 2022 19:57:20 +0400
Message-Id: <20220323155743.1585078-10-marcandre.lureau@redhat.com>
In-Reply-To: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Need wrappers for qobject_unref() calls, which is a macro.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qapi/qmp/qbool.h   | 4 ++++
 include/qapi/qmp/qdict.h   | 4 ++++
 include/qapi/qmp/qlist.h   | 4 ++++
 include/qapi/qmp/qnull.h   | 4 ++++
 include/qapi/qmp/qnum.h    | 4 ++++
 include/qapi/qmp/qstring.h | 4 ++++
 qobject/qbool.c            | 5 +++++
 qobject/qdict.c            | 5 +++++
 qobject/qlist.c            | 5 +++++
 qobject/qnull.c            | 5 +++++
 qobject/qnum.c             | 5 +++++
 qobject/qstring.c          | 5 +++++
 12 files changed, 54 insertions(+)

diff --git a/include/qapi/qmp/qbool.h b/include/qapi/qmp/qbool.h
index 2f888d10573f..0d09726939b9 100644
--- a/include/qapi/qmp/qbool.h
+++ b/include/qapi/qmp/qbool.h
@@ -21,6 +21,10 @@ struct QBool {
     bool value;
 };
 
+void qbool_unref(QBool *q);
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(QBool, qbool_unref)
+
 QBool *qbool_from_bool(bool value);
 bool qbool_get_bool(const QBool *qb);
 
diff --git a/include/qapi/qmp/qdict.h b/include/qapi/qmp/qdict.h
index d5b5430e21a9..882d950bde89 100644
--- a/include/qapi/qmp/qdict.h
+++ b/include/qapi/qmp/qdict.h
@@ -30,6 +30,10 @@ struct QDict {
     QLIST_HEAD(,QDictEntry) table[QDICT_BUCKET_MAX];
 };
 
+void qdict_unref(QDict *q);
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(QDict, qdict_unref)
+
 /* Object API */
 QDict *qdict_new(void);
 const char *qdict_entry_key(const QDictEntry *entry);
diff --git a/include/qapi/qmp/qlist.h b/include/qapi/qmp/qlist.h
index 06e98ad5f498..e4e985d4356d 100644
--- a/include/qapi/qmp/qlist.h
+++ b/include/qapi/qmp/qlist.h
@@ -26,6 +26,10 @@ struct QList {
     QTAILQ_HEAD(,QListEntry) head;
 };
 
+void qlist_unref(QList *q);
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(QList, qlist_unref)
+
 #define qlist_append(qlist, obj) \
         qlist_append_obj(qlist, QOBJECT(obj))
 
diff --git a/include/qapi/qmp/qnull.h b/include/qapi/qmp/qnull.h
index e84ecceedbcb..7feb7c7d830d 100644
--- a/include/qapi/qmp/qnull.h
+++ b/include/qapi/qmp/qnull.h
@@ -26,4 +26,8 @@ static inline QNull *qnull(void)
     return qobject_ref(&qnull_);
 }
 
+void qnull_unref(QNull *q);
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(QNull, qnull_unref)
+
 #endif /* QNULL_H */
diff --git a/include/qapi/qmp/qnum.h b/include/qapi/qmp/qnum.h
index 7f84e20bfb2c..e86788dd2e3a 100644
--- a/include/qapi/qmp/qnum.h
+++ b/include/qapi/qmp/qnum.h
@@ -54,6 +54,10 @@ struct QNum {
     } u;
 };
 
+void qnum_unref(QNum *q);
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(QNum, qnum_unref)
+
 QNum *qnum_from_int(int64_t value);
 QNum *qnum_from_uint(uint64_t value);
 QNum *qnum_from_double(double value);
diff --git a/include/qapi/qmp/qstring.h b/include/qapi/qmp/qstring.h
index 1d8ba469368f..318d815d6a43 100644
--- a/include/qapi/qmp/qstring.h
+++ b/include/qapi/qmp/qstring.h
@@ -20,6 +20,10 @@ struct QString {
     const char *string;
 };
 
+void qstring_unref(QString *q);
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(QString, qstring_unref)
+
 QString *qstring_new(void);
 QString *qstring_from_str(const char *str);
 QString *qstring_from_substr(const char *str, size_t start, size_t end);
diff --git a/qobject/qbool.c b/qobject/qbool.c
index 16a600abb93f..c7049c0c501b 100644
--- a/qobject/qbool.c
+++ b/qobject/qbool.c
@@ -56,3 +56,8 @@ void qbool_destroy_obj(QObject *obj)
     assert(obj != NULL);
     g_free(qobject_to(QBool, obj));
 }
+
+void qbool_unref(QBool *q)
+{
+    qobject_unref(q);
+}
diff --git a/qobject/qdict.c b/qobject/qdict.c
index 0216ca7ac168..8faff230d391 100644
--- a/qobject/qdict.c
+++ b/qobject/qdict.c
@@ -442,3 +442,8 @@ void qdict_destroy_obj(QObject *obj)
 
     g_free(qdict);
 }
+
+void qdict_unref(QDict *q)
+{
+    qobject_unref(q);
+}
diff --git a/qobject/qlist.c b/qobject/qlist.c
index 60562a1f5269..356ad946b00c 100644
--- a/qobject/qlist.c
+++ b/qobject/qlist.c
@@ -182,3 +182,8 @@ void qlist_destroy_obj(QObject *obj)
 
     g_free(qlist);
 }
+
+void qlist_unref(QList *q)
+{
+    qobject_unref(q);
+}
diff --git a/qobject/qnull.c b/qobject/qnull.c
index b26b36821905..445a5db7f36f 100644
--- a/qobject/qnull.c
+++ b/qobject/qnull.c
@@ -29,3 +29,8 @@ bool qnull_is_equal(const QObject *x, const QObject *y)
 {
     return true;
 }
+
+void qnull_unref(QNull *q)
+{
+    qobject_unref(q);
+}
diff --git a/qobject/qnum.c b/qobject/qnum.c
index 5dd66938dd84..2bbeaedc7b44 100644
--- a/qobject/qnum.c
+++ b/qobject/qnum.c
@@ -239,3 +239,8 @@ void qnum_destroy_obj(QObject *obj)
     assert(obj != NULL);
     g_free(qobject_to(QNum, obj));
 }
+
+void qnum_unref(QNum *q)
+{
+    qobject_unref(q);
+}
diff --git a/qobject/qstring.c b/qobject/qstring.c
index b4613899b979..794f8c93578a 100644
--- a/qobject/qstring.c
+++ b/qobject/qstring.c
@@ -100,3 +100,8 @@ void qstring_destroy_obj(QObject *obj)
     g_free((char *)qs->string);
     g_free(qs);
 }
+
+void qstring_unref(QString *q)
+{
+    qobject_unref(q);
+}
-- 
2.35.1.273.ge6ebfd0e8cbb


