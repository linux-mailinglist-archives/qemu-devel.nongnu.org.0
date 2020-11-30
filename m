Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA2F2C8450
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 13:49:30 +0100 (CET)
Received: from localhost ([::1]:51788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjicT-0002a3-36
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 07:49:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kjiQd-0003mM-4U
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:37:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kjiQb-0005iy-1c
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:37:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606739832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EGP7D0TUJZWXFD3aozvOAKCBKUzC/cXbsNCEGsT4pRM=;
 b=SnlOaurSAJJm3PF3VxVUA3UzrjMlv7Ztv5IYECsSnSNLtQZeZgASY+rjP8yg29duahh/gF
 UQL51NPExkzWEKojtul9ukSs5ro6pwtDftoGF1ygt6uUKqW/Z2S4IA8MuqsGOnfUZt1ntE
 6vMXIOEGdc2dh25RNY1S6Ow17GanOB4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-zYrfEybsO_OGgK9hkAWm-Q-1; Mon, 30 Nov 2020 07:37:10 -0500
X-MC-Unique: zYrfEybsO_OGgK9hkAWm-Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBF6081CBDF
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 12:37:09 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CB8C5C1A1;
 Mon, 30 Nov 2020 12:37:09 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qom: eliminate identical functions
Date: Mon, 30 Nov 2020 07:37:08 -0500
Message-Id: <20201130123708.3442032-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
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
Cc: ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most property release functions in qom/object.c only free the opaque
value.  Combine all of them into a single function.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qom/object.c | 36 +++++++-----------------------------
 1 file changed, 7 insertions(+), 29 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index 1065355233..75a78c9343 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -2174,11 +2174,10 @@ static void property_set_str(Object *obj, Visitor *v, const char *name,
     g_free(value);
 }
 
-static void property_release_str(Object *obj, const char *name,
-                                 void *opaque)
+static void property_release_data(Object *obj, const char *name,
+                                  void *opaque)
 {
-    StringProperty *prop = opaque;
-    g_free(prop);
+    g_free(opaque);
 }
 
 ObjectProperty *
@@ -2194,7 +2193,7 @@ object_property_add_str(Object *obj, const char *name,
     return object_property_add(obj, name, "string",
                                get ? property_get_str : NULL,
                                set ? property_set_str : NULL,
-                               property_release_str,
+                               property_release_data,
                                prop);
 }
 
@@ -2251,13 +2250,6 @@ static void property_set_bool(Object *obj, Visitor *v, const char *name,
     prop->set(obj, value, errp);
 }
 
-static void property_release_bool(Object *obj, const char *name,
-                                  void *opaque)
-{
-    BoolProperty *prop = opaque;
-    g_free(prop);
-}
-
 ObjectProperty *
 object_property_add_bool(Object *obj, const char *name,
                          bool (*get)(Object *, Error **),
@@ -2271,7 +2263,7 @@ object_property_add_bool(Object *obj, const char *name,
     return object_property_add(obj, name, "bool",
                                get ? property_get_bool : NULL,
                                set ? property_set_bool : NULL,
-                               property_release_bool,
+                               property_release_data,
                                prop);
 }
 
@@ -2320,13 +2312,6 @@ static void property_set_enum(Object *obj, Visitor *v, const char *name,
     prop->set(obj, value, errp);
 }
 
-static void property_release_enum(Object *obj, const char *name,
-                                  void *opaque)
-{
-    EnumProperty *prop = opaque;
-    g_free(prop);
-}
-
 ObjectProperty *
 object_property_add_enum(Object *obj, const char *name,
                          const char *typename,
@@ -2343,7 +2328,7 @@ object_property_add_enum(Object *obj, const char *name,
     return object_property_add(obj, name, typename,
                                get ? property_get_enum : NULL,
                                set ? property_set_enum : NULL,
-                               property_release_enum,
+                               property_release_data,
                                prop);
 }
 
@@ -2410,13 +2395,6 @@ out_end:
     visit_end_struct(v, NULL);
 }
 
-static void property_release_tm(Object *obj, const char *name,
-                                void *opaque)
-{
-    TMProperty *prop = opaque;
-    g_free(prop);
-}
-
 ObjectProperty *
 object_property_add_tm(Object *obj, const char *name,
                        void (*get)(Object *, struct tm *, Error **))
@@ -2427,7 +2405,7 @@ object_property_add_tm(Object *obj, const char *name,
 
     return object_property_add(obj, name, "struct tm",
                                get ? property_get_tm : NULL, NULL,
-                               property_release_tm,
+                               property_release_data,
                                prop);
 }
 
-- 
2.26.2


