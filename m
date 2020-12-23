Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1461E2E2234
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 22:41:48 +0100 (CET)
Received: from localhost ([::1]:36988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksBtD-00018n-3a
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 16:41:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ksBfu-0002Xw-Hc
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 16:28:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ksBfs-0004Vt-OO
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 16:28:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608758880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YJWC2Zg1Gfb4pluSJUc3D34U9TwmpQ8FWADPkBJULUk=;
 b=h8arrJillO+qDRBHXGcl7qnRWS8FJQSiRHUD3nxlK/nPwbsmnI9xfpYHj4rGVe6l0kd+qX
 eKyRf1uoYEckNYs4I6KO6jmixeDMB5B0DM5R71oE2UZ7NqE+WV9OrDGBKUqx4M80gO9+jc
 Yh/YVzuhSrC/5/9mCfUGq7/xN8X/3eY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-15c46yh8MduzYJUP7DW0Tw-1; Wed, 23 Dec 2020 16:27:55 -0500
X-MC-Unique: 15c46yh8MduzYJUP7DW0Tw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49238107ACF6;
 Wed, 23 Dec 2020 21:27:54 +0000 (UTC)
Received: from localhost (ovpn-113-96.rdu2.redhat.com [10.10.113.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E725363747;
 Wed, 23 Dec 2020 21:27:53 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 10/15] qdev: Make PropertyInfo.create return ObjectProperty*
Date: Wed, 23 Dec 2020 16:27:30 -0500
Message-Id: <20201223212735.512062-11-ehabkost@redhat.com>
In-Reply-To: <20201223212735.512062-1-ehabkost@redhat.com>
References: <20201223212735.512062-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Returning ObjectProperty* will be useful for new property
registration code that will add additional callbacks
to ObjectProperty after registering it.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20201211220529.2290218-25-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/qdev-properties.c    | 12 ++++++------
 include/hw/qdev-properties.h |  3 ++-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 92f48ecbf2..3bb05e7d0d 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -821,13 +821,13 @@ const PropertyInfo qdev_prop_size = {
 
 /* --- object link property --- */
 
-static void create_link_property(ObjectClass *oc, const char *name,
-                                 Property *prop)
+static ObjectProperty *create_link_property(ObjectClass *oc, const char *name,
+                                            Property *prop)
 {
-    object_class_property_add_link(oc, name, prop->link_type,
-                                   prop->offset,
-                                   qdev_prop_allow_set_link_before_realize,
-                                   OBJ_PROP_LINK_STRONG);
+    return object_class_property_add_link(oc, name, prop->link_type,
+                                          prop->offset,
+                                          qdev_prop_allow_set_link_before_realize,
+                                          OBJ_PROP_LINK_STRONG);
 }
 
 const PropertyInfo qdev_prop_link = {
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index ab9c538ba4..aae882317a 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -34,7 +34,8 @@ struct PropertyInfo {
     const QEnumLookup *enum_table;
     int (*print)(Object *obj, Property *prop, char *dest, size_t len);
     void (*set_default_value)(ObjectProperty *op, const Property *prop);
-    void (*create)(ObjectClass *oc, const char *name, Property *prop);
+    ObjectProperty *(*create)(ObjectClass *oc, const char *name,
+                              Property *prop);
     ObjectPropertyAccessor *get;
     ObjectPropertyAccessor *set;
     ObjectPropertyRelease *release;
-- 
2.28.0


