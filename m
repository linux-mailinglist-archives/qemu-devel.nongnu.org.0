Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AD0444745
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:35:22 +0100 (CET)
Received: from localhost ([::1]:47610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miKAT-0001GE-O8
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miK5g-0000oi-0D
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:30:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miK5b-0001JG-QP
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:30:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635960619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lOT7L/i7CxEJH2QSDpk9ekZd4sA5KDsKlLG6lbGAxdg=;
 b=LuYw2M6hu4BVTtktslHwoRLiJDcmK1mTcGTYiKROHtFd3ZOtgMS9Z7pq2hTvvK9u4rQXAS
 IF2icE/or22QB5Dk7S0oqqYL3+XSV9fTqi8VaUPPQao8qo85XrdSm6JqNshqFbB/+tQulu
 qh2nvQxFXh09JjivC0FuYV0t/E2rgfg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-MXe1EEm7Mfa3HjOWb7XtVw-1; Wed, 03 Nov 2021 13:30:18 -0400
X-MC-Unique: MXe1EEm7Mfa3HjOWb7XtVw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B098101F7B0
 for <qemu-devel@nongnu.org>; Wed,  3 Nov 2021 17:30:17 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE98A68D7D;
 Wed,  3 Nov 2021 17:30:15 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 02/12] qom: Create object_configure()
Date: Wed,  3 Nov 2021 18:29:52 +0100
Message-Id: <20211103173002.209906-3-kwolf@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This renames object_set_properties_from_qdict() to object_configure()
and removes the QDict parameter from it: With visit_next_struct_member()
it can set all properties without looking at the keys of the QDict.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qom/object_interfaces.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 3b61c195c5..f9f5608194 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -42,16 +42,15 @@ bool user_creatable_can_be_deleted(UserCreatable *uc)
     }
 }
 
-static void object_set_properties_from_qdict(Object *obj, const QDict *qdict,
-                                             Visitor *v, Error **errp)
+static void object_configure(Object *obj, Visitor *v, Error **errp)
 {
-    const QDictEntry *e;
+    const char *key;
 
     if (!visit_start_struct(v, NULL, NULL, 0, errp)) {
         return;
     }
-    for (e = qdict_first(qdict); e; e = qdict_next(qdict, e)) {
-        if (!object_property_set(obj, e->key, v, errp)) {
+    while ((key = visit_next_struct_member(v))) {
+        if (!object_property_set(obj, key, v, errp)) {
             goto out;
         }
     }
@@ -69,7 +68,7 @@ void object_set_properties_from_keyval(Object *obj, const QDict *qdict,
     } else {
         v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
     }
-    object_set_properties_from_qdict(obj, qdict, v, errp);
+    object_configure(obj, v, errp);
     visit_free(v);
 }
 
@@ -108,7 +107,7 @@ Object *user_creatable_add_type(const char *type, const char *id,
 
     assert(qdict);
     obj = object_new(type);
-    object_set_properties_from_qdict(obj, qdict, v, &local_err);
+    object_configure(obj, v, &local_err);
     if (local_err) {
         goto out;
     }
-- 
2.31.1


