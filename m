Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBEF274A8A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 23:03:45 +0200 (CEST)
Received: from localhost ([::1]:36350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKpRv-0003g2-Vo
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 17:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpPw-00022Y-JC
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:01:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpPq-0004Z3-PV
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:01:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600808488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ghDb5rKOmGTyb03vCBBcn9DARDR8dEGxmDStUABhhqE=;
 b=Z1+y0zjWolhB2hKcYB+HH/FfcBaZniUJH2FpdnXiVr1Oms8Dw81wpuAMx4ydt1Tkz5a6JN
 FjO7Fjk4ZL31bq7UO1R29qXuf73b6bBtxN35rND84NyOmuOm4Fa/PStYXtFs64KRoLAn0g
 ElEFg1RNs2yXlW7ShpAiiaLgoHKBOlw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-6Vv_IK32Nu2WhiCCUWCLOA-1; Tue, 22 Sep 2020 17:01:21 -0400
X-MC-Unique: 6Vv_IK32Nu2WhiCCUWCLOA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8506F80F056;
 Tue, 22 Sep 2020 21:01:20 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A3FB55765;
 Tue, 22 Sep 2020 21:01:18 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 09/38] qapi/common.py: Add indent manager
Date: Tue, 22 Sep 2020 17:00:32 -0400
Message-Id: <20200922210101.4081073-10-jsnow@redhat.com>
In-Reply-To: <20200922210101.4081073-1-jsnow@redhat.com>
References: <20200922210101.4081073-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 15:47:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Code style tools really dislike the use of global keywords, because it
generally involves re-binding the name at runtime which can have strange
effects depending on when and how that global name is referenced in
other modules.

Make a little indent level manager instead.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/common.py | 51 +++++++++++++++++++++++++++++-------------
 scripts/qapi/visit.py  |  7 +++---
 2 files changed, 38 insertions(+), 20 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index cee63eb95c..e0c5871b10 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -93,33 +93,52 @@ def c_name(name, protect=True):
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
+    def increase(self, amount: int = 4) -> int:
+        """Increase the indentation level by `amount`, default 4."""
+        self._level += amount
+        return self._level
+
+    def decrease(self, amount: int = 4) -> int:
+        """Decrease the indentation level by `amount`, default 4."""
+        if self._level < amount:
+            raise ArithmeticError(
+                f"Can't remove {amount:d} spaces from {self!r}")
+        self._level -= amount
+        return self._level
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
index 808410d6f1..4edaee33e3 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -19,8 +19,7 @@
     gen_endif,
     gen_if,
     mcgen,
-    pop_indent,
-    push_indent,
+    indent,
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


