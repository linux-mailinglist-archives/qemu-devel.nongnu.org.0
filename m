Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A76345B57
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 10:50:34 +0100 (CET)
Received: from localhost ([::1]:51204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOdgH-0006Vr-LS
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 05:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdWn-0001WX-B2
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:40:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdWh-000211-4U
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:40:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616492437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HNG7XNNW7s+FxTrAHwJpPKqBki82vuC0EfCHY3sRXcA=;
 b=fSV7RkaGfGYIFrzyzGSCHpjk9eK2OrHpuUUyI6QT84HQ86lWWp1wxEoW5Ohdrwm9Ub8ukS
 CJVYgU4CExiqquSDxmCNaXJmlXCj45/Eo1uCg94dDjr6bN4goNFLGWYCvS88iDigvgBnLX
 0GIjrmm+6AHgV/mgqiSLQZsy+ovk458=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-eO0OEMjcNQycXhuizLA4TQ-1; Tue, 23 Mar 2021 05:40:36 -0400
X-MC-Unique: eO0OEMjcNQycXhuizLA4TQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 112119CC06;
 Tue, 23 Mar 2021 09:40:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C38045D9F0;
 Tue, 23 Mar 2021 09:40:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C19C3113271A; Tue, 23 Mar 2021 10:40:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/28] qapi: Support flat unions tag values with leading digit
Date: Tue, 23 Mar 2021 10:40:05 +0100
Message-Id: <20210323094025.3569441-9-armbru@redhat.com>
In-Reply-To: <20210323094025.3569441-1-armbru@redhat.com>
References: <20210323094025.3569441-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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

Flat union tag values get checked twice: as enum member name, and as
union branch name.  The former accepts leading digits, the latter
doesn't.  The restriction feels arbitrary.  Skip the latter check.

This can expose c_name() to input it can't handle: a name starting
with a digit.  Improve it to return a valid C identifier for any
input.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/common.py | 8 ++++----
 scripts/qapi/expr.py   | 4 +++-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 11b86beeab..cbd3fd81d3 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -18,7 +18,6 @@
 #: Magic string that gets removed along with all space to its right.
 EATSPACE = '\033EATSPACE.'
 POINTER_SUFFIX = ' *' + EATSPACE
-_C_NAME_TRANS = str.maketrans('.-', '__')
 
 
 def camel_to_upper(value: str) -> str:
@@ -109,9 +108,10 @@ def c_name(name: str, protect: bool = True) -> str:
                      'not_eq', 'or', 'or_eq', 'xor', 'xor_eq'])
     # namespace pollution:
     polluted_words = set(['unix', 'errno', 'mips', 'sparc', 'i386'])
-    name = name.translate(_C_NAME_TRANS)
-    if protect and (name in c89_words | c99_words | c11_words | gcc_words
-                    | cpp_words | polluted_words):
+    name = re.sub(r'[^A-Za-z0-9_]', '_', name)
+    if protect and (name in (c89_words | c99_words | c11_words | gcc_words
+                             | cpp_words | polluted_words)
+                    or name[0].isdigit()):
         return 'q_' + name
     return name
 
diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index cf09fa9fd3..507550c340 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -246,7 +246,9 @@ def check_union(expr, info):
 
     for (key, value) in members.items():
         source = "'data' member '%s'" % key
-        check_name_str(key, info, source)
+        if discriminator is None:
+            check_name_str(key, info, source)
+        # else: name is in discriminator enum, which gets checked
         check_keys(value, info, source, ['type'], ['if'])
         check_if(value, info, source)
         check_type(value['type'], info, source, allow_array=not base)
-- 
2.26.3


