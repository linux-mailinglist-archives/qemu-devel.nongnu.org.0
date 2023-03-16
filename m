Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8396BC6D7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 08:15:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcho7-0003nN-5s; Thu, 16 Mar 2023 03:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pchnu-0003kz-Hz
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:13:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pchnp-0004Yq-Bj
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:13:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678950811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VOa9B6AXBverozFLWZBZwC08lAjb4Su+j9azeXkAwgg=;
 b=EvEgaRTXI1lm7RbXksJWKVV1bbGzfIFzJ7W9+TCh3HlckptxQG4J5d3r6YYdorxrp1xx27
 PFwywey/okzVoMjVeis9xAnmL2pmXSS0TXstgx4qeeD8pjCtMUfoZsRsnVO+zwaabxkqmw
 xEUipY4VEy5jOPeZh1UFGjj1tCfEf5Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-di3TaPT2NaCAo573pm_OkQ-1; Thu, 16 Mar 2023 03:13:28 -0400
X-MC-Unique: di3TaPT2NaCAo573pm_OkQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D9BA185A790;
 Thu, 16 Mar 2023 07:13:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F25D61121314;
 Thu, 16 Mar 2023 07:13:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F422B21E5A0C; Thu, 16 Mar 2023 08:13:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 eblake@redhat.com, jsnow@redhat.com
Subject: [PATCH 06/14] qapi: Simplify code a bit after previous commit
Date: Thu, 16 Mar 2023 08:13:17 +0100
Message-Id: <20230316071325.492471-7-armbru@redhat.com>
In-Reply-To: <20230316071325.492471-1-armbru@redhat.com>
References: <20230316071325.492471-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/expr.py | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 5abeaa19dd..8a8de9e3aa 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -335,21 +335,13 @@ def normalize_members(members: object) -> None:
 
 def check_type_name(value: Optional[object],
                     info: QAPISourceInfo, source: str) -> None:
-    if value is None:
-        return
-
-    if isinstance(value, str):
-        return
-
-    raise QAPISemError(info, "%s should be a type name" % source)
+    if value is not None and not isinstance(value, str):
+        raise QAPISemError(info, "%s should be a type name" % source)
 
 
 def check_type_name_or_array(value: Optional[object],
                              info: QAPISourceInfo, source: str) -> None:
-    if value is None:
-        return
-
-    if isinstance(value, str):
+    if value is None or isinstance(value, str):
         return
 
     if isinstance(value, list):
-- 
2.39.2


