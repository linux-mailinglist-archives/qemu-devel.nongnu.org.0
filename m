Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6406E3D7177
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 10:49:00 +0200 (CEST)
Received: from localhost ([::1]:34564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Iln-0007gC-GD
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 04:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1m8IiT-0002kX-Qf
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 04:45:33 -0400
Received: from mail.ispras.ru ([83.149.199.84]:44536)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1m8IiR-0002wZ-7H
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 04:45:33 -0400
Received: from [127.0.1.1] (unknown [62.118.138.151])
 by mail.ispras.ru (Postfix) with ESMTPSA id 8DAE340755CB;
 Tue, 27 Jul 2021 08:45:29 +0000 (UTC)
Subject: [PATCH v3 3/5] tests/acceptance: add replay kernel test for nios2
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Tue, 27 Jul 2021 11:45:29 +0300
Message-ID: <162737552919.1735673.12493523185952280539.stgit@pasha-ThinkPad-X280>
In-Reply-To: <162737551207.1735673.5022919664900932604.stgit@pasha-ThinkPad-X280>
References: <162737551207.1735673.5022919664900932604.stgit@pasha-ThinkPad-X280>
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
kernel on nios2 platform. The test uses kernel binaries
taken from boot_linux_console test.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
---
 tests/acceptance/replay_kernel.py |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index a6db1b6556..89079987ee 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -329,6 +329,17 @@ def test_or1k_sim(self):
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
         self.do_test_advcal_2018(file_path, 'vmlinux')
 
+    def test_nios2_10m50(self):
+        """
+        :avocado: tags=arch:nios2
+        :avocado: tags=machine:10m50-ghrd
+        """
+        tar_hash = 'e4251141726c412ac0407c5a6bceefbbff018918'
+        tar_url = ('https://www.qemu-advent-calendar.org'
+                   '/2018/download/day14.tar.xz')
+        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        self.do_test_advcal_2018(file_path, 'vmlinux.elf')
+
     def test_ppc_g3beige(self):
         """
         :avocado: tags=arch:ppc


