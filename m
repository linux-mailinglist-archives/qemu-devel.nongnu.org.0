Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2C5264D1D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 20:34:48 +0200 (CEST)
Received: from localhost ([::1]:50500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGRPD-000279-Tx
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 14:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kGRCU-0005Ll-U9
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 14:21:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kGRCH-00032a-C3
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 14:21:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599762082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TzJ0fBUbaOGpIRJlrVvOmS3lXKZBwJYdPPskPKJO3e8=;
 b=hEwAPNbq4jTXdt81EvgdfJU7kENMtN4seqEiPjlI2Z3y5VgrAFquziUfwnA6AJTTGnjWSl
 w15ZJl+6ukxsZwlhMMpXGxeC99u3Wftr6mblKzCl9TA2ktT8hGtmni4Itv0SXrWhyDsq/7
 SsIObF47ZWu/C+wZkgmXbWomY4j0gQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-bSXDKS7VNiuAq1EiY75NbQ-1; Thu, 10 Sep 2020 14:21:20 -0400
X-MC-Unique: bSXDKS7VNiuAq1EiY75NbQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C93B21882FC1;
 Thu, 10 Sep 2020 18:21:19 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D5A57EB7A;
 Thu, 10 Sep 2020 18:21:19 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 05/33] qom: DECLARE_*_CHECKERS macros
Date: Thu, 10 Sep 2020 14:20:44 -0400
Message-Id: <20200910182112.4030917-6-ehabkost@redhat.com>
In-Reply-To: <20200910182112.4030917-1-ehabkost@redhat.com>
References: <20200910182112.4030917-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 09:16:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sometimes the typedefs are buried inside another header, but
we want to benefit from the automatic definition of type cast
functions.  Introduce macros that will let type checkers be
defined when typedefs are already available.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20200831210740.126168-5-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
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


