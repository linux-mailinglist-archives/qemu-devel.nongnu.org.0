Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7257A5BEF52
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:46:15 +0200 (CEST)
Received: from localhost ([::1]:36690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oal4I-00076i-9D
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagqp-0000cy-0J
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:16:03 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:45945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagqm-0000jQ-LX
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:16:02 -0400
Received: by mail-ej1-x62e.google.com with SMTP id dv25so7706268ejb.12
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jjWgH7l+7GgsF+R/Vmkn7IGDdCuZsyafwDXHCQ+NIKQ=;
 b=LVyFo2NhpH/Ry+nXdZXsiTYcj0vhtRbJ8qF7kGgpQKr1k5MEJDhwN0A+xlr+/A75FM
 Ayvh2Y3mEa3Sv7TU3EZXIUP73Chbp0Wb3+8tbtPW/cy5e19hlLq2unVu0+J4Wed8+Dki
 p3RW7kxn+qrZNAvffFoj/xk/kb725MqY2zX+7OuG3BUHUVtA2251RB5yevMkdPbCbnpJ
 1pB2/jbRYwRltfKsZ9E4UO8cBWcV/ZpK0Kh/wGI9R+eQTFccuNIfgvQZTYn5qNX1lZs+
 ByNMq2hUKYVG8xsxexTwSHwoEwtrX/T0neDWqZpEE9LaIG5ZLTMK/vS5l77AB5lnmXkG
 Jh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jjWgH7l+7GgsF+R/Vmkn7IGDdCuZsyafwDXHCQ+NIKQ=;
 b=rCpabQpgEDCXlpG1vF4N79Ykej9DW5rgkj4/OCI1utqx2ArBhCGrPAgpsm+RnSJJmz
 TsZJ3pqVotWxGhfP8iboDDJw+eOej6PzbhSwGECsd6/DdmAA7Dmga0s22wRDvHcuuqw9
 N0kQkApElsCLKQSEJGcvcHTU0BqM3Sp6mcFz/TWs/DT61I6Ww4THWQJbe9LmmKGQpIYg
 fYQPUU5xR1IAbPBek7bVpIp5S8I61qLLEoMQvhzq7UgjwQ1oi4dDDQ4rkNqV1UajU8ku
 /dZfxe46z3lKCt9c8zwv9j0EOpAESKSKlSSOypK6cR4YX0+NjIV8S6SQPlHrsCcwRWF4
 vIUA==
X-Gm-Message-State: ACrzQf1x5hsfSgG7gdyOqi72ek7eEh0zhZL5wSYefdy/Bjg0tyuCSWaI
 OMWfrzcH4U8IkJO4YqP52/rqenLfrILnyw==
X-Google-Smtp-Source: AMsMyM54xHaBtUQp9e0yU2M4ijuOtDGdf1CVceRjB0Se36M5R2II4gf/9rC6CV5z0F9q9pzu7joBJg==
X-Received: by 2002:a17:907:a0c7:b0:77c:d4ac:e8f1 with SMTP id
 hw7-20020a170907a0c700b0077cd4ace8f1mr17295600ejc.354.1663694158942; 
 Tue, 20 Sep 2022 10:15:58 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a1709060c1200b00780f24b797dsm157381ejf.108.2022.09.20.10.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:15:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 72FE31FFC9;
 Tue, 20 Sep 2022 18:15:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 17/30] tests/vm: Remove obsolete Fedora VM test
Date: Tue, 20 Sep 2022 18:15:20 +0100
Message-Id: <20220920171533.1098094-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Thomas Huth <thuth@redhat.com>

It's still based on Fedora 30 - which is not supported anymore by QEMU
since years. Seems like nobody is using (and refreshing) this, and it's
easier to test this via a container anyway, so let's remove this now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220822175317.190551-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220914155950.804707-18-alex.bennee@linaro.org>

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index 8d2a164552..2cc2203d09 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -15,7 +15,7 @@ endif
 
 EFI_AARCH64 = $(wildcard $(BUILD_DIR)/pc-bios/edk2-aarch64-code.fd)
 
-X86_IMAGES := freebsd netbsd openbsd fedora haiku.x86_64
+X86_IMAGES := freebsd netbsd openbsd haiku.x86_64
 ifneq ($(GENISOIMAGE),)
 X86_IMAGES += centos
 ifneq ($(EFI_AARCH64),)
@@ -45,7 +45,6 @@ vm-help vm-test:
 	@echo "  vm-build-freebsd                - Build QEMU in FreeBSD VM"
 	@echo "  vm-build-netbsd                 - Build QEMU in NetBSD VM"
 	@echo "  vm-build-openbsd                - Build QEMU in OpenBSD VM"
-	@echo "  vm-build-fedora                 - Build QEMU in Fedora VM"
 ifneq ($(GENISOIMAGE),)
 	@echo "  vm-build-centos                 - Build QEMU in CentOS VM, with Docker"
 ifneq ($(EFI_AARCH64),)
diff --git a/tests/vm/fedora b/tests/vm/fedora
deleted file mode 100755
index 12eca919a0..0000000000
--- a/tests/vm/fedora
+++ /dev/null
@@ -1,190 +0,0 @@
-#!/usr/bin/env python3
-#
-# Fedora VM image
-#
-# Copyright 2019 Red Hat Inc.
-#
-# Authors:
-#  Gerd Hoffmann <kraxel@redhat.com>
-#
-# This code is licensed under the GPL version 2 or later.  See
-# the COPYING file in the top-level directory.
-#
-
-import os
-import re
-import sys
-import time
-import socket
-import subprocess
-import basevm
-
-class FedoraVM(basevm.BaseVM):
-    name = "fedora"
-    arch = "x86_64"
-
-    base = "https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/30/"
-    link = base + "Server/x86_64/iso/Fedora-Server-netinst-x86_64-30-1.2.iso"
-    repo = base + "Server/x86_64/os/"
-    full = base + "Everything/x86_64/os/"
-    csum = "5e4eac4566d8c572bfb3bcf54b7d6c82006ec3c6c882a2c9235c6d3494d7b100"
-    size = "20G"
-    pkgs = [
-        # tools
-        'git-core',
-        'gcc', 'binutils', 'make', 'ninja-build',
-
-        # perl
-        'perl',
-
-        # libs: usb
-        '"pkgconfig(libusb-1.0)"',
-        '"pkgconfig(libusbredirparser-0.5)"',
-
-        # libs: crypto
-        '"pkgconfig(gnutls)"',
-
-        # libs: ui
-        '"pkgconfig(sdl2)"',
-        '"pkgconfig(gtk+-3.0)"',
-        '"pkgconfig(ncursesw)"',
-
-        # libs: audio
-        '"pkgconfig(libpulse)"',
-        '"pkgconfig(alsa)"',
-
-        # libs: migration
-        '"pkgconfig(libzstd)"',
-]
-
-    BUILD_SCRIPT = """
-        set -e;
-        rm -rf /home/qemu/qemu-test.*
-        cd $(mktemp -d /home/qemu/qemu-test.XXXXXX);
-        mkdir src build; cd src;
-        tar -xf /dev/vdb;
-        cd ../build
-        ../src/configure --python=python3 {configure_opts};
-        gmake --output-sync -j{jobs} {target} {verbose};
-    """
-
-    def build_image(self, img):
-        self.print_step("Downloading install iso")
-        cimg = self._download_with_cache(self.link, sha256sum=self.csum)
-        img_tmp = img + ".tmp"
-        iso = img + ".install.iso"
-
-        self.print_step("Preparing iso and disk image")
-        subprocess.check_call(["cp", "-f", cimg, iso])
-        self.exec_qemu_img("create", "-f", "qcow2", img_tmp, self.size)
-        self.print_step("Booting installer")
-        self.boot(img_tmp, extra_args = [
-            "-machine", "graphics=off",
-            "-device", "VGA",
-            "-cdrom", iso
-        ])
-        self.console_init(300)
-        self.console_wait("installation process.")
-        time.sleep(0.3)
-        self.console_send("\t")
-        time.sleep(0.3)
-        self.console_send(" console=ttyS0")
-        proxy = os.environ.get("http_proxy")
-        if not proxy is None:
-            self.console_send(" proxy=%s" % proxy)
-            self.console_send(" inst.proxy=%s" % proxy)
-        self.console_send(" inst.repo=%s" % self.repo)
-        self.console_send("\n")
-
-        self.console_wait_send("2) Use text mode",         "2\n")
-
-        self.console_wait_send("5) [!] Installation Dest", "5\n")
-        self.console_wait_send("1) [x]",                   "c\n")
-        self.console_wait_send("2) [ ] Use All Space",     "2\n")
-        self.console_wait_send("2) [x] Use All Space",     "c\n")
-        self.console_wait_send("1) [ ] Standard Part",     "1\n")
-        self.console_wait_send("1) [x] Standard Part",     "c\n")
-
-        self.console_wait_send("7) [!] Root password",     "7\n")
-        self.console_wait("Password:")
-        self.console_send("%s\n" % self._config["root_pass"])
-        self.console_wait("Password (confirm):")
-        self.console_send("%s\n" % self._config["root_pass"])
-
-        self.console_wait_send("8) [ ] User creation",     "8\n")
-        self.console_wait_send("1) [ ] Create user",       "1\n")
-        self.console_wait_send("3) User name",             "3\n")
-        self.console_wait_send("ENTER:", "%s\n" % self._config["guest_user"])
-        self.console_wait_send("4) [ ] Use password",      "4\n")
-        self.console_wait_send("5) Password",              "5\n")
-        self.console_wait("Password:")
-        self.console_send("%s\n" % self._config["guest_pass"])
-        self.console_wait("Password (confirm):")
-        self.console_send("%s\n" % self._config["guest_pass"])
-        self.console_wait_send("7) Groups",                "c\n")
-
-        while True:
-            good = self.console_wait("3) [x] Installation",
-                                     "3) [!] Installation")
-            self.console_send("r\n")
-            if good:
-                break
-            time.sleep(10)
-
-        while True:
-            good = self.console_wait("4) [x] Software",
-                                     "4) [!] Software")
-            self.console_send("r\n")
-            if good:
-                break
-            time.sleep(10)
-            self.console_send("r\n" % self._config["guest_pass"])
-
-        self.console_wait_send("'b' to begin install",     "b\n")
-
-        self.print_step("Installation started now, this will take a while")
-
-        self.console_wait_send("Installation complete",    "\n")
-        self.print_step("Installation finished, rebooting")
-
-        # setup qemu user
-        prompt = " ~]$"
-        self.console_ssh_init(prompt, self._config["guest_user"],
-                                      self._config["guest_pass"])
-        self.console_wait_send(prompt, "exit\n")
-
-        # setup root user
-        prompt = " ~]#"
-        self.console_ssh_init(prompt, "root", self._config["root_pass"])
-        self.console_sshd_config(prompt)
-
-        # setup virtio-blk #1 (tarfile)
-        self.console_wait(prompt)
-        self.console_send("echo 'KERNEL==\"vdb\" MODE=\"666\"' >> %s\n" %
-                          "/etc/udev/rules.d/99-qemu.rules")
-
-        self.print_step("Configuration finished, rebooting")
-        self.console_wait_send(prompt, "reboot\n")
-        self.console_wait("login:")
-        self.wait_ssh()
-
-        self.print_step("Installing packages")
-        self.ssh_root_check("rm -vf /etc/yum.repos.d/fedora*.repo\n")
-        self.ssh_root_check("echo '[fedora]' >> /etc/yum.repos.d/qemu.repo\n")
-        self.ssh_root_check("echo 'baseurl=%s' >> /etc/yum.repos.d/qemu.repo\n" % self.full)
-        self.ssh_root_check("echo 'gpgcheck=0' >> /etc/yum.repos.d/qemu.repo\n")
-        self.ssh_root_check("dnf install -y %s\n" % " ".join(self.pkgs))
-
-        # shutdown
-        self.ssh_root(self.poweroff)
-        self.console_wait("sleep state S5")
-        self.wait()
-
-        if os.path.exists(img):
-            os.remove(img)
-        os.rename(img_tmp, img)
-        os.remove(iso)
-        self.print_step("All done")
-
-if __name__ == "__main__":
-    sys.exit(basevm.main(FedoraVM))
-- 
2.34.1


