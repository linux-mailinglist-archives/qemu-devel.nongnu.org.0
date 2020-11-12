Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAF02B1184
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 23:28:55 +0100 (CET)
Received: from localhost ([::1]:55146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdL5F-0004ls-4a
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 17:28:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKRP-0000HB-EN
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:47:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKRM-0003oH-6r
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:47:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605217653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zKAMxkAZdWtHz59/oN5KECOch+qKM8v3q6+WMT/2vtU=;
 b=V6G1ooSO25Vrk/+j0dJiLONWNLCttHfnN2LwZi52JHPKGtd3fzH30HQf71xTiJojmqCSzo
 iVN8DJRJm7xrxIjmmz0kixY1ZG9lBqjmIsSUEH13wXAOHsxdiNKLMcCf3JFus9D361kK4N
 tY30JwhMRPDb/P5d1olbPDeMNdA98Bk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-634AWudtOtKAp4o1Uz1sQA-1; Thu, 12 Nov 2020 16:47:32 -0500
X-MC-Unique: 634AWudtOtKAp4o1Uz1sQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B534186DD3A;
 Thu, 12 Nov 2020 21:47:31 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 821606EF62;
 Thu, 12 Nov 2020 21:47:27 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 52/53] tests: Use field property at check-qom-proplist test
 case
Date: Thu, 12 Nov 2020 16:43:49 -0500
Message-Id: <20201112214350.872250-53-ehabkost@redhat.com>
In-Reply-To: <20201112214350.872250-1-ehabkost@redhat.com>
References: <20201112214350.872250-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the field property system for the "sv" property used at
check-qom-proplist.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v2 -> v3:
* Don't register a instance field property, as
  object_property_add_field() is an internal API

Changes v1 -> v2:
* Use PROP_* and object_class_property_add_field() interface

---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 tests/check-qom-proplist.c | 39 ++++----------------------------------
 1 file changed, 4 insertions(+), 35 deletions(-)

diff --git a/tests/check-qom-proplist.c b/tests/check-qom-proplist.c
index 1b76581980..2ded6203fb 100644
--- a/tests/check-qom-proplist.c
+++ b/tests/check-qom-proplist.c
@@ -25,7 +25,7 @@
 #include "qemu/module.h"
 #include "qemu/option.h"
 #include "qemu/config-file.h"
-#include "qom/object_interfaces.h"
+#include "qom/qom.h"
 
 
 #define TYPE_DUMMY "qemu-dummy"
@@ -103,26 +103,6 @@ static int dummy_get_av(Object *obj,
     return dobj->av;
 }
 
-
-static void dummy_set_sv(Object *obj,
-                         const char *value,
-                         Error **errp)
-{
-    DummyObject *dobj = DUMMY_OBJECT(obj);
-
-    g_free(dobj->sv);
-    dobj->sv = g_strdup(value);
-}
-
-static char *dummy_get_sv(Object *obj,
-                          Error **errp)
-{
-    DummyObject *dobj = DUMMY_OBJECT(obj);
-
-    return g_strdup(dobj->sv);
-}
-
-
 static void dummy_init(Object *obj)
 {
     object_property_add_bool(obj, "bv",
@@ -130,12 +110,11 @@ static void dummy_init(Object *obj)
                              dummy_set_bv);
 }
 
-
 static void dummy_class_init(ObjectClass *cls, void *data)
 {
-    object_class_property_add_str(cls, "sv",
-                                  dummy_get_sv,
-                                  dummy_set_sv);
+    object_class_property_add_field(cls, "sv",
+                                    PROP_STRING(DummyObject, sv),
+                                    prop_allow_set_always);
     object_class_property_add_enum(cls, "av",
                                    "DummyAnimal",
                                    &dummy_animal_map,
@@ -143,21 +122,11 @@ static void dummy_class_init(ObjectClass *cls, void *data)
                                    dummy_set_av);
 }
 
-
-static void dummy_finalize(Object *obj)
-{
-    DummyObject *dobj = DUMMY_OBJECT(obj);
-
-    g_free(dobj->sv);
-}
-
-
 static const TypeInfo dummy_info = {
     .name          = TYPE_DUMMY,
     .parent        = TYPE_OBJECT,
     .instance_size = sizeof(DummyObject),
     .instance_init = dummy_init,
-    .instance_finalize = dummy_finalize,
     .class_size = sizeof(DummyObjectClass),
     .class_init = dummy_class_init,
     .interfaces = (InterfaceInfo[]) {
-- 
2.28.0


