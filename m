Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B77B2FBF7B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:53:10 +0100 (CET)
Received: from localhost ([::1]:53300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1w7p-0003X4-4W
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:53:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1vLW-0007kY-3k
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:03:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1vLT-0005RG-Em
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611079390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GG76/Nd6SkwPrzWo+WM1kldD4e/+xCkc9xSouGuiJ+w=;
 b=KjLKoQNQVte8V2bYtUDQd0OeZuaw0ssFEvzGxDnCM4PHlvTIgRknM+aUXmDMHV27P+OwAc
 FJ8t24AWG3KBVy4EYtV/8AUuEq4L/9t51Iaf5O5dvu46cRWQgl5QvfG42AXOrjFfhuSKoo
 LmiNgC8fRGZ8r1CJR2P34RP8Gu3bQ98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-avljdWpdM2qKWF0VY_O6jA-1; Tue, 19 Jan 2021 13:03:09 -0500
X-MC-Unique: avljdWpdM2qKWF0VY_O6jA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53EFF107AD39
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 18:02:51 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D2915D9DD;
 Tue, 19 Jan 2021 18:02:50 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/17] qapi/events: fix visit_event typing
Date: Tue, 19 Jan 2021 13:02:27 -0500
Message-Id: <20210119180242.1570753-3-jsnow@redhat.com>
In-Reply-To: <20210119180242.1570753-1-jsnow@redhat.com>
References: <20210119180242.1570753-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Actually, the arg_type can indeed be Optional.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/events.py | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index 599f3d1f564..9851653b9d1 100644
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


