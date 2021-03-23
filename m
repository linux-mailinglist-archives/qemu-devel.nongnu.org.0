Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A5E346D40
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:35:42 +0100 (CET)
Received: from localhost ([::1]:46682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpcj-0002ml-O8
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lOpK4-0007Gy-0B
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:16:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lOpJw-0002ue-NJ
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:16:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616537774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rN2Ca2cfr8rsESK/gKojXf/O2EltzAXcDdJYKp5zdDg=;
 b=YUMOBWkFxy6gfDLBOka/a04RF+KxlmXulhkGpg/bweDfL4ujaG8oxpT6NZ4vvkSwsrfP41
 Jjb/eI1DkzXaSS9Zpv3c7kMfc6tAZZX65rQ9kqisBRSPVO2CuIpiEuUV5ZXSS+dJgBJL2R
 jUx59N8+l4ELGnANuyFvmGOaQLdNY4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-_fbFx1-GMNeqd840eLCJSg-1; Tue, 23 Mar 2021 18:16:12 -0400
X-MC-Unique: _fbFx1-GMNeqd840eLCJSg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FD4988EF02;
 Tue, 23 Mar 2021 22:16:11 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-119-39.rdu2.redhat.com
 [10.10.119.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD75D60877;
 Tue, 23 Mar 2021 22:16:09 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/10] Acceptance Tests: set up SSH connection by default
 after boot for LinuxTest
Date: Tue, 23 Mar 2021 18:15:36 -0400
Message-Id: <20210323221539.3532660-8-crosa@redhat.com>
In-Reply-To: <20210323221539.3532660-1-crosa@redhat.com>
References: <20210323221539.3532660-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Eric Auger <eauger@redhat.com>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The LinuxTest specifically targets users that need to interact with Linux
guests.  So, it makes sense to give a connection by default, and avoid
requiring it as boiler-plate code.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 5 ++++-
 tests/acceptance/virtiofs_submounts.py    | 1 -
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 535f63a48d..4960142bcc 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -390,7 +390,7 @@ def set_up_cloudinit(self, ssh_pubkey=None):
         cloudinit_iso = self.prepare_cloudinit(ssh_pubkey)
         self.vm.add_args('-drive', 'file=%s,format=raw' % cloudinit_iso)
 
-    def launch_and_wait(self):
+    def launch_and_wait(self, set_up_ssh_connection=True):
         self.vm.set_console()
         self.vm.launch()
         console_drainer = datadrainer.LineLogger(self.vm.console_socket.fileno(),
@@ -398,3 +398,6 @@ def launch_and_wait(self):
         console_drainer.start()
         self.log.info('VM launched, waiting for boot confirmation from guest')
         cloudinit.wait_for_phone_home(('0.0.0.0', self.phone_home_port), self.name)
+        if set_up_ssh_connection:
+            self.log.info('Setting up the SSH connection')
+            self.ssh_connect(self.username, self.ssh_key)
diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
index e10a935ac4..e019d3b896 100644
--- a/tests/acceptance/virtiofs_submounts.py
+++ b/tests/acceptance/virtiofs_submounts.py
@@ -136,7 +136,6 @@ def set_up_virtiofs(self):
 
     def launch_vm(self):
         self.launch_and_wait()
-        self.ssh_connect('root', self.ssh_key)
 
     def set_up_nested_mounts(self):
         scratch_dir = os.path.join(self.shared_dir, 'scratch')
-- 
2.25.4


