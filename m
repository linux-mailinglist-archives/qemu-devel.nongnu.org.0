Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7A248530B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 13:52:16 +0100 (CET)
Received: from localhost ([::1]:49600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n55m2-0001sH-F3
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 07:52:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n55Wu-0002kE-8a
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:36:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n55Ws-0000Rd-6Y
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:36:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641386193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fRB0TYk4Ql9iqVj7AOQAJzp7WvcMrwFo/fsuHH83DIQ=;
 b=Tsg8NAeycrw1Ava3TMPMHrZ8RxePXW+7NrtY20pHOGa0HpB86/Yqcgh2glEoFzRslc572f
 00UARw1AUbKNZx5W18cht9r6U/OYfLihDVfTKhwsYUuWr9KVA6d5mFJEC4Mx2NDslo/95H
 bg77ITGH0Mh2WFXCZTrPbQfGVghHAWU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-lPCu5OdWPTugKG10yPBaew-1; Wed, 05 Jan 2022 07:36:30 -0500
X-MC-Unique: lPCu5OdWPTugKG10yPBaew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85475801962;
 Wed,  5 Jan 2022 12:36:29 +0000 (UTC)
Received: from thuth.com (dhcp-192-229.str.redhat.com [10.33.192.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE90E22DFF;
 Wed,  5 Jan 2022 12:36:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/8] tests/qtest/hd-geo-test: Check for the lsi53c895a
 controller before using it
Date: Wed,  5 Jan 2022 13:36:07 +0100
Message-Id: <20220105123612.432038-4-thuth@redhat.com>
In-Reply-To: <20220105123612.432038-1-thuth@redhat.com>
References: <20220105123612.432038-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The lsi53c895a SCSI controller might have been disabled in the target
binary, so let's check for its availability first before using it.

Message-Id: <20211222153600.976588-1-thuth@redhat.com>
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


