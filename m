Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F8730B09C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 20:43:52 +0100 (CET)
Received: from localhost ([::1]:40666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6f71-0001Iu-OR
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 14:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6f1V-00037K-Ou
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:38:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6f1M-0005ZA-Kr
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612208278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vpdUUQqYcU67G7DPzVF3jWorxgz4UW1DYd4ktGcpFNM=;
 b=LI4pNYlrT5znIz6KZlfyyUplYW5wo8ZRMhUGIPsTHpsKnTeb4XEDQkaX2SXgWP0haD4pJI
 yp7obNKvQjJwSnt8CxS+klpCa+QHJoLRjYvjIaeZhYwPQlyCG5cjzGq4ozIIsRPmWBZq1N
 5KGdF7OTm/4Tnygx0thfhHdsQIUIpMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-LjD76NIfM1yeqYkUagh_iA-1; Mon, 01 Feb 2021 14:37:55 -0500
X-MC-Unique: LjD76NIfM1yeqYkUagh_iA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B48CD107ACE3;
 Mon,  1 Feb 2021 19:37:54 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C27A160C05;
 Mon,  1 Feb 2021 19:37:53 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/16] qapi/events: fix visit_event typing
Date: Mon,  1 Feb 2021 14:37:33 -0500
Message-Id: <20210201193747.2169670-3-jsnow@redhat.com>
In-Reply-To: <20210201193747.2169670-1-jsnow@redhat.com>
References: <20210201193747.2169670-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>
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
2.29.2


