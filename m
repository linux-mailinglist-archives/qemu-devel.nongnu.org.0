Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE4437B156
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 00:08:24 +0200 (CEST)
Received: from localhost ([::1]:44584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgaYB-0001cR-D2
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 18:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaW4-0007Li-6u
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaW0-0006My-Ei
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620770767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jwxvOtk9fMBMeDS783vKAy8mU+8EtKGYID2z597kIyU=;
 b=aBLGSQ+RMTe8Su+8gZufAjDr5fyIpigcpOTANbkiln1MpC7Xpsd9/UIWY+dabpb8NlZ9xo
 oYEBv32wP4aMVdutxVyS47O5ZsZVs/0lazIRu3Cr4A1lX0ZrotX1cACoIMLW/HVxPva63N
 nepHaM0bzNUbw/4596xRq6ljulWwITs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-rdiSu9DiNDiVbp1j0sgn_g-1; Tue, 11 May 2021 18:06:04 -0400
X-MC-Unique: rdiSu9DiNDiVbp1j0sgn_g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59E42800D55;
 Tue, 11 May 2021 22:06:03 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0327BA6F;
 Tue, 11 May 2021 22:06:02 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/21] qapi/parser: Don't try to handle file errors
Date: Tue, 11 May 2021 18:05:41 -0400
Message-Id: <20210511220601.2110055-2-jsnow@redhat.com>
In-Reply-To: <20210511220601.2110055-1-jsnow@redhat.com>
References: <20210511220601.2110055-1-jsnow@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the try/except block that handles file-opening errors in
QAPISchemaParser.__init__() and add one each to
QAPISchemaParser._include() and QAPISchema.__init__() respectively.


The short-ish version of what motivates this patch is:

- It's hard to write a good error message in the init method,
  because we need to determine the context of our caller to do so.
  It's easier to just let the caller write the message.
- We don't want to allow QAPISourceInfo(None, None, None) to exist.
- Errors made using such an object are currently incorrect.
- It's not technically a semantic error if we cannot open the schema
- There are various typing constraints that make mixing these two cases
  undesirable for a single special case.

Other considerations:

- open() is moved to a 'with' block to ensure file pointers are
  cleaned up deterministically.
- Python 3.3 deprecated IOError and made it a synonym for OSError.
  Avoid the misleading perception these exception handlers are
  narrower than they really are.
- Not all QAPIError objects have an 'info' field, so remove that stanza
  from test-qapi. Don't bother to replace the early exit on purpose
  so that we can test its output in the next commit.


The long version:

The error message string here is incorrect (since 52a474180a):

> python3 qapi-gen.py 'fake.json'
qapi-gen.py: qapi-gen.py: can't read schema file 'fake.json': No such file or directory

In pursuing it, we find that QAPISourceInfo has a special accommodation
for when there's no filename. Meanwhile, the intended typing of
QAPISourceInfo was (non-optional) 'str'.

To remove this, I'd want to avoid having a "fake" QAPISourceInfo
object. We also don't want to explicitly begin accommodating
QAPISourceInfo itself being None, because we actually want to eventually
prove that this can never happen -- We don't want to confuse "The file
isn't open yet" with "This error stems from a definition that wasn't
defined in any file".

(An earlier series tried to create a dummy info object, but it was tough
to prove in review that it worked correctly without creating new
regressions. This patch avoids that distraction. We would like to first
prove that we never raise QAPISemError for any built-in object before we
add "special" info objects. We aren't ready to do that yet.)

So, which way out of the labyrinth?

Here's one way: Don't try to handle errors at a level with "mixed"
semantic contexts; i.e. don't mix inclusion errors (should report a
source line where the include was triggered) and command line errors
(where we specified a file we couldn't read).

Remove the error handling from the initializer of the parser. Pythonic!
Now it's the caller's job to figure out what to do about it. Handle the
error in QAPISchemaParser._include() instead, where we can write a
targeted error message where we are guaranteed to have an 'info' context
to report with.

The root level error can similarly move to QAPISchema.__init__(), where
we know we'll never have an info context to report with, so we use a
more abstract error type.

Now the error looks sensible again:

> python3 qapi-gen.py 'fake.json'
qapi-gen.py: can't read schema file 'fake.json': No such file or directory

With these error cases separated, QAPISourceInfo can be solidified as
never having placeholder arguments that violate our desired types. Clean
up test-qapi along similar lines.

Fixes: 52a474180a

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py         | 18 +++++++++---------
 scripts/qapi/schema.py         | 11 +++++++++--
 scripts/qapi/source.py         |  3 ---
 tests/qapi-schema/test-qapi.py |  3 ---
 4 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index ca5e8e18e00..a53b735e7de 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -40,15 +40,9 @@ def __init__(self, fname, previously_included=None, incl_info=None):
         previously_included = previously_included or set()
         previously_included.add(os.path.abspath(fname))
 
-        try:
-            fp = open(fname, 'r', encoding='utf-8')
+        # May raise OSError; allow the caller to handle it.
+        with open(fname, 'r', encoding='utf-8') as fp:
             self.src = fp.read()
-        except IOError as e:
-            raise QAPISemError(incl_info or QAPISourceInfo(None, None, None),
-                               "can't read %s file '%s': %s"
-                               % ("include" if incl_info else "schema",
-                                  fname,
-                                  e.strerror))
 
         if self.src == '' or self.src[-1] != '\n':
             self.src += '\n'
@@ -129,7 +123,13 @@ def _include(self, include, info, incl_fname, previously_included):
         if incl_abs_fname in previously_included:
             return None
 
-        return QAPISchemaParser(incl_fname, previously_included, info)
+        try:
+            return QAPISchemaParser(incl_fname, previously_included, info)
+        except OSError as err:
+            raise QAPISemError(
+                info,
+                f"can't read include file '{incl_fname}': {err.strerror}"
+            ) from err
 
     def _check_pragma_list_of_str(self, name, value, info):
         if (not isinstance(value, list)
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 3a4172fb749..d1d27ff7ee8 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -20,7 +20,7 @@
 from typing import Optional
 
 from .common import POINTER_SUFFIX, c_name
-from .error import QAPISemError, QAPISourceError
+from .error import QAPIError, QAPISemError, QAPISourceError
 from .expr import check_exprs
 from .parser import QAPISchemaParser
 
@@ -849,7 +849,14 @@ def visit(self, visitor):
 class QAPISchema:
     def __init__(self, fname):
         self.fname = fname
-        parser = QAPISchemaParser(fname)
+
+        try:
+            parser = QAPISchemaParser(fname)
+        except OSError as err:
+            raise QAPIError(
+                f"can't read schema file '{fname}': {err.strerror}"
+            ) from err
+
         exprs = check_exprs(parser.exprs)
         self.docs = parser.docs
         self._entity_list = []
diff --git a/scripts/qapi/source.py b/scripts/qapi/source.py
index 03b6ede0828..1ade864d7b9 100644
--- a/scripts/qapi/source.py
+++ b/scripts/qapi/source.py
@@ -10,7 +10,6 @@
 # See the COPYING file in the top-level directory.
 
 import copy
-import sys
 from typing import List, Optional, TypeVar
 
 
@@ -53,8 +52,6 @@ def next_line(self: T) -> T:
         return info
 
     def loc(self) -> str:
-        if self.fname is None:
-            return sys.argv[0]
         ret = self.fname
         if self.line is not None:
             ret += ':%d' % self.line
diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi.py
index e8db9d09d91..f1c4deb9a51 100755
--- a/tests/qapi-schema/test-qapi.py
+++ b/tests/qapi-schema/test-qapi.py
@@ -128,9 +128,6 @@ def test_and_diff(test_name, dir_name, update):
     try:
         test_frontend(os.path.join(dir_name, test_name + '.json'))
     except QAPIError as err:
-        if err.info.fname is None:
-            print("%s" % err, file=sys.stderr)
-            return 2
         errstr = str(err) + '\n'
         if dir_name:
             errstr = errstr.replace(dir_name + '/', '')
-- 
2.30.2


