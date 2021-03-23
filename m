Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892CD345B5E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 10:51:55 +0100 (CET)
Received: from localhost ([::1]:56002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOdha-0000SS-K0
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 05:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdWp-0001cD-CZ
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:40:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdWg-00020G-BB
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:40:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616492437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=liJStyVBdNiPKUizYVOOqV4ByBTp25Q25FzSbsuOioA=;
 b=b1TnZKe3QPyRTzF+4/uN95IMmV/a+rhlKyqgKkgpgPeZD3TMr/0RYiMM7J33iSPpBAGt7V
 QfZqOuM4p1oZhxLgXUzEzEU0QfjGFvbM9oerO0MIaxBKnZS/S+GWH9sa62C2Ldhe+sgolq
 u4iz0/E2aGG69DS15JkftT1kdf3WttQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-_1D4sBafOReonn-AR5h9iw-1; Tue, 23 Mar 2021 05:40:35 -0400
X-MC-Unique: _1D4sBafOReonn-AR5h9iw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76AC483DD21;
 Tue, 23 Mar 2021 09:40:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82A70179B3;
 Tue, 23 Mar 2021 09:40:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0BD6E11326AA; Tue, 23 Mar 2021 10:40:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/28] qapi: Prepare for rejecting underscore in command and
 member names
Date: Tue, 23 Mar 2021 10:40:19 +0100
Message-Id: <20210323094025.3569441-23-armbru@redhat.com>
In-Reply-To: <20210323094025.3569441-1-armbru@redhat.com>
References: <20210323094025.3569441-1-armbru@redhat.com>
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
Cc: jsnow@redhat.com, michael.roth@amd.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Command names and member names within a type should be all lower case
with words separated by a hyphen.  We also accept underscore.  Rework
check_name_lower() to optionally reject underscores, but don't use
that option, yet.

Update expected test output for the changed error message.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/expr.py                    | 24 ++++++++++++++----------
 tests/qapi-schema/args-member-case.err  |  2 +-
 tests/qapi-schema/enum-member-case.err  |  2 +-
 tests/qapi-schema/union-branch-case.err |  2 +-
 4 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 30fd37aa24..ce37b426c9 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -51,12 +51,13 @@ def check_name_upper(name, info, source):
 
 
 def check_name_lower(name, info, source,
-                     permit_upper=False):
+                     permit_upper=False,
+                     permit_underscore=False):
     stem = check_name_str(name, info, source)
-    if not permit_upper and re.search(r'[A-Z]', stem):
+    if ((not permit_upper and re.search(r'[A-Z]', stem))
+            or (not permit_underscore and '_' in stem)):
         raise QAPISemError(
-            info, "%s uses uppercase in name" % source)
-    # TODO reject '_' in stem
+            info, "name of %s must not use uppercase or '_'" % source)
 
 
 def check_name_camel(name, info, source):
@@ -69,7 +70,8 @@ def check_defn_name_str(name, info, meta):
     if meta == 'event':
         check_name_upper(name, info, meta)
     elif meta == 'command':
-        check_name_lower(name, info, meta, permit_upper=True)
+        check_name_lower(name, info, meta,
+                         permit_upper=True, permit_underscore=True)
     else:
         check_name_camel(name, info, meta)
     if name.endswith('Kind') or name.endswith('List'):
@@ -188,7 +190,8 @@ def check_type(value, info, source,
         key_source = "%s member '%s'" % (source, key)
         if key.startswith('*'):
             key = key[1:]
-        check_name_lower(key, info, key_source, permit_upper)
+        check_name_lower(key, info, key_source,
+                         permit_upper, permit_underscore=True)
         if c_name(key, False) == 'u' or c_name(key, False).startswith('has_'):
             raise QAPISemError(info, "%s uses reserved name" % key_source)
         check_keys(arg, info, key_source, ['type'], ['if', 'features'])
@@ -210,7 +213,7 @@ def check_features(features, info):
         check_keys(f, info, source, ['name'], ['if'])
         check_name_is_str(f['name'], info, source)
         source = "%s '%s'" % (source, f['name'])
-        check_name_lower(f['name'], info, source)
+        check_name_lower(f['name'], info, source, permit_underscore=True)
         check_if(f, info, source)
 
 
@@ -237,7 +240,8 @@ def check_enum(expr, info):
         # Enum members may start with a digit
         if member_name[0].isdigit():
             member_name = 'd' + member_name # Hack: hide the digit
-        check_name_lower(member_name, info, source, permit_upper)
+        check_name_lower(member_name, info, source,
+                         permit_upper, permit_underscore=True)
         check_if(member, info, source)
 
 
@@ -267,7 +271,7 @@ def check_union(expr, info):
     for (key, value) in members.items():
         source = "'data' member '%s'" % key
         if discriminator is None:
-            check_name_lower(key, info, source)
+            check_name_lower(key, info, source, permit_underscore=True)
         # else: name is in discriminator enum, which gets checked
         check_keys(value, info, source, ['type'], ['if'])
         check_if(value, info, source)
@@ -281,7 +285,7 @@ def check_alternate(expr, info):
         raise QAPISemError(info, "'data' must not be empty")
     for (key, value) in members.items():
         source = "'data' member '%s'" % key
-        check_name_lower(key, info, source)
+        check_name_lower(key, info, source, permit_underscore=True)
         check_keys(value, info, source, ['type'], ['if'])
         check_if(value, info, source)
         check_type(value['type'], info, source)
diff --git a/tests/qapi-schema/args-member-case.err b/tests/qapi-schema/args-member-case.err
index 4f33dbbc38..25c3910a17 100644
--- a/tests/qapi-schema/args-member-case.err
+++ b/tests/qapi-schema/args-member-case.err
@@ -1,2 +1,2 @@
 args-member-case.json: In command 'no-way-this-will-get-whitelisted':
-args-member-case.json:2: 'data' member 'Arg' uses uppercase in name
+args-member-case.json:2: name of 'data' member 'Arg' must not use uppercase or '_'
diff --git a/tests/qapi-schema/enum-member-case.err b/tests/qapi-schema/enum-member-case.err
index 8b3aefe37a..c813522c50 100644
--- a/tests/qapi-schema/enum-member-case.err
+++ b/tests/qapi-schema/enum-member-case.err
@@ -1,2 +1,2 @@
 enum-member-case.json: In enum 'NoWayThisWillGetWhitelisted':
-enum-member-case.json:4: 'data' member 'Value' uses uppercase in name
+enum-member-case.json:4: name of 'data' member 'Value' must not use uppercase or '_'
diff --git a/tests/qapi-schema/union-branch-case.err b/tests/qapi-schema/union-branch-case.err
index b1e9417303..d2d5cb8993 100644
--- a/tests/qapi-schema/union-branch-case.err
+++ b/tests/qapi-schema/union-branch-case.err
@@ -1,2 +1,2 @@
 union-branch-case.json: In union 'Uni':
-union-branch-case.json:2: 'data' member 'Branch' uses uppercase in name
+union-branch-case.json:2: name of 'data' member 'Branch' must not use uppercase or '_'
-- 
2.26.3


