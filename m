Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121B6348908
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 07:22:21 +0100 (CET)
Received: from localhost ([::1]:59128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPJNq-00064V-Ir
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 02:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPJ6I-00026i-WA
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:04:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPJ6G-0008Mx-EN
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:04:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616652247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=010H8UE+Xsp3/CHqNy0PO37B9Jwy6Q1LEJWdA7wtABU=;
 b=aeiPUY1MFJOVDasg9wAVLLk4W2VfHOArPWQ9G1s0QUOQjxHeHca5A8mXpREFV3KVqBeeVD
 uJ2aQ6A1R80qY+t4IAyie9U26C+cUanOtBnaAAwi816sLR5mfDKSbt8gqTbmv0Mxdy1qrY
 O7JO5ym7p94tmrlMDf0A/Q81pnx8AJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-5phYSoHRMe6z__OhQRdLIQ-1; Thu, 25 Mar 2021 02:04:05 -0400
X-MC-Unique: 5phYSoHRMe6z__OhQRdLIQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA5E35704F;
 Thu, 25 Mar 2021 06:04:04 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01E0B866C7;
 Thu, 25 Mar 2021 06:04:03 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 05/19] qapi/expr.py: constrain incoming expression types
Date: Thu, 25 Mar 2021 02:03:42 -0400
Message-Id: <20210325060356.4040114-6-jsnow@redhat.com>
In-Reply-To: <20210325060356.4040114-1-jsnow@redhat.com>
References: <20210325060356.4040114-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 scripts/qapi/expr.py | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index b4bbcd54c0..b75c85c160 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -15,9 +15,18 @@
 # See the COPYING file in the top-level directory.
 
 import re
+from typing import Dict, Optional
 
 from .common import c_name
 from .error import QAPISemError
+from .parser import QAPIDoc
+from .source import QAPISourceInfo
+
+
+# Deserialized JSON objects as returned by the parser;
+# The values of this mapping are not necessary to exhaustively type
+# here, because the purpose of this module is to interrogate that type.
+_JSONObject = Dict[str, object]
 
 
 # Names consist of letters, digits, -, and _, starting with a letter.
@@ -315,9 +324,20 @@ def check_event(expr, info):
 
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


