Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1546230E8B7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 01:42:59 +0100 (CET)
Received: from localhost ([::1]:53662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Sja-0001sU-0N
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 19:42:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7SZP-0001Dr-09
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 19:32:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7SZD-0000cQ-Vo
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 19:32:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612398735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vGs6OE2ncObnm5kTca0WqPCj9ZU90/mKzbEwVnH6IJw=;
 b=ABlrUlbohgy81NGsKPiGOcmW6B2asPS60Rs0MS5Q6y/v9lFCnesgPUYgYO7TK6wbd2QOoK
 M2nu729ENRuyz1WeqpFhcyrXB9zbYwXaWzc7DY+MjF7DDJMt9J4SWRL1zXcG5kFoQE+9o5
 shucDRWJ2MwG1f1PykTuP2sYs8LFYAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-HoODNEt4OlyvyZ8wwi1CAA-1; Wed, 03 Feb 2021 19:32:13 -0500
X-MC-Unique: HoODNEt4OlyvyZ8wwi1CAA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB8F7107ACC7
 for <qemu-devel@nongnu.org>; Thu,  4 Feb 2021 00:32:12 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E924100AE4A;
 Thu,  4 Feb 2021 00:32:12 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v5 06/15] qapi/introspect.py: replace 'extra' dict with
 'comment' argument
Date: Wed,  3 Feb 2021 19:31:58 -0500
Message-Id: <20210204003207.2856909-7-jsnow@redhat.com>
In-Reply-To: <20210204003207.2856909-1-jsnow@redhat.com>
References: <20210204003207.2856909-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is only used to pass in a dictionary with a comment already set, so
skip the runaround and just accept the (optional) comment.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/introspect.py | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 7730d8ed6b2..1655a21f85b 100644
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
@@ -24,11 +26,12 @@
 )
 
 
-def _make_tree(obj, ifcond, extra=None):
-    if extra is None:
-        extra = {}
+def _make_tree(obj, ifcond, comment=None):
+    extra = {}
     if ifcond:
         extra['if'] = ifcond
+    if comment:
+        extra['comment'] = comment
     return (obj, extra)
 
 
@@ -174,18 +177,18 @@ def _gen_features(features):
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
2.29.2


