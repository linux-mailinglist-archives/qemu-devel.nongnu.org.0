Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9021869625F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 12:24:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRtO1-0007Ds-VX; Tue, 14 Feb 2023 06:22:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtNz-0007D5-2U
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:22:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtNx-0002Kt-M1
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:22:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676373729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9BhZ3/SzM0zjCGkDzrNtKC59yN/xkmKQGEsRVaQthSo=;
 b=J9AGdZk6rTjXnww7Z5KxgWbrAQ0Fst05Bov19UtyxSlSWgeCK71vJs6f9KdM3emaWNxapG
 Z9jSnMx1X/0V+Xb3nxyCnUG88i2AHLUELkYAGRcFHoj7JWTlfNKWTCbIuqMtmO7AYFitiZ
 cjrbktiRA6u4WQWVyK7qm/Omfpy1780=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-1w4ak4fWP4-xdBtwpGsUeQ-1; Tue, 14 Feb 2023 06:22:05 -0500
X-MC-Unique: 1w4ak4fWP4-xdBtwpGsUeQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 620FB38123A4;
 Tue, 14 Feb 2023 11:22:05 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DF584010E85;
 Tue, 14 Feb 2023 11:22:04 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>
Subject: [PULL 10/22] tests/qtest: Do not run lsi53c895a test if device is not
 present
Date: Tue, 14 Feb 2023 12:21:36 +0100
Message-Id: <20230214112148.646077-11-thuth@redhat.com>
In-Reply-To: <20230214112148.646077-1-thuth@redhat.com>
References: <20230214112148.646077-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

From: Fabiano Rosas <farosas@suse.de>

The tests are built once for all the targets, so as long as one QEMU
binary is built with CONFIG_LSI_SCSI_PCI=y, this test will
run. However some binaries might not include the device. So check this
again in runtime.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Message-Id: <20230208194700.11035-3-farosas@suse.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/fuzz-lsi53c895a-test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
index 392a7ae7ed..a9254b455d 100644
--- a/tests/qtest/fuzz-lsi53c895a-test.c
+++ b/tests/qtest/fuzz-lsi53c895a-test.c
@@ -112,6 +112,10 @@ static void test_lsi_do_dma_empty_queue(void)
 
 int main(int argc, char **argv)
 {
+    if (!qtest_has_device("lsi53c895a")) {
+        return 0;
+    }
+
     g_test_init(&argc, &argv, NULL);
 
     qtest_add_func("fuzz/lsi53c895a/lsi_do_dma_empty_queue",
-- 
2.31.1


