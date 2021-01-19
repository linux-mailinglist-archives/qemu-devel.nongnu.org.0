Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C452FBEE8
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:27:16 +0100 (CET)
Received: from localhost ([::1]:43848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1vik-0003TD-Ug
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:27:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1vLW-0007kw-RG
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:03:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1vLT-0005RM-KQ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:03:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611079390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+4djVAJuJxG9JDMBfsIoZrWqekj/Y5ucXQee7MNLfE8=;
 b=gXgIUsrbq8jLbb1K06xGFv0fQ0o+wUlC97/zjL+dqqRdMrrzBnV702sPRiE0COsnSFTUiJ
 0wpunrR0Bywcign6rQsuYR7WBlTSSmBniBXfe+TTU4nAbODj3XAQ/xWQ1SqAwwmZRTkhya
 +bBBhudj6ZEFlhG+ges8T0b7QUVutSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-VNGToKc7Mu68pcAZDYOqFw-1; Tue, 19 Jan 2021 13:03:08 -0500
X-MC-Unique: VNGToKc7Mu68pcAZDYOqFw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFE71BBEE1
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 18:03:07 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C94B5D9DD;
 Tue, 19 Jan 2021 18:03:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/17] qapi: centralize the built-in module name definition
Date: Tue, 19 Jan 2021 13:02:36 -0500
Message-Id: <20210119180242.1570753-12-jsnow@redhat.com>
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

Use a constant to make it obvious we're referring to a very specific thing.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/schema.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index c519c18a5ec..887a1c82c6f 100644
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
@@ -152,7 +155,7 @@ def is_user_module(cls, name: str) -> bool:
 
     @classmethod
     def is_builtin_module(cls, name: str) -> bool:
-        return name == './builtin'
+        return name == cls.BUILTIN_MODULE_NAME
 
     @property
     def system_module(self) -> bool:
@@ -850,7 +853,7 @@ def __init__(self, fname):
         self._entity_dict = {}
         self._module_dict = OrderedDict()
         self._schema_dir = os.path.dirname(fname)
-        self._make_module('./builtin')  # built-ins
+        self._make_module(QAPISchemaModule.BUILTIN_MODULE_NAME)  # built-ins
         self._make_module(fname)
         self._predefining = True
         self._def_predefineds()
-- 
2.26.2


