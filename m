Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A5865FCC0
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 09:31:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDi6A-0002XK-9M; Fri, 06 Jan 2023 03:29:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDi64-0002WZ-3W
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:29:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDi62-0005Uc-Lv
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:29:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672993742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2MfUHQlCz0bSPAlpWoHfABJfI5Tzu0jF+H+zQMgn0k0=;
 b=cgop4jzWUTQJP1TB26tzPWQDSGZl3alxxxkezubcuz/IUxxs3LCl5/90HPXUOO4k052Qqv
 oaBfh5GHMxUmgE6fQ+YRW6May8JEsxePElp1KEN0M6LPZkVmZIwccghH2wTqmkPSHwcOVq
 0ZYr1eRK3WhABUwPCLpZZBrEM8wAfYI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-_L6FODc9OSaT5Nn2cQvpdQ-1; Fri, 06 Jan 2023 03:28:58 -0500
X-MC-Unique: _L6FODc9OSaT5Nn2cQvpdQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 427B085CCE0;
 Fri,  6 Jan 2023 08:28:58 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F30F492B06;
 Fri,  6 Jan 2023 08:28:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Nikita Ivanov <nivanov@cloudlinux.com>
Subject: [PULL 01/15] qemu-iotests/stream-under-throttle: do not shutdown QEMU
Date: Fri,  6 Jan 2023 09:28:39 +0100
Message-Id: <20230106082853.31787-2-thuth@redhat.com>
In-Reply-To: <20230106082853.31787-1-thuth@redhat.com>
References: <20230106082853.31787-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

From: Christian Borntraeger <borntraeger@linux.ibm.com>

Without a kernel or boot disk a QEMU on s390 will exit (usually with a
disabled wait state). This breaks the stream-under-throttle test case.
Do not exit qemu if on s390.

Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
Message-Id: <20221207131452.8455-1-borntraeger@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/tests/stream-under-throttle | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qemu-iotests/tests/stream-under-throttle b/tests/qemu-iotests/tests/stream-under-throttle
index 8d2d9e1684..c24dfbcaa2 100755
--- a/tests/qemu-iotests/tests/stream-under-throttle
+++ b/tests/qemu-iotests/tests/stream-under-throttle
@@ -88,6 +88,8 @@ class TestStreamWithThrottle(iotests.QMPTestCase):
                            'x-iops-total=10000,x-bps-total=104857600')
         self.vm.add_blockdev(self.vm.qmp_to_opts(blockdev))
         self.vm.add_device('virtio-blk,iothread=iothr0,drive=throttled-node')
+        if iotests.qemu_default_machine == 's390-ccw-virtio':
+            self.vm.add_args('-no-shutdown')
         self.vm.launch()
 
     def tearDown(self) -> None:
-- 
2.31.1


