Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16D665D534
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 15:12:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD4VB-000122-8Q; Wed, 04 Jan 2023 09:12:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD4V9-00011a-B3
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:12:19 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD4V7-0007Qo-FO
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:12:19 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 g25-20020a7bc4d9000000b003d97c8d4941so20894404wmk.4
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 06:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BHO+TJudTQx0DGyd0MkrYRDCV4fbM9uEtnvgOWa7x28=;
 b=c3NpQW+qzmfdu95DbG0+X1CU4UoMYqiJYln97zIoD1iq7VFJHGA26W6RICB6Apz7mK
 hTqUm3Jm3H2Wy/GZvUx2IJVSq7w1hiLY7as0/PELb5Z6Kzmsb/ENqF/eLw5HsWnC53L5
 vF2fA7FhxtmR5jblVZtF4xW6rJr1rL0i1T2OElSWRVzV0SBZdyiJFJxTS44jJgNv0Dry
 qBnR5/23874106MSy4BiOnO/JTgD9uA4V4eT6m56ylduXYA7uHs99BfGOduGWNfrS+jo
 sIFdi7kqqwWqnm1cVgF0mZFS6AuKh2KBNH86vznilXqcJxvuaTq4EiIeZQXOvV0RLQj6
 y/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BHO+TJudTQx0DGyd0MkrYRDCV4fbM9uEtnvgOWa7x28=;
 b=oWODjumR4wttzjtIvHy70YRI4kWIw6OeBBx+D91K2BsF/dbmi9d9EvNka4NXBfd7uF
 t5JnECswSn/W6nUm4mKrO3RuiTeJgrqAdu2sMSwAA5iwNMwbMXHybeg8O/+VqNHnpIxp
 tkcsVWlQqz/+7kb/2AE7esNxeybDxA2TYrYTpUZ2cv/ZU9tAifJL1xWpfJWoH8XyL8st
 APTaBHexaLBtfdIjtCEdTmYedgb6qbWm3CbRj3WD6iUeHAh0ZKms2x1xo8hJ2E4gTTrY
 fB/6IjxzBqC/0NXIRQFk+AdG3+HPrt3gypafoKnEKA0k8etnbirY4jnfkkNiv56mphqP
 +IpA==
X-Gm-Message-State: AFqh2krJRHMirfjZ20+aacXbU0whuiVKsW8F/Mu50Jh4LpFySyMHUVpD
 Y4iIAQoX6i5FCHKs4rRu0VjRMWvv8VZudmxd
X-Google-Smtp-Source: AMrXdXtF7+Zmc9Ng65LmBQXPrTVxiJ9WeunzHnYpYS8nOIm65ocPDAzaE03Z5Xq7BxKYu+L4STLjNw==
X-Received: by 2002:a05:600c:4e14:b0:3c6:c6c9:d75e with SMTP id
 b20-20020a05600c4e1400b003c6c6c9d75emr41808101wmq.0.1672841535812; 
 Wed, 04 Jan 2023 06:12:15 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u9-20020a05600c19c900b003d9876aa04asm42357412wmq.41.2023.01.04.06.12.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 06:12:15 -0800 (PST)
Message-ID: <8a310e79-c456-546a-2160-e6adfa851dad@linaro.org>
Date: Wed, 4 Jan 2023 15:12:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 6/6] tests/avocado: Add tests booting YAMON ROM on MIPS
 Malta machines
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230104133935.4639-1-philmd@linaro.org>
 <20230104133935.4639-7-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230104133935.4639-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 4/1/23 14:39, Philippe Mathieu-Daudé wrote:
> Add quick tests booting YAMON:
> 
>    $ avocado --show=app,console run -t machine:malta tests/avocado/machine_mips_malta.py
>     (1/2) tests/avocado/machine_mips_malta.py:MaltaMachine.test_mipsel_malta_yamon:
>    console: YAMON ROM Monitor, Revision 02.22.
>    console: Copyright (c) 1999-2007 MIPS Technologies, Inc. - All Rights Reserved.
>    console: For a list of available commands, type 'help'.
>    console: Compilation time =              May 24 2013  12:16:34 (pburton)
>    console: Board type/revision =           0x02 (Malta) / 0x00
>    console: Core board type/revision =      0x01 (CoreLV) / 0x00
>    console: System controller/revision =    Galileo / GT_64120A-B-0
>    console: FPGA revision =                 0x0000
>    console: MAC address =                   ff.ff.ff.ff.ff.ff
>    console: Board S/N =                     0123456789
>    console: PCI bus frequency =             33.33 MHz
>    console: Processor Company ID/options =  0x01 (MIPS Technologies, Inc.) / 0x00
>    console: Processor ID/revision =         0x93 (MIPS 24Kf) / 0x00
>    console: Endianness =                    Little
>    console: CPU/Bus frequency =             333 MHz / 419 MHz
>    console: Coherency =                     None
>    console: Flash memory size =             4 MByte
>    console: SDRAM size =                    128 MByte
>    console: First free SDRAM address =      0x800c32f0
>    console: WARNING: Environment variable flash area is invalid!
>    console: HINT   : Perform "erase -e"
>    console: YAMON>
>    PASS (1.88 s)
>     (2/2) tests/avocado/machine_mips_malta.py:MaltaMachine.test_mips64el_malta_yamon:
>    ...
>    console: System controller/revision =    Galileo / GT_64120A-B-0
>    console: Processor Company ID/options =  0x01 (MIPS Technologies, Inc.) / 0x00
>    console: Processor ID/revision =         0x82 (MIPS 20Kc) / 0xa0
>    ...
>    console: YAMON>
>    PASS (1.89 s)
>    RESULTS    : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
>    JOB TIME   : 4.57 s
> 
> YAMON does some endian-swapped acceses on the ISD<->PCI CFG/DATA
> registers. These tests are useful to debug cross-endianness issues,
> in particular on big-endian host.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/avocado/machine_mips_malta.py | 52 ++++++++++++++++++++++++++---
>   1 file changed, 48 insertions(+), 4 deletions(-)

> +class MaltaMachine(QemuSystemTest):
> +
> +    def do_test_yamon(self):

Not important but this block ... -->

> +        """
> +        :avocado: tags=arch:mipsel
> +        :avocado: tags=arch:mips64el
> +        :avocado: tags=machine:malta
> +        """

  <-- ... shouldn't be here.

> +        rom_url = ('http://www.imgtec.com/tools/mips-tools/downloads/'
> +                   'yamon/yamon-bin-02.22.zip')
> +        rom_hash = '8da7ecddbc5312704b8b324341ee238189bde480'
> +        zip_path = self.fetch_asset(rom_url, asset_hash=rom_hash)
> +
> +        archive.extract(zip_path, self.workdir)
> +        yamon_path = os.path.join(self.workdir, 'yamon-02.22.bin')
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-bios', yamon_path)
> +        self.vm.launch()
> +
> +        prompt =  'YAMON>'
> +        pattern = 'YAMON ROM Monitor'
> +        interrupt_interactive_console_until_pattern(self, pattern, prompt)
> +        wait_for_console_pattern(self, prompt)
> +        self.vm.shutdown()
> +
> +    def test_mipsel_malta_yamon(self):
> +        """
> +        :avocado: tags=arch:mipsel
> +        :avocado: tags=machine:malta
> +        :avocado: tags=endian:little
> +        """
> +        self.do_test_yamon()
> +
> +    def test_mips64el_malta_yamon(self):
> +        """
> +        :avocado: tags=arch:mips64el
> +        :avocado: tags=machine:malta
> +        :avocado: tags=endian:little
> +        """
> +        self.do_test_yamon()


