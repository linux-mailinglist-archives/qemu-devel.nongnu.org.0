Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800C66ECB89
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 13:47:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqufP-0003bZ-9S; Mon, 24 Apr 2023 07:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pquea-0003TM-GS
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:46:45 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqueY-0002fi-AG
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:46:44 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-63b73203e0aso27016638b3a.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 04:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682336800; x=1684928800;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cB9WyhkUrZoJuh9ZOweBxBrkPCI3lM6+0WFqa9sWD8s=;
 b=WEt8ix8vumWolhi9RZN7trgmLIXT3smgoTYyJWjqot9HwZWI2Kg9qI86h2115BrU+x
 jjbQ8cNflRM8VxVazLBSPEbHDcCcM6c2hufNAFYXJHFjDma7vUdjeT0FLLR6tVJvSFUF
 ZiO2r+2zuJsGEITmOmkO0Sw/yDHyVeJW9KseTRfs7FC32R5d2chHdd4N7B44o/AU5P2Z
 OUzW37FylWve8IMZY6vbJHim7z2OIiALOqS302wdPHYze6ksDseNVBW1wtH+ksIe6/4X
 u78+52LYWufOJNyUK03rKDqDlAXVtXQXsxBm6sSh6+eJFp/7n5LtNCMVGsGeXBbfR5LH
 2kEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682336800; x=1684928800;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cB9WyhkUrZoJuh9ZOweBxBrkPCI3lM6+0WFqa9sWD8s=;
 b=JiFSIppVr9nJC6amHlU/TAw1mKX92dgV/T5fyPILjLZy2cYmsjHDjWyoaKW5MEK1yl
 gZUxHFtSVlDI2XZxduvoHLlSJr1IwSTa104egsjezXjW6/40dqPsE4THnIh4j+bvPYm+
 CjRcKUDbiTxVoJv5rFSefH747SAz8DVigBNqZK2+B1JPH0bV19GgAyUxak+zYQZzuQ31
 m6H5gBkaB7OmePRKblZfpQC6JPX5fmIr00xlWm9IMjcJ2dEhjUpB0IYnzrHKPvgaqM7s
 D7MI5R9gNmkLBlk729UfaptV21KamwOYvVm/8RB24Xmb/g9sfvRPb0Ci/BSuIz90nZgK
 Ky6Q==
X-Gm-Message-State: AAQBX9eY5nDuE99WmpDW1WP6fS5M3o/3XPPzFTshnCBy8I+izOv4pqus
 TXRFs0ToZVNANeVIP1+BJGFiMA==
X-Google-Smtp-Source: AKy350blKUGa3ONCHUplVbLZ9kJ/oEosyCatfFTeP4fFuS2BkA/Mmn9J5yXcR39hEGpEonlplMw/ZA==
X-Received: by 2002:a17:902:c94f:b0:1a9:6604:2b1b with SMTP id
 i15-20020a170902c94f00b001a966042b1bmr6295002pla.20.1682336800522; 
 Mon, 24 Apr 2023 04:46:40 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a17090282c200b001a4edbabad3sm6489548plz.230.2023.04.24.04.46.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 04:46:40 -0700 (PDT)
Message-ID: <b5bd6556-ede4-645e-bcab-1f9054cf7c24@daynix.com>
Date: Mon, 24 Apr 2023 20:46:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 06/47] igb: Clear IMS bits when committing ICR access
Content-Language: en-US
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
 <20230423041833.5302-7-akihiko.odaki@daynix.com>
 <DBBP189MB1433159BD5A688E92C00BA8595679@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
 <410c76a1-8d1d-1835-6676-83e913f5ae24@daynix.com>
 <DBBP189MB1433E2751780BD4162D85FE195679@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <DBBP189MB1433E2751780BD4162D85FE195679@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.194, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2023/04/24 20:23, Sriram Yagnaraman wrote:
> 
>> -----Original Message-----
>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Sent: Monday, 24 April 2023 12:52
>> To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
>> Cc: Jason Wang <jasowang@redhat.com>; Dmitry Fleytman
>> <dmitry.fleytman@gmail.com>; Michael S . Tsirkin <mst@redhat.com>; Alex
>> Bennée <alex.bennee@linaro.org>; Philippe Mathieu-Daudé
>> <philmd@linaro.org>; Thomas Huth <thuth@redhat.com>; Wainer dos Santos
>> Moschetta <wainersm@redhat.com>; Beraldo Leal <bleal@redhat.com>;
>> Cleber Rosa <crosa@redhat.com>; Laurent Vivier <lvivier@redhat.com>; Paolo
>> Bonzini <pbonzini@redhat.com>; qemu-devel@nongnu.org; Tomasz Dzieciol
>> <t.dzieciol@partner.samsung.com>
>> Subject: Re: [PATCH v3 06/47] igb: Clear IMS bits when committing ICR access
>>
>> On 2023/04/24 18:29, Sriram Yagnaraman wrote:
>>>> -----Original Message-----
>>>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>> Sent: Sunday, 23 April 2023 06:18
>>>> Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>; Jason Wang
>>>> <jasowang@redhat.com>; Dmitry Fleytman <dmitry.fleytman@gmail.com>;
>>>> Michael S . Tsirkin <mst@redhat.com>; Alex Bennée
>>>> <alex.bennee@linaro.org>; Philippe Mathieu-Daudé <philmd@linaro.org>;
>>>> Thomas Huth <thuth@redhat.com>; Wainer dos Santos Moschetta
>>>> <wainersm@redhat.com>; Beraldo Leal <bleal@redhat.com>; Cleber Rosa
>>>> <crosa@redhat.com>; Laurent Vivier <lvivier@redhat.com>; Paolo
>>>> Bonzini <pbonzini@redhat.com>; qemu-devel@nongnu.org; Tomasz
>> Dzieciol
>>>> <t.dzieciol@partner.samsung.com>; Akihiko Odaki
>>>> <akihiko.odaki@daynix.com>
>>>> Subject: [PATCH v3 06/47] igb: Clear IMS bits when committing ICR
>>>> access
>>>>
>>>> The datasheet says contradicting statements regarding ICR accesses so
>>>> it is not reliable to determine the behavior of ICR accesses.
>>>> However, e1000e does clear IMS bits when reading ICR accesses and
>>>> Linux also expects ICR accesses will clear IMS bits according to:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr
>>>> ee/drivers/
>>>> net/ethernet/intel/igb/igb_main.c?h=v6.2#n8048
>>>>
>>>> Fixes: 3a977deebe ("Intrdocue igb device emulation")
>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>> ---
>>>>    hw/net/igb_core.c | 8 ++++----
>>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c index
>>>> 96a118b6c1..eaca5bd2b6 100644
>>>> --- a/hw/net/igb_core.c
>>>> +++ b/hw/net/igb_core.c
>>>> @@ -2452,16 +2452,16 @@ igb_set_ims(IGBCore *core, int index,
>>>> uint32_t
>>>> val)  static void igb_commit_icr(IGBCore *core)  {
>>>>        /*
>>>> -     * If GPIE.NSICR = 0, then the copy of IAM to IMS will occur only if at
>>>> +     * If GPIE.NSICR = 0, then the clear of IMS will occur only if
>>>> + at
>>>>         * least one bit is set in the IMS and there is a true interrupt as
>>>>         * reflected in ICR.INTA.
>>>>         */
>>>>        if ((core->mac[GPIE] & E1000_GPIE_NSICR) ||
>>>>            (core->mac[IMS] && (core->mac[ICR] & E1000_ICR_INT_ASSERTED))) {
>>>> -        igb_set_ims(core, IMS, core->mac[IAM]);
>>>> -    } else {
>>>> -        igb_update_interrupt_state(core);
>>>> +        igb_clear_ims_bits(core, core->mac[IAM]);
>>>>        }
>>>> +
>>>> +    igb_update_interrupt_state(core);
>>>>    }
>>>>
>>>>    static void igb_set_icr(IGBCore *core, int index, uint32_t val)
>>>> --
>>>> 2.40.0
>>>
>>> Reviewed-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
>>>
>>> An additional question, should ICR be cleared if an actual interrupt was
>> asserted?
>>> (According to 7.3.2.11 GPIE: Non Selective Interrupt clear on read:
>>> When set, every read of ICR clears it. When this bit is cleared, an ICR read
>> causes it to be cleared only if an actual interrupt was asserted or IMS = 0b.)
>> Something like this?
>>
>> That is handled in igb_commit_icr(), which is renamed to igb_nsicr() in patch
>> "igb: Notify only new interrupts".
>>
> 
> Mm, I must be missing something, but I still don't see the ICR bits being cleared igb_commit_icr/igb_nsicr().
> For e.g. e1000e_mac_icr_read does this explicitly:
>      if ((core->mac[ICR] & E1000_ICR_ASSERTED) &&
>          (core->mac[CTRL_EXT] & E1000_CTRL_EXT_IAME)) {
>          trace_e1000e_irq_icr_clear_iame();
>          core->mac[ICR] = 0;
>          trace_e1000e_irq_icr_process_iame();
>          e1000e_clear_ims_bits(core, core->mac[IAM]);
>      }

Now I get it. This is indeed missing and needs to be handled, just as 
you suggested.

> 
> 
>>>
>>> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c index
>>> eaca5bd2b6..aaaf80e4a3 100644
>>> --- a/hw/net/igb_core.c
>>> +++ b/hw/net/igb_core.c
>>> @@ -2529,6 +2529,9 @@ igb_mac_icr_read(IGBCore *core, int index)
>>>        } else if (core->mac[IMS] == 0) {
>>>            trace_e1000e_irq_icr_clear_zero_ims();
>>>            core->mac[ICR] = 0;
>>> +    } else if (core->mac[ICR] & E1000_ICR_INT_ASSERTED) {
>>> +        e1000e_irq_icr_clear_iame();
>>> +        core->mac[ICR] = 0;
>>>        } else if (!msix_enabled(core->owner)) {
>>>            trace_e1000e_irq_icr_clear_nonmsix_icr_read();
>>>            core->mac[ICR] = 0;

