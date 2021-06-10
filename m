Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC513A2A3A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:32:26 +0200 (CEST)
Received: from localhost ([::1]:35004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrIvB-0003CW-KD
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lrIoI-0007wY-Cs
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 07:25:18 -0400
Received: from mail.ispras.ru ([83.149.199.84]:55608)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lrIoF-0003Rz-EZ
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 07:25:18 -0400
Received: from [127.0.1.1] (unknown [62.118.138.151])
 by mail.ispras.ru (Postfix) with ESMTPSA id F32A840784D1;
 Thu, 10 Jun 2021 11:25:10 +0000 (UTC)
Subject: [PATCH 5/6] tests/acceptance: add replay kernel test for alpha
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Thu, 10 Jun 2021 14:25:10 +0300
Message-ID: <162332431069.194926.15194726341679308238.stgit@pasha-ThinkPad-X280>
In-Reply-To: <162332427732.194926.7555369160312506539.stgit@pasha-ThinkPad-X280>
References: <162332427732.194926.7555369160312506539.stgit@pasha-ThinkPad-X280>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pavel.dovgalyuk@ispras.ru, philmd@redhat.com, wrampazz@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds record/replay test which boots Linux
kernel on alpha platform. The test uses kernel binaries
taken from boot_linux_console test.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 tests/acceptance/replay_kernel.py |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index 8ada87f8c9..6f7208a9d9 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -224,6 +224,23 @@ def test_s390x_s390_ccw_virtio(self):
         self.run_rr(kernel_path, kernel_command_line, console_pattern, shift=9,
             args=('-nodefaults', '-smp', '1'))
 
+    def test_alpha_clipper(self):
+        """
+        :avocado: tags=arch:alpha
+        :avocado: tags=machine:clipper
+        """
+        kernel_url = ('http://archive.debian.org/debian/dists/lenny/main/'
+                      'installer-alpha/20090123lenny10/images/cdrom/vmlinuz')
+        kernel_hash = '3a943149335529e2ed3e74d0d787b85fb5671ba3'
+        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+
+        uncompressed_kernel = archive.uncompress(kernel_path, self.workdir)
+
+        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=ttyS0'
+        console_pattern = 'Kernel command line: %s' % kernel_command_line
+        self.run_rr(uncompressed_kernel, kernel_command_line, console_pattern, shift=9,
+            args=('-nodefaults', ))
+
     def test_ppc64_pseries(self):
         """
         :avocado: tags=arch:ppc64


