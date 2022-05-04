Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F51A519D75
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 12:56:29 +0200 (CEST)
Received: from localhost ([::1]:48592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmCgF-0002l0-Jg
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 06:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nmBU1-0006Du-2R
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:39:46 -0400
Received: from mail.ispras.ru ([83.149.199.84]:37232)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nmBTy-0006iW-FY
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:39:44 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 831B54076253;
 Wed,  4 May 2022 09:39:39 +0000 (UTC)
Subject: [PATCH v2 9/9] tests/avocado: add replay Linux test for Aarch64
 machines
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Cc: pavel.dovgalyuk@ispras.ru, pbonzini@redhat.com, alex.bennee@linaro.org,
 crosa@redhat.com, f4bug@amsat.org
Date: Wed, 04 May 2022 12:39:39 +0300
Message-ID: <165165717932.1062896.10732275463052964887.stgit@pasha-ThinkPad-X280>
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

This patch adds two tests for replaying Linux boot process
on Aarch64 platform.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 tests/avocado/replay_linux.py |   41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tests/avocado/replay_linux.py b/tests/avocado/replay_linux.py
index 3bb1bc8816..e1f9981a34 100644
--- a/tests/avocado/replay_linux.py
+++ b/tests/avocado/replay_linux.py
@@ -13,6 +13,7 @@
 import time
 
 from avocado import skipUnless
+from avocado_qemu import BUILD_DIR
 from avocado.utils import cloudinit
 from avocado.utils import network
 from avocado.utils import vmimage
@@ -149,3 +150,43 @@ def test_pc_q35(self):
         :avocado: tags=machine:q35
         """
         self.run_rr(shift=3)
+
+@skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
+class ReplayLinuxAarch64(ReplayLinux):
+    """
+    :avocado: tags=accel:tcg
+    :avocado: tags=arch:aarch64
+    :avocado: tags=machine:virt
+    :avocado: tags=cpu:max
+    """
+
+    chksum = '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49'
+
+    hdd = 'virtio-blk-device'
+    cd = 'virtio-blk-device'
+    bus = None
+
+    def get_common_args(self):
+        return ('-bios',
+                os.path.join(BUILD_DIR, 'pc-bios', 'edk2-aarch64-code.fd'),
+                "-cpu", "max,lpa2=off",
+                '-device', 'virtio-rng-pci,rng=rng0',
+                '-object', 'rng-builtin,id=rng0')
+
+    def test_virt_gicv2(self):
+        """
+        :avocado: tags=machine:gic-version=2
+        """
+
+        self.run_rr(shift=3,
+                    args=(*self.get_common_args(),
+                          "-machine", "virt,gic-version=2"))
+
+    def test_virt_gicv3(self):
+        """
+        :avocado: tags=machine:gic-version=3
+        """
+
+        self.run_rr(shift=3,
+                    args=(*self.get_common_args(),
+                          "-machine", "virt,gic-version=3"))


