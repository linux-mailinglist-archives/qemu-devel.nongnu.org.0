Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF576DDD2C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 16:03:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmEZP-0002t0-S3; Tue, 11 Apr 2023 10:02:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmEZI-0002sC-0i
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:01:58 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmEZF-0005bu-Fc
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:01:55 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 eo6-20020a05600c82c600b003ee5157346cso6094848wmb.1
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 07:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681221711; x=1683813711;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u3L4JED/pvroa1KhnhNDyWD6Drfp4kM1Mgt7AB16pmU=;
 b=M9cXu3+eP8PMCdupg+ZZyb5yv+B08Lf1sFc6mvJQEmuWoSKdtil1T0wuEufKdgGq4U
 ZDqe3mI0zdTql2+tAniQFkoL8qLoxvQzsGL1DAdvZXZvq40YmLAV23LEm5LRKlsYhoHp
 9u+kgxGsFEqMG1pX/jaDI50SG6Kj2x6Ft6IYSE1d9VBzw8liSCgGgfSM9GokLm147je+
 fRp+aCxBg4HKr3E5Q6TFAOeSQaKxuBQ0khDCME1cUA9LZy7WDWcJeQyxlB1bAmJ+ggQZ
 gkBYPiNdoFoq47PX1NMAgEJIzUb7gX64be5v9CdhOS69OSYC1j7QOdpUICUtPzi1DjGv
 OSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681221711; x=1683813711;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=u3L4JED/pvroa1KhnhNDyWD6Drfp4kM1Mgt7AB16pmU=;
 b=PQmAXR53/8ue76vbUleZAhSwqWZHktqQFwaE6O1Iie+U80tlVO0oFhBiq1nwdo+Ej3
 fx8NysqFZfEUCdon6XdUvQOkhebkCQf/sIgKC/PZdYyC2qy1e+bnqSjh7Z6e1Nwc5Oxn
 Bwi+5lJoI5bWGY0NiaKwxlrEdoz3H7RElJiE3k0Yz38bPCfMjoQOl40MIBPXw4ixmbCk
 nlsMyEdCuYhILDfpSd5aj2Z/SoCla0/5kBBvV7cvpvvr6EAzODtSu35nYX+sDYABrKT4
 TPJ4nlln8zaG4GsI5AvRjgU53d68HaON5ZR660FmrP9BAQixx+1I+1nKSbx/frcHMjlS
 BIEQ==
X-Gm-Message-State: AAQBX9c/xijzgo5VKa0X413WPX1TegT6IIJA9iY1vwtFsThl1yQPwJ9X
 kbcUbBpdtFO4WhjeJK1EgtolMg==
X-Google-Smtp-Source: AKy350Y5lT2B9hOFiCIZRZ0/GCdJFxr8xKsJvcJjoTCjktSRSvjkaymVsK9SoFIwOhr96Pm8qhCpvg==
X-Received: by 2002:a05:600c:3787:b0:3ed:29d9:56ae with SMTP id
 o7-20020a05600c378700b003ed29d956aemr9616584wmr.6.1681221711091; 
 Tue, 11 Apr 2023 07:01:51 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a1cf70f000000b003ef5db16176sm17184465wmh.32.2023.04.11.07.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 07:01:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5109D1FFB7;
 Tue, 11 Apr 2023 15:01:50 +0100 (BST)
References: <20230328171426.14258-1-philmd@linaro.org>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Radoslaw
 Biernacki <rad@semihalf.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, qemu-arm@nongnu.org, Leif Lindholm
 <quic_llindhol@quicinc.com>, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>
Subject: Re: [PATCH v3] tests/avocado: Add set of boot tests on SBSA-ref
Date: Tue, 11 Apr 2023 14:51:30 +0100
In-reply-to: <20230328171426.14258-1-philmd@linaro.org>
Message-ID: <87jzyiplf5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> This change adds set of boot tests on SBSA-ref machine:
>
> 1. boot firmware up to the EDK2 banner
> 2. boot Alpine Linux
>
> Prebuilt flash volumes are included, built using upstream documentation.
>
> To unify tests for AArch64/virt and AArch64/sbsa-ref we boot
> the same Alpine Linux image on both.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Message-Id: <20230323082813.971535-1-marcin.juszkiewicz@linaro.org>
> ---
> Since v2:
> - Use Alpine sha256
> - Use @skip* decorators
> - Run black indenter
>
> $ AVOCADO_TIMEOUT_EXPECTED=3D1 avocado --show=3Dapp run -t machine:sbsa-r=
ef tests/avocado/machine_aarch64_sbsaref.py
> JOB ID     : b6682352323bc601f49a2b247cfe388b4b09047f
> JOB LOG    : /home/philippe.mathieu-daude/avocado/job-results/job-2023-03=
-28T15.29-b668235/job.log
>  (1/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.tes=
t_sbsaref_edk2_firmware: PASS (5.85 s)
>  (2/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.tes=
t_sbsaref_alpine_linux_cortex_a57: PASS (118.45 s)
>  (3/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.tes=
t_sbsaref_alpine_linux_neoverse_n1: PASS (119.22 s)
>  (4/4)
> tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsar=
ef_alpine_linux_max:
> SKIP: requires TF-A update to handle FEAT_FGT
> RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 1 | WARN 0 | INTERRUPT 0 | =
CANCEL 0
> JOB TIME   : 244.32 s
> ---
>  MAINTAINERS                              |   1 +
>  tests/avocado/machine_aarch64_sbsaref.py | 158 +++++++++++++++++++++++
>  2 files changed, 159 insertions(+)
>  create mode 100644 tests/avocado/machine_aarch64_sbsaref.py
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ef45b5e71e..ee4bd28205 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -928,6 +928,7 @@ L: qemu-arm@nongnu.org
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
> index 0000000000..0a79fa7ab6
> --- /dev/null
> +++ b/tests/avocado/machine_aarch64_sbsaref.py
> @@ -0,0 +1,158 @@
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
> +
> +from avocado import skip
> +from avocado import skipUnless
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

Maybe:

  # Full boot ~35-45s, setting 180 to account for debug builds
=20=20
> +    timeout =3D 180
> +
> +    def fetch_firmware(self):
> +        """
> +        Flash volumes generated using:
> +
> +        - Fedora GNU Toolchain version 12.2.1 20220819 (Red Hat Cross 12=
.2.1-2)
> +
> +        - Trusted Firmware-A
> +          https://github.com/ARM-software/arm-trusted-firmware/tree/5fdb=
2e54
> +
> +        - Tianocore EDK II
> +          https://github.com/tianocore/edk2/tree/494127613b
> +          https://github.com/tianocore/edk2-non-osi/tree/41876073
> +          https://github.com/tianocore/edk2-platforms/tree/8efa4f42
> +        """
> +
> +        # Secure BootRom (TF-A code)
> +        fs0_xz_url =3D (
> +            "https://fileserver.linaro.org/s/ATnSmq6k8SoXgbH/"
> +            "download/SBSA_FLASH0.fd.xz"
> +        )
> +        fs0_xz_hash =3D "a210a09692bcbe0a3743ffd0df44e80e0c7ad8ab"
> +        tar_xz_path =3D self.fetch_asset(fs0_xz_url, asset_hash=3Dfs0_xz=
_hash)
> +        archive.extract(tar_xz_path, self.workdir)
> +        fs0_path =3D os.path.join(self.workdir, "SBSA_FLASH0.fd")
> +
> +        # Non-secure rom (UEFI and EFI variables)
> +        fs1_xz_url =3D (
> +            "https://fileserver.linaro.org/s/t8foNnMPz74DZZy/"
> +            "download/SBSA_FLASH1.fd.xz"
> +        )
> +        fs1_xz_hash =3D "13a9a262953787c7fc5a9155dfaa26e703631e02"
> +        tar_xz_path =3D self.fetch_asset(fs1_xz_url, asset_hash=3Dfs1_xz=
_hash)
> +        archive.extract(tar_xz_path, self.workdir)
> +        fs1_path =3D os.path.join(self.workdir, "SBSA_FLASH1.fd")

FYI if you share the directory rather than the individual files you can
use something like this (from kvm_xen_guest):

   def get_asset(self, name, sha1):
        base_url =3D ('https://fileserver.linaro.org/s/'
                    'kE4nCFLdQcoBF9t/download?'
                    'path=3D%2Fkvm-xen-guest&files=3D' )
        url =3D base_url + name
        # use explicit name rather than failing to neatly parse the
        # URL into a unique one
        return self.fetch_asset(name=3Dname, locations=3D(url), asset_hash=
=3Dsha1)

which more usefully means a link like:

  https://fileserver.linaro.org/s/kE4nCFLdQcoBF9t?path=3D%2Fkvm-xen-guest

Can point to the README.md describing how the images where generated.

> +
> +        for path in [fs0_path, fs1_path]:
> +            with open(path, "ab+") as fd:
> +                fd.truncate(256 << 20)  # Expand volumes to 256MiB
> +
> +        self.vm.set_console()
> +        self.vm.add_args(
> +            "-drive",
> +            f"if=3Dpflash,file=3D{fs0_path},format=3Draw",
> +            "-drive",
> +            f"if=3Dpflash,file=3D{fs1_path},format=3Draw",
> +            "-smp",
> +            "1",
> +            "-machine",
> +            "sbsa-ref",
> +        )
> +
> +    def test_sbsaref_edk2_firmware(self):
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
> +        wait_for_console_pattern(self, "Booting Trusted Firmware")
> +        wait_for_console_pattern(self, "BL1: v2.8(release):v2.8")
> +        wait_for_console_pattern(self, "BL1: Booting BL2")
> +
> +        # Trusted Boot Firmware
> +        wait_for_console_pattern(self, "BL2: v2.8(release)")
> +        wait_for_console_pattern(self, "Booting BL31")
> +
> +        # EL3 Runtime Software
> +        wait_for_console_pattern(self, "BL31: v2.8(release)")
> +
> +        # Non-trusted Firmware
> +        wait_for_console_pattern(self, "UEFI firmware (version 1.0")
> +        interrupt_interactive_console_until_pattern(self, "QEMU SBSA-REF=
 Machine")
> +
> +    # This tests the whole boot chain from EFI to Userspace
> +    # We only boot a whole OS for the current top level CPU and GIC
> +    # Other test profiles should use more minimal boots
> +    def boot_alpine_linux(self, cpu):
> +        self.fetch_firmware()
> +
> +        iso_url =3D (
> +            "https://dl-cdn.alpinelinux.org/"
> +            "alpine/v3.17/releases/aarch64/alpine-standard-3.17.2-aarch6=
4.iso"
> +        )
> +
> +        iso_hash =3D "5a36304ecf039292082d92b48152a9ec21009d3a62f459de62=
3e19c4bd9dc027"
> +        iso_path =3D self.fetch_asset(iso_url, algorithm=3D"sha256", ass=
et_hash=3Diso_hash)
> +
> +        self.vm.set_console()
> +        self.vm.add_args(
> +            "-cpu",
> +            cpu,
> +            "-drive",
> +            f"file=3D{iso_path},format=3Draw",
> +            "-device",
> +            "virtio-rng-pci,rng=3Drng0",
> +            "-object",
> +            "rng-random,id=3Drng0,filename=3D/dev/urandom",
> +        )
> +
> +        self.vm.launch()
> +        wait_for_console_pattern(self, "Welcome to Alpine Linux 3.17")
> +
> +    @skipUnless(os.getenv("AVOCADO_TIMEOUT_EXPECTED"), "Test might
>  timeout")

Are these really valid? It runs fine in <60s with emulation.

> +    def test_sbsaref_alpine_linux_cortex_a57(self):
> +        """
> +        :avocado: tags=3Dcpu:cortex-a57
> +        """
> +        self.boot_alpine_linux("cortex-a57")
> +
> +    @skipUnless(os.getenv("AVOCADO_TIMEOUT_EXPECTED"), "Test might timeo=
ut")
> +    def test_sbsaref_alpine_linux_neoverse_n1(self):
> +        """
> +        :avocado: tags=3Dcpu:max
> +        """
> +        self.boot_alpine_linux("neoverse-n1")
> +

You could just as easily leave this out until the FGT TFA was available.

> +    @skip("requires TF-A update to handle FEAT_FGT")
> +    def test_sbsaref_alpine_linux_max(self):
> +        """
> +        :avocado: tags=3Dcpu:max
> +        """
> +        self.boot_alpine_linux("max,pauth-impdef=3Don")


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

