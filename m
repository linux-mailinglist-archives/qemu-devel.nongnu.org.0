Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DABA2FA51
	for <lists+qemu-devel@lfdr.de>; Thu, 30 May 2019 12:32:11 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50762 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWILx-0006Lm-Q5
	for lists+qemu-devel@lfdr.de; Thu, 30 May 2019 06:32:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hWIFH-0001FU-0Y
	for qemu-devel@nongnu.org; Thu, 30 May 2019 06:25:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hWIFD-0000Hf-Ck
	for qemu-devel@nongnu.org; Thu, 30 May 2019 06:25:14 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:38370)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hWIFC-000084-Tj
	for qemu-devel@nongnu.org; Thu, 30 May 2019 06:25:11 -0400
Received: by mail-wm1-x344.google.com with SMTP id t5so3485440wmh.3
	for <qemu-devel@nongnu.org>; Thu, 30 May 2019 03:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=va2aVkiTrZ/koDvdRJBXUCzzwNDsrPnddM8kRf0oauo=;
	b=FhZr4sq/npVp5hp155MS1l9IwHy5BynqFOrKZ2FsshYjC1YveSAwlfYIaBoL8TVzAY
	2yOeHpYRQO+QVaEmKd5CZ/aiBSwvWbPCJMpqKezXLjghTM61O2B3FiBsoRSuEd3sriG3
	OnP2AZG3omLerTyYfHkrMW2lvEbNfuOZ4k6dSbhkeJVfvyMFak+mBbKVNFTOzqA8j+g6
	hPHgIIRRRP2tgafoPJsBiqes+FPG92OuTvP6+dAODJFxPI8gfHUWDC3gllM6i5gsvRF/
	ShiN2/e4Wf21n+1jS4buFsFgHfc2MEyZc6wS2VMbSevLMJ9AA/N1P8RJdOriXVOW7w4V
	fORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=va2aVkiTrZ/koDvdRJBXUCzzwNDsrPnddM8kRf0oauo=;
	b=g1SJ+kGOt9nGRfZKjMIm/HySlyCINBjFTxNaRqusujiNAdMslDJM0he141nkfoXVNN
	Zi41LA6nkWDBdeV6S6jYpm53UQah6uyyYnEB216dlk8d5ocDbzCjPAXKBUM/8j8A+7oG
	TBUmeBzIYblSFCQAZ3r5DpOSU9EFapeHver7Uo3KFADqNUzTlK2ulLmnIF/3G6UiMz7o
	hV+2K6NMNdcdm74Khm7C36n/2meWxuCaydsFVTRbJlFDmw3NlhSHot2E2iL8JFVAgmob
	jx6aRqsB5zswGNiBEQZ3kNkFxjUSel1i7PcP1dasK5CExjnSHIpP9Vjf5DVlYz5XzzmZ
	N3sQ==
X-Gm-Message-State: APjAAAVi2v2w6yez6rtxfQiWoJpoLqRGaW90JvXTFSyqI5ScfxqCcFJL
	mtm/jjrNN0KWi0FGlmBfgrI8x1U6gAA=
X-Google-Smtp-Source: APXvYqwvWSSjztdX2J8UhR7c2KNjflR28b4Ee63xFSdF0whXjGMMAC9Za5xAB1pv6gcwev0LK3rCdg==
X-Received: by 2002:a1c:f111:: with SMTP id p17mr1859994wmh.62.1559211906225; 
	Thu, 30 May 2019 03:25:06 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	k17sm1516486wrm.73.2019.05.30.03.25.02
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 30 May 2019 03:25:03 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id F03CC1FFAC;
	Thu, 30 May 2019 11:16:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 30 May 2019 11:16:00 +0100
Message-Id: <20190530101603.22254-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190530101603.22254-1-alex.bennee@linaro.org>
References: <20190530101603.22254-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PATCH  v1 23/26] tests/vm: freebsd autoinstall,
 using serial console
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Instead of fetching the prebuilt image from patchew download the install
iso and prepare the image locally.  Install to disk, using the serial
console.  Create qemu user, configure ssh login.  Install packages
needed for qemu builds.

Note that freebsd package downloads are delivered as non-cachable
content, so I had to configure squid with "ignore-no-store
ignore-private ignore-reload" for pkgmir.geo.freebsd.org to make the
caching actually work.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190520124716.30472-12-kraxel@redhat.com>
---
 tests/vm/freebsd | 179 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 169 insertions(+), 10 deletions(-)

diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index b0066017a61..eb029bdfede 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -2,43 +2,202 @@
 #
 # FreeBSD VM image
 #
-# Copyright 2017 Red Hat Inc.
+# Copyright 2017-2019 Red Hat Inc.
 #
 # Authors:
 #  Fam Zheng <famz@redhat.com>
+#  Gerd Hoffmann <kraxel@redhat.com>
 #
 # This code is licensed under the GPL version 2 or later.  See
 # the COPYING file in the top-level directory.
 #
 
 import os
+import re
 import sys
+import time
+import socket
 import subprocess
 import basevm
 
 class FreeBSDVM(basevm.BaseVM):
     name = "freebsd"
     arch = "x86_64"
+
+    link = "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.0/FreeBSD-12.0-RELEASE-amd64-disc1.iso.xz"
+    csum = "1d40015bea89d05b8bd13e2ed80c40b522a9ec1abd8e7c8b80954fb485fb99db"
+    size = "20G"
+    pkgs = [
+        # build tools
+        "git",
+        "pkgconf",
+        "bzip2",
+
+        # gnu tools
+        "bash",
+        "gmake",
+        "gsed",
+        "flex", "bison",
+
+        # libs: crypto
+        "gnutls",
+
+        # libs: images
+        "jpeg-turbo",
+        "png",
+
+        # libs: ui
+        "sdl2",
+        "gtk3",
+        "libxkbcommon",
+
+        # libs: opengl
+        "libepoxy",
+        "mesa-libs",
+    ]
+
     BUILD_SCRIPT = """
         set -e;
-        rm -rf /var/tmp/qemu-test.*
-        cd $(mktemp -d /var/tmp/qemu-test.XXXXXX);
+        rm -rf /home/qemu/qemu-test.*
+        cd $(mktemp -d /home/qemu/qemu-test.XXXXXX);
+        mkdir src build; cd src;
         tar -xf /dev/vtbd1;
-        ./configure {configure_opts};
+        cd ../build
+        ../src/configure --python=python3.6 {configure_opts};
         gmake --output-sync -j{jobs} {target} {verbose};
     """
 
+    def console_boot_serial(self):
+        self.console_wait_send("Autoboot", "3")
+        self.console_wait_send("OK", "set console=comconsole\n")
+        self.console_wait_send("OK", "boot\n")
+
     def build_image(self, img):
-        cimg = self._download_with_cache("http://download.patchew.org/freebsd-11.1-amd64.img.xz",
-                sha256sum='adcb771549b37bc63826c501f05121a206ed3d9f55f49145908f7e1432d65891')
-        img_tmp_xz = img + ".tmp.xz"
+        self.print_step("Downloading install iso")
+        cimg = self._download_with_cache(self.link, sha256sum=self.csum)
         img_tmp = img + ".tmp"
-        sys.stderr.write("Extracting the image...\n")
-        subprocess.check_call(["cp", "-f", cimg, img_tmp_xz])
-        subprocess.check_call(["xz", "-dvf", img_tmp_xz])
+        iso = img + ".install.iso"
+        iso_xz = iso + ".xz"
+
+        self.print_step("Preparing iso and disk image")
+        subprocess.check_call(["cp", "-f", cimg, iso_xz])
+        subprocess.check_call(["xz", "-dvf", iso_xz])
+        subprocess.check_call(["qemu-img", "create", "-f", "qcow2",
+                               img_tmp, self.size])
+
+        self.print_step("Booting installer")
+        self.boot(img_tmp, extra_args = [
+            "-machine", "graphics=off",
+            "-cdrom", iso
+        ])
+        self.console_init()
+        self.console_boot_serial()
+        self.console_wait_send("Console type",          "xterm\n")
+
+        # pre-install configuration
+        self.console_wait_send("Welcome",               "\n")
+        self.console_wait_send("Keymap Selection",      "\n")
+        self.console_wait_send("Set Hostname",          "freebsd\n")
+        self.console_wait_send("Distribution Select",   "\n")
+        self.console_wait_send("Partitioning",          "\n")
+        self.console_wait_send("Partition",             "\n")
+        self.console_wait_send("Scheme",                "\n")
+        self.console_wait_send("Editor",                "f")
+        self.console_wait_send("Confirmation",          "c")
+
+        self.print_step("Installation started now, this will take a while")
+
+        # post-install configuration
+        self.console_wait("New Password:")
+        self.console_send("%s\n" % self.ROOT_PASS)
+        self.console_wait("Retype New Password:")
+        self.console_send("%s\n" % self.ROOT_PASS)
+
+        self.console_wait_send("Network Configuration", "\n")
+        self.console_wait_send("IPv4",                  "y")
+        self.console_wait_send("DHCP",                  "y")
+        self.console_wait_send("IPv6",                  "n")
+        self.console_wait_send("Resolver",              "\n")
+
+        self.console_wait_send("Time Zone Selector",    "a\n")
+        self.console_wait_send("Confirmation",          "y")
+        self.console_wait_send("Time & Date",           "\n")
+        self.console_wait_send("Time & Date",           "\n")
+
+        self.console_wait_send("System Configuration",  "\n")
+        self.console_wait_send("System Hardening",      "\n")
+
+        # qemu user
+        self.console_wait_send("Add User Accounts", "y")
+        self.console_wait("Username")
+        self.console_send("%s\n" % self.GUEST_USER)
+        self.console_wait("Full name")
+        self.console_send("%s\n" % self.GUEST_USER)
+        self.console_wait_send("Uid",                   "\n")
+        self.console_wait_send("Login group",           "\n")
+        self.console_wait_send("Login group",           "\n")
+        self.console_wait_send("Login class",           "\n")
+        self.console_wait_send("Shell",                 "\n")
+        self.console_wait_send("Home directory",        "\n")
+        self.console_wait_send("Home directory perm",   "\n")
+        self.console_wait_send("Use password",          "\n")
+        self.console_wait_send("Use an empty password", "\n")
+        self.console_wait_send("Use a random password", "\n")
+        self.console_wait("Enter password:")
+        self.console_send("%s\n" % self.GUEST_PASS)
+        self.console_wait("Enter password again:")
+        self.console_send("%s\n" % self.GUEST_PASS)
+        self.console_wait_send("Lock out",              "\n")
+        self.console_wait_send("OK",                    "yes\n")
+        self.console_wait_send("Add another user",      "no\n")
+
+        self.console_wait_send("Final Configuration",   "\n")
+        self.console_wait_send("Manual Configuration",  "\n")
+        self.console_wait_send("Complete",              "\n")
+
+        self.print_step("Installation finished, rebooting")
+        self.console_boot_serial()
+
+        # setup qemu user
+        prompt = "$"
+        self.console_ssh_init(prompt, self.GUEST_USER, self.GUEST_PASS)
+        self.console_wait_send(prompt, "exit\n")
+
+        # setup root user
+        prompt = "root@freebsd:~ #"
+        self.console_ssh_init(prompt, "root", self.ROOT_PASS)
+        self.console_sshd_config(prompt)
+
+        # setup serial console
+        self.console_wait(prompt)
+        self.console_send("echo 'console=comconsole' >> /boot/loader.conf\n")
+
+        # setup boot delay
+        self.console_wait(prompt)
+        self.console_send("echo 'autoboot_delay=1' >> /boot/loader.conf\n")
+
+        # setup virtio-blk #1 (tarfile)
+        self.console_wait(prompt)
+        self.console_send("echo 'chmod 666 /dev/vtbd1' >> /etc/rc.local\n")
+
+        self.print_step("Configuration finished, rebooting")
+        self.console_wait_send(prompt, "reboot\n")
+        self.console_wait("login:")
+        self.wait_ssh()
+
+        self.print_step("Installing packages")
+        self.ssh_root_check("pkg install -y %s\n" % " ".join(self.pkgs))
+
+        # shutdown
+        self.ssh_root(self.poweroff)
+        self.console_wait("Uptime:")
+        self.wait()
+
         if os.path.exists(img):
             os.remove(img)
         os.rename(img_tmp, img)
+        os.remove(iso)
+        self.print_step("All done")
 
 if __name__ == "__main__":
     sys.exit(basevm.main(FreeBSDVM))
-- 
2.20.1


