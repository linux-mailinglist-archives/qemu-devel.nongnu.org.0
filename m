Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE2B346C7E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:23:25 +0100 (CET)
Received: from localhost ([::1]:41288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpQq-0007wi-1e
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1u-0007YN-PG
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1T-0002ov-Jf
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616536629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oK3tQ2uWaIc3eX+TrlnBNSz3nwtMZ0vz2Ih0d1LKk4A=;
 b=KUHytrsKnecrJYGeT8sD6lQuVkwxKcQCUAAXI0X/23GaNh+pIh1M4iA/8y4FypBpZ4JP4f
 GvmqMbPkbJzmI9u3+BUWUKBCX/rh53qj+uGuyEL9Lnjjg8VBm0kEM4lYxO3aMPHpng5dtm
 /ez4SMYXRtGBkVsDMcCKN09OGinv6e4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-pqZd_OvBPPCRcHn0UYQRtw-1; Tue, 23 Mar 2021 17:57:04 -0400
X-MC-Unique: pqZd_OvBPPCRcHn0UYQRtw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 896651B2C988;
 Tue, 23 Mar 2021 21:57:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 318AC1B581;
 Tue, 23 Mar 2021 21:57:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CB4C611326A7; Tue, 23 Mar 2021 22:56:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/29] qapi: Rename pragma *-whitelist to *-exceptions
Date: Tue, 23 Mar 2021 22:56:48 +0100
Message-Id: <20210323215658.3840228-20-armbru@redhat.com>
In-Reply-To: <20210323215658.3840228-1-armbru@redhat.com>
References: <20210323215658.3840228-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename pragma returns-whitelist to command-returns-exceptions, and
name-case-whitelist to member-name-case-exceptions.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210323094025.3569441-20-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 docs/devel/qapi-code-gen.txt                  | 21 ++++++++++---------
 qapi/pragma.json                              |  4 ++--
 qga/qapi-schema.json                          |  2 +-
 scripts/qapi/expr.py                          |  4 ++--
 scripts/qapi/parser.py                        |  8 +++----
 scripts/qapi/schema.py                        |  2 +-
 scripts/qapi/source.py                        |  8 +++----
 tests/qapi-schema/enum-member-case.json       |  2 +-
 .../pragma-value-not-list-of-str.err          |  2 +-
 .../pragma-value-not-list-of-str.json         |  2 +-
 tests/qapi-schema/pragma-value-not-list.err   |  2 +-
 tests/qapi-schema/pragma-value-not-list.json  |  3 +--
 tests/qapi-schema/qapi-schema-test.json       |  2 +-
 tests/qapi-schema/returns-bad-type.json       |  2 +-
 14 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt
index 6906a06ad2..23e9823019 100644
--- a/docs/devel/qapi-code-gen.txt
+++ b/docs/devel/qapi-code-gen.txt
@@ -147,9 +147,10 @@ prevent incomplete include files.
 === Pragma directives ===
 
 Syntax:
-    PRAGMA = { 'pragma': { '*doc-required': BOOL,
-                           '*returns-whitelist': [ STRING, ... ],
-                           '*name-case-whitelist': [ STRING, ... ] } }
+    PRAGMA = { 'pragma': {
+                   '*doc-required': BOOL,
+                   '*command-returns-exceptions': [ STRING, ... ],
+                   '*member-name-exceptions': [ STRING, ... ] } }
 
 The pragma directive lets you control optional generator behavior.
 
@@ -159,11 +160,11 @@ pragma to different values in parts of the schema doesn't work.
 Pragma 'doc-required' takes a boolean value.  If true, documentation
 is required.  Default is false.
 
-Pragma 'returns-whitelist' takes a list of command names that may
+Pragma 'command-returns-exceptions' takes a list of commands that may
 violate the rules on permitted return types.  Default is none.
 
-Pragma 'name-case-whitelist' takes a list of names that may violate
-rules on use of upper- vs. lower-case letters.  Default is none.
+Pragma 'member-name-exceptions' takes a list of types whose member
+names may contain uppercase letters.  Default is none.
 
 
 === Enumeration types ===
@@ -490,9 +491,9 @@ are the arguments.  A union type requires 'boxed': true.
 Member 'returns' defines the command's return type.  It defaults to an
 empty struct type.  It must normally be a complex type or an array of
 a complex type.  To return anything else, the command must be listed
-in pragma 'returns-whitelist'.  If you do this, extending the command
-to return additional information will be harder.  Use of
-'returns-whitelist' for new commands is strongly discouraged.
+in pragma 'commands-returns-exceptions'.  If you do this, extending
+the command to return additional information will be harder.  Use of
+the pragma for new commands is strongly discouraged.
 
 A command's error responses are not specified in the QAPI schema.
 Error conditions should be documented in comments.
@@ -755,7 +756,7 @@ Any name (command, event, type, member, or enum value) beginning with
 "x-" is marked experimental, and may be withdrawn or changed
 incompatibly in a future release.
 
-Pragma 'name-case-whitelist' lets you violate the rules on use of
+Pragma 'member-name-exceptions' lets you violate the rules on use of
 upper and lower case.  Use for new code is strongly discouraged.
 
 
diff --git a/qapi/pragma.json b/qapi/pragma.json
index 7f158e183d..4895848c5e 100644
--- a/qapi/pragma.json
+++ b/qapi/pragma.json
@@ -4,13 +4,13 @@
 # add to them!
 { 'pragma': {
     # Commands allowed to return a non-dictionary:
-    'returns-whitelist': [
+    'command-returns-exceptions': [
         'human-monitor-command',
         'qom-get',
         'query-tpm-models',
         'query-tpm-types',
         'ringbuf-read' ],
-    'name-case-whitelist': [
+    'member-name-exceptions': [
         'ACPISlotType',             # DIMM, visible through query-acpi-ospm-status
         'BlockdevVmdkSubformat',    # all members, to match VMDK spec spellings
         'BlockdevVmdkAdapterType',  # legacyESX, to match VMDK spec spellings
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 9a82b7e952..2b08b761c2 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -20,7 +20,7 @@
 # add to them!
 { 'pragma': {
     # Commands allowed to return a non-dictionary:
-    'returns-whitelist': [
+    'command-returns-exceptions': [
         'guest-file-open',
         'guest-fsfreeze-freeze',
         'guest-fsfreeze-freeze-list',
diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 7bd15559de..85493efbac 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -181,7 +181,7 @@ def check_type(value, info, source,
         raise QAPISemError(info,
                            "%s should be an object or type name" % source)
 
-    permit_upper = allow_dict in info.pragma.name_case_whitelist
+    permit_upper = allow_dict in info.pragma.member_name_exceptions
 
     # value is a dictionary, check that each member is okay
     for (key, arg) in value.items():
@@ -224,7 +224,7 @@ def check_enum(expr, info):
     if prefix is not None and not isinstance(prefix, str):
         raise QAPISemError(info, "'prefix' must be a string")
 
-    permit_upper = name in info.pragma.name_case_whitelist
+    permit_upper = name in info.pragma.member_name_exceptions
 
     members[:] = [m if isinstance(m, dict) else {'name': m}
                   for m in members]
diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 8eed69333f..c16b8b6995 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -132,12 +132,12 @@ def _pragma(self, name, value, info):
                 raise QAPISemError(info,
                                    "pragma 'doc-required' must be boolean")
             info.pragma.doc_required = value
-        elif name == 'returns-whitelist':
+        elif name == 'command-returns-exceptions':
             self._check_pragma_list_of_str(name, value, info)
-            info.pragma.returns_whitelist = value
-        elif name == 'name-case-whitelist':
+            info.pragma.command_returns_exceptions = value
+        elif name == 'member-name-exceptions':
             self._check_pragma_list_of_str(name, value, info)
-            info.pragma.name_case_whitelist = value
+            info.pragma.member_name_exceptions = value
         else:
             raise QAPISemError(info, "unknown pragma '%s'" % name)
 
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index ff16578f6d..703b446fd2 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -779,7 +779,7 @@ def check(self, schema):
         if self._ret_type_name:
             self.ret_type = schema.resolve_type(
                 self._ret_type_name, self.info, "command's 'returns'")
-            if self.name not in self.info.pragma.returns_whitelist:
+            if self.name not in self.info.pragma.command_returns_exceptions:
                 typ = self.ret_type
                 if isinstance(typ, QAPISchemaArrayType):
                     typ = self.ret_type.element_type
diff --git a/scripts/qapi/source.py b/scripts/qapi/source.py
index d7a79a9b8a..d8f9ec377f 100644
--- a/scripts/qapi/source.py
+++ b/scripts/qapi/source.py
@@ -21,10 +21,10 @@ class QAPISchemaPragma:
     def __init__(self) -> None:
         # Are documentation comments required?
         self.doc_required = False
-        # Whitelist of commands allowed to return a non-dictionary
-        self.returns_whitelist: List[str] = []
-        # Whitelist of entities allowed to violate case conventions
-        self.name_case_whitelist: List[str] = []
+        # Commands allowed to return a non-dictionary
+        self.command_returns_exceptions: List[str] = []
+        # Types whose member names may violate case conventions
+        self.member_name_exceptions: List[str] = []
 
 
 class QAPISourceInfo:
diff --git a/tests/qapi-schema/enum-member-case.json b/tests/qapi-schema/enum-member-case.json
index f8af3e4622..b8969d224d 100644
--- a/tests/qapi-schema/enum-member-case.json
+++ b/tests/qapi-schema/enum-member-case.json
@@ -1,4 +1,4 @@
 # Member names should be 'lower-case' unless the enum is whitelisted
-{ 'pragma': { 'name-case-whitelist': [ 'UuidInfo' ] } }
+{ 'pragma': { 'member-name-exceptions': [ 'UuidInfo' ] } }
 { 'enum': 'UuidInfo', 'data': [ 'Value' ] } # UuidInfo is whitelisted
 { 'enum': 'NoWayThisWillGetWhitelisted', 'data': [ 'Value' ] }
diff --git a/tests/qapi-schema/pragma-value-not-list-of-str.err b/tests/qapi-schema/pragma-value-not-list-of-str.err
index 44870fe5d9..b81983dd85 100644
--- a/tests/qapi-schema/pragma-value-not-list-of-str.err
+++ b/tests/qapi-schema/pragma-value-not-list-of-str.err
@@ -1 +1 @@
-pragma-value-not-list-of-str.json:3: pragma returns-whitelist must be a list of strings
+pragma-value-not-list-of-str.json:3: pragma command-returns-exceptions must be a list of strings
diff --git a/tests/qapi-schema/pragma-value-not-list-of-str.json b/tests/qapi-schema/pragma-value-not-list-of-str.json
index 12bbbed2e8..27811cff73 100644
--- a/tests/qapi-schema/pragma-value-not-list-of-str.json
+++ b/tests/qapi-schema/pragma-value-not-list-of-str.json
@@ -1,3 +1,3 @@
 # pragma value must be list of strings
 
-{ 'pragma': { 'returns-whitelist': [ 'good', [ 'bad' ] ] } }
+{ 'pragma': { 'command-returns-exceptions': [ 'good', [ 'bad' ] ] } }
diff --git a/tests/qapi-schema/pragma-value-not-list.err b/tests/qapi-schema/pragma-value-not-list.err
index 21736c5723..45dde1bf05 100644
--- a/tests/qapi-schema/pragma-value-not-list.err
+++ b/tests/qapi-schema/pragma-value-not-list.err
@@ -1 +1 @@
-pragma-value-not-list.json:3: pragma name-case-whitelist must be a list of strings
+pragma-value-not-list.json:2: pragma member-name-exceptions must be a list of strings
diff --git a/tests/qapi-schema/pragma-value-not-list.json b/tests/qapi-schema/pragma-value-not-list.json
index 2c61a97dd3..3faa340c3b 100644
--- a/tests/qapi-schema/pragma-value-not-list.json
+++ b/tests/qapi-schema/pragma-value-not-list.json
@@ -1,3 +1,2 @@
 # pragma value must be list
-
-{ 'pragma': { 'name-case-whitelist': false } }
+{ 'pragma': { 'member-name-exceptions': false } }
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index a355321258..16b03bf308 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -7,7 +7,7 @@
 # Whitelists to permit QAPI rule violations
 { 'pragma': {
     # Commands allowed to return a non-dictionary:
-    'returns-whitelist': [
+    'command-returns-exceptions': [
         'guest-get-time',
         'guest-sync' ] } }
 
diff --git a/tests/qapi-schema/returns-bad-type.json b/tests/qapi-schema/returns-bad-type.json
index da209329b1..0dd96e739e 100644
--- a/tests/qapi-schema/returns-bad-type.json
+++ b/tests/qapi-schema/returns-bad-type.json
@@ -1,6 +1,6 @@
 # we enforce that 'returns' be a dict or array of dict unless whitelisted
 
-{ 'pragma': { 'returns-whitelist': [
+{ 'pragma': { 'command-returns-exceptions': [
     'human-monitor-command', 'query-tpm-models', 'guest-get-time' ] } }
 
 { 'command': 'human-monitor-command',
-- 
2.26.3


