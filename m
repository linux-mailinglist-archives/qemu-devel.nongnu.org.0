Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AD530B0B5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 20:47:43 +0100 (CET)
Received: from localhost ([::1]:52068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6fAk-0006A1-5o
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 14:47:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6f1k-0003KW-FB
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:38:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6f1h-0005kE-On
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:38:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612208301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OTJGBfiuOP+Mhp/Tlw9eNzOAMYiV308J4dX0rCdyl7I=;
 b=Zq1MNpTWnQw1yZuzI73qoVTy4wg7ffU08Rux/HW5g/DQsLrOtDgWY6BTjioOYA6u79Mlxs
 3w58TlMI3dLbmE5LeIkLaTr8a7NOHKps0MAKEQJ5OGs5V1BQdIzN5p78S0xmopGYd33SCp
 J3jvCStmpLP8Q68ZD+PS+BGhbqvb6eU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-GG60HUOTP5ud7UnIkt2O3A-1; Mon, 01 Feb 2021 14:38:19 -0500
X-MC-Unique: GG60HUOTP5ud7UnIkt2O3A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 766E18145FB;
 Mon,  1 Feb 2021 19:38:18 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9277160C66;
 Mon,  1 Feb 2021 19:38:17 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/16] qapi: centralize the built-in module name definition
Date: Mon,  1 Feb 2021 14:37:41 -0500
Message-Id: <20210201193747.2169670-11-jsnow@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Use a constant to make it obvious we're referring to a very specific thing.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/schema.py | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 14cf9da7842..353e8020a27 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -68,7 +68,7 @@ def check_doc(self):
 
     def _set_module(self, schema, info):
         assert self._checked
-        fname = info.fname if info else './builtin'
+        fname = info.fname if info else QAPISchemaModule.BUILTIN_MODULE_NAME
         self._module = schema.module_by_fname(fname)
         self._module.add_entity(self)
 
@@ -138,6 +138,9 @@ def visit_event(self, name, info, ifcond, features, arg_type, boxed):
 
 
 class QAPISchemaModule:
+
+    BUILTIN_MODULE_NAME = './builtin'
+
     def __init__(self, name):
         self.name = name
         self._entity_list = []
@@ -160,14 +163,14 @@ def is_user_module(cls, name: str) -> bool:
         """
         return not cls.is_system_module(name)
 
-    @staticmethod
-    def is_builtin_module(name: str) -> bool:
+    @classmethod
+    def is_builtin_module(cls, name: str) -> bool:
         """
         The built-in module is a single System module for the built-in types.
 
         It is always "./builtin".
         """
-        return name == './builtin'
+        return name == cls.BUILTIN_MODULE_NAME
 
     def add_entity(self, ent):
         self._entity_list.append(ent)
@@ -853,7 +856,7 @@ def __init__(self, fname):
         self._entity_dict = {}
         self._module_dict = OrderedDict()
         self._schema_dir = os.path.dirname(fname)
-        self._make_module('./builtin')
+        self._make_module(QAPISchemaModule.BUILTIN_MODULE_NAME)
         self._make_module(fname)
         self._predefining = True
         self._def_predefineds()
-- 
2.29.2


