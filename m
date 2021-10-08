Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B2F426BD9
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 15:43:07 +0200 (CEST)
Received: from localhost ([::1]:55310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYq9S-0002Xm-Q6
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 09:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYq39-0001Js-Az
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 09:36:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYq36-0000zy-BH
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 09:36:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633700191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w5sg7f6+OmuKDzIa9SxGs26gbCo2T8TfgXfAXwoG/7w=;
 b=E/ke0IpZC2mCNP24Fyr7Y+lC7A+DXOwuqqMVbY5kUXMZ/0nha6b6VaPdmx6KpRnMOswIFu
 fGImFms1D2pbFz5LqYVblaPpBMfA8IBsIE7K+wC7I/6d3jy6Wean08LCk+FUHHegBKG7KA
 XFNKlba1lvuJ0CPOoLWj6u+HPrJuQrU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-CnBuT0CYNqaViZfaERmI3A-1; Fri, 08 Oct 2021 09:36:30 -0400
X-MC-Unique: CnBuT0CYNqaViZfaERmI3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54D5394D1BD;
 Fri,  8 Oct 2021 13:35:15 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DBC4196E2;
 Fri,  8 Oct 2021 13:35:12 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/15] qom: Reduce use of error_propagate()
Date: Fri,  8 Oct 2021 15:34:31 +0200
Message-Id: <20211008133442.141332-5-kwolf@redhat.com>
In-Reply-To: <20211008133442.141332-1-kwolf@redhat.com>
References: <20211008133442.141332-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, damien.hedde@greensocs.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, libvir-list@redhat.com, jasowang@redhat.com,
 quintela@redhat.com, armbru@redhat.com, vsementsov@virtuozzo.com,
 lvivier@redhat.com, its@irrelevant.dk, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ERRP_GUARD() makes debugging easier by making sure that &error_abort
still fails at the real origin of the error instead of
error_propagate().

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qom/object.c            |  7 +++----
 qom/object_interfaces.c | 19 ++++++-------------
 2 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index e86cb05b84..6be710bc40 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1389,7 +1389,7 @@ bool object_property_get(Object *obj, const char *name, Visitor *v,
 bool object_property_set(Object *obj, const char *name, Visitor *v,
                          Error **errp)
 {
-    Error *err = NULL;
+    ERRP_GUARD();
     ObjectProperty *prop = object_property_find_err(obj, name, errp);
 
     if (prop == NULL) {
@@ -1400,9 +1400,8 @@ bool object_property_set(Object *obj, const char *name, Visitor *v,
         error_setg(errp, QERR_PERMISSION_DENIED);
         return false;
     }
-    prop->set(obj, v, name, prop->opaque, &err);
-    error_propagate(errp, err);
-    return !err;
+    prop->set(obj, v, name, prop->opaque, errp);
+    return !*errp;
 }
 
 bool object_property_set_str(Object *obj, const char *name,
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index ad9b56b59a..3b61c195c5 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -46,25 +46,18 @@ static void object_set_properties_from_qdict(Object *obj, const QDict *qdict,
                                              Visitor *v, Error **errp)
 {
     const QDictEntry *e;
-    Error *local_err = NULL;
 
-    if (!visit_start_struct(v, NULL, NULL, 0, &local_err)) {
-        goto out;
+    if (!visit_start_struct(v, NULL, NULL, 0, errp)) {
+        return;
     }
     for (e = qdict_first(qdict); e; e = qdict_next(qdict, e)) {
-        if (!object_property_set(obj, e->key, v, &local_err)) {
-            break;
+        if (!object_property_set(obj, e->key, v, errp)) {
+            goto out;
         }
     }
-    if (!local_err) {
-        visit_check_struct(v, &local_err);
-    }
-    visit_end_struct(v, NULL);
-
+    visit_check_struct(v, errp);
 out:
-    if (local_err) {
-        error_propagate(errp, local_err);
-    }
+    visit_end_struct(v, NULL);
 }
 
 void object_set_properties_from_keyval(Object *obj, const QDict *qdict,
-- 
2.31.1


