Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E19D29F775
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 23:10:49 +0100 (CET)
Received: from localhost ([::1]:44526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYG88-0003Eh-4q
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 18:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kYG0w-0003J6-K2
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 18:03:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kYG0t-0006Z9-OV
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 18:03:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604008999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LpDzRbGp+X0AUeOTs55yreUOPmoQmnXD3CBAv6zEhzs=;
 b=HI73mROL7LH7dfrp0CDX0Vrjes+h0kvnZpJ+7aFVnQnpWp4KvknwAGH7TMavOuQ/y5uxh9
 o55hfM1b82vi2VObF5yMQcY79i6YAaYv0KJi0itCGxonk0r28Ueb3a0U9GWyXlvZDx1o+L
 aOjlAfjnWoMLFg8xywM64x2V8nf5Cbs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-Z1yBe7UVPzmRnaoHJATxqw-1; Thu, 29 Oct 2020 18:03:15 -0400
X-MC-Unique: Z1yBe7UVPzmRnaoHJATxqw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAB4E18BA281
 for <qemu-devel@nongnu.org>; Thu, 29 Oct 2020 22:03:14 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B68C5D9D3;
 Thu, 29 Oct 2020 22:03:14 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/36] qdev: Make qdev_find_global_prop() get Object* argument
Date: Thu, 29 Oct 2020 18:02:20 -0400
Message-Id: <20201029220246.472693-11-ehabkost@redhat.com>
In-Reply-To: <20201029220246.472693-1-ehabkost@redhat.com>
References: <20201029220246.472693-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 00:47:54
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
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the code more generic and not specific to TYPE_DEVICE.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 include/hw/qdev-properties.h     | 2 +-
 hw/core/qdev-properties-system.c | 2 +-
 hw/core/qdev-properties.c        | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 0b92cfc761..7620095fed 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -305,7 +305,7 @@ void qdev_prop_set_enum(DeviceState *dev, const char *name, int value);
 void *qdev_get_prop_ptr(Object *obj, Property *prop);
 
 void qdev_prop_register_global(GlobalProperty *prop);
-const GlobalProperty *qdev_find_global_prop(DeviceState *dev,
+const GlobalProperty *qdev_find_global_prop(Object *obj,
                                             const char *name);
 int qdev_prop_check_globals(void);
 void qdev_prop_set_globals(DeviceState *dev);
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index c8c73c371b..af1339e562 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -36,7 +36,7 @@ static bool check_prop_still_unset(DeviceState *dev, const char *name,
                                    const void *old_val, const char *new_val,
                                    Error **errp)
 {
-    const GlobalProperty *prop = qdev_find_global_prop(dev, name);
+    const GlobalProperty *prop = qdev_find_global_prop(OBJECT(dev), name);
 
     if (!old_val) {
         return true;
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 0a54a922c8..41482d83d1 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -818,7 +818,7 @@ void qdev_prop_register_global(GlobalProperty *prop)
     g_ptr_array_add(global_props(), prop);
 }
 
-const GlobalProperty *qdev_find_global_prop(DeviceState *dev,
+const GlobalProperty *qdev_find_global_prop(Object *obj,
                                             const char *name)
 {
     GPtrArray *props = global_props();
@@ -827,7 +827,7 @@ const GlobalProperty *qdev_find_global_prop(DeviceState *dev,
 
     for (i = 0; i < props->len; i++) {
         p = g_ptr_array_index(props, i);
-        if (object_dynamic_cast(OBJECT(dev), p->driver)
+        if (object_dynamic_cast(obj, p->driver)
             && !strcmp(p->property, name)) {
             return p;
         }
-- 
2.28.0


