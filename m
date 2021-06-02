Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E3539964C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 01:23:33 +0200 (CEST)
Received: from localhost ([::1]:44404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loaCx-0003my-Ni
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 19:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1loaC6-0002wR-2J; Wed, 02 Jun 2021 19:22:38 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:39909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1loaC3-0004yg-TM; Wed, 02 Jun 2021 19:22:37 -0400
Received: by mail-ed1-x52b.google.com with SMTP id dj8so4913507edb.6;
 Wed, 02 Jun 2021 16:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OeE4sSQIXdWBJX99O1b2Bq/BDbtf/5JhinWNSdaeAr0=;
 b=ZvEa8QphO9rHwY6EXCS/PvmDP33RXkRKgVjsa+q4Uxubh9Zjf3m625HXe3/bnh0uva
 3yPTByWFmpGSdIM6OvlMA3iqxND3HosicZEanLpnSpcX2Oh8o3Fq1gObx03hr4vXC+eN
 H6/a8IuqRaajP/mQFf+77DxWX+T+FkoNcThupcOydc1TZpgquvrQCv5sec7tMQOlRyJ+
 VwZEU2nfhO2ISpoiBlA9x7V3r0O0ePn+VsS5WJFhlhM+xME+rBLjrn8K5I4gdPaEGRwv
 Y0cZG0tWyb4Vt4Wj4rZj5t/SpW7mD1YPgjTWvklCe61+myh3PILpVR+TJX6ncI+xVuNW
 Y/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OeE4sSQIXdWBJX99O1b2Bq/BDbtf/5JhinWNSdaeAr0=;
 b=fFauO/8EAM0xgajzOEXznprSUqq2Enj7EyKQVnAIoGtn5g5Im1coiTdpBM5dYifp6g
 MMJn58icb9xpQoywA5Tb8XZPxMv9j9vaNdB37SlQz2lZabbBhaj9vUX+zm4a76l+uUUs
 qcZf9mXfhYW34z3gs/OwGYT8KRPZ47ubCOphnHQm6AVXLDgskUnskHLgJS1cQtwBsZRw
 UNPJRCZyOvxg5WSroak7Q+xUvGb7FCiUwK9TUredgqBd8arq8hMwPR1L54YXuIqfX3/K
 ebE72Yi3Mb2Sv74J/xkEv7dxaadqnIOBaUf0FhOzBfFEU2uxjP5Di97Zp3411K05gTf7
 Zaiw==
X-Gm-Message-State: AOAM531F+qm0ToGVkTn/p08lavoOY1VLmfxMzHp/gOejNaKTQP0+dB/W
 1Fo14jK+hhzicoTS+dQRfnw=
X-Google-Smtp-Source: ABdhPJwW68Loz4yoMN6wyBPxurpISzb/Je+7W+QthCAc5D6L/KQqjM4SMOLlZ2HGOWnSwiRI8A0q8w==
X-Received: by 2002:a05:6402:4252:: with SMTP id
 g18mr40398333edb.195.1622676154246; 
 Wed, 02 Jun 2021 16:22:34 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id z22sm225468ejm.71.2021.06.02.16.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 16:22:33 -0700 (PDT)
Subject: Re: [PATCH qemu] Add basic power management to raspi.
To: Nolan <nolan@sigbus.net>, qemu-devel@nongnu.org
References: <162137039825.30884.2445825798240809194-0@git.sr.ht>
 <65187b48-2449-e2b4-2d13-ed9ffb6fe2a8@amsat.org>
 <7669dd87-e040-a049-e953-9f31a4557ee5@sigbus.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <596d4b19-a1b8-4ae3-d449-376bcd88cbe5@amsat.org>
Date: Thu, 3 Jun 2021 01:22:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <7669dd87-e040-a049-e953-9f31a4557ee5@sigbus.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.613,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/21 11:33 PM, Nolan wrote:
> On 5/31/21 4:23 AM, Philippe Mathieu-Daudé wrote:
>> Hi Nolan,
>>
>> Thanks for your patch!
>>
>> There is something odd with your email address, which apparently
>> became sourcehut@sigbus.net instead of nolan@sigbus.net.
> 
> Ugh, oops. I was trying out sourcehut for this, and reflexively gave
> them a marker email. I'm pretty sure sourcehut won't sell my email
> address, so I'll just change it.
> 
>> On 5/18/21 10:24 PM, ~nolanl wrote:
>>> From: Nolan Leake <nolan@sigbus.net>
>>>
>>> This is just enough to make reboot and poweroff work.
>>
>> Please precise "for Linux kernels", since this doesn't work
>> with firmwares (ideally we should implement the FIRMWARE_NOTIFY_REBOOT
>> property - which Linux sends - to handle the machine reboot/halt
>> via the videocore firmware model).
> 
> Thanks, good point re: this being tuned to what Linux (and u-boot) do.
> Poking around a bit, it looks like
> "trusted-firmware-a"/"arm-trusted-firmware" uses the same method, as do
> a couple of bare-metal/hobby OSes. Couldn't immediately figure out what
> FreeBSD does.
> 
> I'm not sure I understand your point about FIRMWARE_NOTIFY_REBOOT, my
> understanding is that message is there to tell the GPU firmware that
> we're about to reboot, so it can do things like reload the PCIe USB
> chip's firmware. In my testing without the watchdog module loaded, my
> physical pi4 does not reboot, so it appears that sending
> FIRMWARE_NOTIFY_REBOOT is not enough on its own.

From the ARM core point of view, once it sent the FIRMWARE_NOTIFY_REBOOT
message, it can't really power-off itself, it waits in a busy loop for
the VC to disable its power domain.

hw/misc/bcm2835_property.c is our model of the VC behavior. IMO this
should be where QEMU shuts down. How I'd model it is:

- ARM: sends FIRMWARE_NOTIFY_REBOOT and loops

- VC emulated via property: delays (200ms?) then calls
  SHUTDOWN_CAUSE_GUEST_RESET.

(it helps to see hw/misc/bcm2835_property.c as an external component).

>>> qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>>> +            } else {
>>> +                qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
>>> +            }
>>> +        }
>>
>> Shouldn't we log the unsupported bits?
> 
> I can add that, I didn't originally because the unsupported writes are
> expected.

I'd prefer we log them, even if unsupported, so in case something
behaves oddly we could look at those bits.

>>> +static void bcm2835_powermgt_reset(DeviceState *dev)
>>> +{
>>> +    BCM2835PowerMgtState *s = BCM2835_POWERMGT(dev);
>>> +
>>> +    s->rstc = 0x00000102;
>>> +    s->rsts = 0x00001000;
>>> +    s->wdog = 0x00000000;
>>
>> Where these bits come from?
> 
> From my pi4. https://elinux.org/BCM2835_registers agrees (processed from
> Broadcom source code).

OK, so please add a comment referring to
https://elinux.org/BCM2835_registers#PM.

Looking forward for v2 :)

Phil.

