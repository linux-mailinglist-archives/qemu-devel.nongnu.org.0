Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B5C519D76
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 12:56:29 +0200 (CEST)
Received: from localhost ([::1]:48644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmCgG-0002n4-NV
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 06:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nmBTn-0005sF-Vr
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:39:32 -0400
Received: from mail.ispras.ru ([83.149.199.84]:37190)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nmBTm-0006bl-6E
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:39:31 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id B230F4076254;
 Wed,  4 May 2022 09:39:28 +0000 (UTC)
Subject: [PATCH v2 7/9] tests/avocado: update replay_linux test
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Cc: pavel.dovgalyuk@ispras.ru, pbonzini@redhat.com, alex.bennee@linaro.org,
 crosa@redhat.com, f4bug@amsat.org
Date: Wed, 04 May 2022 12:39:28 +0300
Message-ID: <165165716852.1062896.13192413243389600940.stgit@pasha-ThinkPad-X280>
In-Reply-To: <165165712922.1062896.3966737516733314504.stgit@pasha-ThinkPad-X280>
References: <165165712922.1062896.3966737516733314504.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patch updates replay_linux test to make it compatible with
new LinuxTest class.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 tests/avocado/replay_linux.py |   19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/tests/avocado/replay_linux.py b/tests/avocado/replay_linux.py
index 15953f9e49..1099b5647f 100644
--- a/tests/avocado/replay_linux.py
+++ b/tests/avocado/replay_linux.py
@@ -32,9 +32,16 @@ class ReplayLinux(LinuxTest):
     bus = 'ide'
 
     def setUp(self):
-        super(ReplayLinux, self).setUp()
+        # LinuxTest does many replay-incompatible things, but includes
+        # useful methods. Do not setup LinuxTest here and just
+        # call some functions.
+        super(LinuxTest, self).setUp()
+        self._set_distro()
         self.boot_path = self.download_boot()
-        self.cloudinit_path = self.prepare_cloudinit()
+        self.phone_server = cloudinit.PhoneHomeServer(('0.0.0.0', 0),
+                                                      self.name)
+        ssh_pubkey, self.ssh_key = self.set_up_existing_ssh_keys()
+        self.cloudinit_path = self.prepare_cloudinit(ssh_pubkey)
 
     def vm_add_disk(self, vm, path, id, device):
         bus_string = ''
@@ -50,7 +57,9 @@ def launch_and_wait(self, record, args, shift):
         vm = self.get_vm()
         vm.add_args('-smp', '1')
         vm.add_args('-m', '1024')
-        vm.add_args('-object', 'filter-replay,id=replay,netdev=hub0port0')
+        vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
+                    '-device', 'virtio-net,netdev=vnet')
+        vm.add_args('-object', 'filter-replay,id=replay,netdev=vnet')
         if args:
             vm.add_args(*args)
         self.vm_add_disk(vm, self.boot_path, 0, self.hdd)
@@ -75,8 +84,8 @@ def launch_and_wait(self, record, args, shift):
                                     stop_check=(lambda : not vm.is_running()))
         console_drainer.start()
         if record:
-            cloudinit.wait_for_phone_home(('0.0.0.0', self.phone_home_port),
-                                          self.name)
+            while not self.phone_server.instance_phoned_back:
+                self.phone_server.handle_request()
             vm.shutdown()
             logger.info('finished the recording with log size %s bytes'
                 % os.path.getsize(replay_path))


