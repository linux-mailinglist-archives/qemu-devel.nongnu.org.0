Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEE035B99F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 06:49:38 +0200 (CEST)
Received: from localhost ([::1]:47782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVoW1-0003xk-BY
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 00:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lVoUL-0002H9-9H
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 00:47:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lVoUJ-0003hb-9N
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 00:47:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618202870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SkruJh2AnJD/IQj1NVjaP066nLSvXKWkCrCrrypGIE8=;
 b=GLThe3/UAGIcHMTx/y6tp1eHY/boR9KThYkVyAOglps7tILwlZaIoPMcvHKdQw8tFXnQnX
 N+7cDDNqNoDEFLPb9/Qh88z1DDtpowoqNBZAp7lDq0jnW5ZH+EiMHGI8IGkhD7RyzVhZBj
 N37KGr14iH+Ta0LaeyLAPIQ79Qn6h5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-g5HvrgaePyGYeqtTNi2iSg-1; Mon, 12 Apr 2021 00:47:48 -0400
X-MC-Unique: g5HvrgaePyGYeqtTNi2iSg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D99EC83DD23;
 Mon, 12 Apr 2021 04:47:47 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-108.rdu2.redhat.com
 [10.10.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 239CB1045D05;
 Mon, 12 Apr 2021 04:47:45 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/11] Acceptance Tests: add port redirection for ssh by
 default
Date: Mon, 12 Apr 2021 00:46:38 -0400
Message-Id: <20210412044644.55083-6-crosa@redhat.com>
In-Reply-To: <20210412044644.55083-1-crosa@redhat.com>
References: <20210412044644.55083-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 John Snow <jsnow@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For users of the LinuxTest class, let's set up the VM with the port
redirection for SSH, instead of requiring each test to set the same
arguments.

It also sets the network device, by default, to virtio-net.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 5 ++++-
 tests/acceptance/virtiofs_submounts.py    | 4 ----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 67f75f66e56..0856880000f 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -309,10 +309,13 @@ class LinuxTest(Test, LinuxSSHMixIn):
     timeout = 900
     chksum = None
 
-    def setUp(self, ssh_pubkey=None):
+    def setUp(self, ssh_pubkey=None, network_device_type='virtio-net'):
         super(LinuxTest, self).setUp()
         self.vm.add_args('-smp', '2')
         self.vm.add_args('-m', '1024')
+        # The following network device allows for SSH connections
+        self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
+                         '-device', '%s,netdev=vnet' % network_device_type)
         self.set_up_boot()
         if ssh_pubkey is None:
             ssh_pubkey, self.ssh_key = self.set_up_existing_ssh_keys()
diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
index bed8ce44dfc..e10a935ac4e 100644
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
2.30.2


