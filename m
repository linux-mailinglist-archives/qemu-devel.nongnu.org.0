Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5882A284209
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 23:20:39 +0200 (CEST)
Received: from localhost ([::1]:43644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPXuQ-0003bP-C3
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 17:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPXkW-0008Dp-FA
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 17:10:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPXkS-0007PJ-Gr
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 17:10:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601932219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vSZU8LutC2AZ+Vt0lQlqAk6xxkGLLoRLLfQshp5cRs4=;
 b=LZuF9NhCrwXBJqztUZdcafTLZ5Uo/sumhbomEp8LRmPLv1cUq5e/IevHOvrm/mRzds+gx5
 KSWzJRheJJ0q51kEL8vTrY2VZcfuvHhldTl0T13YHqotTCSAL1+yshKtdhYIk3mIk+2rVM
 lREOJrjKUXvO0FoMWA6a9FkBQgj+fJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-0YRpkEqHN2mRYMPZBP57fg-1; Mon, 05 Oct 2020 17:10:15 -0400
X-MC-Unique: 0YRpkEqHN2mRYMPZBP57fg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64DA918A8222;
 Mon,  5 Oct 2020 21:10:14 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DB445C1BD;
 Mon,  5 Oct 2020 21:10:14 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 07/21] hw/core/qdev-properties: Export some integer-related
 functions
Date: Mon,  5 Oct 2020 17:09:46 -0400
Message-Id: <20201005211000.710404-8-ehabkost@redhat.com>
In-Reply-To: <20201005211000.710404-1-ehabkost@redhat.com>
References: <20201005211000.710404-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 02:11:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

We are going to split this file and reuse these static functions.
Declare them in the local "qdev-prop-internal.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200930164949.1425294-8-philmd@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/qdev-prop-internal.h | 11 +++++++++
 hw/core/qdev-properties.c    | 46 +++++++++++++++++++-----------------
 2 files changed, 35 insertions(+), 22 deletions(-)

diff --git a/hw/core/qdev-prop-internal.h b/hw/core/qdev-prop-internal.h
index 2a8c9a306a5..9cf5cc1d519 100644
--- a/hw/core/qdev-prop-internal.h
+++ b/hw/core/qdev-prop-internal.h
@@ -15,5 +15,16 @@ void qdev_propinfo_set_enum(Object *obj, Visitor *v, const char *name,
 
 void qdev_propinfo_set_default_value_enum(ObjectProperty *op,
                                           const Property *prop);
+void qdev_propinfo_set_default_value_int(ObjectProperty *op,
+                                         const Property *prop);
+void qdev_propinfo_set_default_value_uint(ObjectProperty *op,
+                                          const Property *prop);
+
+void qdev_propinfo_get_uint16(Object *obj, Visitor *v, const char *name,
+                              void *opaque, Error **errp);
+void qdev_propinfo_get_int32(Object *obj, Visitor *v, const char *name,
+                             void *opaque, Error **errp);
+void qdev_propinfo_get_size32(Object *obj, Visitor *v, const char *name,
+                              void *opaque, Error **errp);
 
 #endif
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 31dfe441e2e..37e309077a1 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -271,12 +271,14 @@ static void set_uint8(Object *obj, Visitor *v, const char *name, void *opaque,
     visit_type_uint8(v, name, ptr, errp);
 }
 
-static void set_default_value_int(ObjectProperty *op, const Property *prop)
+void qdev_propinfo_set_default_value_int(ObjectProperty *op,
+                                         const Property *prop)
 {
     object_property_set_default_int(op, prop->defval.i);
 }
 
-static void set_default_value_uint(ObjectProperty *op, const Property *prop)
+void qdev_propinfo_set_default_value_uint(ObjectProperty *op,
+                                          const Property *prop)
 {
     object_property_set_default_uint(op, prop->defval.u);
 }
@@ -285,13 +287,13 @@ const PropertyInfo qdev_prop_uint8 = {
     .name  = "uint8",
     .get   = get_uint8,
     .set   = set_uint8,
-    .set_default_value = set_default_value_uint,
+    .set_default_value = qdev_propinfo_set_default_value_uint,
 };
 
 /* --- 16bit integer --- */
 
-static void get_uint16(Object *obj, Visitor *v, const char *name,
-                       void *opaque, Error **errp)
+void qdev_propinfo_get_uint16(Object *obj, Visitor *v, const char *name,
+                              void *opaque, Error **errp)
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
@@ -317,9 +319,9 @@ static void set_uint16(Object *obj, Visitor *v, const char *name,
 
 const PropertyInfo qdev_prop_uint16 = {
     .name  = "uint16",
-    .get   = get_uint16,
+    .get   = qdev_propinfo_get_uint16,
     .set   = set_uint16,
-    .set_default_value = set_default_value_uint,
+    .set_default_value = qdev_propinfo_set_default_value_uint,
 };
 
 /* --- 32bit integer --- */
@@ -349,8 +351,8 @@ static void set_uint32(Object *obj, Visitor *v, const char *name,
     visit_type_uint32(v, name, ptr, errp);
 }
 
-static void get_int32(Object *obj, Visitor *v, const char *name, void *opaque,
-                      Error **errp)
+void qdev_propinfo_get_int32(Object *obj, Visitor *v, const char *name,
+                             void *opaque, Error **errp)
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
@@ -378,14 +380,14 @@ const PropertyInfo qdev_prop_uint32 = {
     .name  = "uint32",
     .get   = get_uint32,
     .set   = set_uint32,
-    .set_default_value = set_default_value_uint,
+    .set_default_value = qdev_propinfo_set_default_value_uint,
 };
 
 const PropertyInfo qdev_prop_int32 = {
     .name  = "int32",
-    .get   = get_int32,
+    .get   = qdev_propinfo_get_int32,
     .set   = set_int32,
-    .set_default_value = set_default_value_int,
+    .set_default_value = qdev_propinfo_set_default_value_int,
 };
 
 /* --- 64bit integer --- */
@@ -444,14 +446,14 @@ const PropertyInfo qdev_prop_uint64 = {
     .name  = "uint64",
     .get   = get_uint64,
     .set   = set_uint64,
-    .set_default_value = set_default_value_uint,
+    .set_default_value = qdev_propinfo_set_default_value_uint,
 };
 
 const PropertyInfo qdev_prop_int64 = {
     .name  = "int64",
     .get   = get_int64,
     .set   = set_int64,
-    .set_default_value = set_default_value_int,
+    .set_default_value = qdev_propinfo_set_default_value_int,
 };
 
 /* --- string --- */
@@ -820,8 +822,8 @@ const PropertyInfo qdev_prop_pci_devfn = {
 
 /* --- 32bit unsigned int 'size' type --- */
 
-static void get_size32(Object *obj, Visitor *v, const char *name, void *opaque,
-                       Error **errp)
+void qdev_propinfo_get_size32(Object *obj, Visitor *v, const char *name,
+                              void *opaque, Error **errp)
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
@@ -861,9 +863,9 @@ static void set_size32(Object *obj, Visitor *v, const char *name, void *opaque,
 
 const PropertyInfo qdev_prop_size32 = {
     .name  = "size",
-    .get = get_size32,
+    .get = qdev_propinfo_get_size32,
     .set = set_size32,
-    .set_default_value = set_default_value_uint,
+    .set_default_value = qdev_propinfo_set_default_value_uint,
 };
 
 /* --- blocksize --- */
@@ -919,9 +921,9 @@ const PropertyInfo qdev_prop_blocksize = {
     .name  = "size",
     .description = "A power of two between " MIN_BLOCK_SIZE_STR
                    " and " MAX_BLOCK_SIZE_STR,
-    .get   = get_size32,
+    .get   = qdev_propinfo_get_size32,
     .set   = set_blocksize,
-    .set_default_value = set_default_value_uint,
+    .set_default_value = qdev_propinfo_set_default_value_uint,
 };
 
 /* --- pci host address --- */
@@ -1190,7 +1192,7 @@ const PropertyInfo qdev_prop_arraylen = {
     .name = "uint32",
     .get = get_uint32,
     .set = set_prop_arraylen,
-    .set_default_value = set_default_value_uint,
+    .set_default_value = qdev_propinfo_set_default_value_uint,
 };
 
 /* --- public helpers --- */
@@ -1401,7 +1403,7 @@ const PropertyInfo qdev_prop_size = {
     .name  = "size",
     .get = get_size,
     .set = set_size,
-    .set_default_value = set_default_value_uint,
+    .set_default_value = qdev_propinfo_set_default_value_uint,
 };
 
 /* --- object link property --- */
-- 
2.26.2


