Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A78DD47CE63
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 09:39:18 +0100 (CET)
Received: from localhost ([::1]:42028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzx9Z-000490-AU
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 03:39:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzx7T-0003GU-9k
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 03:37:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzx7Q-00025d-0T
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 03:37:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640162221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=On1xkr9LcZJUaRsZbX9rTi7szyYqZ7lL17aLHXGgFjM=;
 b=EPzl1pHISpA9X5I21efX8hfS/h7lAWHrk07vwOKI5XILqUdeqvhTs9mi69Thu9klXpoHGB
 OfTDmbyxJXXCa36yVsBKRwN+u9Y3qvdfRY+BNGzuOYGvbur2rWoH+Q+kVhZNqQ9kSd3v/9
 igJ5o3rkxstHG+wBXt7UC6iGRjC9UvU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-gTvhsP2uMs2MrHOsoJ1wnw-1; Wed, 22 Dec 2021 03:36:58 -0500
X-MC-Unique: gTvhsP2uMs2MrHOsoJ1wnw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76BCD10144E3;
 Wed, 22 Dec 2021 08:36:57 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7AAEE4E2C5;
 Wed, 22 Dec 2021 08:36:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH] tests/qtest/virtio-net-failover: Use g_file_open_tmp() to
 create temporary file
Date: Wed, 22 Dec 2021 09:36:52 +0100
Message-Id: <20211222083652.776592-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

g_test_rand_int() must not be called before g_test_init(), otherwise
the glib will show a "g_rand_int: assertion 'rand != NULL' failed"
message in the log. So we could change the order here, but actually,
it's safer to use g_file_open_tmp() anyway, so let's use that function
now instead.

Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/virtio-net-failover.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
index 4b2ba8a106..22ad54bb95 100644
--- a/tests/qtest/virtio-net-failover.c
+++ b/tests/qtest/virtio-net-failover.c
@@ -1306,13 +1306,15 @@ static void test_multi_in(gconstpointer opaque)
 
 int main(int argc, char **argv)
 {
-    const gchar *tmpdir = g_get_tmp_dir();
-    gchar *tmpfile = g_strdup_printf("%s/failover_test_migrate-%u-%u",
-                                     tmpdir, getpid(), g_test_rand_int());
+    gchar *tmpfile;
     int ret;
 
     g_test_init(&argc, &argv, NULL);
 
+    ret = g_file_open_tmp("failover_test_migrate-XXXXXX", &tmpfile, NULL);
+    g_assert_true(ret >= 0);
+    close(ret);
+
     qtest_add_func("failover-virtio-net/params/error/id", test_error_id);
     qtest_add_func("failover-virtio-net/params/error/pcie", test_error_pcie);
     qtest_add_func("failover-virtio-net/params/on", test_on);
-- 
2.27.0


