Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F42312CB9D0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:57:17 +0100 (CET)
Received: from localhost ([::1]:58288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkOsu-0006XX-W0
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:57:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3g-0003a1-GJ
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3d-0004dn-Ks
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606899857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UnDHar2bdds6odKKiAb3/vfn+NJPp4kuSa2PND4522U=;
 b=Wo4K2BaE9KRfHsGHhH531mpiehRDQUYV2Uc0Y/tYnVrYy/jkb1lvBNx0QIyL+0jO+CC9MJ
 tW4iuDGzdBn+6U1KG1P8vD4IlnGSyTLl6etlkw9D8TKaSgRYOqsAn1IogeS2EvjhVgT0V+
 tv6jsMFxAZv9GrMttzhkWbNepHrFS8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-L6I_DyZhO6m6d0dgoIWCuw-1; Wed, 02 Dec 2020 04:04:15 -0500
X-MC-Unique: L6I_DyZhO6m6d0dgoIWCuw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01B7A102CB74;
 Wed,  2 Dec 2020 09:03:41 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51EF161F20;
 Wed,  2 Dec 2020 09:03:40 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/28] keyval: accept escaped commas in implied option
Date: Wed,  2 Dec 2020 04:02:43 -0500
Message-Id: <20201202090305.4129317-7-pbonzini@redhat.com>
In-Reply-To: <20201202090305.4129317-1-pbonzini@redhat.com>
References: <20201202090305.4129317-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, imammedo@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is used with the weirdly-named device "SUNFD,fdtwo":

  $ qemu-system-sparc -device SUNW,,fdtwo,help
  SUNW,fdtwo options:
    drive=<str>            - Node name or ID of a block device to use as a backend
    fallback=<FdcDriveType> - FDC drive type, 144/288/120/none/auto (default: "144")
    ...

Therefore, accepting it is a preparatory step towards keyval-ifying
-device and the device_add monitor command.  In general, however, this
unexpected wart of the keyval syntax leads to suboptimal errors compared
to QemuOpts:

  $ ./qemu-system-x86_64 -object foo,,bar,id=obj
  qemu-system-x86_64: -object foo,,bar,id=obj: invalid object type: foo,bar
  $ storage-daemon/qemu-storage-daemon --object foo,,bar,id=obj
  qemu-storage-daemon: Invalid parameter ''

To implement this, the flow of the parser is changed to first unescape
everything up to the next comma or equal sign.  This is done in a
new function keyval_fetch_string for both the key and value part.
Keys therefore are now parsed in unescaped form, but this makes no
difference in practice because a comma is an invalid character for a
QAPI name.  Thus keys with a comma in them are rejected anyway, as
demonstrated by the new testcase.

As a side effect of the new code, parse errors are slightly improved as
well: "Invalid parameter ''" becomes "Expected parameter before '='"
when keyval is fed a string starting with an equal sign.

The slightly baroque interface of keyval_fetch_string lets me keep the
key parsing loop mostly untouched.  It is simplified in the next patch,
however.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/help_option.h |  11 ---
 tests/test-keyval.c        |  21 +++---
 util/keyval.c              | 142 ++++++++++++++++++++-----------------
 3 files changed, 91 insertions(+), 83 deletions(-)

diff --git a/include/qemu/help_option.h b/include/qemu/help_option.h
index ca6389a154..328d2a89fd 100644
--- a/include/qemu/help_option.h
+++ b/include/qemu/help_option.h
@@ -19,15 +19,4 @@ static inline bool is_help_option(const char *s)
     return !strcmp(s, "?") || !strcmp(s, "help");
 }
 
-static inline int starts_with_help_option(const char *s)
-{
-    if (*s == '?') {
-        return 1;
-    }
-    if (g_str_has_prefix(s, "help")) {
-        return 4;
-    }
-    return 0;
-}
-
 #endif
diff --git a/tests/test-keyval.c b/tests/test-keyval.c
index ee927fe4e4..19f664f535 100644
--- a/tests/test-keyval.c
+++ b/tests/test-keyval.c
@@ -89,6 +89,11 @@ static void test_keyval_parse(void)
     error_free_or_abort(&err);
     g_assert(!qdict);
 
+    /* Keys must be QAPI identifiers */
+    qdict = keyval_parse("weird,,=key", NULL, NULL, &err);
+    error_free_or_abort(&err);
+    g_assert(!qdict);
+
     /* Multiple keys, last one wins */
     qdict = keyval_parse("a=1,b=2,,x,a=3", NULL, NULL, &error_abort);
     g_assert_cmpuint(qdict_size(qdict), ==, 2);
@@ -178,15 +183,15 @@ static void test_keyval_parse(void)
     error_free_or_abort(&err);
     g_assert(!qdict);
 
-    /* Likewise (qemu_opts_parse(): implied key with comma value) */
-    qdict = keyval_parse(",,,a=1", "implied", NULL, &err);
-    error_free_or_abort(&err);
-    g_assert(!qdict);
+    /* Implied key's value can have a comma */
+    qdict = keyval_parse(",,,a=1", "implied", NULL, &error_abort);
+    g_assert_cmpstr(qdict_get_try_str(qdict, "implied"), ==, ",");
+    g_assert_cmpstr(qdict_get_try_str(qdict, "a"), ==, "1");
+    qobject_unref(qdict);
 
-    /* Implied key's value can't have comma (qemu_opts_parse(): it can) */
-    qdict = keyval_parse("val,,ue", "implied", NULL, &err);
-    error_free_or_abort(&err);
-    g_assert(!qdict);
+    qdict = keyval_parse("val,,ue", "implied", NULL, &error_abort);
+    g_assert_cmpstr(qdict_get_try_str(qdict, "implied"), ==, "val,ue");
+    qobject_unref(qdict);
 
     /* Empty key is not an implied key */
     qdict = keyval_parse("=val", "implied", NULL, &err);
diff --git a/util/keyval.c b/util/keyval.c
index 7f625ad33c..eb9b9c55ec 100644
--- a/util/keyval.c
+++ b/util/keyval.c
@@ -16,8 +16,8 @@
  *   key-vals     = [ key-val { ',' key-val } [ ',' ] ]
  *   key-val      = key '=' val | help
  *   key          = key-fragment { '.' key-fragment }
- *   key-fragment = / [^=,.]+ /
- *   val          = { / [^,]+ / | ',,' }
+ *   key-fragment = { / [^=,.] / | ',,' }
+ *   val          = { / [^,] / | ',,' }
  *   help         = 'help' | '?'
  *
  * Semantics defined by reduction to JSON:
@@ -78,13 +78,13 @@
  * Alternative syntax for use with an implied key:
  *
  *   key-vals     = [ key-val-1st { ',' key-val } [ ',' ] ]
- *   key-val-1st  = val-no-key | key-val
- *   val-no-key   = / [^=,]+ / - help
+ *   key-val-1st  = (val-no-key - help) | key-val
+ *   val-no-key   = { / [^=,] / | ',,' }
  *
  * where val-no-key is syntactic sugar for implied-key=val-no-key.
  *
- * Note that you can't use the sugared form when the value contains
- * '=' or ','.
+ * Note that you can't use the sugared form when the value is empty
+ * or contains '='.
  */
 
 #include "qemu/osdep.h"
@@ -141,7 +141,7 @@ static int key_to_index(const char *key, const char **end)
  * On failure, store an error through @errp and return NULL.
  */
 static QObject *keyval_parse_put(QDict *cur,
-                                 const char *key_in_cur, QString *value,
+                                 const char *key_in_cur, const char *value,
                                  const char *key, const char *key_cursor,
                                  Error **errp)
 {
@@ -152,20 +152,56 @@ static QObject *keyval_parse_put(QDict *cur,
         if (qobject_type(old) != (value ? QTYPE_QSTRING : QTYPE_QDICT)) {
             error_setg(errp, "Parameters '%.*s.*' used inconsistently",
                        (int)(key_cursor - key), key);
-            qobject_unref(value);
             return NULL;
         }
         if (!value) {
             return old;         /* already QDict, do nothing */
         }
-        new = QOBJECT(value);   /* replacement */
-    } else {
-        new = value ? QOBJECT(value) : QOBJECT(qdict_new());
     }
+    new = value ? QOBJECT(qstring_from_str(value)) : QOBJECT(qdict_new());
     qdict_put_obj(cur, key_in_cur, new);
     return new;
 }
 
+/*
+ * Parse and unescape the string (key or value) pointed to by @start,
+ * stopping at a single comma or if @key is true an equal sign.
+ * The string is unescaped and NUL-terminated in place.
+ *
+ * On return:
+ * - either NUL or the separator (comma or equal sign) is returned.
+ * - the length of the string is stored in @len.
+ * - @start is advanced to either the NUL or the first character past the
+ *   separator.
+ */
+static char keyval_fetch_string(char **start, size_t *len, bool key)
+{
+    char sep;
+    char *p, *unescaped;
+    p = unescaped = *start;
+    for (;;) {
+        sep = *p;
+        if (!sep) {
+            break;
+        }
+        if (key && sep == '=') {
+            ++p;
+            break;
+        }
+        if (sep == ',') {
+            if (*++p != ',') {
+                break;
+            }
+        }
+        *unescaped++ = *p++;
+    }
+
+    *unescaped = 0;
+    *len = unescaped - *start;
+    *start = p;
+    return sep;
+}
+
 /*
  * Parse one parameter from @params.
  *
@@ -179,35 +215,42 @@ static QObject *keyval_parse_put(QDict *cur,
  * On success, return a pointer to the next parameter, or else to '\0'.
  * On failure, return NULL.
  */
-static const char *keyval_parse_one(QDict *qdict, const char *params,
-                                    const char *implied_key, bool *help,
-                                    Error **errp)
+static char *keyval_parse_one(QDict *qdict, char *params,
+                              const char *implied_key, bool *help,
+                              Error **errp)
 {
-    const char *key, *key_end, *val_end, *s, *end;
+    const char *key, *key_end, *s, *end;
+    const char *val = NULL;
+    char sep;
     size_t len;
     char key_in_cur[128];
     QDict *cur;
     int ret;
     QObject *next;
-    QString *val;
 
     key = params;
-    val_end = NULL;
-    len = strcspn(params, "=,");
-    if (len && key[len] != '=') {
-        if (starts_with_help_option(key) == len) {
+    sep = keyval_fetch_string(&params, &len, true);
+    if (!len) {
+        if (sep) {
+            error_setg(errp, "Expected parameter before '%c%s'", sep, params);
+        } else {
+            error_setg(errp, "Expected parameter at end of string");
+        }
+        return NULL;
+    }
+    if (sep != '=') {
+        if (is_help_option(key)) {
             *help = true;
-            s = key + len;
-            if (*s == ',') {
-                s++;
-            }
-            return s;
+            return params;
         }
         if (implied_key) {
             /* Desugar implied key */
+            val = key;
             key = implied_key;
-            val_end = params + len;
             len = strlen(implied_key);
+        } else {
+            error_setg(errp, "No implicit parameter name for value '%s'", key);
+            return NULL;
         }
     }
     key_end = key + len;
@@ -218,7 +261,7 @@ static const char *keyval_parse_one(QDict *qdict, const char *params,
      */
     cur = qdict;
     s = key;
-    for (;;) {
+    do {
         /* Want a key index (unless it's first) or a QAPI name */
         if (s != key && key_to_index(s, &end) >= 0) {
             len = end - s;
@@ -254,46 +297,16 @@ static const char *keyval_parse_one(QDict *qdict, const char *params,
         memcpy(key_in_cur, s, len);
         key_in_cur[len] = 0;
         s += len;
+    } while (*s++ == '.');
 
-        if (*s != '.') {
-            break;
-        }
-        s++;
-    }
-
-    if (key == implied_key) {
-        assert(!*s);
-        val = qstring_from_substr(params, 0, val_end - params);
-        s = val_end;
-        if (*s == ',') {
-            s++;
-        }
-    } else {
-        if (*s != '=') {
-            error_setg(errp, "Expected '=' after parameter '%.*s'",
-                       (int)(s - key), key);
-            return NULL;
-        }
-        s++;
-
-        val = qstring_new();
-        for (;;) {
-            if (!*s) {
-                break;
-            } else if (*s == ',') {
-                s++;
-                if (*s != ',') {
-                    break;
-                }
-            }
-            qstring_append_chr(val, *s++);
-        }
+    if (key != implied_key) {
+        val = params;
+        keyval_fetch_string(&params, &len, false);
     }
-
     if (!keyval_parse_put(cur, key_in_cur, val, key, key_end, errp)) {
         return NULL;
     }
-    return s;
+    return params;
 }
 
 static char *reassemble_key(GSList *key)
@@ -438,10 +451,11 @@ QDict *keyval_parse(const char *params, const char *implied_key,
 {
     QDict *qdict = qdict_new();
     QObject *listified;
-    const char *s;
+    g_autofree char *dup;
+    char *s;
     bool help = false;
 
-    s = params;
+    s = dup = g_strdup(params);
     while (*s) {
         s = keyval_parse_one(qdict, s, implied_key, &help, errp);
         if (!s) {
-- 
2.26.2



