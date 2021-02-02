Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1A830C85E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 18:49:47 +0100 (CET)
Received: from localhost ([::1]:51220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6zoA-0006dj-Nu
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 12:49:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6zla-0004qR-7h
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:47:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6zlY-0008Cs-B0
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:47:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612288023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qz/o09IKu9KjjNwsj6ta2xekFpM0AVQ8ov8SHgO3d34=;
 b=RmhVdaQlWcapk/BtgZYYwWk0pyp1qSsvpUbs2mwNb2LV/LG15uIoTwdZGwVtj63VRbY6V/
 VQgdR2iJmXApzacgGmD5ijidXwGeng0Z0qwEsaZzQXz0rNvHmy6MMhO78T+E0LtYgSLclo
 fW3DkoyuLABTqLP/JSJYZ5z62BRE2xk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-5SGYpHA9Pi-ePS6omsvE2w-1; Tue, 02 Feb 2021 12:47:00 -0500
X-MC-Unique: 5SGYpHA9Pi-ePS6omsvE2w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC6F91934100;
 Tue,  2 Feb 2021 17:46:58 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6AEA5C22B;
 Tue,  2 Feb 2021 17:46:57 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v4 06/14] qapi/introspect.py: replace 'extra' dict with
 'comment' argument
Date: Tue,  2 Feb 2021 12:46:43 -0500
Message-Id: <20210202174651.2274166-7-jsnow@redhat.com>
In-Reply-To: <20210202174651.2274166-1-jsnow@redhat.com>
References: <20210202174651.2274166-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
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
2.29.2


