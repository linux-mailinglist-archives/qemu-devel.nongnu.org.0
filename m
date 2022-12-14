Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC58B64C6ED
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 11:16:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5OiC-0007jS-QF; Wed, 14 Dec 2022 05:10:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Oi2-0007eR-MG
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Oi0-0001Eu-9p
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671012591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ICX9dpuUPa7l+uVKKhDHhSks58NundfTvA3Htr3E5Q8=;
 b=jRuf8bVihWfBAIfCQqA5NZ9a5a07tUCxKq/zDaRVp8DMvctgVE0UkZDtCLx8EsnA0TsjZZ
 h8UogXj1fdNT45vNyXD/IrQSgpF8xucm2ULNSIzr9BXX1P2jMaavfBpCkFPzhxjH8/QH+S
 W+Ou+4S0wXuas6KsmWedvg3DPqEMf5I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-THuqCEKBMPqBE_B0fZlhqg-1; Wed, 14 Dec 2022 05:09:49 -0500
X-MC-Unique: THuqCEKBMPqBE_B0fZlhqg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE9601C08969;
 Wed, 14 Dec 2022 10:09:48 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8C26492C14;
 Wed, 14 Dec 2022 10:09:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: [PULL 23/23] tests/qtest/vhost-user-blk-test: don't abort all qtests
 on missing envar
Date: Wed, 14 Dec 2022 11:09:11 +0100
Message-Id: <20221214100911.165291-24-thuth@redhat.com>
In-Reply-To: <20221214100911.165291-1-thuth@redhat.com>
References: <20221214100911.165291-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

From: Christian Schoenebeck <qemu_oss@crudebyte.com>

This test requires environment variable QTEST_QEMU_STORAGE_DAEMON_BINARY
to be defined for running. If not, it would immediately abort all qtests
and prevent other, unrelated tests from running.

To fix that, just skip vhost-user-blk-test instead and log a message
about missing environment variable.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <E1oybRD-0005D5-5r@lizzy.crudebyte.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/vhost-user-blk-test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
index 07a4c2d500..dc37f5af4d 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -983,6 +983,12 @@ static void register_vhost_user_blk_test(void)
         .before = vhost_user_blk_test_setup,
     };
 
+    if (!getenv("QTEST_QEMU_STORAGE_DAEMON_BINARY")) {
+        g_test_message("QTEST_QEMU_STORAGE_DAEMON_BINARY not defined, "
+                       "skipping vhost-user-blk-test");
+        return;
+    }
+
     /*
      * tests for vhost-user-blk and vhost-user-blk-pci
      * The tests are borrowed from tests/virtio-blk-test.c. But some tests
-- 
2.31.1


