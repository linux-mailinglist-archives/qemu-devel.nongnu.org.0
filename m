Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447AF3B3C56
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 07:44:27 +0200 (CEST)
Received: from localhost ([::1]:48154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwede-0001xG-C0
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 01:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lweYf-000368-HL
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 01:39:17 -0400
Received: from mail.ispras.ru ([83.149.199.84]:36204)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lweYc-0001k6-AI
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 01:39:17 -0400
Received: from [127.0.1.1] (unknown [62.118.138.151])
 by mail.ispras.ru (Postfix) with ESMTPSA id D2B0940D4004;
 Fri, 25 Jun 2021 05:39:12 +0000 (UTC)
Subject: [PATCH v2 2/6] tests/acceptance: add replay kernel test for ppc64
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Fri, 25 Jun 2021 08:39:09 +0300
Message-ID: <162459954921.387455.17000468377504697052.stgit@pasha-ThinkPad-X280>
In-Reply-To: <162459953801.387455.14911900669864582030.stgit@pasha-ThinkPad-X280>
References: <162459953801.387455.14911900669864582030.stgit@pasha-ThinkPad-X280>
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
kernel on ppc64 platform. The test uses kernel binaries
taken from boot_linux_console test.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 tests/acceptance/replay_kernel.py |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index cdc22cb6d3..7e7f4c8ccc 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -367,6 +367,19 @@ def test_xtensa_lx60(self):
         self.do_test_advcal_2018(file_path, 'santas-sleigh-ride.elf',
                                  args=('-cpu', 'dc233c'))
 
+    def test_ppc64_e500(self):
+        """
+        :avocado: tags=arch:ppc64
+        :avocado: tags=machine:ppce500
+        :avocado: tags=cpu:e5500
+        """
+        tar_hash = '6951d86d644b302898da2fd701739c9406527fe1'
+        tar_url = ('https://www.qemu-advent-calendar.org'
+                   '/2018/download/day19.tar.xz')
+        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        self.do_test_advcal_2018(file_path, 'uImage', ('-cpu', 'e5500'))
+
+
 @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
 class ReplayKernelSlow(ReplayKernelBase):
     # Override the timeout, because this kernel includes an inner


