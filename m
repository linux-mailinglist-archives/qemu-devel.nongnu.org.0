Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E5240C3B9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 12:41:21 +0200 (CEST)
Received: from localhost ([::1]:52522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQSLw-00035z-01
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 06:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mQS4P-0005nF-T2
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:23:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mQS4L-00046M-Et
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:23:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631701387;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OlL2WavbiM7lIu2HJd9aFm9kvuYuO3weLlLt/dqtyG0=;
 b=FP3noySUYoI9NgUjn1a5TEE8I92wizPfJZOfXdJyW1ATHe9pLWS6rzxXmAHue6h8XJRndV
 TFtugv/s99FvTVTiNiL5CGTXvxaVTqbDs5oW8Z5hu/26Y9Z9DdTAdaCZpr+6n5B9xL19g1
 bxxzBC2YMhWvw1DP6Ox7K/djaynMrr0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-XEx3X191NNWP3IiJIZ8u9Q-1; Wed, 15 Sep 2021 06:23:06 -0400
X-MC-Unique: XEx3X191NNWP3IiJIZ8u9Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 c15-20020a5d4ccf000000b0015dff622f39so830699wrt.21
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 03:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=OlL2WavbiM7lIu2HJd9aFm9kvuYuO3weLlLt/dqtyG0=;
 b=zLVmSflmH+JzQYZ4ESmkL2uDVOFEbjMCyxdFv9VCA6b/mm/mBVJK3hJGd2yFbja/Wf
 CcVxZk2zYmGHLkyYrTo4Unxo4Rv9EXptaeS1qBBpq9Cn/Jl1iOOrgNyxTisNWFk/9tGP
 TRXEppoADxyyii9Qz3MTbaA4Ty8YdrAf3dfUIY0vjgiKxdKQcghcC6hhwBeoTTjE62gk
 OoZqefg9JGUpM4GTwJEn4CschPHaUywg2ckZsifljlqC/+zPuzAoPPB2VF2foCy2Tt3C
 N1lqh6a7K3daapfJoLs/kdIeR12nzkiXziA4RtB05Teex1ffyYkoNg1tKWO7SkXzq9Vw
 t67w==
X-Gm-Message-State: AOAM531BM1RzNGnRsD6S2tt7cvCf2p+6v53z+9peFYaOMbIXmzIqv3bK
 NVN/PputVer1PraQ5rIF/TrGtpuN0iCkeOZIivNHIUwjh2lM7pG+jmqq+sm4dLmBJQcb3Eax4Wb
 gRbDku5DlCNQ0AU3pBcND3D8B4OfWLSTMwEfG0In0wU7f3JZfoG2cHu0Hf1RYvajplrBSrw==
X-Received: by 2002:a5d:4bc8:: with SMTP id l8mr4229031wrt.105.1631701384628; 
 Wed, 15 Sep 2021 03:23:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5W36X67NQlf7LcdvTgoTwZTjL23K8Rx7eKjnaipRj8LlhsdrWRjYAbQpqIfDSIeE2tZItYA==
X-Received: by 2002:a5d:4bc8:: with SMTP id l8mr4229003wrt.105.1631701384370; 
 Wed, 15 Sep 2021 03:23:04 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id h16sm13113525wre.52.2021.09.15.03.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 03:23:03 -0700 (PDT)
Subject: Re: SMMU Stage 2 translation in QEMU
To: shashi.mallela@linaro.org, Peter Maydell <peter.maydell@linaro.org>
References: <bac0b38fc7c5f7a5a1c91784eb7236de39b6f18a.camel@linaro.org>
 <CAFEAcA-k8=M5KQWoJ=yurAZuHt9=F9mb002Z=7T_EC6x5EP95w@mail.gmail.com>
 <909bcf70ba8d88d485ec0b36371633e54edef81c.camel@linaro.org>
 <CAFEAcA8=7-hHEHyABS-FFPtacYvhFpwa7_PLVsC7-x_5rxjicg@mail.gmail.com>
 <e8ccd74e89ba9d30d8588f0aa6966dc71d0ae923.camel@linaro.org>
 <f788c9de-17be-025a-a723-c7ba86548970@redhat.com>
 <b73156aeb1817ee46e79f73abd2ac22326c3a07b.camel@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <c7b3b0af-5415-d7cd-7741-90af6aefbbc1@redhat.com>
Date: Wed, 15 Sep 2021 12:23:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b73156aeb1817ee46e79f73abd2ac22326c3a07b.camel@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Shashi,

On 9/14/21 5:57 PM, shashi.mallela@linaro.org wrote:
> Hi Eric,
> On Mon, 2021-09-13 at 10:19 +0200, Eric Auger wrote:
>> Hi Shashi,
>>
>> On 9/10/21 3:32 PM, shashi.mallela@linaro.org wrote:
>>> So that would be the driver code running in guest OS because i see
>>> tables being setup by arm-smmu driver code in linux,which is
>>> similar to
>>> what happens with ITS(table base addresses programmed in registers
>>> by
>>> linux driver).
>> Stage2 SMMU tables are generally not used today. Only stage 1 is
>> used,
>> even with VFIO (with KVM).
> The stage 2 SMMU capability is required for qemu sbsa reference
> platform to satisfy the sbsa level 3 acs(arm compliance suite)
> requirements.
>
>> SMMUv3 upstream driver does not support S1+S2 (nested). It only
>> supports
>> either S1 or S2. Enabling S2 can be done through VFIO driver, if you
>> select the VFIO_TYPE1_NESTING_IOMMU IOMMU type. This then calls IOMMU
>> .enable_nesting  = arm_smmu_enable_nesting which sets smmu_domain-
>>> stage
>> = ARM_SMMU_DOMAIN_NESTED. But the name is misleading as it actually
>> forces the use of S2 instead of S1.
>>
>> However if you look at QEMU VFIO code, no one uses
>> VFIO_TYPE1_NESTING_IOMMU.
> Since the current smmuv3 implementation in qemu advertises only stage 1
> support,from the qemu device point of view is the stage 2 support
> included in the integration effort you mentioned or does it need to be
> taken up from scratch?

no it needs to be handled from scratch in emulation mode. My integration
efforts were dedicated to physical SMMU nested stage enablement.

Thanks

Eric
>> Note I have worked on 2 stage integration for years, without much
>> success yet:
>> [RFC v9 00/29] vSMMUv3/pSMMUv3 2 stage VFIO integration
>>
>> [PATCH v15 00/12] SMMUv3 Nested Stage Setup (IOMMU part)
>> [PATCH v13 00/13] SMMUv3 Nested Stage Setup (VFIO part)
>>
>>
>> Thanks
>>
>> Eric
>>> On Fri, 2021-09-10 at 13:54 +0100, Peter Maydell wrote:
>>>> On Fri, 10 Sept 2021 at 13:39, <shashi.mallela@linaro.org> wrote:
>>>>> I am referring to the latter,"purely emulated QEMU with an
>>>>> emulated
>>>>> SMMU that handles accesses to emulated devices"
>>>> In that case, the stage 2 tables are set up by the guest
>>>> code (running at emulated EL2), just as they would be if
>>>> it were running on real hardware.
>>>>
>>>> -- PMM


