Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5F42DA46C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 00:55:35 +0100 (CET)
Received: from localhost ([::1]:59584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koxgk-0004oL-S7
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 18:55:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1koxez-00037c-V6
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 18:53:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1koxey-0000tE-AH
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 18:53:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607990023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iuhWeksv3jkJDkAmjl12mWMS4DFMKWnmIdfOWNDchdI=;
 b=cr5YiW/rYCaFXNKJQDk8VbbbU/Mqb4FXb23wtUdhJ1dYtglEI3cqmZCoEDXd8wPNUokkr/
 OBwBjMLck2iM1MR1lfAASABNL3b2z5uBx9demOYZVubHGhIO7WJSJ0Avfs5J2ffUmWGsIG
 AvwyHWlMkb/x89A1Lj3Zh6Kl84HEVuU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-3RRS7dUwPnynP0ByeuzDjw-1; Mon, 14 Dec 2020 18:53:42 -0500
X-MC-Unique: 3RRS7dUwPnynP0ByeuzDjw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47BAB10054FF
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 23:53:41 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-117.rdu2.redhat.com [10.10.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D04F913470;
 Mon, 14 Dec 2020 23:53:36 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/12] qapi/events: fix visit_event typing
Date: Mon, 14 Dec 2020 18:53:17 -0500
Message-Id: <20201214235327.1007124-3-jsnow@redhat.com>
In-Reply-To: <20201214235327.1007124-1-jsnow@redhat.com>
References: <20201214235327.1007124-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Actually, the arg_type can indeed be Optional.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/events.py | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index 599f3d1f564b..9851653b9d11 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -12,7 +12,7 @@
 See the COPYING file in the top-level directory.
 """
 
-from typing import List
+from typing import List, Optional
 
 from .common import c_enum_const, c_name, mcgen
 from .gen import QAPISchemaModularCVisitor, build_params, ifcontext
@@ -27,7 +27,7 @@
 
 
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
@@ -214,7 +216,7 @@ def visit_event(self,
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


