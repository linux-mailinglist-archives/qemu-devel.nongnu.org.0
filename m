Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 566CD2A697C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 17:26:00 +0100 (CET)
Received: from localhost ([::1]:47950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaLbj-00036P-Cz
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 11:25:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kaLFY-0003CF-2U
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 11:03:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kaLFQ-0005fZ-1l
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 11:03:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604505775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1pPtsj17WK0T2HWsQv/1IZ7T7/vtbpEeIIfqQsiTes8=;
 b=Ehx7FXtqGyYGSfoiZdXjD8E55qMrdI1BfGYpXnVfUrzgnxarsh/SOSVhUkK1/Mxt/AMVO0
 npFWrVzkib2+hvvNva9mCBQqHs+z5MTznEbM8onHc3yynVqRTPgFTWaHYLMGXJLb+GdL+R
 ZxqoooZ5wOLVUZiwQIGCSOt0OYDZqCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-7SmlzCMbMSmFetex76pCEA-1; Wed, 04 Nov 2020 11:02:53 -0500
X-MC-Unique: 7SmlzCMbMSmFetex76pCEA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08729CE673;
 Wed,  4 Nov 2020 16:01:52 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BAE8F6EF74;
 Wed,  4 Nov 2020 16:01:50 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/44] qdev: Make qdev_class_add_property() more flexible
Date: Wed,  4 Nov 2020 11:00:01 -0500
Message-Id: <20201104160021.2342108-25-ehabkost@redhat.com>
In-Reply-To: <20201104160021.2342108-1-ehabkost@redhat.com>
References: <20201104160021.2342108-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Support Property.set_default and PropertyInfo.description even if
PropertyInfo.create is set.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v1 -> v2:
* Patch redone after changes in the previous patches in the
  series
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 hw/core/qdev-properties.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 510b3f3fb5..a5d5d74f32 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -863,24 +863,25 @@ static void qdev_class_add_property(DeviceClass *klass, const char *name,
                                     Property *prop)
 {
     ObjectClass *oc = OBJECT_CLASS(klass);
+    ObjectProperty *op;
 
     if (prop->info->create) {
-        prop->info->create(oc, name, prop);
+        op = prop->info->create(oc, name, prop);
     } else {
-        ObjectProperty *op;
-
         op = object_class_property_add(oc,
                                        name, prop->info->name,
                                        field_prop_getter(prop->info),
                                        field_prop_setter(prop->info),
                                        prop->info->release,
                                        prop);
-        if (prop->set_default) {
-            prop->info->set_default_value(op, prop);
-        }
     }
-    object_class_property_set_description(oc, name,
-                                          prop->info->description);
+    if (prop->set_default) {
+        prop->info->set_default_value(op, prop);
+    }
+    if (prop->info->description) {
+        object_class_property_set_description(oc, name,
+                                              prop->info->description);
+    }
 }
 
 /**
-- 
2.28.0


