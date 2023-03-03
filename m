Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 118266A9679
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 12:36:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY3hC-0002QU-Lo; Fri, 03 Mar 2023 06:35:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pY3h7-0002Pi-Hs
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:35:27 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pY3h5-0000Bs-1e
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:35:25 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso1087083wmo.0
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 03:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VGw66/Gh8DxghoJGY3XhL4GjCRjlRNFv4aP0YBcX5R0=;
 b=VWyyBxc5dNVs7iFxarR2xbWEOvf/sRBdv7tr7XWtwqTJM7v1aYRRZWJJQDdxglF0cq
 IvTDMB41KP76FteAP2+bLRBPzo0Bi+k9utRpt1yVKG6kWIK8twkIi9H2sDp/WHpL7N2f
 yyPEkl4omc9Ta/eFTaX1silmVZuuZKVREr6OwuBC2WZU4vou5OGt3DLrLgAD0fKLr9m+
 +eu3Z6NrgHUIEp3n7SvPf5tUvaG07qvB29wMnxeXI8IDSi+iBZOpFC0ENnRd/od9Jg+9
 HZZ/2Lr/VfQ2IYxmlH9atvV53Gmh4Ovj3NezDTSYFgTgF9VctXZfR5gMd6oOMnuCnkSr
 2U9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VGw66/Gh8DxghoJGY3XhL4GjCRjlRNFv4aP0YBcX5R0=;
 b=TqvuPqqCbc+IdBRPuXhO3cptNXFDTADgOweA4Kmar+47OVMlJ4my5Z50y4vLU7LP/v
 vXjxhH5fLOcLB2LFZ9JFymCsi9PCDz65S1FKaCoEJqhtT7pK2k1dFlYkVL+nHhJRLHuc
 hTZS+EUPdZHvBrfrQv16gn/NHEJrbhhRCJLYmcOrLmylDulzH79Fcm379Rf9P21bApUm
 5Y+Z/+mcNJ1vMkoSzVvWKe1uWZw4GjBj85KM/ulobAjIEDSp4+DYuYN7HS6gotnGbBn8
 q+o0XrkQymIe+TVxMxplQLRf1JTkX2PeZzz4bwhi8/MntfAo9cz1lFi0GFTXI/Ig1WN2
 f0Yg==
X-Gm-Message-State: AO0yUKUtedc+3vnQ/UKkt8swF00pZADjdU0PYi+T0h9qV8pV7gKWmUu9
 QXV4U2krEL7u2UopKK1q26ASYg==
X-Google-Smtp-Source: AK7set+9C0H0hXY4rSn0W8Az6CPKkh62mcUlnVJWopZf+nJS4+ty05k5olnDH+bkAjL9hA787vUldQ==
X-Received: by 2002:a05:600c:3153:b0:3eb:2708:86ca with SMTP id
 h19-20020a05600c315300b003eb270886camr1381365wmo.28.1677843320923; 
 Fri, 03 Mar 2023 03:35:20 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 he5-20020a05600c540500b003e2058a7109sm5648523wmb.14.2023.03.03.03.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 03:35:20 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2EF851FFB7;
 Fri,  3 Mar 2023 11:35:20 +0000 (GMT)
References: <20230302191146.1790560-1-marcin.juszkiewicz@linaro.org>
 <20230302191146.1790560-2-marcin.juszkiewicz@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Radoslaw Biernacki <rad@semihalf.com>, Peter Maydell
 <peter.maydell@linaro.org>, Leif Lindholm <quic_llindhol@quicinc.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Da?=
 =?utf-8?Q?ud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH 2/3] tests/avocado: Add set of boot tests on SBSA-ref
Date: Fri, 03 Mar 2023 11:27:16 +0000
In-reply-to: <20230302191146.1790560-2-marcin.juszkiewicz@linaro.org>
Message-ID: <87fsam9ifb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> writes:

> From: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> This change adds set of boot tests on SBSA-ref machine:
>
> 1. boot TF-A up to the EDK2 banner
> 2. boot Linux kernel/initrd up to Busybox shell
>
> Prebuilt flash volumes are included, built using upstream documentation.
> EDK2 and TF-A are updated to have SVE/SME properly enabled for 'max'
> cpu.
>
> Linux kernel/initrd are from Debian 'bookworm' installer with
> "init=3D/bin/sh" kernel argument.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  MAINTAINERS                              |   1 +
>  tests/avocado/machine_aarch64_sbsaref.py | 150 +++++++++++++++++++++++
>  2 files changed, 151 insertions(+)
>  create mode 100644 tests/avocado/machine_aarch64_sbsaref.py
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 76662969d7..df0dfd4bc3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -916,6 +916,7 @@ L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/sbsa-ref.c
>  F: docs/system/arm/sbsa.rst
> +F: tests/avocado/machine_aarch64_sbsaref.py
>=20=20
>  Sharp SL-5500 (Collie) PDA
>  M: Peter Maydell <peter.maydell@linaro.org>
> diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/mac=
hine_aarch64_sbsaref.py
> new file mode 100644
> index 0000000000..e36e53d4d5
> --- /dev/null
> +++ b/tests/avocado/machine_aarch64_sbsaref.py
> @@ -0,0 +1,150 @@
> +# Functional test that boots a Linux kernel and checks the console
> +#
> +# SPDX-FileCopyrightText: 2023 Linaro Ltd.
> +# SPDX-FileContributor: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> +# SPDX-FileContributor: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.or=
g>
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import os
> +import shutil
> +
> +from avocado.utils import archive
> +
> +from avocado_qemu import QemuSystemTest
> +from avocado_qemu import wait_for_console_pattern
> +from avocado_qemu import interrupt_interactive_console_until_pattern
> +
> +
> +class Aarch64SbsarefMachine(QemuSystemTest):
> +    """
> +    :avocado: tags=3Darch:aarch64
> +    :avocado: tags=3Dmachine:sbsa-ref
> +    """
> +
> +    def fetch_firmware(self):
> +        """
> +        Flash volumes generated using:
> +
> +        - Fedora GNU Toolchain version 12.2.1 20220819 (Red Hat Cross 12=
.2.1-2)
> +
> +        - Trusted Firmware-A
> +          https://github.com/ARM-software/arm-trusted-firmware/tree/6264=
643a
> +
> +        - Tianocore EDK II
> +          https://github.com/tianocore/edk2/tree/f6ce1a5c
> +          https://github.com/tianocore/edk2-non-osi/tree/74d4da60
> +          https://github.com/tianocore/edk2-platforms/tree/0540e1a2
> +        """
> +
> +        # Secure BootRom (TF-A code)
> +        fs0_xz_url =3D ('https://fileserver.linaro.org/s/sZay4ZCCfHSXPKj=
/'
> +                      'download/SBSA_FLASH0.fd.xz')
> +        fs0_xz_hash =3D 'e74778cbb8e1aa0b77f8883565b9a18db638f6bb'
> +        tar_xz_path =3D self.fetch_asset(fs0_xz_url, asset_hash=3Dfs0_xz=
_hash)
> +        archive.extract(tar_xz_path, self.workdir)
> +        fs0_path =3D os.path.join(self.workdir, 'SBSA_FLASH0.fd')
> +
> +        # Non-secure rom (UEFI and EFI variables)
> +        fs1_xz_url =3D ('https://fileserver.linaro.org/s/osHNaypByLa9xDK=
/'
> +                      'download/SBSA_FLASH1.fd.xz')
> +        fs1_xz_hash =3D '7d9f1a6b8964b8b99144f7e905a4083f31e31ad3'
> +        tar_xz_path =3D self.fetch_asset(fs1_xz_url, asset_hash=3Dfs1_xz=
_hash)
> +        archive.extract(tar_xz_path, self.workdir)
> +        fs1_path =3D os.path.join(self.workdir, 'SBSA_FLASH1.fd')
> +
> +        for path in [fs0_path, fs1_path]:
> +            with open(path, 'ab+') as fd:
> +                fd.truncate(256 << 20)  # Expand volumes to 256MiB
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-drive', f'if=3Dpflash,file=3D{fs0_path},forma=
t=3Draw',
> +                         '-drive', f'if=3Dpflash,file=3D{fs1_path},forma=
t=3Draw')
> +
> +    def test_sbsaref_tfa_v2_8(self):
> +        """
> +        :avocado: tags=3Dcpu:cortex-a57
> +        """
> +
> +        self.fetch_firmware()
> +        self.vm.launch()
> +
> +        # TF-A boot sequence:
> +        #
> +        # https://github.com/ARM-software/arm-trusted-firmware/blob/v2.8=
.0/\
> +        #     docs/design/trusted-board-boot.rst#trusted-board-boot-sequ=
ence
> +        # https://trustedfirmware-a.readthedocs.io/en/v2.8/\
> +        #     design/firmware-design.html#cold-boot
> +
> +        # AP Trusted ROM
> +        wait_for_console_pattern(self, 'Booting Trusted Firmware')
> +        wait_for_console_pattern(self, 'BL1: v2.8(release):v2.8')
> +        wait_for_console_pattern(self, 'BL1: Booting BL2')
> +
> +        # Trusted Boot Firmware
> +        wait_for_console_pattern(self, 'BL2: v2.8(release)')
> +        wait_for_console_pattern(self, 'Booting BL31')
> +
> +        # EL3 Runtime Software
> +        wait_for_console_pattern(self, 'BL31: v2.8(release)')
> +
> +        # Non-trusted Firmware
> +        wait_for_console_pattern(self, 'UEFI firmware (version 1.0')
> +        interrupt_interactive_console_until_pattern(self,
> +                                                    'QEMU SBSA-REF Machi=
ne')
> +
> +    def boot_linux(self, cpu=3D'cortex-a57'):
> +        """
> +        :avocado: tags=3Dcpu:cortex-a57
> +        """
> +        self.fetch_firmware()
> +
> +        os.makedirs(f'{self.workdir}/vfat/efi/boot')
> +
> +        # UEFI shell binary
> +        shell_url =3D ('https://fileserver.linaro.org/s/SGoyRrEzkmW8C8Y/'
> +                     'download/bootaa64.efi')
> +        shell_sha1 =3D '5a8791eb130406d1a659e538b1a194a604a29a78'
> +        shell_path =3D self.fetch_asset(shell_url, shell_sha1)
> +        shutil.copyfile(shell_path,
> +                        f'{self.workdir}/vfat/efi/boot/bootaa64.efi')
> +
> +        # Debian 'bookworm' d-i kernel from 8th Feb 2023
> +        linux_url =3D ('https://fileserver.linaro.org/s/L8JMwEZQK8SDR39/'
> +                     'download/linux')
> +        linux_sha1 =3D '39a75284783ab63626642228fbac1863492d30b5'
> +        linux_path =3D self.fetch_asset(linux_url, linux_sha1)
> +        shutil.copyfile(linux_path, f'{self.workdir}/vfat/linux')
> +
> +        # Debian 'bookworm' d-i initrd.gz from 8th Feb 2023
> +        initrd_url =3D ('https://fileserver.linaro.org/s/NmYTxezZNKGF5P4=
/'
> +                      'download/initrd.gz')
> +        initrd_sha1 =3D '1404d0129cbd0bff7aaa589ddbea3cdb7c0d4c1d'
> +        initrd_path =3D self.fetch_asset(initrd_url, initrd_sha1)
> +        shutil.copyfile(initrd_path, f'{self.workdir}/vfat/initrd.gz')
> +
> +        with open(f'{self.workdir}/vfat/startup.nsh', 'w') as script:
> +            script.write('fs0:\\linux initrd=3D\\initrd.gz init=3D/bin/s=
h')
> +
> +        self.vm.add_args('-cpu', cpu,
> +                         '-drive',
> +                         f'file=3Dfat:rw:{self.workdir}/vfat/,format=3Dr=
aw')
> +        self.vm.launch()
> +
> +        # Exit UEFI
> +        wait_for_console_pattern(self, 'EFI stub: Exiting boot services.=
..')
> +
> +        # init=3D/bin/sh started
> +        wait_for_console_pattern(self, 'BusyBox v1.35.0 (Debian')
> +
> +    def test_sbsaref_linux_a57(self):
> +        """
> +        :avocado: tags=3Dcpu:cortex-a57
> +        """
> +        self.boot_linux('cortex-a57')
> +
> +    def test_sbsaref_linux_max(self):
> +        """
> +        :avocado: tags=3Dcpu:max
> +        """
> +        self.boot_linux('max')

You probably want to encode the pauth-impef here so we don't spend all
our time on the cryptography. e.g.

     self.boot_linux('max,pauth-impdef=3Don')

but even with that it seems to be timing out for me:

  2023-03-03 11:32:30,573 __init__         L0153 DEBUG| NOTICE:  BL1: Booti=
ng BL31
  2023-03-03 11:32:30,578 __init__         L0153 DEBUG| NOTICE:  BL31: v2.8=
(release):v2.8-335-g6264643a0
  2023-03-03 11:32:30,578 __init__         L0153 DEBUG| NOTICE:  BL31: Buil=
t : 17:51:50, Feb  8 2023
  2023-03-03 11:32:30,583 __init__         L0153 DEBUG| UEFI firmware (vers=
ion 1.0 built at 16:17:37 on Feb  9 2023)
  2023-03-03 11:32:34,698 __init__         L0153 DEBUG| ESC[2JESC[04DESC[=
=3D3hESC[2JESC[09DESC[2JESC[04DUEFI Interactive Shell v2.2
  2023-03-03 11:32:34,699 __init__         L0153 DEBUG| EDK II
  2023-03-03 11:32:34,702 __init__         L0153 DEBUG| UEFI v2.70 (EFI Dev=
elopment Kit II / SbsaQemu, 0x00010000)
  2023-03-03 11:32:34,708 __init__         L0153 DEBUG| ESC[1mESC[33mESC[40=
mMapping tableESC[0mESC[37mESC[40m
  2023-03-03 11:32:34,716 __init__         L0153 DEBUG| ESC[1mESC[33mESC[40=
m      FS0:ESC[0mESC[37mESC[40m ESC[1mESC[37mESC[40mAlias(s):ESC[0mESC[37mE=
SC[40mHD0a65535a1:;BLK1:
  2023-03-03 11:32:34,716 __init__         L0153 DEBUG| VenHw(0D51905B-B77E=
-452A-A2C0-ECA0CC8D514A,000010600000000000)/Sata(0x
  2023-03-03 11:32:34,716 __init__         L0153 DEBUG| 0,0xFFFF,0x0)/HD(1,=
MBR,0xBE1AFDFA,0x3F,0xFBFC1)
  2023-03-03 11:32:34,722 __init__         L0153 DEBUG| ESC[1mESC[33mESC[40=
m     BLK0:ESC[0mESC[37mESC[40m ESC[1mESC[37mESC[40mAlias(s):ESC[0mESC[37mE=
SC[40m
  2023-03-03 11:32:34,722 __init__         L0153 DEBUG| VenHw(0D51905B-B77E=
-452A-A2C0-ECA0CC8D514A,000010600000000000)/Sata(0x
  2023-03-03 11:32:34,722 __init__         L0153 DEBUG| 0,0xFFFF,0x0)
  2023-03-03 11:32:39,749 __init__         L0153 DEBUG| Press ESC[1mESC[37m=
ESC[40mESCESC[0mESC[37mESC[40m in 5 seconds to skip ESC[1mESC[33mESC[40msta=
rtup.nshESC[0mESC[37mESC[40m or any other key to continue.ESC[72DPress ESC[=
1mESC[37mESC[40mESCESC[0mESC[37mESC[40m in 4 seconds to skip ESC[1mESC[33mE=
SC[40mstartup.nshESC[0mESC[37mESC[40m or any other key to continue.ESC[72DP=
ress ESC[1mESC[37mESC[40mESCESC[0mESC[37mESC[40m in 3 seconds to skip ESC[1=
mESC[33mESC[40mstartup.nshESC[0mESC[37mESC[40m or any other key to continue=
.ESC[72DPress ESC[1mESC[37mESC[40mESCESC[0mESC[37mESC[40m in 2 seconds to s=
kip ESC[1mESC[33mESC[40mstartup.nshESC[0mESC[37mESC[40m or any other key to=
 continue.ESC[72DPress ESC[1mESC[37mESC[40mESCESC[0mESC[37mESC[40m in 1 sec=
onds to skip ESC[1mESC[33mESC[40mstartup.nshESC[0mESC[37mESC[40m or any oth=
er key to continue.
  2023-03-03 11:32:39,766 __init__         L0153 DEBUG| ESC[1mESC[33mESC[40=
mShell> ESC[0mESC[37mESC[40mfs0:\linux initrd=3D\initrd.gz init=3D/bin/sh
  2023-03-03 11:32:40,432 __init__         L0153 DEBUG| EFI stub: Booting L=
inux Kernel...
  2023-03-03 11:32:40,434 __init__         L0153 DEBUG| EFI stub: EFI_RNG_P=
ROTOCOL unavailable
  2023-03-03 11:32:41,051 __init__         L0153 DEBUG| EFI stub: Loaded in=
itrd from command line option
  2023-03-03 11:32:41,053 __init__         L0153 DEBUG| EFI stub: Generatin=
g empty DTB
  2023-03-03 11:32:41,054 __init__         L0153 DEBUG| EFI stub: Exiting b=
oot services...
  2023-03-03 11:34:27,869 stacktrace       L0039 ERROR|=20
  2023-03-03 11:34:27,870 stacktrace       L0041 ERROR| Reproduced tracebac=
k from: /home/alex/lsrc/qemu.git/builds/arm.all/tests/venv/lib/python3.9/si=
te-packages/avocado/core/test.py:770
  2023-03-03 11:34:27,871 stacktrace       L0045 ERROR| Traceback (most rec=
ent call last):
  2023-03-03 11:34:27,871 stacktrace       L0045 ERROR|   File "/home/alex/=
lsrc/qemu.git/builds/arm.all/tests/avocado/machine_aarch64_sbsaref.py", lin=
e 150, in test_sbsaref_linux_max
  2023-03-03 11:34:27,871 stacktrace       L0045 ERROR|     self.boot_linux=
('max,pauth-impdef=3Don')

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

