Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD4F27DFA4
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 06:42:33 +0200 (CEST)
Received: from localhost ([::1]:56186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNTwm-00050e-5s
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 00:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kNTn9-00011j-Ug
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 00:32:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kNTn7-0000Yl-Vx
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 00:32:35 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601440353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6wJeioDUsMcpBGeCVGddCyLvkpRRnjCg33yB2VwN4ck=;
 b=YgdPNT5xJ2r81ZVCQQyBzF9L+MCRYnuj3F58/X/V8wSwrg/93+z4PDCJPfXyrSpWd8lrHe
 DjvXTidivHP/S/UKCkDdHNWIwq7af8xe7+eZrf0KvqAa9zrBKQCIQHi+ZxNwUDT7S+sH2n
 npJKhuwZNPp4Sm833+dlsmIiGrp6eVY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-oWrrWm3LOei93VrohmCpUw-1; Wed, 30 Sep 2020 00:32:29 -0400
X-MC-Unique: oWrrWm3LOei93VrohmCpUw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE0871074651;
 Wed, 30 Sep 2020 04:32:27 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43E2373678;
 Wed, 30 Sep 2020 04:32:26 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/46] qapi/common.py: Add indent manager
Date: Wed, 30 Sep 2020 00:31:19 -0400
Message-Id: <20200930043150.1454766-16-jsnow@redhat.com>
In-Reply-To: <20200930043150.1454766-1-jsnow@redhat.com>
References: <20200930043150.1454766-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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

Code style tools really dislike the use of global keywords, because it
generally involves re-binding the name at runtime which can have strange
effects depending on when and how that global name is referenced in
other modules.

Make a little indent level manager instead.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/qapi/common.py | 49 ++++++++++++++++++++++++++++--------------
 scripts/qapi/visit.py  |  7 +++---
 2 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index cee63eb95c7..b35318b72cf 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -93,33 +93,50 @@ def c_name(name, protect=True):
 pointer_suffix = ' *' + eatspace
 
 
-def genindent(count):
-    ret = ''
-    for _ in range(count):
-        ret += ' '
-    return ret
+class Indentation:
+    """
+    Indentation level management.
 
+    :param initial: Initial number of spaces, default 0.
+    """
+    def __init__(self, initial: int = 0) -> None:
+        self._level = initial
 
-indent_level = 0
+    def __int__(self) -> int:
+        return self._level
 
+    def __repr__(self) -> str:
+        return "{}({:d})".format(type(self).__name__, self._level)
 
-def push_indent(indent_amount=4):
-    global indent_level
-    indent_level += indent_amount
+    def __str__(self) -> str:
+        """Return the current indentation as a string of spaces."""
+        return ' ' * self._level
 
+    def __bool__(self) -> bool:
+        """True when there is a non-zero indentation."""
+        return bool(self._level)
 
-def pop_indent(indent_amount=4):
-    global indent_level
-    indent_level -= indent_amount
+    def increase(self, amount: int = 4) -> None:
+        """Increase the indentation level by ``amount``, default 4."""
+        self._level += amount
+
+    def decrease(self, amount: int = 4) -> None:
+        """Decrease the indentation level by ``amount``, default 4."""
+        if self._level < amount:
+            raise ArithmeticError(
+                f"Can't remove {amount:d} spaces from {self!r}")
+        self._level -= amount
+
+
+indent = Indentation()
 
 
 # Generate @code with @kwds interpolated.
-# Obey indent_level, and strip eatspace.
+# Obey indent, and strip eatspace.
 def cgen(code, **kwds):
     raw = code % kwds
-    if indent_level:
-        indent = genindent(indent_level)
-        raw = re.sub(r'^(?!(#|$))', indent, raw, flags=re.MULTILINE)
+    if indent:
+        raw = re.sub(r'^(?!(#|$))', str(indent), raw, flags=re.MULTILINE)
     return re.sub(re.escape(eatspace) + r' *', '', raw)
 
 
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 808410d6f1b..14f30c228b7 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -18,9 +18,8 @@
     c_name,
     gen_endif,
     gen_if,
+    indent,
     mcgen,
-    pop_indent,
-    push_indent,
 )
 from .gen import QAPISchemaModularCVisitor, ifcontext
 from .schema import QAPISchemaObjectType
@@ -69,7 +68,7 @@ def gen_visit_object_members(name, base, members, variants):
     if (visit_optional(v, "%(name)s", &obj->has_%(c_name)s)) {
 ''',
                          name=memb.name, c_name=c_name(memb.name))
-            push_indent()
+            indent.increase()
         ret += mcgen('''
     if (!visit_type_%(c_type)s(v, "%(name)s", &obj->%(c_name)s, errp)) {
         return false;
@@ -78,7 +77,7 @@ def gen_visit_object_members(name, base, members, variants):
                      c_type=memb.type.c_name(), name=memb.name,
                      c_name=c_name(memb.name))
         if memb.optional:
-            pop_indent()
+            indent.decrease()
             ret += mcgen('''
     }
 ''')
-- 
2.26.2


