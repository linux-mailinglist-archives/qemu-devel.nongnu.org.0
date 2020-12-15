Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DC02DB02E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:36:50 +0100 (CET)
Received: from localhost ([::1]:54382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCNe-0005A7-0R
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC91-0008ON-F5
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC8v-0002Qj-Ck
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608045693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3kUg3szFgEaSkZFapDpOa/y2R3K+EXvev1BNLHKHCv0=;
 b=VCvqwakhtvtgTbVNBSDnnYxkrBLgdjuRZ6ikB7yAYsKPB1yxL8iB37p8kvd/4ww1D5fFHz
 AkOKvjJ5KeXGGZjVt5gNIWebdQ1pYUQxJN7+eN/RrXrsF6ITpSS9y29DQbb6hjz98Pc9EU
 sPwMF2nqLYfORiSeN3fUbTFlryaXScA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-QjjXTIsuPkaZp1OYVHpaMA-1; Tue, 15 Dec 2020 10:21:30 -0500
X-MC-Unique: QjjXTIsuPkaZp1OYVHpaMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE6D781DB5;
 Tue, 15 Dec 2020 15:19:51 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B257F5D6BA;
 Tue, 15 Dec 2020 15:19:51 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 06/25] virt: Register "its" as class property
Date: Tue, 15 Dec 2020 10:19:23 -0500
Message-Id: <20201215151942.3125089-7-ehabkost@redhat.com>
In-Reply-To: <20201215151942.3125089-1-ehabkost@redhat.com>
References: <20201215151942.3125089-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Class properties make QOM introspection simpler and easier, as
they don't require an object to be instantiated.

Note: "its" is currently registered conditionally, but this makes
the feature be registered unconditionally.  The only side effect
is that it will be now possible to set its=on on virt-2.7 and
older.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20201111183823.283752-7-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/arm/virt.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 6a37d07ee0..96985917d3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2531,6 +2531,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set on/off to enable/disable emulating a "
                                           "guest CPU which implements the ARM "
                                           "Memory Tagging Extension");
+
+    object_class_property_add_bool(oc, "its", virt_get_its,
+                                   virt_set_its);
+    object_class_property_set_description(oc, "its",
+                                          "Set on/off to enable/disable "
+                                          "ITS instantiation");
+
 }
 
 static void virt_instance_init(Object *obj)
@@ -2558,11 +2565,6 @@ static void virt_instance_init(Object *obj)
     } else {
         /* Default allows ITS instantiation */
         vms->its = true;
-        object_property_add_bool(obj, "its", virt_get_its,
-                                 virt_set_its);
-        object_property_set_description(obj, "its",
-                                        "Set on/off to enable/disable "
-                                        "ITS instantiation");
     }
 
     /* Default disallows iommu instantiation */
-- 
2.28.0


