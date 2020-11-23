Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 467062C1555
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:09:35 +0100 (CET)
Received: from localhost ([::1]:35756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khI9W-0007X0-Al
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:09:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHq5-0006Vp-NC
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:49:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpu-0007wS-AH
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:49:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606160957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K3JSyj5T3QUAnHKS1UzREqf5hdNxHBx5nm6SPH2Ouxc=;
 b=YSSRhJCxf+ytui86RytWGZ+E6oaKlHrp3HRguoXfqDxtHFrWUOA6RhTPEaqFOfVxMFlqCy
 /FXUoM0AERcLQfZZRRKbTzLTfcrXHOeYYbT9EulEqinZvqMTB+DtiDcpD0119Va1DESjkN
 srGXnA3SN+gdxpMxuFbnnyJI7sVatDg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-4vmyd-M4MS2qi4tErwSexw-1; Mon, 23 Nov 2020 14:49:15 -0500
X-MC-Unique: 4vmyd-M4MS2qi4tErwSexw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6B511012E67
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 19:49:14 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DBB319D80;
 Mon, 23 Nov 2020 19:49:14 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/19] qom: Delete field_prop_set_default_value_*int()
Date: Mon, 23 Nov 2020 14:48:16 -0500
Message-Id: <20201123194818.2773508-18-ehabkost@redhat.com>
In-Reply-To: <20201123194818.2773508-1-ehabkost@redhat.com>
References: <20201123194818.2773508-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The field_prop_set_default_value_*int() functions can be
completely replaced by object_propert_set_default(),
we don't need them anymore.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This is a new patch in v3 of this series.

In v2 of the series, equivalent changes were part of "qom: Use
qlit to represent property defaults".
---
 include/qom/field-property-internal.h |  6 ------
 hw/core/qdev-properties-system.c      |  2 --
 qom/property-types.c                  | 25 -------------------------
 3 files changed, 33 deletions(-)

diff --git a/include/qom/field-property-internal.h b/include/qom/field-property-internal.h
index 7ed0d8d160..4bcf5b45f3 100644
--- a/include/qom/field-property-internal.h
+++ b/include/qom/field-property-internal.h
@@ -16,12 +16,6 @@ void field_prop_set_enum(Object *obj, Visitor *v, const char *name,
 void field_prop_set_default_value_enum(ObjectProperty *op,
                                        const Property *prop,
                                        const QObject *defval);
-void field_prop_set_default_value_int(ObjectProperty *op,
-                                      const Property *prop,
-                                       const QObject *defval);
-void field_prop_set_default_value_uint(ObjectProperty *op,
-                                       const Property *prop,
-                                       const QObject *defval);
 
 void field_prop_get_int32(Object *obj, Visitor *v, const char *name,
                           void *opaque, Error **errp);
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 117c540254..b2df955f2a 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -571,7 +571,6 @@ const PropertyInfo qdev_prop_blocksize = {
                    " and " MAX_BLOCK_SIZE_STR,
     .get   = field_prop_get_size32,
     .set   = set_blocksize,
-    .set_default_value = field_prop_set_default_value_uint,
 };
 
 /* --- Block device error handling policy --- */
@@ -769,7 +768,6 @@ const PropertyInfo qdev_prop_pci_devfn = {
     .print = print_pci_devfn,
     .get   = field_prop_get_int32,
     .set   = set_pci_devfn,
-    .set_default_value = field_prop_set_default_value_int,
 };
 
 /* --- pci host address --- */
diff --git a/qom/property-types.c b/qom/property-types.c
index 0fc24b3687..399e36c29e 100644
--- a/qom/property-types.c
+++ b/qom/property-types.c
@@ -195,27 +195,10 @@ static void set_uint8(Object *obj, Visitor *v, const char *name, void *opaque,
     visit_type_uint8(v, name, ptr, errp);
 }
 
-void field_prop_set_default_value_int(ObjectProperty *op,
-                                      const Property *prop,
-                                      const QObject *defval)
-{
-    QNum *qn = qobject_to(QNum, defval);
-    object_property_set_default_int(op, qnum_get_int(qn));
-}
-
-void field_prop_set_default_value_uint(ObjectProperty *op,
-                                       const Property *prop,
-                                       const QObject *defval)
-{
-    QNum *qn = qobject_to(QNum, defval);
-    object_property_set_default_uint(op, qnum_get_uint(qn));
-}
-
 const PropertyInfo prop_info_uint8 = {
     .name  = "uint8",
     .get   = get_uint8,
     .set   = set_uint8,
-    .set_default_value = field_prop_set_default_value_uint,
 };
 
 /* --- 16bit integer --- */
@@ -242,7 +225,6 @@ const PropertyInfo prop_info_uint16 = {
     .name  = "uint16",
     .get   = get_uint16,
     .set   = set_uint16,
-    .set_default_value = field_prop_set_default_value_uint,
 };
 
 /* --- 32bit integer --- */
@@ -287,14 +269,12 @@ const PropertyInfo prop_info_uint32 = {
     .name  = "uint32",
     .get   = get_uint32,
     .set   = set_uint32,
-    .set_default_value = field_prop_set_default_value_uint,
 };
 
 const PropertyInfo prop_info_int32 = {
     .name  = "int32",
     .get   = field_prop_get_int32,
     .set   = set_int32,
-    .set_default_value = field_prop_set_default_value_int,
 };
 
 /* --- 64bit integer --- */
@@ -339,14 +319,12 @@ const PropertyInfo prop_info_uint64 = {
     .name  = "uint64",
     .get   = get_uint64,
     .set   = set_uint64,
-    .set_default_value = field_prop_set_default_value_uint,
 };
 
 const PropertyInfo prop_info_int64 = {
     .name  = "int64",
     .get   = get_int64,
     .set   = set_int64,
-    .set_default_value = field_prop_set_default_value_int,
 };
 
 /* --- string --- */
@@ -441,7 +419,6 @@ const PropertyInfo prop_info_size32 = {
     .name  = "size",
     .get = field_prop_get_size32,
     .set = set_size32,
-    .set_default_value = field_prop_set_default_value_uint,
 };
 
 /* --- support for array properties --- */
@@ -505,7 +482,6 @@ const PropertyInfo prop_info_arraylen = {
     .name = "uint32",
     .get = get_uint32,
     .set = set_prop_arraylen,
-    .set_default_value = field_prop_set_default_value_uint,
 };
 
 /* --- 64bit unsigned int 'size' type --- */
@@ -532,7 +508,6 @@ const PropertyInfo prop_info_size = {
     .name  = "size",
     .get = get_size,
     .set = set_size,
-    .set_default_value = field_prop_set_default_value_uint,
 };
 
 /* --- object link property --- */
-- 
2.28.0


