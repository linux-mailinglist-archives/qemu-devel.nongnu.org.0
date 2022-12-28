Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C64A86576BD
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 14:04:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAW5u-0004kV-5N; Wed, 28 Dec 2022 08:03:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAW5l-0004ee-Qg
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 08:03:35 -0500
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAW5i-0000rY-Je
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 08:03:32 -0500
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1447c7aa004so18468099fac.11
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 05:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QYuy4k+03T/23b8gpJnvPo2Luj7mUqIFGr4sNDploDM=;
 b=IrV03P7B9rh/pU3j3in7zjnDeiJnL6XWERkXr/OHimCf71iYTl+BOdqagK1y6hEQt4
 sfzAXkwHfD6GRFPeffTMM6n/Obs8u7IrJdssynwDWl/s/b2OvKbLnwO+0cUFrKUK/9LK
 Hal5CsWZNpgoWmUsaxv6+QFYrzUcMXXnrnFB5zm/kXhXTPsMVICXbooHqtRGXGSaHHZl
 q70tPqyrwZZwMEX0dPkaA3hJJNq2anp5t+uxDaKV0a351sRPHQwIZShIgBN3QsJqoowb
 1dK8bGYgCZHJ72n0OCHC+MCGXdWPNtsE4l++OdeHPsdntKF3JGRbnq3/5a/l6O3IqfkH
 9rxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QYuy4k+03T/23b8gpJnvPo2Luj7mUqIFGr4sNDploDM=;
 b=GazHfVhzgTVIM7vmh7eyt255bRJ259QKrreuu6lZpXm+1xh0xA6xQHEYHqlmQepgQe
 tFwv8MFJOjFzmkT3W870+L1+J9eN3M1r/qOjbu3WMhXU1efL17kJv+aeM3HAP1uvLyiO
 KyXHIuzgWvpqIyn02P75oOh03qxMjzN1k1z8fcFMh67yuM/Jv+TIiRVKTzz6Pn3PmMLh
 vztKX2+en80XDFZitkzr+5xKFFyumqQgfxXg2/xpH5PHr/2brLhE6a8m37bL9aNMB/W0
 6jr/WBAIjv2wFvY6fGgww/8nIo7rSsp/EA7lYF4c6YyHZVfAfESz9yOtmcH4dYH9ZZ1e
 JzhQ==
X-Gm-Message-State: AFqh2krRATuZoFdz5wtvSy0Hc0SzAWq9foagX4oN3jTH+7S+K/F2JLZK
 GD5/6Zxc4BnIIL7goedklmlZWg==
X-Google-Smtp-Source: AMrXdXuWwpTdGBXLvGsa9kJtAYlgYgmPwdKEflkvuYpYqA6WO3LPikxwjWnbciuSift6u4R8jTsnKQ==
X-Received: by 2002:a05:6871:458c:b0:144:7a85:63ed with SMTP id
 nl12-20020a056871458c00b001447a8563edmr13019323oab.55.1672232608879; 
 Wed, 28 Dec 2022 05:03:28 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.139])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a056870471000b0010c727a3c79sm7301037oaq.26.2022.12.28.05.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 05:03:28 -0800 (PST)
Message-ID: <8f84f96f-2754-db33-0b3d-a0678e3e5030@ventanamicro.com>
Date: Wed, 28 Dec 2022 10:03:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 01/10] tests/avocado: add RISC-V opensbi boot test
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>
References: <20221228124242.184784-1-dbarboza@ventanamicro.com>
 <20221228124242.184784-2-dbarboza@ventanamicro.com>
 <1ff3c774-edaf-74cf-df57-ebcc7d75363f@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <1ff3c774-edaf-74cf-df57-ebcc7d75363f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
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



On 12/28/22 09:59, Philippe Mathieu-Daudé wrote:
> On 28/12/22 13:42, Daniel Henrique Barboza wrote:
>> This test is used to do a quick sanity check to ensure that we're able
>> to run the existing QEMU FW image.
>>
>> 'sifive_u', 'spike' and 'virt' riscv64 machines, and 'sifive_u' and
>> 'virt' 32 bit machines are able to run the default RISCV64_BIOS_BIN |
>> RISCV32_BIOS_BIN firmware with minimal options.
>>
>> The riscv32 'spike' machine isn't bootable at this moment, requiring an
>> Opensbi fix [1] and QEMU side changes [2]. We could just leave at that
>> or add a 'skip' test to remind us about it. To work as a reminder that
>> we have a riscv32 'spike' test that should be enabled as soon as Opensbi
>> QEMU rom receives the fix, we're adding a 'skip' test:
>>
>> (11/18) tests/avocado/riscv_opensbi.py:RiscvOpensbi.test_riscv32_spike:
>>          SKIP: requires OpenSBI fix to work
>>
>> [1] https://patchwork.ozlabs.org/project/opensbi/patch/20221226033603.1860569-1-bmeng@tinylab.org/
>> [2] https://patchwork.ozlabs.org/project/qemu-devel/list/?series=334159
>>
>> Cc: Cleber Rosa <crosa@redhat.com>
>> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   tests/avocado/riscv_opensbi.py | 77 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 77 insertions(+)
>>   create mode 100644 tests/avocado/riscv_opensbi.py
>>
>> diff --git a/tests/avocado/riscv_opensbi.py b/tests/avocado/riscv_opensbi.py
>> new file mode 100644
>> index 0000000000..64fcf3c774
>> --- /dev/null
>> +++ b/tests/avocado/riscv_opensbi.py
>> @@ -0,0 +1,77 @@
>> +# opensbi boot test for RISC-V machines
>
> s/opensbi/OpenSBI/
>
>> +#
>> +# Copyright (c) 2022, Ventana Micro
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>> +# later.  See the COPYING file in the top-level directory.
>> +
>> +from avocado_qemu import QemuSystemTest
>> +from avocado import skip
>> +from avocado_qemu import wait_for_console_pattern
>> +
>> +class RiscvOpensbi(QemuSystemTest):
>> +    """
>> +    :avocado: tags=accel:tcg
>> +    """
>> +    timeout = 5
>
> Easier to review common code once:
>
>        def boot_opensbi(self):
>            self.vm.set_console()
>            self.vm.launch()
>            wait_for_console_pattern(self, 'Platform Name')
>            wait_for_console_pattern(self, 'Boot HART MEDELEG')

Yeah I mean, here I am, adding duplicated logic in a series that was aimed to
reduce duplicated logic :D


I'll refactor it in v3. Thanks!


Daniel

>
>> +
>> +    def test_riscv64_virt(self):
>> +        """
>> +        :avocado: tags=arch:riscv64
>> +        :avocado: tags=machine:virt
>> +        """
>
>            self.boot_opensbi()
>
>> +    def test_riscv64_spike(self):
>> +        """
>> +        :avocado: tags=arch:riscv64
>> +        :avocado: tags=machine:spike
>> +        """
>
>            self.boot_opensbi()
>
> [...]
>
>> +    @skip("requires OpenSBI fix to work")
>> +    def test_riscv32_spike(self):
>> +        """
>> +        :avocado: tags=arch:riscv32
>> +        :avocado: tags=machine:spike
>> +        """
>
>            self.boot_opensbi()
>
>


