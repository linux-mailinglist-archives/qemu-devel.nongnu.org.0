Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4E665D528
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 15:10:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD4SL-0008FT-1j; Wed, 04 Jan 2023 09:09:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD4SH-0008FE-3K
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:09:21 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD4SF-0006mh-7q
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:09:20 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 fm16-20020a05600c0c1000b003d96fb976efso24295649wmb.3
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 06:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QUDYvu+UeOmYS7hcNXaw4Itb+xdKMb2QoHJQSVSnp9s=;
 b=mN4YnWSahdApRASGW18+8dP0g7kbhse5yvAJfEE9F+LeWUtP0mNPPnb28+HzCBbTFJ
 I9uiIHysFyfK7gh0xETb4ipiyqfEDO4tIo6XaRIkyoHfgbIQscoezcFSVAMxA6ZHsTRX
 fVR7GVyOVA4K1UgYUpQ9hyLt+NjwYPGPLRk1y6mirSSeP1PBhkzOh7P54XmtcwIsXzgS
 5mt2M45GlCAgOIq4XupwA/1ZGgem7Bnuf7AMFIii+cgCp52fRnDbeds8vj3QJxQdK4sA
 Aud8DgVbUc2M60iRYlhZQ5D+NpO6c8pdc0cHLtWcEKqmQh/y8aOEZ35PSrQT3/R3ojY/
 vyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QUDYvu+UeOmYS7hcNXaw4Itb+xdKMb2QoHJQSVSnp9s=;
 b=Dl6kcPcv20w7rsSvRXEKXXbirahLrJKj/WP9aaPdBuvegWlzeXIaogWdifGqvekB/V
 S6muMDvJFCIspTWz+EiTTm2Cdg22mKLw+K//F14IfW3auTdlUuN8O8chtmSfRgLftH3j
 yB8+iHEDIrY0Z4jDEiPB7vPgNqLWGbAplb6Z6JPudk5FhDTL3bZmqxTDg90efqtl8iKI
 w0ESFg/emdpjz5TlWF2uCvtzGmTpTD6VZy0O85dvEnc6otF3RCIfij9VaPPxlKOoqeSe
 IapkOgEIW3Gd2eNDBTuviRfM/gf7vlwTYo1YGOzEyr0izW5l9QFl6FYwtFFvDpHMcs2H
 /Izw==
X-Gm-Message-State: AFqh2kquhj5xKwk7j9HQ0dRrZ9wWOb3eRbcveHufQbWCEoBLLMzGRU1L
 HRbywDYgZyBmAmDbsA203KU3yQ==
X-Google-Smtp-Source: AMrXdXtDiQlEWAOpCqBJ2sTxRs/9v7HVwvfMn5CmEmTajMxsI46xt2usD4KMnb/fR0m58mz1I7SpPA==
X-Received: by 2002:a7b:c4c8:0:b0:3d3:5a4a:9101 with SMTP id
 g8-20020a7bc4c8000000b003d35a4a9101mr37366351wmk.23.1672841357746; 
 Wed, 04 Jan 2023 06:09:17 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h2-20020a05600c350200b003d9a3a0d461sm21830783wmq.4.2023.01.04.06.09.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 06:09:17 -0800 (PST)
Message-ID: <d88a78db-2d5d-819e-d842-142827c88fb5@linaro.org>
Date: Wed, 4 Jan 2023 15:09:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/3] hw/mips/malta: Set PIIX4 IRQ routes in embedded
 bootloader
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20221027204720.33611-1-philmd@linaro.org>
 <20221027204720.33611-3-philmd@linaro.org>
 <9F566248-59DA-46E2-BD56-5DB98E9DB446@gmail.com>
 <2E4C442C-9057-4006-AE8D-123B513ED894@gmail.com>
 <65f602e2-9067-f1e7-0c94-430e2b75e182@linaro.org>
 <ECE6DE21-1499-4BDF-A886-3FF4F36AF33F@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ECE6DE21-1499-4BDF-A886-3FF4F36AF33F@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 2/1/23 01:03, Bernhard Beschow wrote:
> 
> 
> Am 31. Dezember 2022 13:44:00 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>> On 31/12/22 10:53, Bernhard Beschow wrote:
>>>
>>>
>>> Am 21. November 2022 15:34:05 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>>>>
>>>>
>>>> Am 27. Oktober 2022 20:47:19 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>>>>> Linux kernel expects the northbridge & southbridge chipsets
>>>>> configured by the BIOS firmware. We emulate that by writing
>>>>> a tiny bootloader code in write_bootloader().
>>>>>
>>>>> Upon introduction in commit 5c2b87e34d ("PIIX4 support"),
>>>>> the PIIX4 configuration space included values specific to
>>>>> the Malta board.
>>>>>
>>>>> Set the Malta-specific IRQ routing values in the embedded
>>>>> bootloader, so the next commit can remove the Malta specific
>>>>> bits from the PIIX4 PCI-ISA bridge and make it generic
>>>>> (matching the real hardware).
>>>>>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>> ---
>>>>> FIXME: Missing the nanoMIPS counter-part!
>>>>
>>>> Who will be taking care of this? I have absolutely no clue how the write_bootloader functions work, so I don't see how to fix it.
>>>
>>> Ping
>>
>> This comment has been taken care of:
>> https://lore.kernel.org/qemu-devel/a3c3f639-dbb1-88a7-43fe-547a234c5890@linaro.org/
> 
> Ah, now I see where this is going.
> 
>> However while testing the MIPS pull request I prepared I
>> found a bug in the GT64120 which I'm trying to fix since
>> various days... Unfortunately your series depends on it,
>> so this is a blocking issue. Sorry for this long delay...
> 
> Don't worry.
> 
> How can the bug be reproduced? Is there a test run in the CI?

My problem was on big-endian hosts, now fixed by:
https://lore.kernel.org/qemu-devel/20230104133935.4639-1-philmd@linaro.org/

> Note that I get a 404 when trying to access https://gitlab.com/philmd/qemu/-/commits/mips-testing/ .

Oh for some reason my repository was set for 'project members', I now 
changed that to 'everyone'.

I'll rebuild the mips-testing queue later today or tomorrow and restart 
my testing.

Regards,

Phil.

