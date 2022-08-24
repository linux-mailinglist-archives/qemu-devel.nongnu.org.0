Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B033F59FE10
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 17:15:47 +0200 (CEST)
Received: from localhost ([::1]:45784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQs6c-00078I-Px
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 11:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQs2j-0000jX-O4
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:11:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQs2h-0003oU-LP
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661353902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wjDuD1u+EFXhsvOTUtvdLjGMmlI5tOCJeVxR0yge+7g=;
 b=Bw+VMvN/14A2E0H14qpYoWyPnacFeXuEa8vSKNV5kqJst/q6ZHnigJaPDdkX6NqI/q29Wr
 iGZs2Ot4KhYM7wh7bvX77/nPoWTlu3sPA/Ub6UTwoGHchbYgj4GegFoLedWuzDOxmKpp4h
 V3+qOtByQ2W7v7tNs7BX1Bic3M5IFM8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-i6GEL0FDMc-wXZO4wOgG1A-1; Wed, 24 Aug 2022 11:11:39 -0400
X-MC-Unique: i6GEL0FDMc-wXZO4wOgG1A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DF76294EDF4;
 Wed, 24 Aug 2022 15:11:38 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F00A492C3B;
 Wed, 24 Aug 2022 15:11:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH 5/6] tests/avocado: Do not run tests that require libslirp if
 it is not available
Date: Wed, 24 Aug 2022 17:11:21 +0200
Message-Id: <20220824151122.704946-6-thuth@redhat.com>
In-Reply-To: <20220824151122.704946-1-thuth@redhat.com>
References: <20220824151122.704946-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Some avocado tests blindly assume that QEMU has been compiled with libslirp
enabled and fail badly if it is missing. Add a proper check to cancel the
tests in this case.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/avocado_qemu/__init__.py | 7 +++++++
 tests/avocado/info_usernet.py          | 1 +
 tests/avocado/replay_linux.py          | 1 +
 3 files changed, 9 insertions(+)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index ed4853c805..5ebf5c1766 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -295,6 +295,12 @@ def require_accelerator(self, accelerator):
             self.cancel("%s accelerator does not seem to be "
                         "available" % accelerator)
 
+    def require_netdev(self, netdevname):
+        netdevhelp = run_cmd([self.qemu_bin,
+                             '-M', 'none', '-netdev', 'help'])[0];
+        if netdevhelp.find('\n' + netdevname + '\n') < 0:
+            self.cancel('no support for user networking')
+
     def _new_vm(self, name, *args):
         self._sd = tempfile.TemporaryDirectory(prefix="avo_qemu_sock_")
         vm = QEMUMachine(self.qemu_bin, base_temp_dir=self.workdir,
@@ -547,6 +553,7 @@ def _set_distro(self):
 
     def setUp(self, ssh_pubkey=None, network_device_type='virtio-net'):
         super().setUp()
+        self.require_netdev('user')
         self._set_distro()
         self.vm.add_args('-smp', self.smp)
         self.vm.add_args('-m', self.memory)
diff --git a/tests/avocado/info_usernet.py b/tests/avocado/info_usernet.py
index dc01f74150..b862a47dba 100644
--- a/tests/avocado/info_usernet.py
+++ b/tests/avocado/info_usernet.py
@@ -16,6 +16,7 @@
 class InfoUsernet(QemuSystemTest):
 
     def test_hostfwd(self):
+        self.require_netdev('user')
         self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22')
         self.vm.launch()
         res = self.vm.command('human-monitor-command',
diff --git a/tests/avocado/replay_linux.py b/tests/avocado/replay_linux.py
index e1f9981a34..a76dd507fc 100644
--- a/tests/avocado/replay_linux.py
+++ b/tests/avocado/replay_linux.py
@@ -55,6 +55,7 @@ def vm_add_disk(self, vm, path, id, device):
             '%s,drive=disk%s-rr%s' % (device, id, bus_string))
 
     def launch_and_wait(self, record, args, shift):
+        self.require_netdev('user')
         vm = self.get_vm()
         vm.add_args('-smp', '1')
         vm.add_args('-m', '1024')
-- 
2.31.1


