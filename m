Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F314B367284
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 20:27:49 +0200 (CEST)
Received: from localhost ([::1]:55514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZHZl-0007sY-0N
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 14:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZHTD-0002em-Bm
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 14:21:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZHT0-0003iq-6L
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 14:21:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619029249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qaGI/j1bb0A8eMdSZtEyjshVwZk3lt6D6O00r67Ocec=;
 b=PZ+SbOaSyISj2RI5Y68aGDqQ6/6dBvX+ouEDqImjitCLeugY744HfxHa6eeSy9g8jdQluU
 vVOshh2GdBKRJqS7eFFYY2ACig3r6CBDDs/bEFNSXrN8u7QYzb57Lg2FgUwHWGPX3+vDL/
 nmgjXY9gFAnT6ZT+xResQwkeYuo7FcY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-sEJfmUrMM5yrrSA0TEo7Yw-1; Wed, 21 Apr 2021 14:20:47 -0400
X-MC-Unique: sEJfmUrMM5yrrSA0TEo7Yw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09A918030A1;
 Wed, 21 Apr 2021 18:20:47 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 354F919D80;
 Wed, 21 Apr 2021 18:20:43 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v5 08/17] qapi/expr.py: Add casts in a few select cases
Date: Wed, 21 Apr 2021 14:20:23 -0400
Message-Id: <20210421182032.3521476-9-jsnow@redhat.com>
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

Casts are instructions to the type checker only, they aren't "safe" and
should probably be avoided in general. In this case, when we perform
type checking on a nested structure, the type of each field does not
"stick".

(See PEP 647 for an example of "type narrowing" that does "stick".
 It is available in Python 3.10, so we can't use it yet.)

We don't need to assert that something is a str if we've already checked
or asserted that it is -- use a cast instead for these cases.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 03624bdf3f3..f3a4a8536e8 100644
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
2.30.2


