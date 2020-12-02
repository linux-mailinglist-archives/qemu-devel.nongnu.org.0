Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C01722CBA08
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:04:20 +0100 (CET)
Received: from localhost ([::1]:49926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkOzj-0006eD-Of
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:04:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3j-0003h1-Hz
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3h-0004fd-9Z
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606899860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TEAlKqwM+60ep7QN+s9ZMLJy18GtUzwQAfwiX+zsRjs=;
 b=aGYUBbSajZgdEnzhx+dm4tMiiiOHbjTocv06hfnR7pfkQ+ovsQ0/Pe8FzXaTodpRO/UrCD
 wDc+HsM+2tWXS+W0Zo0mpNe308bQBge3F8DmtQCwdbYzNBNwmg3zf2WiZ99B83Xs7ClZJ1
 RhhGkhQb7NxyYgk9vkLoPFTHYzmxpM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-hlPWUKooNViMC9ERogdQIw-1; Wed, 02 Dec 2020 04:04:17 -0500
X-MC-Unique: hlPWUKooNViMC9ERogdQIw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6FE01100C4E;
 Wed,  2 Dec 2020 09:03:42 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 317315D730;
 Wed,  2 Dec 2020 09:03:42 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/28] keyval: introduce keyval_parse_into
Date: Wed,  2 Dec 2020 04:02:46 -0500
Message-Id: <20201202090305.4129317-10-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Allow parsing multiple keyval sequences into the same dictionary.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/option.h |  2 ++
 util/keyval.c         | 39 ++++++++++++++++++++++++++++++++-------
 2 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/include/qemu/option.h b/include/qemu/option.h
index f73e0dc7d9..092e291c37 100644
--- a/include/qemu/option.h
+++ b/include/qemu/option.h
@@ -147,6 +147,8 @@ void qemu_opts_print_help(QemuOptsList *list, bool print_caption);
 void qemu_opts_free(QemuOptsList *list);
 QemuOptsList *qemu_opts_append(QemuOptsList *dst, QemuOptsList *list);
 
+QDict *keyval_parse_into(QDict *qdict, const char *params, const char *implied_key,
+                         bool *p_help, Error **errp);
 QDict *keyval_parse(const char *params, const char *implied_key,
                     bool *help, Error **errp);
 
diff --git a/util/keyval.c b/util/keyval.c
index e7f708cd1e..1d4ca12129 100644
--- a/util/keyval.c
+++ b/util/keyval.c
@@ -436,13 +436,12 @@ static QObject *keyval_listify(QDict *cur, GSList *key_of_cur, Error **errp)
  * If @p_help is not NULL, store whether help is requested there.
  * If @p_help is NULL and help is requested, fail.
  *
- * On success, return a dictionary of the parsed keys and values.
+ * On success, return @dict, now filled with the parsed keys and values.
  * On failure, store an error through @errp and return NULL.
  */
-QDict *keyval_parse(const char *params, const char *implied_key,
-                    bool *p_help, Error **errp)
+QDict *keyval_parse_into(QDict *qdict, const char *params, const char *implied_key,
+                         bool *p_help, Error **errp)
 {
-    QDict *qdict = qdict_new();
     QObject *listified;
     g_autofree char *dup;
     char *s;
@@ -452,7 +451,6 @@ QDict *keyval_parse(const char *params, const char *implied_key,
     while (*s) {
         s = keyval_parse_one(qdict, s, implied_key, &help, errp);
         if (!s) {
-            qobject_unref(qdict);
             return NULL;
         }
         implied_key = NULL;
@@ -462,15 +460,42 @@ QDict *keyval_parse(const char *params, const char *implied_key,
         *p_help = help;
     } else if (help) {
         error_setg(errp, "Help is not available for this option");
-        qobject_unref(qdict);
         return NULL;
     }
 
     listified = keyval_listify(qdict, NULL, errp);
     if (!listified) {
-        qobject_unref(qdict);
         return NULL;
     }
     assert(listified == QOBJECT(qdict));
     return qdict;
 }
+
+/*
+ * Parse @params in QEMU's traditional KEY=VALUE,... syntax.
+ *
+ * If @implied_key, the first KEY= can be omitted.  @implied_key is
+ * implied then, and VALUE can't be empty or contain ',' or '='.
+ *
+ * A parameter "help" or "?" without a value isn't added to the
+ * resulting dictionary, but instead is interpreted as help request.
+ * All other options are parsed and returned normally so that context
+ * specific help can be printed.
+ *
+ * If @p_help is not NULL, store whether help is requested there.
+ * If @p_help is NULL and help is requested, fail.
+ *
+ * On success, return a dictionary of the parsed keys and values.
+ * On failure, store an error through @errp and return NULL.
+ */
+QDict *keyval_parse(const char *params, const char *implied_key,
+                    bool *p_help, Error **errp)
+{
+    QDict *qdict = qdict_new();
+    QDict *ret = keyval_parse_into(qdict, params, implied_key, p_help, errp);
+
+    if (!ret) {
+        qobject_unref(qdict);
+    }
+    return ret;
+}
-- 
2.26.2



