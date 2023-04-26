Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9F36EEDCF
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 07:59:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prYAB-00068U-23; Wed, 26 Apr 2023 01:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prYA3-00064p-PM
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:57:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prYA0-0002kl-U2
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:57:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682488668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EfVOpdOcACxPelROUMNVfG6Dk0nhCSJlthNzV395Cto=;
 b=Cz4seb7+HKDrLGECpO5v/fuje96nJgFBYCRExUXogE9uKaKlVm/hZ7fDdOyGq1o+9pNYx7
 SEkvt9KpoRt5PzUPQevnHW0h4lyVAkf35Joau8X7WK/Ol0f9wRCVZgrJK1mgDsgMM7cgLF
 GWmjM2Aw1KZNSU3fcHWY5keL011oQFo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-72fMW6U-OcCHnxdJwis6Cw-1; Wed, 26 Apr 2023 01:57:46 -0400
X-MC-Unique: 72fMW6U-OcCHnxdJwis6Cw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72CEE85A5A3;
 Wed, 26 Apr 2023 05:57:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F75B14171B8;
 Wed, 26 Apr 2023 05:57:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2B03D21F9814; Wed, 26 Apr 2023 07:57:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Eric Blake <eblake@redhat.com>
Subject: [PULL 06/17] qapi: Simplify code a bit after previous commits
Date: Wed, 26 Apr 2023 07:57:33 +0200
Message-Id: <20230426055744.1041930-7-armbru@redhat.com>
In-Reply-To: <20230426055744.1041930-1-armbru@redhat.com>
References: <20230426055744.1041930-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Message-Id: <20230316071325.492471-7-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[Commit message corrected]
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


