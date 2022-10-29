Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D3461265D
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 01:12:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oouyQ-0006Yo-Hg; Sat, 29 Oct 2022 19:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oouyO-0006Wv-RE
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 19:10:40 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oouyK-0007rL-KM
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 19:10:38 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 m29-20020a05600c3b1d00b003c6bf423c71so8689780wms.0
 for <qemu-devel@nongnu.org>; Sat, 29 Oct 2022 16:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7WEHZGtJLdkABUE5WwbUglDYscAVMYI4pvPF2uOX8ME=;
 b=MhIVQ6LC1G0GmGdIyWrrU4uFxPTatapuL0NGFgkfci3ILNauTcPp4oCkGyOwGu0b2M
 2KFPeayT2fQcqulPJzdtYcyFv2AumKHq4nXUYp/cUtNJyVASXaVpbT0cInQ4n9ubWAGQ
 p7YCe68nZNvuZeFgf77GWEQ5Vwz3t4WTeRNGvHZm0DmoeQy6pJ1HKjlSVO9SAJSrHpT8
 5DzZpdxdPqViUDyzetIZofKIMBU5Jlq9I4Lb2X4zj9RhGSfuc/Q0CIcEg6qMbUzP0/DM
 xBE0uBrCncm7ktsFSflnPJz8kdOI3x8RG6fZvBIArqMer0Z+VnTyy3LqCR3tDBmGsUfp
 WwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7WEHZGtJLdkABUE5WwbUglDYscAVMYI4pvPF2uOX8ME=;
 b=BkrYK1n9s8v8Fy9I3NjQjUcJwDQ1ETW/b+NiQldIHxrKshizmkeQt2KTs45gwQoHsu
 BaeNDe9fe5WwXaEpeb6HQRnXIxz6cZqVY35hjnckUQPvk3CvXQX3lAoxRpGsy1tp6H8Y
 nxMolXQTJxDVIKZgX+DyRfJlcm8F9MKfVfoNjsg5XmX7p9Gw2QdeH8n7UnpHOSp+z1dl
 2mXFTo3l4q7NZXvkIbVSnX+3G1Qex6tPfNVpM9UfdWjfbxJUy+RhcKfvz7XzdLT+1Vy9
 YMhtEKokkcjwsgHfB1lbHlnTLrr9sJpbB4N4E7Ps2LAbL2+VInALSd18bzj6xbYorsyx
 CSnw==
X-Gm-Message-State: ACrzQf0C8SDutHsTxP3MA2JTuHo7Cc8pIfM1VM7YntuKx/YKYKe2NgiR
 lWi33prTgj85N15heWZR+L0FrQ==
X-Google-Smtp-Source: AMsMyM5UcV29LaGhHA5dKzHp09VBpP/7eb3MLIkuAFmxzPXtjTPzqh2gC0tdvAXRHGSpC7ZNIBnXIQ==
X-Received: by 2002:a7b:ce11:0:b0:3cd:df84:2708 with SMTP id
 m17-20020a7bce11000000b003cddf842708mr3477622wmc.165.1667085034271; 
 Sat, 29 Oct 2022 16:10:34 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a05600c1d1100b003a342933727sm2967311wms.3.2022.10.29.16.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Oct 2022 16:10:33 -0700 (PDT)
Message-ID: <45be44c0-766b-07c6-be8a-c21d46da7f72@linaro.org>
Date: Sun, 30 Oct 2022 01:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v4 6/7] hw/sd/sdhci: Implement Freescale eSDHC device model
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org
References: <20221018210146.193159-1-shentey@gmail.com>
 <20221018210146.193159-7-shentey@gmail.com>
 <f9dd1e1e-65b6-c74d-d957-43774393c2a4@linaro.org>
 <724F8CC8-C5E8-4785-B5C2-F1D327863717@gmail.com>
 <590683A5-2774-432C-A47A-ED755054479C@gmail.com>
 <DB3C19E8-007B-46F6-96B3-EE0CF6AD2019@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <DB3C19E8-007B-46F6-96B3-EE0CF6AD2019@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 29/10/22 20:28, Bernhard Beschow wrote:
> Am 29. Oktober 2022 13:04:00 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>> Am 29. Oktober 2022 11:33:51 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>>> Am 27. Oktober 2022 21:40:01 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>>>> Hi Bernhard,
>>>>
>>>> On 18/10/22 23:01, Bernhard Beschow wrote:
>>>>> Will allow e500 boards to access SD cards using just their own devices.
>>>>>
>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>>> ---
>>>>>    hw/sd/sdhci.c         | 120 +++++++++++++++++++++++++++++++++++++++++-
>>>>>    include/hw/sd/sdhci.h |   3 ++
>>>>>    2 files changed, 122 insertions(+), 1 deletion(-)

>>>> So now, I'd create 1 UNIMP region for ESDHC_WML and map it
>>>> into SDHC_REGISTERS_MAP (s->iomem) with priority 1, and add
>>>> another UNIMP region of ESDHC_REGISTERS_MAP_SIZE - SDHC_REGISTERS_MAP_SIZE (= 0x310) and map it normally at offset
>>>> 0x100 (SDHC_REGISTERS_MAP_SIZE). Look at create_unimp() in
>>>> hw/arm/bcm2835_peripherals.c.
>>>>
>>>> But the ESDHC_WML register has address 0x44 and fits inside the
>>>> SDHC_REGISTERS_MAP region, so likely belong there. 0x44 is the
>>>> upper part of the SDHC_CAPAB register. These bits are undefined
>>>> on the spec v2, which I see you are setting in esdhci_init().
>>>> So this register should already return 0, otherwise we have
>>>> a bug. Thus we don't need to handle this ESDHC_WML particularly.
>>
>> My idea here was to catch this unimplemented case in order to indicate this clearly to users. Perhaps it nudges somebody to provide a patch?
>>
>>>>
>>>> And your model is reduced to handling create_unimp() in esdhci_realize().
>>>>
>>>> Am I missing something?
>>>
>>> The mmio ops are big endian and need to be aligned to a 4-byte boundary. It took me quite a while to debug this. So shall I just create an additional memory region for the region above SDHC_REGISTERS_MAP_SIZE for ESDHC_DMA_SYSCTL?
>>
>> All in all I currently don't have a better idea than keeping the custom i/o ops for the standard region and adding an additional unimplemented region for ESDHC_DMA_SYSCTL. I think I'd have to dynamically allocate memory for it where I still need to figure out how not to leak it.
> 
> By simply reusing sdhci_{read,write} in eSDHC's io_ops struct I was able to remove the custom implementations while having big endian and the alignments proper. However, I don't see a way of adding two memory regions - with or without a container. With a container I'd have to somehow preserve the mmio attribute which is initialized by the parent class, re-initialize it with the container, and add the preserved memory region as child. This seems very fragile, esp. since the parent class has created an alias for mmio in sysbus. Without a container, one would have two memory regions that both have to be mapped separately by the caller, i.e. it burdens the caller with an implementation detail.
> 
> Any suggestions?

Can you share branch and how to test?

