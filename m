Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D95D2B10AD
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 22:53:04 +0100 (CET)
Received: from localhost ([::1]:45284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdKWd-0006Ao-L4
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 16:53:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKOY-0005X0-Kj
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:44:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKOW-0003Cq-Tc
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:44:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605217480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gdMyOjPEyHa8ld0hjAoBSsicMflgaQnNdGClhjzau5k=;
 b=Tr+icB/7urX/7vqE1zNPpMtdTj/PMUpvP3m2Q4B2wVifwbj+sygquV2BRIF0rj9M6wXkm7
 BI4+x75/nmEwR1XsmUHqNh0vN7H5eF07ikT1lzdvcKOCGw6xQxGdygyf0ZOXdDTRPsEUdr
 StnLI+IyQb6YXpjYyQloR8ihu54cfxM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-Hic_p3ZVMQSGkWT8totNOQ-1; Thu, 12 Nov 2020 16:44:38 -0500
X-MC-Unique: Hic_p3ZVMQSGkWT8totNOQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9BBE1018F70;
 Thu, 12 Nov 2020 21:44:37 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C64185B4A7;
 Thu, 12 Nov 2020 21:44:33 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/53] qdev: Make bit_prop_set() get Object* argument
Date: Thu, 12 Nov 2020 16:43:05 -0500
Message-Id: <20201112214350.872250-9-ehabkost@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
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
 hw/core/qdev-properties.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index b6cf53e929..3a4638f4de 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -92,8 +92,9 @@ static uint32_t qdev_get_prop_mask(Property *prop)
     return 0x1 << prop->bitnr;
 }
 
-static void bit_prop_set(DeviceState *dev, Property *props, bool val)
+static void bit_prop_set(Object *obj, Property *props, bool val)
 {
+    DeviceState *dev = DEVICE(obj);
     uint32_t *p = qdev_get_prop_ptr(dev, props);
     uint32_t mask = qdev_get_prop_mask(props);
     if (val) {
@@ -129,7 +130,7 @@ static void prop_set_bit(Object *obj, Visitor *v, const char *name,
     if (!visit_type_bool(v, name, &value, errp)) {
         return;
     }
-    bit_prop_set(dev, prop, value);
+    bit_prop_set(obj, prop, value);
 }
 
 static void set_default_value_bool(ObjectProperty *op, const Property *prop)
@@ -153,8 +154,9 @@ static uint64_t qdev_get_prop_mask64(Property *prop)
     return 0x1ull << prop->bitnr;
 }
 
-static void bit64_prop_set(DeviceState *dev, Property *props, bool val)
+static void bit64_prop_set(Object *obj, Property *props, bool val)
 {
+    DeviceState *dev = DEVICE(obj);
     uint64_t *p = qdev_get_prop_ptr(dev, props);
     uint64_t mask = qdev_get_prop_mask64(props);
     if (val) {
@@ -190,7 +192,7 @@ static void prop_set_bit64(Object *obj, Visitor *v, const char *name,
     if (!visit_type_bool(v, name, &value, errp)) {
         return;
     }
-    bit64_prop_set(dev, prop, value);
+    bit64_prop_set(obj, prop, value);
 }
 
 const PropertyInfo qdev_prop_bit64 = {
-- 
2.28.0


