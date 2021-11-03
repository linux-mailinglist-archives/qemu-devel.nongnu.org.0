Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD995444742
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:35:11 +0100 (CET)
Received: from localhost ([::1]:46916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miKAI-0000mp-Q1
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miK5h-0000qx-DD
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:30:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miK5f-0001L5-CR
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:30:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635960622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ol7PxkSSx7cJjFOixdCvzTwqnTP555k0oF2xfT/BYG0=;
 b=FVHYSB8oSszMPFXct6LDNTBP+nd/35KDEiQwnWGo2QvmOgeKqov+LE/XmUQ43j/pHiESBs
 pBRNSUSVa7yKUDFF8q5Ft2VPwLPy2CU2/aTdXj1n0k9MluxSXlPlnb/CVnexMuGxWOQDOs
 nFDffPs1XY0agqfalNRFjz6rMX/A6S8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-lfDnudOzNJe8rBqhYqLNOQ-1; Wed, 03 Nov 2021 13:30:21 -0400
X-MC-Unique: lfDnudOzNJe8rBqhYqLNOQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E67C48735EC
 for <qemu-devel@nongnu.org>; Wed,  3 Nov 2021 17:30:18 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74D59171FF;
 Wed,  3 Nov 2021 17:30:17 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 03/12] qom: Make object_configure() public
Date: Wed,  3 Nov 2021 18:29:53 +0100
Message-Id: <20211103173002.209906-4-kwolf@redhat.com>
In-Reply-To: <20211103173002.209906-1-kwolf@redhat.com>
References: <20211103173002.209906-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 armbru@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This makes object_configure() public and moves it to qom/object.c
because it will need to access TypeImpl in the future.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qom/object.h    |  3 +++
 qom/object.c            | 17 +++++++++++++++++
 qom/object_interfaces.c | 17 -----------------
 3 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index faae0d841f..d67ba2411d 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -770,6 +770,9 @@ void object_initialize_child_internal(Object *parent, const char *propname,
                                       void *child, size_t size,
                                       const char *type);
 
+/** TODO */
+void object_configure(Object *obj, Visitor *v, Error **errp);
+
 /**
  * object_dynamic_cast:
  * @obj: The object to cast.
diff --git a/qom/object.c b/qom/object.c
index 6be710bc40..d8da362987 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -605,6 +605,23 @@ void object_initialize_child_internal(Object *parent,
                                        &error_abort, NULL);
 }
 
+void object_configure(Object *obj, Visitor *v, Error **errp)
+{
+    const char *key;
+
+    if (!visit_start_struct(v, NULL, NULL, 0, errp)) {
+        return;
+    }
+    while ((key = visit_next_struct_member(v))) {
+        if (!object_property_set(obj, key, v, errp)) {
+            goto out;
+        }
+    }
+    visit_check_struct(v, errp);
+out:
+    visit_end_struct(v, NULL);
+}
+
 static inline bool object_property_is_child(ObjectProperty *prop)
 {
     return strstart(prop->type, "child<", NULL);
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index f9f5608194..0e8875bf04 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -42,23 +42,6 @@ bool user_creatable_can_be_deleted(UserCreatable *uc)
     }
 }
 
-static void object_configure(Object *obj, Visitor *v, Error **errp)
-{
-    const char *key;
-
-    if (!visit_start_struct(v, NULL, NULL, 0, errp)) {
-        return;
-    }
-    while ((key = visit_next_struct_member(v))) {
-        if (!object_property_set(obj, key, v, errp)) {
-            goto out;
-        }
-    }
-    visit_check_struct(v, errp);
-out:
-    visit_end_struct(v, NULL);
-}
-
 void object_set_properties_from_keyval(Object *obj, const QDict *qdict,
                                        bool from_json, Error **errp)
 {
-- 
2.31.1


