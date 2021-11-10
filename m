Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CB844C2A3
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 14:59:31 +0100 (CET)
Received: from localhost ([::1]:59576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mko8Q-0003VX-4c
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 08:59:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mko5X-0007zq-0w
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:56:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mko5R-0006z8-9T
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:56:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636552584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=642JDHnXh9sikCr3oIZjupZS0oYsJdUzV6c14AHxO7k=;
 b=DfgGVn8POv1+c06ZcleaF7jO4nyPfJTKQA8qnuPDJ0jSTx5gBGpzlyeBmf/j97xSF0Bcgt
 QZBsrmC4bXYJb/h7Ah9+ERHHeJaFcQb8P/YQzPHIOAuAZVCN0RbqtrNOYrFDNh6lhxsUQ9
 iHsqxFLf4Qv1jUeLEVqRlbvUvyXfrg4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-bQXAnVFOPz6iLCkGhAH2qQ-1; Wed, 10 Nov 2021 08:56:23 -0500
X-MC-Unique: bQXAnVFOPz6iLCkGhAH2qQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8885619057BB;
 Wed, 10 Nov 2021 13:56:22 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 280F760843;
 Wed, 10 Nov 2021 13:56:19 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] qdict: make available dump_qobject(), dump_qdict(),
 dump_qlist()
Date: Wed, 10 Nov 2021 14:56:14 +0100
Message-Id: <20211110135616.1188725-2-lvivier@redhat.com>
In-Reply-To: <20211110135616.1188725-1-lvivier@redhat.com>
References: <20211110135616.1188725-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

move them from block/qapi.c to qobject/qdict.c, qobject/qlist.c,
qobject/qobject.c

This is useful to debug qobjects

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 block/qapi.c               | 82 +-------------------------------------
 include/qapi/qmp/qdict.h   |  2 +
 include/qapi/qmp/qlist.h   |  1 +
 include/qapi/qmp/qobject.h |  1 +
 qobject/qdict.c            | 25 ++++++++++++
 qobject/qlist.c            | 17 ++++++++
 qobject/qobject.c          | 35 ++++++++++++++++
 7 files changed, 82 insertions(+), 81 deletions(-)

diff --git a/block/qapi.c b/block/qapi.c
index cf557e3aea7c..26bbc45a67f5 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -697,86 +697,6 @@ void bdrv_snapshot_dump(QEMUSnapshotInfo *sn)
     g_free(sizing);
 }
 
-static void dump_qdict(int indentation, QDict *dict);
-static void dump_qlist(int indentation, QList *list);
-
-static void dump_qobject(int comp_indent, QObject *obj)
-{
-    switch (qobject_type(obj)) {
-        case QTYPE_QNUM: {
-            QNum *value = qobject_to(QNum, obj);
-            char *tmp = qnum_to_string(value);
-            qemu_printf("%s", tmp);
-            g_free(tmp);
-            break;
-        }
-        case QTYPE_QSTRING: {
-            QString *value = qobject_to(QString, obj);
-            qemu_printf("%s", qstring_get_str(value));
-            break;
-        }
-        case QTYPE_QDICT: {
-            QDict *value = qobject_to(QDict, obj);
-            dump_qdict(comp_indent, value);
-            break;
-        }
-        case QTYPE_QLIST: {
-            QList *value = qobject_to(QList, obj);
-            dump_qlist(comp_indent, value);
-            break;
-        }
-        case QTYPE_QBOOL: {
-            QBool *value = qobject_to(QBool, obj);
-            qemu_printf("%s", qbool_get_bool(value) ? "true" : "false");
-            break;
-        }
-        default:
-            abort();
-    }
-}
-
-static void dump_qlist(int indentation, QList *list)
-{
-    const QListEntry *entry;
-    int i = 0;
-
-    for (entry = qlist_first(list); entry; entry = qlist_next(entry), i++) {
-        QType type = qobject_type(entry->value);
-        bool composite = (type == QTYPE_QDICT || type == QTYPE_QLIST);
-        qemu_printf("%*s[%i]:%c", indentation * 4, "", i,
-                    composite ? '\n' : ' ');
-        dump_qobject(indentation + 1, entry->value);
-        if (!composite) {
-            qemu_printf("\n");
-        }
-    }
-}
-
-static void dump_qdict(int indentation, QDict *dict)
-{
-    const QDictEntry *entry;
-
-    for (entry = qdict_first(dict); entry; entry = qdict_next(dict, entry)) {
-        QType type = qobject_type(entry->value);
-        bool composite = (type == QTYPE_QDICT || type == QTYPE_QLIST);
-        char *key = g_malloc(strlen(entry->key) + 1);
-        int i;
-
-        /* replace dashes with spaces in key (variable) names */
-        for (i = 0; entry->key[i]; i++) {
-            key[i] = entry->key[i] == '-' ? ' ' : entry->key[i];
-        }
-        key[i] = 0;
-        qemu_printf("%*s%s:%c", indentation * 4, "", key,
-                    composite ? '\n' : ' ');
-        dump_qobject(indentation + 1, entry->value);
-        if (!composite) {
-            qemu_printf("\n");
-        }
-        g_free(key);
-    }
-}
-
 void bdrv_image_info_specific_dump(ImageInfoSpecific *info_spec)
 {
     QObject *obj, *data;
@@ -785,7 +705,7 @@ void bdrv_image_info_specific_dump(ImageInfoSpecific *info_spec)
     visit_type_ImageInfoSpecific(v, NULL, &info_spec, &error_abort);
     visit_complete(v, &obj);
     data = qdict_get(qobject_to(QDict, obj), "data");
-    dump_qobject(1, data);
+    dump_qobject(1, data, qemu_printf);
     qobject_unref(obj);
     visit_free(v);
 }
diff --git a/include/qapi/qmp/qdict.h b/include/qapi/qmp/qdict.h
index d5b5430e21a9..e529a9a9a29c 100644
--- a/include/qapi/qmp/qdict.h
+++ b/include/qapi/qmp/qdict.h
@@ -67,4 +67,6 @@ QDict *qdict_clone_shallow(const QDict *src);
 QObject *qdict_crumple(const QDict *src, Error **errp);
 void qdict_flatten(QDict *qdict);
 
+void dump_qdict(int indentation, QDict *dict, int (*qemu_printf)(const char *fmt, ...));
+
 #endif /* QDICT_H */
diff --git a/include/qapi/qmp/qlist.h b/include/qapi/qmp/qlist.h
index 06e98ad5f498..4af55d82d3e4 100644
--- a/include/qapi/qmp/qlist.h
+++ b/include/qapi/qmp/qlist.h
@@ -62,4 +62,5 @@ static inline const QListEntry *qlist_next(const QListEntry *entry)
     return QTAILQ_NEXT(entry, next);
 }
 
+void dump_qlist(int indentation, QList *list, int (*qemu_printf)(const char *fmt, ...));
 #endif /* QLIST_H */
diff --git a/include/qapi/qmp/qobject.h b/include/qapi/qmp/qobject.h
index 9003b71fd32d..bf893b146217 100644
--- a/include/qapi/qmp/qobject.h
+++ b/include/qapi/qmp/qobject.h
@@ -135,4 +135,5 @@ static inline QObject *qobject_check_type(const QObject *obj, QType type)
     }
 }
 
+void dump_qobject(int comp_indent, QObject *obj, int (*qemu_printf)(const char *fmt, ...));
 #endif /* QOBJECT_H */
diff --git a/qobject/qdict.c b/qobject/qdict.c
index 0216ca7ac168..c09d98710c6d 100644
--- a/qobject/qdict.c
+++ b/qobject/qdict.c
@@ -442,3 +442,28 @@ void qdict_destroy_obj(QObject *obj)
 
     g_free(qdict);
 }
+
+void dump_qdict(int indentation, QDict *dict, int (*qemu_printf)(const char *fmt, ...))
+{
+    const QDictEntry *entry;
+
+    for (entry = qdict_first(dict); entry; entry = qdict_next(dict, entry)) {
+        QType type = qobject_type(entry->value);
+        bool composite = (type == QTYPE_QDICT || type == QTYPE_QLIST);
+        char *key = g_malloc(strlen(entry->key) + 1);
+        int i;
+
+        /* replace dashes with spaces in key (variable) names */
+        for (i = 0; entry->key[i]; i++) {
+            key[i] = entry->key[i] == '-' ? ' ' : entry->key[i];
+        }
+        key[i] = 0;
+        qemu_printf("%*s%s:%c", indentation * 4, "", key,
+                    composite ? '\n' : ' ');
+        dump_qobject(indentation + 1, entry->value, qemu_printf);
+        if (!composite) {
+            qemu_printf("\n");
+        }
+        g_free(key);
+    }
+}
diff --git a/qobject/qlist.c b/qobject/qlist.c
index 60562a1f5269..d32bd7f08925 100644
--- a/qobject/qlist.c
+++ b/qobject/qlist.c
@@ -182,3 +182,20 @@ void qlist_destroy_obj(QObject *obj)
 
     g_free(qlist);
 }
+
+void dump_qlist(int indentation, QList *list, int (*qemu_printf)(const char *fmt, ...))
+{
+    const QListEntry *entry;
+    int i = 0;
+
+    for (entry = qlist_first(list); entry; entry = qlist_next(entry), i++) {
+        QType type = qobject_type(entry->value);
+        bool composite = (type == QTYPE_QDICT || type == QTYPE_QLIST);
+        qemu_printf("%*s[%i]:%c", indentation * 4, "", i,
+                    composite ? '\n' : ' ');
+        dump_qobject(indentation + 1, entry->value, qemu_printf);
+        if (!composite) {
+            qemu_printf("\n");
+        }
+    }
+}
diff --git a/qobject/qobject.c b/qobject/qobject.c
index d7077b8f2a9d..01a3524db42f 100644
--- a/qobject/qobject.c
+++ b/qobject/qobject.c
@@ -70,3 +70,38 @@ bool qobject_is_equal(const QObject *x, const QObject *y)
 
     return qis_equal[x->base.type](x, y);
 }
+
+void dump_qobject(int comp_indent, QObject *obj, int (*qemu_printf)(const char *fmt, ...))
+{
+    switch (qobject_type(obj)) {
+        case QTYPE_QNUM: {
+            QNum *value = qobject_to(QNum, obj);
+            char *tmp = qnum_to_string(value);
+            qemu_printf("%s", tmp);
+            g_free(tmp);
+            break;
+        }
+        case QTYPE_QSTRING: {
+            QString *value = qobject_to(QString, obj);
+            qemu_printf("%s", qstring_get_str(value));
+            break;
+        }
+        case QTYPE_QDICT: {
+            QDict *value = qobject_to(QDict, obj);
+            dump_qdict(comp_indent, value, qemu_printf);
+            break;
+        }
+        case QTYPE_QLIST: {
+            QList *value = qobject_to(QList, obj);
+            dump_qlist(comp_indent, value, qemu_printf);
+            break;
+        }
+        case QTYPE_QBOOL: {
+            QBool *value = qobject_to(QBool, obj);
+            qemu_printf("%s", qbool_get_bool(value) ? "true" : "false");
+            break;
+        }
+        default:
+            abort();
+    }
+}
-- 
2.31.1


