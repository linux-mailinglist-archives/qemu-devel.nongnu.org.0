Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C9F1E3F27
	for <lists+qemu-devel@lfdr.de>; Wed, 27 May 2020 12:35:08 +0200 (CEST)
Received: from localhost ([::1]:57396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdtOt-00087d-57
	for lists+qemu-devel@lfdr.de; Wed, 27 May 2020 06:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Pavel.Dovgaluk@gmail.com>)
 id 1jdtLP-0001mc-CL
 for qemu-devel@nongnu.org; Wed, 27 May 2020 06:31:31 -0400
Received: from mail.ispras.ru ([83.149.199.45]:33686)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Pavel.Dovgaluk@gmail.com>) id 1jdtLO-00021w-95
 for qemu-devel@nongnu.org; Wed, 27 May 2020 06:31:31 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 33EB6CD463;
 Wed, 27 May 2020 13:31:29 +0300 (MSK)
Subject: [PATCH v2 09/11] tests/acceptance: record/replay tests with advcal
 images
From: Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 27 May 2020 13:31:28 +0300
Message-ID: <159057548896.16818.10761568499206774337.stgit@pasha-ThinkPad-X280>
In-Reply-To: <159057543840.16818.14393433996899521784.stgit@pasha-ThinkPad-X280>
References: <159057543840.16818.14393433996899521784.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: softfail client-ip=83.149.199.45;
 envelope-from=Pavel.Dovgaluk@gmail.com; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/27 06:30:39
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FROM=0.001, NML_ADSP_CUSTOM_MED=0.9,
 SPF_SOFTFAIL=0.665, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: wrampazz@redhat.com, alex.bennee@linaro.org, dovgaluk@ispras.ru,
 pavel.dovgaluk@ispras.ru, crosa@redhat.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds more record/replay tests with kernel images.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>

--

v2:
 - make download path fixed to allow pre-test downloading (suggested by Willian Rampazzo)
---
 0 files changed

diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index 0d629d1ee7..cbc6e9742e 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -168,3 +168,108 @@ class ReplayKernel(LinuxKernelUtils):
                                'console=ttyS0 vga=off')
         console_pattern = 'No filesystem could mount root'
         self.run_rr(kernel_path, kernel_command_line, console_pattern)
+
+    def do_test_advcal_2018(self, file_path, kernel_name, args=None):
+        archive.extract(file_path, self.workdir)
+
+        for entry in os.scandir(self.workdir):
+            if entry.name.startswith('day') and entry.is_dir():
+                kernel_path = entry.path + '/' + kernel_name
+                break
+
+        kernel_command_line = ''
+        console_pattern = 'QEMU advent calendar'
+        self.run_rr(kernel_path, kernel_command_line, console_pattern,
+            args=args)
+
+    def test_arm_vexpressa9(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:vexpress-a9
+        """
+        tar_hash = '32b7677ce8b6f1471fb0059865f451169934245b'
+        tar_url = ('https://www.qemu-advent-calendar.org'
+                   '/2018/download/day16.tar.xz')
+        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        self.do_test_advcal_2018(file_path, 'winter.zImage',
+            ('-dtb', self.workdir + '/day16/vexpress-v2p-ca9.dtb'))
+
+    def test_m68k_mcf5208evb(self):
+        """
+        :avocado: tags=arch:m68k
+        :avocado: tags=machine:mcf5208evb
+        """
+        tar_hash = 'ac688fd00561a2b6ce1359f9ff6aa2b98c9a570c'
+        tar_url = ('https://www.qemu-advent-calendar.org'
+                   '/2018/download/day07.tar.xz')
+        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        self.do_test_advcal_2018(file_path, 'sanity-clause.elf')
+
+    def test_microblaze_s3adsp1800(self):
+        """
+        :avocado: tags=arch:microblaze
+        :avocado: tags=machine:petalogix-s3adsp1800
+        """
+        tar_hash = '08bf3e3bfb6b6c7ce1e54ab65d54e189f2caf13f'
+        tar_url = ('https://www.qemu-advent-calendar.org'
+                   '/2018/download/day17.tar.xz')
+        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        self.do_test_advcal_2018(file_path, 'ballerina.bin')
+
+    def test_ppc64_e500(self):
+        """
+        :avocado: tags=arch:ppc64
+        :avocado: tags=machine:ppce500
+        """
+        tar_hash = '6951d86d644b302898da2fd701739c9406527fe1'
+        tar_url = ('https://www.qemu-advent-calendar.org'
+                   '/2018/download/day19.tar.xz')
+        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        self.do_test_advcal_2018(file_path, 'uImage', ('-cpu', 'e5500'))
+
+    def test_ppc_g3beige(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=machine:g3beige
+        """
+        tar_hash = 'e0b872a5eb8fdc5bed19bd43ffe863900ebcedfc'
+        tar_url = ('https://www.qemu-advent-calendar.org'
+                   '/2018/download/day15.tar.xz')
+        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        self.do_test_advcal_2018(file_path, 'invaders.elf',
+            ('-M', 'graphics=off'))
+
+    def test_ppc_mac99(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=machine:mac99
+        """
+        tar_hash = 'e0b872a5eb8fdc5bed19bd43ffe863900ebcedfc'
+        tar_url = ('https://www.qemu-advent-calendar.org'
+                   '/2018/download/day15.tar.xz')
+        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        self.do_test_advcal_2018(file_path, 'invaders.elf',
+            ('-M', 'graphics=off'))
+
+    def test_sparc_ss20(self):
+        """
+        :avocado: tags=arch:sparc
+        :avocado: tags=machine:SS-20
+        """
+        tar_hash = 'b18550d5d61c7615d989a06edace051017726a9f'
+        tar_url = ('https://www.qemu-advent-calendar.org'
+                   '/2018/download/day11.tar.xz')
+        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        self.do_test_advcal_2018(file_path, 'zImage.elf')
+
+    def test_xtensa_lx60(self):
+        """
+        :avocado: tags=arch:xtensa
+        :avocado: tags=machine:lx60
+        """
+        tar_hash = '49e88d9933742f0164b60839886c9739cb7a0d34'
+        tar_url = ('https://www.qemu-advent-calendar.org'
+                   '/2018/download/day02.tar.xz')
+        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        self.do_test_advcal_2018(file_path, 'santas-sleigh-ride.elf',
+            ('-cpu', 'dc233c'))


