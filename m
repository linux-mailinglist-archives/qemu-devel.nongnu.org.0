Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE152DB023
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:34:33 +0100 (CET)
Received: from localhost ([::1]:46996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCLQ-00025j-BM
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:34:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC93-0008U1-O0
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC8z-0002Ri-8h
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608045695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kVmOVpVmQL2xgZ8tOsySqQddAZ0iQebu3LRXjTTgB4s=;
 b=V6eU+QVOuSebuJz3Y71CjBILSpJCsxyPutBzWjqkuZbUmPMnhj5SCm+kHs3vncpc3yMg4u
 SCjcZuBIjsaczgt2VOi1n8rJyQSYsccqF0eHuZPSPgvPeIfXCVdoTXyhoGi3CA4cPYM/QL
 1Rim6BlthiA21mtrlluBnl6vTqwCH28=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583--47UYCrNMByHLIbBjhNutg-1; Tue, 15 Dec 2020 10:21:33 -0500
X-MC-Unique: -47UYCrNMByHLIbBjhNutg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30BB3802B6A;
 Tue, 15 Dec 2020 15:20:24 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 788EB60C17;
 Tue, 15 Dec 2020 15:20:20 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 17/25] qdev: Make PropertyInfo.print method get Object* argument
Date: Tue, 15 Dec 2020 10:19:34 -0500
Message-Id: <20201215151942.3125089-18-ehabkost@redhat.com>
In-Reply-To: <20201215151942.3125089-1-ehabkost@redhat.com>
References: <20201215151942.3125089-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the code more generic and not specific to TYPE_DEVICE.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20201211220529.2290218-8-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/qdev-properties-system.c | 3 ++-
 hw/core/qdev-properties.c        | 3 +--
 include/hw/qdev-properties.h     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 8912fb4e9c..77b31eb9dc 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -801,9 +801,10 @@ invalid:
     g_free(str);
 }
 
-static int print_pci_devfn(DeviceState *dev, Property *prop, char *dest,
+static int print_pci_devfn(Object *obj, Property *prop, char *dest,
                            size_t len)
 {
+    DeviceState *dev = DEVICE(obj);
     int32_t *ptr = qdev_get_prop_ptr(dev, prop);
 
     if (*ptr == -1) {
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index daf844c2d3..b6cf53e929 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -988,13 +988,12 @@ static void qdev_get_legacy_property(Object *obj, Visitor *v,
                                      const char *name, void *opaque,
                                      Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
 
     char buffer[1024];
     char *ptr = buffer;
 
-    prop->info->print(dev, prop, buffer, sizeof(buffer));
+    prop->info->print(obj, prop, buffer, sizeof(buffer));
     visit_type_str(v, name, &ptr, errp);
 }
 
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index db7ce51dd5..0ea822e6a7 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -32,7 +32,7 @@ struct PropertyInfo {
     const char *name;
     const char *description;
     const QEnumLookup *enum_table;
-    int (*print)(DeviceState *dev, Property *prop, char *dest, size_t len);
+    int (*print)(Object *obj, Property *prop, char *dest, size_t len);
     void (*set_default_value)(ObjectProperty *op, const Property *prop);
     void (*create)(ObjectClass *oc, Property *prop);
     ObjectPropertyAccessor *get;
-- 
2.28.0


