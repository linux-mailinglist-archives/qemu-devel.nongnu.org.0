Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BD96C630C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 10:14:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfH0w-0001Gt-4N; Thu, 23 Mar 2023 05:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pfH0t-0001Gb-Ho
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 05:13:39 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pfH0m-0002e6-2g
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 05:13:38 -0400
Received: by mail-wr1-x430.google.com with SMTP id r11so2856563wrr.12
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 02:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679562807;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zAWY7bY8s3rC7jKk5n3bM8URkku/MVFMmg9hOmNJ4qg=;
 b=t0HwWmnZmlYe5ZKRzIZy3lmuhq4FacmXIB7a/eWbhd4RqGZ5CX14FDBvrgDuMbVVh6
 ZWJz+C2zxakNrKgfhyMv0S1q9JO2flBq3l03vXjaLerDxUAi5LLfANKbUXuceIOY7NEJ
 lzJH5lTtVhwv5+LjAuInFHeopQPuYhf+TZM7BV8pJqOBh0bSzEWF/Gbr8rVyFLVsS4eI
 j1vJzgCdpUDqXS4efmanNjSWHI38+AxJPaJiEkpGTgzlBafBYF6qEkbrN62HQFJSYVef
 FUoMOf7f8EyypZ2nohEdppUQkupOpecaRYw76T/9I74jMlAr74oj6cfC0vbKn7sgBrTG
 Rs6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679562807;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zAWY7bY8s3rC7jKk5n3bM8URkku/MVFMmg9hOmNJ4qg=;
 b=1mpBadk2StIgMpvTPqJefLLSkozRs8vHPF4HYfL3fj+OJyy6fNLN2fzeMUjJ1mahYi
 1HOFpMbhtvoitBndn09qNPQPdlAXZf8YStV3v66PVY6rjELAJ477MMO1rhoufssWGn2l
 h1BcG43MWRIUhVx0ThnUvGjhJ+O3awp6sOmbNzNkErQ5FPUtCbl6jo1Ru1SoiuqlEMNn
 I+nzxqe7g/C5xvdJhj0WVcwvushvZtmTUEJOuPklekRzJy9Dfa8/6rLDEXPveIF3kGTT
 dgOHe+oEUpqL0wq7vN9CRhW+YBnMPaFXHp3B5IVmg4SDH9xFC1vTOUDKHLo8WntkK+2i
 +84w==
X-Gm-Message-State: AAQBX9fWCvk0is8Vk3gc7N6CGqdujfYVQO/X/Jb6RkyRrYgh4yuBCM1+
 NjuqtIWK5QdgWN8G50ai1pL3RQ==
X-Google-Smtp-Source: AKy350abZiVZYIt9dNWHy7J2JzBYuLuIFc+tT2jFdf6J/MWpO31X/s/cRT4YhcpLj3gMJDjcUGTenw==
X-Received: by 2002:a5d:5051:0:b0:2ce:9f0d:df51 with SMTP id
 h17-20020a5d5051000000b002ce9f0ddf51mr2025480wrt.69.1679562807422; 
 Thu, 23 Mar 2023 02:13:27 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 g20-20020a05600c4ed400b003edc4788fa0sm1352915wmq.2.2023.03.23.02.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 02:13:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BB62A1FFB7;
 Thu, 23 Mar 2023 09:13:26 +0000 (GMT)
References: <20230322145529.4079753-1-alex.bennee@linaro.org>
 <a289194c-9187-a152-c3cc-12244e05603f@daynix.com>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH v2] tests/avocado: re-factor igb test to avoid timeouts
Date: Thu, 23 Mar 2023 09:11:33 +0000
In-reply-to: <a289194c-9187-a152-c3cc-12244e05603f@daynix.com>
Message-ID: <87ttyb4yq1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On 2023/03/22 23:55, Alex Benn=C3=A9e wrote:
>> The core of the test was utilising "ethtool -t eth1 offline" to run
>> through a test sequence. For reasons unknown the test hangs under some
>> configurations of the build on centos8-stream. Fundamentally running
>> the old fedora-31 cloud-init is just too much for something that is
>> directed at testing one device. So we:
>>    - replace fedora with a custom kernel + buildroot rootfs
>>    - rename the test from IGB to NetDevEthtool
>>    - re-factor the common code, add (currently skipped) tests for other
>>       devices which support ethtool
>>    - remove the KVM limitation as its fast enough to run in KVM or TCG
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>> v2
>>    - use squashfs instead of largely empty ext4 device
>>    - use read-only cdrom
>>    - don't bother with login favour of direct call from init
>>    - kill VM once test is passed
>>    - add explicit kvm option
>
> Why did you add explicit kvm option? Is there something not likely
> covered with TCG?

I realised it was the case that the previous igb tested so I added for
completeness. What I really wanted to do was to make the test agnostic
so it would use KVM when available and fall back to TCG when it
couldn't. However my attempt to specify --accel kvm,tcg didn't work.

But yes I doubt there is much coverage difference between the two -
certainly in the emulation side.

>
> Regards,
> Akihiko Odaki
>
>>    - add tags for device type
>> ---
>>   tests/avocado/igb.py            |  38 -----------
>>   tests/avocado/netdev-ethtool.py | 116 ++++++++++++++++++++++++++++++++
>>   2 files changed, 116 insertions(+), 38 deletions(-)
>>   delete mode 100644 tests/avocado/igb.py
>>   create mode 100644 tests/avocado/netdev-ethtool.py
>> diff --git a/tests/avocado/igb.py b/tests/avocado/igb.py
>> deleted file mode 100644
>> index abf5dfa07f..0000000000
>> --- a/tests/avocado/igb.py
>> +++ /dev/null
>> @@ -1,38 +0,0 @@
>> -# SPDX-License-Identifier: GPL-2.0-or-later
>> -# ethtool tests for igb registers, interrupts, etc
>> -
>> -from avocado_qemu import LinuxTest
>> -
>> -class IGB(LinuxTest):
>> -    """
>> -    :avocado: tags=3Daccel:kvm
>> -    :avocado: tags=3Darch:x86_64
>> -    :avocado: tags=3Ddistro:fedora
>> -    :avocado: tags=3Ddistro_version:31
>> -    :avocado: tags=3Dmachine:q35
>> -    """
>> -
>> -    timeout =3D 180
>> -
>> -    def test(self):
>> -        self.require_accelerator('kvm')
>> -        kernel_url =3D self.distro.pxeboot_url + 'vmlinuz'
>> -        kernel_hash =3D '5b6f6876e1b5bda314f93893271da0d5777b1f3c'
>> -        kernel_path =3D self.fetch_asset(kernel_url, asset_hash=3Dkerne=
l_hash)
>> -        initrd_url =3D self.distro.pxeboot_url + 'initrd.img'
>> -        initrd_hash =3D 'dd0340a1b39bd28f88532babd4581c67649ec5b1'
>> -        initrd_path =3D self.fetch_asset(initrd_url, asset_hash=3Dinitr=
d_hash)
>> -
>> -        # Ideally we want to test MSI as well, but it is blocked by a b=
ug
>> -        # fixed with:
>> -        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git/commit/?id=3D28e96556baca7056d11d9fb3cdd0aba4483e00d8
>> -        kernel_params =3D self.distro.default_kernel_params + ' pci=3Dn=
omsi'
>> -
>> -        self.vm.add_args('-kernel', kernel_path,
>> -                         '-initrd', initrd_path,
>> -                         '-append', kernel_params,
>> -                         '-accel', 'kvm',
>> -                         '-device', 'igb')
>> -        self.launch_and_wait()
>> -        self.ssh_command('dnf -y install ethtool')
>> -        self.ssh_command('ethtool -t eth1 offline')
>> diff --git a/tests/avocado/netdev-ethtool.py b/tests/avocado/netdev-etht=
ool.py
>> new file mode 100644
>> index 0000000000..f7e9464184
>> --- /dev/null
>> +++ b/tests/avocado/netdev-ethtool.py
>> @@ -0,0 +1,116 @@
>> +# ethtool tests for emulated network devices
>> +#
>> +# This test leverages ethtool's --test sequence to validate network
>> +# device behaviour.
>> +#
>> +# SPDX-License-Identifier: GPL-2.0-or-late
>> +
>> +from avocado import skip
>> +from avocado_qemu import QemuSystemTest
>> +from avocado_qemu import exec_command, exec_command_and_wait_for_pattern
>> +from avocado_qemu import wait_for_console_pattern
>> +
>> +class NetDevEthtool(QemuSystemTest):
>> +    """
>> +    :avocado: tags=3Darch:x86_64
>> +    :avocado: tags=3Dmachine:q35
>> +    """
>> +
>> +    # Runs in about 17s under KVM, 19s under TCG, 25s under GCOV
>> +    timeout =3D 45
>> +
>> +    # Fetch assets from the netdev-ethtool subdir of my shared test
>> +    # images directory on fileserver.linaro.org.
>> +    def get_asset(self, name, sha1):
>> +        base_url =3D ('https://fileserver.linaro.org/s/'
>> +                    'kE4nCFLdQcoBF9t/download?'
>> +                    'path=3D%2Fnetdev-ethtool&files=3D' )
>> +        url =3D base_url + name
>> +        # use explicit name rather than failing to neatly parse the
>> +        # URL into a unique one
>> +        return self.fetch_asset(name=3Dname, locations=3D(url), asset_h=
ash=3Dsha1)
>> +
>> +    def common_test_code(self, netdev, extra_args=3DNone, kvm=3DFalse):
>> +
>> +        # This custom kernel has drivers for all the supported network
>> +        # devices we can emulate in QEMU
>> +        kernel =3D self.get_asset("bzImage",
>> +                                "33469d7802732d5815226166581442395cb289=
e2")
>> +
>> +        rootfs =3D self.get_asset("rootfs.squashfs",
>> +                                "9793cea7021414ae844bda51f558bd6565b50c=
dc")
>> +
>> +        append =3D 'printk.time=3D0 console=3DttyS0 '
>> +        append +=3D 'root=3D/dev/sr0 rootfstype=3Dsquashfs '
>> +
>> +        # any additional kernel tweaks for the test
>> +        if extra_args:
>> +            append +=3D extra_args
>> +
>> +        # finally invoke ethtool directly
>> +        append +=3D ' init=3D/usr/sbin/ethtool -- -t eth1 offline'
>> +
>> +        # add the rootfs via a readonly cdrom image
>> +        drive =3D f"file=3D{rootfs},if=3Dide,index=3D0,media=3Dcdrom"
>> +
>> +        self.vm.add_args('-kernel', kernel,
>> +                         '-append', append,
>> +                         '-drive', drive,
>> +                         '-device', netdev)
>> +
>> +        if kvm:
>> +            self.vm.add_args('-accel', 'kvm')
>> +
>> +        self.vm.set_console(console_index=3D0)
>> +        self.vm.launch()
>> +
>> +        wait_for_console_pattern(self,
>> +                                 "The test result is PASS",
>> +                                 "The test result is FAIL",
>> +                                 vm=3DNone)
>> +        # no need to gracefully shutdown, just finish
>> +        self.vm.kill()
>> +
>> +    # Skip testing for MSI for now. Allegedly it was fixed by:
>> +    #   28e96556ba (igb: Allocate MSI-X vector when testing)
>> +    # but I'm seeing oops in the kernel
>> +    @skip("Kernel bug with MSI enabled")
>> +    def test_igb(self):
>> +        """
>> +        :avocado: tags=3Ddevice:igb
>> +        """
>> +        self.common_test_code("igb")
>> +
>> +    def test_igb_nomsi(self):
>> +        """
>> +        :avocado: tags=3Ddevice:igb
>> +        """
>> +        self.common_test_code("igb", "pci=3Dnomsi")
>> +
>> +    def test_igb_nomsi_kvm(self):
>> +        """
>> +        :avocado: tags=3Ddevice:igb
>> +        """
>> +        self.require_accelerator('kvm')
>> +        self.common_test_code("igb", "pci=3Dnomsi", True)
>> +
>> +    # It seems the other popular cards we model in QEMU currently fail
>> +    # the pattern test with:
>> +    #
>> +    #   pattern test failed (reg 0x00178): got 0x00000000 expected 0x00=
005A5A
>> +    #
>> +    # So for now we skip them.
>> +
>> +    @skip("Incomplete reg 0x00178 support")
>> +    def test_e1000(self):
>> +        """
>> +        :avocado: tags=3Ddevice:e1000
>> +        """
>> +        self.common_test_code("e1000")
>> +
>> +    @skip("Incomplete reg 0x00178 support")
>> +    def test_i82550(self):
>> +        """
>> +        :avocado: tags=3Ddevice:i82550
>> +        """
>> +        self.common_test_code("i82550")


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

