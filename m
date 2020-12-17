Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 776F82DCACF
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 03:07:11 +0100 (CET)
Received: from localhost ([::1]:58592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpihC-00011r-Hq
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 21:07:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpiUQ-00043f-SN
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:53:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpiUP-0006Jd-3c
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:53:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608170036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aM8XGySP3WbjyXDiKB/rVYu/2P4W81VSgBXQPORtOk4=;
 b=KA0kdYFicGEASz0ng76azAteEOvefhlVwBlWpKRFwAEGMjNpVYeS/620G0pDrowF8Ggxx4
 QpZVhM14b8somMLgd54W+GrxXS2S7yMCU7/8eNUfN5k0ylDWoDJ87ztPJvSeIkL9si0VNj
 mH9FlCClyn8uH/jXFsbE9jUERbyyPkw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-0Bx6f3zaOKKKij7suSnPuA-1; Wed, 16 Dec 2020 20:53:54 -0500
X-MC-Unique: 0Bx6f3zaOKKKij7suSnPuA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF144E758
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:53:53 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-131.rdu2.redhat.com [10.10.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 940C560CC4;
 Thu, 17 Dec 2020 01:53:52 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 10/13] qapi/introspect.py: improve readability of
 _tree_to_qlit
Date: Wed, 16 Dec 2020 20:53:40 -0500
Message-Id: <20201217015343.196279-11-jsnow@redhat.com>
In-Reply-To: <20201217015343.196279-1-jsnow@redhat.com>
References: <20201217015343.196279-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Subjective, but I find getting rid of the comprehensions helps. Also,
divide the sections into scalar and non-scalar sections, and remove
old-style string formatting.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/introspect.py | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index c72beeeed27..60ec326d2c7 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -89,7 +89,7 @@ def indent(level):
 
         ret = ''
         if obj.comment:
-            ret += indent(level) + '/* %s */\n' % obj.comment
+            ret += indent(level) + f"/* {obj.comment} */\n"
         if obj.ifcond:
             ret += gen_if(obj.ifcond)
         ret += _tree_to_qlit(obj.value, level, suppress_first_indent)
@@ -100,33 +100,36 @@ def indent(level):
     ret = ''
     if not suppress_first_indent:
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
+                _tree_to_qlit(value, level + 1, suppress_first_indent=True)
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


