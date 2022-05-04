Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FAD519D54
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 12:51:16 +0200 (CEST)
Received: from localhost ([::1]:42242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmCbD-0006Y9-7r
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 06:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nmBTt-00069i-DJ
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:39:37 -0400
Received: from mail.ispras.ru ([83.149.199.84]:37212)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nmBTr-0006hY-IA
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:39:36 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 229824076253;
 Wed,  4 May 2022 09:39:34 +0000 (UTC)
Subject: [PATCH v2 8/9] tests/avocado: add replay Linux tests for virtio
 machine
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Cc: pavel.dovgalyuk@ispras.ru, pbonzini@redhat.com, alex.bennee@linaro.org,
 crosa@redhat.com, f4bug@amsat.org
Date: Wed, 04 May 2022 12:39:33 +0300
Message-ID: <165165717390.1062896.7990177390750633281.stgit@pasha-ThinkPad-X280>
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
on x86_64 virtio platform.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 tests/avocado/replay_linux.py |   26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/avocado/replay_linux.py b/tests/avocado/replay_linux.py
index 1099b5647f..3bb1bc8816 100644
--- a/tests/avocado/replay_linux.py
+++ b/tests/avocado/replay_linux.py
@@ -123,3 +123,29 @@ def test_pc_q35(self):
         :avocado: tags=machine:q35
         """
         self.run_rr(shift=3)
+
+@skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
+class ReplayLinuxX8664Virtio(ReplayLinux):
+    """
+    :avocado: tags=arch:x86_64
+    :avocado: tags=virtio
+    :avocado: tags=accel:tcg
+    """
+
+    hdd = 'virtio-blk-pci'
+    cd = 'virtio-blk-pci'
+    bus = None
+
+    chksum = 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'
+
+    def test_pc_i440fx(self):
+        """
+        :avocado: tags=machine:pc
+        """
+        self.run_rr(shift=1)
+
+    def test_pc_q35(self):
+        """
+        :avocado: tags=machine:q35
+        """
+        self.run_rr(shift=3)


