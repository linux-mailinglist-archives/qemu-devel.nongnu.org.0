Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B5A5F3D17
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 09:16:18 +0200 (CEST)
Received: from localhost ([::1]:34618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofc9x-000533-Mr
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 03:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ofbxI-0006JZ-Bh
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 03:03:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ofbxE-0008IB-Dq
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 03:03:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664866979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MtvklpyHUzSrlEaEGpF3mOsEQGBkyVf9bgX9/vl0PNs=;
 b=gUxHKUK08eiujsaTyPvFGqrA/kXukszuvMncpNrOSHVWC8D1zci7rQCQYN3UORXpO+OnYh
 Znvo1LM+22T1iDhsQ4PeZkgetZylWdJ5SA3yQqNXWsVFmTTKWHxoCPqh6fa94Y4BlBEXJj
 Vam1nkBwkvTXW6XR5ruTfuEt8gJGUko=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-27-C1L0TXnoNZKL9KOvHgiW7Q-1; Tue, 04 Oct 2022 03:02:58 -0400
X-MC-Unique: C1L0TXnoNZKL9KOvHgiW7Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 w11-20020adfbacb000000b0022e4273f1a9so1244062wrg.20
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 00:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=MtvklpyHUzSrlEaEGpF3mOsEQGBkyVf9bgX9/vl0PNs=;
 b=pmtV4E+4mB3Gv/1SBxo9TSgwoxGSJJHFAqbR5Md6XHGUbXddCpWkg8khRaxu6iXW8/
 1Y4PV5xHJFTsWjFcwp24iq5CGxcOTF1d3f1ZaIoRmRBe2gD/GV599JBWdOUTQXnz4+Ge
 fwjYPuqk3z+p/dbBrp/0NIoVqlWafa+f3/16/tGtiH4HpG3WujlcvMXEn1UIaecaaLNO
 9sTRdEGyrPyVY09QXyn0507lWaLnSUB5AXC/tTUpoi9Pb1GiLmU6fsnx9drvrOtPDQS/
 UoECU3AHUxncZI0WfL2ireunHi60seCWLPudHfusXI4FX8IskOVavqRpugjgUr2sCwD4
 YI/w==
X-Gm-Message-State: ACrzQf1jUMcAFkcPQUZ2mX+REPko3LMtVmcIguWRdi2pkk7jrGUjHsMT
 MgViCiz5e7YAAdccqPAPtj+aT1G0cs12BgTwq5XLaGxJdNrARdDYNnZESL+jw7/WwxVMYABxaaC
 K8nkdAr/SXRBobKU=
X-Received: by 2002:a5d:588c:0:b0:22b:1b41:6b83 with SMTP id
 n12-20020a5d588c000000b0022b1b416b83mr14329664wrf.283.1664866976822; 
 Tue, 04 Oct 2022 00:02:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4KID1cTMqiWfxqmCggwBZamQJMhHR+ZcMaDddMWXjD55TVW2U8gzXwEqtFhlMFmmaRNhx8Ow==
X-Received: by 2002:a5d:588c:0:b0:22b:1b41:6b83 with SMTP id
 n12-20020a5d588c000000b0022b1b416b83mr14329648wrf.283.1664866976597; 
 Tue, 04 Oct 2022 00:02:56 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-178-246.web.vodafone.de.
 [109.43.178.246]) by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b003a682354f63sm19306114wmn.11.2022.10.04.00.02.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 00:02:55 -0700 (PDT)
Message-ID: <05adc9f2-ba31-0a58-206f-aa25377f1f55@redhat.com>
Date: Tue, 4 Oct 2022 09:02:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/avocado: Add missing require_netdev('user') checks
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221001195224.2453581-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221001195224.2453581-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.467, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/10/2022 21.52, Peter Maydell wrote:
> Some avocado tests fail if QEMU was built without libslirp. Add
> require_netdev('user') checks where necessary:
> 
> These tests try to ping 10.0.2.2 and expect it to succeed:
>    boot_linux_console.py:BootLinuxConsole.test_arm_emcraft_sf2
>    boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd
>    ppc_bamboo.py:BambooMachine.test_ppc_bamboo
> 
> These tests run a commandline that includes '-net user':
>    machine_aspeed.py:AST2x00Machine.test_arm_ast2500_evb_builroot
>    (and others that use the do_test_arm_aspeed_buidroot_start()
>    or do_test_arm_aspeed_sdk_start() helper functions)
> 
> These changes seem to be sufficient for 'make check-avocado'
> to not fail on a --disable-slirp build.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/avocado/boot_linux_console.py | 4 ++++
>   tests/avocado/machine_aspeed.py     | 3 +++
>   tests/avocado/ppc_bamboo.py         | 1 +
>   3 files changed, 8 insertions(+)
> 
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
> index f26e036ab58..ca9d09b0d7c 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -381,6 +381,8 @@ def test_arm_emcraft_sf2(self):
>           :avocado: tags=u-boot
>           :avocado: tags=accel:tcg
>           """
> +        self.require_netdev('user')
> +
>           uboot_url = ('https://raw.githubusercontent.com/'
>                        'Subbaraya-Sundeep/qemu-test-binaries/'
>                        'fe371d32e50ca682391e1e70ab98c2942aeffb01/u-boot')
> @@ -779,6 +781,8 @@ def test_arm_orangepi_sd(self):
>           :avocado: tags=machine:orangepi-pc
>           :avocado: tags=device:sd
>           """
> +        self.require_netdev('user')
> +
>           deb_url = ('https://apt.armbian.com/pool/main/l/'
>                      'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
>           deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
> index 0f64eb636c2..124649a24b5 100644
> --- a/tests/avocado/machine_aspeed.py
> +++ b/tests/avocado/machine_aspeed.py
> @@ -93,6 +93,8 @@ def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
>           self.do_test_arm_aspeed(image_path)
>   
>       def do_test_arm_aspeed_buidroot_start(self, image, cpu_id):
> +        self.require_netdev('user')
> +
>           self.vm.set_console()
>           self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
>                            '-net', 'nic', '-net', 'user')
> @@ -193,6 +195,7 @@ def wait_for_console_pattern(self, success_message, vm=None):
>                                    vm=vm)
>   
>       def do_test_arm_aspeed_sdk_start(self, image, cpu_id):
> +        self.require_netdev('user')
>           self.vm.set_console()
>           self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
>                            '-net', 'nic', '-net', 'user')
> diff --git a/tests/avocado/ppc_bamboo.py b/tests/avocado/ppc_bamboo.py
> index 102ff252dff..a81be3d6088 100644
> --- a/tests/avocado/ppc_bamboo.py
> +++ b/tests/avocado/ppc_bamboo.py
> @@ -23,6 +23,7 @@ def test_ppc_bamboo(self):
>           :avocado: tags=accel:tcg
>           """
>           self.require_accelerator("tcg")
> +        self.require_netdev('user')
>           tar_url = ('http://landley.net/aboriginal/downloads/binaries/'
>                      'system-image-powerpc-440fp.tar.gz')
>           tar_hash = '53e5f16414b195b82d2c70272f81c2eedb39bad9'

Reviewed-by: Thomas Huth <thuth@redhat.com>

... and sorry that I missed them in commit 0fc389fe9208f0bfd ... many 
Avocado tests still refuse to run properly on my laptop, so I only fixed 
those that were failing in the gitlab-CI :-/


