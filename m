Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BACF5A007D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 19:36:04 +0200 (CEST)
Received: from localhost ([::1]:54540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQuIM-0005Gq-Pd
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 13:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQuCJ-00085n-Qs
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:29:47 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:45761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQuCG-0003Ky-MA
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:29:47 -0400
Received: by mail-ed1-x536.google.com with SMTP id u6so17901360eda.12
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 10:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=6wWvIauKjGvk0eSWCZJPTEOFAUZrhQcnYKJDalo3ovA=;
 b=NhKuWB9t+Qv+RF0+6uL9Sh/UIR2XHgYvisvs6Rfa9iyfQO3uxI2Yv+6W1tel4BJ3uB
 cf2TCh8gJEEbHyJBsInTXlJo9+7dYokSW4P5bwn9vsm+oxlCvmVflJksqCVDQPh7Ie4v
 Ra79gDsrC5GK5vAcZqQlFjdZFSi94xBwA1j70aX6KmwhDcz+gsEWQWuit/Knw25huCFl
 199DyhJMwr2rr2WOfNaKXvj/tcrRnnjEbH1/ihHb3c2fJil9CvZl4NxK6hB4RS1/mzgF
 +HhYoTeeQskikSJJSJD/7+49lWBcXNh1v5FFsCqbsccNiGbMoOlLcMHJJzM6jdH3cAQw
 xjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=6wWvIauKjGvk0eSWCZJPTEOFAUZrhQcnYKJDalo3ovA=;
 b=biHGpp6DwWNmbDhq4MBtsg1zdJUIMt19uCeCgRlAa9ap3R9uVBExD/yhGfwJBsVKJg
 KTec+Qlyn+MEKA0HP2XS7c1WZU2+BjViYewx2c54X0uRo0PT3uX2xzkQ2LJEg4YmGfdj
 2fVJh0PB8gRPN2GmhAnai/dsydotwmw96PyfxUTyO81vu98V6sQfQ6sI4ZNSsjnFyGNg
 IdgugipHc9J/IMYawF7YBw7nnrmI8slFHRDDNdzqpUbEIF5w1MHwJUtYl0sUt22t4gO2
 I4gR99tUhOzRrOaIqvTa7onG6ZvGEJYU1kwAa+DXndSV8bsc7KunRthdQJC1umwrlZH2
 oJxg==
X-Gm-Message-State: ACgBeo3FB8t3R21kSi3YbSNAbmJaWs+et1SKcr78vMjTnz+VMvoSu1Q0
 zw/x+XefDGNhKfHK1k9rEdugdA==
X-Google-Smtp-Source: AA6agR7ou9ngJxenFKWeAfvW5CwlYvuPv6ZhXb0hVwGrcKlVuRvP2Udv5md30Ie4TzwlX6Uq7IJd3Q==
X-Received: by 2002:a05:6402:424f:b0:43e:6d89:4316 with SMTP id
 g15-20020a056402424f00b0043e6d894316mr83019edb.408.1661362183195; 
 Wed, 24 Aug 2022 10:29:43 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q23-20020a17090676d700b0073d74e1a467sm249270ejn.167.2022.08.24.10.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 10:29:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2C9B21FFB7;
 Wed, 24 Aug 2022 18:29:42 +0100 (BST)
References: <20220822175317.190551-1-thuth@redhat.com>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [RFC PATCH] tests/vm: Remove obsolete Fedora VM test
Date: Wed, 24 Aug 2022 18:29:37 +0100
In-reply-to: <20220822175317.190551-1-thuth@redhat.com>
Message-ID: <87ilmhh7nd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


Thomas Huth <thuth@redhat.com> writes:

> It's still based on Fedora 30 - which is not supported anymore by QEMU
> since years. Seems like nobody is using (and refreshing) this, and it's
> easier to test this via a container anyway, so let's remove this now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to testing/next, thanks.

> ---
>  tests/vm/Makefile.include |   3 +-
>  tests/vm/fedora           | 190 --------------------------------------
>  2 files changed, 1 insertion(+), 192 deletions(-)
>  delete mode 100755 tests/vm/fedora
>
> diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
> index 8d2a164552..2cc2203d09 100644
> --- a/tests/vm/Makefile.include
> +++ b/tests/vm/Makefile.include
> @@ -15,7 +15,7 @@ endif
>=20=20
>  EFI_AARCH64 =3D $(wildcard $(BUILD_DIR)/pc-bios/edk2-aarch64-code.fd)
>=20=20
> -X86_IMAGES :=3D freebsd netbsd openbsd fedora haiku.x86_64
> +X86_IMAGES :=3D freebsd netbsd openbsd haiku.x86_64
>  ifneq ($(GENISOIMAGE),)
>  X86_IMAGES +=3D centos
>  ifneq ($(EFI_AARCH64),)
> @@ -45,7 +45,6 @@ vm-help vm-test:
>  	@echo "  vm-build-freebsd                - Build QEMU in FreeBSD VM"
>  	@echo "  vm-build-netbsd                 - Build QEMU in NetBSD VM"
>  	@echo "  vm-build-openbsd                - Build QEMU in OpenBSD VM"
> -	@echo "  vm-build-fedora                 - Build QEMU in Fedora VM"
>  ifneq ($(GENISOIMAGE),)
>  	@echo "  vm-build-centos                 - Build QEMU in CentOS VM, wit=
h Docker"
>  ifneq ($(EFI_AARCH64),)
> diff --git a/tests/vm/fedora b/tests/vm/fedora
> deleted file mode 100755
> index 12eca919a0..0000000000
> --- a/tests/vm/fedora
> +++ /dev/null
> @@ -1,190 +0,0 @@
> -#!/usr/bin/env python3
> -#
> -# Fedora VM image
> -#
> -# Copyright 2019 Red Hat Inc.
> -#
> -# Authors:
> -#  Gerd Hoffmann <kraxel@redhat.com>
> -#
> -# This code is licensed under the GPL version 2 or later.  See
> -# the COPYING file in the top-level directory.
> -#
> -
> -import os
> -import re
> -import sys
> -import time
> -import socket
> -import subprocess
> -import basevm
> -
> -class FedoraVM(basevm.BaseVM):
> -    name =3D "fedora"
> -    arch =3D "x86_64"
> -
> -    base =3D "https://archives.fedoraproject.org/pub/archive/fedora/linu=
x/releases/30/"
> -    link =3D base + "Server/x86_64/iso/Fedora-Server-netinst-x86_64-30-1=
.2.iso"
> -    repo =3D base + "Server/x86_64/os/"
> -    full =3D base + "Everything/x86_64/os/"
> -    csum =3D "5e4eac4566d8c572bfb3bcf54b7d6c82006ec3c6c882a2c9235c6d3494=
d7b100"
> -    size =3D "20G"
> -    pkgs =3D [
> -        # tools
> -        'git-core',
> -        'gcc', 'binutils', 'make', 'ninja-build',
> -
> -        # perl
> -        'perl',
> -
> -        # libs: usb
> -        '"pkgconfig(libusb-1.0)"',
> -        '"pkgconfig(libusbredirparser-0.5)"',
> -
> -        # libs: crypto
> -        '"pkgconfig(gnutls)"',
> -
> -        # libs: ui
> -        '"pkgconfig(sdl2)"',
> -        '"pkgconfig(gtk+-3.0)"',
> -        '"pkgconfig(ncursesw)"',
> -
> -        # libs: audio
> -        '"pkgconfig(libpulse)"',
> -        '"pkgconfig(alsa)"',
> -
> -        # libs: migration
> -        '"pkgconfig(libzstd)"',
> -]
> -
> -    BUILD_SCRIPT =3D """
> -        set -e;
> -        rm -rf /home/qemu/qemu-test.*
> -        cd $(mktemp -d /home/qemu/qemu-test.XXXXXX);
> -        mkdir src build; cd src;
> -        tar -xf /dev/vdb;
> -        cd ../build
> -        ../src/configure --python=3Dpython3 {configure_opts};
> -        gmake --output-sync -j{jobs} {target} {verbose};
> -    """
> -
> -    def build_image(self, img):
> -        self.print_step("Downloading install iso")
> -        cimg =3D self._download_with_cache(self.link, sha256sum=3Dself.c=
sum)
> -        img_tmp =3D img + ".tmp"
> -        iso =3D img + ".install.iso"
> -
> -        self.print_step("Preparing iso and disk image")
> -        subprocess.check_call(["cp", "-f", cimg, iso])
> -        self.exec_qemu_img("create", "-f", "qcow2", img_tmp, self.size)
> -        self.print_step("Booting installer")
> -        self.boot(img_tmp, extra_args =3D [
> -            "-machine", "graphics=3Doff",
> -            "-device", "VGA",
> -            "-cdrom", iso
> -        ])
> -        self.console_init(300)
> -        self.console_wait("installation process.")
> -        time.sleep(0.3)
> -        self.console_send("\t")
> -        time.sleep(0.3)
> -        self.console_send(" console=3DttyS0")
> -        proxy =3D os.environ.get("http_proxy")
> -        if not proxy is None:
> -            self.console_send(" proxy=3D%s" % proxy)
> -            self.console_send(" inst.proxy=3D%s" % proxy)
> -        self.console_send(" inst.repo=3D%s" % self.repo)
> -        self.console_send("\n")
> -
> -        self.console_wait_send("2) Use text mode",         "2\n")
> -
> -        self.console_wait_send("5) [!] Installation Dest", "5\n")
> -        self.console_wait_send("1) [x]",                   "c\n")
> -        self.console_wait_send("2) [ ] Use All Space",     "2\n")
> -        self.console_wait_send("2) [x] Use All Space",     "c\n")
> -        self.console_wait_send("1) [ ] Standard Part",     "1\n")
> -        self.console_wait_send("1) [x] Standard Part",     "c\n")
> -
> -        self.console_wait_send("7) [!] Root password",     "7\n")
> -        self.console_wait("Password:")
> -        self.console_send("%s\n" % self._config["root_pass"])
> -        self.console_wait("Password (confirm):")
> -        self.console_send("%s\n" % self._config["root_pass"])
> -
> -        self.console_wait_send("8) [ ] User creation",     "8\n")
> -        self.console_wait_send("1) [ ] Create user",       "1\n")
> -        self.console_wait_send("3) User name",             "3\n")
> -        self.console_wait_send("ENTER:", "%s\n" % self._config["guest_us=
er"])
> -        self.console_wait_send("4) [ ] Use password",      "4\n")
> -        self.console_wait_send("5) Password",              "5\n")
> -        self.console_wait("Password:")
> -        self.console_send("%s\n" % self._config["guest_pass"])
> -        self.console_wait("Password (confirm):")
> -        self.console_send("%s\n" % self._config["guest_pass"])
> -        self.console_wait_send("7) Groups",                "c\n")
> -
> -        while True:
> -            good =3D self.console_wait("3) [x] Installation",
> -                                     "3) [!] Installation")
> -            self.console_send("r\n")
> -            if good:
> -                break
> -            time.sleep(10)
> -
> -        while True:
> -            good =3D self.console_wait("4) [x] Software",
> -                                     "4) [!] Software")
> -            self.console_send("r\n")
> -            if good:
> -                break
> -            time.sleep(10)
> -            self.console_send("r\n" % self._config["guest_pass"])
> -
> -        self.console_wait_send("'b' to begin install",     "b\n")
> -
> -        self.print_step("Installation started now, this will take a whil=
e")
> -
> -        self.console_wait_send("Installation complete",    "\n")
> -        self.print_step("Installation finished, rebooting")
> -
> -        # setup qemu user
> -        prompt =3D " ~]$"
> -        self.console_ssh_init(prompt, self._config["guest_user"],
> -                                      self._config["guest_pass"])
> -        self.console_wait_send(prompt, "exit\n")
> -
> -        # setup root user
> -        prompt =3D " ~]#"
> -        self.console_ssh_init(prompt, "root", self._config["root_pass"])
> -        self.console_sshd_config(prompt)
> -
> -        # setup virtio-blk #1 (tarfile)
> -        self.console_wait(prompt)
> -        self.console_send("echo 'KERNEL=3D=3D\"vdb\" MODE=3D\"666\"' >> =
%s\n" %
> -                          "/etc/udev/rules.d/99-qemu.rules")
> -
> -        self.print_step("Configuration finished, rebooting")
> -        self.console_wait_send(prompt, "reboot\n")
> -        self.console_wait("login:")
> -        self.wait_ssh()
> -
> -        self.print_step("Installing packages")
> -        self.ssh_root_check("rm -vf /etc/yum.repos.d/fedora*.repo\n")
> -        self.ssh_root_check("echo '[fedora]' >> /etc/yum.repos.d/qemu.re=
po\n")
> -        self.ssh_root_check("echo 'baseurl=3D%s' >> /etc/yum.repos.d/qem=
u.repo\n" % self.full)
> -        self.ssh_root_check("echo 'gpgcheck=3D0' >> /etc/yum.repos.d/qem=
u.repo\n")
> -        self.ssh_root_check("dnf install -y %s\n" % " ".join(self.pkgs))
> -
> -        # shutdown
> -        self.ssh_root(self.poweroff)
> -        self.console_wait("sleep state S5")
> -        self.wait()
> -
> -        if os.path.exists(img):
> -            os.remove(img)
> -        os.rename(img_tmp, img)
> -        os.remove(iso)
> -        self.print_step("All done")
> -
> -if __name__ =3D=3D "__main__":
> -    sys.exit(basevm.main(FedoraVM))


--=20
Alex Benn=C3=A9e

