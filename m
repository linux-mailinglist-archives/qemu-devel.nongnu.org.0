Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F152CDA3E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 16:40:44 +0100 (CET)
Received: from localhost ([::1]:47666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkqio-0005AZ-NJ
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 10:40:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kkqhi-0004ic-JH
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 10:39:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kkqhe-0006Zo-Ub
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 10:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607009968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BJ8whF5pWOB7GFeZ1yxRhegz8L4wi5wNi8aDNDZJjtc=;
 b=Bm3htdt/mfvwVldU1d4Bwftl+YIIy5A8x6r79Ohf1CDIStmUdGukSUQk6sYplJOzWp9vVN
 rxf5NA7vHydUoR4L3VIiWW9dku5Nm4VLnwHyCNzDMK/uEDm8zwjf1HUIyFcpJVvT4chh+k
 tRgiqWi1NkDo/DoeBfxlPwzOj80XmkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-5Di7I9EvOsiuie_Y6Vhz_A-1; Thu, 03 Dec 2020 10:39:26 -0500
X-MC-Unique: 5Di7I9EvOsiuie_Y6Vhz_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B937D192AB7E;
 Thu,  3 Dec 2020 15:39:25 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-106.ams2.redhat.com
 [10.36.113.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C998160C17;
 Thu,  3 Dec 2020 15:39:20 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/acceptance: test hot(un)plug of ccw devices
Date: Thu,  3 Dec 2020 16:39:17 +0100
Message-Id: <20201203153917.66685-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hotplug a virtio-net-ccw device, and then hotunplug it again.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---

This is on top of "tests/acceptance: enhance s390x devices test"

---
 tests/acceptance/machine_s390_ccw_virtio.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
index 53b8484f8f9c..487c25c31d3c 100644
--- a/tests/acceptance/machine_s390_ccw_virtio.py
+++ b/tests/acceptance/machine_s390_ccw_virtio.py
@@ -97,3 +97,17 @@ class S390CCWVirtioMachine(Test):
         exec_command_and_wait_for_pattern(self,
                                           'cat /sys/bus/pci/devices/000a\:00\:00.0/function_id',
                                           '0x0000000c')
+        # add another device
+        self.vm.command('device_add', driver='virtio-net-ccw',
+                        devno='fe.0.4711', id='xxx')
+        exec_command_and_wait_for_pattern(self, 'dmesg | tail -n 1', 'CRW')
+        exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devices/',
+                                          '0.0.4711')
+        # and detach it again
+        self.vm.command('device_del', id='xxx')
+        self.vm.event_wait(name='DEVICE_DELETED',
+                           match={'data': {'device': 'xxx'}})
+        exec_command_and_wait_for_pattern(self, 'dmesg | tail -n 1', 'CRW')
+        exec_command_and_wait_for_pattern(self,
+                                          'ls /sys/bus/ccw/devices/0.0.4711',
+                                          'No such file or directory')
-- 
2.26.2


