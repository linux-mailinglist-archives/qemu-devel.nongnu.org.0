Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 857ED32233A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 01:42:15 +0100 (CET)
Received: from localhost ([::1]:45178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lELmI-00009x-Hd
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 19:42:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lELgT-0001pn-JP
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 19:36:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lELef-0005Mx-Np
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 19:36:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614040461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B71SzLeLid51VPeK1mV5HQktxFjRRGL7XBLLGtod3oc=;
 b=V9Va6jWsOX78Pq/wIcubf4cqmz/P3wffNM9I882ZTOCunFMytPADOTPtxyWdqGCPTKyYoi
 euBUDlSgfFT2bshsvRh4HLJUtjet/hEBQFJNat8ZCJVuDxyx5SRW7udiggbh6DWGc19Zz9
 q5+1G7k5gk2vgXqDF4o3bShbATRugX4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-u2eMckg2MYuNyBBvR92vWQ-1; Mon, 22 Feb 2021 19:34:18 -0500
X-MC-Unique: u2eMckg2MYuNyBBvR92vWQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED05F8030BB;
 Tue, 23 Feb 2021 00:34:17 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 395165D6D5;
 Tue, 23 Feb 2021 00:34:17 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v3 09/16] qapi/expr.py: Consolidate check_if_str calls in
 check_if
Date: Mon, 22 Feb 2021 19:34:01 -0500
Message-Id: <20210223003408.964543-10-jsnow@redhat.com>
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

This is a small rewrite to address some minor style nits.

Don't compare against the empty list to check for the empty condition, and
move the normalization forward to unify the check on the now-normalized
structure.

With the check unified, the local nested function isn't needed anymore
and can be brought down into the normal flow of the function. With the
nesting level changed, shuffle the error strings around a bit to get
them to fit in 79 columns.

Note: though ifcond is typed as Sequence[str] elsewhere, we *know* that
the parser will produce real, bona-fide lists. It's okay to check
isinstance(ifcond, list) here.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index df6c64950fa..3235a3b809e 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -128,30 +128,26 @@ def check_flags(expr: Expression, info: QAPISourceInfo) -> None:
 
 def check_if(expr: _JSObject, info: QAPISourceInfo, source: str) -> None:
 
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
-    if isinstance(ifcond, list):
-        if ifcond == []:
+
+    # Normalize to a list
+    if not isinstance(ifcond, list):
+        ifcond = [ifcond]
+        expr['if'] = ifcond
+
+    if not ifcond:
+        raise QAPISemError(info, f"'if' condition [] of {source} is useless")
+
+    for element in ifcond:
+        if not isinstance(element, str):
+            raise QAPISemError(info, (
+                f"'if' condition of {source}"
+                " must be a string or a list of strings"))
+        if element.strip() == '':
             raise QAPISemError(
-                info, "'if' condition [] of %s is useless" % source)
-        for elt in ifcond:
-            check_if_str(elt)
-    else:
-        check_if_str(ifcond)
-        expr['if'] = [ifcond]
+                info, f"'if' condition '{element}' of {source} makes no sense")
 
 
 def normalize_members(members: object) -> None:
-- 
2.29.2


