Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCBA346C3D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:21:13 +0100 (CET)
Received: from localhost ([::1]:33054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpOi-00043e-E7
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1u-0007YR-P7
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1T-0002p5-Jj
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616536630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hmpR7JQINpqwOvi0xnhoJLWAROu61vSxuMW8ntIZv+U=;
 b=M2t5+CSAR0G40G+6RS1EnnCTIX4TfG0YaDMfhj919GtCaPs/bOa5Lt6Aq1zlFoIY//G47o
 44/7sG77FnkkGMuYr7CDmRVzjszjmjEFT5w8mTioDjfpHxc6nJmUkdQA1QA961wRa7tt1J
 /4N/oxz89KVtXeQUNiJLrIKmroqUAfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-mEX_mV4BOdC7pyTHtfvdjg-1; Tue, 23 Mar 2021 17:57:04 -0400
X-MC-Unique: mEX_mV4BOdC7pyTHtfvdjg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85B7580364C;
 Tue, 23 Mar 2021 21:57:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 30EE063BA7;
 Tue, 23 Mar 2021 21:57:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0487011326AF; Tue, 23 Mar 2021 22:56:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/29] qapi: Enforce struct member naming rules
Date: Tue, 23 Mar 2021 22:56:55 +0100
Message-Id: <20210323215658.3840228-27-armbru@redhat.com>
In-Reply-To: <20210323215658.3840228-1-armbru@redhat.com>
References: <20210323215658.3840228-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Struct members, including command arguments, event data, and union
inline base members, should use '-', not '_'.  Enforce this.  Fix the
fixable offenders (all in tests/), and add the remainder to pragma
member-name-exceptions.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210323094025.3569441-27-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 docs/devel/qapi-code-gen.txt                    |  3 ++-
 qapi/pragma.json                                | 17 +++++++++++++++++
 qga/qapi-schema.json                            |  4 ++++
 scripts/qapi/expr.py                            |  5 +++--
 tests/qapi-schema/qapi-schema-test.json         |  8 ++++++--
 tests/qapi-schema/qapi-schema-test.out          |  4 ++--
 tests/qapi-schema/struct-member-name-clash.err  |  2 +-
 tests/qapi-schema/struct-member-name-clash.json |  1 +
 8 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt
index 10e9a0f829..c1cb6f987d 100644
--- a/docs/devel/qapi-code-gen.txt
+++ b/docs/devel/qapi-code-gen.txt
@@ -168,7 +168,8 @@ Pragma 'command-returns-exceptions' takes a list of commands that may
 violate the rules on permitted return types.  Default is none.
 
 Pragma 'member-name-exceptions' takes a list of types whose member
-names may contain uppercase letters.  Default is none.
+names may contain uppercase letters, and '_' instead of '-'.  Default
+is none.
 
 
 === Enumeration types ===
diff --git a/qapi/pragma.json b/qapi/pragma.json
index 339f067943..f422a1a2ac 100644
--- a/qapi/pragma.json
+++ b/qapi/pragma.json
@@ -31,10 +31,27 @@
     # Externally visible types whose member names may use uppercase
     'member-name-exceptions': [     # visible in:
         'ACPISlotType',             # query-acpi-ospm-status
+        'AcpiTableOptions',         # -acpitable
+        'BlkdebugSetStateOptions',  # blockdev-add, -blockdev
+        'BlockDeviceInfo',          # query-block
+        'BlockDeviceStats',         # query-blockstats
+        'BlockDeviceTimedStats',    # query-blockstats
+        'BlockIOThrottle',          # block_set_io_throttle
+        'BlockInfo',                # query-block
         'BlockdevVmdkAdapterType',  # blockdev-create (to match VMDK spec)
         'BlockdevVmdkSubformat',    # blockdev-create (to match VMDK spec)
+        'ColoCompareProperties',    # object_add, -object
+        'FilterMirrorProperties',   # object_add, -object
+        'FilterRedirectorProperties', # object_add, -object
+        'FilterRewriterProperties', # object_add, -object
+        'InputLinuxProperties',     # object_add, -object
+        'NetdevTapOptions',         # netdev_add, query-netdev, -netdev
+        'PciBusInfo',               # query-pci
+        'PciDeviceInfo',            # query-pci
+        'PciMemoryRegion',          # query-pci
         'QapiErrorClass',           # QMP error replies
         'UuidInfo',                 # query-uuid
+        'VncClientInfo',            # query-vnc, query-vnc-servers, ...
         'X86CPURegister32'          # qom-get of x86 CPU properties
                                     # feature-words, filtered-features
     ] } }
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 2b08b761c2..fb17eebde3 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -19,6 +19,10 @@
 # Whitelists to permit QAPI rule violations; think twice before you
 # add to them!
 { 'pragma': {
+    # Types whose member names may use '_'
+    'member-name-exceptions': [
+        'GuestAgentInfo'
+    ],
     # Commands allowed to return a non-dictionary:
     'command-returns-exceptions': [
         'guest-file-open',
diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 9193e68763..ba9f7ad350 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -184,7 +184,7 @@ def check_type(value, info, source,
         raise QAPISemError(info,
                            "%s should be an object or type name" % source)
 
-    permit_upper = allow_dict in info.pragma.member_name_exceptions
+    permissive = allow_dict in info.pragma.member_name_exceptions
 
     # value is a dictionary, check that each member is okay
     for (key, arg) in value.items():
@@ -192,7 +192,8 @@ def check_type(value, info, source,
         if key.startswith('*'):
             key = key[1:]
         check_name_lower(key, info, key_source,
-                         permit_upper, permit_underscore=True)
+                         permit_upper=permissive,
+                         permit_underscore=permissive)
         if c_name(key, False) == 'u' or c_name(key, False).startswith('has_'):
             raise QAPISemError(info, "%s uses reserved name" % key_source)
         check_keys(arg, info, key_source, ['type'], ['if', 'features'])
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index e635db4a35..387678acbb 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -6,6 +6,10 @@
 
 # Whitelists to permit QAPI rule violations
 { 'pragma': {
+    # Types whose member names may use '_'
+    'member-name-exceptions': [
+        'UserDefA'
+    ],
     # Commands allowed to return a non-dictionary:
     'command-returns-exceptions': [
         'guest-get-time',
@@ -231,7 +235,7 @@
   'if': 'defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)' }
 
 { 'command': 'test-if-union-cmd',
-  'data': { 'union_cmd_arg': 'TestIfUnion' },
+  'data': { 'union-cmd-arg': 'TestIfUnion' },
   'if': 'defined(TEST_IF_UNION)' }
 
 { 'alternate': 'TestIfAlternate', 'data':
@@ -240,7 +244,7 @@
   'if': 'defined(TEST_IF_ALT) && defined(TEST_IF_STRUCT)' }
 
 { 'command': 'test-if-alternate-cmd',
-  'data': { 'alt_cmd_arg': 'TestIfAlternate' },
+  'data': { 'alt-cmd-arg': 'TestIfAlternate' },
   'if': 'defined(TEST_IF_ALT)' }
 
 { 'command': 'test-if-cmd',
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 3f1ea345fd..51efe5d7cd 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -320,7 +320,7 @@ object TestIfUnion
         if ['defined(TEST_IF_UNION_BAR)']
     if ['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)']
 object q_obj_test-if-union-cmd-arg
-    member union_cmd_arg: TestIfUnion optional=False
+    member union-cmd-arg: TestIfUnion optional=False
     if ['defined(TEST_IF_UNION)']
 command test-if-union-cmd q_obj_test-if-union-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
@@ -332,7 +332,7 @@ alternate TestIfAlternate
         if ['defined(TEST_IF_ALT_BAR)']
     if ['defined(TEST_IF_ALT) && defined(TEST_IF_STRUCT)']
 object q_obj_test-if-alternate-cmd-arg
-    member alt_cmd_arg: TestIfAlternate optional=False
+    member alt-cmd-arg: TestIfAlternate optional=False
     if ['defined(TEST_IF_ALT)']
 command test-if-alternate-cmd q_obj_test-if-alternate-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
diff --git a/tests/qapi-schema/struct-member-name-clash.err b/tests/qapi-schema/struct-member-name-clash.err
index 6ac042d59d..7e53a605d2 100644
--- a/tests/qapi-schema/struct-member-name-clash.err
+++ b/tests/qapi-schema/struct-member-name-clash.err
@@ -1,2 +1,2 @@
 struct-member-name-clash.json: In struct 'Oops':
-struct-member-name-clash.json:4: member 'a_b' collides with member 'a-b'
+struct-member-name-clash.json:5: member 'a_b' collides with member 'a-b'
diff --git a/tests/qapi-schema/struct-member-name-clash.json b/tests/qapi-schema/struct-member-name-clash.json
index 3fb69cc2ce..571acf05ce 100644
--- a/tests/qapi-schema/struct-member-name-clash.json
+++ b/tests/qapi-schema/struct-member-name-clash.json
@@ -1,4 +1,5 @@
 # C member name collision
 # Reject members that clash when mapped to C names (we would have two 'a_b'
 # members).
+{ 'pragma': { 'member-name-exceptions': [ 'Oops' ] } }
 { 'struct': 'Oops', 'data': { 'a-b': 'str', 'a_b': 'str' } }
-- 
2.26.3


