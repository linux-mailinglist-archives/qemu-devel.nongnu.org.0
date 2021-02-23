Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0A732232A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 01:37:22 +0100 (CET)
Received: from localhost ([::1]:58330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lELhZ-0002In-Bn
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 19:37:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lELfe-0000a3-Lr
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 19:35:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lELea-0005MO-JW
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 19:35:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614040455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6MQVM0WMlNubOKe/JRZ7iNs/JR2AlIPYYXpSIFmx+hQ=;
 b=MY93FlW/p3QzWqq562T1NrUinI3Urqo6fDyd+W8W3taikpL8C7zSefDIyx1obUjcg9hlUf
 fGwT41N7/btJAfHjY/WmPbXGn3Byu5qzFYRvW0epRi2uUkx5JeKSZM8+jp5qMc0YRR2ztk
 zuCC2DtSGaigl97W9rZbRTawFOafeho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-J7UyEJNIPJuhiszB8wZtTw-1; Mon, 22 Feb 2021 19:34:13 -0500
X-MC-Unique: J7UyEJNIPJuhiszB8wZtTw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 583628030BB;
 Tue, 23 Feb 2021 00:34:12 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DD855D6D5;
 Tue, 23 Feb 2021 00:34:11 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v3 03/16] qapi/expr.py: constrain incoming expression types
Date: Mon, 22 Feb 2021 19:33:55 -0500
Message-Id: <20210223003408.964543-4-jsnow@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

mypy does not know the types of values stored in Dicts that masquerade
as objects. Help the type checker out by constraining the type.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/qapi/expr.py | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 5694c501fa3..783282b53ce 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -15,9 +15,17 @@
 # See the COPYING file in the top-level directory.
 
 import re
+from typing import MutableMapping, Optional
 
 from .common import c_name
 from .error import QAPISemError
+from .parser import QAPIDoc
+from .source import QAPISourceInfo
+
+
+# Expressions in their raw form are JSON-like structures with arbitrary forms.
+# Minimally, their top-level form must be a mapping of strings to values.
+Expression = MutableMapping[str, object]
 
 
 # Names must be letters, numbers, -, and _.  They must start with letter,
@@ -287,9 +295,20 @@ def check_event(expr, info):
 
 def check_exprs(exprs):
     for expr_elem in exprs:
-        expr = expr_elem['expr']
-        info = expr_elem['info']
-        doc = expr_elem.get('doc')
+        # Expression
+        assert isinstance(expr_elem['expr'], dict)
+        for key in expr_elem['expr'].keys():
+            assert isinstance(key, str)
+        expr: Expression = expr_elem['expr']
+
+        # QAPISourceInfo
+        assert isinstance(expr_elem['info'], QAPISourceInfo)
+        info: QAPISourceInfo = expr_elem['info']
+
+        # Optional[QAPIDoc]
+        tmp = expr_elem.get('doc')
+        assert tmp is None or isinstance(tmp, QAPIDoc)
+        doc: Optional[QAPIDoc] = tmp
 
         if 'include' in expr:
             continue
-- 
2.29.2


