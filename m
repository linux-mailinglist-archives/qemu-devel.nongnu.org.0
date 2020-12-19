Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9953E2DEE70
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 12:12:47 +0100 (CET)
Received: from localhost ([::1]:36156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqaAH-0002C2-H5
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 06:12:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtx-000568-5E
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtm-0007Hx-7i
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608375341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=29AdrfONURv16D17PL5O506hts+OonM70cmpwZeP+fo=;
 b=YdFMIp9S/dflA7YzKvfDkoSh4FJPxzYNLikLdAJt1qEiLbkHO1xlOtpL3hP2FiCEoo84Jx
 E7nGYor3qdb2FvLloTHT1aBsNuE/xJMg3xHNdfHxqJ9/mdGAwbyNK4l1k1H6Z421os2lLM
 6ZQ8vOSXx5K+ppxoyrcLwzMi007737I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-IndbO86zO4eTuPb6iPjBJA-1; Sat, 19 Dec 2020 05:55:39 -0500
X-MC-Unique: IndbO86zO4eTuPb6iPjBJA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51C20180A087;
 Sat, 19 Dec 2020 10:55:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 23E666A8F0;
 Sat, 19 Dec 2020 10:55:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D9BE8112564B; Sat, 19 Dec 2020 11:55:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/33] json: Use GString instead of QString to accumulate
 strings
Date: Sat, 19 Dec 2020 11:55:29 +0100
Message-Id: <20201219105532.1734134-31-armbru@redhat.com>
In-Reply-To: <20201219105532.1734134-1-armbru@redhat.com>
References: <20201219105532.1734134-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

Change parse_string() to do build the initial string with GString.
This is another step towards making QString immutable.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201211171152.146877-18-armbru@redhat.com>
---
 qobject/json-parser.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/qobject/json-parser.c b/qobject/json-parser.c
index c0f521b56b..d351039b10 100644
--- a/qobject/json-parser.c
+++ b/qobject/json-parser.c
@@ -130,7 +130,7 @@ static int cvt4hex(const char *s)
 static QString *parse_string(JSONParserContext *ctxt, JSONToken *token)
 {
     const char *ptr = token->str;
-    QString *str;
+    GString *str;
     char quote;
     const char *beg;
     int cp, trailing;
@@ -140,7 +140,7 @@ static QString *parse_string(JSONParserContext *ctxt, JSONToken *token)
 
     assert(*ptr == '"' || *ptr == '\'');
     quote = *ptr++;
-    str = qstring_new();
+    str = g_string_new(NULL);
 
     while (*ptr != quote) {
         assert(*ptr);
@@ -149,31 +149,31 @@ static QString *parse_string(JSONParserContext *ctxt, JSONToken *token)
             beg = ptr++;
             switch (*ptr++) {
             case '"':
-                qstring_append_chr(str, '"');
+                g_string_append_c(str, '"');
                 break;
             case '\'':
-                qstring_append_chr(str, '\'');
+                g_string_append_c(str, '\'');
                 break;
             case '\\':
-                qstring_append_chr(str, '\\');
+                g_string_append_c(str, '\\');
                 break;
             case '/':
-                qstring_append_chr(str, '/');
+                g_string_append_c(str, '/');
                 break;
             case 'b':
-                qstring_append_chr(str, '\b');
+                g_string_append_c(str, '\b');
                 break;
             case 'f':
-                qstring_append_chr(str, '\f');
+                g_string_append_c(str, '\f');
                 break;
             case 'n':
-                qstring_append_chr(str, '\n');
+                g_string_append_c(str, '\n');
                 break;
             case 'r':
-                qstring_append_chr(str, '\r');
+                g_string_append_c(str, '\r');
                 break;
             case 't':
-                qstring_append_chr(str, '\t');
+                g_string_append_c(str, '\t');
                 break;
             case 'u':
                 cp = cvt4hex(ptr);
@@ -200,7 +200,7 @@ static QString *parse_string(JSONParserContext *ctxt, JSONToken *token)
                                 (int)(ptr - beg), beg);
                     goto out;
                 }
-                qstring_append(str, utf8_buf);
+                g_string_append(str, utf8_buf);
                 break;
             default:
                 parse_error(ctxt, token, "invalid escape sequence in string");
@@ -225,14 +225,14 @@ static QString *parse_string(JSONParserContext *ctxt, JSONToken *token)
             ptr = end;
             len = mod_utf8_encode(utf8_buf, sizeof(utf8_buf), cp);
             assert(len >= 0);
-            qstring_append(str, utf8_buf);
+            g_string_append(str, utf8_buf);
         }
     }
 
-    return str;
+    return qstring_from_gstring(str);
 
 out:
-    qobject_unref(str);
+    g_string_free(str, true);
     return NULL;
 }
 
-- 
2.26.2


