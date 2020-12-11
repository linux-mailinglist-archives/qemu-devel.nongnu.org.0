Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228E12D7D8B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:03:46 +0100 (CET)
Received: from localhost ([::1]:32916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmld-0001eX-4n
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:03:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knlxs-0007XD-Eg
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:12:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knlxc-0003S2-5O
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:12:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hyXsrL+PuXp2DnKfHhvz8yzSbfDhBrvb7mgoaou9bVE=;
 b=PRiKCq1BmnjK17bwIXHgpdkuYHigcEop/D5jbT0zVBXgeGtr1INYgwoVKryL5qylKMNKih
 ynH0H+GoLULDa6dxG/oBvVRlrstkO0Xo0tSigGxfGLXAjKwFW8Bzj/SfhouHGjiqGL9Lyz
 vTdobavacjxRbj08PV4P8/OsmvMl7fE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-nnefTOeeNGiwi92EzyJpjw-1; Fri, 11 Dec 2020 12:11:58 -0500
X-MC-Unique: nnefTOeeNGiwi92EzyJpjw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 879E6800FFC;
 Fri, 11 Dec 2020 17:11:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 585055F9AC;
 Fri, 11 Dec 2020 17:11:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E365E112E5DD; Fri, 11 Dec 2020 18:11:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/20] keyval: Use GString to accumulate value strings
Date: Fri, 11 Dec 2020 18:11:50 +0100
Message-Id: <20201211171152.146877-19-armbru@redhat.com>
In-Reply-To: <20201211171152.146877-1-armbru@redhat.com>
References: <20201211171152.146877-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

QString supports modifying its string, but it's quite limited: you can
only append.  The remaining callers use it for building an initial
string, never for modifying it later.

Change keyval_parse_one() to do build the initial string with GString.
This is another step towards making QString immutable.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 util/keyval.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/util/keyval.c b/util/keyval.c
index 7f625ad33c..be34928813 100644
--- a/util/keyval.c
+++ b/util/keyval.c
@@ -189,7 +189,7 @@ static const char *keyval_parse_one(QDict *qdict, const char *params,
     QDict *cur;
     int ret;
     QObject *next;
-    QString *val;
+    GString *val;
 
     key = params;
     val_end = NULL;
@@ -263,7 +263,7 @@ static const char *keyval_parse_one(QDict *qdict, const char *params,
 
     if (key == implied_key) {
         assert(!*s);
-        val = qstring_from_substr(params, 0, val_end - params);
+        val = g_string_new_len(params, val_end - params);
         s = val_end;
         if (*s == ',') {
             s++;
@@ -276,7 +276,7 @@ static const char *keyval_parse_one(QDict *qdict, const char *params,
         }
         s++;
 
-        val = qstring_new();
+        val = g_string_new(NULL);
         for (;;) {
             if (!*s) {
                 break;
@@ -286,11 +286,12 @@ static const char *keyval_parse_one(QDict *qdict, const char *params,
                     break;
                 }
             }
-            qstring_append_chr(val, *s++);
+            g_string_append_c(val, *s++);
         }
     }
 
-    if (!keyval_parse_put(cur, key_in_cur, val, key, key_end, errp)) {
+    if (!keyval_parse_put(cur, key_in_cur, qstring_from_gstring(val),
+                          key, key_end, errp)) {
         return NULL;
     }
     return s;
-- 
2.26.2


