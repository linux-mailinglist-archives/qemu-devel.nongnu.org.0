Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB32D6DF83C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 16:20:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmbKV-0000hD-EX; Wed, 12 Apr 2023 10:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmbKT-0000gv-SU
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 10:20:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmbKS-0006Sv-Dw
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 10:20:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681309207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=20xoR6SGneEelWb3r5aH55Sk7AbGjL5NQa4GizZfs2A=;
 b=W0bGDjaTTsoJ+P/6VgLBXOY32+Owb5LSy090xCk/yj7dgN2739b0W6Ph1rS218ZnupGyLk
 SMKprrmO+we4eDGMWLlNYvZNTV2dGCPz56PY/PRs5WZOKX4OhoqzPZ6KtgFfUb1ckGxj+F
 7+4s3xJf2WrUPP05G/ev7f2DnzkdN4c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-JqVSPl-nNdOcbZ4tKZ87jA-1; Wed, 12 Apr 2023 10:20:05 -0400
X-MC-Unique: JqVSPl-nNdOcbZ4tKZ87jA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5616858F09
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 14:20:04 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1519E1121320;
 Wed, 12 Apr 2023 14:20:03 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 1/2] tests/migration: Make precopy fast
Date: Wed, 12 Apr 2023 16:20:00 +0200
Message-Id: <20230412142001.16501-2-quintela@redhat.com>
In-Reply-To: <20230412142001.16501-1-quintela@redhat.com>
References: <20230412142001.16501-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

Otherwise we do the 1st migration iteration at a too slow speed.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/qtest/migration-test.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 3b615b0da9..7b05b0b7dd 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1348,6 +1348,7 @@ static void test_precopy_common(MigrateCommon *args)
         migrate_qmp(from, args->connect_uri, "{}");
     }
 
+    migrate_ensure_converge(from);
 
     if (args->result != MIG_TEST_SUCCEED) {
         bool allow_active = args->result == MIG_TEST_FAIL;
@@ -1365,8 +1366,6 @@ static void test_precopy_common(MigrateCommon *args)
             wait_for_migration_pass(from);
         }
 
-        migrate_ensure_converge(from);
-
         /* We do this first, as it has a timeout to stop us
          * hanging forever if migration didn't converge */
         wait_for_migration_complete(from);
-- 
2.39.2


