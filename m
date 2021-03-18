Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F78D340B7B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 18:14:42 +0100 (CET)
Received: from localhost ([::1]:39996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMwEL-0004LB-NE
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 13:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMvfH-00026T-V8
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:38:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMvf0-000334-1A
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:38:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616085486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g5bazmUKpJVawVR5/iufsu+bjuyoCG/QKYKW0fCj5go=;
 b=isNYn3ZF1pxqpqgJZJIIhlPTG+mL77PGYNqfFpU21IiA7RUxaia5/F7LVSkbjgDS1zAJSV
 V3KvbSmF7y0Uom4RPk3Oj9acSJhR6zDnRjnn/xQxEY44eotyMsd26RNSTVLXu27GrDmb+m
 FHStOudHYt7K84E1IV1zziDV17TLWfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-1aqHJN2YPnyAWZ05uZpOSA-1; Thu, 18 Mar 2021 12:38:01 -0400
X-MC-Unique: 1aqHJN2YPnyAWZ05uZpOSA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12DF010866A7;
 Thu, 18 Mar 2021 16:38:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C51D25D9CA;
 Thu, 18 Mar 2021 16:37:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 400331138617; Thu, 18 Mar 2021 17:37:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 04/11] qapi: Implement deprecated-output=hide for QMP events
Date: Thu, 18 Mar 2021 17:37:50 +0100
Message-Id: <20210318163757.1345341-5-armbru@redhat.com>
In-Reply-To: <20210318163757.1345341-1-armbru@redhat.com>
References: <20210318163757.1345341-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This policy suppresses deprecated bits in output, and thus permits
"testing the future".  Implement it for QMP events: suppress
deprecated ones.

No QMP event is deprecated right now.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210318155519.1224118-5-armbru@redhat.com>
---
 tests/unit/test-qmp-event.c | 20 ++++++++++++++++++++
 scripts/qapi/events.py      | 12 +++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/tests/unit/test-qmp-event.c b/tests/unit/test-qmp-event.c
index 7dd0053190..ab059fb5c2 100644
--- a/tests/unit/test-qmp-event.c
+++ b/tests/unit/test-qmp-event.c
@@ -14,6 +14,7 @@
 #include "qemu/osdep.h"
 
 #include "qemu-common.h"
+#include "qapi/compat-policy.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qbool.h"
 #include "qapi/qmp/qdict.h"
@@ -140,6 +141,24 @@ static void test_event_d(TestEventData *data,
     qobject_unref(data->expect);
 }
 
+static void test_event_deprecated(TestEventData *data, const void *unused)
+{
+    data->expect = qdict_from_jsonf_nofail("{ 'event': 'TEST-EVENT-FEATURES1' }");
+
+    memset(&compat_policy, 0, sizeof(compat_policy));
+
+    qapi_event_send_test_event_features1();
+    g_assert(data->emitted);
+
+    compat_policy.has_deprecated_output = true;
+    compat_policy.deprecated_output = COMPAT_POLICY_OUTPUT_HIDE;
+    data->emitted = false;
+    qapi_event_send_test_event_features1();
+    g_assert(!data->emitted);
+
+    qobject_unref(data->expect);
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
@@ -148,6 +167,7 @@ int main(int argc, char **argv)
     event_test_add("/event/event_b", test_event_b);
     event_test_add("/event/event_c", test_event_c);
     event_test_add("/event/event_d", test_event_d);
+    event_test_add("/event/deprecated", test_event_deprecated);
     g_test_run();
 
     return 0;
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index 90d2f6156d..f6e1e76f64 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -79,6 +79,7 @@ def gen_param_var(typ: QAPISchemaObjectType) -> str:
 
 def gen_event_send(name: str,
                    arg_type: Optional[QAPISchemaObjectType],
+                   features: List[QAPISchemaFeature],
                    boxed: bool,
                    event_enum_name: str,
                    event_emit: str) -> str:
@@ -107,6 +108,14 @@ def gen_event_send(name: str,
         if not boxed:
             ret += gen_param_var(arg_type)
 
+    if 'deprecated' in [f.name for f in features]:
+        ret += mcgen('''
+
+    if (compat_policy.deprecated_output == COMPAT_POLICY_OUTPUT_HIDE) {
+        return;
+    }
+''')
+
     ret += mcgen('''
 
     qmp = qmp_event_build_dict("%(name)s");
@@ -176,6 +185,7 @@ def _begin_user_module(self, name: str) -> None:
 #include "%(prefix)sqapi-emit-events.h"
 #include "%(events)s.h"
 #include "%(visit)s.h"
+#include "qapi/compat-policy.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qobject-output-visitor.h"
@@ -220,7 +230,7 @@ def visit_event(self,
                     boxed: bool) -> None:
         with ifcontext(ifcond, self._genh, self._genc):
             self._genh.add(gen_event_send_decl(name, arg_type, boxed))
-            self._genc.add(gen_event_send(name, arg_type, boxed,
+            self._genc.add(gen_event_send(name, arg_type, features, boxed,
                                           self._event_enum_name,
                                           self._event_emit_name))
         # Note: we generate the enum member regardless of @ifcond, to
-- 
2.26.3


