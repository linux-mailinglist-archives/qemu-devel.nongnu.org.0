Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1ED2E220A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 22:29:40 +0100 (CET)
Received: from localhost ([::1]:33018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksBhT-0004Dl-AW
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 16:29:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ksBfv-0002ZB-5H
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 16:28:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ksBft-0004W2-IP
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 16:28:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608758880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=20RC2SOcVAqnNcBp/JO2ae65iEvwJgGkdJ8rc+cF3Uc=;
 b=U1LVUATNefdGDEHAp1Y40s5MwADG6eAsCWSC1sqqPBED8ATYN1U/ESU5wQq8CdOs5DvzOY
 H1GfdPO5WZaeai0FVMFG0tWRF5WImxavnCrJH3YO9DgnvmcLx/QAo4rzmG2V60qLxg9JPn
 TjxWCHp/mmeDe12ClLlj5v1w5kKYk5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-NQIag6uVPMO-YsJDMLLYuw-1; Wed, 23 Dec 2020 16:27:56 -0500
X-MC-Unique: NQIag6uVPMO-YsJDMLLYuw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BBF2802B42;
 Wed, 23 Dec 2020 21:27:55 +0000 (UTC)
Received: from localhost (ovpn-113-96.rdu2.redhat.com [10.10.113.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56B2919714;
 Wed, 23 Dec 2020 21:27:55 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 11/15] qdev: Make qdev_class_add_property() more flexible
Date: Wed, 23 Dec 2020 16:27:31 -0500
Message-Id: <20201223212735.512062-12-ehabkost@redhat.com>
In-Reply-To: <20201223212735.512062-1-ehabkost@redhat.com>
References: <20201223212735.512062-1-ehabkost@redhat.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Support Property.set_default and PropertyInfo.description even if
PropertyInfo.create is set.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20201211220529.2290218-26-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/qdev-properties.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 3bb05e7d0d..2946cdf56d 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -863,24 +863,22 @@ static void qdev_class_add_property(DeviceClass *klass, const char *name,
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
+    object_class_property_set_description(oc, name, prop->info->description);
 }
 
 /**
-- 
2.28.0


