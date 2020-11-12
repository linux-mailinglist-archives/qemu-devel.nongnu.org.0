Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 516942B11A3
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 23:36:03 +0100 (CET)
Received: from localhost ([::1]:39624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdLCE-0002yH-9W
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 17:36:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKRS-0000N5-Bp
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:47:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKRP-0003pF-UI
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:47:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605217659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZC8v3nw6M/39zLtwdBsNZBKTWrqglReMuloTDUMmWww=;
 b=LTiYuzYo59sroeyKJttgjY5kJTlayleFPp0yVNJsmrFgHrr4IXrNJug4e1SYcXKMdOsDMp
 RUaGPdFJL4iSOZCXmIwkJ7aN7XYdJ7Ye7890/S517nGuW9JnEj9tN6B9O4VFDHIyuuTlAi
 40fptT5k2/twXSJgtPUPrKYop9diOMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-lWu3jwoyPFqKt-sqOqowVw-1; Thu, 12 Nov 2020 16:47:36 -0500
X-MC-Unique: lWu3jwoyPFqKt-sqOqowVw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89C5C1074661;
 Thu, 12 Nov 2020 21:47:35 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C15455763;
 Thu, 12 Nov 2020 21:47:31 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 53/53] sev: Use class properties
Date: Thu, 12 Nov 2020 16:43:50 -0500
Message-Id: <20201112214350.872250-54-ehabkost@redhat.com>
In-Reply-To: <20201112214350.872250-1-ehabkost@redhat.com>
References: <20201112214350.872250-1-ehabkost@redhat.com>
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
 Richard Henderson <rth@twiddle.net>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instance properties make introspection hard and are not shown by
"-object ...,help".  Convert them to class properties.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This is a new patch added in v3 of this series.

There was another version of this patch inside series:
  Subject: [PATCH 00/12] qom: Make all -object types use only class properties
  Message-Id: <20201009160122.1662082-1-ehabkost@redhat.com>
  https://lore.kernel.org/qemu-devel/20201009160122.1662082-1-ehabkost@redhat.com

Changes from v1 of the patch:
* Use new object_class_property_add_field() API
  to replace object_property_add_uint32_ptr().
  (v1 used object_class_property_add_uint32_ptr(), which won't
  exist anymore)
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 target/i386/sev.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 93c4d60b82..264ea5a7fb 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -28,7 +28,7 @@
 #include "sysemu/runstate.h"
 #include "trace.h"
 #include "migration/blocker.h"
-#include "qom/object.h"
+#include "qom/qom.h"
 
 #define TYPE_SEV_GUEST "sev-guest"
 OBJECT_DECLARE_SIMPLE_TYPE(SevGuestState, SEV_GUEST)
@@ -298,6 +298,19 @@ sev_guest_class_init(ObjectClass *oc, void *data)
                                   sev_guest_set_session_file);
     object_class_property_set_description(oc, "session-file",
             "guest owners session parameters (encoded with base64)");
+
+    object_class_property_add_field(oc, "policy",
+            PROP_UINT32(SevGuestState, policy, DEFAULT_GUEST_POLICY),
+            prop_allow_set_always);
+    object_class_property_add_field(oc, "handle",
+            PROP_UINT32(SevGuestState, handle, 0),
+            prop_allow_set_always);
+    object_class_property_add_field(oc, "cbitpos",
+            PROP_UINT32(SevGuestState, cbitpos, 0),
+            prop_allow_set_always);
+    object_class_property_add_field(oc, "reduced-phys-bits",
+            PROP_UINT32(SevGuestState, reduced_phys_bits, 0),
+            prop_allow_set_always);
 }
 
 static void
@@ -306,16 +319,6 @@ sev_guest_instance_init(Object *obj)
     SevGuestState *sev = SEV_GUEST(obj);
 
     sev->sev_device = g_strdup(DEFAULT_SEV_DEVICE);
-    sev->policy = DEFAULT_GUEST_POLICY;
-    object_property_add_uint32_ptr(obj, "policy", &sev->policy,
-                                   OBJ_PROP_FLAG_READWRITE);
-    object_property_add_uint32_ptr(obj, "handle", &sev->handle,
-                                   OBJ_PROP_FLAG_READWRITE);
-    object_property_add_uint32_ptr(obj, "cbitpos", &sev->cbitpos,
-                                   OBJ_PROP_FLAG_READWRITE);
-    object_property_add_uint32_ptr(obj, "reduced-phys-bits",
-                                   &sev->reduced_phys_bits,
-                                   OBJ_PROP_FLAG_READWRITE);
 }
 
 /* sev guest info */
-- 
2.28.0


