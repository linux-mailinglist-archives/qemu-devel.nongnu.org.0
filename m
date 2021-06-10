Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7433A2A3B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:32:28 +0200 (CEST)
Received: from localhost ([::1]:35118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrIvD-0003Gw-8I
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lrIo3-0007Ti-56
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 07:25:03 -0400
Received: from mail.ispras.ru ([83.149.199.84]:55546)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lrIo1-0003JF-BP
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 07:25:02 -0400
Received: from [127.0.1.1] (unknown [62.118.138.151])
 by mail.ispras.ru (Postfix) with ESMTPSA id E34D840755FC;
 Thu, 10 Jun 2021 11:24:59 +0000 (UTC)
Subject: [PATCH 3/6] tests/acceptance: add replay kernel test for openrisc
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Thu, 10 Jun 2021 14:24:59 +0300
Message-ID: <162332429961.194926.12492368578557666684.stgit@pasha-ThinkPad-X280>
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
kernel on openrisc platform. The test uses kernel binaries
taken from boot_linux_console test.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 tests/acceptance/replay_kernel.py |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index cdc22cb6d3..c1e80ab5ad 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -319,6 +319,17 @@ def test_ppc64_e500(self):
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
         self.do_test_advcal_2018(file_path, 'uImage', ('-cpu', 'e5500'))
 
+    def test_or1k_sim(self):
+        """
+        :avocado: tags=arch:or1k
+        :avocado: tags=machine:or1k-sim
+        """
+        tar_hash = '20334cdaf386108c530ff0badaecc955693027dd'
+        tar_url = ('https://www.qemu-advent-calendar.org'
+                   '/2018/download/day20.tar.xz')
+        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        self.do_test_advcal_2018(file_path, 'vmlinux')
+
     def test_ppc_g3beige(self):
         """
         :avocado: tags=arch:ppc


