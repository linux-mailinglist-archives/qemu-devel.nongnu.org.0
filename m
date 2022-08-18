Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682B35988C1
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 18:26:06 +0200 (CEST)
Received: from localhost ([::1]:52284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOiLN-0003wR-G2
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 12:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oOiHU-0000b8-S5
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 12:22:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oOiHQ-0006oB-L3
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 12:22:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660839714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZEmoN9oo1tpfHxERwixbSLI51JxfNWiUg8XJyx6jG68=;
 b=T73d4FdzPSWB21bn8zyfyYPYVz32V5rRn6dV/4csgX/jlMgVmke0D53mNRtaG+Fw+v75al
 sZ55npG5axVKw6K6QzB10axsmSbAZaEitt4cTky/NQZ0LvjLQ/gkC5bVEvw7NEKJK4mlYt
 hKapE+dQn19FAuLfL+DNcIHtPre/3MM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-xrH96n8OPFWxYHZtB1Tv-A-1; Thu, 18 Aug 2022 12:21:53 -0400
X-MC-Unique: xrH96n8OPFWxYHZtB1Tv-A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E8618DC047
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 16:21:53 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9331E2166B29;
 Thu, 18 Aug 2022 16:21:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH] tests/qtest/migration-test: Only wait for serial output where
 migration succeeds
Date: Thu, 18 Aug 2022 18:21:44 +0200
Message-Id: <20220818162144.227542-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Waiting for the serial output can take a couple of seconds - and since
we're doing a lot of migration tests, this time easily sums up to
multiple minutes. But if a test is supposed to fail, it does not make
much sense to wait for the source to be in the right state first, so
we can skip the waiting here. This way we can speed up all tests where
the migration is supposed to fail. In the gitlab-CI gprov-gcov test,
each of the migration-tests now run two minutes faster!

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/migration-test.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 520a5f917c..7be321b62d 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1307,7 +1307,9 @@ static void test_precopy_common(MigrateCommon *args)
     }
 
     /* Wait for the first serial output from the source */
-    wait_for_serial("src_serial");
+    if (args->result == MIG_TEST_SUCCEED) {
+        wait_for_serial("src_serial");
+    }
 
     if (!args->connect_uri) {
         g_autofree char *local_connect_uri =
-- 
2.31.1


