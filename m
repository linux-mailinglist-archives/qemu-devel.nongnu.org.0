Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0DB39685A
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 21:27:39 +0200 (CEST)
Received: from localhost ([::1]:36230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnnZa-0007Wo-De
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 15:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lnnYM-0006fO-PC
 for qemu-devel@nongnu.org; Mon, 31 May 2021 15:26:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lnnYI-00082Q-9V
 for qemu-devel@nongnu.org; Mon, 31 May 2021 15:26:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622489176;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3/XbuIO9I+M428mOxp1r+YmN5bZRtLWTvpXlj4m2tTM=;
 b=BFx48MH98239rTmkx+MlgY7RkiZDHVv8E1QXWtCR2XXObmWK2kvahGRgZ+Fb2isj7z53lT
 qycUMc9c63e4NMC3S7FdGb/Kx53gvOg4nanonxQX8LWCcNPON+E4+vF1CikpL7svslGJCU
 9q4kJpfnyYux6TsGjw3Ji2d5egakXH8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-6RmbVkX0OGy7UW0ote1H7w-1; Mon, 31 May 2021 15:26:14 -0400
X-MC-Unique: 6RmbVkX0OGy7UW0ote1H7w-1
Received: by mail-qv1-f69.google.com with SMTP id
 k6-20020a0cd6860000b029021936c6e8ffso1942689qvi.7
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 12:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=3/XbuIO9I+M428mOxp1r+YmN5bZRtLWTvpXlj4m2tTM=;
 b=YPmXqibkOteFVY6wg+uoj9bW6FQg0u75VrA9NLFrNM3/bwWTM5s4XUG/mi1tWsYPk4
 nibP1rcGQfnvXXzkiIGVcnMFJibskMZusmkh4JKIhVWGIK/7AbWVTwya2E18tOKz01Cr
 ov7LFBSvZnCAFPtirBSLe/EAOly3A+ZHi/re13I2o5KKNOrAzzZiXkWCbmx6JrUPrW27
 MIxjaUwsfexE7uJfYeNS7yrusfdp648oPiZ0dnmxlwnaghyAz08mgJcEQh1Zgwvcrlb2
 53Sj8gqAnyNbKLNhJkTMZ8PLU6Jj+YsXUJ/yPUI7z46C6ILPtxRzqdtCAKsUxnAklmrL
 1sAg==
X-Gm-Message-State: AOAM533KEXPZTCr6Wdn214XMUfCPsNdfLejvUBZUKkmfGAxwfIgMI96x
 g5S0Z6N1TNLdzSyDWSZByVk39udZ/pTQMc7HqOjOKQXV46KY+B2xKz93s0JegdxctGvVzcAChAk
 ZnhBScgwWBe7hsh0=
X-Received: by 2002:a05:620a:12d9:: with SMTP id
 e25mr17409100qkl.481.1622489172935; 
 Mon, 31 May 2021 12:26:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzg4UAcZdGLfn0LRfFBjq9oOv2MRsAbnEzL64rS+MlHadeWWWjHYxUEJdepIOwjL95r60FLGg==
X-Received: by 2002:a05:620a:12d9:: with SMTP id
 e25mr17409086qkl.481.1622489172685; 
 Mon, 31 May 2021 12:26:12 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.154.247.20])
 by smtp.gmail.com with ESMTPSA id q12sm8993221qtl.13.2021.05.31.12.26.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 12:26:12 -0700 (PDT)
Subject: Re: [PATCH] tests: Boot and halt a Linux guest on the Raspberry Pi 2
 machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210531113837.1689775-1-f4bug@amsat.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <eb40c42b-72aa-39dd-784c-d31dbdbdfc8a@redhat.com>
Date: Mon, 31 May 2021 16:26:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210531113837.1689775-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Reply-To: wainersm@redhat.com
Cc: Nolan Leake <nolan@sigbus.net>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 5/31/21 8:38 AM, Philippe Mathieu-Daudé wrote:
> Add a test booting and quickly shutdown a raspi2 machine,
> to test the power management model:
>
>     (1/1) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd:
>    console: [    0.000000] Booting Linux on physical CPU 0xf00
>    console: [    0.000000] Linux version 4.14.98-v7+ (dom@dom-XPS-13-9370) (gcc version 4.9.3 (crosstool-NG crosstool-ng-1.22.0-88-g8460611)) #1200 SMP Tue Feb 12 20:27:48 GMT 2019
>    console: [    0.000000] CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=10c5387d
>    console: [    0.000000] CPU: div instructions available: patching division code
>    console: [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
>    console: [    0.000000] OF: fdt: Machine model: Raspberry Pi 2 Model B
>    ...
>    console: Boot successful.
>    console: cat /proc/cpuinfo
>    console: / # cat /proc/cpuinfo
>    ...
>    console: processor      : 3
>    console: model name     : ARMv7 Processor rev 5 (v7l)
>    console: BogoMIPS       : 125.00
>    console: Features       : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt vfpd32 lpae evtstrm
>    console: CPU implementer        : 0x41
>    console: CPU architecture: 7
>    console: CPU variant    : 0x0
>    console: CPU part       : 0xc07
>    console: CPU revision   : 5
>    console: Hardware       : BCM2835
>    console: Revision       : 0000
>    console: Serial         : 0000000000000000
>    console: cat /proc/iomem
>    console: / # cat /proc/iomem
>    console: 00000000-3bffffff : System RAM
>    console: 00008000-00afffff : Kernel code
>    console: 00c00000-00d468ef : Kernel data
>    console: 3f006000-3f006fff : dwc_otg
>    console: 3f007000-3f007eff : /soc/dma@7e007000
>    console: 3f00b880-3f00b8bf : /soc/mailbox@7e00b880
>    console: 3f100000-3f100027 : /soc/watchdog@7e100000
>    console: 3f101000-3f102fff : /soc/cprman@7e101000
>    console: 3f200000-3f2000b3 : /soc/gpio@7e200000
>    PASS (24.59 s)
>    RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
>    JOB TIME   : 25.02 s
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Based-on: <162137039825.30884.2445825798240809194-0@git.sr.ht>
> ---
>   tests/acceptance/boot_linux_console.py | 43 ++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)

Even though I did not patch my sources with the fix, I ran the test and 
it failed on the VM's shutdown (as expected, I suppose). The test code 
looks good to me, so:

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index 276a53f1464..19d328203c7 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -16,6 +16,7 @@
>   from avocado import skip
>   from avocado import skipUnless
>   from avocado_qemu import Test
> +from avocado_qemu import exec_command
>   from avocado_qemu import exec_command_and_wait_for_pattern
>   from avocado_qemu import interrupt_interactive_console_until_pattern
>   from avocado_qemu import wait_for_console_pattern
> @@ -467,6 +468,48 @@ def test_arm_raspi2_uart0(self):
>           """
>           self.do_test_arm_raspi2(0)
>   
> +    def test_arm_raspi2_initrd(self):
> +        """
> +        :avocado: tags=arch:arm
> +        :avocado: tags=machine:raspi2
> +        """
> +        deb_url = ('http://archive.raspberrypi.org/debian/'
> +                   'pool/main/r/raspberrypi-firmware/'
> +                   'raspberrypi-kernel_1.20190215-1_armhf.deb')
> +        deb_hash = 'cd284220b32128c5084037553db3c482426f3972'
> +        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
> +        kernel_path = self.extract_from_deb(deb_path, '/boot/kernel7.img')
> +        dtb_path = self.extract_from_deb(deb_path, '/boot/bcm2709-rpi-2-b.dtb')
> +
> +        initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
> +                      '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
> +                      'arm/rootfs-armv7a.cpio.gz')
> +        initrd_hash = '604b2e45cdf35045846b8bbfbf2129b1891bdc9c'
> +        initrd_path_gz = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
> +        initrd_path = os.path.join(self.workdir, 'rootfs.cpio')
> +        archive.gzip_uncompress(initrd_path_gz, initrd_path)
> +
> +        self.vm.set_console()
> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'earlycon=pl011,0x3f201000 console=ttyAMA0 '
> +                               'panic=-1 noreboot ' +
> +                               'dwc_otg.fiq_fsm_enable=0')
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-dtb', dtb_path,
> +                         '-initrd', initrd_path,
> +                         '-append', kernel_command_line,
> +                         '-no-reboot')
> +        self.vm.launch()
> +        self.wait_for_console_pattern('Boot successful.')
> +
> +        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
> +                                                'BCM2835')
> +        exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
> +                                                '/soc/cprman@7e101000')
> +        exec_command(self, 'halt')
> +        # Wait for VM to shut down gracefully
> +        self.vm.wait()
> +
>       def test_arm_exynos4210_initrd(self):
>           """
>           :avocado: tags=arch:arm


