Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8E05A6CE6
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 21:15:32 +0200 (CEST)
Received: from localhost ([::1]:51984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT6hv-0000ln-Pz
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 15:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6AM-0007cb-Hg
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6AL-0005BT-0t
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661884847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EXFO/tJs32jhMCaF9QcaUNiRat/uaswZkVV70NVVIrI=;
 b=Fi9cabN3j/Qfq+1q6+/A3/Mdg0NwagppQQ4TyQjOkQ+dkfvo/hqx4fb+tFvNqNOjGrt84f
 t++xUsKFLFI/dQTtD6H/E3T+27lV2J88k7A+NqSh9upu9GXo7HEs53w1bmJ/Oul+OYsuWS
 3SaUgQ3RkTOIiSebyy+pLuoG33QQIaY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-lNcVfz3JMfmJm4SNkl1_fA-1; Tue, 30 Aug 2022 14:40:46 -0400
X-MC-Unique: lNcVfz3JMfmJm4SNkl1_fA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F86818188A0;
 Tue, 30 Aug 2022 18:40:46 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CAF1B1415117;
 Tue, 30 Aug 2022 18:40:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PULL 18/23] tests/avocado: Do not run tests that require libslirp if
 it is not available
Date: Tue, 30 Aug 2022 20:40:07 +0200
Message-Id: <20220830184012.77978-19-thuth@redhat.com>
In-Reply-To: <20220830184012.77978-1-thuth@redhat.com>
References: <20220830184012.77978-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Message-Id: <20220824151122.704946-6-thuth@redhat.com>
Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/avocado_qemu/__init__.py | 7 +++++++
 tests/avocado/info_usernet.py          | 1 +
 tests/avocado/replay_linux.py          | 1 +
 3 files changed, 9 insertions(+)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 9d17a287cf..3b5b8e7f2d 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -299,6 +299,12 @@ def require_accelerator(self, accelerator):
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
@@ -550,6 +556,7 @@ def _set_distro(self):
 
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


