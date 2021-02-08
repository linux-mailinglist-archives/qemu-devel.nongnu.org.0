Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD88931400C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:13:27 +0100 (CET)
Received: from localhost ([::1]:47418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9CuU-00005Z-U3
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:13:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9743-0005WZ-RB
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:58:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9740-0001aj-9L
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:58:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612792731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tOZwGY7D9KaRHRkLU+yS6h+Rp6VjdAHAxeL0lnmC3I0=;
 b=NTFMuW3Fl/6v+SWCCV3jJHMDnDx6PDygauU+EViyXDo4NQVlD6OT3qwVRYbCKlbt/PqybL
 pC/RTxIaAcikrs7/Df3rRZfJWmxG4InA6RNlvUUBg/MoAE0Qx8SG9pp4fDNRIvnekO/fE2
 +owF3Wb0JXB9MNSJb0spkF08O5N6Xns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-mJGfihlsOCO2zYXdL95ofg-1; Mon, 08 Feb 2021 08:58:49 -0500
X-MC-Unique: mJGfihlsOCO2zYXdL95ofg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D0BA1005501;
 Mon,  8 Feb 2021 13:58:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE68F5D9DC;
 Mon,  8 Feb 2021 13:58:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5099C1138461; Mon,  8 Feb 2021 14:58:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/16] qapi/events: fix visit_event typing
Date: Mon,  8 Feb 2021 14:58:32 +0100
Message-Id: <20210208135846.3707170-3-armbru@redhat.com>
In-Reply-To: <20210208135846.3707170-1-armbru@redhat.com>
References: <20210208135846.3707170-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Actually, the arg_type can indeed be Optional.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210201193747.2169670-3-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/events.py | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index 599f3d1f56..9851653b9d 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -12,7 +12,7 @@ This work is licensed under the terms of the GNU GPL, version 2.
 See the COPYING file in the top-level directory.
 """
 
-from typing import List
+from typing import List, Optional
 
 from .common import c_enum_const, c_name, mcgen
 from .gen import QAPISchemaModularCVisitor, build_params, ifcontext
@@ -27,7 +27,7 @@ from .types import gen_enum, gen_enum_lookup
 
 
 def build_event_send_proto(name: str,
-                           arg_type: QAPISchemaObjectType,
+                           arg_type: Optional[QAPISchemaObjectType],
                            boxed: bool) -> str:
     return 'void qapi_event_send_%(c_name)s(%(param)s)' % {
         'c_name': c_name(name.lower()),
@@ -35,7 +35,7 @@ def build_event_send_proto(name: str,
 
 
 def gen_event_send_decl(name: str,
-                        arg_type: QAPISchemaObjectType,
+                        arg_type: Optional[QAPISchemaObjectType],
                         boxed: bool) -> str:
     return mcgen('''
 
@@ -78,7 +78,7 @@ def gen_param_var(typ: QAPISchemaObjectType) -> str:
 
 
 def gen_event_send(name: str,
-                   arg_type: QAPISchemaObjectType,
+                   arg_type: Optional[QAPISchemaObjectType],
                    boxed: bool,
                    event_enum_name: str,
                    event_emit: str) -> str:
@@ -99,6 +99,7 @@ def gen_event_send(name: str,
                 proto=build_event_send_proto(name, arg_type, boxed))
 
     if have_args:
+        assert arg_type is not None
         ret += mcgen('''
     QObject *obj;
     Visitor *v;
@@ -114,6 +115,7 @@ def gen_event_send(name: str,
                  name=name)
 
     if have_args:
+        assert arg_type is not None
         ret += mcgen('''
     v = qobject_output_visitor_new(&obj);
 ''')
@@ -214,7 +216,7 @@ void %(event_emit)s(%(event_enum)s event, QDict *qdict);
                     info: QAPISourceInfo,
                     ifcond: List[str],
                     features: List[QAPISchemaFeature],
-                    arg_type: QAPISchemaObjectType,
+                    arg_type: Optional[QAPISchemaObjectType],
                     boxed: bool) -> None:
         with ifcontext(ifcond, self._genh, self._genc):
             self._genh.add(gen_event_send_decl(name, arg_type, boxed))
-- 
2.26.2


