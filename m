Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E06B2DEA89
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 21:53:26 +0100 (CET)
Received: from localhost ([::1]:48628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqMkf-00089q-2J
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 15:53:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kqMjB-0007hW-6L
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:51:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kqMj8-0002C1-KI
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:51:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608324709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ADcxVTjC7ETKOE36XvpLfzB0IKh+5lhYttDfyDv42Qs=;
 b=gAIWSbqJBDYDQka1rDrOOEnDej7RWKoWt2ZEFwTZ32BmOZQBHfaR3SUg+0Sig/dmmTx1gu
 BrQmVjefLZbDBUrqPRRHVco8b85318CR7+rzTi3Bddlv5TgXo/9c/MS+IewO0zGf/XUHko
 Sk2TzeurW/XTZIuXHU+RfAtmdvPLr4M=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-OZPW0mHnPdWFWFysdpPcJQ-1; Fri, 18 Dec 2020 15:51:47 -0500
X-MC-Unique: OZPW0mHnPdWFWFysdpPcJQ-1
Received: by mail-qk1-f197.google.com with SMTP id l138so2928877qke.4
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 12:51:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ADcxVTjC7ETKOE36XvpLfzB0IKh+5lhYttDfyDv42Qs=;
 b=prKXWdOy7KLDJeBmF1aoEgpoYLHYeqh2ME62Rsllw/tak2iyg0amNPYl2qeMZSg+GC
 LQgifF3bWxCzmQ0KYcjjsyarbP/NmQ1CnuxBrCOKQLig7h+gVtyAFvllLh7aphRyQdOQ
 cLDTUiamup4mN/etPvr7DCM/A8o74W/hpBwrtx8RWXowZGzJB71pbOtLOjEzSNkoXW2y
 x2kv9eSo1qoziIlRDkZFkdtnNfapDTA4OGrzdmaQSzzs/wVmR9YX9wReBjCTnVun7btv
 YfSK13NT4IbtdE0ufhP8x6aDwalF1VtOR/k1Bbbved2mW5+johyHmjG9TI742wM8Zkdm
 V/fg==
X-Gm-Message-State: AOAM533fqraA8tYuH+VRU5SGrvfm0SVMKWD+DWRb1qBjaCh5prYEqJt6
 1dHNU2RSS5w/R/gpmTaifNJOUlVzkdhSdYPtlxdpLsSbcLh4SoTJ/HCzxqTEOSCK0wIcy8saHAe
 GPK1fWKkvdszSf+0=
X-Received: by 2002:a37:4a58:: with SMTP id x85mr6627171qka.83.1608324707026; 
 Fri, 18 Dec 2020 12:51:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5eldllvQLCw/twNkicAJeLw9J+8A8e2aIp09lYtl85FDpRZZGmwbRtgQeGIKGNwVnIhFQKQ==
X-Received: by 2002:a37:4a58:: with SMTP id x85mr6627142qka.83.1608324706676; 
 Fri, 18 Dec 2020 12:51:46 -0800 (PST)
Received: from [192.168.1.108] ([177.194.2.130])
 by smtp.gmail.com with ESMTPSA id c7sm6236790qtm.60.2020.12.18.12.51.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 12:51:46 -0800 (PST)
Subject: Re: [PATCH] tests/acceptance: Test PMON with Loongson-3A1000 CPU
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Huacai Chen <chenhuacai@kernel.org>
References: <20201216181759.933527-1-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Message-ID: <ad7ff216-66b9-9b0c-eece-80a294240c28@redhat.com>
Date: Fri, 18 Dec 2020 17:51:42 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201216181759.933527-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/16/20 3:17 PM, Philippe Mathieu-Daudé wrote:
> Test the PMON firmware. As the firmware is not redistributable,
> it has to be downloaded manually first. Then it can be used by
> providing its path via the PMON_PATH environment variable:
> 
>    $ AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
>      PMON_PATH=/images/pmon \
>      avocado --show=app,console \
>        run -t machine:loongson3-virt tests/acceptance
>    JOB ID     : 363e66a2d20b1c0e3f515653f9137483b83b2984
>    JOB LOG    : /home/phil/avocado/job-results/job-2020-12-16T19.02-363e66a/job.log
>     (1/2) tests/acceptance/machine_mips_fuloong3.py:MipsFuloong3.test_pmon_BLD_serial_console:
>    console: PMON2000 MIPS Initializing. Standby...
>    console: 00000000
>    console: Shut down other cores
>    console: 0xbfe00190  : 0000000000000000
>    console: CPU CLK SEL : 00000000
>    console: MEM CLK SEL : 00000000
>    console: Change the driver
>    console: Soft CLK SEL adjust begin
>    console: HT         :00000000
>    console: DDR_DIV:00000002
>    console: BBGEN start  :
>    console: BBGEN config value  :00000000
>    console: MC RESET
>    console: Fix L1xbar illegal access at NODE 0
>    console: Fix L2xbar in NODE 0
>    console: 32 bit PCI space translate to 64 bit HT space
>    console: Waiting HyperTransport bus to be up.
>    PASS (0.10 s)
>     (2/2) tests/acceptance/machine_mips_fuloong3.py:MipsFuloong3.test_pmon_A1101_serial_console:
>    console: PMON2000 MIPS Initializing. Standby...
>    console: 0xbfe00190  : 0000000000000000
>    console: CPU CLK SEL : 00000000
>    console: CPU clk frequency = SYSCLK x 0x0000001e /  1
>    console: MEM CLK SEL : 00000000
>    console: DDR clk frequency = MEMCLK x 0x0000001e /  3
>    console: Fix L1xbar illegal access
>    console: Fix L2xbar illegal access
>    console: Init tlb...
>    console: godson2 caches found
>    PASS (0.12 s)
>    RESULTS    : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
>    JOB TIME   : 0.58 s
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Based-on: <20201215125716.477023-1-chenhuacai@kernel.org>
> ---
>   MAINTAINERS                                 |  1 +
>   tests/acceptance/machine_mips_loongson3v.py | 66 +++++++++++++++++++++
>   2 files changed, 67 insertions(+)
>   create mode 100644 tests/acceptance/machine_mips_loongson3v.py
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f75fa2a7142..9a02d44f997 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1166,6 +1166,7 @@ M: Huacai Chen <chenhuacai@kernel.org>
>   R: Jiaxun Yang <jiaxun.yang@flygoat.com>
>   S: Maintained
>   F: hw/intc/loongson_liointc.c
> +F: tests/acceptance/machine_mips_loongson3v.py
>   
>   Boston
>   M: Paul Burton <paulburton@kernel.org>
> diff --git a/tests/acceptance/machine_mips_loongson3v.py b/tests/acceptance/machine_mips_loongson3v.py
> new file mode 100644
> index 00000000000..8e698bbc99b
> --- /dev/null
> +++ b/tests/acceptance/machine_mips_loongson3v.py
> @@ -0,0 +1,66 @@
> +# Functional tests for the Generic Loongson-3 Platform.
> +#
> +# Copyright (c) 2020 Philippe Mathieu-Daudé <f4bug@amsat.org>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or later.
> +# See the COPYING file in the top-level directory.
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import os
> +import time
> +
> +from avocado import skipUnless
> +from avocado_qemu import Test
> +from avocado_qemu import wait_for_console_pattern
> +
> +class MipsFuloong3(Test):
> +
> +    timeout = 60
> +
> +    @skipUnless(os.getenv('PMON_PATH'), 'PMON_PATH not available')
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
> +    def test_pmon_BLD_serial_console(self):
> +        """
> +        :avocado: tags=arch:mips64el
> +        :avocado: tags=endian:little
> +        :avocado: tags=machine:loongson3-virt
> +        :avocado: tags=cpu:Loongson-3A1000
> +        :avocado: tags=device:liointc
> +        :avocado: tags=device:goldfish_rtc
> +        """
> +        pmon_name = 'pmon_BLD-3A3000-780EMATX-1w-V1.10.bin'
> +        pmon_hash = '38916ee03ed09a86997b40c687c83e92'

In case you keep this approach of manually downloading the binary, it 
would be good to have a pointer (url) to it to avoid download of an 
incorrect binary that will not match the hash here.

> +        pmon_path = self.fetch_asset('file://' + os.path.join(
> +                                        os.getenv('PMON_PATH'), pmon_name),
> +                                     asset_hash=pmon_hash, algorithm='md5')
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-bios', pmon_path)
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'PMON2000 MIPS Initializing. Standby...')
> +        wait_for_console_pattern(self, 'Shut down other cores')
> +        wait_for_console_pattern(self, 'Waiting HyperTransport bus to be up.')
> +
> +    @skipUnless(os.getenv('PMON_PATH'), 'PMON_PATH not available')
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
> +    def test_pmon_A1101_serial_console(self):
> +        """
> +        :avocado: tags=arch:mips64el
> +        :avocado: tags=endian:little
> +        :avocado: tags=machine:loongson3-virt
> +        :avocado: tags=cpu:Loongson-3A1000
> +        :avocado: tags=device:liointc
> +        :avocado: tags=device:goldfish_rtc
> +        """
> +        pmon_name = 'pmon-A1101-2.0.8.bin'

Same comment here about the pointer to the binary.

> +        pmon_hash = 'cc40276213cfa20922720f183b92ab61'
> +        pmon_path = self.fetch_asset('file://' + os.path.join(
> +                                        os.getenv('PMON_PATH'), pmon_name),
> +                                     asset_hash=pmon_hash, algorithm='md5')
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-bios', pmon_path)
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'PMON2000 MIPS Initializing. Standby...')
> +        wait_for_console_pattern(self, 'godson2 caches found')
> 

Inspite of a small comment,

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


