Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B75C696251
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 12:23:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRtO2-0007Du-KU; Tue, 14 Feb 2023 06:22:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtO0-0007Di-Uz
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:22:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtNz-0002LB-J6
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676373731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=czV9iGUVk8KZ7ksSrfTI0I8moKbDqgxpkydFdGmnD4I=;
 b=A9kati8hEaTe0va9lAmh2HhNotudTItdoDXRIQiqnDc7RHVg/T8oDHdebwBFFO9ZufXxd4
 4FU+d4SjczbtwBbsj9wNaSqwpt00Nu8FP9guccbdHKw3sRcW7Jnd8RsDHrGtNeBcQsHs4d
 FS+sfdzRwrTTVwEEE0T6SC4KW+DOcJA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-CewFvSJxPTGtWhOswMIEUw-1; Tue, 14 Feb 2023 06:22:07 -0500
X-MC-Unique: CewFvSJxPTGtWhOswMIEUw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7862885D060;
 Tue, 14 Feb 2023 11:22:07 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3F91400D927;
 Tue, 14 Feb 2023 11:22:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>
Subject: [PULL 12/22] tests/qtest: hd-geo-test: Check for missing devices
Date: Tue, 14 Feb 2023 12:21:38 +0100
Message-Id: <20230214112148.646077-13-thuth@redhat.com>
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

Don't include tests that require devices not available in the QEMU
binary.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230208194700.11035-6-farosas@suse.de>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/hd-geo-test.c | 38 +++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
index 4a7628077b..5aa258a2b3 100644
--- a/tests/qtest/hd-geo-test.c
+++ b/tests/qtest/hd-geo-test.c
@@ -1090,30 +1090,42 @@ int main(int argc, char **argv)
         qtest_add_func("hd-geo/override/ide", test_override_ide);
         if (qtest_has_device("lsi53c895a")) {
             qtest_add_func("hd-geo/override/scsi", test_override_scsi);
-            qtest_add_func("hd-geo/override/scsi_2_controllers",
-                           test_override_scsi_2_controllers);
+            if (qtest_has_device("virtio-scsi-pci")) {
+                qtest_add_func("hd-geo/override/scsi_2_controllers",
+                               test_override_scsi_2_controllers);
+            }
         }
-        qtest_add_func("hd-geo/override/virtio_blk", test_override_virtio_blk);
         qtest_add_func("hd-geo/override/zero_chs", test_override_zero_chs);
-        qtest_add_func("hd-geo/override/scsi_hot_unplug",
-                       test_override_scsi_hot_unplug);
-        qtest_add_func("hd-geo/override/virtio_hot_unplug",
-                       test_override_virtio_hot_unplug);
+        if (qtest_has_device("virtio-scsi-pci")) {
+            qtest_add_func("hd-geo/override/scsi_hot_unplug",
+                           test_override_scsi_hot_unplug);
+        }
+        if (qtest_has_device("virtio-blk-pci")) {
+            qtest_add_func("hd-geo/override/virtio_hot_unplug",
+                           test_override_virtio_hot_unplug);
+            qtest_add_func("hd-geo/override/virtio_blk",
+                           test_override_virtio_blk);
+        }
 
         if (qtest_has_machine("q35")) {
             qtest_add_func("hd-geo/override/sata", test_override_sata);
-            qtest_add_func("hd-geo/override/virtio_blk_q35",
-                           test_override_virtio_blk_q35);
             qtest_add_func("hd-geo/override/zero_chs_q35",
                            test_override_zero_chs_q35);
             if (qtest_has_device("lsi53c895a")) {
                 qtest_add_func("hd-geo/override/scsi_q35",
                                test_override_scsi_q35);
             }
-            qtest_add_func("hd-geo/override/scsi_hot_unplug_q35",
-                           test_override_scsi_hot_unplug_q35);
-            qtest_add_func("hd-geo/override/virtio_hot_unplug_q35",
-                           test_override_virtio_hot_unplug_q35);
+            if (qtest_has_device("virtio-scsi-pci")) {
+                qtest_add_func("hd-geo/override/scsi_hot_unplug_q35",
+                               test_override_scsi_hot_unplug_q35);
+            }
+            if (qtest_has_device("virtio-blk-pci")) {
+                qtest_add_func("hd-geo/override/virtio_hot_unplug_q35",
+                               test_override_virtio_hot_unplug_q35);
+                qtest_add_func("hd-geo/override/virtio_blk_q35",
+                               test_override_virtio_blk_q35);
+            }
+
         }
     } else {
         g_test_message("QTEST_QEMU_IMG not set or qemu-img missing; "
-- 
2.31.1


