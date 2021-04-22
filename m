Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 757EF3677C8
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 05:12:46 +0200 (CEST)
Received: from localhost ([::1]:50280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZPll-0003Fb-Hc
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 23:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPgr-0006LG-9R
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPgc-0006Pp-Un
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619060845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gEz07BQQAy3Wf56JTsirqqR3UI5WCp9HQvhee+cJaj0=;
 b=I6gjdt3pnOPtGxWvmK/KdSOpTRwDviVp1nKWI7VlegpBT26LvorkGlST3tgpuU+26mr2zk
 x2d4w6ZvZjxh8/CHx0ubVf8nzeo/uWYoYzetMYV4at1ztcV6BUlT7bq3PrQsMj5eouKaCI
 HigX9y+X3JGy7G//q4fXgj/WuMhG9kA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-xJ9f6RPdMZ-MTmr1Ly8KGw-1; Wed, 21 Apr 2021 23:07:23 -0400
X-MC-Unique: xJ9f6RPdMZ-MTmr1Ly8KGw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4567E8189C8;
 Thu, 22 Apr 2021 03:07:22 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BA422915B;
 Thu, 22 Apr 2021 03:07:21 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/22] qapi/parser: Don't try to handle file errors
Date: Wed, 21 Apr 2021 23:06:59 -0400
Message-Id: <20210422030720.3685766-2-jsnow@redhat.com>
In-Reply-To: <20210422030720.3685766-1-jsnow@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The short-ish version of what motivates this patch is:

- The parser initializer does not possess adequate context to write a
  good error message -- It tries to determine the caller's semantic
  context.
- We don't want to allow QAPISourceInfo(None, None, None) to exist.
- Errors made using such an object are currently incorrect.
- It's not technically a semantic error if we cannot open the schema
- There are various typing constraints that make mixing these two cases
  undesirable for a single special case.
- The current open block in parser's initializer will leak file
  pointers, because it isn't using a with statement.


Here's the details in why this got written the way it did, and why a few
disparate issues are rolled into one commit. (They're hard to fix
separately without writing really weird stuff that'd be harder to
review.)

The error message string here is incorrect:

> python3 qapi-gen.py 'fake.json'
qapi-gen.py: qapi-gen.py: can't read schema file 'fake.json': No such file or directory

In pursuing it, we find that QAPISourceInfo has a special accommodation
for when there's no filename. Meanwhile, we intend to type info.fname as
str; something we always have.

To remove this, we need to not have a "fake" QAPISourceInfo object. We
also don't want to explicitly begin accommodating QAPISourceInfo being
None, because we actually want to eventually prove that this can never
happen -- We don't want to confuse "The file isn't open yet" with "This
error stems from a definition that wasn't defined in any file".

(An earlier series tried to create an official dummy object, but it was
tough to prove in review that it worked correctly without creating new
regressions. This patch avoids trying to re-litigate that discussion.

We would like to first prove that we never raise QAPISemError for any
built-in object before we relent and add "special" info objects. We
aren't ready to do that yet, so crashing is preferred.)

So, how to solve this mess?

Here's one way: Don't try to handle errors at a level with "mixed"
semantic levels; i.e. don't try to handle inclusion errors (should
report a source line where the include was triggered) with command line
errors (where we specified a file we couldn't read).

Simply remove the error handling from the initializer of the
parser. Pythonic! Now it's the caller's job to figure out what to do
about it. Handle the error in QAPISchemaParser._include() instead, where
we do have the correct semantic context to not need to play games with
the error message generation.

Next, to re-gain a nice error at the top level, add a new try/except
into qapi/main.generate(). Now the error looks sensible:

> python3 qapi-gen.py 'fake.json'
qapi-gen.py: can't read schema file 'fake.json': No such file or directory

Lastly, with this usage gone, we can remove the special type violation
from QAPISourceInfo, and all is well with the world.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/main.py   |  8 +++++++-
 scripts/qapi/parser.py | 18 +++++++++---------
 scripts/qapi/source.py |  3 ---
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
index 703e7ed1ed5..70f8aa86f37 100644
--- a/scripts/qapi/main.py
+++ b/scripts/qapi/main.py
@@ -48,7 +48,13 @@ def generate(schema_file: str,
     """
     assert invalid_prefix_char(prefix) is None
 
-    schema = QAPISchema(schema_file)
+    try:
+        schema = QAPISchema(schema_file)
+    except OSError as err:
+        raise QAPIError(
+            f"can't read schema file '{schema_file}': {err.strerror}"
+        ) from err
+
     gen_types(schema, output_dir, prefix, builtins)
     gen_visit(schema, output_dir, prefix, builtins)
     gen_commands(schema, output_dir, prefix)
diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index ca5e8e18e00..b378fa33807 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -40,15 +40,9 @@ def __init__(self, fname, previously_included=None, incl_info=None):
         previously_included = previously_included or set()
         previously_included.add(os.path.abspath(fname))
 
-        try:
-            fp = open(fname, 'r', encoding='utf-8')
+        # Allow the caller to catch this error.
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
-- 
2.30.2


