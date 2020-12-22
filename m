Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C997A2E08FC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 11:52:31 +0100 (CET)
Received: from localhost ([::1]:42982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krfHK-0005tC-R3
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 05:52:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krfAa-00059J-SL
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:45:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krfAX-00079P-LW
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:45:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608633929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E0sYaGox2GJKp9dsgvd33obQIiHUsROrvWWkkxmFIuw=;
 b=L2HBDu2e2PyUrTcRdV5qzp8Wu4+sQijAYEMQpdGv8op2ynsdgib6zTHQLSMbXdT9cCSKJm
 yFp/83uzemMqK5wYe3drQEqij2EAcLOw68Ubu4WO/tqw0zW/6LHjWDIYVt+KjlZqy3SusR
 ccCXHdcn7eqegLvObn5lu2soSR08yCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-ECAVa1m8PFirFUX5Xf5PTw-1; Tue, 22 Dec 2020 05:45:26 -0500
X-MC-Unique: ECAVa1m8PFirFUX5Xf5PTw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E311DBBEE7;
 Tue, 22 Dec 2020 10:45:24 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-192.ams2.redhat.com
 [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5ADA87A319;
 Tue, 22 Dec 2020 10:45:23 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 10/14] tests/acceptance: Test virtio-rng on s390 via /dev/hwrng
Date: Tue, 22 Dec 2020 11:44:59 +0100
Message-Id: <20201222104503.224510-11-cohuck@redhat.com>
In-Reply-To: <20201222104503.224510-1-cohuck@redhat.com>
References: <20201222104503.224510-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

/dev/hwrng is only functional if virtio-rng is working right, so let's
add a sanity check for this device node.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Tested-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201215183623.110128-3-thuth@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 tests/acceptance/machine_s390_ccw_virtio.py | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
index 3d146b9ce640..e1ad0e29b0cd 100644
--- a/tests/acceptance/machine_s390_ccw_virtio.py
+++ b/tests/acceptance/machine_s390_ccw_virtio.py
@@ -64,9 +64,9 @@ class S390CCWVirtioMachine(Test):
                          '-append', kernel_command_line,
                          '-device', 'virtio-net-ccw,devno=fe.1.1111',
                          '-device',
-                         'virtio-rng-ccw,devno=fe.2.0000,max_revision=0',
+                         'virtio-rng-ccw,devno=fe.2.0000,max_revision=0,id=rn1',
                          '-device',
-                         'virtio-rng-ccw,devno=fe.3.1234,max_revision=2',
+                         'virtio-rng-ccw,devno=fe.3.1234,max_revision=2,id=rn2',
                          '-device', 'zpci,uid=5,target=zzz',
                          '-device', 'virtio-net-pci,id=zzz',
                          '-device', 'zpci,uid=0xa,fid=12,target=serial',
@@ -96,6 +96,19 @@ class S390CCWVirtioMachine(Test):
         exec_command_and_wait_for_pattern(self,
                         'cat /sys/bus/ccw/devices/0.3.1234/virtio?/features',
                         virtio_rng_features)
+        # check that /dev/hwrng works - and that it's gone after ejecting
+        exec_command_and_wait_for_pattern(self,
+                        'dd if=/dev/hwrng of=/dev/null bs=1k count=10',
+                        '10+0 records out')
+        self.clear_guest_dmesg()
+        self.vm.command('device_del', id='rn1')
+        self.wait_for_crw_reports()
+        self.clear_guest_dmesg()
+        self.vm.command('device_del', id='rn2')
+        self.wait_for_crw_reports()
+        exec_command_and_wait_for_pattern(self,
+                        'dd if=/dev/hwrng of=/dev/null bs=1k count=10',
+                        'dd: /dev/hwrng: No such device')
         # verify that we indeed have virtio-net devices (without having the
         # virtio-net driver handy)
         exec_command_and_wait_for_pattern(self,
-- 
2.26.2


