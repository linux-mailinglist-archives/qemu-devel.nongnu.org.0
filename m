Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723BB346BE9
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:14:56 +0100 (CET)
Received: from localhost ([::1]:44326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpId-0003fT-Fk
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1l-0007ME-0i
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1Q-0002nc-FN
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616536627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eb7mTsMCeC8fidipvCeWAXFLlCOarcflghZSEAnHgvs=;
 b=YK8lIQcFj8GSrMV8qfUj/ZljqCVCCs32i+5h81RGm1OPldqwC7yRPyfO7/zGyA6anbwAMy
 WyUqxyA14XVKEMMyd+NC8a8DHdbqEitAIzG1E8Bs1WxGPsjJ4Ehef597fW6VvvPBuM0LgM
 2U+ZvVmwkX0eq5YDoYCGE1Uzub5AUT8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-dT3qYh33PXycoFEU-nUkCw-1; Tue, 23 Mar 2021 17:57:02 -0400
X-MC-Unique: dT3qYh33PXycoFEU-nUkCw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9CD11007474;
 Tue, 23 Mar 2021 21:57:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 821EE610A8;
 Tue, 23 Mar 2021 21:57:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9D1FA113271C; Tue, 23 Mar 2021 22:56:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/29] qapi: Rework name checking in preparation of stricter
 checking
Date: Tue, 23 Mar 2021 22:56:39 +0100
Message-Id: <20210323215658.3840228-11-armbru@redhat.com>
In-Reply-To: <20210323215658.3840228-1-armbru@redhat.com>
References: <20210323215658.3840228-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Naming rules differ for the various kinds of names.  To prepare
enforcing them, define functions to check them: check_name_upper(),
check_name_lower(), and check_name_camel().  For now, these merely
wrap around check_name_str(), but that will change shortly.  Replace
the other uses of check_name_str() by appropriate uses of the
wrappers.  No change in behavior just yet.

check_name_str() now returns the name without downstream and x-
prefix, for use by the wrappers in later patches.  Requires tweaking
regexp @valid_name.  It accepts the same strings as before.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210323094025.3569441-11-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[Commit message improved]
---
 scripts/qapi/expr.py | 51 +++++++++++++++++++++++++++++++-------------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index e00467636c..30285fe334 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -21,11 +21,12 @@
 from .error import QAPISemError
 
 
-# Names must be letters, numbers, -, and _.  They must start with letter,
-# except for downstream extensions which must start with __RFQDN_.
-# Dots are only valid in the downstream extension prefix.
-valid_name = re.compile(r'^(__[a-zA-Z0-9.-]+_)?'
-                        '[a-zA-Z][a-zA-Z0-9_-]*$')
+# Names consist of letters, digits, -, and _, starting with a letter.
+# An experimental name is prefixed with x-.  A name of a downstream
+# extension is prefixed with __RFQDN_.  The latter prefix goes first.
+valid_name = re.compile(r'(__[a-z0-9.-]+_)?'
+                        r'(x-)?'
+                        r'([a-z][a-z0-9_-]*)$', re.IGNORECASE)
 
 
 def check_name_is_str(name, info, source):
@@ -37,16 +38,38 @@ def check_name_str(name, info, source,
                    permit_upper=False):
     # Reserve the entire 'q_' namespace for c_name(), and for 'q_empty'
     # and 'q_obj_*' implicit type names.
-    if not valid_name.match(name) or \
-       c_name(name, False).startswith('q_'):
+    match = valid_name.match(name)
+    if not match or c_name(name, False).startswith('q_'):
         raise QAPISemError(info, "%s has an invalid name" % source)
     if not permit_upper and name.lower() != name:
         raise QAPISemError(
             info, "%s uses uppercase in name" % source)
+    return match.group(3)
+
+
+def check_name_upper(name, info, source):
+    stem = check_name_str(name, info, source, permit_upper=True)
+    # TODO reject '[a-z-]' in @stem
+
+
+def check_name_lower(name, info, source,
+                     permit_upper=False):
+    stem = check_name_str(name, info, source, permit_upper)
+    # TODO reject '_' in stem
+
+
+def check_name_camel(name, info, source):
+    stem = check_name_str(name, info, source, permit_upper=True)
+    # TODO reject '[_-]' in stem, require CamelCase
 
 
 def check_defn_name_str(name, info, meta):
-    check_name_str(name, info, meta, permit_upper=True)
+    if meta == 'event':
+        check_name_upper(name, info, meta)
+    elif meta == 'command':
+        check_name_lower(name, info, meta, permit_upper=True)
+    else:
+        check_name_camel(name, info, meta)
     if name.endswith('Kind') or name.endswith('List'):
         raise QAPISemError(
             info, "%s name should not end in '%s'" % (meta, name[-4:]))
@@ -163,8 +186,7 @@ def check_type(value, info, source,
         key_source = "%s member '%s'" % (source, key)
         if key.startswith('*'):
             key = key[1:]
-        check_name_str(key, info, key_source,
-                       permit_upper=permit_upper)
+        check_name_lower(key, info, key_source, permit_upper)
         if c_name(key, False) == 'u' or c_name(key, False).startswith('has_'):
             raise QAPISemError(info, "%s uses reserved name" % key_source)
         check_keys(arg, info, key_source, ['type'], ['if', 'features'])
@@ -186,7 +208,7 @@ def check_features(features, info):
         check_keys(f, info, source, ['name'], ['if'])
         check_name_is_str(f['name'], info, source)
         source = "%s '%s'" % (source, f['name'])
-        check_name_str(f['name'], info, source)
+        check_name_lower(f['name'], info, source)
         check_if(f, info, source)
 
 
@@ -213,8 +235,7 @@ def check_enum(expr, info):
         # Enum members may start with a digit
         if member_name[0].isdigit():
             member_name = 'd' + member_name # Hack: hide the digit
-        check_name_str(member_name, info, source,
-                       permit_upper=permit_upper)
+        check_name_lower(member_name, info, source, permit_upper)
         check_if(member, info, source)
 
 
@@ -244,7 +265,7 @@ def check_union(expr, info):
     for (key, value) in members.items():
         source = "'data' member '%s'" % key
         if discriminator is None:
-            check_name_str(key, info, source)
+            check_name_lower(key, info, source)
         # else: name is in discriminator enum, which gets checked
         check_keys(value, info, source, ['type'], ['if'])
         check_if(value, info, source)
@@ -258,7 +279,7 @@ def check_alternate(expr, info):
         raise QAPISemError(info, "'data' must not be empty")
     for (key, value) in members.items():
         source = "'data' member '%s'" % key
-        check_name_str(key, info, source)
+        check_name_lower(key, info, source)
         check_keys(value, info, source, ['type'], ['if'])
         check_if(value, info, source)
         check_type(value['type'], info, source)
-- 
2.26.3


