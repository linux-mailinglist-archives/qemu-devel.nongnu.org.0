Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6D449E4AA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:32:23 +0100 (CET)
Received: from localhost ([::1]:60770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5p0-0007dO-NT
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:32:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD5fA-00072O-N4
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:22:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD5f9-0003OA-1G
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643293330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hc7P+KISRThSIHMrqupvteMA+A9ZU/+oAwFyGejzFEU=;
 b=Fyr5gZN7APrU7747HHIxfWBtqn3PAcBtg14Osg5FFpmiZrjWACQVYjr3ei+67JOwJOBC/A
 rO4qZOMyIASwxa39nVTnUnu72rZdstp05fHyWJjyYsuyLe3G1z52GM7LqlvKN045hNXs5O
 IogU0+CBUmPBuY5tTyUvYeuS97M8j9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-zkMDLiEGPLO5WKR38yOTLQ-1; Thu, 27 Jan 2022 09:22:06 -0500
X-MC-Unique: zkMDLiEGPLO5WKR38yOTLQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8EEF101F004;
 Thu, 27 Jan 2022 14:22:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 728FF8049B;
 Thu, 27 Jan 2022 14:22:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B567B11380AB; Thu, 27 Jan 2022 15:22:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 8/8] qapi: generate trace events by default
Date: Thu, 27 Jan 2022 15:22:02 +0100
Message-Id: <20220127142202.236638-9-armbru@redhat.com>
In-Reply-To: <20220127142202.236638-1-armbru@redhat.com>
References: <20220127142202.236638-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We don't generate trace events for tests/ and qga/ because that it is
not simple and not necessary. We have corresponding comments in both
tests/meson.build and qga/meson.build.

Still to not miss possible future qapi code generation call, and not to
forget to enable trace events generation, let's enable it by default.
So, turn option --gen-trace into opposite --no-trace-events and use new
option only in tests/ and qga/ where we already have good comments why
we don't generate trace events code.

Note that this commit enables trace-events generation for qapi-gen.py
call from tests/qapi-schema/meson.build and storage-daemon/meson.build.
Still, both are kind of noop: tests/qapi-schema/ doesn't seem to
generate any QMP command code and no .trace-events files anyway,
storage-daemon/ uses common QMP command implementations and just
generate empty .trace-events

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220126161130.3240892-8-vsementsov@virtuozzo.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/meson.build     | 2 +-
 qga/meson.build      | 3 ++-
 scripts/qapi/main.py | 8 ++++----
 tests/meson.build    | 3 ++-
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/qapi/meson.build b/qapi/meson.build
index b22558ca73..656ef0e039 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -127,7 +127,7 @@ endforeach
 qapi_files = custom_target('shared QAPI source files',
   output: qapi_util_outputs + qapi_specific_outputs + qapi_nonmodule_outputs,
   input: [ files('qapi-schema.json') ],
-  command: [ qapi_gen, '-o', 'qapi', '-b', '@INPUT0@', '--gen-trace' ],
+  command: [ qapi_gen, '-o', 'qapi', '-b', '@INPUT0@' ],
   depend_files: [ qapi_inputs, qapi_gen_depends ])
 
 # Now go through all the outputs and add them to the right sourceset.
diff --git a/qga/meson.build b/qga/meson.build
index 724d5a667b..f06b726ad3 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -25,7 +25,8 @@ qga_qapi_outputs = [
 qga_qapi_files = custom_target('QGA QAPI files',
                                output: qga_qapi_outputs,
                                input: 'qapi-schema.json',
-                               command: [ qapi_gen, '-o', 'qga', '-p', 'qga-', '@INPUT0@' ],
+                               command: [ qapi_gen, '-o', 'qga', '-p', 'qga-', '@INPUT0@',
+                                          '--suppress-tracing' ],
                                depend_files: qapi_gen_depends)
 
 qga_ss = ss.source_set()
diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
index 687d408aba..fc216a53d3 100644
--- a/scripts/qapi/main.py
+++ b/scripts/qapi/main.py
@@ -76,10 +76,10 @@ def main() -> int:
                         dest='unmask',
                         help="expose non-ABI names in introspection")
 
-    # Option --gen-trace exists so we can avoid solving build system
+    # Option --suppress-tracing exists so we can avoid solving build system
     # problems.  TODO Drop it when we no longer need it.
-    parser.add_argument('--gen-trace', action='store_true',
-                        help="add trace events to qmp marshals")
+    parser.add_argument('--suppress-tracing', action='store_true',
+                        help="suppress adding trace events to qmp marshals")
 
     parser.add_argument('schema', action='store')
     args = parser.parse_args()
@@ -96,7 +96,7 @@ def main() -> int:
                  prefix=args.prefix,
                  unmask=args.unmask,
                  builtins=args.builtins,
-                 gen_tracing=args.gen_trace)
+                 gen_tracing=not args.suppress_tracing)
     except QAPIError as err:
         print(f"{sys.argv[0]}: {str(err)}", file=sys.stderr)
         return 1
diff --git a/tests/meson.build b/tests/meson.build
index c8ab6272d1..94a425d94a 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -44,7 +44,8 @@ test_qapi_files = custom_target('Test QAPI files',
                                              'qapi-schema/include/sub-module.json',
                                              'qapi-schema/sub-sub-module.json'),
                                 command: [ qapi_gen, '-o', meson.current_build_dir(),
-                                           '-b', '-p', 'test-', '@INPUT0@' ],
+                                           '-b', '-p', 'test-', '@INPUT0@',
+                                           '--suppress-tracing' ],
                                 depend_files: qapi_gen_depends)
 
 # meson doesn't like generated output in other directories
-- 
2.31.1


