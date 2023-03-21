Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC986C3CFC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 22:49:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pejrI-0007gs-Kh; Tue, 21 Mar 2023 17:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pejrD-0007gS-Pn
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 17:49:27 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pejrB-0005On-Pv
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 17:49:27 -0400
Received: by mail-wr1-x430.google.com with SMTP id y14so15162339wrq.4
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 14:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679435364;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KLDEjLsqaIXRv45y93TTZOgUoiU7wkQNHRp8YMXFdAI=;
 b=DCTJueUz4k4Q68ePJtTT45+xRVQZ/BGfC6v5Q7tt8p7UEq66XeDcSbDrbRTSkrqOkX
 Ze5b+pQ6p2aM+KijpN2mMD+O7a5w66uGzyIc2wnXcxNjvrQ0IDG7es48q5OqTEFUGf4/
 jmm666FygqHk+guystI4KBdBXb6ZiDKuUR3zidup1EQm8dmbxzkYCAnVnFXHp7DOHHYj
 icLx+yEWlu7Cz7MbSG0oCnmIVk5ZhZVM9biw1ra0s653ug46JFNUZnf5q2P7qPnlsXsw
 P/GgqbeBLyj6QLPltyqDYWziH/wmUzIU16Wcplatg9XOrgd4cTMccpy6IluHYlfsHcs4
 GHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679435364;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KLDEjLsqaIXRv45y93TTZOgUoiU7wkQNHRp8YMXFdAI=;
 b=hUJfODCVMP3TnUwXf7wItkTTLQDIC+uNhdLNPTWCXjwZch2B4J+HJ1MdC+GXk3TnuJ
 ab4/qv4SajiQ8DMODW/8inaoMJVpQysOL59J+g/QZLBKnq+jAp5M4hp5OyNFfMtSxCxC
 ABd6BoNfxZARztVHYUvnmyZpV/8X22FrcnOvRP+/hxUutjGI3Mbcx9TO8ibB78BaGm/A
 +dfgEDGL7j9JxxacdFDWLx82uA0UUieCii6RyrBQUOxEvxlXmFijr50cnTDKgaHIEcJc
 5uQtFBgx+WB/WugrKwpaBW+vbboekmhvcUdCSJ5vTwMoltOVRiV7lluHYBAwApyEBF+m
 Hfgg==
X-Gm-Message-State: AO0yUKXptELZKdSDmMqQIvgJHGILGGuntJL3wkGmSB00FTT6rY4cqCZZ
 DmGk9tvsd0Cv3eaDZ1mAox2BQQ==
X-Google-Smtp-Source: AK7set9ANLIh3YDFBMKsBHK30rzAUqxJeTeiw4rRc8RH4J4qzLHdoU3y00VWbMYQjZmWNMdnbCD9dA==
X-Received: by 2002:adf:f64a:0:b0:2d8:96b4:5ed9 with SMTP id
 x10-20020adff64a000000b002d896b45ed9mr3240624wrp.38.1679435363715; 
 Tue, 21 Mar 2023 14:49:23 -0700 (PDT)
Received: from [192.168.69.115] (brc29-h02-176-184-12-93.dsl.sta.abo.bbox.fr.
 [176.184.12.93]) by smtp.gmail.com with ESMTPSA id
 d10-20020adfe88a000000b002c70e60abd4sm12334350wrm.2.2023.03.21.14.49.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 14:49:23 -0700 (PDT)
Message-ID: <1bc74e87-1cbc-4a40-f9b6-7ebf6110c16c@linaro.org>
Date: Tue, 21 Mar 2023 22:49:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [RFC PATCH] tests/avocado: re-factor igb test to avoid timeouts
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Cleber Rosa <crosa@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230321181741.3748845-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230321181741.3748845-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 21/3/23 19:17, Alex Bennée wrote:
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
> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   tests/avocado/igb.py            | 38 --------------
>   tests/avocado/netdev-ethtool.py | 93 +++++++++++++++++++++++++++++++++
>   2 files changed, 93 insertions(+), 38 deletions(-)
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
> index 0000000000..da0a22d51c
> --- /dev/null
> +++ b/tests/avocado/netdev-ethtool.py
> @@ -0,0 +1,93 @@
> +# ethtool tests for emulated network devices
> +#
> +# This test leverages ethtool's --test sequence to validate network
> +# device behaviour.
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import time
> +
> +from avocado import skip
> +
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
> +    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 root=/dev/sda console=ttyS0 '
> +    # Runs in about 20s under KVM, 26s under TCG, 37s under GCOV
> +    timeout = 45
> +
> +    def common_test_code(self, netdev, extra_args=None):
> +        base_url = ('https://fileserver.linaro.org/s/'
> +                    'kE4nCFLdQcoBF9t/download?'
> +                    'path=%2Figb-net-test&files=' )
> +
> +        # This custom kernel has drivers for all the supported network
> +        # devices we can emulate in QEMU
> +        kernel_url = base_url + 'bzImage'
> +        kernel_hash = '784daede6dab993597f36efbf01f69f184c55152'
> +        kernel_path = self.fetch_asset(name="bzImage",
> +                                       locations=(kernel_url), asset_hash=kernel_hash)
> +
> +        rootfs_url = base_url + 'rootfs.ext4'
> +        rootfs_hash = '7d28c1bf429de3b441a63756a51f163442ea574b'
> +        rootfs_path = self.fetch_asset(name="rootfs.ext4",
> +                                       locations=(rootfs_url),
> +                                       asset_hash=rootfs_hash)
> +
> +        kernel_params = self.KERNEL_COMMON_COMMAND_LINE
> +        if extra_args:
> +            kernel_params += extra_args
> +
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-append', kernel_params,
> +                         '-blockdev',
> +                         f"driver=raw,file.driver=file,file.filename={rootfs_path},node-name=hd0",
> +                         '-device', 'driver=ide-hd,bus=ide.0,unit=0,drive=hd0',
> +                         '-device', netdev)
> +
> +        self.vm.set_console(console_index=0)
> +        self.vm.launch()
> +
> +        wait_for_console_pattern(self, "Welcome to Buildroot", vm=None)
> +        time.sleep(0.2)
> +        exec_command(self, 'root')
> +        time.sleep(0.2)
> +        exec_command_and_wait_for_pattern(self,
> +                                          "ethtool -t eth1 offline",
> +                                          "The test result is PASS",
> +                                          "The test result is FAIL")
> +        time.sleep(0.2)
> +        exec_command_and_wait_for_pattern(self, 'halt', "reboot: System halted")
> +
> +    # Skip testing for MSI for now. Allegedly it was fixed by:
> +    #   28e96556ba (igb: Allocate MSI-X vector when testing)
> +    # but I'm seeing oops in the kernel
> +    @skip("Kernel bug with MSI enabled")
> +    def test_igb(self):

            """
            :avocado: tags=device:igb
            """


> +        self.common_test_code("igb")
> +
> +    def test_igb_nomsi(self):

            """
            :avocado: tags=device:igb
            """

> +        self.common_test_code("igb", "pci=nomsi")
> +
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

            """
            :avocado: tags=device:e1000
            """

> +        self.common_test_code("e1000")
> +
> +    @skip("Incomplete reg 0x00178 support")
> +    def test_i82550(self):

            """
            :avocado: tags=device:i82550
            """

> +        self.common_test_code("i82550")

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


