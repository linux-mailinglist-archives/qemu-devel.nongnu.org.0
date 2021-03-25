Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074D03488C0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 07:09:08 +0100 (CET)
Received: from localhost ([::1]:34934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPJB5-0004GV-1h
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 02:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPJ6Z-0002OT-1O
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:04:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPJ6V-0008Vn-9A
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:04:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616652262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lgYU5vMVQfoS727bKbq0A9WBJWCRbRH3TZAp8X/5ul0=;
 b=HWo3duh8mqM4tA2rTCG1bgp/TXiX4Wn77nbuZObFioSwoTwcq5fHcpyvXaTjqBMPQEmxtH
 47+2BcOqd/ZmfChhOjRH0qeRan5+tSzATAPaB9myBBtfMXh24+iM4jFDVodtv0kDSgaxMt
 oUrmUHGj9R17jknrOEGP6Dd1vhzUpXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-2qd_7hatNLquwt1KP2WmXQ-1; Thu, 25 Mar 2021 02:04:20 -0400
X-MC-Unique: 2qd_7hatNLquwt1KP2WmXQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74B2B1083E80;
 Thu, 25 Mar 2021 06:04:19 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C45B9866C7;
 Thu, 25 Mar 2021 06:04:18 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 18/19] qapi/expr.py: move related checks inside check_xxx
 functions
Date: Thu, 25 Mar 2021 02:03:55 -0400
Message-Id: <20210325060356.4040114-19-jsnow@redhat.com>
In-Reply-To: <20210325060356.4040114-1-jsnow@redhat.com>
References: <20210325060356.4040114-1-jsnow@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
index b11c11b965..aabbc255d2 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -398,6 +398,10 @@ def check_enum(expr: _JSONObject, info: QAPISourceInfo) -> None:
 
     :return: None, ``expr`` is normalized in-place as needed.
     """
+    check_keys(expr, info, 'enum',
+               required=('enum', 'data'),
+               optional=('if', 'features', 'prefix'))
+
     name = expr['enum']
     members = expr['data']
     prefix = expr.get('prefix')
@@ -435,6 +439,11 @@ def check_struct(expr: _JSONObject, info: QAPISourceInfo) -> None:
 
     :return: None, ``expr`` is normalized in-place as needed.
     """
+    check_keys(expr, info, 'struct',
+               required=('struct', 'data'),
+               optional=('base', 'if', 'features'))
+    normalize_members(expr['data'])
+
     name = cast(str, expr['struct'])  # Asserted in check_exprs
     members = expr['data']
 
@@ -451,6 +460,13 @@ def check_union(expr: _JSONObject, info: QAPISourceInfo) -> None:
 
     :return: None, ``expr`` is normalized in-place as needed.
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
@@ -487,6 +503,11 @@ def check_alternate(expr: _JSONObject, info: QAPISourceInfo) -> None:
 
     :return: None, ``expr`` is normalized in-place as needed.
     """
+    check_keys(expr, info, 'alternate',
+               required=('alternate', 'data'),
+               optional=('if', 'features'))
+    normalize_members(expr['data'])
+
     members = expr['data']
 
     if not members:
@@ -512,6 +533,13 @@ def check_command(expr: _JSONObject, info: QAPISourceInfo) -> None:
 
     :return: None, ``expr`` is normalized in-place as needed.
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
@@ -531,6 +559,11 @@ def check_event(expr: _JSONObject, info: QAPISourceInfo) -> None:
 
     :return: None, ``expr`` is normalized in-place as needed.
     """
+    check_keys(expr, info, 'event',
+               required=('event',),
+               optional=('data', 'boxed', 'if', 'features'))
+    normalize_members(expr.get('data'))
+
     args = expr.get('data')
     boxed = expr.get('boxed', False)
 
@@ -598,38 +631,16 @@ def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
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
2.30.2


