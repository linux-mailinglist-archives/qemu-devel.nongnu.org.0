Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14917367280
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 20:27:31 +0200 (CEST)
Received: from localhost ([::1]:54210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZHZS-0007Iq-3h
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 14:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZHT8-0002eP-8g
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 14:21:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZHSu-0003fr-Bv
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 14:20:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619029243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OtEHtoQcZWqfXZPSCnHJt6Cb5WvmQjgR9g9H0MeibII=;
 b=ZFf5URF4oz3W53sdjTWypFMEgcJtlNRd0wxpBWGP9B0J58MKPv0TnJ9+0fzFB1ZSFhoeuB
 kuGAEmG5Fl0cFKDCVJ5NVHiKSCgbaDOqUUtJeMdOTd5qjQsRTxeA5jaGeSNZzuxFGbWaWG
 K85vRGvxIKmTYkJEFHA4hOHH6HXpkzE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-WxBLE2o3MT6PruYOUycTdQ-1; Wed, 21 Apr 2021 14:20:41 -0400
X-MC-Unique: WxBLE2o3MT6PruYOUycTdQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B247107ACC7;
 Wed, 21 Apr 2021 18:20:40 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 898C519701;
 Wed, 21 Apr 2021 18:20:39 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v5 04/17] qapi/expr.py: constrain incoming expression types
Date: Wed, 21 Apr 2021 14:20:19 -0400
Message-Id: <20210421182032.3521476-5-jsnow@redhat.com>
In-Reply-To: <20210421182032.3521476-1-jsnow@redhat.com>
References: <20210421182032.3521476-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

mypy does not know the types of values stored in Dicts that masquerade
as objects. Help the type checker out by constraining the type.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index b4bbcd54c08..06a00810015 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -15,9 +15,20 @@
 # See the COPYING file in the top-level directory.
 
 import re
+from typing import Dict, Optional
 
 from .common import c_name
 from .error import QAPISemError
+from .parser import QAPIDoc
+from .source import QAPISourceInfo
+
+
+# Deserialized JSON objects as returned by the parser.
+# The values of this mapping are not necessary to exhaustively type
+# here (and also not practical as long as mypy lacks recursive
+# types), because the purpose of this module is to interrogate that
+# type.
+_JSONObject = Dict[str, object]
 
 
 # Names consist of letters, digits, -, and _, starting with a letter.
@@ -315,9 +326,20 @@ def check_event(expr, info):
 
 def check_exprs(exprs):
     for expr_elem in exprs:
-        expr = expr_elem['expr']
-        info = expr_elem['info']
-        doc = expr_elem.get('doc')
+        # Expression
+        assert isinstance(expr_elem['expr'], dict)
+        for key in expr_elem['expr'].keys():
+            assert isinstance(key, str)
+        expr: _JSONObject = expr_elem['expr']
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
2.30.2


