Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25E96800CC
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 19:26:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMCMg-0004v5-AY; Sun, 29 Jan 2023 13:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pMCMP-0004j4-76
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 13:25:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pMCML-000603-Oe
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 13:25:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675016696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NhHXydFI0TtNZY/17kwXRMemx9Mdt7dhyIDBKvB2xRg=;
 b=P6TD2y4ME1fp2MZEofUndszZolkoj+33WCI9rXjHfddS7MSy3ZAQe0274NYsyHLWrJGihO
 dkr7Mbg+FvfJOzF0XV/l9ZX54G+uajylFO5R73LpLGi0pU+tDLlToleyKB0Dyz4Ftb5nod
 YLSjf23XBRVT8fg28dp2oVgtuIB8eCA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-Hmy-5sD8OB2XiUkjvTzCEg-1; Sun, 29 Jan 2023 13:24:52 -0500
X-MC-Unique: Hmy-5sD8OB2XiUkjvTzCEg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27DC0101A521;
 Sun, 29 Jan 2023 18:24:52 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93FFF1121314;
 Sun, 29 Jan 2023 18:24:50 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 6/9] qapi: implement conditional command arguments
Date: Sun, 29 Jan 2023 22:24:11 +0400
Message-Id: <20230129182414.583349-7-marcandre.lureau@redhat.com>
In-Reply-To: <20230129182414.583349-1-marcandre.lureau@redhat.com>
References: <20230129182414.583349-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The generated code doesn't quite handle the conditional arguments.
For example, 'bar' in 'test-if-cmd' is not correctly surrounded by #if
conditions. See generated code in qmp_marshal_test_if_cmd().

Note that if there are multiple optional arguments at the last position,
there might be compilation issues due to extra comas. I left an assert
and FIXME for later.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/qapi/commands.py                |  4 ++++
 scripts/qapi/gen.py                     | 19 ++++++++++++++-----
 scripts/qapi/visit.py                   |  2 ++
 tests/qapi-schema/qapi-schema-test.json |  3 ++-
 4 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 79c5e5c3a9..07997d1586 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -64,9 +64,13 @@ def gen_call(name: str,
     elif arg_type:
         assert not arg_type.variants
         for memb in arg_type.members:
+            if memb.ifcond.is_present():
+                argstr += '\n' + memb.ifcond.gen_if()
             if memb.need_has():
                 argstr += 'arg.has_%s, ' % c_name(memb.name)
             argstr += 'arg.%s, ' % c_name(memb.name)
+            if memb.ifcond.is_present():
+                argstr += '\n' + memb.ifcond.gen_endif()
 
     lhs = ''
     if ret_type:
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index b5a8d03e8e..ba57e72c9b 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -111,22 +111,31 @@ def build_params(arg_type: Optional[QAPISchemaObjectType],
                  boxed: bool,
                  extra: Optional[str] = None) -> str:
     ret = ''
-    sep = ''
     if boxed:
         assert arg_type
         ret += '%s arg' % arg_type.c_param_type()
-        sep = ', '
+        if extra:
+            ret += ', '
     elif arg_type:
         assert not arg_type.variants
+        n = 0
         for memb in arg_type.members:
-            ret += sep
-            sep = ', '
+            n += 1
+            if memb.ifcond.is_present():
+                ret += '\n' + memb.ifcond.gen_if()
             if memb.need_has():
                 ret += 'bool has_%s, ' % c_name(memb.name)
             ret += '%s %s' % (memb.type.c_param_type(),
                               c_name(memb.name))
+            if extra or n != len(arg_type.members):
+                ret += ', '
+            else:
+                # FIXME: optional last argument may break compilation
+                assert not memb.ifcond.is_present()
+            if memb.ifcond.is_present():
+                ret += '\n' + memb.ifcond.gen_endif()
     if extra:
-        ret += sep + extra
+        ret += extra
     return ret if ret else 'void'
 
 
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 26a584ee4c..c56ea4d724 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -74,11 +74,13 @@ def gen_visit_object_members(name: str,
     sep = ''
     for memb in members:
         if memb.optional and not memb.need_has():
+            ret += memb.ifcond.gen_if()
             ret += mcgen('''
     bool has_%(c_name)s = !!obj->%(c_name)s;
 ''',
                          c_name=c_name(memb.name))
             sep = '\n'
+            ret += memb.ifcond.gen_endif()
     ret += sep
 
     if base:
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index ba7302f42b..baa4e69f63 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -258,7 +258,8 @@
 
 { 'event': 'TEST_IF_EVENT',
   'data': { 'foo': 'TestIfStruct',
-            'bar': { 'type': ['TestIfEnum'], 'if': 'TEST_IF_EVT_BAR' } },
+            'bar': { 'type': ['TestIfEnum'], 'if': 'TEST_IF_EVT_BAR' },
+            'baz': 'int' },
   'if': { 'all': ['TEST_IF_EVT', 'TEST_IF_STRUCT'] } }
 
 { 'event': 'TEST_IF_EVENT2', 'data': {},
-- 
2.39.1


