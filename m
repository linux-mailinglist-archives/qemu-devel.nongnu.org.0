Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B0C2DB014
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:30:19 +0100 (CET)
Received: from localhost ([::1]:57688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCHK-0003OG-OW
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:30:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC8e-0008CE-0o
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC8c-0002Nu-8g
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608045677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QJN87N5ZLifwPxt4RLz82MP4rpfgWyHY7n6fTslCdLs=;
 b=QmXOLgsZJxLTNU54cM6CvBy4JnHKD+qzPG0OmymvPhMh2Mov4iINq5zaetKpk7FzZs9U6O
 C8q8im+eRFeuof1GFY9C1VDWRWd7DODBR07a0eIzXWM050WBHZLnzLd50OQjc5RYGr9yTO
 0GpzvKKiGIlsFi2KrUN7vxPjf46hsx4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-Vjl32v4qNEi0cskhYw_aVw-1; Tue, 15 Dec 2020 10:21:15 -0500
X-MC-Unique: Vjl32v4qNEi0cskhYw_aVw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 095CA1084C8E;
 Tue, 15 Dec 2020 15:19:46 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FBC210013C1;
 Tue, 15 Dec 2020 15:19:45 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/25] vexpress: Register "secure" as class property
Date: Tue, 15 Dec 2020 10:19:18 -0500
Message-Id: <20201215151942.3125089-2-ehabkost@redhat.com>
In-Reply-To: <20201215151942.3125089-1-ehabkost@redhat.com>
References: <20201215151942.3125089-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Class properties make QOM introspection simpler and easier, as
they don't require an object to be instantiated.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20201111183823.283752-2-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/arm/vexpress.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index ac098375c1..d3a58cff1d 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -756,11 +756,6 @@ static void vexpress_instance_init(Object *obj)
 
     /* EL3 is enabled by default on vexpress */
     vms->secure = true;
-    object_property_add_bool(obj, "secure", vexpress_get_secure,
-                             vexpress_set_secure);
-    object_property_set_description(obj, "secure",
-                                    "Set on/off to enable/disable the ARM "
-                                    "Security Extensions (TrustZone)");
 }
 
 static void vexpress_a15_instance_init(Object *obj)
@@ -797,6 +792,12 @@ static void vexpress_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 4;
     mc->ignore_memory_transaction_failures = true;
     mc->default_ram_id = "vexpress.highmem";
+
+    object_class_property_add_bool(oc, "secure", vexpress_get_secure,
+                                   vexpress_set_secure);
+    object_class_property_set_description(oc, "secure",
+                                          "Set on/off to enable/disable the ARM "
+                                          "Security Extensions (TrustZone)");
 }
 
 static void vexpress_a9_class_init(ObjectClass *oc, void *data)
-- 
2.28.0


