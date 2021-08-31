Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A356B3FC830
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:26:28 +0200 (CEST)
Received: from localhost ([::1]:47336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3mV-0004VT-DT
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL325-0006MD-FS
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:38:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL320-0005J8-2s
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630413502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZqWP+eieEWexYZHvgLxsxLKjkjtAwocw+bS86M/PNKA=;
 b=GuIHvks+cvnRGHlNzVAZLFQoKILIgMTFo4z1Hg/YuANT+aZIM11c7L9rmKxMKgpVZQQlHq
 u2lJTlfNVBxd6LyhMoKuuXDZ2Rh/zH3yDMGmU1i052umyNYjfTH8VXQ7DXxypQ1R/dK5P8
 i2sOLhmuRC21UgsKKSeLhXzy7uuqcvs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-ISIiYvdpNGqqfA95YXFAVA-1; Tue, 31 Aug 2021 08:38:21 -0400
X-MC-Unique: ISIiYvdpNGqqfA95YXFAVA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A682802935;
 Tue, 31 Aug 2021 12:38:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7BE72854F;
 Tue, 31 Aug 2021 12:38:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8370B11380CD; Tue, 31 Aug 2021 14:38:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/12] qapi: Tweak error messages for missing / conflicting
 meta-type
Date: Tue, 31 Aug 2021 14:38:08 +0200
Message-Id: <20210831123809.1107782-12-armbru@redhat.com>
In-Reply-To: <20210831123809.1107782-1-armbru@redhat.com>
References: <20210831123809.1107782-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, michael.roth@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/expr.py               | 23 +++++++++--------------
 tests/qapi-schema/double-type.err  |  4 +---
 tests/qapi-schema/missing-type.err |  2 +-
 3 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 9e2aa1d43a..ae4437ba08 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -630,20 +630,15 @@ def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
         if 'include' in expr:
             continue
 
-        if 'enum' in expr:
-            meta = 'enum'
-        elif 'union' in expr:
-            meta = 'union'
-        elif 'alternate' in expr:
-            meta = 'alternate'
-        elif 'struct' in expr:
-            meta = 'struct'
-        elif 'command' in expr:
-            meta = 'command'
-        elif 'event' in expr:
-            meta = 'event'
-        else:
-            raise QAPISemError(info, "expression is missing metatype")
+        metas = expr.keys() & {'enum', 'struct', 'union', 'alternate',
+                               'command', 'event'}
+        if len(metas) != 1:
+            raise QAPISemError(
+                info,
+                "expression must have exactly one key"
+                " 'enum', 'struct', 'union', 'alternate',"
+                " 'command', 'event'")
+        meta = metas.pop()
 
         check_name_is_str(expr[meta], info, "'%s'" % meta)
         name = cast(str, expr[meta])
diff --git a/tests/qapi-schema/double-type.err b/tests/qapi-schema/double-type.err
index 576e716197..6a1e8a5990 100644
--- a/tests/qapi-schema/double-type.err
+++ b/tests/qapi-schema/double-type.err
@@ -1,3 +1 @@
-double-type.json: In struct 'Bar':
-double-type.json:2: struct has unknown key 'command'
-Valid keys are 'base', 'data', 'features', 'if', 'struct'.
+double-type.json:2: expression must have exactly one key 'enum', 'struct', 'union', 'alternate', 'command', 'event'
diff --git a/tests/qapi-schema/missing-type.err b/tests/qapi-schema/missing-type.err
index 5755386a18..cb39569e49 100644
--- a/tests/qapi-schema/missing-type.err
+++ b/tests/qapi-schema/missing-type.err
@@ -1 +1 @@
-missing-type.json:2: expression is missing metatype
+missing-type.json:2: expression must have exactly one key 'enum', 'struct', 'union', 'alternate', 'command', 'event'
-- 
2.31.1


