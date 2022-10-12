Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6049C5FC7A4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 16:44:48 +0200 (CEST)
Received: from localhost ([::1]:48828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oicyV-0001mr-C1
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 10:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicni-0005EC-3M
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicnb-0006kh-MA
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665585211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K+r7FoNRng7S7CamvjytFYw+Qi/t6Rd9iRxSKlwvyjk=;
 b=BStcrZW73FcA+NZ0q6I9glDZmC8LKRcO+0Ybm9HlH1lQhsd5U0y95z6KngioRe+jhtlfoQ
 3vK8TpOmysR5sZXo6Pm2EE8g50krkGq+SjDNugYmusD3fs4weWH+Ipl5J89dm/YpNkACtk
 nmK+sg8F1ky6SkDFgS+z+xjGaK8cxxc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-xdTcHrvUMyC-kYysIs6B8A-1; Wed, 12 Oct 2022 10:33:29 -0400
X-MC-Unique: xdTcHrvUMyC-kYysIs6B8A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9967A1C068CA;
 Wed, 12 Oct 2022 14:33:29 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D30722144B20;
 Wed, 12 Oct 2022 14:33:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Michael Labiuk <michael.labiuk@virtuozzo.com>
Subject: [PULL 09/16] tests/x86: replace snprint() by g_strdup_printf() in
 drive_del-test
Date: Wed, 12 Oct 2022 16:33:09 +0200
Message-Id: <20221012143316.988561-10-thuth@redhat.com>
In-Reply-To: <20221012143316.988561-1-thuth@redhat.com>
References: <20221012143316.988561-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Michael Labiuk <michael.labiuk@virtuozzo.com>

Using g_autofree char* and  g_strdup_printf(...) instead of ugly
snprintf on stack array.

Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
Message-Id: <20220929223547.1429580-8-michael.labiuk@virtuozzo.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/drive_del-test.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/drive_del-test.c b/tests/qtest/drive_del-test.c
index 44b9578801..106c613f4f 100644
--- a/tests/qtest/drive_del-test.c
+++ b/tests/qtest/drive_del-test.c
@@ -123,12 +123,10 @@ static const char *qvirtio_get_dev_type(void)
 
 static void device_add(QTestState *qts)
 {
-    QDict *response;
-    char driver[32];
-    snprintf(driver, sizeof(driver), "virtio-blk-%s",
-             qvirtio_get_dev_type());
-
-    response = qtest_qmp(qts, "{'execute': 'device_add',"
+    g_autofree char *driver = g_strdup_printf("virtio-blk-%s",
+                                              qvirtio_get_dev_type());
+    QDict *response =
+               qtest_qmp(qts, "{'execute': 'device_add',"
                               " 'arguments': {"
                               "   'driver': %s,"
                               "   'drive': 'drive0',"
-- 
2.31.1


