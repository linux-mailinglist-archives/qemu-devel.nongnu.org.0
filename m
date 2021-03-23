Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90611345B1F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 10:42:11 +0100 (CET)
Received: from localhost ([::1]:51972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOdYA-000319-Iw
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 05:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdWg-0001Hw-8P
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:40:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdWd-0001yP-Dc
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:40:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616492434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4g/lAf+G91TbZXMv3Fx9HmaMnfLcmAhLx/MNsheH6to=;
 b=EjF0SI2u1J6u2OFz4clYI1Dmzb8iOJe7Pa/oKMnLZiMh+UrToczUW7A2Up/goOjSozRrxM
 JscNdafY79OFiLwM9LCbzyPxHeUt0WT6NQqulVh4+qgojedv0rxeVL16lLVZI3+6J6aQJJ
 wSyriKK1TvI45yK7bYe91SojdZ1qNpQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-wz7YwbZOMVuXAmDCqYRFuQ-1; Tue, 23 Mar 2021 05:40:33 -0400
X-MC-Unique: wz7YwbZOMVuXAmDCqYRFuQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11F769CC01;
 Tue, 23 Mar 2021 09:40:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D28983805;
 Tue, 23 Mar 2021 09:40:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CB6D6113271E; Tue, 23 Mar 2021 10:40:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/28] qapi: Move uppercase rejection to check_name_lower()
Date: Tue, 23 Mar 2021 10:40:08 +0100
Message-Id: <20210323094025.3569441-12-armbru@redhat.com>
In-Reply-To: <20210323094025.3569441-1-armbru@redhat.com>
References: <20210323094025.3569441-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: jsnow@redhat.com, michael.roth@amd.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

check_name_lower() is the only user of check_name_str() using
permit_upper=False.  Move the associated code from check_name_str() to
check_name_lower(), and drop the parameter.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/expr.py | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 30285fe334..a815060ee2 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -34,32 +34,31 @@ def check_name_is_str(name, info, source):
         raise QAPISemError(info, "%s requires a string name" % source)
 
 
-def check_name_str(name, info, source,
-                   permit_upper=False):
+def check_name_str(name, info, source):
     # Reserve the entire 'q_' namespace for c_name(), and for 'q_empty'
     # and 'q_obj_*' implicit type names.
     match = valid_name.match(name)
     if not match or c_name(name, False).startswith('q_'):
         raise QAPISemError(info, "%s has an invalid name" % source)
-    if not permit_upper and name.lower() != name:
-        raise QAPISemError(
-            info, "%s uses uppercase in name" % source)
     return match.group(3)
 
 
 def check_name_upper(name, info, source):
-    stem = check_name_str(name, info, source, permit_upper=True)
+    stem = check_name_str(name, info, source)
     # TODO reject '[a-z-]' in @stem
 
 
 def check_name_lower(name, info, source,
                      permit_upper=False):
-    stem = check_name_str(name, info, source, permit_upper)
+    stem = check_name_str(name, info, source)
+    if not permit_upper and name.lower() != name:
+        raise QAPISemError(
+            info, "%s uses uppercase in name" % source)
     # TODO reject '_' in stem
 
 
 def check_name_camel(name, info, source):
-    stem = check_name_str(name, info, source, permit_upper=True)
+    stem = check_name_str(name, info, source)
     # TODO reject '[_-]' in stem, require CamelCase
 
 
-- 
2.26.3


