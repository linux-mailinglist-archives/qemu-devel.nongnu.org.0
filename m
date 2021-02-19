Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332B631FBF9
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:30:36 +0100 (CET)
Received: from localhost ([::1]:51332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7jn-0002cu-4l
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:30:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD76N-0004ga-DJ
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:49:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD76I-0004hW-7p
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:49:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613746185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T3cc89Sl99+zLX9xLPVTTO5/N5O6bSWD2sDB9yhJVZA=;
 b=WGP7k1GVet4oQjl6ARHXHYuhKPNGcbLeNuZg+XY4YWKQkJ9kekUoOjhdpd5FWxw6NLwh1X
 u15qzw3S9h6s8GiRepdAD9BPYymAvRYmy/6SbFFj+fqLryOpGDxYo5qnHJtk7oF9/TQg0E
 SehC6l2yZ9+H5TGUvfJiziswfJA6ZxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-2ebxoio5PEqcX6r2LLA8pw-1; Fri, 19 Feb 2021 09:49:43 -0500
X-MC-Unique: 2ebxoio5PEqcX6r2LLA8pw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 760CF801965;
 Fri, 19 Feb 2021 14:49:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 466E719713;
 Fri, 19 Feb 2021 14:49:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 73C6D11329A3; Fri, 19 Feb 2021 15:49:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/18] qapi/introspect.py: improve readability of _tree_to_qlit
Date: Fri, 19 Feb 2021 15:49:33 +0100
Message-Id: <20210219144939.604488-13-armbru@redhat.com>
In-Reply-To: <20210219144939.604488-1-armbru@redhat.com>
References: <20210219144939.604488-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Subjective, but I find getting rid of the comprehensions helps. Also,
divide the sections into scalar and non-scalar sections, and remove
old-style string formatting.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210216021809.134886-13-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/introspect.py | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 96dfbb4cef..26e6f73e5d 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -91,7 +91,7 @@ def _tree_to_qlit(obj, level=0, dict_value=False):
 
         ret = ''
         if obj.comment:
-            ret += indent(level) + '/* %s */\n' % obj.comment
+            ret += indent(level) + f"/* {obj.comment} */\n"
         if obj.ifcond:
             ret += gen_if(obj.ifcond)
         ret += _tree_to_qlit(obj.value, level)
@@ -102,33 +102,36 @@ def _tree_to_qlit(obj, level=0, dict_value=False):
     ret = ''
     if not dict_value:
         ret += indent(level)
+
+    # Scalars:
     if obj is None:
         ret += 'QLIT_QNULL'
     elif isinstance(obj, str):
-        ret += 'QLIT_QSTR(' + to_c_string(obj) + ')'
+        ret += f"QLIT_QSTR({to_c_string(obj)})"
+    elif isinstance(obj, bool):
+        ret += f"QLIT_QBOOL({str(obj).lower()})"
+
+    # Non-scalars:
     elif isinstance(obj, list):
-        elts = [_tree_to_qlit(elt, level + 1).strip('\n')
-                for elt in obj]
-        elts.append(indent(level + 1) + "{}")
         ret += 'QLIT_QLIST(((QLitObject[]) {\n'
-        ret += '\n'.join(elts) + '\n'
+        for value in obj:
+            ret += _tree_to_qlit(value, level + 1).strip('\n') + '\n'
+        ret += indent(level + 1) + '{}\n'
         ret += indent(level) + '}))'
     elif isinstance(obj, dict):
-        elts = []
-        for key, value in sorted(obj.items()):
-            elts.append(indent(level + 1) + '{ %s, %s }' %
-                        (to_c_string(key),
-                         _tree_to_qlit(value, level + 1, True)))
-        elts.append(indent(level + 1) + '{}')
         ret += 'QLIT_QDICT(((QLitDictEntry[]) {\n'
-        ret += ',\n'.join(elts) + '\n'
+        for key, value in sorted(obj.items()):
+            ret += indent(level + 1) + "{{ {:s}, {:s} }},\n".format(
+                to_c_string(key),
+                _tree_to_qlit(value, level + 1, dict_value=True)
+            )
+        ret += indent(level + 1) + '{}\n'
         ret += indent(level) + '}))'
-    elif isinstance(obj, bool):
-        ret += 'QLIT_QBOOL(%s)' % ('true' if obj else 'false')
     else:
         raise NotImplementedError(
             f"type '{type(obj).__name__}' not implemented"
         )
+
     if level > 0:
         ret += ','
     return ret
-- 
2.26.2


