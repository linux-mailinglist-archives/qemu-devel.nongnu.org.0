Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 592E22DE6BC
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:37:08 +0100 (CET)
Received: from localhost ([::1]:48010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHoZ-0004i4-Do
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:37:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kqHZh-0003l7-Cy
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:21:45 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:43924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kqHZf-0008Tz-3y
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:21:45 -0500
Received: by mail-lf1-x132.google.com with SMTP id 23so6282419lfg.10
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 07:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gYfRmibavWX5SwsqnDimKIiluvFV6Rd7SIf4Tcab524=;
 b=lhLd929i2bZe44zozEUXquOO5wwFOkBZ3qUtjqxfaU8+1EZh5F0r5YuyM2i1/n9YsV
 WqUecMx0GVXKzv0jLuIZsqycGRCKVRKWi3WJYYJ41mIekNdVFHPOGlm2iel+qua71ChP
 F/QLQTE0XVghT/We6dZeKh3teC3mexe5cinTvDGp2UXCw8KGw/sO7PxUlkaALy/3/w4m
 uCOHWVyxwLVTs9EwrL/gaen3LhujjMivOeLj1AtPFGqgHS5QsXKifj3N+jYAK2RUZWYC
 FvvdPVZCv7Ko0A5/wDT8vWxJIdwHhTckoNHrqBOsn5iOFV5elCFcPsK+xp0gujJ8Noiv
 nNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gYfRmibavWX5SwsqnDimKIiluvFV6Rd7SIf4Tcab524=;
 b=qXvackAnJcgThGSaD3BMMJk7q+rSe6CuzhlEaKy+SA2Ugu6cnLvmgJSsmfIA6htLQ4
 k9Zf2aQEZ2+AerRvr2mUcKrKnHD5Z02s2LpcruerM6BBYIhd8ZS4uvhIn/tfk8pGEwUz
 D+LLLmFUXJcA7oZtCvmST7ZJFW+QMQ6/ctiGXRB2gYzPqqSzAQbLXjGPsAqAWhIbCCOb
 93kYvpQzn2w6yP+JR4oX3yOpa3c2fB8gPAwEcVSNwNtDu74YzpN586vXSl9KRbb9wVPP
 MH1j+vNZOeETW9VlPt1NJUdwwpSfwLAPgZILM/1jSghkrZA5LHLOnVtycyAfbeCB7Ees
 xa1Q==
X-Gm-Message-State: AOAM530gD80GendZ1MFstA4w6LgGk3LKM7EWHafHUlXYLId5wOiVD5nU
 UQSEBngUssrT/NnzRcaaVsUs3bc1oL/lJw==
X-Google-Smtp-Source: ABdhPJxKV+5peIJikObeXmhd4omTyKcZYVHP8JiS55yNBvBEQbAVD+8kiv+vTINQbpfWeumoZbLy6w==
X-Received: by 2002:a05:6512:314c:: with SMTP id
 s12mr1628760lfi.100.1608304901166; 
 Fri, 18 Dec 2020 07:21:41 -0800 (PST)
Received: from [10.101.1.184] ([185.224.57.162])
 by smtp.gmail.com with ESMTPSA id h1sm511065lfc.121.2020.12.18.07.21.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 07:21:40 -0800 (PST)
Subject: Re: [PATCH] tests/acceptance: Test PMON with Loongson-3A1000 CPU
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>
References: <20201216181759.933527-1-f4bug@amsat.org>
 <a5d00c59-b028-99b1-7500-32cb8e0e43d1@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2a3a25fc-0f56-d835-3807-b028a89e395d@amsat.org>
Date: Fri, 18 Dec 2020 16:21:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <a5d00c59-b028-99b1-7500-32cb8e0e43d1@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/20 4:36 AM, Jiaxun Yang wrote:
> 在 2020/12/17 上午2:17, Philippe Mathieu-Daudé 写道:
>> Test the PMON firmware. As the firmware is not redistributable,
>> it has to be downloaded manually first. Then it can be used by
>> providing its path via the PMON_PATH environment variable:
> 
> We have a PMON port for loongson3-virt machine[1] and it's redistributable.
> 
> You can also fetch prebuilt binary from GitHub action artifacts, I can
> also make
> a release on GitHub to make it easier.

It would be easier indeed, because I can not fetch a job artifact
without using credential. Maybe we can, but I already exhausted
the time I had to test Huacai series, so for now I'll start with
offline testing.

> 
> Thanks.
> 
> [1] https://github.com/loongson-community/pmon
> 
> - Jiaxun
>>
>>    $ AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
>>      PMON_PATH=/images/pmon \
>>      avocado --show=app,console \
>>        run -t machine:loongson3-virt tests/acceptance
>>    JOB ID     : 363e66a2d20b1c0e3f515653f9137483b83b2984
>>    JOB LOG    :
>> /home/phil/avocado/job-results/job-2020-12-16T19.02-363e66a/job.log
>>     (1/2)
>> tests/acceptance/machine_mips_fuloong3.py:MipsFuloong3.test_pmon_BLD_serial_console:
>>
>>    console: PMON2000 MIPS Initializing. Standby...
>>    console: 00000000
>>    console: Shut down other cores
>>    console: 0xbfe00190  : 0000000000000000
>>    console: CPU CLK SEL : 00000000
>>    console: MEM CLK SEL : 00000000
>>    console: Change the driver
>>    console: Soft CLK SEL adjust begin
>>    console: HT         :00000000
>>    console: DDR_DIV:00000002
>>    console: BBGEN start  :
>>    console: BBGEN config value  :00000000
>>    console: MC RESET
>>    console: Fix L1xbar illegal access at NODE 0
>>    console: Fix L2xbar in NODE 0
>>    console: 32 bit PCI space translate to 64 bit HT space
>>    console: Waiting HyperTransport bus to be up.
>>    PASS (0.10 s)
>>     (2/2)
>> tests/acceptance/machine_mips_fuloong3.py:MipsFuloong3.test_pmon_A1101_serial_console:
>>
>>    console: PMON2000 MIPS Initializing. Standby...
>>    console: 0xbfe00190  : 0000000000000000
>>    console: CPU CLK SEL : 00000000
>>    console: CPU clk frequency = SYSCLK x 0x0000001e /  1
>>    console: MEM CLK SEL : 00000000
>>    console: DDR clk frequency = MEMCLK x 0x0000001e /  3
>>    console: Fix L1xbar illegal access
>>    console: Fix L2xbar illegal access
>>    console: Init tlb...
>>    console: godson2 caches found
>>    PASS (0.12 s)
>>    RESULTS    : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 |
>> INTERRUPT 0 | CANCEL 0
>>    JOB TIME   : 0.58 s
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> Based-on: <20201215125716.477023-1-chenhuacai@kernel.org>
>> ---
>>   MAINTAINERS                                 |  1 +
>>   tests/acceptance/machine_mips_loongson3v.py | 66 +++++++++++++++++++++
>>   2 files changed, 67 insertions(+)
>>   create mode 100644 tests/acceptance/machine_mips_loongson3v.py
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index f75fa2a7142..9a02d44f997 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1166,6 +1166,7 @@ M: Huacai Chen <chenhuacai@kernel.org>
>>   R: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>   S: Maintained
>>   F: hw/intc/loongson_liointc.c
>> +F: tests/acceptance/machine_mips_loongson3v.py
>>     Boston
>>   M: Paul Burton <paulburton@kernel.org>
>> diff --git a/tests/acceptance/machine_mips_loongson3v.py
>> b/tests/acceptance/machine_mips_loongson3v.py
>> new file mode 100644
>> index 00000000000..8e698bbc99b
>> --- /dev/null
>> +++ b/tests/acceptance/machine_mips_loongson3v.py
>> @@ -0,0 +1,66 @@
>> +# Functional tests for the Generic Loongson-3 Platform.
>> +#
>> +# Copyright (c) 2020 Philippe Mathieu-Daudé <f4bug@amsat.org>
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>> later.
>> +# See the COPYING file in the top-level directory.
>> +#
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +import os
>> +import time
>> +
>> +from avocado import skipUnless
>> +from avocado_qemu import Test
>> +from avocado_qemu import wait_for_console_pattern
>> +
>> +class MipsFuloong3(Test):
>> +
>> +    timeout = 60
>> +
>> +    @skipUnless(os.getenv('PMON_PATH'), 'PMON_PATH not available')
>> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted
>> code')
>> +    def test_pmon_BLD_serial_console(self):
>> +        """
>> +        :avocado: tags=arch:mips64el
>> +        :avocado: tags=endian:little
>> +        :avocado: tags=machine:loongson3-virt
>> +        :avocado: tags=cpu:Loongson-3A1000
>> +        :avocado: tags=device:liointc
>> +        :avocado: tags=device:goldfish_rtc
>> +        """
>> +        pmon_name = 'pmon_BLD-3A3000-780EMATX-1w-V1.10.bin'
>> +        pmon_hash = '38916ee03ed09a86997b40c687c83e92'
>> +        pmon_path = self.fetch_asset('file://' + os.path.join(
>> +                                        os.getenv('PMON_PATH'),
>> pmon_name),
>> +                                     asset_hash=pmon_hash,
>> algorithm='md5')
>> +
>> +        self.vm.set_console()
>> +        self.vm.add_args('-bios', pmon_path)
>> +        self.vm.launch()
>> +        wait_for_console_pattern(self, 'PMON2000 MIPS Initializing.
>> Standby...')
>> +        wait_for_console_pattern(self, 'Shut down other cores')
>> +        wait_for_console_pattern(self, 'Waiting HyperTransport bus to
>> be up.')
>> +
>> +    @skipUnless(os.getenv('PMON_PATH'), 'PMON_PATH not available')
>> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted
>> code')
>> +    def test_pmon_A1101_serial_console(self):
>> +        """
>> +        :avocado: tags=arch:mips64el
>> +        :avocado: tags=endian:little
>> +        :avocado: tags=machine:loongson3-virt
>> +        :avocado: tags=cpu:Loongson-3A1000
>> +        :avocado: tags=device:liointc
>> +        :avocado: tags=device:goldfish_rtc
>> +        """
>> +        pmon_name = 'pmon-A1101-2.0.8.bin'
>> +        pmon_hash = 'cc40276213cfa20922720f183b92ab61'
>> +        pmon_path = self.fetch_asset('file://' + os.path.join(
>> +                                        os.getenv('PMON_PATH'),
>> pmon_name),
>> +                                     asset_hash=pmon_hash,
>> algorithm='md5')
>> +
>> +        self.vm.set_console()
>> +        self.vm.add_args('-bios', pmon_path)
>> +        self.vm.launch()
>> +        wait_for_console_pattern(self, 'PMON2000 MIPS Initializing.
>> Standby...')
>> +        wait_for_console_pattern(self, 'godson2 caches found')
> 

