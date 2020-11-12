Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C142B10BC
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 22:55:57 +0100 (CET)
Received: from localhost ([::1]:55748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdKZQ-00023p-DS
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 16:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKPW-0006VL-RZ
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:45:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKPU-0003WS-Q0
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:45:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605217540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rb9UJYi+UKMATl2563f+p9C77Lv2uescfU3uEmkQXTg=;
 b=ebXe0M5tjCGn2RSBX7RA+kq0iSEACI7UQVCheMp2TrVNMF9iC1rw4qzJd3PivZpGPYYC0K
 OP99RiXqhMJuZU9om7X5dqlBW+dQiOfPkHffilWfxrEFqjbKhDfSJJsJ7iyjMwHBPCae9j
 7mC1+TSQaU9YRIfC7bDFT9IT9LBkfyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-TeJ1FDhdORy49sKMBVoVWQ-1; Thu, 12 Nov 2020 16:45:38 -0500
X-MC-Unique: TeJ1FDhdORy49sKMBVoVWQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 847A1107B467;
 Thu, 12 Nov 2020 21:45:37 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 656915C1C2;
 Thu, 12 Nov 2020 21:45:34 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/53] qdev: Add name argument to PropertyInfo.create method
Date: Thu, 12 Nov 2020 16:43:18 -0500
Message-Id: <20201112214350.872250-22-ehabkost@redhat.com>
In-Reply-To: <20201112214350.872250-1-ehabkost@redhat.com>
References: <20201112214350.872250-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

This will make it easier to remove the Property.name field in the
future.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This is a new patch added in series v2
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 include/hw/qdev-properties.h | 2 +-
 hw/core/qdev-properties.c    | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 476737b9da..ab9c538ba4 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -34,7 +34,7 @@ struct PropertyInfo {
     const QEnumLookup *enum_table;
     int (*print)(Object *obj, Property *prop, char *dest, size_t len);
     void (*set_default_value)(ObjectProperty *op, const Property *prop);
-    void (*create)(ObjectClass *oc, Property *prop);
+    void (*create)(ObjectClass *oc, const char *name, Property *prop);
     ObjectPropertyAccessor *get;
     ObjectPropertyAccessor *set;
     ObjectPropertyRelease *release;
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 457c7fe4ba..c68a20695d 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -851,9 +851,10 @@ const PropertyInfo qdev_prop_size = {
 
 /* --- object link property --- */
 
-static void create_link_property(ObjectClass *oc, Property *prop)
+static void create_link_property(ObjectClass *oc, const char *name,
+                                 Property *prop)
 {
-    object_class_property_add_link(oc, prop->name, prop->link_type,
+    object_class_property_add_link(oc, name, prop->link_type,
                                    prop->offset,
                                    qdev_prop_allow_set_link_before_realize,
                                    OBJ_PROP_LINK_STRONG);
@@ -893,7 +894,7 @@ static void qdev_class_add_property(DeviceClass *klass, const char *name,
     ObjectClass *oc = OBJECT_CLASS(klass);
 
     if (prop->info->create) {
-        prop->info->create(oc, prop);
+        prop->info->create(oc, name, prop);
     } else {
         ObjectProperty *op;
 
-- 
2.28.0


