Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE53D33F56F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:27:02 +0100 (CET)
Received: from localhost ([::1]:52838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZ0f-0005Vy-U4
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMYyH-00042m-7U
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:24:34 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMYyE-0001RL-LS
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:24:33 -0400
Received: by mail-wr1-x431.google.com with SMTP id x16so2455120wrn.4
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 09:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2XBZo1EepJp1qNq/nN2gPs4S1770HomlZ+9VmDBgIMI=;
 b=gSgN6dO0yoymkbkSQSepH+UTTdSjNXC2kXv07oCmdplEbggAvZtkwiUTwT0FZuKMCK
 b81hybpuHGbuR5wQoyTotCRA6roqUWcsQxqe4fWXCaocP0DcFlHInOGz8OLv8+juzpcP
 4W0ZdWjWwX9+MHPRCtpgAnyjOJsxRj+EouiL/mjzhawx9kNX2wd/66w9WB3RUUm/Pu3f
 4na81qRv+4FoS5Sbaq2Ci0oxMHQuFgf8igAv92dnlRAC5iENyzb3wQAjwKXtZ4oFl9jB
 E3Bncsi3Ci/b0EyhLeR1oK4xz570Sw52ITZDEoin2BM2J4K9DLnjtvsNXj6pcfDH8OSx
 Di/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2XBZo1EepJp1qNq/nN2gPs4S1770HomlZ+9VmDBgIMI=;
 b=gyjJQ7W5UyY58pcy8AGYUAHRR2siFmd+Pb0AG1iH+EhK6fJ6+K/y5bygsrepLN8YiB
 UFsDF5vDNQz9PHmDSwGDkP67lzo3hlzeAnt8GWWcrGRgGezpnEwhE2xcUa/k7hXCK/sU
 wB3j1t8yziIgGjTJAfuuwu053OuoOOa7uDalOAJMAzvmHVZe785QKSkZ8BazV8ChzIdI
 Nhr2u9d3q623eCYNod5nybUfR2GTZFwJXkP1CS8fzIcI9ZN7S4KWFiSWsifHL+gx34ee
 zs8aK7pkI1gCY63ARN5265gNIoXaHWU8vkIQirXn86rZkiM8GanC6ncfasuDjz3joswt
 byJg==
X-Gm-Message-State: AOAM5333K2gFgJHK6jtPnK/oRTUJyRqyWgLAMmH+03YmFTsDTZlq4vOg
 mqogUTA1nt1v8Rn5j9+8H8U=
X-Google-Smtp-Source: ABdhPJx3T/Vd1OY3DpJan9PV3wCTbRk9JO6je7a82+pTjMGe5YlLrNRVgHWeTScUag599tkXxhRwmA==
X-Received: by 2002:adf:9d82:: with SMTP id p2mr5346355wre.234.1615998267229; 
 Wed, 17 Mar 2021 09:24:27 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id n23sm27054181wra.71.2021.03.17.09.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 09:24:25 -0700 (PDT)
Subject: Re: [RFC PATCH 5/8] qtest/libqos: Restrict CPU I/O instructions
To: Laszlo Ersek <lersek@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210314232913.2607360-1-f4bug@amsat.org>
 <20210314232913.2607360-6-f4bug@amsat.org>
 <b1dc01eb-0090-e47e-2731-c1920d9cda42@redhat.com>
 <66630c68-d8ff-45ca-24e6-bbef1fc566ee@linaro.org>
 <235ffc43-288b-85aa-29f9-8f23e596674b@amsat.org>
 <b5d2af4c-9288-91cd-5352-4ef1dff18742@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <01d3a3b3-ae23-e292-839d-27bda71324c2@amsat.org>
Date: Wed, 17 Mar 2021 17:24:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <b5d2af4c-9288-91cd-5352-4ef1dff18742@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 4:59 PM, Laszlo Ersek wrote:
> On 03/16/21 16:55, Philippe Mathieu-Daudé wrote:
>> Hi Richard and Laszlo,
>>
>> On 3/16/21 4:43 PM, Richard Henderson wrote:
>>> On 3/16/21 9:37 AM, Laszlo Ersek wrote:
>>>> (+Peter, comment below)
>>>>
>>>> On 03/15/21 00:29, Philippe Mathieu-Daudé wrote:
>>>>> Restrict CPU I/O instructions to architectures providing
>>>>> I/O bus.
>>>>>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>> ---
>>>>>   tests/qtest/libqos/fw_cfg.h | 3 +++
>>>>>   tests/qtest/libqos/fw_cfg.c | 2 ++
>>>>>   2 files changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/tests/qtest/libqos/fw_cfg.h b/tests/qtest/libqos/fw_cfg.h
>>>>> index c6a7cf8cf05..3bfb6d6d55b 100644
>>>>> --- a/tests/qtest/libqos/fw_cfg.h
>>>>> +++ b/tests/qtest/libqos/fw_cfg.h
>>>>> @@ -36,6 +36,8 @@ size_t qfw_cfg_get_file(QFWCFG *fw_cfg, const char
>>>>> *filename,
>>>>>     QFWCFG *mm_fw_cfg_init(QTestState *qts, uint64_t base);
>>>>>   void mm_fw_cfg_uninit(QFWCFG *fw_cfg);
>>>>> +
>>>>> +#ifdef TARGET_HAS_IOPORT
>>>>>   QFWCFG *io_fw_cfg_init(QTestState *qts, uint16_t base);
>>>>>   void io_fw_cfg_uninit(QFWCFG *fw_cfg);
>>>>>   @@ -48,6 +50,7 @@ static inline void pc_fw_cfg_uninit(QFWCFG *fw_cfg)
>>>>>   {
>>>>>       io_fw_cfg_uninit(fw_cfg);
>>>>>   }
>>>>> +#endif /* TARGET_HAS_IOPORT */
>>>>>     G_DEFINE_AUTOPTR_CLEANUP_FUNC(QFWCFG, mm_fw_cfg_uninit)
>>>>>   diff --git a/tests/qtest/libqos/fw_cfg.c b/tests/qtest/libqos/fw_cfg.c
>>>>> index 6b8e1babe51..db2b83f5212 100644
>>>>> --- a/tests/qtest/libqos/fw_cfg.c
>>>>> +++ b/tests/qtest/libqos/fw_cfg.c
>>>>> @@ -131,6 +131,7 @@ void mm_fw_cfg_uninit(QFWCFG *fw_cfg)
>>>>>       g_free(fw_cfg);
>>>>>   }
>>>>>   +#ifdef TARGET_HAS_IOPORT
>>>>>   static void io_fw_cfg_select(QFWCFG *fw_cfg, uint16_t key)
>>>>>   {
>>>>>       qtest_outw(fw_cfg->qts, fw_cfg->base, key);
>>>>> @@ -162,3 +163,4 @@ void io_fw_cfg_uninit(QFWCFG *fw_cfg)
>>>>>   {
>>>>>       g_free(fw_cfg);
>>>>>   }
>>>>> +#endif /* TARGET_HAS_IOPORT */
>>>>>
>>>>
>>>> I'm not sure the macro name is ideal; the PCI host on aarch64/"virt"
>>>> emulates IO Ports (it's possible to allocate PCI IO resources on
>>>> "virt"). From patch#3, TARGET_HAS_IOPORT does not seem to extend to
>>>> arm64.
>>>
>>> Correct, aarch64 has memory-mapped pci io resources, they are not on a
>>> separate ioport address space as for x86 and avr.
>>
>> I first wrote TARGET_CPU_HAS_IOPORT but realized architecture
>> and CPU are linked, so I elided _CPU_.
>>
>> What I'd like to clear from the QTest API is the idea that the CPU has
>> direct access to the I/O bus via I/O specific instructions.
>>
>> Any machine able to use a host <-> PCI bus chipset is able to access
>> the I/O function from the PCI bus.
>>
>> The fact that on X86 the first PCI function is wired to the same I/O
>> bus than the CPU is a machine implementation detail.
>>
>> When accessing PCI I/O ressources on Aarch64, you don't have to use
>> dedicated I/O instructions.
>>
>> Anyway for now Thomas discarded this series, as QTest is a generic API,
>> and we never had to worry about mixing address spaces so far, so not in
>> a hurry to clean this (although it would be useful to change address
>> space to access DMA or secure-CPU-view from QTest).
> 
> If this is about an "IO Bus" or "IO instructions", then we should call
> the macro TARGET_HAS_IO_BUS or "TARGET_ISA_HAS_IO" (or
> "TARGET_HAS_IO_INSNS"), or something like those. My only confusion was
> about the "IO Port" expression in the macro name; the idea is OK from my
> perspective otherwise.

TARGET_HAS_IO_BUS / TARGET_HAS_IO_INSNS LGTM
(ISA bus is not particularly relevant for the AVR target).

Thanks for the feedback :)

