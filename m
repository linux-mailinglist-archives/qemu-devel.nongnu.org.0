Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C3C2FBF57
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:50:12 +0100 (CET)
Received: from localhost ([::1]:49738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1w4x-0001mp-Fm
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:50:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1vLV-0007ji-DJ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:03:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1vLT-0005RF-Ek
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611079390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4BZcb8KNqwK0gahDQWfoq7j5v/5e8ewZXJZ319ijxO0=;
 b=hj+/v75ZgmD7F+7PiHXKdw/C41u9i3KCJmYOcFHvHQwRMH/WvNMd7rLtNAoryPIJp8/DYy
 ZwxqYiemwc068YQnU3cmf4XUx7PK1Nn9nDl9tqF5vJiMspw8yU3liIYaNu+FPosbGP/qkD
 1XFrK9PCQT6tfHqpvyDz1CGMnem5boA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-2ejfURv6NTGd2tTcZIYjDg-1; Tue, 19 Jan 2021 13:03:09 -0500
X-MC-Unique: 2ejfURv6NTGd2tTcZIYjDg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2552E107AD47
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 18:02:58 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22CF95D9DD;
 Tue, 19 Jan 2021 18:02:56 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/17] qapi/gen: Replace ._begin_system_module()
Date: Tue, 19 Jan 2021 13:02:32 -0500
Message-Id: <20210119180242.1570753-8-jsnow@redhat.com>
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

From: Markus Armbruster <armbru@redhat.com>

QAPISchemaModularCVisitor._begin_system_module() is actually just for
the builtin module.  Rename it to ._begin_builtin_module() and drop
its useless @name parameter.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/gen.py   | 4 ++--
 scripts/qapi/types.py | 2 +-
 scripts/qapi/visit.py | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 3b7eddc1c21..9f850d23646 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -295,7 +295,7 @@ def write(self, output_dir: str, opt_builtins: bool = False) -> None:
             genc.write(output_dir)
             genh.write(output_dir)
 
-    def _begin_system_module(self, name: None) -> None:
+    def _begin_builtin_module(self) -> None:
         pass
 
     def _begin_user_module(self, name: str) -> None:
@@ -305,7 +305,7 @@ def visit_module(self, module: QAPISchemaModule) -> None:
         if module.system_module:
             if self._builtin_blurb:
                 self._add_system_module(None, self._builtin_blurb)
-                self._begin_system_module(module.name)
+                self._begin_builtin_module()
             else:
                 # The built-in module has not been created.  No code may
                 # be generated.
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index 2b4916cdaa1..dbf58c0b91d 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -271,7 +271,7 @@ def __init__(self, prefix: str):
             prefix, 'qapi-types', ' * Schema-defined QAPI types',
             ' * Built-in QAPI types', __doc__)
 
-    def _begin_system_module(self, name: None) -> None:
+    def _begin_builtin_module(self) -> None:
         self._genc.preamble_add(mcgen('''
 #include "qemu/osdep.h"
 #include "qapi/dealloc-visitor.h"
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 339f1521524..568ba35592c 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -305,7 +305,7 @@ def __init__(self, prefix: str):
             prefix, 'qapi-visit', ' * Schema-defined QAPI visitors',
             ' * Built-in QAPI visitors', __doc__)
 
-    def _begin_system_module(self, name: None) -> None:
+    def _begin_builtin_module(self) -> None:
         self._genc.preamble_add(mcgen('''
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-- 
2.26.2


