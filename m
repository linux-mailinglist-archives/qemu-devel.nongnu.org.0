Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89656444752
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:38:13 +0100 (CET)
Received: from localhost ([::1]:55648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miKDE-00080K-Ln
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miK5l-0000uq-Pe
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:30:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miK5k-0001PV-94
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:30:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635960627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VLRZYfvGfxA/IHhwB3u7yy3Z7nW8bMr/gA0BMGHDRoM=;
 b=HhTWtKve5TElRcljgGLUEUSVfPPghKt6D1S0ha7O2XgV2WLg52smdvlCpvX0zSrKdL0Ygv
 pLHIGyXi5KNDEfJ9Au3VQEBlnJ+QchDgzT+s6eN8RO1EgZoIg9CKLp3aZn1xFFPk151iee
 AqYQ0ran2AA3xe2/BMLBIbFiJkCkUxw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-yo5EqnhBMFqYw6Vs8hK4Ag-1; Wed, 03 Nov 2021 13:30:26 -0400
X-MC-Unique: yo5EqnhBMFqYw6Vs8hK4Ag-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD4CF81CB08
 for <qemu-devel@nongnu.org>; Wed,  3 Nov 2021 17:30:20 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C12C77E26;
 Wed,  3 Nov 2021 17:30:19 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 04/12] qom: Add instance_config() to TypeInfo
Date: Wed,  3 Nov 2021 18:29:54 +0100
Message-Id: <20211103173002.209906-5-kwolf@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Instead of providing the whole configuration through property setters,
object_config() can now use the instance_config() callback. Options that
are not consumed by the callback (e.g. because they belong to a parent
class that hasn't been converted to the new callback yet) are still set
as properties.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qom/object.h |  4 ++++
 qom/object.c         | 15 +++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/qom/object.h b/include/qom/object.h
index d67ba2411d..e60cacb54b 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -384,6 +384,9 @@ struct Object
  *   for initializing its own members.
  * @instance_post_init: This function is called to finish initialization of
  *   an object, after all @instance_init functions were called.
+ * @instance_config: This function is called to set the initial configuration
+ *   of an object.  If not provided, configuration is done through property
+ *   setters.
  * @instance_finalize: This function is called during object destruction.  This
  *   is called before the parent @instance_finalize function has been called.
  *   An object should only free the members that are unique to its type in this
@@ -419,6 +422,7 @@ struct TypeInfo
     size_t instance_align;
     void (*instance_init)(Object *obj);
     void (*instance_post_init)(Object *obj);
+    bool (*instance_config)(Object *obj, Visitor *v, Error **errp);
     void (*instance_finalize)(Object *obj);
 
     bool abstract;
diff --git a/qom/object.c b/qom/object.c
index d8da362987..6cacfa9ab1 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -60,6 +60,7 @@ struct TypeImpl
 
     void (*instance_init)(Object *obj);
     void (*instance_post_init)(Object *obj);
+    bool (*instance_config)(Object *obj, Visitor *v, Error **errp);
     void (*instance_finalize)(Object *obj);
 
     bool abstract;
@@ -124,6 +125,7 @@ static TypeImpl *type_new(const TypeInfo *info)
 
     ti->instance_init = info->instance_init;
     ti->instance_post_init = info->instance_post_init;
+    ti->instance_config = info->instance_config;
     ti->instance_finalize = info->instance_finalize;
 
     ti->abstract = info->abstract;
@@ -303,6 +305,7 @@ static void type_initialize(TypeImpl *ti)
         assert(ti->abstract);
         assert(!ti->instance_init);
         assert(!ti->instance_post_init);
+        assert(!ti->instance_config);
         assert(!ti->instance_finalize);
         assert(!ti->num_interfaces);
     }
@@ -607,11 +610,23 @@ void object_initialize_child_internal(Object *parent,
 
 void object_configure(Object *obj, Visitor *v, Error **errp)
 {
+    TypeImpl *ti;
     const char *key;
 
     if (!visit_start_struct(v, NULL, NULL, 0, errp)) {
         return;
     }
+
+    /* Call .instance_config, including for all parent classes */
+    for (ti = obj->class->type; ti; ti = ti->parent_type) {
+        if (ti->instance_config) {
+            if (!ti->instance_config(obj, v, errp)) {
+                goto out;
+            }
+        }
+    }
+
+    /* Set options not consumed by .instance_config as properties */
     while ((key = visit_next_struct_member(v))) {
         if (!object_property_set(obj, key, v, errp)) {
             goto out;
-- 
2.31.1


