Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ACF27DFBF
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 06:57:21 +0200 (CEST)
Received: from localhost ([::1]:47938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNUB6-0007qh-6I
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 00:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kNTo3-0001sL-SC
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 00:33:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kNTnz-0000ey-CJ
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 00:33:31 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601440406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TwzD3xbKfnOI9iazvUt8pMxo0jVuCiiIAiQSkkEqc48=;
 b=Cc8/MH873/X8nelDcmZ89yLBsVScmGMBFl+fNjvTHFDEyt7i52IsjO74Oe/pcG2iL8Xo8D
 E4DZww1qMtlOZYHZ64ed/fGqgQWDu3uAl8gM2JjAbFMVQlgzgPmh5ZTYGn8gXPiBhmNQ3R
 VIeJkbKX0EEgKgnRfiS8fntHPKuMAik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-wUqoyWntOb2MvxNkETeueQ-1; Wed, 30 Sep 2020 00:33:24 -0400
X-MC-Unique: wUqoyWntOb2MvxNkETeueQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FFED185A0D9;
 Wed, 30 Sep 2020 04:33:23 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B85C773678;
 Wed, 30 Sep 2020 04:33:21 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 40/46] qapi/introspect.py: replace 'extra' dict with
 'comment' argument
Date: Wed, 30 Sep 2020 00:31:44 -0400
Message-Id: <20200930043150.1454766-41-jsnow@redhat.com>
In-Reply-To: <20200930043150.1454766-1-jsnow@redhat.com>
References: <20200930043150.1454766-1-jsnow@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:26:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is only used to pass in a dictionary with a comment already set, so
skip the runaround and just accept the comment.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/introspect.py | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 1c3ba41f1dc..43b6ba5df1f 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -52,12 +52,11 @@
 
 
 def _make_tree(obj: Union[_DObject, str], ifcond: List[str],
-               extra: Optional[Extra] = None
-               ) -> AnnotatedNode:
-    if extra is None:
-        extra = {}
-    if ifcond:
-        extra['if'] = ifcond
+               comment: Optional[str] = None) -> AnnotatedNode:
+    extra: Extra = {
+        'if': ifcond,
+        'comment': comment,
+    }
     return (obj, extra)
 
 
@@ -200,18 +199,18 @@ def _gen_features(cls,
     def _gen_tree(self, name: str, mtype: str, obj: _DObject,
                   ifcond: List[str],
                   features: Optional[List[QAPISchemaFeature]]) -> None:
-        extra: Extra = None
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
 
     def _gen_member(self,
                     member: QAPISchemaObjectTypeMember) -> AnnotatedNode:
-- 
2.26.2


