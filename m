Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D46BA27DFBD
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 06:56:15 +0200 (CEST)
Received: from localhost ([::1]:45148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNUA2-0006hz-Ur
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 00:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kNTnN-0001Ee-C3
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 00:32:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kNTnG-0000a2-Kn
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 00:32:46 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601440361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=itrPxvWZ1hrMbZ0b6zEfXRPvPKtFF/q6z5kE7X/fAxs=;
 b=TZpATJyVq0vj5sIcaI7C2V0agLFrV9oJ3Eb7w/p+1bXOEYBzItCllgcwy1ENovt1DK5fKC
 a4c+prR3sjSKX7IILa/tf0VjEflyX7ec1i9XLT9T0wPK6UHDKrDjTGzOrJRK+UoCFcVlk0
 Tdo/vBbRQ35kro9Xzp6F0TSSh3uixJA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-JPq8yBnGMA-JuSkpQ1fxKg-1; Wed, 30 Sep 2020 00:32:39 -0400
X-MC-Unique: JPq8yBnGMA-JuSkpQ1fxKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EEFF8030D6;
 Wed, 30 Sep 2020 04:32:38 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C87473678;
 Wed, 30 Sep 2020 04:32:36 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 21/46] qapi/common.py: move build_params into gen.py
Date: Wed, 30 Sep 2020 00:31:25 -0400
Message-Id: <20200930043150.1454766-22-jsnow@redhat.com>
In-Reply-To: <20200930043150.1454766-1-jsnow@redhat.com>
References: <20200930043150.1454766-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:31:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Including it in common.py creates a circular import dependency; schema
relies on common, but common.build_params requires a type annotation
from schema. To type this properly, it needs to be moved outside the
cycle.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/qapi/commands.py |  9 +++++++--
 scripts/qapi/common.py   | 23 -----------------------
 scripts/qapi/events.py   |  9 ++-------
 scripts/qapi/gen.py      | 31 +++++++++++++++++++++++++++++--
 4 files changed, 38 insertions(+), 34 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 5dc2f5a9fa8..f67393f8713 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -13,8 +13,13 @@
 See the COPYING file in the top-level directory.
 """
 
-from .common import build_params, c_name, mcgen
-from .gen import QAPIGenCCode, QAPISchemaModularCVisitor, ifcontext
+from .common import c_name, mcgen
+from .gen import (
+    QAPIGenCCode,
+    QAPISchemaModularCVisitor,
+    build_params,
+    ifcontext,
+)
 
 
 def gen_command_decl(name, arg_type, boxed, ret_type):
diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 0ef38ea5fe0..9ab0685cc51 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -209,26 +209,3 @@ def gen_endif(ifcond: Sequence[str]) -> str:
 #endif /* %(cond)s */
 ''', cond=ifc)
     return ret
-
-
-def build_params(arg_type,
-                 boxed: bool,
-                 extra: Optional[str] = None) -> str:
-    ret = ''
-    sep = ''
-    if boxed:
-        assert arg_type
-        ret += '%s arg' % arg_type.c_param_type()
-        sep = ', '
-    elif arg_type:
-        assert not arg_type.variants
-        for memb in arg_type.members:
-            ret += sep
-            sep = ', '
-            if memb.optional:
-                ret += 'bool has_%s, ' % c_name(memb.name)
-            ret += '%s %s' % (memb.type.c_param_type(),
-                              c_name(memb.name))
-    if extra:
-        ret += sep + extra
-    return ret if ret else 'void'
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index 6b3afa14d72..f840a62ed92 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -12,13 +12,8 @@
 See the COPYING file in the top-level directory.
 """
 
-from .common import (
-    build_params,
-    c_enum_const,
-    c_name,
-    mcgen,
-)
-from .gen import QAPISchemaModularCVisitor, ifcontext
+from .common import c_enum_const, c_name, mcgen
+from .gen import QAPISchemaModularCVisitor, build_params, ifcontext
 from .schema import QAPISchemaEnumMember
 from .types import gen_enum, gen_enum_lookup
 
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 61b3c53b180..b8a6fe8a5c3 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -2,9 +2,11 @@
 #
 # QAPI code generation
 #
-# Copyright (c) 2018-2019 Red Hat Inc.
+# Copyright IBM, Corp. 2011
+# Copyright (c) 2013-2019 Red Hat Inc.
 #
 # Authors:
+#  Anthony Liguori <aliguori@us.ibm.com>
 #  Markus Armbruster <armbru@redhat.com>
 #  Marc-André Lureau <marcandre.lureau@redhat.com>
 #
@@ -15,16 +17,18 @@
 import errno
 import os
 import re
+from typing import Optional
 
 from .common import (
     c_fname,
+    c_name,
     gen_endif,
     gen_if,
     guardend,
     guardstart,
     mcgen,
 )
-from .schema import QAPISchemaVisitor
+from .schema import QAPISchemaObjectType, QAPISchemaVisitor
 
 
 class QAPIGen:
@@ -90,6 +94,29 @@ def _wrap_ifcond(ifcond, before, after):
     return out
 
 
+def build_params(arg_type: Optional[QAPISchemaObjectType],
+                 boxed: bool,
+                 extra: Optional[str] = None) -> str:
+    ret = ''
+    sep = ''
+    if boxed:
+        assert arg_type
+        ret += '%s arg' % arg_type.c_param_type()
+        sep = ', '
+    elif arg_type:
+        assert not arg_type.variants
+        for memb in arg_type.members:
+            ret += sep
+            sep = ', '
+            if memb.optional:
+                ret += 'bool has_%s, ' % c_name(memb.name)
+            ret += '%s %s' % (memb.type.c_param_type(),
+                              c_name(memb.name))
+    if extra:
+        ret += sep + extra
+    return ret if ret else 'void'
+
+
 class QAPIGenCCode(QAPIGen):
 
     def __init__(self, fname):
-- 
2.26.2


