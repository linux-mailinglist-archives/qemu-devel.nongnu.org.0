Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0622D8229
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 23:35:04 +0100 (CET)
Received: from localhost ([::1]:55492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knr0A-0006HB-6E
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 17:35:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knqYX-00025h-As
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:06:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knqYS-0006QZ-P9
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:06:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607724384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=se/CSfFnnsEjx4A0VjeSVdWKnhZ06lA5owfIsLbeW28=;
 b=L1M3AERikAYyYG0ptE2Nb3OkE94ZIlyskla3bN1jZmpxTSst68uy3V2H39l5np+6wumgwS
 OngFXe+Nd6AkLcavRuADuJszPtojMI8/FJ0ywEaIYbs5G8JvmNUryh33SRYWB0qSMQ/XhG
 Etg9lKU6kFznAkQslWuKqwQQ4Ho0yp0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-vEE2xpGdOwaj9ZL2M93S_w-1; Fri, 11 Dec 2020 17:06:20 -0500
X-MC-Unique: vEE2xpGdOwaj9ZL2M93S_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33036801817;
 Fri, 11 Dec 2020 22:06:19 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A591D5D9E2;
 Fri, 11 Dec 2020 22:06:15 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/32] qdev: Make qdev_find_global_prop() get Object*
 argument
Date: Fri, 11 Dec 2020 17:05:07 -0500
Message-Id: <20201211220529.2290218-11-ehabkost@redhat.com>
In-Reply-To: <20201211220529.2290218-1-ehabkost@redhat.com>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the code more generic and not specific to TYPE_DEVICE.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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
index 9ac9b95852..57e63c6949 100644
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


