Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D9C2AEEF3
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 11:47:11 +0100 (CET)
Received: from localhost ([::1]:60008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcneg-0001Bl-4C
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 05:47:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcnd3-0000GX-FQ
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 05:45:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcnd1-0002Sw-2i
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 05:45:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605091526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2i9ene0FNVfIlw0xpTTbFJBPILtgK2OlbzrxGQ6HE8M=;
 b=ddcCP65woxYOYw4sQN4UFXbY2nekpbG4X4XSBnpuNZunBQGRziM+cdh8/2K0Fsx6pEPtWm
 DjBbramypFq2DcUwIRn2vVxUC6s03RjSPrTJB/NscV6DbFnmZtdZfu7iXGz7ggUdXLcdFk
 xweMAMCZDQ40cI0LGwRecpo4gDJ4/+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-gVFKiEj6PciSok0MdMMEbw-1; Wed, 11 Nov 2020 05:45:23 -0500
X-MC-Unique: gVFKiEj6PciSok0MdMMEbw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0713B1084C90
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 10:45:23 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B701010027AB;
 Wed, 11 Nov 2020 10:45:22 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] keyval: simplify keyval_parse_one
Date: Wed, 11 Nov 2020 05:45:21 -0500
Message-Id: <20201111104521.1179396-3-pbonzini@redhat.com>
In-Reply-To: <20201111104521.1179396-1-pbonzini@redhat.com>
References: <20201111104521.1179396-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: armbru@redhat.com
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
index 2213a5fe78..76daab0885 100644
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
             error_setg(errp, "Expected parameter before '%c'", sep);
         } else {
@@ -247,13 +245,11 @@ static char *keyval_parse_one(QDict *qdict, char *params,
             /* Desugar implied key */
             val = key;
             key = implied_key;
-            len = strlen(implied_key);
         } else {
             error_setg(errp, "Expected '=' after parameter '%s'", key);
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


