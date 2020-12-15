Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D50662DB3E1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:40:27 +0100 (CET)
Received: from localhost ([::1]:34490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpFFK-00009i-Ua
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:40:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpFBq-0005gM-PK
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 13:36:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpFBn-0006vL-BI
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 13:36:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608057406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Qxk0Jry+joxqe+2hLOQF4obtXd78ehX62c8uSoOBrY=;
 b=EB1+fkNZeUnxcf6Sc4R9eSxCZ4KY/g/7Zl3ZGvJcjeb5Wi0YdT6cL/iHQ8veIR4pM4uwgk
 iyilxumatVOJW0AONaQmKvJ9AY+3r3TSKxLZ/QwoY27xYZknJKIIQyFG8z/UBfLMBkgRZx
 uFgCNkQXHBrS17LDLOyvuRURhT5U3ZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-DG3126wwOeiavP2djTup0A-1; Tue, 15 Dec 2020 13:36:44 -0500
X-MC-Unique: DG3126wwOeiavP2djTup0A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FF661016BFA;
 Tue, 15 Dec 2020 18:36:29 +0000 (UTC)
Received: from thuth.com (ovpn-112-194.ams2.redhat.com [10.36.112.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB1FC60864;
 Tue, 15 Dec 2020 18:36:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v2 1/3] tests/acceptance: Extract the code to clear dmesg and
 wait for CRW reports
Date: Tue, 15 Dec 2020 19:36:21 +0100
Message-Id: <20201215183623.110128-2-thuth@redhat.com>
In-Reply-To: <20201215183623.110128-1-thuth@redhat.com>
References: <20201215183623.110128-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will use this in more spots soon, so it's easier to put this into
a separate function.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Tested-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/acceptance/machine_s390_ccw_virtio.py | 30 ++++++++++++---------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
index 864ef4ee6e..3d146b9ce6 100644
--- a/tests/acceptance/machine_s390_ccw_virtio.py
+++ b/tests/acceptance/machine_s390_ccw_virtio.py
@@ -17,12 +17,24 @@ from avocado_qemu import wait_for_console_pattern
 class S390CCWVirtioMachine(Test):
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
 
+    timeout = 120
+
     def wait_for_console_pattern(self, success_message, vm=None):
         wait_for_console_pattern(self, success_message,
                                  failure_message='Kernel panic - not syncing',
                                  vm=vm)
 
-    timeout = 120
+    def wait_for_crw_reports(self):
+        exec_command_and_wait_for_pattern(self,
+                        'while ! (dmesg -c | grep CRW) ; do sleep 1 ; done',
+                        'CRW reports')
+
+    dmesg_clear_count = 1
+    def clear_guest_dmesg(self):
+        exec_command_and_wait_for_pattern(self, 'dmesg -c > /dev/null; '
+                    'echo dm_clear\ ' + str(self.dmesg_clear_count),
+                    'dm_clear ' + str(self.dmesg_clear_count))
+        self.dmesg_clear_count += 1
 
     def test_s390x_devices(self):
 
@@ -100,26 +112,18 @@ class S390CCWVirtioMachine(Test):
                         'cat /sys/bus/pci/devices/000a\:00\:00.0/function_id',
                         '0x0000000c')
         # add another device
-        exec_command_and_wait_for_pattern(self,
-                                    'dmesg -c > /dev/null; echo dm_clear\ 1',
-                                    'dm_clear 1')
+        self.clear_guest_dmesg()
         self.vm.command('device_add', driver='virtio-net-ccw',
                         devno='fe.0.4711', id='net_4711')
-        exec_command_and_wait_for_pattern(self,
-                        'while ! (dmesg -c | grep CRW) ; do sleep 1 ; done',
-                        'CRW reports')
+        self.wait_for_crw_reports()
         exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devices/',
                                           '0.0.4711')
         # and detach it again
-        exec_command_and_wait_for_pattern(self,
-                                    'dmesg -c > /dev/null; echo dm_clear\ 2',
-                                    'dm_clear 2')
+        self.clear_guest_dmesg()
         self.vm.command('device_del', id='net_4711')
         self.vm.event_wait(name='DEVICE_DELETED',
                            match={'data': {'device': 'net_4711'}})
-        exec_command_and_wait_for_pattern(self,
-                        'while ! (dmesg -c | grep CRW) ; do sleep 1 ; done',
-                        'CRW reports')
+        self.wait_for_crw_reports()
         exec_command_and_wait_for_pattern(self,
                                           'ls /sys/bus/ccw/devices/0.0.4711',
                                           'No such file or directory')
-- 
2.27.0


