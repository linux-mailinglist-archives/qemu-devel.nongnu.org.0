Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA8C30E1FF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 19:08:52 +0100 (CET)
Received: from localhost ([::1]:34264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7MaB-0003xC-B6
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 13:08:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1l7Luu-0003EK-Qi
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:26:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1l7Lut-0004fI-AQ
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:26:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612373170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y5G7ztCpaJBGFkwbHALru83qH2lN/IWnoOVBpPh6qa4=;
 b=cyR33XX3s2jNzat6DqQf18rVjSfjBXRDUWWPg1ZDUbLan5Ob1YtZPpxDk3i8wfGpLIQ6uo
 StUsCpRCl6xpFKaCcKX8f2iw6WpDD5KrMHeIdJNSBzgxWOf58pAxeHE6pwN7SMw6FE9BYt
 6ItXwAp/zP4qGUjwKptQRzHpkITfmfg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-oqv0fDQzOBa2-ZdkZ5XExA-1; Wed, 03 Feb 2021 12:25:02 -0500
X-MC-Unique: oqv0fDQzOBa2-ZdkZ5XExA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A061801964;
 Wed,  3 Feb 2021 17:25:01 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-89.rdu2.redhat.com
 [10.10.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 366A11F445;
 Wed,  3 Feb 2021 17:24:59 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/22] Acceptance Tests: set up existing ssh keys by default
Date: Wed,  3 Feb 2021 12:23:53 -0500
Message-Id: <20210203172357.1422425-19-crosa@redhat.com>
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

It's questionable wether it's necessary to create one brand new pair
for each test.  It's not questionable that it takes less time and
resources to just use the keys available at "tests/keys" that exist
for that exact reason.

If a location for the public key is not given explicitly, the
LinuxTest will now set up the existing pair of keys as the default.
This removes the need for a lot of boiler plate code.

To avoid the ssh client from erroring on permission issues, a
directory with restricive permissions is created for the private key.
This should still be a lot cheaper than creating a new key.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 8156224625..5f4dd6b9ec 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -11,6 +11,7 @@
 import logging
 import os
 import re
+import shutil
 import sys
 import uuid
 import tempfile
@@ -301,8 +302,21 @@ class LinuxTest(Test, LinuxSSHMixIn):
         self.vm.add_args('-smp', '2')
         self.vm.add_args('-m', '1024')
         self.set_up_boot()
+        if ssh_pubkey is None:
+            ssh_pubkey, self.ssh_key = self.set_up_existing_ssh_keys()
         self.set_up_cloudinit(ssh_pubkey)
 
+    def set_up_existing_ssh_keys(self):
+        ssh_public_key = os.path.join(SOURCE_DIR, 'tests', 'keys', 'id_rsa.pub')
+        source_private_key = os.path.join(SOURCE_DIR, 'tests', 'keys', 'id_rsa')
+        ssh_dir = os.path.join(self.workdir, '.ssh')
+        os.mkdir(ssh_dir, mode=0o700)
+        ssh_private_key = os.path.join(ssh_dir,
+                                       os.path.basename(source_private_key))
+        shutil.copyfile(source_private_key, ssh_private_key)
+        os.chmod(ssh_private_key, 0o600)
+        return (ssh_public_key, ssh_private_key)
+
     def download_boot(self):
         self.log.debug('Looking for and selecting a qemu-img binary to be '
                        'used to create the bootable snapshot image')
-- 
2.25.4


