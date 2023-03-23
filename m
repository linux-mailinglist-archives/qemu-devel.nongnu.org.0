Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E796C5CCB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 03:47:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfAyn-0002Sp-11; Wed, 22 Mar 2023 22:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pfAyi-0002SO-Km
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 22:47:00 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pfAyf-0000eg-NF
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 22:46:59 -0400
Received: by mail-pl1-x629.google.com with SMTP id bc12so20446850plb.0
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 19:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1679539616;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fMu5SisQbOQjWTfSpE9g9gdA8afMZX5hxqIAhKw37zQ=;
 b=Ovxc9vqmmInK1IE4+LA7ZLSmCmoG2D7Q9mlC7kWAF4fK6W+oqybnzyLCh8zavV7LcG
 OlxqsrNu69pVJ83X2ZNrV35fO+c+3iJB/WR5du7ntZmKDGqXuI14Qid4Iz2Er13dE4nk
 P+lZh4nl9gkP6GnNSyJdpvyeXc7y0JR8T9sVZc571RhupL4EERKm7gESSueEm/ryCHKQ
 1OfyByDyrxdfMkoMFF0hQn+z7aPZL0WfKc6FxhxZ36JCsm7tKQC06KctpgioZ4VBZthr
 S7pbRCuL9OXA8Aj/dRT0sPh4EbsZr5i4/XUqMJfRleWdjMDz3mSATQz019IHXeKnz0oT
 Bn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679539616;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fMu5SisQbOQjWTfSpE9g9gdA8afMZX5hxqIAhKw37zQ=;
 b=dBQSJ7tq8Upx+0SeWItwGD2vcGE+tAh8Ym82xtggGRktmHcPOBsEm2GOJiWKXNwJZE
 VLnNW6vrAT9LQ/e0lzoKPG4ENf0DlMm3Mxx8dy38C7g7GtN9RTkA+NFn+ExmC+z50OcV
 +J820voFqCnSeBL+ez1/mwZwksukArd6wRt4zEuJmOBZGsnfDMMb/NZjope+texxaki8
 Zebb0qExd/zpB2dMSQJrfFbR16Kp/piH0vfSsb6t5ltHjC6SPJ+Pd/peQkKqD1CxUMGl
 e1wTleZ7MNAOZ5jGrEv5yvtdk82AhvzYA6+bAFr2Q7QVD2c7xIvMLVe8A/zwjVvnwk7B
 eqoA==
X-Gm-Message-State: AO0yUKUOk4nTQAPV0VUDemTrC7iQbxsuk6XENNy2p8uu0m6XXrTseNU7
 q/7+3qDxnRD+QQf4zKJcsz0/zg==
X-Google-Smtp-Source: AK7set+r4u9YGS+gWN4DazqAmkSwCgxvjvnGCtKLL7f9izMdDLS2OBSVVAjcpw7YPJGAh3dPO8MBgw==
X-Received: by 2002:a17:903:120a:b0:19e:7d67:84e6 with SMTP id
 l10-20020a170903120a00b0019e7d6784e6mr5712205plh.0.1679539616102; 
 Wed, 22 Mar 2023 19:46:56 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a170903248b00b0019ac7319ed1sm11204225plw.126.2023.03.22.19.46.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 19:46:55 -0700 (PDT)
Message-ID: <a289194c-9187-a152-c3cc-12244e05603f@daynix.com>
Date: Thu, 23 Mar 2023 11:46:52 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] tests/avocado: re-factor igb test to avoid timeouts
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230322145529.4079753-1-alex.bennee@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230322145529.4079753-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x629.google.com
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

On 2023/03/22 23:55, Alex Bennée wrote:
> The core of the test was utilising "ethtool -t eth1 offline" to run
> through a test sequence. For reasons unknown the test hangs under some
> configurations of the build on centos8-stream. Fundamentally running
> the old fedora-31 cloud-init is just too much for something that is
> directed at testing one device. So we:
> 
>    - replace fedora with a custom kernel + buildroot rootfs
>    - rename the test from IGB to NetDevEthtool
>    - re-factor the common code, add (currently skipped) tests for other
>       devices which support ethtool
>    - remove the KVM limitation as its fast enough to run in KVM or TCG
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
> 
> ---
> v2
>    - use squashfs instead of largely empty ext4 device
>    - use read-only cdrom
>    - don't bother with login favour of direct call from init
>    - kill VM once test is passed
>    - add explicit kvm option

Why did you add explicit kvm option? Is there something not likely 
covered with TCG?

Regards,
Akihiko Odaki

>    - add tags for device type
> ---
>   tests/avocado/igb.py            |  38 -----------
>   tests/avocado/netdev-ethtool.py | 116 ++++++++++++++++++++++++++++++++
>   2 files changed, 116 insertions(+), 38 deletions(-)
>   delete mode 100644 tests/avocado/igb.py
>   create mode 100644 tests/avocado/netdev-ethtool.py
> 
> diff --git a/tests/avocado/igb.py b/tests/avocado/igb.py
> deleted file mode 100644
> index abf5dfa07f..0000000000
> --- a/tests/avocado/igb.py
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-or-later
> -# ethtool tests for igb registers, interrupts, etc
> -
> -from avocado_qemu import LinuxTest
> -
> -class IGB(LinuxTest):
> -    """
> -    :avocado: tags=accel:kvm
> -    :avocado: tags=arch:x86_64
> -    :avocado: tags=distro:fedora
> -    :avocado: tags=distro_version:31
> -    :avocado: tags=machine:q35
> -    """
> -
> -    timeout = 180
> -
> -    def test(self):
> -        self.require_accelerator('kvm')
> -        kernel_url = self.distro.pxeboot_url + 'vmlinuz'
> -        kernel_hash = '5b6f6876e1b5bda314f93893271da0d5777b1f3c'
> -        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
> -        initrd_url = self.distro.pxeboot_url + 'initrd.img'
> -        initrd_hash = 'dd0340a1b39bd28f88532babd4581c67649ec5b1'
> -        initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
> -
> -        # Ideally we want to test MSI as well, but it is blocked by a bug
> -        # fixed with:
> -        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=28e96556baca7056d11d9fb3cdd0aba4483e00d8
> -        kernel_params = self.distro.default_kernel_params + ' pci=nomsi'
> -
> -        self.vm.add_args('-kernel', kernel_path,
> -                         '-initrd', initrd_path,
> -                         '-append', kernel_params,
> -                         '-accel', 'kvm',
> -                         '-device', 'igb')
> -        self.launch_and_wait()
> -        self.ssh_command('dnf -y install ethtool')
> -        self.ssh_command('ethtool -t eth1 offline')
> diff --git a/tests/avocado/netdev-ethtool.py b/tests/avocado/netdev-ethtool.py
> new file mode 100644
> index 0000000000..f7e9464184
> --- /dev/null
> +++ b/tests/avocado/netdev-ethtool.py
> @@ -0,0 +1,116 @@
> +# ethtool tests for emulated network devices
> +#
> +# This test leverages ethtool's --test sequence to validate network
> +# device behaviour.
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-late
> +
> +from avocado import skip
> +from avocado_qemu import QemuSystemTest
> +from avocado_qemu import exec_command, exec_command_and_wait_for_pattern
> +from avocado_qemu import wait_for_console_pattern
> +
> +class NetDevEthtool(QemuSystemTest):
> +    """
> +    :avocado: tags=arch:x86_64
> +    :avocado: tags=machine:q35
> +    """
> +
> +    # Runs in about 17s under KVM, 19s under TCG, 25s under GCOV
> +    timeout = 45
> +
> +    # Fetch assets from the netdev-ethtool subdir of my shared test
> +    # images directory on fileserver.linaro.org.
> +    def get_asset(self, name, sha1):
> +        base_url = ('https://fileserver.linaro.org/s/'
> +                    'kE4nCFLdQcoBF9t/download?'
> +                    'path=%2Fnetdev-ethtool&files=' )
> +        url = base_url + name
> +        # use explicit name rather than failing to neatly parse the
> +        # URL into a unique one
> +        return self.fetch_asset(name=name, locations=(url), asset_hash=sha1)
> +
> +    def common_test_code(self, netdev, extra_args=None, kvm=False):
> +
> +        # This custom kernel has drivers for all the supported network
> +        # devices we can emulate in QEMU
> +        kernel = self.get_asset("bzImage",
> +                                "33469d7802732d5815226166581442395cb289e2")
> +
> +        rootfs = self.get_asset("rootfs.squashfs",
> +                                "9793cea7021414ae844bda51f558bd6565b50cdc")
> +
> +        append = 'printk.time=0 console=ttyS0 '
> +        append += 'root=/dev/sr0 rootfstype=squashfs '
> +
> +        # any additional kernel tweaks for the test
> +        if extra_args:
> +            append += extra_args
> +
> +        # finally invoke ethtool directly
> +        append += ' init=/usr/sbin/ethtool -- -t eth1 offline'
> +
> +        # add the rootfs via a readonly cdrom image
> +        drive = f"file={rootfs},if=ide,index=0,media=cdrom"
> +
> +        self.vm.add_args('-kernel', kernel,
> +                         '-append', append,
> +                         '-drive', drive,
> +                         '-device', netdev)
> +
> +        if kvm:
> +            self.vm.add_args('-accel', 'kvm')
> +
> +        self.vm.set_console(console_index=0)
> +        self.vm.launch()
> +
> +        wait_for_console_pattern(self,
> +                                 "The test result is PASS",
> +                                 "The test result is FAIL",
> +                                 vm=None)
> +        # no need to gracefully shutdown, just finish
> +        self.vm.kill()
> +
> +    # Skip testing for MSI for now. Allegedly it was fixed by:
> +    #   28e96556ba (igb: Allocate MSI-X vector when testing)
> +    # but I'm seeing oops in the kernel
> +    @skip("Kernel bug with MSI enabled")
> +    def test_igb(self):
> +        """
> +        :avocado: tags=device:igb
> +        """
> +        self.common_test_code("igb")
> +
> +    def test_igb_nomsi(self):
> +        """
> +        :avocado: tags=device:igb
> +        """
> +        self.common_test_code("igb", "pci=nomsi")
> +
> +    def test_igb_nomsi_kvm(self):
> +        """
> +        :avocado: tags=device:igb
> +        """
> +        self.require_accelerator('kvm')
> +        self.common_test_code("igb", "pci=nomsi", True)
> +
> +    # It seems the other popular cards we model in QEMU currently fail
> +    # the pattern test with:
> +    #
> +    #   pattern test failed (reg 0x00178): got 0x00000000 expected 0x00005A5A
> +    #
> +    # So for now we skip them.
> +
> +    @skip("Incomplete reg 0x00178 support")
> +    def test_e1000(self):
> +        """
> +        :avocado: tags=device:e1000
> +        """
> +        self.common_test_code("e1000")
> +
> +    @skip("Incomplete reg 0x00178 support")
> +    def test_i82550(self):
> +        """
> +        :avocado: tags=device:i82550
> +        """
> +        self.common_test_code("i82550")

