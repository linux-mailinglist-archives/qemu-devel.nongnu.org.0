Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A4E6C4777
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 11:21:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pevZt-0000Sm-2H; Wed, 22 Mar 2023 06:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pevZm-0000SN-Tz
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 06:20:14 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pevZj-0005Nc-2T
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 06:20:14 -0400
Received: by mail-wr1-x430.google.com with SMTP id y14so16432406wrq.4
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 03:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679480409;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R0nQvp/5Yr0WW0jYUy8gdEtremNXS9AJRJoNm7wcSeU=;
 b=neYmi382CrjI5QHCFUyM+HA8Bli/K/lP1Zm5VsRshq6BHUFFNpbCRHoejKV1UApudq
 eUVybDS3MT5Qn0r+S/e+xbUPDLqGvvw0mrIVbGFIlX8XLPdgSUoCWzJNS8SkaHORgXSA
 LYY664LexfuSVqQLnIBolfclnsCz21hqgMxbZMIGBcSeeT5iKOaGyfK2Hf9IFyZTlXib
 fJzXNlDYH+vU2Y+v5b8/39b00GNyiE1HD+JWEBdC8jpgybGV87kTk94oWBCYTT4dbbtM
 9519pKx9kcrHFZAaQ61aSn2jMJcOd0Sf2iqbFCcCrZKbr0quX7BuDNEpSa9Ta8nAE6St
 OO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679480409;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=R0nQvp/5Yr0WW0jYUy8gdEtremNXS9AJRJoNm7wcSeU=;
 b=ICXI26bt8Kbw3PKePUE/Fo/aoYG7qbrnEGqbFDvcE6ZAhm0EiLSSbAuC4uaYj7L4Nt
 TrueeIxuScP28EZ1VXKbFnuHVX0f7q1LVerZom0fgd604ypsRcwQw5C9b/uLydAfX95c
 gEHDoE01lLCb7iMoojxxL53KmY8Ob8k0eBuTsKDVaEb3/p720ECiM1ZLSWdp2Y1pSZA5
 +dAs1SwoYgH+P/kYGvinSugB/xbV5sNM4v6dN9AWQFOttvtAZkMwOP8sKH/+a2mEVWTr
 vGeOT1BOuGWhtmTjAv7rRkEaCWWzq1ziLe345VIU7gBIG/mRlQEVFHC3TJGnPua4aFOm
 4fqw==
X-Gm-Message-State: AO0yUKWXyrKK1j6G3I9W3m3LgaAcaBu4o+Z85oVM+y1lOariQNOiZSf0
 KJ/y7pDI9vcJAZ1ypGWBdbxhUQ==
X-Google-Smtp-Source: AK7set8wczFI6GEEQeIPvUyDxcX27BwERbYrxIgM8M0lpajuDip0H8A7iezQqW2IR2J4CZzARFtbtA==
X-Received: by 2002:a5d:490c:0:b0:2cc:4e58:f6d0 with SMTP id
 x12-20020a5d490c000000b002cc4e58f6d0mr4276317wrq.54.1679480409324; 
 Wed, 22 Mar 2023 03:20:09 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a5d6082000000b002c6d0462163sm13416270wrt.100.2023.03.22.03.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 03:20:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A5A371FFB7;
 Wed, 22 Mar 2023 10:20:08 +0000 (GMT)
References: <20230321181741.3748845-1-alex.bennee@linaro.org>
 <a06b7763-04fb-60d3-be81-65585ba5c058@daynix.com>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH] tests/avocado: re-factor igb test to avoid timeouts
Date: Wed, 22 Mar 2023 10:04:43 +0000
In-reply-to: <a06b7763-04fb-60d3-be81-65585ba5c058@daynix.com>
Message-ID: <87wn395bqf.fsf@linaro.org>
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

> On 2023/03/22 3:17, Alex Benn=C3=A9e wrote:
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
>
> I tried this but it seems the rootfs is corrupted:
> 2023-03-22 13:53:06,728 __init__         L0153 DEBUG| EXT4-fs (sda):
> INFO: recovery required on readonly filesystem
> 2023-03-22 13:53:06,728 __init__         L0153 DEBUG| EXT4-fs (sda):
> write access will be enabled during recovery
> (snip)
> 2023-03-22 13:54:24,534 __init__         L0153 DEBUG| EXT4-fs (sda):
> I/O error while writing superblock
> 2023-03-22 13:54:24,535 __init__         L0153 DEBUG| EXT4-fs (sda):
> error loading journal
> 2023-03-22 13:54:24,542 __init__         L0153 DEBUG| VFS: Cannot open
> root device "sda" or unknown-block(8,0): error -5

That's weird. I'm not seeing it when running here. However I can
regenerate the whole thing and re-upload. Are there any other network
tools worth adding?

> I have a few more comments:
>
> - It may be possible to use microvm to trim it down further.

Does microvm have PCI now? Most of the saving comes down to having a
much lighter rootfs than the full cloud init of fedora. I think there is
only really a syslogd and a klogd running at the start.

> - I'm worried that having a rootfs for a single test is too costly to
>   maintain. If you just want to avoid cloud-init, you can just
>  specify:
> init=3D/bin/sh

Not really too bad. Buildroot makes it pretty easy. The config can be
found here:

  https://fileserver.linaro.org/s/Lk8z7kN3s3ds7kd

>
> - "time.sleep(0.2)" for waiting commands may be too fragile. Instead,
>   you may write a fully-automated shell script which does not need any
>   synchronization.

Yeah this a hangover of the avocado system and how it deals with the
console output that it can't handle login prompts without newlines.

> For example, you may specify something like the
>   following as the kernel parameter and run self.vm.kill() after the
>   tests finish:
> init=3D/bin/ethtool -- -t eth1 offline

I can do that. It does cause the kernel to panic once ethtool is done
but we've passed the test by that point.

>
> - If I remember correctly, e1000 and e1000e tests include some checks
>   contradicting with the datasheet. I suspect it is because their
>   tests are written for some other devices in the same product family,
>   but I haven't investigated further.
>
> Regards,
> Akihiko Odaki
>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   tests/avocado/igb.py            | 38 --------------
>>   tests/avocado/netdev-ethtool.py | 93 +++++++++++++++++++++++++++++++++
>>   2 files changed, 93 insertions(+), 38 deletions(-)
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
>> - #
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/?id=3D28e96556baca7056d11d9fb3cdd0aba4483e00d8
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
>> index 0000000000..da0a22d51c
>> --- /dev/null
>> +++ b/tests/avocado/netdev-ethtool.py
>> @@ -0,0 +1,93 @@
>> +# ethtool tests for emulated network devices
>> +#
>> +# This test leverages ethtool's --test sequence to validate network
>> +# device behaviour.
>> +#
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +import time
>> +
>> +from avocado import skip
>> +
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
>> +    KERNEL_COMMON_COMMAND_LINE =3D 'printk.time=3D0 root=3D/dev/sda con=
sole=3DttyS0 '
>> +    # Runs in about 20s under KVM, 26s under TCG, 37s under GCOV
>> +    timeout =3D 45
>> +
>> +    def common_test_code(self, netdev, extra_args=3DNone):
>> +        base_url =3D ('https://fileserver.linaro.org/s/'
>> +                    'kE4nCFLdQcoBF9t/download?'
>> +                    'path=3D%2Figb-net-test&files=3D' )
>> +
>> +        # This custom kernel has drivers for all the supported network
>> +        # devices we can emulate in QEMU
>> +        kernel_url =3D base_url + 'bzImage'
>> +        kernel_hash =3D '784daede6dab993597f36efbf01f69f184c55152'
>> +        kernel_path =3D self.fetch_asset(name=3D"bzImage",
>> +                                       locations=3D(kernel_url), asset_=
hash=3Dkernel_hash)
>> +
>> +        rootfs_url =3D base_url + 'rootfs.ext4'
>> +        rootfs_hash =3D '7d28c1bf429de3b441a63756a51f163442ea574b'
>> +        rootfs_path =3D self.fetch_asset(name=3D"rootfs.ext4",
>> +                                       locations=3D(rootfs_url),
>> +                                       asset_hash=3Drootfs_hash)
>> +
>> +        kernel_params =3D self.KERNEL_COMMON_COMMAND_LINE
>> +        if extra_args:
>> +            kernel_params +=3D extra_args
>> +
>> +        self.vm.add_args('-kernel', kernel_path,
>> +                         '-append', kernel_params,
>> +                         '-blockdev',
>> +                         f"driver=3Draw,file.driver=3Dfile,file.filenam=
e=3D{rootfs_path},node-name=3Dhd0",
>> +                         '-device', 'driver=3Dide-hd,bus=3Dide.0,unit=
=3D0,drive=3Dhd0',
>> +                         '-device', netdev)
>> +
>> +        self.vm.set_console(console_index=3D0)
>> +        self.vm.launch()
>> +
>> +        wait_for_console_pattern(self, "Welcome to Buildroot", vm=3DNon=
e)
>> +        time.sleep(0.2)
>> +        exec_command(self, 'root')
>> +        time.sleep(0.2)
>> +        exec_command_and_wait_for_pattern(self,
>> +                                          "ethtool -t eth1 offline",
>> +                                          "The test result is PASS",
>> +                                          "The test result is FAIL")
>> +        time.sleep(0.2)
>> +        exec_command_and_wait_for_pattern(self, 'halt', "reboot: System=
 halted")
>> +
>> +    # Skip testing for MSI for now. Allegedly it was fixed by:
>> +    #   28e96556ba (igb: Allocate MSI-X vector when testing)
>> +    # but I'm seeing oops in the kernel
>> +    @skip("Kernel bug with MSI enabled")
>> +    def test_igb(self):
>> +        self.common_test_code("igb")
>> +
>> +    def test_igb_nomsi(self):
>> +        self.common_test_code("igb", "pci=3Dnomsi")
>> +
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
>> +        self.common_test_code("e1000")
>> +
>> +    @skip("Incomplete reg 0x00178 support")
>> +    def test_i82550(self):
>> +        self.common_test_code("i82550")


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

