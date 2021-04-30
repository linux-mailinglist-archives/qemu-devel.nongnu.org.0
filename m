Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAA536FA23
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:28:51 +0200 (CEST)
Received: from localhost ([::1]:47302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSGH-0006U9-4R
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdZ-0002oR-Uy
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdX-0007bw-MT
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619783325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fRQZnMXI/BD0ivljuQHMhAnr4wf7XVrKqv2B7Y3NW8I=;
 b=FrHgqfc3q0h8Or/Rt0aUGCneFo1CAzFMvAmbZHeU2ZuVes7mKVzBuGwHYbeT9+sFYteLZ+
 G4TSpe/SNkKjPcYfNVhJ/ya8xQHWSUQlvVoBcXWtXdl6dI3W7DOrUbkQC9MyKJ+vDGcidr
 /8kAT0qEE61I3lSIETCH6UbrMYXa8w0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-geVoI2vpOuSkA-eTrJuKXQ-1; Fri, 30 Apr 2021 07:48:42 -0400
X-MC-Unique: geVoI2vpOuSkA-eTrJuKXQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E82D518B6324;
 Fri, 30 Apr 2021 11:48:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B785D17177;
 Fri, 30 Apr 2021 11:48:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8B5A11131C01; Fri, 30 Apr 2021 13:48:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/25] qapi/expr.py: Add casts in a few select cases
Date: Fri, 30 Apr 2021 13:48:21 +0200
Message-Id: <20210430114838.2912740-9-armbru@redhat.com>
In-Reply-To: <20210430114838.2912740-1-armbru@redhat.com>
References: <20210430114838.2912740-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Casts are instructions to the type checker only, they aren't "safe" and
should probably be avoided in general. In this case, when we perform
type checking on a nested structure, the type of each field does not
"stick".

(See PEP 647 for an example of "type narrowing" that does "stick".
 It is available in Python 3.10, so we can't use it yet.)

We don't need to assert that something is a str if we've already checked
or asserted that it is -- use a cast instead for these cases.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210421182032.3521476-9-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/expr.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 03624bdf3f..f3a4a8536e 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -15,7 +15,7 @@
 # See the COPYING file in the top-level directory.
 
 import re
-from typing import Dict, Optional
+from typing import Dict, Optional, cast
 
 from .common import c_name
 from .error import QAPISemError
@@ -261,7 +261,7 @@ def check_enum(expr, info):
 
 
 def check_struct(expr, info):
-    name = expr['struct']
+    name = cast(str, expr['struct'])  # Checked in check_exprs
     members = expr['data']
 
     check_type(members, info, "'data'", allow_dict=name)
@@ -269,7 +269,7 @@ def check_struct(expr, info):
 
 
 def check_union(expr, info):
-    name = expr['union']
+    name = cast(str, expr['union'])  # Checked in check_exprs
     base = expr.get('base')
     discriminator = expr.get('discriminator')
     members = expr['data']
@@ -368,8 +368,8 @@ def check_exprs(exprs):
         else:
             raise QAPISemError(info, "expression is missing metatype")
 
-        name = expr[meta]
-        check_name_is_str(name, info, "'%s'" % meta)
+        check_name_is_str(expr[meta], info, "'%s'" % meta)
+        name = cast(str, expr[meta])
         info.set_defn(meta, name)
         check_defn_name_str(name, info, meta)
 
-- 
2.26.3


