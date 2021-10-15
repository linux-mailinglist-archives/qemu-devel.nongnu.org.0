Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 255EB42F664
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 16:56:38 +0200 (CEST)
Received: from localhost ([::1]:34204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbOdR-0004ez-7l
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 10:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mbOVg-0008K2-9d
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:48:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mbOVd-0001b4-Kq
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:48:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634309313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jETLExX/KlwbGKb0oiq5Jhb3MYL7dfs4+1KQZ2CDtT8=;
 b=STo5CZU4GqgURZ5Kg7bgsFHTiJNpQ2teZDuJDbQ/KwpGHg4VGLKe+/NSNl92hc+Lbu5Fxs
 ZNkWi2P5rCgt+OoqjIcauKQjKsWN2sIILVSn+3SRprHoxN5RiKW6b3KT537gIzl2ZfTVk7
 7NdMg1OoEOW2w12dL762X/DHov7lHH4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-NcPOHR8aPYaLSMGrbfKm7g-1; Fri, 15 Oct 2021 10:48:31 -0400
X-MC-Unique: NcPOHR8aPYaLSMGrbfKm7g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E132A802C94
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 14:48:30 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 692D219736;
 Fri, 15 Oct 2021 14:48:28 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/15] qom: Reduce use of error_propagate()
Date: Fri, 15 Oct 2021 16:46:29 +0200
Message-Id: <20211015144640.198044-5-kwolf@redhat.com>
In-Reply-To: <20211015144640.198044-1-kwolf@redhat.com>
References: <20211015144640.198044-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: kwolf@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ERRP_GUARD() makes debugging easier by making sure that &error_abort
still fails at the real origin of the error instead of
error_propagate().

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20211008133442.141332-5-kwolf@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Peter Krempa <pkrempa@redhat.com>
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


