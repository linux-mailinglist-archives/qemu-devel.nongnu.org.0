Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B0F2DCAB9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 02:59:34 +0100 (CET)
Received: from localhost ([::1]:39296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpiZp-0001AS-7C
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 20:59:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpiUM-0003ty-Nn
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:53:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpiUK-0006If-Tw
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:53:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608170032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=34OLcZSH8Jc6cjj7YTdc+clNV92TrTbEqumigufgBKg=;
 b=IaUE3vet+ai+UPSbMZhxGba6Mb2v2xIeJb9TGQoqHs9FGgszNW/kn0Ic4qlU6TQBA/l54b
 EVcaXWVAz5lPlP0O6mn2ZDXqW+bNhPljBnbozIakXOPBhRFfnIz/AbQCh0V2NL3BZRH7od
 +O1cQjVYdoNbwzUGRuLOnu+5JTW0CI8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-nHp3piWCOG2FJimT7NZHqg-1; Wed, 16 Dec 2020 20:53:50 -0500
X-MC-Unique: nHp3piWCOG2FJimT7NZHqg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7B62180A092
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:53:49 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-131.rdu2.redhat.com [10.10.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27FF760CC4;
 Thu, 17 Dec 2020 01:53:49 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 06/13] qapi/introspect.py: replace 'extra' dict with
 'comment' argument
Date: Wed, 16 Dec 2020 20:53:36 -0500
Message-Id: <20201217015343.196279-7-jsnow@redhat.com>
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

This is only used to pass in a dictionary with a comment already set, so
skip the runaround and just accept the comment.

This works because _tree_to_qlit() treats 'if': None; 'comment': None
exactly like absent 'if'; 'comment'.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/introspect.py | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index d3fbf694ad2..0aa3b77109f 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -10,6 +10,8 @@
 See the COPYING file in the top-level directory.
 """
 
+from typing import Optional
+
 from .common import (
     c_name,
     gen_endif,
@@ -24,11 +26,11 @@
 )
 
 
-def _make_tree(obj, ifcond, extra=None):
-    if extra is None:
-        extra = {}
-    if ifcond:
-        extra['if'] = ifcond
+def _make_tree(obj, ifcond, comment=None):
+    extra = {
+        'if': ifcond,
+        'comment': comment,
+    }
     return (obj, extra)
 
 
@@ -174,18 +176,18 @@ def _gen_features(features):
         return [_make_tree(f.name, f.ifcond) for f in features]
 
     def _gen_tree(self, name, mtype, obj, ifcond, features):
-        extra = None
+        comment: Optional[str] = None
         if mtype not in ('command', 'event', 'builtin', 'array'):
             if not self._unmask:
                 # Output a comment to make it easy to map masked names
                 # back to the source when reading the generated output.
-                extra = {'comment': '"%s" = %s' % (self._name(name), name)}
+                comment = f'"{self._name(name)}" = {name}'
             name = self._name(name)
         obj['name'] = name
         obj['meta-type'] = mtype
         if features:
             obj['features'] = self._gen_features(features)
-        self._trees.append(_make_tree(obj, ifcond, extra))
+        self._trees.append(_make_tree(obj, ifcond, comment))
 
     def _gen_member(self, member):
         obj = {'name': member.name, 'type': self._use_type(member.type)}
-- 
2.26.2


