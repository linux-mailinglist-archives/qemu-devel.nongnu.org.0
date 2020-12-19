Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CD72DEE78
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 12:17:35 +0100 (CET)
Received: from localhost ([::1]:49908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqaEx-00081i-04
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 06:17:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtz-0005Du-J7
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtn-0007IQ-91
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608375342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Hs3PGoZh0v0zR7IwkDHO5aktik6Neq5GXl8cVdPi9U=;
 b=GqXJyFLsWu3OCilCp/JEZ26JVoNh1+5D3VzHTgbjcmjZ/sOObDXDsleGpWyRL/5R4MoJg5
 t4RVC2gAijKSZQHlxOsN+QUvGmj+DFe2HlAUOGkW0wQUx28wDvLocTjUXbgwiO2asWFGX+
 ZcsbLRVK0jtfPRAtCMVjxjlJGWY9XC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-9U8obTYMMh6JZO1JIh-NtQ-1; Sat, 19 Dec 2020 05:55:38 -0500
X-MC-Unique: 9U8obTYMMh6JZO1JIh-NtQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16B9A8015C6;
 Sat, 19 Dec 2020 10:55:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B63392DACE;
 Sat, 19 Dec 2020 10:55:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 967161126899; Sat, 19 Dec 2020 11:55:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/33] qobject: Use GString instead of QString to accumulate
 JSON
Date: Sat, 19 Dec 2020 11:55:16 +0100
Message-Id: <20201219105532.1734134-18-armbru@redhat.com>
In-Reply-To: <20201219105532.1734134-1-armbru@redhat.com>
References: <20201219105532.1734134-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

QString supports modifying its string, but it's quite limited: you can
only append.  The remaining callers use it for building an initial
string, never for modifying it later.

Use of GString for building the initial string is actually more
convenient here.  Change qobject_to_json() & friends to do that.

Once all such uses are replaced this way, QString can become immutable.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201211171152.146877-5-armbru@redhat.com>
---
 include/qapi/qmp/qstring.h |  1 +
 qobject/qjson.c            | 85 +++++++++++++++++---------------------
 qobject/qstring.c          | 19 +++++++++
 3 files changed, 58 insertions(+), 47 deletions(-)

diff --git a/include/qapi/qmp/qstring.h b/include/qapi/qmp/qstring.h
index e2e356e5e7..ae7698d6c7 100644
--- a/include/qapi/qmp/qstring.h
+++ b/include/qapi/qmp/qstring.h
@@ -25,6 +25,7 @@ struct QString {
 QString *qstring_new(void);
 QString *qstring_from_str(const char *str);
 QString *qstring_from_substr(const char *str, size_t start, size_t end);
+QString *qstring_from_gstring(GString *gstr);
 size_t qstring_get_length(const QString *qstring);
 const char *qstring_get_str(const QString *qstring);
 const char *qstring_get_try_str(const QString *qstring);
diff --git a/qobject/qjson.c b/qobject/qjson.c
index 523a4ab8de..e7100a539c 100644
--- a/qobject/qjson.c
+++ b/qobject/qjson.c
@@ -149,28 +149,23 @@ QDict *qdict_from_jsonf_nofail(const char *string, ...)
     return qdict;
 }
 
-static void json_pretty_newline(QString *str, bool pretty, int indent)
+static void json_pretty_newline(GString *accu, bool pretty, int indent)
 {
-    int i;
-
     if (pretty) {
-        qstring_append(str, "\n");
-        for (i = 0; i < indent; i++) {
-            qstring_append(str, "    ");
-        }
+        g_string_append_printf(accu, "\n%*s", indent * 4, "");
     }
 }
 
-static void to_json(const QObject *obj, QString *str, bool pretty, int indent)
+static void to_json(const QObject *obj, GString *accu, bool pretty, int indent)
 {
     switch (qobject_type(obj)) {
     case QTYPE_QNULL:
-        qstring_append(str, "null");
+        g_string_append(accu, "null");
         break;
     case QTYPE_QNUM: {
         QNum *val = qobject_to(QNum, obj);
         char *buffer = qnum_to_string(val);
-        qstring_append(str, buffer);
+        g_string_append(accu, buffer);
         g_free(buffer);
         break;
     }
@@ -178,35 +173,34 @@ static void to_json(const QObject *obj, QString *str, bool pretty, int indent)
         QString *val = qobject_to(QString, obj);
         const char *ptr;
         int cp;
-        char buf[16];
         char *end;
 
         ptr = qstring_get_str(val);
-        qstring_append(str, "\"");
+        g_string_append_c(accu, '"');
 
         for (; *ptr; ptr = end) {
             cp = mod_utf8_codepoint(ptr, 6, &end);
             switch (cp) {
             case '\"':
-                qstring_append(str, "\\\"");
+                g_string_append(accu, "\\\"");
                 break;
             case '\\':
-                qstring_append(str, "\\\\");
+                g_string_append(accu, "\\\\");
                 break;
             case '\b':
-                qstring_append(str, "\\b");
+                g_string_append(accu, "\\b");
                 break;
             case '\f':
-                qstring_append(str, "\\f");
+                g_string_append(accu, "\\f");
                 break;
             case '\n':
-                qstring_append(str, "\\n");
+                g_string_append(accu, "\\n");
                 break;
             case '\r':
-                qstring_append(str, "\\r");
+                g_string_append(accu, "\\r");
                 break;
             case '\t':
-                qstring_append(str, "\\t");
+                g_string_append(accu, "\\t");
                 break;
             default:
                 if (cp < 0) {
@@ -214,20 +208,18 @@ static void to_json(const QObject *obj, QString *str, bool pretty, int indent)
                 }
                 if (cp > 0xFFFF) {
                     /* beyond BMP; need a surrogate pair */
-                    snprintf(buf, sizeof(buf), "\\u%04X\\u%04X",
-                             0xD800 + ((cp - 0x10000) >> 10),
-                             0xDC00 + ((cp - 0x10000) & 0x3FF));
+                    g_string_append_printf(accu, "\\u%04X\\u%04X",
+                                           0xD800 + ((cp - 0x10000) >> 10),
+                                           0xDC00 + ((cp - 0x10000) & 0x3FF));
                 } else if (cp < 0x20 || cp >= 0x7F) {
-                    snprintf(buf, sizeof(buf), "\\u%04X", cp);
+                    g_string_append_printf(accu, "\\u%04X", cp);
                 } else {
-                    buf[0] = cp;
-                    buf[1] = 0;
+                    g_string_append_c(accu, cp);
                 }
-                qstring_append(str, buf);
             }
         };
 
-        qstring_append(str, "\"");
+        g_string_append_c(accu, '"');
         break;
     }
     case QTYPE_QDICT: {
@@ -237,25 +229,25 @@ static void to_json(const QObject *obj, QString *str, bool pretty, int indent)
         const QDictEntry *entry;
         QString *qkey;
 
-        qstring_append(str, "{");
+        g_string_append_c(accu, '{');
 
         for (entry = qdict_first(val);
              entry;
              entry = qdict_next(val, entry)) {
-            qstring_append(str, sep);
-            json_pretty_newline(str, pretty, indent + 1);
+            g_string_append(accu, sep);
+            json_pretty_newline(accu, pretty, indent + 1);
 
             qkey = qstring_from_str(qdict_entry_key(entry));
-            to_json(QOBJECT(qkey), str, pretty, indent + 1);
+            to_json(QOBJECT(qkey), accu, pretty, indent + 1);
             qobject_unref(qkey);
 
-            qstring_append(str, ": ");
-            to_json(qdict_entry_value(entry), str, pretty, indent + 1);
+            g_string_append(accu, ": ");
+            to_json(qdict_entry_value(entry), accu, pretty, indent + 1);
             sep = comma;
         }
 
-        json_pretty_newline(str, pretty, indent);
-        qstring_append(str, "}");
+        json_pretty_newline(accu, pretty, indent);
+        g_string_append_c(accu, '}');
         break;
     }
     case QTYPE_QLIST: {
@@ -264,26 +256,26 @@ static void to_json(const QObject *obj, QString *str, bool pretty, int indent)
         const char *sep = "";
         QListEntry *entry;
 
-        qstring_append(str, "[");
+        g_string_append_c(accu, '[');
 
         QLIST_FOREACH_ENTRY(val, entry) {
-            qstring_append(str, sep);
-            json_pretty_newline(str, pretty, indent + 1);
-            to_json(qlist_entry_obj(entry), str, pretty, indent + 1);
+            g_string_append(accu, sep);
+            json_pretty_newline(accu, pretty, indent + 1);
+            to_json(qlist_entry_obj(entry), accu, pretty, indent + 1);
             sep = comma;
         }
 
-        json_pretty_newline(str, pretty, indent);
-        qstring_append(str, "]");
+        json_pretty_newline(accu, pretty, indent);
+        g_string_append_c(accu, ']');
         break;
     }
     case QTYPE_QBOOL: {
         QBool *val = qobject_to(QBool, obj);
 
         if (qbool_get_bool(val)) {
-            qstring_append(str, "true");
+            g_string_append(accu, "true");
         } else {
-            qstring_append(str, "false");
+            g_string_append(accu, "false");
         }
         break;
     }
@@ -294,11 +286,10 @@ static void to_json(const QObject *obj, QString *str, bool pretty, int indent)
 
 QString *qobject_to_json_pretty(const QObject *obj, bool pretty)
 {
-    QString *str = qstring_new();
+    GString *accu = g_string_new(NULL);
 
-    to_json(obj, str, pretty, 0);
-
-    return str;
+    to_json(obj, accu, pretty, 0);
+    return qstring_from_gstring(accu);
 }
 
 QString *qobject_to_json(const QObject *obj)
diff --git a/qobject/qstring.c b/qobject/qstring.c
index b66a2c35f2..af7c18ca73 100644
--- a/qobject/qstring.c
+++ b/qobject/qstring.c
@@ -66,6 +66,25 @@ QString *qstring_from_str(const char *str)
     return qstring_from_substr(str, 0, strlen(str));
 }
 
+/**
+ * qstring_from_gstring(): Convert a GString to a QString
+ *
+ * Return strong reference.
+ */
+
+QString *qstring_from_gstring(GString *gstr)
+{
+    QString *qstring;
+
+    qstring = g_malloc(sizeof(*qstring));
+    qobject_init(QOBJECT(qstring), QTYPE_QSTRING);
+    qstring->length = gstr->len;
+    qstring->capacity = gstr->allocated_len;
+    qstring->string = g_string_free(gstr, false);
+    return qstring;
+}
+
+
 static void capacity_increase(QString *qstring, size_t len)
 {
     if (qstring->capacity < (qstring->length + len)) {
-- 
2.26.2


