Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B533F36729B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 20:32:51 +0200 (CEST)
Received: from localhost ([::1]:35658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZHec-00034S-Pc
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 14:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZHTE-0002fY-UT
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 14:21:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZHT5-0003jF-L6
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 14:21:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619029253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aNPuDjlzYZv7X4W22XPxHgrEzXbjOqDXdoTzrPEFegE=;
 b=DZ6dTj1ZEJ1Gt1thZ4viYofhTKhvcxQjVJCXenJdINXA2xzGSdFz1V0Y2LftArAyHiDkal
 qk2z5TftItd3HpGe0YV0aYb3GFYO4nFEZoVfEdpioe5gJP4NPwcskD5uhmdEVU5WwK60dB
 YzZjuwOpDBVZ8KaMj0dhwHA2+6p1Q1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-AJ5KfRCjPUOL-hhm3rHP6g-1; Wed, 21 Apr 2021 14:20:51 -0400
X-MC-Unique: AJ5KfRCjPUOL-hhm3rHP6g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CAF98030A0;
 Wed, 21 Apr 2021 18:20:50 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3669B19D80;
 Wed, 21 Apr 2021 18:20:49 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v5 11/17] qapi/expr.py: Consolidate check_if_str calls in
 check_if
Date: Wed, 21 Apr 2021 14:20:26 -0400
Message-Id: <20210421182032.3521476-12-jsnow@redhat.com>
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

This is a small rewrite to address some minor style nits.

Don't compare against the empty list to check for the empty condition, and
move the normalization forward to unify the check on the now-normalized
structure.

With the check unified, the local nested function isn't needed anymore
and can be brought down into the normal flow of the function. With the
nesting level changed, shuffle the error strings around a bit to get
them to fit in 79 columns.

Note: although ifcond is typed as Sequence[str] elsewhere, we *know* that
the parser will produce real, bona-fide lists. It's okay to check
isinstance(ifcond, list) here.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 4ebed4c4884..de7fc16fac2 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -146,30 +146,29 @@ def check_flags(expr: _JSONObject, info: QAPISourceInfo) -> None:
 
 def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
 
-    def check_if_str(ifcond: object) -> None:
-        if not isinstance(ifcond, str):
-            raise QAPISemError(
-                info,
-                "'if' condition of %s must be a string or a list of strings"
-                % source)
-        if ifcond.strip() == '':
-            raise QAPISemError(
-                info,
-                "'if' condition '%s' of %s makes no sense"
-                % (ifcond, source))
-
     ifcond = expr.get('if')
     if ifcond is None:
         return
+
     if isinstance(ifcond, list):
-        if ifcond == []:
+        if not ifcond:
             raise QAPISemError(
                 info, "'if' condition [] of %s is useless" % source)
-        for elt in ifcond:
-            check_if_str(elt)
     else:
-        check_if_str(ifcond)
-        expr['if'] = [ifcond]
+        # Normalize to a list
+        ifcond = expr['if'] = [ifcond]
+
+    for elt in ifcond:
+        if not isinstance(elt, str):
+            raise QAPISemError(
+                info,
+                "'if' condition of %s must be a string or a list of strings"
+                % source)
+        if not elt.strip():
+            raise QAPISemError(
+                info,
+                "'if' condition '%s' of %s makes no sense"
+                % (elt, source))
 
 
 def normalize_members(members: object) -> None:
-- 
2.30.2


