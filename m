Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AFE47D453
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 16:38:55 +0100 (CET)
Received: from localhost ([::1]:38866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n03hd-00010G-Q2
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 10:38:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n03fN-0000An-Ji
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 10:36:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n03fH-0002ng-TR
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 10:36:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640187386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+hYea3MSU0cNQag73QVZpGRGMfgsBorH93JdvXgD888=;
 b=AY9tQyZCEL+BTTnRRaVWlBxywOBNf8kEYGasfSUoqXCV81D/aYjmrsKqosAyHOrXYeedvq
 M5JFjUpfB7C2ID+H1X/YHQxvUoyZNhXqHV39IjkkxtiO6FSSlBooraeAiwN7KX6+40oUnc
 RAn9q7qYG+/kPRP3aB21AiTus4f6AhA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-H7l-mXNvNDeOHgvbLeV4mw-1; Wed, 22 Dec 2021 10:36:25 -0500
X-MC-Unique: H7l-mXNvNDeOHgvbLeV4mw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 753EF1018726;
 Wed, 22 Dec 2021 15:36:24 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44BCD749BD;
 Wed, 22 Dec 2021 15:36:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/qtest/hd-geo-test: Check for the lsi53c895a controller
 before using it
Date: Wed, 22 Dec 2021 16:36:00 +0100
Message-Id: <20211222153600.976588-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The lsi53c895a SCSI controller might have been disabled in the target
binary, so let's check for its availability first before using it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/hd-geo-test.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
index 113126ae06..771eaa741b 100644
--- a/tests/qtest/hd-geo-test.c
+++ b/tests/qtest/hd-geo-test.c
@@ -960,9 +960,11 @@ int main(int argc, char **argv)
     qtest_add_func("hd-geo/ide/device/user/chst", test_ide_device_user_chst);
     if (have_qemu_img()) {
         qtest_add_func("hd-geo/override/ide", test_override_ide);
-        qtest_add_func("hd-geo/override/scsi", test_override_scsi);
-        qtest_add_func("hd-geo/override/scsi_2_controllers",
-                       test_override_scsi_2_controllers);
+        if (qtest_has_device("lsi53c895a")) {
+            qtest_add_func("hd-geo/override/scsi", test_override_scsi);
+            qtest_add_func("hd-geo/override/scsi_2_controllers",
+                           test_override_scsi_2_controllers);
+        }
         qtest_add_func("hd-geo/override/virtio_blk", test_override_virtio_blk);
         qtest_add_func("hd-geo/override/zero_chs", test_override_zero_chs);
         qtest_add_func("hd-geo/override/scsi_hot_unplug",
-- 
2.27.0


