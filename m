Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A81B6A8002
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 11:37:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXgIg-0002R5-6M; Thu, 02 Mar 2023 05:36:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXgIe-0002Nf-Cz; Thu, 02 Mar 2023 05:36:36 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXgIc-0002D7-Jq; Thu, 02 Mar 2023 05:36:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZQWcacwQp3aN2LgV0bnaDYNZW55I4yaYlyiC2iDe4UY=; b=Zp4RICYN/Tcnfb5WXpULvF+Iuz
 LepY47P8qn7PSZFxTVakEwBusikNNpztmI+qdzQlGF/LIfGraHLb+5RS7BOrPZWSG8VBOA10nCDDT
 VUMgUCjDvRr0cvg6/rqgS6yHSGlPtgb72UBy6x4hL38o+fykiUvMj5N9KsTRg+ZoMhaRzBgBoQHJQ
 zLVtFxdmSW9VVV6t01mqdNjrYiMrbjnfE1V3bvCSI5D1nS2QhBbMxtSADX1wYdqfEyH1UIV6B0GWS
 IfsPqiHNWjp3Jo4TzhUDwojP87ai1mHnZHMG4y5RYFpzepWGTnEyKrz5wzCetHnb7d8px0P+8YMWl
 d7Kn8ITpq40J8LnXwkTZK3aWspB0/Uq63JtwFwpIZeLlmFwls4T9UYPlTwfNuRp/zP8J5net8c57l
 guzIpz6l4i/XwxzIqr2RISvaKLxXZS4caYEwjvlM2AE9+kbJVnpOoFgiJn8jW+6gBWR6lAsajUuGr
 0Nj7QdIYYgsByKIGJg9bNTCNm10Y/SEGlQrSaSggYsGkP3E8m+7o24xCBxDkx6nnU75KqAsVrXvYL
 ppNb3XDOGTKM82ECUTu8BEX8690Y4eajV8m8z9tnWkkWAFdysCJAwp277gthcYns/op3o0Umag1qV
 IqaqDh6YxqhRYuqcIRySBCa8tN8uyHZQ0BI7e3Uk4=;
Received: from [2a00:23c4:8bab:d400:2a4f:fc6b:227:2848]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXgHv-0002Cj-Lk; Thu, 02 Mar 2023 10:35:55 +0000
Message-ID: <515701db-06bd-1b4c-8136-c0614c64dce3@ilande.co.uk>
Date: Thu, 2 Mar 2023 10:36:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clegoate@redhat.com>,
 Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
References: <928a8552-ab62-9e6c-a492-d6453e338b9d@redhat.com>
 <ef101296-fc49-aa65-bc88-ce12fee8aeea@redhat.com>
 <71ed4fd4-0d47-5802-cb2d-35a49002a92d@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <71ed4fd4-0d47-5802-cb2d-35a49002a92d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bab:d400:2a4f:fc6b:227:2848
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: Bug in master branch:
 IbmPrep40pMachine.test_factory_firmware_and_netbsd broken
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 02/03/2023 10:27, Philippe Mathieu-Daudé wrote:

> On 2/3/23 10:48, Cédric Le Goater wrote:
>> On 3/2/23 08:47, Thomas Huth wrote:
>>>
>>>   Hi all,
>>>
>>> seems like we've got another bug that sneaked in during the CI minutes blackout: 
>>> The avocado test IbmPrep40pMachine.test_factory_firmware_and_netbsd is now broken 
>>> reliably, see:
>>>
>>>   https://gitlab.com/qemu-project/qemu/-/jobs/3858833617#L300
>>>   https://gitlab.com/thuth/qemu/-/jobs/3858727901#L300
>>>   https://gitlab.com/thuth/qemu/-/jobs/3857804517#L300
>>>
>>> Is anybody already looking into this?
>>>
>>>   Thomas
>>
>> I tried manually and QEMU reached :
>>        >> (builds@wb29, Tue Oct  7 23:59:44 PDT 2008)
>>      Boot:
>>      Loading in()
>>      3558080+232036 [197696+188133]=0x3fbbf0
>>      start=0x100000
>>      Copyright (c) 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005,
>>          2006, 2007
>>          The NetBSD Foundation, Inc.  All rights reserved.
>>      Copyright (c) 1982, 1986, 1989, 1991, 1993
>>          The Regents of the University of California.  All rights reserved.
>>      NetBSD 4.0.1 (GENERIC) #0: Wed Oct  8 00:46:56 PDT 2008
>> builds@wb29:/home/builds/ab/netbsd-4-0-1-RELEASE/prep/200810080053Z-obj/home/builds/ab/netbsd-4-0-1-RELEASE/src/sys/arch/prep/compile/GENERIC 
>>
>>      Model: IBM PPS Model 6015
>>      total memory = 128 MB
>>      avail memory = 119 MB
>>      trap: kernel read DSI trap @ 0x7c3042a6 by 0x3e4cf8 (DSISR 0x40000000, 
>> err=14), lr 0x377eac
>>      panic: trap
>>      Stopped in pid 0.1 () at        netbsd:cpu_Debugger+0x10: lwz     r0, r1, 0
>>      x14
> 
> Bisecting using:
> 
>       make print-V \
>    && ninja qemu-system-ppc \
>    && AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
>       avocado --show=app,console \
>         run --test-runner=nrunner -t slowness:high \
>           tests/avocado/ppc_prep_40p.py
> 
> commit cef2e7148e32d61338de0220619d308bf42af770
> Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Date:   Fri Feb 10 16:05:34 2023 +0100
> 
>      hw/isa/i82378: Remove intermediate IRQ forwarder
> 
>      When the i82378 model was added in commit a04ff940974 ("prep:
>      Add i82378 PCI-to-ISA bridge emulation") the i8259 model was
>      not yet QOM'ified. This happened later in commit 747c70af78f
>      ("i8259: Convert to qdev").
> 
>      Directly dispatch ISA IRQs to 'cpu_intr' output IRQ
>      by removing the intermediate i82378_request_out0_irq()
>      handler. Rename ISA IRQs array as 'isa_irqs_in' to
>      emphasize these are input IRQs.
> 
> Sorry :/ I'll look at this.

Zoltan noticed a similar problem for vt82c686 here: 
https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg08767.html.

I think possibly you need to make use of qdev_connect_gpio_out() rather than using 
s->cpu_intr directly?


ATB,

Mark.

