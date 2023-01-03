Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D4E65BC8D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 09:57:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCd1L-0003kj-WE; Tue, 03 Jan 2023 03:51:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCd1J-0003k9-Qz
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 03:51:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCd1I-00088G-1J
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 03:51:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672735899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5jddLAwCsIUYNO3PoK1kf9igtcax1fTNGdHADMUh3LI=;
 b=D2vnMr7S7IGM5+XNVXtjPpnPv6lwm8azFoYfHqpg96EOEZP7+PhJH1rB5otKYMGDwDSY0n
 cjcSel+sEJrJoaTB2MCqN1I7rjFKBAuwsdHaXDbHRsv4J/rAbt97E3EqclzQilKSrWtWLr
 ZK3KhuGSkpBl4/IWM/tov+rmeNufagk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-454-AiXJRcfuMUKcxnr4Ed5tJQ-1; Tue, 03 Jan 2023 03:51:38 -0500
X-MC-Unique: AiXJRcfuMUKcxnr4Ed5tJQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 w20-20020adf8bd4000000b00272d0029f18so2926807wra.7
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 00:51:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5jddLAwCsIUYNO3PoK1kf9igtcax1fTNGdHADMUh3LI=;
 b=HgFFz8G3BOqS7uqiJerxE7bnBgDKtzjaLY2CqL0Jo/5AjWMprZnjzKcwRE4LiIxdSx
 EPrfQAy5WmL4DXtdKmILJLkkrBimEtsEruh+8zodX6NWEfznCs7LqPhcUFSRi68QraH6
 CAtx8c+KsVj33k+/0kbeyR+LwD957rU//fkQnXq8a82u0T3+QUVowji9JBGGJ5Zq9mCn
 293OyoAhlkSbw5+mgOIBZTRFvF0cx+BkHkw8k2lk6hu5aI2EgcUQ0Y74YWAFbFaajn9B
 sKf0oDCKqGQY8c2Xuh+5SuOqYjZi97K0CgLWDyDaI/KmFiVx1UQx5PRMiTSwSscxfQtc
 75qA==
X-Gm-Message-State: AFqh2krERdW0Ghc6UHp+DTddeXlvbl6VKqPjFG+YuLI3KWPvZTHhs4B4
 gbJdmrBEVlox7Fa4IwbF+tDpo6aRHasxDPzqBiUPwCluHjVOiLRohS22u8XvdllkfTwvQIiNgh4
 qQp2vVH+6dieJBUI=
X-Received: by 2002:a5d:410c:0:b0:242:2875:93c with SMTP id
 l12-20020a5d410c000000b002422875093cmr34717333wrp.8.1672735897097; 
 Tue, 03 Jan 2023 00:51:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvVr42g32cTEI7UUMJ1ERfRSuDv6CREgawt9A33daR9DpvJ9WkrzIXOJ3XHvl1ecxbOpqZzSw==
X-Received: by 2002:a5d:410c:0:b0:242:2875:93c with SMTP id
 l12-20020a5d410c000000b002422875093cmr34717312wrp.8.1672735896839; 
 Tue, 03 Jan 2023 00:51:36 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-55.web.vodafone.de.
 [109.43.177.55]) by smtp.gmail.com with ESMTPSA id
 r5-20020a056000014500b0029a06f11022sm4838271wrx.112.2023.01.03.00.51.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 00:51:36 -0800 (PST)
Message-ID: <5842ddfc-b419-7611-9e09-9afdea74ccd0@redhat.com>
Date: Tue, 3 Jan 2023 09:51:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 08/30] hw/i386/pc: Create RTC controllers in south
 bridges
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20221221170003.2929-1-shentey@gmail.com>
 <20221221170003.2929-9-shentey@gmail.com>
 <4ab5e721-6a05-1f91-64f0-f4e80ca3957d@redhat.com>
 <F1BB255D-4720-4175-8DAA-B2F7CE546FE5@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <F1BB255D-4720-4175-8DAA-B2F7CE546FE5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.142, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 02/01/2023 19.25, Bernhard Beschow wrote:
> 
> 
> Am 2. Januar 2023 17:03:29 UTC schrieb Thomas Huth <thuth@redhat.com>:
>> On 21/12/2022 17.59, Bernhard Beschow wrote:
>>> Just like in the real hardware (and in PIIX4), create the RTC
>>> controllers in the south bridges.
>>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>> Message-Id: <20221022150508.26830-11-shentey@gmail.com>
>>> ---
>>>    hw/i386/pc.c                  | 12 +++++++++++-
>>>    hw/i386/pc_piix.c             |  8 ++++++++
>>>    hw/i386/pc_q35.c              |  1 +
>>>    hw/isa/Kconfig                |  2 ++
>>>    hw/isa/lpc_ich9.c             |  8 ++++++++
>>>    hw/isa/piix3.c                | 15 +++++++++++++++
>>>    include/hw/i386/ich9.h        |  2 ++
>>>    include/hw/southbridge/piix.h |  3 +++
>>>    8 files changed, 50 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>>> index fa69b6f43e..d154eedcb3 100644
>>> --- a/hw/i386/pc.c
>>> +++ b/hw/i386/pc.c
>>> @@ -1299,7 +1299,17 @@ void pc_basic_device_init(struct PCMachineState *pcms,
>>>            pit_alt_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_PIT_INT);
>>>            rtc_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_RTC_INT);
>>>        }
>>> -    *rtc_state = mc146818_rtc_init(isa_bus, 2000, rtc_irq);
>>> +
>>> +    if (rtc_irq) {
>>> +        qdev_connect_gpio_out(DEVICE(*rtc_state), 0, rtc_irq);
>>> +    } else {
>>> +        uint32_t irq = object_property_get_uint(OBJECT(*rtc_state),
>>> +                                                "irq",
>>> +                                                &error_fatal);
>>> +        isa_connect_gpio_out(*rtc_state, 0, irq);
>>> +    }
>>> +    object_property_add_alias(OBJECT(pcms), "rtc-time", OBJECT(*rtc_state),
>>> +                              "date");
>> I think you could turn now the "ISADevice **rtc_state" parameter of this function into a normal "ISADevice *rtc_state" since the pointer is not a return value anymore.
> 
> This is done in patch 9/30: https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg03799.html

Ah, right, sorry for my shortsightness, then this is fine here:

Reviewed-by: Thomas Huth <thuth@redhat.com>


