Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E7130E158
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:46:08 +0100 (CET)
Received: from localhost ([::1]:60880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7MEB-00039E-Qn
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:46:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1l7Lu1-00026h-1m
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:25:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1l7Ltz-0004YX-CP
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:25:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612373114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mVrO1J5lUM3ZE6ZkQYr5IGoQI8bZ34a1Sln62JjAouU=;
 b=P5Osspjnpvi+NrTzL5Ykc+M3ZT1Bvx8ZmfR17B5xcsxXe768fLF/pLKRd1fWx0rk3DJ7Xr
 6Pqw9hf+TuEDC3k4WWiy1BafMVAHmNW5W3sTxkn3s9K1X9RW/TdAD759qbms4jCR4PnqCE
 Zb0TcYnpbRt8Kes+jDnnoA1aBxnNp/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-mwxvfterMyaQRBT22Pknvw-1; Wed, 03 Feb 2021 12:25:12 -0500
X-MC-Unique: mwxvfterMyaQRBT22Pknvw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC83A804022;
 Wed,  3 Feb 2021 17:25:10 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-89.rdu2.redhat.com
 [10.10.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E44A1971D;
 Wed,  3 Feb 2021 17:25:01 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/22] Acceptance Tests: add port redirection for ssh by
 default
Date: Wed,  3 Feb 2021 12:23:54 -0500
Message-Id: <20210203172357.1422425-20-crosa@redhat.com>
In-Reply-To: <20210203172357.1422425-1-crosa@redhat.com>
References: <20210203172357.1422425-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For users of the LinuxTest class, let's set up the VM with the port
redirection for SSH, instead of requiring each test to set the same
arguments.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 2 ++
 tests/acceptance/virtiofs_submounts.py    | 4 ----
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 5f4dd6b9ec..89669cc604 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -301,6 +301,8 @@ class LinuxTest(Test, LinuxSSHMixIn):
         super(LinuxTest, self).setUp()
         self.vm.add_args('-smp', '2')
         self.vm.add_args('-m', '1024')
+        self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
+                         '-device', 'virtio-net,netdev=vnet')
         self.set_up_boot()
         if ssh_pubkey is None:
             ssh_pubkey, self.ssh_key = self.set_up_existing_ssh_keys()
diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
index 0298807e5c..94b59edd6d 100644
--- a/tests/acceptance/virtiofs_submounts.py
+++ b/tests/acceptance/virtiofs_submounts.py
@@ -195,10 +195,6 @@ class VirtiofsSubmountsTest(LinuxTest):
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


