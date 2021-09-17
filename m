Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D372A40FDBB
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:17:25 +0200 (CEST)
Received: from localhost ([::1]:37434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRGYG-0001YH-SZ
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mRGUf-0007Pg-8k
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:13:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mRGUd-0005u8-Ky
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:13:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631895218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QWTQldGid/ZrxsUJpdPp+u6Xxn7Sbp5DcAGyh08mIRM=;
 b=g+Xn8N4Viy/k3DeFs/zeB0kCBxUQkmml6fEyHZRWkhpgku2MfNgyIqlVaxZZ0pS5IhHOvX
 rKpHLU3VXL0fMcZOXBJstT+jg5jsjKcIvMf4SlQN0dguothnm5L1VT+Xl90A6txx/N989O
 qIEp5/y65jW4Uh41XlI0BHTtoTKFt4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-bfui841ZPISYGk4QDzKgoQ-1; Fri, 17 Sep 2021 12:13:37 -0400
X-MC-Unique: bfui841ZPISYGk4QDzKgoQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CA1791272
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 16:13:36 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79A6E60C2B;
 Fri, 17 Sep 2021 16:13:35 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/8] qapi: Store Error in StackObject.h for
 qobject-input-visitor
Date: Fri, 17 Sep 2021 18:13:16 +0200
Message-Id: <20210917161320.201086-5-kwolf@redhat.com>
In-Reply-To: <20210917161320.201086-1-kwolf@redhat.com>
References: <20210917161320.201086-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, jsnow@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

StackObject.h is a GHashTable that stores all keys in the input that
haven't been consumed yet. If qobject_input_check_struct() still finds
any entry, an error is returned because the input was unexpected. The
value of hash table entries is currently unused (always NULL).

The next patch implements, amongst others, wildcard aliases that can
lead to situations where it can't be decided immediately if a value is
still used elsewhere or if a conflict (two values for one member) needs
to be reported.

Allow it to store an Error object in the hash table so that a good error
message is used for qobject_input_check_struct() if the value isn't
consumed elsewhere, but no error is reported if some other object does
consume the value.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qobject-input-visitor.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
index 3eb3b34894..90ebd2fe95 100644
--- a/qapi/qobject-input-visitor.c
+++ b/qapi/qobject-input-visitor.c
@@ -79,7 +79,14 @@ typedef struct StackObject {
     QObject *obj;                /* QDict or QList being visited */
     void *qapi; /* sanity check that caller uses same pointer */
 
-    GHashTable *h;              /* If @obj is QDict: unvisited keys */
+    /*
+     * If @obj is QDict:
+     * Keys are the unvisited keys. Values are Error objects to be
+     * returned in qobject_input_check_struct() if the value was not
+     * consumed, or NULL for a default error.
+     */
+    GHashTable *h;
+
     const QListEntry *entry;    /* If @obj is QList: unvisited tail */
     unsigned index;             /* If @obj is QList: list index of @entry */
 
@@ -318,7 +325,8 @@ static const QListEntry *qobject_input_push(QObjectInputVisitor *qiv,
     QSIMPLEQ_INIT(&tos->aliases);
 
     if (qdict) {
-        h = g_hash_table_new(g_str_hash, g_str_equal);
+        h = g_hash_table_new_full(g_str_hash, g_str_equal, NULL,
+                                  (GDestroyNotify) error_free);
         for (entry = qdict_first(qdict);
              entry;
              entry = qdict_next(qdict, entry)) {
@@ -345,13 +353,19 @@ static bool qobject_input_check_struct(Visitor *v, Error **errp)
     StackObject *tos = QSLIST_FIRST(&qiv->stack);
     GHashTableIter iter;
     const char *key;
+    Error *err;
 
     assert(tos && !tos->entry);
 
     g_hash_table_iter_init(&iter, tos->h);
-    if (g_hash_table_iter_next(&iter, (void **)&key, NULL)) {
-        error_setg(errp, "Parameter '%s' is unexpected",
-                   full_name(qiv, key));
+    if (g_hash_table_iter_next(&iter, (void **)&key, (void **)&err)) {
+        if (err) {
+            g_hash_table_steal(tos->h, key);
+            error_propagate(errp, err);
+        } else {
+            error_setg(errp, "Parameter '%s' is unexpected",
+                       full_name(qiv, key));
+        }
         return false;
     }
     return true;
-- 
2.31.1


