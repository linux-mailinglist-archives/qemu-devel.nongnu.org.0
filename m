Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B135BA203
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 22:52:36 +0200 (CEST)
Received: from localhost ([::1]:55044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYvqd-00059f-TH
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 16:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oYvhy-00027z-H6
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 16:43:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oYvho-0000Jj-UA
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 16:43:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663274607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e5oS+6JLb1oU84LOA0/uXCQKe6QrxuwoZ8MODdB95Qc=;
 b=J6Z4BO/eYnpB59YUi6QNj7JIYTacGZZvOVU9Y6FKvlyrut/zN68fHUr3k/hZVNm9XNWT2l
 LZzcaE9IqXS/dUVnkpqaqAljNxzPzlxHLsF4i2pbInuBPCNmKrpVbVY+mBCJ9GJkfJPdne
 8+fLLcHFJCbgu+vZLfEYTdOfLdgPemY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-Dz9Er1n7OPitvhaoBBo4MA-1; Thu, 15 Sep 2022 16:43:24 -0400
X-MC-Unique: Dz9Er1n7OPitvhaoBBo4MA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C58F83C0D865;
 Thu, 15 Sep 2022 20:43:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A08F4140EBF5;
 Thu, 15 Sep 2022 20:43:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 232AA21E661A; Thu, 15 Sep 2022 22:43:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com,
	jsnow@redhat.com,
	eblake@redhat.com
Subject: [PATCH 27/27] qapi: Drop temporary logic to support conversion step
 by step
Date: Thu, 15 Sep 2022 22:43:17 +0200
Message-Id: <20220915204317.3766007-28-armbru@redhat.com>
In-Reply-To: <20220915204317.3766007-1-armbru@redhat.com>
References: <20220915204317.3766007-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/schema.py | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 4594c69d0b..cd8661125c 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -757,12 +757,6 @@ def __init__(self, name, info, typ, optional, ifcond=None, features=None):
 
     def need_has(self):
         assert self.type
-        # Temporary hack to support dropping the has_FOO in reviewable chunks
-        opt_out = []
-        if self.info and any(self.info.fname.endswith(mod)
-                             for mod in opt_out):
-            return self.optional
-        # End of temporary hack
         return self.optional and self.type.need_has_if_optional()
 
     def check(self, schema):
-- 
2.37.2


