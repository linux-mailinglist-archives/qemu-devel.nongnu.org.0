Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B872CB9FD
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:01:51 +0100 (CET)
Received: from localhost ([::1]:42930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkOxK-0003SM-HN
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:01:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3j-0003gz-FR
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3e-0004dz-K5
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606899857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w/ft4yHW6Gu6rk+/3kyhPjUQ5KEBud0S4dG0X/WbxI0=;
 b=RMoWowCj02QlEOPNy97QoFDRZ8NmUUIGy6WwuXGmpa5C/9F212eBSPtiqgcw1VZxcqAAIo
 yeRgiufKvjgTq48IXwIkv6nMmeDgf46zHlJ7sek65f5/qXa7msq3RVO8fIevltGYiNaSEL
 Fv5VaBt54UBrrxBD97HAHObnI8K1FQc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-zZsWiMgPPJWFsWCZKKxWeg-1; Wed, 02 Dec 2020 04:04:15 -0500
X-MC-Unique: zZsWiMgPPJWFsWCZKKxWeg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79380922D3C;
 Wed,  2 Dec 2020 09:03:41 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03A755B6AB;
 Wed,  2 Dec 2020 09:03:40 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/28] keyval: simplify keyval_parse_one
Date: Wed,  2 Dec 2020 04:02:44 -0500
Message-Id: <20201202090305.4129317-8-pbonzini@redhat.com>
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

Now that the key is NULL terminated, we can remove some of the contortions
that were done to operate on possibly '='-terminated strings in
keyval_parse_one.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/keyval.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/util/keyval.c b/util/keyval.c
index eb9b9c55ec..e7f708cd1e 100644
--- a/util/keyval.c
+++ b/util/keyval.c
@@ -170,11 +170,10 @@ static QObject *keyval_parse_put(QDict *cur,
  *
  * On return:
  * - either NUL or the separator (comma or equal sign) is returned.
- * - the length of the string is stored in @len.
  * - @start is advanced to either the NUL or the first character past the
  *   separator.
  */
-static char keyval_fetch_string(char **start, size_t *len, bool key)
+static char keyval_fetch_string(char **start, bool key)
 {
     char sep;
     char *p, *unescaped;
@@ -197,7 +196,6 @@ static char keyval_fetch_string(char **start, size_t *len, bool key)
     }
 
     *unescaped = 0;
-    *len = unescaped - *start;
     *start = p;
     return sep;
 }
@@ -219,7 +217,7 @@ static char *keyval_parse_one(QDict *qdict, char *params,
                               const char *implied_key, bool *help,
                               Error **errp)
 {
-    const char *key, *key_end, *s, *end;
+    const char *key, *s, *end;
     const char *val = NULL;
     char sep;
     size_t len;
@@ -229,8 +227,8 @@ static char *keyval_parse_one(QDict *qdict, char *params,
     QObject *next;
 
     key = params;
-    sep = keyval_fetch_string(&params, &len, true);
-    if (!len) {
+    sep = keyval_fetch_string(&params, true);
+    if (!*key) {
         if (sep) {
             error_setg(errp, "Expected parameter before '%c%s'", sep, params);
         } else {
@@ -247,13 +245,11 @@ static char *keyval_parse_one(QDict *qdict, char *params,
             /* Desugar implied key */
             val = key;
             key = implied_key;
-            len = strlen(implied_key);
         } else {
             error_setg(errp, "No implicit parameter name for value '%s'", key);
             return NULL;
         }
     }
-    key_end = key + len;
 
     /*
      * Loop over key fragments: @s points to current fragment, it
@@ -269,24 +265,21 @@ static char *keyval_parse_one(QDict *qdict, char *params,
             ret = parse_qapi_name(s, false);
             len = ret < 0 ? 0 : ret;
         }
-        assert(s + len <= key_end);
-        if (!len || (s + len < key_end && s[len] != '.')) {
+        if (!len || (s[len] != '\0' && s[len] != '.')) {
             assert(key != implied_key);
-            error_setg(errp, "Invalid parameter '%.*s'",
-                       (int)(key_end - key), key);
+            error_setg(errp, "Invalid parameter '%s'", key);
             return NULL;
         }
         if (len >= sizeof(key_in_cur)) {
             assert(key != implied_key);
             error_setg(errp, "Parameter%s '%.*s' is too long",
-                       s != key || s + len != key_end ? " fragment" : "",
+                       s != key || s[len] == '.' ? " fragment" : "",
                        (int)len, s);
             return NULL;
         }
 
         if (s != key) {
-            next = keyval_parse_put(cur, key_in_cur, NULL,
-                                    key, s - 1, errp);
+            next = keyval_parse_put(cur, key_in_cur, NULL, key, s - 1, errp);
             if (!next) {
                 return NULL;
             }
@@ -301,9 +294,9 @@ static char *keyval_parse_one(QDict *qdict, char *params,
 
     if (key != implied_key) {
         val = params;
-        keyval_fetch_string(&params, &len, false);
+        keyval_fetch_string(&params, false);
     }
-    if (!keyval_parse_put(cur, key_in_cur, val, key, key_end, errp)) {
+    if (!keyval_parse_put(cur, key_in_cur, val, key, s - 1, errp)) {
         return NULL;
     }
     return params;
-- 
2.26.2



