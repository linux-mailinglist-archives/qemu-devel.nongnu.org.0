Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CC7268F0D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 17:07:10 +0200 (CEST)
Received: from localhost ([::1]:38234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHq4T-0007yg-Gs
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 11:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kHq2s-0006W6-Ki; Mon, 14 Sep 2020 11:05:30 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kHq2q-0008F4-QF; Mon, 14 Sep 2020 11:05:30 -0400
Received: by mail-wm1-x343.google.com with SMTP id s13so352777wmh.4;
 Mon, 14 Sep 2020 08:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Qj0eiagyDTtsoUHetYKIyTR699TUJfKIMw5A6AnVMPQ=;
 b=OiDq6V3kin3vq1k4o1H2m7WhE723Zj+gEyIExmitwU8Dh9I8cZJ5KuRc07IRai0grI
 dhck7cEg9TcOhDKQPYzumn0+wf+F7mB4qzCub7Bwfb5vy8e6+m1aeKmo3MSSFxUpgjbc
 otCm812AiytvYTNtZne8ZIx8+IOX/yKcbzer6domoXXFKRm3R0mAo7Qv3PaogE+WeBep
 z5CZE7dWRmt2M8sVSHgug6cLBaeyBb2GbjV1yf92hvO6seLiuR5fn8hOys79sNT+LKgR
 L3O2XuGqPE9QAkM0FpR04ObojudD44NDkU/uYo0hcxZKaUz8ddr4Vx7MMSl0Iadi2p19
 VchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qj0eiagyDTtsoUHetYKIyTR699TUJfKIMw5A6AnVMPQ=;
 b=AHFit0LjBldh0SQPzi1NszeFY2QBUPNT6XiSkrVtYk0lG91FHAr19OrojZnyjdBpiB
 5yNAglSZ2xm60+xMmiZmqPV962x5olE1h7JXrbc5PBuNnOji8m+e2TM58JvT2znvGmPH
 xDOUv+tDuRaFSzOw4ieBZut6epmBOJ03zyBMYjE4M+GGP+SX9qqWPZUPITAwzjnS3NQg
 HlOEwqexC1Pw95Cm/lGYftpEPGvc1+258IHlqqQtIzgmPsmNpHwH/1AdXapCkMhDGPAN
 RdOF+SUPD9ad9ex+NBNSkTwvigquAujhbemYGRLvpMDhteSfyH8vkYp62fD4qrL2Hwkr
 ie6w==
X-Gm-Message-State: AOAM532POg4bWNZzUbQZ+ntEhe910nZMGMrPK3nhsU10Y/55U/ahMI+N
 9GpRTXX6CWGZC7/cVLmsd7s=
X-Google-Smtp-Source: ABdhPJyvezMd/msbAgYkyuBKK6/G9sfbdOHLhWV+hVPWesU+vHH6AXPwGVii/nA0o25nPnNgzVwm0A==
X-Received: by 2002:a05:600c:21cd:: with SMTP id
 x13mr15552813wmj.63.1600095926627; 
 Mon, 14 Sep 2020 08:05:26 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id n4sm20822382wrp.61.2020.09.14.08.05.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 08:05:25 -0700 (PDT)
Subject: Re: [PATCH v5 2/7] hw/misc/led: Allow connecting from GPIO output
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20200910205429.727766-1-f4bug@amsat.org>
 <20200910205429.727766-3-f4bug@amsat.org>
 <071b68a6-58e4-0d68-e056-ee7ae19e2227@linaro.org>
 <db55f80e-ca2d-d432-134b-a05333a7e124@amsat.org>
 <87imcg4y3l.fsf@dusky.pond.sub.org>
 <f451861f-fa21-6465-865e-9d5e42e165b5@amsat.org>
 <20200914140319.GA1618070@habkost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5576befe-b616-f061-f384-6c4b1fde3323@amsat.org>
Date: Mon, 14 Sep 2020 17:05:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200914140319.GA1618070@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/20 4:03 PM, Eduardo Habkost wrote:
> On Mon, Sep 14, 2020 at 09:48:45AM +0200, Philippe Mathieu-Daudé wrote:
>> On 9/14/20 9:27 AM, Markus Armbruster wrote:
>>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>>
>>>> Eduardo is already in Cc, adding Markus.
>>>>
>>>> On 9/12/20 12:44 AM, Richard Henderson wrote:
>>>>> On 9/10/20 1:54 PM, Philippe Mathieu-Daudé wrote:
>>>>>> Some devices expose GPIO lines.
>>>>>>
>>>>>> Add a GPIO qdev input to our LED device, so we can
>>>>>> connect a GPIO output using qdev_connect_gpio_out().
>>>>>>
>>>>>> When used with GPIOs, the intensity can only be either
>>>>>> minium or maximum. This depends of the polarity of the
>>>>>> GPIO (which can be inverted).
>>>>>> Declare the GpioPolarity type to model the polarity.
>>>>>>
>>>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>>> ---
>>>>>>  include/hw/misc/led.h  |  8 ++++++++
>>>>>>  include/hw/qdev-core.h |  8 ++++++++
>>>>>>  hw/misc/led.c          | 17 ++++++++++++++++-
>>>>>>  3 files changed, 32 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/include/hw/misc/led.h b/include/hw/misc/led.h
>>>>>> index f5afaa34bfb..71c9b8c59bf 100644
>>>>>> --- a/include/hw/misc/led.h
>>>>>> +++ b/include/hw/misc/led.h
>>>>>> @@ -38,10 +38,16 @@ typedef struct LEDState {
>>>>>>      /* Public */
>>>>>>  
>>>>>>      uint8_t intensity_percent;
>>>>>> +    qemu_irq irq;
>>>>>>  
>>>>>>      /* Properties */
>>>>>>      char *description;
>>>>>>      char *color;
>>>>>> +    /*
>>>>>> +     * When used with GPIO, the intensity at reset is related
>>>>>> +     * to the GPIO polarity.
>>>>>> +     */
>>>>>> +    bool inverted_polarity;
>>>>>
>>>>> Why are you not using the GpioPolarity enum that you added?
>>>>
>>>> Because it is migrated...
>>>>
>>>> Using DEFINE_PROP_BOOL() is simpler that adding hardware specific
>>>> enum visitor in hw/core/qdev-properties.c (which is included in
>>>> user-mode builds because pulled by the CPU type).
>>>
>>> Yes.
>>>
>>> You could also use DEFINE_PROP_UINT8(), and use it with your enumeration
>>> constants.
>>>
>>> I'd be tempted to ditch the enum entirely.  Matter of taste, no big deal
>>> either way.
>>
>> Done in v6!
>>
>>>
>>>> A sane cleanup would be to make get_enum(), set_enum()
>>>> and set_default_value_enum() public (prefixed with 'qdev_')
>>>> in include/hw/qdev-properties.h.
>>>
> 
> Where and how exactly do you expect those functions to be used?
> Having additional PropertyInfo structs defined manually would not
> be desirable (especially if they are outside qdev*.c).  Having a
> DEFINE_PROP_ENUM macro that does the enum magic behind the scenes
> would be nice.
> 
>>> Purpose?  To be able to define enum properties outside
>>> qdev-properties.c?
>>
>> Yes, to avoid pulling in PCI and MAC address properties
>> into qemu-storage-daemon and linux-user binaries...
> 
> I don't understand what enum functions have to do with PCI and
> MAC address properties.

My guess is that as get_enum()/set_enum()/set_default_value_enum()
are static, enum properties using it ended in this core file:

const PropertyInfo qdev_prop_bios_chs_trans = {
    .name = "BiosAtaTranslation",
    .description = "Logical CHS translation algorithm, "
                   "auto/none/lba/large/rechs",
    .enum_table = &BiosAtaTranslation_lookup,
    .get = get_enum,
    .set = set_enum,
    .set_default_value = set_default_value_enum,
};

const PropertyInfo qdev_prop_fdc_drive_type = {
    .name = "FdcDriveType",
    .description = "FDC drive type, "
                   "144/288/120/none/auto",
    .enum_table = &FloppyDriveType_lookup,
    .get = get_enum,
    .set = set_enum,
    .set_default_value = set_default_value_enum,
};

const PropertyInfo qdev_prop_pcie_link_speed = {
    .name = "PCIELinkSpeed",
    .description = "2_5/5/8/16",
    .enum_table = &PCIELinkSpeed_lookup,
    .get = get_prop_pcielinkspeed,
    .set = set_prop_pcielinkspeed,
    .set_default_value = set_default_value_enum,
};

Looking at qdev_prop_macaddr[] and qdev_prop_set_macaddr()
maybe I was remembering incorrectly, it seems this one can
be extracted easily.

Regards,

Phil.

