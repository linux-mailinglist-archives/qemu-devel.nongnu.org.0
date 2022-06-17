Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC09354F7AD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 14:34:40 +0200 (CEST)
Received: from localhost ([::1]:55776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2BBP-0006vZ-KJ
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 08:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1o2AxA-0001ou-PG
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:19:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1o2Ax9-00051S-2B
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655468394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uSesMzZSrgz2MqihrHWKAVFwsYioX5GmOjoRDVbqhvk=;
 b=S57QUulb5zyhTSAgulIS/ooOgMCh1N43r/nfZJJ8bSyw8cajAij+iXuhv0xhEFyxcRH6uH
 DutzsZLT4YLQNhLNyZewPVFrJfKxMq1ttN6ijBAIrMmqLZqSADPcxlACCRv/IQ2CBOrcWQ
 +Bz00I1yqgpu8xayZNnv9AB3wCSPAVA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-6q8t4YW7PJ-1JJwpRrg3gA-1; Fri, 17 Jun 2022 08:19:53 -0400
X-MC-Unique: 6q8t4YW7PJ-1JJwpRrg3gA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1C7D3804528
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 12:19:52 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA48140334E;
 Fri, 17 Jun 2022 12:19:50 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [RFC PATCH v2 8/8] qapi: golang: document skip function
 visit_array_types
Date: Fri, 17 Jun 2022 14:19:32 +0200
Message-Id: <20220617121932.249381-9-victortoso@redhat.com>
In-Reply-To: <20220617121932.249381-1-victortoso@redhat.com>
References: <20220617121932.249381-1-victortoso@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 scripts/qapi/golang.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/golang.py b/scripts/qapi/golang.py
index ab91cf124f..f37014f52b 100644
--- a/scripts/qapi/golang.py
+++ b/scripts/qapi/golang.py
@@ -410,7 +410,12 @@ def visit_enum_type(self: QAPISchemaGenGolangVisitor,
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
2.36.1


