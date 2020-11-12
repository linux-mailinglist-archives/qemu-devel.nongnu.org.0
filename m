Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DABA2B115F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 23:23:14 +0100 (CET)
Received: from localhost ([::1]:42118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdKzp-0007VZ-1g
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 17:23:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKQr-0007wt-LY
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:47:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKQp-0003gS-Ov
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:47:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605217621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ja/YmWt/OMSFvhSVMA3UOQ10xojvR9RvVHDVddUDRaY=;
 b=aHd30YwuJfPw4TuBuqsQeDIbFu/ZYmd5SR2f0bINOk9HIEFPoLktwRg3eAwtgQAR0FzsD5
 svn9ojTLflsqV42u1psX192LYrnwpjCjWDdvoB95rBS48zXLn0uzQ7guSEU0Z0jmRLg9Po
 46Jlfsmnm7aBnrpn8O0KjVRtKgWwnDs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-NoCWWUqNOCWnU2OuJdpIXw-1; Thu, 12 Nov 2020 16:46:59 -0500
X-MC-Unique: NoCWWUqNOCWnU2OuJdpIXw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 764B7184217D;
 Thu, 12 Nov 2020 21:46:58 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D2D85B4C2;
 Thu, 12 Nov 2020 21:46:57 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 43/53] qdev: Move static_prop_release_dynamic_prop() closer
 to its usage
Date: Thu, 12 Nov 2020 16:43:40 -0500
Message-Id: <20201112214350.872250-44-ehabkost@redhat.com>
In-Reply-To: <20201112214350.872250-1-ehabkost@redhat.com>
References: <20201112214350.872250-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the function closer to where it's used, to make refactor
and review simpler.  While doing it, reformat the comment at the
top to follow coding style.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This is a new patch added in v3 of the series.
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 hw/core/qdev-properties.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 83fd45add0..7aa5d2ff45 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -521,20 +521,6 @@ const PropertyInfo prop_info_size32 = {
 
 /* --- support for array properties --- */
 
-/* object property release callback for dynamically-created properties:
- * we call the underlying element's property release hook, and
- * then free the memory we allocated when we added the property.
- */
-static void static_prop_release_dynamic_prop(Object *obj, const char *name,
-                                             void *opaque)
-{
-    Property *prop = opaque;
-    if (prop->info->release) {
-        prop->info->release(obj, name, opaque);
-    }
-    g_free(prop);
-}
-
 static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
                               void *opaque, Error **errp)
 {
@@ -816,6 +802,21 @@ const PropertyInfo prop_info_link = {
     .create = create_link_property,
 };
 
+/*
+ * Property release callback for dynamically-created properties:
+ * We call the underlying element's property release hook, and
+ * then free the memory we allocated when we added the property.
+ */
+static void static_prop_release_dynamic_prop(Object *obj, const char *name,
+                                             void *opaque)
+{
+    Property *prop = opaque;
+    if (prop->info->release) {
+        prop->info->release(obj, name, opaque);
+    }
+    g_free(prop);
+}
+
 ObjectProperty *
 object_property_add_field(Object *obj, const char *name,
                           Property *prop,
-- 
2.28.0


