Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AD0416E87
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:08:52 +0200 (CEST)
Received: from localhost ([::1]:35356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThCN-0006rE-N0
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mTh8g-00038x-5L
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:05:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mTh8e-0002LP-Ea
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:05:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632474299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WVZZuZu4LsfvcVGJuILGBV61qwCzXv4Jk2+5G7mxNqM=;
 b=GM685lBJvI62oWopRfJI48U/9qOe/FY0EjCSZL8euMfLmnAnQy+eia8kHYu1TmKr4PthYw
 tn1yNs4w2olil5PYX0fpd2EyAdBipkaxNnsf/16IAdJOOUdm5rGl6OWqnkdiB70UC7wwhs
 nLlmjWtDjT6S8rFspxp8+ejxJK4Kfi4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-_fp_qkgBONK4UPnYMzo-ng-1; Fri, 24 Sep 2021 05:04:56 -0400
X-MC-Unique: _fp_qkgBONK4UPnYMzo-ng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2FD61006AA3;
 Fri, 24 Sep 2021 09:04:55 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F06A55D9DD;
 Fri, 24 Sep 2021 09:04:53 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/11] qom: Reduce use of error_propagate()
Date: Fri, 24 Sep 2021 11:04:17 +0200
Message-Id: <20210924090427.9218-2-kwolf@redhat.com>
In-Reply-To: <20210924090427.9218-1-kwolf@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 armbru@redhat.com, its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ERRP_GUARD() makes debugging easier by making sure that &error_abort
still fails at the real origin of the error instead of
error_propagate().

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qom/object.c            |  7 +++----
 qom/object_interfaces.c | 17 ++++++-----------
 2 files changed, 9 insertions(+), 15 deletions(-)

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
index ad9b56b59a..80691e88cd 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -45,26 +45,21 @@ bool user_creatable_can_be_deleted(UserCreatable *uc)
 static void object_set_properties_from_qdict(Object *obj, const QDict *qdict,
                                              Visitor *v, Error **errp)
 {
+    ERRP_GUARD();
     const QDictEntry *e;
-    Error *local_err = NULL;
 
-    if (!visit_start_struct(v, NULL, NULL, 0, &local_err)) {
-        goto out;
+    if (!visit_start_struct(v, NULL, NULL, 0, errp)) {
+        return;
     }
     for (e = qdict_first(qdict); e; e = qdict_next(qdict, e)) {
-        if (!object_property_set(obj, e->key, v, &local_err)) {
+        if (!object_property_set(obj, e->key, v, errp)) {
             break;
         }
     }
-    if (!local_err) {
-        visit_check_struct(v, &local_err);
+    if (!*errp) {
+        visit_check_struct(v, errp);
     }
     visit_end_struct(v, NULL);
-
-out:
-    if (local_err) {
-        error_propagate(errp, local_err);
-    }
 }
 
 void object_set_properties_from_keyval(Object *obj, const QDict *qdict,
-- 
2.31.1


