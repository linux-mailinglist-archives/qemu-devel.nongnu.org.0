Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AD45FC7D9
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 16:57:25 +0200 (CEST)
Received: from localhost ([::1]:44420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oidAi-0006bM-Hc
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 10:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicnj-0005JV-MZ
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicnh-0006lQ-Kp
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665585217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U3eXGvdUk/VfHhShsHnHO9DAbvoGG8vf+bPbjE1OJJc=;
 b=SC+ol6+SzHxq1+yD7vWhhsTxHpUjcCX70pShzubEj6G4JWrYSAZY3rchcpXZMDQgFKJL7i
 9tgiYe9azIkq7DQHgTosh9VVxuzuQYgLR2bt63uAaM4zHfZsjFw/ySyCGv23EsgU/IShEP
 UqoPHYeOOLCY2Gq3ZphHPIxMID+0k2k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-FVAv2GA6MrqdQqgNBRNWSw-1; Wed, 12 Oct 2022 10:33:33 -0400
X-MC-Unique: FVAv2GA6MrqdQqgNBRNWSw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15510185A7A8;
 Wed, 12 Oct 2022 14:33:33 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 084522144B20;
 Wed, 12 Oct 2022 14:33:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 12/16] tests/avocado: Add missing require_netdev('user') checks
Date: Wed, 12 Oct 2022 16:33:12 +0200
Message-Id: <20221012143316.988561-13-thuth@redhat.com>
In-Reply-To: <20221012143316.988561-1-thuth@redhat.com>
References: <20221012143316.988561-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Peter Maydell <peter.maydell@linaro.org>

Some avocado tests fail if QEMU was built without libslirp. Add
require_netdev('user') checks where necessary:

These tests try to ping 10.0.2.2 and expect it to succeed:
  boot_linux_console.py:BootLinuxConsole.test_arm_emcraft_sf2
  boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd
  ppc_bamboo.py:BambooMachine.test_ppc_bamboo

These tests run a commandline that includes '-net user':
  machine_aspeed.py:AST2x00Machine.test_arm_ast2500_evb_builroot
  (and others that use the do_test_arm_aspeed_buidroot_start()
  or do_test_arm_aspeed_sdk_start() helper functions)

These changes seem to be sufficient for 'make check-avocado'
to not fail on a --disable-slirp build.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20221001195224.2453581-1-peter.maydell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/boot_linux_console.py | 4 ++++
 tests/avocado/machine_aspeed.py     | 3 +++
 tests/avocado/ppc_bamboo.py         | 1 +
 3 files changed, 8 insertions(+)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index f26e036ab5..ca9d09b0d7 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -381,6 +381,8 @@ def test_arm_emcraft_sf2(self):
         :avocado: tags=u-boot
         :avocado: tags=accel:tcg
         """
+        self.require_netdev('user')
+
         uboot_url = ('https://raw.githubusercontent.com/'
                      'Subbaraya-Sundeep/qemu-test-binaries/'
                      'fe371d32e50ca682391e1e70ab98c2942aeffb01/u-boot')
@@ -779,6 +781,8 @@ def test_arm_orangepi_sd(self):
         :avocado: tags=machine:orangepi-pc
         :avocado: tags=device:sd
         """
+        self.require_netdev('user')
+
         deb_url = ('https://apt.armbian.com/pool/main/l/'
                    'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
         deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 0f64eb636c..124649a24b 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -93,6 +93,8 @@ def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
         self.do_test_arm_aspeed(image_path)
 
     def do_test_arm_aspeed_buidroot_start(self, image, cpu_id):
+        self.require_netdev('user')
+
         self.vm.set_console()
         self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
                          '-net', 'nic', '-net', 'user')
@@ -193,6 +195,7 @@ def wait_for_console_pattern(self, success_message, vm=None):
                                  vm=vm)
 
     def do_test_arm_aspeed_sdk_start(self, image, cpu_id):
+        self.require_netdev('user')
         self.vm.set_console()
         self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
                          '-net', 'nic', '-net', 'user')
diff --git a/tests/avocado/ppc_bamboo.py b/tests/avocado/ppc_bamboo.py
index 102ff252df..a81be3d608 100644
--- a/tests/avocado/ppc_bamboo.py
+++ b/tests/avocado/ppc_bamboo.py
@@ -23,6 +23,7 @@ def test_ppc_bamboo(self):
         :avocado: tags=accel:tcg
         """
         self.require_accelerator("tcg")
+        self.require_netdev('user')
         tar_url = ('http://landley.net/aboriginal/downloads/binaries/'
                    'system-image-powerpc-440fp.tar.gz')
         tar_hash = '53e5f16414b195b82d2c70272f81c2eedb39bad9'
-- 
2.31.1


