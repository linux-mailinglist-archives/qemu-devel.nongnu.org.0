Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A3D2D7D50
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:52:48 +0100 (CET)
Received: from localhost ([::1]:60572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmb1-00064S-7A
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:52:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knlxg-0007Ol-En
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:12:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knlxY-0003Pt-9c
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:12:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=28Ijfb534T/5WYU5R66dreIKvgUAeHnmBrT3ta808/M=;
 b=XpHMy5Aa6B8XQwvUg4gm0jjWWe2Ls7sodIatuwJ8t7I0gEpQK3n8nPC8as+eB3G5NgmmG3
 BZD8Qab7wlGUfslddmibu+iloT62yOnXh3CrNoWbF06WL0kOwiSfAnUhVmIfXhfEXZi23b
 E9ZtHnmXpwTHH8Vqh8HGvoJOR8tUP3Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-4B9skghcO2uoq0X9vQsdzQ-1; Fri, 11 Dec 2020 12:11:57 -0500
X-MC-Unique: 4B9skghcO2uoq0X9vQsdzQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 498E4801817;
 Fri, 11 Dec 2020 17:11:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E35EB6F7E7;
 Fri, 11 Dec 2020 17:11:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CABF0112E9D8; Fri, 11 Dec 2020 18:11:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/20] qobject: Factor quoted_str() out of to_json()
Date: Fri, 11 Dec 2020 18:11:46 +0100
Message-Id: <20201211171152.146877-15-armbru@redhat.com>
In-Reply-To: <20201211171152.146877-1-armbru@redhat.com>
References: <20201211171152.146877-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
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
Cc: mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qobject/qjson.c | 110 ++++++++++++++++++++++++------------------------
 1 file changed, 54 insertions(+), 56 deletions(-)

diff --git a/qobject/qjson.c b/qobject/qjson.c
index 2f690c1816..962214f5a7 100644
--- a/qobject/qjson.c
+++ b/qobject/qjson.c
@@ -156,6 +156,58 @@ static void json_pretty_newline(GString *accu, bool pretty, int indent)
     }
 }
 
+static void quoted_str(const char *str, GString *accu)
+{
+    const char *ptr;
+    int cp;
+    char *end;
+
+    g_string_append_c(accu, '"');
+
+    for (ptr = str; *ptr; ptr = end) {
+        cp = mod_utf8_codepoint(ptr, 6, &end);
+        switch (cp) {
+        case '\"':
+            g_string_append(accu, "\\\"");
+            break;
+        case '\\':
+            g_string_append(accu, "\\\\");
+            break;
+        case '\b':
+            g_string_append(accu, "\\b");
+            break;
+        case '\f':
+            g_string_append(accu, "\\f");
+            break;
+        case '\n':
+            g_string_append(accu, "\\n");
+            break;
+        case '\r':
+            g_string_append(accu, "\\r");
+            break;
+        case '\t':
+            g_string_append(accu, "\\t");
+            break;
+        default:
+            if (cp < 0) {
+                cp = 0xFFFD; /* replacement character */
+            }
+            if (cp > 0xFFFF) {
+                /* beyond BMP; need a surrogate pair */
+                g_string_append_printf(accu, "\\u%04X\\u%04X",
+                                       0xD800 + ((cp - 0x10000) >> 10),
+                                       0xDC00 + ((cp - 0x10000) & 0x3FF));
+            } else if (cp < 0x20 || cp >= 0x7F) {
+                g_string_append_printf(accu, "\\u%04X", cp);
+            } else {
+                g_string_append_c(accu, cp);
+            }
+        }
+    };
+
+    g_string_append_c(accu, '"');
+}
+
 static void to_json(const QObject *obj, GString *accu, bool pretty, int indent)
 {
     switch (qobject_type(obj)) {
@@ -170,56 +222,7 @@ static void to_json(const QObject *obj, GString *accu, bool pretty, int indent)
         break;
     }
     case QTYPE_QSTRING: {
-        QString *val = qobject_to(QString, obj);
-        const char *ptr;
-        int cp;
-        char *end;
-
-        ptr = qstring_get_str(val);
-        g_string_append_c(accu, '"');
-
-        for (; *ptr; ptr = end) {
-            cp = mod_utf8_codepoint(ptr, 6, &end);
-            switch (cp) {
-            case '\"':
-                g_string_append(accu, "\\\"");
-                break;
-            case '\\':
-                g_string_append(accu, "\\\\");
-                break;
-            case '\b':
-                g_string_append(accu, "\\b");
-                break;
-            case '\f':
-                g_string_append(accu, "\\f");
-                break;
-            case '\n':
-                g_string_append(accu, "\\n");
-                break;
-            case '\r':
-                g_string_append(accu, "\\r");
-                break;
-            case '\t':
-                g_string_append(accu, "\\t");
-                break;
-            default:
-                if (cp < 0) {
-                    cp = 0xFFFD; /* replacement character */
-                }
-                if (cp > 0xFFFF) {
-                    /* beyond BMP; need a surrogate pair */
-                    g_string_append_printf(accu, "\\u%04X\\u%04X",
-                                           0xD800 + ((cp - 0x10000) >> 10),
-                                           0xDC00 + ((cp - 0x10000) & 0x3FF));
-                } else if (cp < 0x20 || cp >= 0x7F) {
-                    g_string_append_printf(accu, "\\u%04X", cp);
-                } else {
-                    g_string_append_c(accu, cp);
-                }
-            }
-        };
-
-        g_string_append_c(accu, '"');
+        quoted_str(qstring_get_str(qobject_to(QString, obj)), accu);
         break;
     }
     case QTYPE_QDICT: {
@@ -227,7 +230,6 @@ static void to_json(const QObject *obj, GString *accu, bool pretty, int indent)
         const char *comma = pretty ? "," : ", ";
         const char *sep = "";
         const QDictEntry *entry;
-        QString *qkey;
 
         g_string_append_c(accu, '{');
 
@@ -236,11 +238,7 @@ static void to_json(const QObject *obj, GString *accu, bool pretty, int indent)
              entry = qdict_next(val, entry)) {
             g_string_append(accu, sep);
             json_pretty_newline(accu, pretty, indent + 1);
-
-            qkey = qstring_from_str(qdict_entry_key(entry));
-            to_json(QOBJECT(qkey), accu, pretty, indent + 1);
-            qobject_unref(qkey);
-
+            quoted_str(qdict_entry_key(entry), accu);
             g_string_append(accu, ": ");
             to_json(qdict_entry_value(entry), accu, pretty, indent + 1);
             sep = comma;
-- 
2.26.2


