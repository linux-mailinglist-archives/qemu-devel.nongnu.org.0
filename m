Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362DD24AC4B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 02:36:50 +0200 (CEST)
Received: from localhost ([::1]:57750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8YZV-0006Zt-6Y
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 20:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YDs-0008BU-Q6
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:14:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43289
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YDq-0002VC-WA
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:14:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597882466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QRsaQFaoe+t2P1m4KInI0JnBkK8MvTc0IlI/ubz5FHA=;
 b=IegAwV/BVg8Flv6fu+6y7PGzRu4K9RyoqOdAnFZ5dn9JnJ4eQiBOxZlMpFxmSrngw1S0se
 s4Gsc4GFgxdvJoxQ+YDB/5L7ofBlv/jLJzFD3zeTSIPAkfV5C/WMw7bHEg7qZwUPaKyRsl
 rSOfgOOARtDSq/RQZSjhnN3GLQt9/LY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-Jt6NlNmfPaep0xoY51Sytw-1; Wed, 19 Aug 2020 20:14:24 -0400
X-MC-Unique: Jt6NlNmfPaep0xoY51Sytw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2E401084C91
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 00:14:23 +0000 (UTC)
Received: from localhost (ovpn-117-244.rdu2.redhat.com [10.10.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66797709DC;
 Thu, 20 Aug 2020 00:14:23 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 45/58] qom: Allow class type name to be specified in
 OBJECT_DECLARE*
Date: Wed, 19 Aug 2020 20:12:23 -0400
Message-Id: <20200820001236.1284548-46-ehabkost@redhat.com>
In-Reply-To: <20200820001236.1284548-1-ehabkost@redhat.com>
References: <20200820001236.1284548-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 23:05:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Many QOM types don't follow the Type/TypeClass pattern
on the instance/struct names.  Let the class struct name
be specified in the OBJECT_DECLARE* macros.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v1 -> v2: none
---
 include/qom/object.h | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index f515230f61..500e7dfa99 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -555,7 +555,8 @@ struct Object
 
 /**
  * OBJECT_DECLARE_TYPE:
- * @ModuleObjName: the object name with initial capitalization
+ * @InstanceType: instance struct name
+ * @ClassType: class struct name
  * @module_obj_name: the object name in lowercase with underscore separators
  * @MODULE_OBJ_NAME: the object name in uppercase with underscore separators
  *
@@ -567,33 +568,33 @@ struct Object
  *
  * The object struct and class struct need to be declared manually.
  */
-#define OBJECT_DECLARE_TYPE(ModuleObjName, module_obj_name, MODULE_OBJ_NAME) \
-    typedef struct ModuleObjName ModuleObjName; \
-    typedef struct ModuleObjName##Class ModuleObjName##Class; \
+#define OBJECT_DECLARE_TYPE(InstanceType, ClassType, module_obj_name, MODULE_OBJ_NAME) \
+    typedef struct InstanceType InstanceType; \
+    typedef struct ClassType ClassType; \
     \
-    G_DEFINE_AUTOPTR_CLEANUP_FUNC(ModuleObjName, object_unref) \
+    G_DEFINE_AUTOPTR_CLEANUP_FUNC(InstanceType, object_unref) \
     \
-    static inline G_GNUC_UNUSED ModuleObjName##Class * \
+    static inline G_GNUC_UNUSED ClassType * \
     MODULE_OBJ_NAME##_GET_CLASS(void *obj) \
-    { return OBJECT_GET_CLASS(ModuleObjName##Class, obj, \
+    { return OBJECT_GET_CLASS(ClassType, obj, \
                               TYPE_##MODULE_OBJ_NAME); } \
     \
-    static inline G_GNUC_UNUSED ModuleObjName##Class * \
+    static inline G_GNUC_UNUSED ClassType * \
     MODULE_OBJ_NAME##_CLASS(void *klass) \
-    { return OBJECT_CLASS_CHECK(ModuleObjName##Class, klass, \
+    { return OBJECT_CLASS_CHECK(ClassType, klass, \
                                 TYPE_##MODULE_OBJ_NAME); } \
     \
-    static inline G_GNUC_UNUSED ModuleObjName * \
+    static inline G_GNUC_UNUSED InstanceType * \
     MODULE_OBJ_NAME(void *obj) \
-    { return OBJECT_CHECK(ModuleObjName, obj, \
+    { return OBJECT_CHECK(InstanceType, obj, \
                           TYPE_##MODULE_OBJ_NAME); }
 
 /**
  * OBJECT_DECLARE_SIMPLE_TYPE:
- * @ModuleObjName: the object name with initial caps
+ * @InstanceType: instance struct name
  * @module_obj_name: the object name in lowercase with underscore separators
  * @MODULE_OBJ_NAME: the object name in uppercase with underscore separators
- * @ParentModuleObjName: the parent object name with initial caps
+ * @ParentClassType: class struct name of parent type
  *
  * This does the same as OBJECT_DECLARE_TYPE(), but also declares
  * the class struct, thus only the object struct needs to be declare
@@ -602,10 +603,10 @@ struct Object
  * This macro should be used unless the class struct needs to have
  * virtual methods declared.
  */
-#define OBJECT_DECLARE_SIMPLE_TYPE(ModuleObjName, module_obj_name, \
-                                   MODULE_OBJ_NAME, ParentModuleObjName) \
-    OBJECT_DECLARE_TYPE(ModuleObjName, module_obj_name, MODULE_OBJ_NAME) \
-    struct ModuleObjName##Class { ParentModuleObjName##Class parent_class; };
+#define OBJECT_DECLARE_SIMPLE_TYPE(InstanceType, module_obj_name, \
+                                   MODULE_OBJ_NAME, ParentClassType) \
+    OBJECT_DECLARE_TYPE(InstanceType, InstanceType##Class, module_obj_name, MODULE_OBJ_NAME) \
+    struct InstanceType##Class { ParentClassType parent_class; };
 
 
 /**
-- 
2.26.2


