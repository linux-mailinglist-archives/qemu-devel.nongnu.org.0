Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B369724AC37
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 02:32:17 +0200 (CEST)
Received: from localhost ([::1]:35954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8YV6-0005sd-Ow
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 20:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YDw-0008Lr-CT
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:14:32 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59637
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YDu-0002Vk-JO
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597882469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9CaQ0XPUYHXmeyBGz11bbynQ/Eo1tr5PbOtyfN1oL1Y=;
 b=CQqyXcQ/eIuxJim8uiD9B6RT70P+JSqBaj50XqJrMP2WBFSI/Di1Pk03kDRqTn7TsON91v
 D65nQwl5RUwecuEim7Ao6bLzz9r7iFX3g45Yl2+PMPuY38NVdHtUD+dFEEeql/o10HqLwa
 dD+JmCAqnZ8RNQl0KjjXq7WF0scF3DI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-_WlhpRPaO2iBXx0Suf-JpQ-1; Wed, 19 Aug 2020 20:14:25 -0400
X-MC-Unique: _WlhpRPaO2iBXx0Suf-JpQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCFCD186A568
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 00:14:24 +0000 (UTC)
Received: from localhost (ovpn-117-244.rdu2.redhat.com [10.10.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A50416D4B;
 Thu, 20 Aug 2020 00:14:24 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 46/58] qom: DECLARE_*_CHECKERS macros
Date: Wed, 19 Aug 2020 20:12:24 -0400
Message-Id: <20200820001236.1284548-47-ehabkost@redhat.com>
In-Reply-To: <20200820001236.1284548-1-ehabkost@redhat.com>
References: <20200820001236.1284548-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 18:27:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sometimes the typedefs are buried inside another header, but
we want to benefit from the automatic definition of type cast
functions.  Introduce macros that will let type checkers be
defined when typedefs are already available.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v1 -> v2: none
---
 include/qom/object.h | 72 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 58 insertions(+), 14 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 500e7dfa99..4cd84998c2 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -553,6 +553,62 @@ struct Object
     Object *parent;
 };
 
+/**
+ * DECLARE_INSTANCE_CHECKER:
+ * @InstanceType: instance struct name
+ * @OBJ_NAME: the object name in uppercase with underscore separators
+ * @TYPENAME: type name
+ *
+ * Direct usage of this macro should be avoided, and the complete
+ * OBJECT_DECLARE_TYPE macro is recommended instead.
+ *
+ * This macro will provide the three standard type cast functions for a
+ * QOM type.
+ */
+#define DECLARE_INSTANCE_CHECKER(InstanceType, OBJ_NAME, TYPENAME) \
+    static inline G_GNUC_UNUSED InstanceType * \
+    OBJ_NAME(void *obj) \
+    { return OBJECT_CHECK(InstanceType, obj, TYPENAME); }
+
+/**
+ * DECLARE_CLASS_CHECKERS:
+ * @ClassType: class struct name
+ * @OBJ_NAME: the object name in uppercase with underscore separators
+ * @TYPENAME: type name
+ *
+ * Direct usage of this macro should be avoided, and the complete
+ * OBJECT_DECLARE_TYPE macro is recommended instead.
+ *
+ * This macro will provide the three standard type cast functions for a
+ * QOM type.
+ */
+#define DECLARE_CLASS_CHECKERS(ClassType, OBJ_NAME, TYPENAME) \
+    static inline G_GNUC_UNUSED ClassType * \
+    OBJ_NAME##_GET_CLASS(void *obj) \
+    { return OBJECT_GET_CLASS(ClassType, obj, TYPENAME); } \
+    \
+    static inline G_GNUC_UNUSED ClassType * \
+    OBJ_NAME##_CLASS(void *klass) \
+    { return OBJECT_CLASS_CHECK(ClassType, klass, TYPENAME); }
+
+/**
+ * DECLARE_OBJ_CHECKERS:
+ * @InstanceType: instance struct name
+ * @ClassType: class struct name
+ * @OBJ_NAME: the object name in uppercase with underscore separators
+ * @TYPENAME: type name
+ *
+ * Direct usage of this macro should be avoided, and the complete
+ * OBJECT_DECLARE_TYPE macro is recommended instead.
+ *
+ * This macro will provide the three standard type cast functions for a
+ * QOM type.
+ */
+#define DECLARE_OBJ_CHECKERS(InstanceType, ClassType, OBJ_NAME, TYPENAME) \
+    DECLARE_INSTANCE_CHECKER(InstanceType, OBJ_NAME, TYPENAME) \
+    \
+    DECLARE_CLASS_CHECKERS(ClassType, OBJ_NAME, TYPENAME)
+
 /**
  * OBJECT_DECLARE_TYPE:
  * @InstanceType: instance struct name
@@ -574,20 +630,8 @@ struct Object
     \
     G_DEFINE_AUTOPTR_CLEANUP_FUNC(InstanceType, object_unref) \
     \
-    static inline G_GNUC_UNUSED ClassType * \
-    MODULE_OBJ_NAME##_GET_CLASS(void *obj) \
-    { return OBJECT_GET_CLASS(ClassType, obj, \
-                              TYPE_##MODULE_OBJ_NAME); } \
-    \
-    static inline G_GNUC_UNUSED ClassType * \
-    MODULE_OBJ_NAME##_CLASS(void *klass) \
-    { return OBJECT_CLASS_CHECK(ClassType, klass, \
-                                TYPE_##MODULE_OBJ_NAME); } \
-    \
-    static inline G_GNUC_UNUSED InstanceType * \
-    MODULE_OBJ_NAME(void *obj) \
-    { return OBJECT_CHECK(InstanceType, obj, \
-                          TYPE_##MODULE_OBJ_NAME); }
+    DECLARE_OBJ_CHECKERS(InstanceType, ClassType, \
+                         MODULE_OBJ_NAME, TYPE_##MODULE_OBJ_NAME)
 
 /**
  * OBJECT_DECLARE_SIMPLE_TYPE:
-- 
2.26.2


