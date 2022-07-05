Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBA256684D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 12:41:24 +0200 (CEST)
Received: from localhost ([::1]:49326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8fzf-00022O-GV
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 06:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fwz-0006S0-By
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fwx-0005zd-Sc
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657017515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jI/vFeFSjJ9wECviU/vfiJz+Koz2JKyulvHHp6jyt0Q=;
 b=dkvVsJJp8CIVK+bOLNkVPVrOfEBiapSsCEXT33lZgBQKi94dkdr9brQv3VYRK2Xi/WrDwZ
 vgzl/dnk+DVuF+Mi6P8Rfis05CX+kM1g8wMbCRw0S5i1ZiTNxbpcJIzbp0llUbeAAAqcmG
 xiyXQvumTspfxnLEVcngVRn+1uyoIho=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-70Wr7ghqNKaNxebyQXPNrA-1; Tue, 05 Jul 2022 06:38:31 -0400
X-MC-Unique: 70Wr7ghqNKaNxebyQXPNrA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 001DE80174C;
 Tue,  5 Jul 2022 10:38:31 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D83DA492C3B;
 Tue,  5 Jul 2022 10:38:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 08/14] tests: wait for migration completion before looking for
 STOP event
Date: Tue,  5 Jul 2022 12:38:10 +0200
Message-Id: <20220705103816.608166-9-thuth@redhat.com>
In-Reply-To: <20220705103816.608166-1-thuth@redhat.com>
References: <20220705103816.608166-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

From: Daniel P. Berrangé <berrange@redhat.com>

When moving into the convergance phase, the precopy tests will first
look for a STOP event and once found will look for migration completion
status. If the test VM is not converging, the test suite will be waiting
for the STOP event forever. If we wait for the migration completion
status first, then we will trigger the previously added timeout and
prevent the test hanging forever.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220628105434.295905-3-berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
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
2.31.1


