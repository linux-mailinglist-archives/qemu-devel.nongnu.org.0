Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A784CD48
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 13:56:42 +0200 (CEST)
Received: from localhost ([::1]:46632 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdvgH-0006EW-UH
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 07:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55169)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hdvYc-00084S-3Y
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 07:48:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hdvSF-0007zT-62
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 07:42:13 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:54153)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hduox-0007yx-QC
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 07:01:36 -0400
Received: by mail-wm1-x344.google.com with SMTP id x15so2607374wmj.3
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 04:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=23lOllzwVO9Te1xqUOmkdCLzUMMqU9E3cn6knh+gdiw=;
 b=cgXylL2XQxVzUFY2LVUGLbX5dWUwAgAk5XUVJN0j6YEoz9W60GcAM6u9hoZuUASLC5
 URE4bmvw7lf0oIFK3KeWcgYWUhgaAO/VX52DeNSXwn3FQS2cxrW5re+p6PBTb6uDCJBH
 tfWsHEHZzDoDOnU1qkrqVJOAK7jf96vv4X+hD82ZWQoR4KS/qfMADB3ywCyocEJDo/My
 sgG3lL2bQHBEBJeZFVWe66djNVsin296H88je+tyOWIxNwHAcBo5WW5W2QC/shNsQJPx
 Aw89EQ/DtqG76yMU/n4dnA6+oSca7gJhpiQEjKGaFAH48YT2xwO048CAW/7UCNRAvE3d
 4GEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=23lOllzwVO9Te1xqUOmkdCLzUMMqU9E3cn6knh+gdiw=;
 b=icbrdRovR8/bszPaaLxmHSfWRpYwFFmyoP3FzHBgzddyOO0Bwdu8CAuAoFO5xR2TB6
 IWuJiFMByMIKfYvBEKeZw3bW+BgDFeHfa9hTrFpcVI7sPcFphs1NnMcaPfATQTdPVfP6
 7ZU6hKimdy5iQ4WIeC7z6QbXNHUOBTLc52FTmJO/mIPibPc9i/5t9TbeZbv666SjmWbc
 F2QYO6g01LsV8wwRUszdmmUe1OkefcAhrqkX17Y2zibfoBncLE649v29Mgm8Nmf6MbgI
 AyrQL+mQA/LgY8UP/5McPOZ0hk9XZRURcZ8C2DCH28tHTlpPZDq8saxv3mnQQ+OIPrGf
 Rzsw==
X-Gm-Message-State: APjAAAXhAMaJgHr3I5kNCHk5FDKswLD6wQ17TZYmJ5h2M7VVubiDqFzy
 0hD2uuSdAHUc8oGpXXUvLGYhzg==
X-Google-Smtp-Source: APXvYqy3No+Q9p5Jr/P6Z6em+L/oHum4oYex6Y8H4LOxM2s8bqPQkfXxTl6eYGur0e9bsNeHzlrT+Q==
X-Received: by 2002:a05:600c:c4:: with SMTP id u4mr2469784wmm.96.1561028493603; 
 Thu, 20 Jun 2019 04:01:33 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id s10sm19443686wrt.49.2019.06.20.04.01.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 04:01:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7266F1FF87;
 Thu, 20 Jun 2019 12:01:32 +0100 (BST)
References: <20190619194021.8240-1-alex.bennee@linaro.org>
 <20190619194021.8240-13-alex.bennee@linaro.org>
 <d9b49b4d-424b-1ad1-511e-fc5ad7cdafe6@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
In-reply-to: <d9b49b4d-424b-1ad1-511e-fc5ad7cdafe6@redhat.com>
Date: Thu, 20 Jun 2019 12:01:32 +0100
Message-ID: <87v9x08qr7.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-devel] [PATCH v1 12/17] tests/vm: freebsd autoinstall,
 using serial console
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 6/19/19 9:40 PM, Alex Benn=C3=A9e wrote:
>> From: Gerd Hoffmann <kraxel@redhat.com>
>>
>> Instead of fetching the prebuilt image from patchew download the install
>> iso and prepare the image locally.  Install to disk, using the serial
>> console.  Create qemu user, configure ssh login.  Install packages
>> needed for qemu builds.
>>
>> Note that freebsd package downloads are delivered as non-cachable
>> content, so I had to configure squid with "ignore-no-store
>> ignore-private ignore-reload" for pkgmir.geo.freebsd.org to make the
>> caching actually work.
>>
>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> Tested-by: Thomas Huth <thuth@redhat.com>
>> Message-Id: <20190617043858.8290-9-kraxel@redhat.com>
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

So I do have a check for this in my PR scripts. I guess I should
replicate it in my patch series workflow.

>
>> ---
>>  tests/vm/freebsd | 182 ++++++++++++++++++++++++++++++++++++++++++++---
>>  1 file changed, 172 insertions(+), 10 deletions(-)
>>
>> diff --git a/tests/vm/freebsd b/tests/vm/freebsd
>> index 091be1a065..2a19461a90 100755
>> --- a/tests/vm/freebsd
>> +++ b/tests/vm/freebsd
>> @@ -2,41 +2,203 @@
>>  #
>>  # FreeBSD VM image
>>  #
>> -# Copyright 2017 Red Hat Inc.
>> +# Copyright 2017-2019 Red Hat Inc.
>>  #
>>  # Authors:
>>  #  Fam Zheng <famz@redhat.com>
>> +#  Gerd Hoffmann <kraxel@redhat.com>
>>  #
>>  # This code is licensed under the GPL version 2 or later.  See
>>  # the COPYING file in the top-level directory.
>>  #
>>
>>  import os
>> +import re
>>  import sys
>> +import time
>> +import socket
>>  import subprocess
>>  import basevm
>>
>>  class FreeBSDVM(basevm.BaseVM):
>>      name =3D "freebsd"
>>      arch =3D "x86_64"
>> +
>> +    link =3D "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.0=
/FreeBSD-12.0-RELEASE-amd64-disc1.iso.xz"
>> +    csum =3D "1d40015bea89d05b8bd13e2ed80c40b522a9ec1abd8e7c8b80954fb48=
5fb99db"
>> +    size =3D "20G"
>> +    pkgs =3D [
>> +        # build tools
>> +        "git",
>> +        "pkgconf",
>> +        "bzip2",
>> +
>> +        # gnu tools
>> +        "bash",
>> +        "gmake",
>> +        "gsed",
>> +        "flex", "bison",
>> +
>> +        # libs: crypto
>> +        "gnutls",
>> +
>> +        # libs: images
>> +        "jpeg-turbo",
>> +        "png",
>> +
>> +        # libs: ui
>> +        "sdl2",
>> +        "gtk3",
>> +        "libxkbcommon",
>> +
>> +        # libs: opengl
>> +        "libepoxy",
>> +        "mesa-libs",
>> +    ]
>> +
>>      BUILD_SCRIPT =3D """
>>          set -e;
>> -        rm -rf /var/tmp/qemu-test.*
>> -        cd $(mktemp -d /var/tmp/qemu-test.XXXXXX);
>> +        rm -rf /home/qemu/qemu-test.*
>> +        cd $(mktemp -d /home/qemu/qemu-test.XXXXXX);
>> +        mkdir src build; cd src;
>>          tar -xf /dev/vtbd1;
>> -        ./configure {configure_opts};
>> +        cd ../build
>> +        ../src/configure --python=3Dpython3.6 {configure_opts};
>>          gmake --output-sync -j{jobs} {target} {verbose};
>>      """
>>
>> +    def console_boot_serial(self):
>> +        self.console_wait_send("Autoboot", "3")
>> +        self.console_wait_send("OK", "set console=3Dcomconsole\n")
>> +        self.console_wait_send("OK", "boot\n")
>> +
>>      def build_image(self, img):
>> -        cimg =3D self._download_with_cache("http://download.patchew.org=
/freebsd-11.1-amd64.img.xz",
>> -                sha256sum=3D'adcb771549b37bc63826c501f05121a206ed3d9f55=
f49145908f7e1432d65891')
>> -        img_tmp_xz =3D img + ".tmp.xz"
>> +        self.print_step("Downloading install iso")
>> +        cimg =3D self._download_with_cache(self.link, sha256sum=3Dself.=
csum)
>>          img_tmp =3D img + ".tmp"
>> -        sys.stderr.write("Extracting the image...\n")
>> -        subprocess.check_call(["ln", "-f", cimg, img_tmp_xz])
>> -        subprocess.check_call(["xz", "--keep", "-dvf", img_tmp_xz])
>> +        iso =3D img + ".install.iso"
>> +        iso_xz =3D iso + ".xz"
>> +
>> +        self.print_step("Preparing iso and disk image")
>> +        subprocess.check_call(["cp", "-f", cimg, iso_xz])
>> +        subprocess.check_call(["xz", "-dvf", iso_xz])
>> +        subprocess.check_call(["qemu-img", "create", "-f", "qcow2",
>> +                               img_tmp, self.size])
>> +
>> +        self.print_step("Booting installer")
>> +        self.boot(img_tmp, extra_args =3D [
>> +            "-bios", "pc-bios/bios-256k.bin",
>> +            "-machine", "graphics=3Doff",
>> +            "-cdrom", iso
>> +        ])
>> +        self.console_init()
>> +        self.console_boot_serial()
>> +        self.console_wait_send("Console type",          "xterm\n")
>> +
>> +        # pre-install configuration
>> +        self.console_wait_send("Welcome",               "\n")
>> +        self.console_wait_send("Keymap Selection",      "\n")
>> +        self.console_wait_send("Set Hostname",          "freebsd\n")
>> +        self.console_wait_send("Distribution Select",   "\n")
>> +        self.console_wait_send("Partitioning",          "\n")
>> +        self.console_wait_send("Partition",             "\n")
>> +        self.console_wait_send("Scheme",                "\n")
>> +        self.console_wait_send("Editor",                "f")
>> +        self.console_wait_send("Confirmation",          "c")
>> +
>> +        self.print_step("Installation started now, this will take a whi=
le")
>> +
>> +        # post-install configuration
>> +        self.console_wait("New Password:")
>> +        self.console_send("%s\n" % self.ROOT_PASS)
>> +        self.console_wait("Retype New Password:")
>> +        self.console_send("%s\n" % self.ROOT_PASS)
>> +
>> +        self.console_wait_send("Network Configuration", "\n")
>> +        self.console_wait_send("IPv4",                  "y")
>> +        self.console_wait_send("DHCP",                  "y")
>> +        self.console_wait_send("IPv6",                  "n")
>> +        self.console_wait_send("Resolver",              "\n")
>> +
>> +        self.console_wait_send("Time Zone Selector",    "a\n")
>> +        self.console_wait_send("Confirmation",          "y")
>> +        self.console_wait_send("Time & Date",           "\n")
>> +        self.console_wait_send("Time & Date",           "\n")
>> +
>> +        self.console_wait_send("System Configuration",  "\n")
>> +        self.console_wait_send("System Hardening",      "\n")
>> +
>> +        # qemu user
>> +        self.console_wait_send("Add User Accounts", "y")
>> +        self.console_wait("Username")
>> +        self.console_send("%s\n" % self.GUEST_USER)
>> +        self.console_wait("Full name")
>> +        self.console_send("%s\n" % self.GUEST_USER)
>> +        self.console_wait_send("Uid",                   "\n")
>> +        self.console_wait_send("Login group",           "\n")
>> +        self.console_wait_send("Login group",           "\n")
>> +        self.console_wait_send("Login class",           "\n")
>> +        self.console_wait_send("Shell",                 "\n")
>> +        self.console_wait_send("Home directory",        "\n")
>> +        self.console_wait_send("Home directory perm",   "\n")
>> +        self.console_wait_send("Use password",          "\n")
>> +        self.console_wait_send("Use an empty password", "\n")
>> +        self.console_wait_send("Use a random password", "\n")
>> +        self.console_wait("Enter password:")
>> +        self.console_send("%s\n" % self.GUEST_PASS)
>> +        self.console_wait("Enter password again:")
>> +        self.console_send("%s\n" % self.GUEST_PASS)
>> +        self.console_wait_send("Lock out",              "\n")
>> +        self.console_wait_send("OK",                    "yes\n")
>> +        self.console_wait_send("Add another user",      "no\n")
>> +
>> +        self.console_wait_send("Final Configuration",   "\n")
>> +        self.console_wait_send("Manual Configuration",  "\n")
>> +        self.console_wait_send("Complete",              "\n")
>> +
>> +        self.print_step("Installation finished, rebooting")
>> +        self.console_boot_serial()
>> +
>> +        # setup qemu user
>> +        prompt =3D "$"
>> +        self.console_ssh_init(prompt, self.GUEST_USER, self.GUEST_PASS)
>> +        self.console_wait_send(prompt, "exit\n")
>> +
>> +        # setup root user
>> +        prompt =3D "root@freebsd:~ #"
>> +        self.console_ssh_init(prompt, "root", self.ROOT_PASS)
>> +        self.console_sshd_config(prompt)
>> +
>> +        # setup serial console
>> +        self.console_wait(prompt)
>> +        self.console_send("echo 'console=3Dcomconsole' >> /boot/loader.=
conf\n")
>> +
>> +        # setup boot delay
>> +        self.console_wait(prompt)
>> +        self.console_send("echo 'autoboot_delay=3D1' >> /boot/loader.co=
nf\n")
>> +
>> +        # setup virtio-blk #1 (tarfile)
>> +        self.console_wait(prompt)
>> +        self.console_send("echo 'chmod 666 /dev/vtbd1' >> /etc/rc.local=
\n")
>> +
>> +        self.print_step("Configuration finished, rebooting")
>> +        self.console_wait_send(prompt, "reboot\n")
>> +        self.console_wait("login:")
>> +        self.wait_ssh()
>> +
>> +        self.print_step("Installing packages")
>> +        self.ssh_root_check("pkg install -y %s\n" % " ".join(self.pkgs))
>> +
>> +        # shutdown
>> +        self.ssh_root(self.poweroff)
>> +        self.console_wait("Uptime:")
>> +        self.wait()
>> +
>> +        if os.path.exists(img):
>> +            os.remove(img)
>>          os.rename(img_tmp, img)
>> +        os.remove(iso)
>> +        self.print_step("All done")
>>
>>  if __name__ =3D=3D "__main__":
>>      sys.exit(basevm.main(FreeBSDVM))
>>


--
Alex Benn=C3=A9e

