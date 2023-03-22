Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F05756C487E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 12:04:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pewFj-00085C-9W; Wed, 22 Mar 2023 07:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pewFV-0007zY-97
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 07:03:26 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pewFF-0004jT-9T
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 07:03:14 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 mp3-20020a17090b190300b0023fcc8ce113so8260943pjb.4
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 04:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1679482982;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4UKUc6EB9FRN+2MlnwmOpbVCZ4rc2VgT9atZn7eADU4=;
 b=LHc29P1Bla9g2Jhrj8muqghZqG8Ivu4A8s14Eha63AWsc0vfFWyXhDe84z/jJxndnR
 kTgsT/m4OpU90AFflZ0FfSG6vI1cJDgUA5eCv49ePuxL1pfPJEH6YvBbTAAY0gqZRTiu
 A/fO4G1QLs7wHOReXom5yBvyPuPqTl6LeIl9TKTXvHwaBVliqXu2ciJHa1Fw8mA3qpGY
 MalFw3ULWuBz4OSv0K6iEGU8TTXZaGQq/JNWmVo3M57Bjap6fXHknBxodjIcv2VcYAih
 UotIze3tobbEflX6YANFb0MtUTPpYhSoQqMqBtcsnTJCwDFI7bjzsq+ME+LpKeMR9o7/
 39mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679482982;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4UKUc6EB9FRN+2MlnwmOpbVCZ4rc2VgT9atZn7eADU4=;
 b=v8fx1gDOtK1kaBwN5sSf12N9X52Fnq6IdrUMD0YtCdMRUFMVjNztoYTtLQMqXbHRYY
 sJM6hI9wtx3p8FTI4Bn/KIMtga+fUt/FDwh1iQ0fQkaW+v8cb91NfZf2ugxCaF2pE3Uy
 7B91SRW5SpdgzWDwQHARZzeuySSO7HDN5+1OAxFZ/1urqftX5X/tF8a3ApwVHAzsTSbY
 7AZ6YbD8ZxmaCykcwPCqt9HsAjR9MPr098xKzsKLWoKqY6/zgDydOBJI+ZDfpQUYA4Zo
 uta4NN94zdiGQpXkyYT/iAb7DrWPFahGGdNWT+uAy0ncnd0CDX74q1amRtKC/kYTlF7L
 2wwg==
X-Gm-Message-State: AO0yUKUrlQgTXd3Do/XOU3thy8xjKTD9OkHfEguGTazkbpZ39l57G+HC
 NIJSJTRe8a/N/U7RZZZrWwa84A==
X-Google-Smtp-Source: AK7set+BC1zunOlf0i3KSl368aHKOp0ONe82xz5cdPZKRbZZwr626Gk5hKEqEKS1hftud4xihYd8JQ==
X-Received: by 2002:a17:902:e883:b0:1a1:ee8c:eef7 with SMTP id
 w3-20020a170902e88300b001a1ee8ceef7mr2789106plg.48.1679482982422; 
 Wed, 22 Mar 2023 04:03:02 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a1709029b8900b0019e6f3112b6sm10267528plp.91.2023.03.22.04.03.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 04:03:02 -0700 (PDT)
Message-ID: <3571bd36-e1e3-ebea-77a6-8042856dcab2@daynix.com>
Date: Wed, 22 Mar 2023 20:02:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH] tests/avocado: re-factor igb test to avoid timeouts
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230321181741.3748845-1-alex.bennee@linaro.org>
 <a06b7763-04fb-60d3-be81-65585ba5c058@daynix.com> <87wn395bqf.fsf@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87wn395bqf.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 2023/03/22 19:04, Alex Bennée wrote:
> 
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2023/03/22 3:17, Alex Bennée wrote:
>>> The core of the test was utilising "ethtool -t eth1 offline" to run
>>> through a test sequence. For reasons unknown the test hangs under some
>>> configurations of the build on centos8-stream. Fundamentally running
>>> the old fedora-31 cloud-init is just too much for something that is
>>> directed at testing one device. So we:
>>>     - replace fedora with a custom kernel + buildroot rootfs
>>>     - rename the test from IGB to NetDevEthtool
>>>     - re-factor the common code, add (currently skipped) tests for other
>>>        devices which support ethtool
>>>     - remove the KVM limitation as its fast enough to run in KVM or TCG
>>
>> I tried this but it seems the rootfs is corrupted:
>> 2023-03-22 13:53:06,728 __init__         L0153 DEBUG| EXT4-fs (sda):
>> INFO: recovery required on readonly filesystem
>> 2023-03-22 13:53:06,728 __init__         L0153 DEBUG| EXT4-fs (sda):
>> write access will be enabled during recovery
>> (snip)
>> 2023-03-22 13:54:24,534 __init__         L0153 DEBUG| EXT4-fs (sda):
>> I/O error while writing superblock
>> 2023-03-22 13:54:24,535 __init__         L0153 DEBUG| EXT4-fs (sda):
>> error loading journal
>> 2023-03-22 13:54:24,542 __init__         L0153 DEBUG| VFS: Cannot open
>> root device "sda" or unknown-block(8,0): error -5
> 
> That's weird. I'm not seeing it when running here. However I can
> regenerate the whole thing and re-upload. Are there any other network
> tools worth adding?

Only ethtool is needed for testing Intel NICs.

> 
>> I have a few more comments:
>>
>> - It may be possible to use microvm to trim it down further.
> 
> Does microvm have PCI now? Most of the saving comes down to having a
> much lighter rootfs than the full cloud init of fedora. I think there is
> only really a syslogd and a klogd running at the start.

microvm supports PCIe. You can enable it by specifying e.g., -M 
microvm,pcie=on

> 
>> - I'm worried that having a rootfs for a single test is too costly to
>>    maintain. If you just want to avoid cloud-init, you can just
>>   specify:
>> init=/bin/sh
> 
> Not really too bad. Buildroot makes it pretty easy. The config can be
> found here:
> 
>    https://fileserver.linaro.org/s/Lk8z7kN3s3ds7kd

Buildroot indeed automates everything to build rootfs, but it still 
takes lots of time to build because it needs to build everything. It 
also fetches sources from the origins of the packages if I understand it 
correctly, and I'm worried that may harm the reproducibility of the builds.

These problems are not present with Fedora: you can add or replace a 
particular component with a package (in this case ethtool is added), and 
Fedora mirrors everything to build the binary.

Regards,
Akihiko Odaki

> 
>>
>> - "time.sleep(0.2)" for waiting commands may be too fragile. Instead,
>>    you may write a fully-automated shell script which does not need any
>>    synchronization.
> 
> Yeah this a hangover of the avocado system and how it deals with the
> console output that it can't handle login prompts without newlines.
> 
>> For example, you may specify something like the
>>    following as the kernel parameter and run self.vm.kill() after the
>>    tests finish:
>> init=/bin/ethtool -- -t eth1 offline
> 
> I can do that. It does cause the kernel to panic once ethtool is done
> but we've passed the test by that point.
> 
>>
>> - If I remember correctly, e1000 and e1000e tests include some checks
>>    contradicting with the datasheet. I suspect it is because their
>>    tests are written for some other devices in the same product family,
>>    but I haven't investigated further.
>>
>> Regards,
>> Akihiko Odaki
>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
>>> ---
>>>    tests/avocado/igb.py            | 38 --------------
>>>    tests/avocado/netdev-ethtool.py | 93 +++++++++++++++++++++++++++++++++
>>>    2 files changed, 93 insertions(+), 38 deletions(-)
>>>    delete mode 100644 tests/avocado/igb.py
>>>    create mode 100644 tests/avocado/netdev-ethtool.py
>>> diff --git a/tests/avocado/igb.py b/tests/avocado/igb.py
>>> deleted file mode 100644
>>> index abf5dfa07f..0000000000
>>> --- a/tests/avocado/igb.py
>>> +++ /dev/null
>>> @@ -1,38 +0,0 @@
>>> -# SPDX-License-Identifier: GPL-2.0-or-later
>>> -# ethtool tests for igb registers, interrupts, etc
>>> -
>>> -from avocado_qemu import LinuxTest
>>> -
>>> -class IGB(LinuxTest):
>>> -    """
>>> -    :avocado: tags=accel:kvm
>>> -    :avocado: tags=arch:x86_64
>>> -    :avocado: tags=distro:fedora
>>> -    :avocado: tags=distro_version:31
>>> -    :avocado: tags=machine:q35
>>> -    """
>>> -
>>> -    timeout = 180
>>> -
>>> -    def test(self):
>>> -        self.require_accelerator('kvm')
>>> -        kernel_url = self.distro.pxeboot_url + 'vmlinuz'
>>> -        kernel_hash = '5b6f6876e1b5bda314f93893271da0d5777b1f3c'
>>> -        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
>>> -        initrd_url = self.distro.pxeboot_url + 'initrd.img'
>>> -        initrd_hash = 'dd0340a1b39bd28f88532babd4581c67649ec5b1'
>>> -        initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
>>> -
>>> -        # Ideally we want to test MSI as well, but it is blocked by a bug
>>> -        # fixed with:
>>> - #
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=28e96556baca7056d11d9fb3cdd0aba4483e00d8
>>> -        kernel_params = self.distro.default_kernel_params + ' pci=nomsi'
>>> -
>>> -        self.vm.add_args('-kernel', kernel_path,
>>> -                         '-initrd', initrd_path,
>>> -                         '-append', kernel_params,
>>> -                         '-accel', 'kvm',
>>> -                         '-device', 'igb')
>>> -        self.launch_and_wait()
>>> -        self.ssh_command('dnf -y install ethtool')
>>> -        self.ssh_command('ethtool -t eth1 offline')
>>> diff --git a/tests/avocado/netdev-ethtool.py b/tests/avocado/netdev-ethtool.py
>>> new file mode 100644
>>> index 0000000000..da0a22d51c
>>> --- /dev/null
>>> +++ b/tests/avocado/netdev-ethtool.py
>>> @@ -0,0 +1,93 @@
>>> +# ethtool tests for emulated network devices
>>> +#
>>> +# This test leverages ethtool's --test sequence to validate network
>>> +# device behaviour.
>>> +#
>>> +# SPDX-License-Identifier: GPL-2.0-or-later
>>> +
>>> +import time
>>> +
>>> +from avocado import skip
>>> +
>>> +from avocado_qemu import QemuSystemTest
>>> +from avocado_qemu import exec_command, exec_command_and_wait_for_pattern
>>> +from avocado_qemu import wait_for_console_pattern
>>> +
>>> +class NetDevEthtool(QemuSystemTest):
>>> +    """
>>> +    :avocado: tags=arch:x86_64
>>> +    :avocado: tags=machine:q35
>>> +    """
>>> +
>>> +    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 root=/dev/sda console=ttyS0 '
>>> +    # Runs in about 20s under KVM, 26s under TCG, 37s under GCOV
>>> +    timeout = 45
>>> +
>>> +    def common_test_code(self, netdev, extra_args=None):
>>> +        base_url = ('https://fileserver.linaro.org/s/'
>>> +                    'kE4nCFLdQcoBF9t/download?'
>>> +                    'path=%2Figb-net-test&files=' )
>>> +
>>> +        # This custom kernel has drivers for all the supported network
>>> +        # devices we can emulate in QEMU
>>> +        kernel_url = base_url + 'bzImage'
>>> +        kernel_hash = '784daede6dab993597f36efbf01f69f184c55152'
>>> +        kernel_path = self.fetch_asset(name="bzImage",
>>> +                                       locations=(kernel_url), asset_hash=kernel_hash)
>>> +
>>> +        rootfs_url = base_url + 'rootfs.ext4'
>>> +        rootfs_hash = '7d28c1bf429de3b441a63756a51f163442ea574b'
>>> +        rootfs_path = self.fetch_asset(name="rootfs.ext4",
>>> +                                       locations=(rootfs_url),
>>> +                                       asset_hash=rootfs_hash)
>>> +
>>> +        kernel_params = self.KERNEL_COMMON_COMMAND_LINE
>>> +        if extra_args:
>>> +            kernel_params += extra_args
>>> +
>>> +        self.vm.add_args('-kernel', kernel_path,
>>> +                         '-append', kernel_params,
>>> +                         '-blockdev',
>>> +                         f"driver=raw,file.driver=file,file.filename={rootfs_path},node-name=hd0",
>>> +                         '-device', 'driver=ide-hd,bus=ide.0,unit=0,drive=hd0',
>>> +                         '-device', netdev)
>>> +
>>> +        self.vm.set_console(console_index=0)
>>> +        self.vm.launch()
>>> +
>>> +        wait_for_console_pattern(self, "Welcome to Buildroot", vm=None)
>>> +        time.sleep(0.2)
>>> +        exec_command(self, 'root')
>>> +        time.sleep(0.2)
>>> +        exec_command_and_wait_for_pattern(self,
>>> +                                          "ethtool -t eth1 offline",
>>> +                                          "The test result is PASS",
>>> +                                          "The test result is FAIL")
>>> +        time.sleep(0.2)
>>> +        exec_command_and_wait_for_pattern(self, 'halt', "reboot: System halted")
>>> +
>>> +    # Skip testing for MSI for now. Allegedly it was fixed by:
>>> +    #   28e96556ba (igb: Allocate MSI-X vector when testing)
>>> +    # but I'm seeing oops in the kernel
>>> +    @skip("Kernel bug with MSI enabled")
>>> +    def test_igb(self):
>>> +        self.common_test_code("igb")
>>> +
>>> +    def test_igb_nomsi(self):
>>> +        self.common_test_code("igb", "pci=nomsi")
>>> +
>>> +
>>> +    # It seems the other popular cards we model in QEMU currently fail
>>> +    # the pattern test with:
>>> +    #
>>> +    #   pattern test failed (reg 0x00178): got 0x00000000 expected 0x00005A5A
>>> +    #
>>> +    # So for now we skip them.
>>> +
>>> +    @skip("Incomplete reg 0x00178 support")
>>> +    def test_e1000(self):
>>> +        self.common_test_code("e1000")
>>> +
>>> +    @skip("Incomplete reg 0x00178 support")
>>> +    def test_i82550(self):
>>> +        self.common_test_code("i82550")
> 
> 

