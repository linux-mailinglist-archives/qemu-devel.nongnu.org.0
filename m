Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E572E221D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 22:32:04 +0100 (CET)
Received: from localhost ([::1]:39640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksBjn-0006ue-QJ
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 16:32:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ksBfl-0002Hm-Qa
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 16:27:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ksBfj-0004QY-VE
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 16:27:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608758871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aj0DJqFwr3hVAQup+ZQiJkVPHsI2C9auEqnNuHC+NNI=;
 b=CCbZyCjjx/x6VjtYW5cPO2hVYFYpHH/eH4Ky/apgNPKMnmMZaSHAEGH411V9hmNcDeUpxt
 dbbrzcfDO7ktrjl8ONv9Ehy3fHIsTDxdNDfBHrwdab6a4yziVyCWpqATfmad5uL9Kc1Gqk
 P4Z+c+D6MsbLc9pt/LYYDgXCyUoypYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-49OWqJlQNoevj5hDH0mJZQ-1; Wed, 23 Dec 2020 16:27:48 -0500
X-MC-Unique: 49OWqJlQNoevj5hDH0mJZQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97EA5801817;
 Wed, 23 Dec 2020 21:27:47 +0000 (UTC)
Received: from localhost (ovpn-113-96.rdu2.redhat.com [10.10.113.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53B2A7086A;
 Wed, 23 Dec 2020 21:27:47 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 06/15] qdev: Add name parameter to qdev_class_add_property()
Date: Wed, 23 Dec 2020 16:27:26 -0500
Message-Id: <20201223212735.512062-7-ehabkost@redhat.com>
In-Reply-To: <20201223212735.512062-1-ehabkost@redhat.com>
References: <20201223212735.512062-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will make it easier to remove Property.name in the future.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20201211220529.2290218-21-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/qdev-properties.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 50734a1cd4..457c7fe4ba 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -887,7 +887,8 @@ void qdev_property_add_static(DeviceState *dev, Property *prop)
     }
 }
 
-static void qdev_class_add_property(DeviceClass *klass, Property *prop)
+static void qdev_class_add_property(DeviceClass *klass, const char *name,
+                                    Property *prop)
 {
     ObjectClass *oc = OBJECT_CLASS(klass);
 
@@ -897,7 +898,7 @@ static void qdev_class_add_property(DeviceClass *klass, Property *prop)
         ObjectProperty *op;
 
         op = object_class_property_add(oc,
-                                       prop->name, prop->info->name,
+                                       name, prop->info->name,
                                        prop->info->get, prop->info->set,
                                        prop->info->release,
                                        prop);
@@ -905,7 +906,7 @@ static void qdev_class_add_property(DeviceClass *klass, Property *prop)
             prop->info->set_default_value(op, prop);
         }
     }
-    object_class_property_set_description(oc, prop->name,
+    object_class_property_set_description(oc, name,
                                           prop->info->description);
 }
 
@@ -962,7 +963,7 @@ void device_class_set_props(DeviceClass *dc, Property *props)
     dc->props_ = props;
     for (prop = props; prop && prop->name; prop++) {
         qdev_class_add_legacy_property(dc, prop);
-        qdev_class_add_property(dc, prop);
+        qdev_class_add_property(dc, prop->name, prop);
     }
 }
 
-- 
2.28.0


