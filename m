Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0511431405F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:25:21 +0100 (CET)
Received: from localhost ([::1]:44236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9D60-00034u-09
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:25:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l974i-0005gW-JY
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:59:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9745-0001dW-D8
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:59:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612792736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yx2KdFKFJXy+auIFa0SIFenoTRP01v3Xdi8GhMvXbvM=;
 b=gwMRwnKAn1RmtJd0EZwdgAg/nHY6BrpTAhBpx3NSR6NSdG9ZxXLlhBb2R1rvfi6IzqW8Ho
 CIySvRnpOsWX6BId6dI/PI3X23UciJhz3BTkiELixC477sKVurTUCfiYkn7wi3VUncOOfb
 svqjhS3SYIaIYd7MEbbjv2eqX0sUzQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-xM6A2wDiM56brOMxV6gJAQ-1; Mon, 08 Feb 2021 08:58:51 -0500
X-MC-Unique: xM6A2wDiM56brOMxV6gJAQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC58E79EC0;
 Mon,  8 Feb 2021 13:58:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C1C4189A5;
 Mon,  8 Feb 2021 13:58:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 70F8211329B3; Mon,  8 Feb 2021 14:58:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/16] qapi: centralize the built-in module name definition
Date: Mon,  8 Feb 2021 14:58:40 +0100
Message-Id: <20210208135846.3707170-11-armbru@redhat.com>
In-Reply-To: <20210208135846.3707170-1-armbru@redhat.com>
References: <20210208135846.3707170-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Use a constant to make it obvious we're referring to a very specific thing.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210201193747.2169670-11-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/schema.py | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 14cf9da784..353e8020a2 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -68,7 +68,7 @@ class QAPISchemaEntity:
 
     def _set_module(self, schema, info):
         assert self._checked
-        fname = info.fname if info else './builtin'
+        fname = info.fname if info else QAPISchemaModule.BUILTIN_MODULE_NAME
         self._module = schema.module_by_fname(fname)
         self._module.add_entity(self)
 
@@ -138,6 +138,9 @@ class QAPISchemaVisitor:
 
 
 class QAPISchemaModule:
+
+    BUILTIN_MODULE_NAME = './builtin'
+
     def __init__(self, name):
         self.name = name
         self._entity_list = []
@@ -160,14 +163,14 @@ class QAPISchemaModule:
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
@@ -853,7 +856,7 @@ class QAPISchema:
         self._entity_dict = {}
         self._module_dict = OrderedDict()
         self._schema_dir = os.path.dirname(fname)
-        self._make_module('./builtin')
+        self._make_module(QAPISchemaModule.BUILTIN_MODULE_NAME)
         self._make_module(fname)
         self._predefining = True
         self._def_predefineds()
-- 
2.26.2


