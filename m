Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7C66586A7
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 21:22:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAcvZ-0005ll-Qf; Wed, 28 Dec 2022 15:21:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAcvX-0005lC-5c
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 15:21:27 -0500
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAcvS-0001g0-HJ
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 15:21:24 -0500
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1442977d77dso19629065fac.6
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 12:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N84DosT1m68LTao+lDG9ZZy5ebes+FuMthuCzUazi5E=;
 b=ApWlW4q4b5u/sGBLsVT9RcQxRjnf8vNlN9qNlSJ18nnV0+0oTM8uJmyXmjPBs61p1N
 w24Fjv7bCA3bXduVBUliU4Q4J6orHwpi1xYRAnvc+WLAOhNA0OLUzkCxC2r7VyA+GMd8
 EL+luiuKy2rZUk+9QikNPejeGEm/ZX20IBJaaQxC4ZE8kGHLQPhfO5IH3fW45IHRQmfL
 ZkJz7bFoS4MHw1qQyajkgk13S/jeziJsX6fpLy8aZdPJcVYz39G7rqtjyvGAdWqpSXSV
 hBwkgT1pnL9/fu47U/w9MS+8gtma5+70Pr8C1VpsQhQ6PGO3hobWZBTrKCRSjtbxLayY
 ZaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N84DosT1m68LTao+lDG9ZZy5ebes+FuMthuCzUazi5E=;
 b=e98/+tinih3GMrCUMmGSExZeQngMC/DjQsa6snWL1zsx3qdezfkE5c0DCIePJ6M138
 ViQmMiHw2X0oXvbLRs6ASFyBN1TqGtlk3LqcZurLT66TVQJ/uHEeJzDKWxCrHErSBrV7
 fM2V33MkMl1I6c1G5ak4xggpUsXVkK5BYqgvrEtfD4wD34yxUh0CdjOoFAhhdqMZgvYq
 PLoB3M8kf1Ck7X0Of5IEtjjTmQQNpCn33NNU2HwjLKnFMz/JyUoLDL6aL8P905/jswGn
 x7KpxcbVmkGEwV+qVlllxeN8MXW82zXrSmZWEoxTMGEEaE0zBFxcfLzKq0TI/CNaOl0o
 QReg==
X-Gm-Message-State: AFqh2kr/9/5M9h3auQf31OrhtDaMdRYed0+4k39WP/drMQNJxN8tt0g0
 R1eOpcRkpKJgD4YB/e4V33cO+g==
X-Google-Smtp-Source: AMrXdXs4WeiUptiH7Q52yWpoS55cL4v7hQmHlIiKHnNNZUQgUM7Z/EFTrqq8P35VG2UIuczBoPI7dg==
X-Received: by 2002:a05:6870:818e:b0:144:4f04:5a8f with SMTP id
 k14-20020a056870818e00b001444f045a8fmr15669180oae.3.1672258880847; 
 Wed, 28 Dec 2022 12:21:20 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.139])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a0568708a0c00b001428eb454e9sm7813024oaq.13.2022.12.28.12.21.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 12:21:20 -0800 (PST)
Message-ID: <a759543f-91b4-4905-400d-3fbe1921226b@ventanamicro.com>
Date: Wed, 28 Dec 2022 17:21:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 01/10] tests/avocado: add RISC-V opensbi boot test
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221228133336.197467-1-dbarboza@ventanamicro.com>
 <20221228133336.197467-2-dbarboza@ventanamicro.com>
 <CAEUhbmXyth6ENTPkX8j5G=+OZ4XxL70S6V989g94w7JSSdAobQ@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAEUhbmXyth6ENTPkX8j5G=+OZ4XxL70S6V989g94w7JSSdAobQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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



On 12/28/22 12:18, Bin Meng wrote:
> On Wed, Dec 28, 2022 at 9:38 PM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>> This test is used to do a quick sanity check to ensure that we're able
>> to run the existing QEMU FW image.
>>
>> 'sifive_u', 'spike' and 'virt' riscv64 machines, and 'sifive_u' and
>> 'virt' 32 bit machines are able to run the default RISCV64_BIOS_BIN |
>> RISCV32_BIOS_BIN firmware with minimal options.
>>
>> The riscv32 'spike' machine isn't bootable at this moment, requiring an
>> Opensbi fix [1] and QEMU side changes [2]. We could just leave at that
> nits: OpenSBI
>
>> or add a 'skip' test to remind us about it. To work as a reminder that
>> we have a riscv32 'spike' test that should be enabled as soon as Opensbi
> ditto
>
>> QEMU rom receives the fix, we're adding a 'skip' test:
>>
>> (11/18) tests/avocado/riscv_opensbi.py:RiscvOpensbi.test_riscv32_spike:
>>          SKIP: requires OpenSBI fix to work
>>
>> [1] https://patchwork.ozlabs.org/project/opensbi/patch/20221226033603.1860569-1-bmeng@tinylab.org/
>> [2] https://patchwork.ozlabs.org/project/qemu-devel/list/?series=334159
>>
>> Cc: Cleber Rosa <crosa@redhat.com>
>> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   tests/avocado/riscv_opensbi.py | 65 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 65 insertions(+)
>>   create mode 100644 tests/avocado/riscv_opensbi.py
>>
>> diff --git a/tests/avocado/riscv_opensbi.py b/tests/avocado/riscv_opensbi.py
>> new file mode 100644
>> index 0000000000..3549d36a11
>> --- /dev/null
>> +++ b/tests/avocado/riscv_opensbi.py
>> @@ -0,0 +1,65 @@
>> +# OpenSBI boot test for RISC-V machines
>> +#
>> +# Copyright (c) 2022, Ventana Micro
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>> +# later.  See the COPYING file in the top-level directory.
>> +
>> +from avocado_qemu import QemuSystemTest
>> +from avocado import skip
>> +from avocado_qemu import wait_for_console_pattern
>> +
>> +class RiscvOpensbi(QemuSystemTest):
>> +    """
>> +    :avocado: tags=accel:tcg
>> +    """
>> +    timeout = 5
>> +
>> +    def boot_opensbi(self):
>> +        self.vm.set_console()
>> +        self.vm.launch()
>> +        wait_for_console_pattern(self, 'Platform Name')
>> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
>> +
>> +    def test_riscv64_virt(self):
>> +        """
>> +        :avocado: tags=arch:riscv64
>> +        :avocado: tags=machine:virt
>> +        """
>> +        self.boot_opensbi()
>> +
>> +    def test_riscv64_spike(self):
>> +        """
>> +        :avocado: tags=arch:riscv64
>> +        :avocado: tags=machine:spike
>> +        """
>> +        self.boot_opensbi()
>> +
>> +    def test_riscv64_sifive_u(self):
>> +        """
>> +        :avocado: tags=arch:riscv64
>> +        :avocado: tags=machine:sifive_u
>> +        """
>> +        self.boot_opensbi()
> nits: could we keep both 64-bit and 32-bit machines in the same order?
> e.g.: virt, sifive_u, spike

I've changed the order to be first the default machine (spike), then the other
machines in alphabetic order.

I've also put the 32 and 64 bit tests for the same machine one after the other:

  (06/18) tests/avocado/riscv_opensbi.py:RiscvOpenSBI.test_riscv32_spike: SKIP: requires OpenSBI fix to work
  (07/18) tests/avocado/riscv_opensbi.py:RiscvOpenSBI.test_riscv64_spike: PASS (0.04 s)
  (08/18) tests/avocado/riscv_opensbi.py:RiscvOpenSBI.test_riscv32_sifive_u: PASS (0.07 s)
  (09/18) tests/avocado/riscv_opensbi.py:RiscvOpenSBI.test_riscv64_sifive_u: PASS (0.07 s)
  (10/18) tests/avocado/riscv_opensbi.py:RiscvOpenSBI.test_riscv32_virt: PASS (0.05 s)
  (11/18) tests/avocado/riscv_opensbi.py:RiscvOpenSBI.test_riscv64_virt: PASS (0.05 s)



If that's ok I'll send v4 tomorrow.


Daniel

>
>> +
>> +    def test_riscv32_virt(self):
>> +        """
>> +        :avocado: tags=arch:riscv32
>> +        :avocado: tags=machine:virt
>> +        """
>> +        self.boot_opensbi()
>> +
>> +    def test_riscv32_sifive_u(self):
>> +        """
>> +        :avocado: tags=arch:riscv32
>> +        :avocado: tags=machine:sifive_u
>> +        """
>> +        self.boot_opensbi()
>> +
>> +    @skip("requires OpenSBI fix to work")
>> +    def test_riscv32_spike(self):
>> +        """
>> +        :avocado: tags=arch:riscv32
>> +        :avocado: tags=machine:spike
>> +        """
>> +        self.boot_opensbi()
>> --
> Otherwise,
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> Tested-by: Bin Meng <bmeng@tinylab.org>


