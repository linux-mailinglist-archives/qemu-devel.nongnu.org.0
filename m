Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4642A6921
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 17:09:57 +0100 (CET)
Received: from localhost ([::1]:45402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaLMC-0003Ao-Sf
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 11:09:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kaLEo-0001R9-3E
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 11:02:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kaLEi-0005V9-3u
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 11:02:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604505726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GQ0NhKPBVv20x0zpCb2NBxK3BLDlcnNcp6ai4Es5lBw=;
 b=PoE+/i53uO9n0vMXw91Wbb45igGnaxGQZLF7AbPeoAo5GbFdqaPm7SOIB9Y+Nv4oSQiBvb
 mMDtcGueqm98XPSr83LRgY+PEl6zuYVji4ZHvcmrztspnqbrMCe0McNytXyw5d7YWhAtBf
 /1NPMhyWOWT6w2itui8qd88qnlSN5YE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-J2Y-SKRNOp-3frFt_RMt8A-1; Wed, 04 Nov 2020 11:02:04 -0500
X-MC-Unique: J2Y-SKRNOp-3frFt_RMt8A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8054D192F448;
 Wed,  4 Nov 2020 16:01:19 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64D6273675;
 Wed,  4 Nov 2020 16:01:18 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/44] qdev: Make PropertyInfo.print method get Object*
 argument
Date: Wed,  4 Nov 2020 10:59:44 -0500
Message-Id: <20201104160021.2342108-8-ehabkost@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 22:09:52
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
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
 hw/core/qdev-properties-system.c | 3 ++-
 hw/core/qdev-properties.c        | 3 +--
 3 files changed, 4 insertions(+), 4 deletions(-)

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
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index b81a4e8d14..d0fb063a49 100644
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
 
-- 
2.28.0


