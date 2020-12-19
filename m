Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213642DEE6E
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 12:10:17 +0100 (CET)
Received: from localhost ([::1]:56434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqa7o-0007FQ-GE
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 06:10:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtt-0004t4-B4
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtl-0007H6-D4
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608375340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zRXFFeI5pV1pyhLSA6cKFOOfp52+WoAm8StU4ehr1+4=;
 b=PBIMLWbrMYjpO87tn+M1XZJPfYpcWp/0aLfbbhyaBBFa6kiyelQen8vpy5oZRH1tguQYrA
 6SxQ+UwKhORAV+6ld9UfFIH62hehCvtzvqAoGiiPMTFa9/yPio4+iEWjcTiN5s/SK/X5n2
 bGVuJ4VXVW4H2uMNQSzHpXjQIfLe4MY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-d0avpLmKONOaG64Jxg0rqw-1; Sat, 19 Dec 2020 05:55:38 -0500
X-MC-Unique: d0avpLmKONOaG64Jxg0rqw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63B8651E6;
 Sat, 19 Dec 2020 10:55:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF31360C62;
 Sat, 19 Dec 2020 10:55:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CCA401125649; Sat, 19 Dec 2020 11:55:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/33] qobject: Factor JSON writer out of qobject_to_json()
Date: Sat, 19 Dec 2020 11:55:27 +0100
Message-Id: <20201219105532.1734134-29-armbru@redhat.com>
In-Reply-To: <20201219105532.1734134-1-armbru@redhat.com>
References: <20201219105532.1734134-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

We have two JSON writers written in C: qobject/qjson.c provides
qobject_to_json(), and migration/qjson.c provides a more low level
imperative interface.  They don't share code.  The latter tacitly
limits numbers to int64_t, and strings contents to characters that
don't need escaping.

Factor out qobject_to_json()'s JSON writer as qobject/json-writer.c.
Straightforward, except for numbers: since the writer is to be
independent of QObject, it can't use qnum_to_string().  Open-code it
instead.  This is actually an improvement of sorts, because it
liberates qnum_to_string() from JSON's needs: its JSON-related FIXMEs
move to the JSON writer, where they belong.

The next commit will replace migration/qjson.c.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201211171152.146877-16-armbru@redhat.com>
---
 include/qapi/qmp/json-writer.h |  37 +++++
 qobject/json-writer.c          | 247 +++++++++++++++++++++++++++++++++
 qobject/qjson.c                | 125 +++++------------
 qobject/qnum.c                 |   5 -
 qobject/meson.build            |   5 +-
 5 files changed, 318 insertions(+), 101 deletions(-)
 create mode 100644 include/qapi/qmp/json-writer.h
 create mode 100644 qobject/json-writer.c

diff --git a/include/qapi/qmp/json-writer.h b/include/qapi/qmp/json-writer.h
new file mode 100644
index 0000000000..708d129018
--- /dev/null
+++ b/include/qapi/qmp/json-writer.h
@@ -0,0 +1,37 @@
+/*
+ * JSON Writer
+ *
+ * Copyright (c) 2020 Red Hat Inc.
+ *
+ * Authors:
+ *  Markus Armbruster <armbru@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
+ * See the COPYING.LIB file in the top-level directory.
+ *
+ */
+
+#ifndef JSON_WRITER_H
+#define JSON_WRITER_H
+
+typedef struct JSONWriter JSONWriter;
+
+JSONWriter *json_writer_new(bool pretty);
+const char *json_writer_get(JSONWriter *);
+GString *json_writer_get_and_free(JSONWriter *);
+void json_writer_free(JSONWriter *);
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(JSONWriter, json_writer_free)
+
+void json_writer_start_object(JSONWriter *, const char *name);
+void json_writer_end_object(JSONWriter *);
+void json_writer_start_array(JSONWriter *, const char *name);
+void json_writer_end_array(JSONWriter *);
+void json_writer_bool(JSONWriter *, const char *name, bool val);
+void json_writer_null(JSONWriter *, const char *name);
+void json_writer_int64(JSONWriter *, const char *name, int64_t val);
+void json_writer_uint64(JSONWriter *, const char *name, uint64_t val);
+void json_writer_double(JSONWriter *, const char *name, double val);
+void json_writer_str(JSONWriter *, const char *name, const char *str);
+
+#endif
diff --git a/qobject/json-writer.c b/qobject/json-writer.c
new file mode 100644
index 0000000000..309a31d57a
--- /dev/null
+++ b/qobject/json-writer.c
@@ -0,0 +1,247 @@
+/*
+ * JSON Writer
+ *
+ * Copyright IBM, Corp. 2009
+ * Copyright (c) 2010-2020 Red Hat Inc.
+ *
+ * Authors:
+ *  Anthony Liguori   <aliguori@us.ibm.com>
+ *  Markus Armbruster <armbru@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
+ * See the COPYING.LIB file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/qmp/json-writer.h"
+#include "qemu/unicode.h"
+
+struct JSONWriter {
+    bool pretty;
+    bool need_comma;
+    GString *contents;
+    GByteArray *container_is_array;
+};
+
+JSONWriter *json_writer_new(bool pretty)
+{
+    JSONWriter *writer = g_new(JSONWriter, 1);
+
+    writer->pretty = pretty;
+    writer->need_comma = false;
+    writer->contents = g_string_new(NULL);
+    writer->container_is_array = g_byte_array_new();
+    return writer;
+}
+
+const char *json_writer_get(JSONWriter *writer)
+{
+    g_assert(!writer->container_is_array->len);
+    return writer->contents->str;
+}
+
+GString *json_writer_get_and_free(JSONWriter *writer)
+{
+    GString *contents = writer->contents;
+
+    writer->contents = NULL;
+    g_byte_array_free(writer->container_is_array, true);
+    g_free(writer);
+    return contents;
+}
+
+void json_writer_free(JSONWriter *writer)
+{
+    if (writer) {
+        g_string_free(json_writer_get_and_free(writer), true);
+    }
+}
+
+static void enter_container(JSONWriter *writer, bool is_array)
+{
+    unsigned depth = writer->container_is_array->len;
+
+    g_byte_array_set_size(writer->container_is_array, depth + 1);
+    writer->container_is_array->data[depth] = is_array;
+    writer->need_comma = false;
+}
+
+static void leave_container(JSONWriter *writer, bool is_array)
+{
+    unsigned depth = writer->container_is_array->len;
+
+    assert(depth);
+    assert(writer->container_is_array->data[depth - 1] == is_array);
+    g_byte_array_set_size(writer->container_is_array, depth - 1);
+    writer->need_comma = true;
+}
+
+static bool in_object(JSONWriter *writer)
+{
+    unsigned depth = writer->container_is_array->len;
+
+    return depth && !writer->container_is_array->data[depth - 1];
+}
+
+static void pretty_newline(JSONWriter *writer)
+{
+    if (writer->pretty) {
+        g_string_append_printf(writer->contents, "\n%*s",
+                               writer->container_is_array->len * 4, "");
+    }
+}
+
+static void pretty_newline_or_space(JSONWriter *writer)
+{
+    if (writer->pretty) {
+        g_string_append_printf(writer->contents, "\n%*s",
+                               writer->container_is_array->len * 4, "");
+    } else {
+        g_string_append_c(writer->contents, ' ');
+    }
+}
+
+static void quoted_str(JSONWriter *writer, const char *str)
+{
+    const char *ptr;
+    char *end;
+    int cp;
+
+    g_string_append_c(writer->contents, '"');
+
+    for (ptr = str; *ptr; ptr = end) {
+        cp = mod_utf8_codepoint(ptr, 6, &end);
+        switch (cp) {
+        case '\"':
+            g_string_append(writer->contents, "\\\"");
+            break;
+        case '\\':
+            g_string_append(writer->contents, "\\\\");
+            break;
+        case '\b':
+            g_string_append(writer->contents, "\\b");
+            break;
+        case '\f':
+            g_string_append(writer->contents, "\\f");
+            break;
+        case '\n':
+            g_string_append(writer->contents, "\\n");
+            break;
+        case '\r':
+            g_string_append(writer->contents, "\\r");
+            break;
+        case '\t':
+            g_string_append(writer->contents, "\\t");
+            break;
+        default:
+            if (cp < 0) {
+                cp = 0xFFFD; /* replacement character */
+            }
+            if (cp > 0xFFFF) {
+                /* beyond BMP; need a surrogate pair */
+                g_string_append_printf(writer->contents, "\\u%04X\\u%04X",
+                                       0xD800 + ((cp - 0x10000) >> 10),
+                                       0xDC00 + ((cp - 0x10000) & 0x3FF));
+            } else if (cp < 0x20 || cp >= 0x7F) {
+                g_string_append_printf(writer->contents, "\\u%04X", cp);
+            } else {
+                g_string_append_c(writer->contents, cp);
+            }
+        }
+    };
+
+    g_string_append_c(writer->contents, '"');
+}
+
+static void maybe_comma_name(JSONWriter *writer, const char *name)
+{
+    if (writer->need_comma) {
+        g_string_append_c(writer->contents, ',');
+        pretty_newline_or_space(writer);
+    } else {
+        if (writer->contents->len) {
+            pretty_newline(writer);
+        }
+        writer->need_comma = true;
+    }
+
+    if (in_object(writer)) {
+        quoted_str(writer, name);
+        g_string_append(writer->contents, ": ");
+    }
+}
+
+void json_writer_start_object(JSONWriter *writer, const char *name)
+{
+    maybe_comma_name(writer, name);
+    g_string_append_c(writer->contents, '{');
+    enter_container(writer, false);
+}
+
+void json_writer_end_object(JSONWriter *writer)
+{
+    leave_container(writer, false);
+    pretty_newline(writer);
+    g_string_append_c(writer->contents, '}');
+}
+
+void json_writer_start_array(JSONWriter *writer, const char *name)
+{
+    maybe_comma_name(writer, name);
+    g_string_append_c(writer->contents, '[');
+    enter_container(writer, true);
+}
+
+void json_writer_end_array(JSONWriter *writer)
+{
+    leave_container(writer, true);
+    pretty_newline(writer);
+    g_string_append_c(writer->contents, ']');
+}
+
+void json_writer_bool(JSONWriter *writer, const char *name, bool val)
+{
+    maybe_comma_name(writer, name);
+    g_string_append(writer->contents, val ? "true" : "false");
+}
+
+void json_writer_null(JSONWriter *writer, const char *name)
+{
+    maybe_comma_name(writer, name);
+    g_string_append(writer->contents, "null");
+}
+
+void json_writer_int64(JSONWriter *writer, const char *name, int64_t val)
+{
+    maybe_comma_name(writer, name);
+    g_string_append_printf(writer->contents, "%" PRId64, val);
+}
+
+void json_writer_uint64(JSONWriter *writer, const char *name, uint64_t val)
+{
+    maybe_comma_name(writer, name);
+    g_string_append_printf(writer->contents, "%" PRIu64, val);
+}
+
+void json_writer_double(JSONWriter *writer, const char *name, double val)
+{
+    maybe_comma_name(writer, name);
+
+    /*
+     * FIXME: g_string_append_printf() is locale dependent; but JSON
+     * requires numbers to be formatted as if in the C locale.
+     * Dependence on C locale is a pervasive issue in QEMU.
+     */
+    /*
+     * FIXME: This risks printing Inf or NaN, which are not valid
+     * JSON values.
+     */
+    g_string_append_printf(writer->contents, "%.17g", val);
+}
+
+void json_writer_str(JSONWriter *writer, const char *name, const char *str)
+{
+    maybe_comma_name(writer, name);
+    quoted_str(writer, str);
+}
diff --git a/qobject/qjson.c b/qobject/qjson.c
index 962214f5a7..bcc376e626 100644
--- a/qobject/qjson.c
+++ b/qobject/qjson.c
@@ -14,13 +14,13 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qapi/qmp/json-parser.h"
+#include "qapi/qmp/json-writer.h"
 #include "qapi/qmp/qjson.h"
 #include "qapi/qmp/qbool.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qlist.h"
 #include "qapi/qmp/qnum.h"
 #include "qapi/qmp/qstring.h"
-#include "qemu/unicode.h"
 
 typedef struct JSONParsingState
 {
@@ -149,132 +149,69 @@ QDict *qdict_from_jsonf_nofail(const char *string, ...)
     return qdict;
 }
 
-static void json_pretty_newline(GString *accu, bool pretty, int indent)
-{
-    if (pretty) {
-        g_string_append_printf(accu, "\n%*s", indent * 4, "");
-    }
-}
-
-static void quoted_str(const char *str, GString *accu)
-{
-    const char *ptr;
-    int cp;
-    char *end;
-
-    g_string_append_c(accu, '"');
-
-    for (ptr = str; *ptr; ptr = end) {
-        cp = mod_utf8_codepoint(ptr, 6, &end);
-        switch (cp) {
-        case '\"':
-            g_string_append(accu, "\\\"");
-            break;
-        case '\\':
-            g_string_append(accu, "\\\\");
-            break;
-        case '\b':
-            g_string_append(accu, "\\b");
-            break;
-        case '\f':
-            g_string_append(accu, "\\f");
-            break;
-        case '\n':
-            g_string_append(accu, "\\n");
-            break;
-        case '\r':
-            g_string_append(accu, "\\r");
-            break;
-        case '\t':
-            g_string_append(accu, "\\t");
-            break;
-        default:
-            if (cp < 0) {
-                cp = 0xFFFD; /* replacement character */
-            }
-            if (cp > 0xFFFF) {
-                /* beyond BMP; need a surrogate pair */
-                g_string_append_printf(accu, "\\u%04X\\u%04X",
-                                       0xD800 + ((cp - 0x10000) >> 10),
-                                       0xDC00 + ((cp - 0x10000) & 0x3FF));
-            } else if (cp < 0x20 || cp >= 0x7F) {
-                g_string_append_printf(accu, "\\u%04X", cp);
-            } else {
-                g_string_append_c(accu, cp);
-            }
-        }
-    };
-
-    g_string_append_c(accu, '"');
-}
-
-static void to_json(const QObject *obj, GString *accu, bool pretty, int indent)
+static void to_json(JSONWriter *writer, const char *name,
+                    const QObject *obj)
 {
     switch (qobject_type(obj)) {
     case QTYPE_QNULL:
-        g_string_append(accu, "null");
+        json_writer_null(writer, name);
         break;
     case QTYPE_QNUM: {
         QNum *val = qobject_to(QNum, obj);
-        char *buffer = qnum_to_string(val);
-        g_string_append(accu, buffer);
-        g_free(buffer);
+
+        switch (val->kind) {
+        case QNUM_I64:
+            json_writer_int64(writer, name, val->u.i64);
+            break;
+        case QNUM_U64:
+            json_writer_uint64(writer, name, val->u.u64);
+            break;
+        case QNUM_DOUBLE:
+            json_writer_double(writer, name, val->u.dbl);
+            break;
+        default:
+            abort();
+        }
         break;
     }
     case QTYPE_QSTRING: {
-        quoted_str(qstring_get_str(qobject_to(QString, obj)), accu);
+        QString *val = qobject_to(QString, obj);
+
+        json_writer_str(writer, name, qstring_get_str(val));
         break;
     }
     case QTYPE_QDICT: {
         QDict *val = qobject_to(QDict, obj);
-        const char *comma = pretty ? "," : ", ";
-        const char *sep = "";
         const QDictEntry *entry;
 
-        g_string_append_c(accu, '{');
+        json_writer_start_object(writer, name);
 
         for (entry = qdict_first(val);
              entry;
              entry = qdict_next(val, entry)) {
-            g_string_append(accu, sep);
-            json_pretty_newline(accu, pretty, indent + 1);
-            quoted_str(qdict_entry_key(entry), accu);
-            g_string_append(accu, ": ");
-            to_json(qdict_entry_value(entry), accu, pretty, indent + 1);
-            sep = comma;
+            to_json(writer, qdict_entry_key(entry), qdict_entry_value(entry));
         }
 
-        json_pretty_newline(accu, pretty, indent);
-        g_string_append_c(accu, '}');
+        json_writer_end_object(writer);
         break;
     }
     case QTYPE_QLIST: {
         QList *val = qobject_to(QList, obj);
-        const char *comma = pretty ? "," : ", ";
-        const char *sep = "";
         QListEntry *entry;
 
-        g_string_append_c(accu, '[');
+        json_writer_start_array(writer, name);
 
         QLIST_FOREACH_ENTRY(val, entry) {
-            g_string_append(accu, sep);
-            json_pretty_newline(accu, pretty, indent + 1);
-            to_json(qlist_entry_obj(entry), accu, pretty, indent + 1);
-            sep = comma;
+            to_json(writer, NULL, qlist_entry_obj(entry));
         }
 
-        json_pretty_newline(accu, pretty, indent);
-        g_string_append_c(accu, ']');
+        json_writer_end_array(writer);
         break;
     }
     case QTYPE_QBOOL: {
         QBool *val = qobject_to(QBool, obj);
 
-        if (qbool_get_bool(val)) {
-            g_string_append(accu, "true");
-        } else {
-            g_string_append(accu, "false");
-        }
+        json_writer_bool(writer, name, qbool_get_bool(val));
         break;
     }
     default:
@@ -284,10 +221,10 @@ static void to_json(const QObject *obj, GString *accu, bool pretty, int indent)
 
 GString *qobject_to_json_pretty(const QObject *obj, bool pretty)
 {
-    GString *accu = g_string_new(NULL);
+    JSONWriter *writer = json_writer_new(pretty);
 
-    to_json(obj, accu, pretty, 0);
-    return accu;
+    to_json(writer, NULL, obj);
+    return json_writer_get_and_free(writer);
 }
 
 GString *qobject_to_json(const QObject *obj)
diff --git a/qobject/qnum.c b/qobject/qnum.c
index 35ba41e61c..5dd66938dd 100644
--- a/qobject/qnum.c
+++ b/qobject/qnum.c
@@ -168,11 +168,6 @@ char *qnum_to_string(QNum *qn)
     case QNUM_U64:
         return g_strdup_printf("%" PRIu64, qn->u.u64);
     case QNUM_DOUBLE:
-        /* FIXME: g_strdup_printf() is locale dependent; but JSON requires
-         * numbers to be formatted as if in the C locale. Dependence
-         * on C locale is a pervasive issue in QEMU. */
-        /* FIXME: This risks printing Inf or NaN, which are not valid
-         * JSON values. */
         /* 17 digits suffice for IEEE double */
         return g_strdup_printf("%.17g", qn->u.dbl);
     }
diff --git a/qobject/meson.build b/qobject/meson.build
index bb63c06b63..4683a852a2 100644
--- a/qobject/meson.build
+++ b/qobject/meson.build
@@ -1,3 +1,4 @@
-util_ss.add(files('qnull.c', 'qnum.c', 'qstring.c', 'qdict.c', 'qlist.c', 'qbool.c',
-  'qlit.c', 'qjson.c', 'qobject.c', 'json-lexer.c', 'json-streamer.c', 'json-parser.c',
+util_ss.add(files('qnull.c', 'qnum.c', 'qstring.c', 'qdict.c',
+  'qlist.c', 'qbool.c', 'qlit.c', 'qjson.c', 'qobject.c',
+  'json-writer.c', 'json-lexer.c', 'json-streamer.c', 'json-parser.c',
   'block-qdict.c'))
-- 
2.26.2


