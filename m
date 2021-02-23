Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5286B322347
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 01:45:19 +0100 (CET)
Received: from localhost ([::1]:55504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lELpG-0004KC-Cy
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 19:45:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lELgi-0002Rz-Rp
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 19:36:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lELem-0005Nq-DG
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 19:36:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614040467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ODSXElBLvjoiNBfye/ckA5U7plhLxmlHqv/HTpnbeqc=;
 b=DD36fFd4+fNK20Eje4pIy0rr7vEO3T1cjGJTV6VILiTol7ezIiLI8Y6imWBIwgJcKRQdoj
 vfqBJIzAkniFl8fOOPcQaylL1ZkKp3bmLvcXNhkHRayOKMY5esZY0Ql6P0bzH8JR5ndEcH
 YyvjQbte7PvpclPKVdNJWPEB8PuQPLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-erwy12NOOPaJ5VUcx-vr9Q-1; Mon, 22 Feb 2021 19:34:24 -0500
X-MC-Unique: erwy12NOOPaJ5VUcx-vr9Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 648861E561;
 Tue, 23 Feb 2021 00:34:23 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB3785D6D5;
 Tue, 23 Feb 2021 00:34:22 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v3 15/16] qapi/expr.py: move related checks inside check_xxx
 functions
Date: Mon, 22 Feb 2021 19:34:07 -0500
Message-Id: <20210223003408.964543-16-jsnow@redhat.com>
In-Reply-To: <20210223003408.964543-1-jsnow@redhat.com>
References: <20210223003408.964543-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's not a big obvious difference between the types of checks that
happen in the main function versus the kind that happen in the
functions. Now they're in one place for each of the main types.

As part of the move, spell out the required and optional keywords so
they're obvious at a glance. Use tuples instead of lists for immutable
data, too.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/qapi/expr.py | 55 ++++++++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 22 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 61699de8cd5..3672637487b 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -344,6 +344,10 @@ def check_enum(expr: Expression, info: QAPISourceInfo) -> None:
     :param expr: `Expression` to validate.
     :param info: QAPI source file information.
     """
+    check_keys(expr, info, 'enum',
+               required=('enum', 'data'),
+               optional=('if', 'features', 'prefix'))
+
     name = expr['enum']
     members = expr['data']
     prefix = expr.get('prefix')
@@ -374,6 +378,11 @@ def check_struct(expr: Expression, info: QAPISourceInfo) -> None:
     :param expr: `Expression` to validate.
     :param info: QAPI source file information.
     """
+    check_keys(expr, info, 'struct',
+               required=('struct', 'data'),
+               optional=('base', 'if', 'features'))
+    normalize_members(expr['data'])
+
     name = cast(str, expr['struct'])  # Asserted in check_exprs
     members = expr['data']
 
@@ -388,6 +397,13 @@ def check_union(expr: Expression, info: QAPISourceInfo) -> None:
     :param expr: `Expression` to validate.
     :param info: QAPI source file information.
     """
+    check_keys(expr, info, 'union',
+               required=('union', 'data'),
+               optional=('base', 'discriminator', 'if', 'features'))
+
+    normalize_members(expr.get('base'))
+    normalize_members(expr['data'])
+
     name = cast(str, expr['union'])  # Asserted in check_exprs
     base = expr.get('base')
     discriminator = expr.get('discriminator')
@@ -420,6 +436,11 @@ def check_alternate(expr: Expression, info: QAPISourceInfo) -> None:
     :param expr: Expression to validate.
     :param info: QAPI source file information.
     """
+    check_keys(expr, info, 'alternate',
+               required=('alternate', 'data'),
+               optional=('if', 'features'))
+    normalize_members(expr['data'])
+
     members = expr['data']
 
     if not members:
@@ -443,6 +464,13 @@ def check_command(expr: Expression, info: QAPISourceInfo) -> None:
     :param expr: `Expression` to validate.
     :param info: QAPI source file information.
     """
+    check_keys(expr, info, 'command',
+               required=('command',),
+               optional=('data', 'returns', 'boxed', 'if', 'features',
+                         'gen', 'success-response', 'allow-oob',
+                         'allow-preconfig', 'coroutine'))
+    normalize_members(expr.get('data'))
+
     args = expr.get('data')
     rets = expr.get('returns')
     boxed = expr.get('boxed', False)
@@ -464,6 +492,11 @@ def check_event(expr: Expression, info: QAPISourceInfo) -> None:
       :if: ``Optional[Ifcond]`` (see: `check_if`)
       :features: ``Optional[Features]`` (see: `check_features`)
     """
+    check_keys(expr, info, 'event',
+               required=('event',),
+               optional=('data', 'boxed', 'if', 'features'))
+    normalize_members(expr.get('data'))
+
     args = expr.get('data')
     boxed = expr.get('boxed', False)
 
@@ -531,38 +564,16 @@ def check_exprs(exprs: List[_JSObject]) -> List[_JSObject]:
                                "documentation comment required")
 
         if meta == 'enum':
-            check_keys(expr, info, meta,
-                       ['enum', 'data'], ['if', 'features', 'prefix'])
             check_enum(expr, info)
         elif meta == 'union':
-            check_keys(expr, info, meta,
-                       ['union', 'data'],
-                       ['base', 'discriminator', 'if', 'features'])
-            normalize_members(expr.get('base'))
-            normalize_members(expr['data'])
             check_union(expr, info)
         elif meta == 'alternate':
-            check_keys(expr, info, meta,
-                       ['alternate', 'data'], ['if', 'features'])
-            normalize_members(expr['data'])
             check_alternate(expr, info)
         elif meta == 'struct':
-            check_keys(expr, info, meta,
-                       ['struct', 'data'], ['base', 'if', 'features'])
-            normalize_members(expr['data'])
             check_struct(expr, info)
         elif meta == 'command':
-            check_keys(expr, info, meta,
-                       ['command'],
-                       ['data', 'returns', 'boxed', 'if', 'features',
-                        'gen', 'success-response', 'allow-oob',
-                        'allow-preconfig', 'coroutine'])
-            normalize_members(expr.get('data'))
             check_command(expr, info)
         elif meta == 'event':
-            check_keys(expr, info, meta,
-                       ['event'], ['data', 'boxed', 'if', 'features'])
-            normalize_members(expr.get('data'))
             check_event(expr, info)
         else:
             assert False, 'unexpected meta type'
-- 
2.29.2


