Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7271B346CAB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:24:43 +0100 (CET)
Received: from localhost ([::1]:45524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpS6-0001lK-Fk
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lOpK1-0007FG-Ma
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:16:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lOpJq-0002tL-EO
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:16:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616537764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pUF/d8A/xCBHEdfSYYeyhvTL8lcPePbg+yFc9KYn3oQ=;
 b=UXBK8AN+gi8EUq4+FSAkquT/c/MkoLWRBdY2yNv0slM6L0+uSZ+nTLp0ODVZhe8gXM2Yfw
 duszzUQmYao/CjAng2b/6BHJwxAZ7JWFZS1+jc3bhzxpoZsxUPnEeCTi4DzJNSDuw2S9t6
 +PbMcyI8gQ7iiYph8IkRP7Ap4zSi688=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-Jb8N1j3TNfyrGmlGTStREA-1; Tue, 23 Mar 2021 18:16:01 -0400
X-MC-Unique: Jb8N1j3TNfyrGmlGTStREA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D8F3100746C;
 Tue, 23 Mar 2021 22:16:00 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-119-39.rdu2.redhat.com
 [10.10.119.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 843AC6087C;
 Tue, 23 Mar 2021 22:15:58 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/10] Acceptance Tests: add port redirection for ssh by
 default
Date: Tue, 23 Mar 2021 18:15:34 -0400
Message-Id: <20210323221539.3532660-6-crosa@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

For users of the LinuxTest class, let's set up the VM with the port
redirection for SSH, instead of requiring each test to set the same
arguments.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 4 +++-
 tests/acceptance/virtiofs_submounts.py    | 4 ----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 67f75f66e5..e75b002c70 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -309,10 +309,12 @@ class LinuxTest(Test, LinuxSSHMixIn):
     timeout = 900
     chksum = None
 
-    def setUp(self, ssh_pubkey=None):
+    def setUp(self, ssh_pubkey=None, network_device_type='virtio-net'):
         super(LinuxTest, self).setUp()
         self.vm.add_args('-smp', '2')
         self.vm.add_args('-m', '1024')
+        self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
+                         '-device', '%s,netdev=vnet' % network_device_type)
         self.set_up_boot()
         if ssh_pubkey is None:
             ssh_pubkey, self.ssh_key = self.set_up_existing_ssh_keys()
diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
index bed8ce44df..e10a935ac4 100644
--- a/tests/acceptance/virtiofs_submounts.py
+++ b/tests/acceptance/virtiofs_submounts.py
@@ -207,10 +207,6 @@ def setUp(self):
             self.vm.add_args('-kernel', vmlinuz,
                              '-append', 'console=ttyS0 root=/dev/sda1')
 
-        # Allow us to connect to SSH
-        self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
-                         '-device', 'virtio-net,netdev=vnet')
-
         self.require_accelerator("kvm")
         self.vm.add_args('-accel', 'kvm')
 
-- 
2.25.4


