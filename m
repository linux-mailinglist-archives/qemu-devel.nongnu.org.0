Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 172662998FE
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 22:45:09 +0100 (CET)
Received: from localhost ([::1]:50582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXAIe-0004Ui-02
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 17:45:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kXAAi-00045G-WD
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 17:36:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kXAAc-0001Vl-0l
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 17:36:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603748209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PADkYIFfY8n6yj7AmPITNyc+ufsFjfb5RIBcX2AxO2k=;
 b=SzFUpD5mv+bv2tW196YfKoTejZLk8hvNrORUMIkE9sDWhfrwSPtXp7rpQ/eGzrkXWUA9nI
 i/owPtaQWf6MxuyWViixllCj17HLvQ01hpR/NvYbtUzsGi37ey1o4uSeewdpH8O8rmWHLf
 qes/CqsqB66Og07zvfV5gRBGsYkj9lM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-4AGkohr0OaS7w8fZUBJOxw-1; Mon, 26 Oct 2020 17:36:46 -0400
X-MC-Unique: 4AGkohr0OaS7w8fZUBJOxw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98F23809DCA
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 21:36:45 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-238.rdu2.redhat.com [10.10.118.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0800219728;
 Mon, 26 Oct 2020 21:36:44 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 07/16] qapi/expr.py: Add casts in a few select cases
Date: Mon, 26 Oct 2020 17:36:28 -0400
Message-Id: <20201026213637.47087-8-jsnow@redhat.com>
In-Reply-To: <20201026213637.47087-1-jsnow@redhat.com>
References: <20201026213637.47087-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 02:39:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Casts are instructions to the type checker only, they aren't "safe" and
should probably be avoided in general. In this case, when we perform
type checking on a nested structure, the type of each field does not
"stick".

We don't need to assert that something is a str if we've already checked
that it is -- use a cast instead for these cases.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/qapi/expr.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 2654a72e8333..b8720b723377 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -15,7 +15,7 @@
 # See the COPYING file in the top-level directory.
 
 import re
-from typing import MutableMapping, Optional
+from typing import MutableMapping, Optional, cast
 
 from .common import c_name
 from .error import QAPISemError
@@ -232,7 +232,7 @@ def check_enum(expr, info):
 
 
 def check_struct(expr, info):
-    name = expr['struct']
+    name = cast(str, expr['struct'])  # Asserted in check_exprs
     members = expr['data']
 
     check_type(members, info, "'data'", allow_dict=name)
@@ -240,7 +240,7 @@ def check_struct(expr, info):
 
 
 def check_union(expr, info):
-    name = expr['union']
+    name = cast(str, expr['union'])  # Asserted in check_exprs
     base = expr.get('base')
     discriminator = expr.get('discriminator')
     members = expr['data']
@@ -337,7 +337,7 @@ def check_exprs(exprs):
         else:
             raise QAPISemError(info, "expression is missing metatype")
 
-        name = expr[meta]
+        name = cast(str, expr[meta])  # asserted right below:
         check_name_is_str(name, info, "'%s'" % meta)
         info.set_defn(meta, name)
         check_defn_name_str(name, info, meta)
-- 
2.26.2


