Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8E22B5C96
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 11:08:00 +0100 (CET)
Received: from localhost ([::1]:37868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kexu3-0006jB-JK
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 05:07:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kexkW-0003dv-VG
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:58:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kexkU-0003Xo-Rl
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:58:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605607086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G0pVfpvxL6sRZRksObC/3bEaZWSPfFBMc9yN7ltpcpM=;
 b=eOlYKE+0u8PXN6IXXPemWnWbIMkP0Ju8VqbM6mGIjUMWEtgksHeNBoB9SbDVNjTk0qr2Ik
 Oo5t/7uGO5AfTVNGQ2DaRd54U6gMT5eh7bwHqYRlJlLJ3OvGpz35WqFTeHWRt64sBRWhcs
 7+4s0Nhnk/Gm/k3kG4rGVsPFgAaA2yY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-Q2egE0zPMXWsgl6KEX2hbw-1; Tue, 17 Nov 2020 04:57:58 -0500
X-MC-Unique: Q2egE0zPMXWsgl6KEX2hbw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8C28873073;
 Tue, 17 Nov 2020 09:57:57 +0000 (UTC)
Received: from thuth.com (ovpn-113-138.ams2.redhat.com [10.36.113.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C31D5B4B6;
 Tue, 17 Nov 2020 09:57:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 05/12] tests/vm: Add Haiku test based on their vagrant images
Date: Tue, 17 Nov 2020 10:57:41 +0100
Message-Id: <20201117095748.122371-6-thuth@redhat.com>
In-Reply-To: <20201117095748.122371-1-thuth@redhat.com>
References: <20201117095748.122371-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_BTC_ID=0.5, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander von Gluck IV <kallisti5@unixzen.com>

Signed-off-by: Alexander von Gluck IV <kallisti5@unixzen.com>
[PMD: Avoid recreating the image each time]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[thuth: Add ninja package, /usr/bin/env hack and --disable-slirp]
Message-Id: <20201114165137.15379-5-thuth@redhat.com>
Buglink: https://bugs.launchpad.net/qemu/+bug/1715203
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/keys/vagrant        |  27 +++++++++
 tests/keys/vagrant.pub    |   1 +
 tests/vm/Makefile.include |   3 +-
 tests/vm/basevm.py        |   5 +-
 tests/vm/haiku.x86_64     | 119 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 152 insertions(+), 3 deletions(-)
 create mode 100644 tests/keys/vagrant
 create mode 100644 tests/keys/vagrant.pub
 create mode 100755 tests/vm/haiku.x86_64

diff --git a/tests/keys/vagrant b/tests/keys/vagrant
new file mode 100644
index 0000000000..7d6a083909
--- /dev/null
+++ b/tests/keys/vagrant
@@ -0,0 +1,27 @@
+-----BEGIN RSA PRIVATE KEY-----
+MIIEogIBAAKCAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzI
+w+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoP
+kcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2
+hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NO
+Td0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcW
+yLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQIBIwKCAQEA4iqWPJXtzZA68mKd
+ELs4jJsdyky+ewdZeNds5tjcnHU5zUYE25K+ffJED9qUWICcLZDc81TGWjHyAqD1
+Bw7XpgUwFgeUJwUlzQurAv+/ySnxiwuaGJfhFM1CaQHzfXphgVml+fZUvnJUTvzf
+TK2Lg6EdbUE9TarUlBf/xPfuEhMSlIE5keb/Zz3/LUlRg8yDqz5w+QWVJ4utnKnK
+iqwZN0mwpwU7YSyJhlT4YV1F3n4YjLswM5wJs2oqm0jssQu/BT0tyEXNDYBLEF4A
+sClaWuSJ2kjq7KhrrYXzagqhnSei9ODYFShJu8UWVec3Ihb5ZXlzO6vdNQ1J9Xsf
+4m+2ywKBgQD6qFxx/Rv9CNN96l/4rb14HKirC2o/orApiHmHDsURs5rUKDx0f9iP
+cXN7S1uePXuJRK/5hsubaOCx3Owd2u9gD6Oq0CsMkE4CUSiJcYrMANtx54cGH7Rk
+EjFZxK8xAv1ldELEyxrFqkbE4BKd8QOt414qjvTGyAK+OLD3M2QdCQKBgQDtx8pN
+CAxR7yhHbIWT1AH66+XWN8bXq7l3RO/ukeaci98JfkbkxURZhtxV/HHuvUhnPLdX
+3TwygPBYZFNo4pzVEhzWoTtnEtrFueKxyc3+LjZpuo+mBlQ6ORtfgkr9gBVphXZG
+YEzkCD3lVdl8L4cw9BVpKrJCs1c5taGjDgdInQKBgHm/fVvv96bJxc9x1tffXAcj
+3OVdUN0UgXNCSaf/3A/phbeBQe9xS+3mpc4r6qvx+iy69mNBeNZ0xOitIjpjBo2+
+dBEjSBwLk5q5tJqHmy/jKMJL4n9ROlx93XS+njxgibTvU6Fp9w+NOFD/HvxB3Tcz
+6+jJF85D5BNAG3DBMKBjAoGBAOAxZvgsKN+JuENXsST7F89Tck2iTcQIT8g5rwWC
+P9Vt74yboe2kDT531w8+egz7nAmRBKNM751U/95P9t88EDacDI/Z2OwnuFQHCPDF
+llYOUI+SpLJ6/vURRbHSnnn8a/XG+nzedGH5JGqEJNQsz+xT2axM0/W/CRknmGaJ
+kda/AoGANWrLCz708y7VYgAtW2Uf1DPOIYMdvo6fxIB5i9ZfISgcJ/bbCUkFrhoH
++vq/5CIWxCPp0f85R4qxxQ5ihxJ0YDQT9Jpx4TMss4PSavPaBH3RXow5Ohe+bYoQ
+NE5OgEXk2wVfZczCZpigBKbKZHNYcelXtTt/nP3rsCuGcM4h53s=
+-----END RSA PRIVATE KEY-----
diff --git a/tests/keys/vagrant.pub b/tests/keys/vagrant.pub
new file mode 100644
index 0000000000..b8d012d787
--- /dev/null
+++ b/tests/keys/vagrant.pub
@@ -0,0 +1 @@
+ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== well-known vagrant key for qemu-test, do not use on any machine exposed to an external network
diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index 61f893ffdc..e94d95ec54 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -4,7 +4,7 @@
 
 EFI_AARCH64 = $(wildcard $(BUILD_DIR)/pc-bios/edk2-aarch64-code.fd)
 
-IMAGES := freebsd netbsd openbsd centos fedora
+IMAGES := freebsd netbsd openbsd centos fedora haiku.x86_64
 ifneq ($(GENISOIMAGE),)
 IMAGES += ubuntu.i386 centos
 ifneq ($(EFI_AARCH64),)
@@ -41,6 +41,7 @@ endif
 else
 	@echo "  (install genisoimage to build centos/ubuntu images)"
 endif
+	@echo "  vm-build-haiku.x86_64           - Build QEMU in Haiku VM"
 	@echo ""
 	@echo "  vm-build-all                    - Build QEMU in all VMs"
 	@echo "  vm-clean-all                    - Clean up VM images"
diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 3fac20e929..00f1d5ca8d 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -44,6 +44,7 @@ DEFAULT_CONFIG = {
     'machine'         : 'pc',
     'guest_user'      : "qemu",
     'guest_pass'      : "qemupass",
+    'root_user'       : "root",
     'root_pass'       : "qemupass",
     'ssh_key_file'    : SSH_KEY_FILE,
     'ssh_pub_key_file': SSH_PUB_KEY_FILE,
@@ -245,13 +246,13 @@ class BaseVM(object):
         return self._ssh_do(self._config["guest_user"], cmd, False)
 
     def ssh_root(self, *cmd):
-        return self._ssh_do("root", cmd, False)
+        return self._ssh_do(self._config["root_user"], cmd, False)
 
     def ssh_check(self, *cmd):
         self._ssh_do(self._config["guest_user"], cmd, True)
 
     def ssh_root_check(self, *cmd):
-        self._ssh_do("root", cmd, True)
+        self._ssh_do(self._config["root_user"], cmd, True)
 
     def build_image(self, img):
         raise NotImplementedError
diff --git a/tests/vm/haiku.x86_64 b/tests/vm/haiku.x86_64
new file mode 100755
index 0000000000..37af48bf1b
--- /dev/null
+++ b/tests/vm/haiku.x86_64
@@ -0,0 +1,119 @@
+#!/usr/bin/env python3
+#
+# Haiku VM image
+#
+# Copyright 2020 Haiku, Inc.
+#
+# Authors:
+#  Alexander von Gluck IV <kallisti5@unixzen.com>
+#
+# This code is licensed under the GPL version 2 or later.  See
+# the COPYING file in the top-level directory.
+#
+
+import os
+import re
+import sys
+import time
+import socket
+import subprocess
+import basevm
+
+VAGRANT_KEY_FILE = os.path.join(os.path.dirname(__file__),
+    "..", "keys", "vagrant")
+
+VAGRANT_PUB_KEY_FILE = os.path.join(os.path.dirname(__file__),
+    "..", "keys", "vagrant.pub")
+
+HAIKU_CONFIG = {
+    'cpu'             : "max",
+    'machine'         : 'pc',
+    'guest_user'      : "vagrant",
+    'guest_pass'      : "",
+    'root_user'       : "vagrant",
+    'root_pass'       : "",
+    'ssh_key_file'    : VAGRANT_KEY_FILE,
+    'ssh_pub_key_file': VAGRANT_PUB_KEY_FILE,
+    'memory'          : "4G",
+    'extra_args'      : [],
+    'qemu_args'       : "-device VGA",
+    'dns'             : "",
+    'ssh_port'        : 0,
+    'install_cmds'    : "",
+    'boot_dev_type'   : "block",
+    'ssh_timeout'     : 1,
+}
+
+class HaikuVM(basevm.BaseVM):
+    name = "haiku"
+    arch = "x86_64"
+
+    link = "https://app.vagrantup.com/haiku-os/boxes/r1beta2-x86_64/versions/20200702/providers/libvirt.box"
+    csum = "41c38b316e0cbdbc66b5dbaf3612b866700a4f35807cb1eb266a5bf83e9e68d5"
+
+    poweroff = "shutdown"
+
+    requirements = [
+        "devel:libbz2",
+        "devel:libcapstone",
+        "devel:libcurl",
+        "devel:libfdt",
+        "devel:libgcrypt",
+        "devel:libgl",
+        "devel:libglib_2.0",
+        "devel:libgnutls",
+        "devel:libgpg_error",
+        "devel:libintl",
+        "devel:libjpeg",
+        "devel:liblzo2",
+        "devel:libncursesw",
+        "devel:libnettle",
+        "devel:libpixman_1",
+        "devel:libpng16",
+        "devel:libsdl2_2.0",
+        "devel:libsnappy",
+        "devel:libssh2",
+        "devel:libtasn1",
+        "devel:libusb_1.0",
+        "devel:libz",
+        "ninja",
+        "setuptools_python3"
+    ]
+
+    # https://dev.haiku-os.org/ticket/16512 virtio disk1 shows up as 0 (reversed order)
+    BUILD_SCRIPT = """
+        set -e;
+        rm -rf /tmp/qemu-test.*
+        cd $(mktemp -d /tmp/qemu-test.XXXXXX);
+        mkdir src build; cd src;
+        tar -xf /dev/disk/virtual/virtio_block/0/raw;
+        mkdir -p /usr/bin
+        ln -s /boot/system/bin/env /usr/bin/env
+        cd ../build
+        ../src/configure --disable-slirp {configure_opts};
+        make --output-sync -j{jobs} {target} {verbose};
+    """
+
+    def build_image(self, img):
+        self.print_step("Downloading disk image")
+        tarball = self._download_with_cache(self.link, sha256sum=self.csum)
+
+        self.print_step("Extracting disk image")
+
+        subprocess.check_call(["tar", "xzf", tarball, "./box.img", "-O"],
+                              stdout=open(img, 'wb'))
+
+        self.print_step("Preparing disk image")
+        self.boot(img)
+
+        # Wait for ssh to be available.
+        self.wait_ssh(wait_root=True, cmd="exit 0")
+
+        # Install packages
+        self.ssh_root("pkgman install -y %s" % " ".join(self.requirements))
+        self.graceful_shutdown()
+
+        self.print_step("All done")
+
+if __name__ == "__main__":
+    sys.exit(basevm.main(HaikuVM, config=HAIKU_CONFIG))
-- 
2.18.4


