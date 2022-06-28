Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE5B55C07B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:59:24 +0200 (CEST)
Received: from localhost ([::1]:37930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68wF-00087v-OS
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o68rl-0000H2-Ud
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:54:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o68rk-0006Tc-HD
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:54:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656413683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IvQs1BTzvWIjCmhXB6wjFQJ4T4ocSbMzevflX82R/04=;
 b=LTy5G9EIXIHFaDM/0qpQwLHVWdGmE3aphJSjYZuSXnrot7dyeiG2PimNuioiF/ViGPOUAI
 lqy9ugJBFPgAiARHlgLPKAA5kZ7Q6e9hGFK1hCvEufZysCZ+6RNtx0blUNu8idq4nuC/sG
 YPxdqzb5J+XH3PBj6cf9oepafNzCPfg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-ZK5DJT35OCKiwPO2hIKVwA-1; Tue, 28 Jun 2022 06:54:41 -0400
X-MC-Unique: ZK5DJT35OCKiwPO2hIKVwA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38A6729ABA09;
 Tue, 28 Jun 2022 10:54:41 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DF31112131B;
 Tue, 28 Jun 2022 10:54:39 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 2/5] tests: wait for migration completion before looking for
 STOP event
Date: Tue, 28 Jun 2022 11:54:31 +0100
Message-Id: <20220628105434.295905-3-berrange@redhat.com>
In-Reply-To: <20220628105434.295905-1-berrange@redhat.com>
References: <20220628105434.295905-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

When moving into the convergance phase, the precopy tests will first
look for a STOP event and once found will look for migration completion
status. If the test VM is not converging, the test suite will be waiting
for the STOP event forever. If we wait for the migration completion
status first, then we will trigger the previously added timeout and
prevent the test hanging forever.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/migration-test.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index d33e8060f9..ac9e303b1f 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1232,6 +1232,10 @@ static void test_precopy_common(MigrateCommon *args)
 
         migrate_set_parameter_int(from, "downtime-limit", CONVERGE_DOWNTIME);
 
+        /* We do this first, as it has a timeout to stop us
+         * hanging forever if migration didn't converge */
+        wait_for_migration_complete(from);
+
         if (!got_stop) {
             qtest_qmp_eventwait(from, "STOP");
         }
@@ -1239,7 +1243,6 @@ static void test_precopy_common(MigrateCommon *args)
         qtest_qmp_eventwait(to, "RESUME");
 
         wait_for_serial("dest_serial");
-        wait_for_migration_complete(from);
     }
 
     if (args->finish_hook) {
-- 
2.36.1


