Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189F8274B8B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 23:52:05 +0200 (CEST)
Received: from localhost ([::1]:42076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKqCY-0000ex-5J
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 17:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpbK-0000qa-Di
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:13:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpbI-00061d-Fh
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:13:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600809203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OviiS+c/KqyWZoTO/aj83Q64YGN4t3Pv8SUuOosZ94s=;
 b=gy+l62ArpM+Jw4lCgpm6VoVMUdrHmf40H3i75Mzv3w+dZ2lp3XICy8I2YXoEQxy+iMqFmR
 c3eFAOL55wwgL+/ixxfdrkp9BvPp/E9QllsUabP67Y/ow39Hvvqu+XTTpm+caEESAzuJuN
 doxeCf0oDBtyoYhr13GC60dls2nXFa4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-BLZwyfbjPA2zRgtjmq3AQw-1; Tue, 22 Sep 2020 17:13:19 -0400
X-MC-Unique: BLZwyfbjPA2zRgtjmq3AQw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE04919611A0;
 Tue, 22 Sep 2020 21:13:18 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A13FE73689;
 Tue, 22 Sep 2020 21:13:17 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 03/16] qapi/expr.py: constrain incoming expression types
Date: Tue, 22 Sep 2020 17:13:00 -0400
Message-Id: <20200922211313.4082880-4-jsnow@redhat.com>
In-Reply-To: <20200922211313.4082880-1-jsnow@redhat.com>
References: <20200922211313.4082880-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 15:47:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
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
Cc: Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

mypy does not know the types of values stored in Dicts that masquerade
as objects. Help the type checker out by constraining the type.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 1872a8a3cc..f6b55a87c1 100644
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
@@ -280,9 +288,20 @@ def check_event(expr, info):
 
 def check_exprs(exprs):
     for expr_elem in exprs:
-        expr = expr_elem['expr']
-        info = expr_elem['info']
-        doc = expr_elem.get('doc')
+        # Expression
+        assert isinstance(expr_elem['expr'], dict)
+        expr: Expression = expr_elem['expr']
+        for key in expr.keys():
+            assert isinstance(key, str)
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
2.26.2


