Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CED700838
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 14:41:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxS59-0007he-4B; Fri, 12 May 2023 08:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pxS56-0007hE-Jq
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:41:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pxS55-0006ZU-0H
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:41:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683895265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=deP5d0tkGeQO6SuP8Qtg/2z2GFcCfaLFPEuz+Fjpx6c=;
 b=TmF0wlNtb2hhgC6F9q2n/kjFYIWOSur+a+LQDHT+yGCbeGC+Zm2GyIr6ttUi5WlHcpEUg3
 6uJ3aDYmLQIYui9imoM3bQ7jwgEssUcn1LXQM4GA3kcP8FGVOyP4cZJzA5GiT4gd/bOIZ6
 4km4dVgFiIzcMbLuAhulwP0KJdRUFFA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-aRO1Bq38Nu-eietuBZJPwQ-1; Fri, 12 May 2023 08:41:00 -0400
X-MC-Unique: aRO1Bq38Nu-eietuBZJPwQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B63C03C0ED5F;
 Fri, 12 May 2023 12:40:59 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.251])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97EAD1121314;
 Fri, 12 May 2023 12:40:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 13/18] tests/qtest/cdrom-test: Fix the test to also work
 without optional devices
Date: Fri, 12 May 2023 14:40:28 +0200
Message-Id: <20230512124033.502654-14-thuth@redhat.com>
In-Reply-To: <20230512124033.502654-1-thuth@redhat.com>
References: <20230512124033.502654-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It's possible to disable virtio-scsi and virtio-blk in the binaries,
so we must not run the corresponding tests if these devices are missing.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/cdrom-test.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
index 26a2400181..3a9054a5e0 100644
--- a/tests/qtest/cdrom-test.c
+++ b/tests/qtest/cdrom-test.c
@@ -131,9 +131,12 @@ static void test_cdboot(gconstpointer data)
 static void add_x86_tests(void)
 {
     qtest_add_data_func("cdrom/boot/default", "-cdrom ", test_cdboot);
-    qtest_add_data_func("cdrom/boot/virtio-scsi",
-                        "-device virtio-scsi -device scsi-cd,drive=cdr "
-                        "-blockdev file,node-name=cdr,filename=", test_cdboot);
+    if (qtest_has_device("virtio-scsi-ccw")) {
+        qtest_add_data_func("cdrom/boot/virtio-scsi",
+                            "-device virtio-scsi -device scsi-cd,drive=cdr "
+                            "-blockdev file,node-name=cdr,filename=",
+                            test_cdboot);
+    }
     /*
      * Unstable CI test under load
      * See https://lists.gnu.org/archive/html/qemu-devel/2019-02/msg05509.html
@@ -176,7 +179,16 @@ static void add_x86_tests(void)
 
 static void add_s390x_tests(void)
 {
+    if (!qtest_has_device("virtio-blk-ccw")) {
+        return;
+    }
+
     qtest_add_data_func("cdrom/boot/default", "-cdrom ", test_cdboot);
+
+    if (!qtest_has_device("virtio-scsi-ccw")) {
+        return;
+    }
+
     qtest_add_data_func("cdrom/boot/virtio-scsi",
                         "-device virtio-scsi -device scsi-cd,drive=cdr "
                         "-blockdev file,node-name=cdr,filename=", test_cdboot);
-- 
2.31.1


