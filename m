Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A1E31C61D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 06:02:45 +0100 (CET)
Received: from localhost ([::1]:49430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBsVY-0004rT-DD
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 00:02:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBsQi-0006kN-LR
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 23:57:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBsQg-0007v6-Uz
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 23:57:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613451462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9woFY3pJvH28fzeeIWoVMOLPsv6nSHBwSMHSz0G4Qso=;
 b=DPI1KPlRtmJ+Mgf16PUNZRBS7Ss2RzwPWbQO1Z1kQEgm+P7NoCirAPNGfDtfoC+8MEKkVs
 mym9H8JGizqoZzubNvuDxYuI3E4FlhO1tQJRAU3SqIq6qMR2ubY84rVImLu93eBR1DG8ty
 TR8agL8gEgepFFl82VCFScUQAlIhqq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-QtTfa68AMoOSNLWYTGitdg-1; Mon, 15 Feb 2021 23:57:38 -0500
X-MC-Unique: QtTfa68AMoOSNLWYTGitdg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 018A66EE20;
 Tue, 16 Feb 2021 04:57:38 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-129.rdu2.redhat.com
 [10.10.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D8AC27216F;
 Tue, 16 Feb 2021 04:57:29 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 9/9] Acceptance Tests: set up existing ssh keys by default
Date: Mon, 15 Feb 2021 23:57:05 -0500
Message-Id: <20210216045705.9590-10-crosa@redhat.com>
In-Reply-To: <20210216045705.9590-1-crosa@redhat.com>
References: <20210216045705.9590-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's questionable whether it's necessary to create one brand new pair
for each test.  It's not questionable that it takes less time and
resources to just use the keys available at "tests/keys" that exist
for that exact reason.

If a location for the public key is not given explicitly, the
LinuxTest will now set up the existing pair of keys as the default.
This removes the need for a lot of boilerplate code.

To avoid the ssh client from erroring on permission issues, a
directory with restrictive permissions is created for the private key.
This should still be a lot cheaper than creating a new key.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20210203172357.1422425-19-crosa@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
[marcandre: fix typos in commit message]
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 51e9055c986..df167b142cc 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -10,6 +10,7 @@
 
 import logging
 import os
+import shutil
 import sys
 import uuid
 import tempfile
@@ -254,8 +255,21 @@ def setUp(self, ssh_pubkey=None):
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
2.26.2


