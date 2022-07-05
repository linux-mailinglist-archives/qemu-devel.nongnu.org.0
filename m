Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC25566879
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 12:49:20 +0200 (CEST)
Received: from localhost ([::1]:43440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8g7L-0000Cq-Hj
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 06:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fx3-0006bW-So
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fx2-00060N-Dk
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657017519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j8QWjbkmgdsCfA1xwE8L4y7bPT/3f2lxeNO0WGzfa7A=;
 b=TR7Z3WQCGrdBdVaUC5JO1rqjp+NlD+VKvk2V5rvosBFGAP2geZYSN+HyM5Lh1xKK5tSreD
 +mSkIz5fxZahREH9JKWG42kaJ69gGO0581JuCvHbULCuLSthxj0dLyqA9nbRbCADZByFk2
 LKJuGoycKV00DUOVa2a3sNi59dsjX8w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-7ABaapLuOeWF5O90wUN75A-1; Tue, 05 Jul 2022 06:38:32 -0400
X-MC-Unique: 7ABaapLuOeWF5O90wUN75A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B69E185A7B2;
 Tue,  5 Jul 2022 10:38:32 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DE40492CA3;
 Tue,  5 Jul 2022 10:38:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 09/14] tests: increase migration test converge downtime to 30
 seconds
Date: Tue,  5 Jul 2022 12:38:11 +0200
Message-Id: <20220705103816.608166-10-thuth@redhat.com>
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

While 1 second might be enough to converge migration on a fast host,
this is not guaranteed, especially if using TLS in the tests without
hardware accelerated crypto available.

Increasing the downtime to 30 seconds should guarantee it can converge
in any sane scenario.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220628105434.295905-4-berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/migration-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index ac9e303b1f..a54eff6d56 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -47,7 +47,7 @@ unsigned end_address;
 static bool uffd_feature_thread_id;
 
 /* A downtime where the test really should converge */
-#define CONVERGE_DOWNTIME 1000
+#define CONVERGE_DOWNTIME (1000 * 30)
 
 #if defined(__linux__)
 #include <sys/syscall.h>
-- 
2.31.1


