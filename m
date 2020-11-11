Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA0B2AF88D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 19:50:32 +0100 (CET)
Received: from localhost ([::1]:59852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcvCR-0004RT-R3
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 13:50:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv2O-0000xj-GO
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:40:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv2L-0008QJ-0f
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:40:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605120004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=si64ReTKrg/sjpMGmS8m+eTbdwuwB+8fMpCEA5/ywY0=;
 b=VJdBNuaFksla9oaJeB4z0xakjf5VU0NAgQLI8XzmdhvRwEgXhkRUUHwJ3XbIHyakPiLxJr
 8E4t3wz8NreUkdPDFP4Gu7lAld7FhixJ2R82GeJk0LMW5dHkZFdhZgOwY2MW83wcN9EjTj
 PFdk7cIq8miHHVDsmBWktam/zF9xSf8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-vP25d-rpNrKVzLNT8Xy7Rg-1; Wed, 11 Nov 2020 13:38:28 -0500
X-MC-Unique: vP25d-rpNrKVzLNT8Xy7Rg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 174D51006C84;
 Wed, 11 Nov 2020 18:38:27 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB91F27BD1;
 Wed, 11 Nov 2020 18:38:26 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/12] vexpress: Register "secure" as class property
Date: Wed, 11 Nov 2020 13:38:12 -0500
Message-Id: <20201111183823.283752-2-ehabkost@redhat.com>
In-Reply-To: <20201111183823.283752-1-ehabkost@redhat.com>
References: <20201111183823.283752-1-ehabkost@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 qemu-arm@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Class properties make QOM introspection simpler and easier, as
they don't require an object to be instantiated.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/arm/vexpress.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 531f3a122a..da25ce3b2c 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -755,11 +755,6 @@ static void vexpress_instance_init(Object *obj)
 
     /* EL3 is enabled by default on vexpress */
     vms->secure = true;
-    object_property_add_bool(obj, "secure", vexpress_get_secure,
-                             vexpress_set_secure);
-    object_property_set_description(obj, "secure",
-                                    "Set on/off to enable/disable the ARM "
-                                    "Security Extensions (TrustZone)");
 }
 
 static void vexpress_a15_instance_init(Object *obj)
@@ -796,6 +791,12 @@ static void vexpress_class_init(ObjectClass *oc, void *data)
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


