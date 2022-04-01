Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6614EFCE4
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 00:49:31 +0200 (CEST)
Received: from localhost ([::1]:35124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naQ5C-0006MH-EM
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 18:49:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1naPxM-0002HN-7T
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 18:41:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1naPxK-0005Rq-QM
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 18:41:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648852882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m2y6noU8i5iQs9foSEVD7vizxisFTiJM6wNoZnk8KtI=;
 b=ARhL15ILTST1WAJLhK6/9ZFCowEJlseRK1DQU5LD1/6SM4VbYQbJC8z3FcS+1X1KFooo5+
 rjfiI4rCCrQNpbdUC16PK3TXAAbXNer5Gy5HaiyJswPkz14I/qqA8uecJLcn4dndy/JYFo
 SKMSPw07ydTPsPsFu0zQTY3sNr2M708=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-cGNWNmuUMK2Nkj2IJceooQ-1; Fri, 01 Apr 2022 18:41:21 -0400
X-MC-Unique: cGNWNmuUMK2Nkj2IJceooQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D210685A5A8
 for <qemu-devel@nongnu.org>; Fri,  1 Apr 2022 22:41:20 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.193.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7D8D9E61;
 Fri,  1 Apr 2022 22:41:19 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v1 8/8] qapi: golang: document skip function
 visit_array_types
Date: Sat,  2 Apr 2022 00:41:04 +0200
Message-Id: <20220401224104.145961-9-victortoso@redhat.com>
In-Reply-To: <20220401224104.145961-1-victortoso@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=victortoso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 scripts/qapi/golang.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/golang.py b/scripts/qapi/golang.py
index 5d3395514d..9a775d0691 100644
--- a/scripts/qapi/golang.py
+++ b/scripts/qapi/golang.py
@@ -321,7 +321,12 @@ def visit_enum_type(self: QAPISchemaGenGolangVisitor,
 '''
 
     def visit_array_type(self, name, info, ifcond, element_type):
-        pass
+        # TLDR: We don't need to any extra boilerplate in Go to handle Arrays.
+        #
+        # This function is implemented just to be sure that:
+        # 1. Every array type ends with List
+        # 2. Every array type's element is the array type without 'List'
+        assert name.endswith("List") and name[:-4] == element_type.name
 
     def visit_command(self,
                       name: str,
-- 
2.35.1


