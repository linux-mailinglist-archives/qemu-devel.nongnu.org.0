Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179A642E8B1
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 08:11:53 +0200 (CEST)
Received: from localhost ([::1]:44054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbGRZ-0003nS-UK
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 02:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mbGPf-0002on-E7
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 02:09:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mbGPb-0008UC-Ly
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 02:09:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634278186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FIxMGdfZIqe3h1udxbn3elKhhSGAI9jneq9LOLSak4g=;
 b=Kmlc4dIT3Rwn4SJ+rYqX4AtRdKpIE25sFf3gKX4W77V04wqjkZgqTC0oBp05OgVXiChcF6
 zQz8ZBdRRhUWUXKM+/4L/D2lMOTOayVCIyp9fdev290+TOQYrieNUQozw1e/7tFohLKhEA
 O6worOBa7E4Ng/Am7DigsEEuiWc+0F8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-UwBEQdRTO_i2mixUguDSkg-1; Fri, 15 Oct 2021 02:09:38 -0400
X-MC-Unique: UwBEQdRTO_i2mixUguDSkg-1
Received: by mail-wr1-f71.google.com with SMTP id
 r21-20020adfa155000000b001608162e16dso5491956wrr.15
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 23:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FIxMGdfZIqe3h1udxbn3elKhhSGAI9jneq9LOLSak4g=;
 b=Nzc0CfZDAY1ONy1Aw5i27CSQkfH108aZE5dojwq6goqzqSv/Nhrh4a1SrVQPU6FCy/
 hQwsAaH+5lzOGUcicaIUiLK17SlrXMUOs3cpKNih8GJxkImx4Fw+f0dtlJg0WM7oI3sz
 MH2u29mZQE8ptDXMl489E28PfFnzWof9EMG+PCzwBg0EOuObFyNfLCizm5nsyQ60dRwP
 o2SbZIUJ5JKvxrxDHOs/f71z+zCt3K0ysx++KCeLp9ZZjVNLUO0XEWGbshLWIFosU39S
 BOxVvEt3Xcgf74rHJeQwQYAz6XpEVJeZrwhA2p/5OWouq2VyTtyOTm1gDfRrQ7b1TKEk
 sE9w==
X-Gm-Message-State: AOAM531Xz2wgbSCsinLdY3I48lYrqPfIw4alIHWoxD+k4c7SxDSWBRaa
 gFGPNkfYdoTEccthdMy8zNw0JwJt7RbYZP0t3csv7U9SU71wL+uKakP81rdy0OK5V/qcx9qcOBI
 DY21nhFGpT++OTZs=
X-Received: by 2002:a1c:540e:: with SMTP id i14mr23777825wmb.100.1634278176936; 
 Thu, 14 Oct 2021 23:09:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyW3JymMNcPtE0oMILv6zt+MngbMNgWlAJvC3fyLy+NVGV5HOObR9Zj019FDx7unE4y0ZF4Eg==
X-Received: by 2002:a1c:540e:: with SMTP id i14mr23777791wmb.100.1634278176643; 
 Thu, 14 Oct 2021 23:09:36 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id n66sm3944815wmn.2.2021.10.14.23.09.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 23:09:36 -0700 (PDT)
Subject: Re: Is the ppc440 "bamboo" board in QEMU still of any use?
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>
References: <fc2e00d1-2373-3223-03c8-195585face66@redhat.com>
 <80f727b8-9eb0-6a49-e4a7-b2616583c43f@csgroup.eu>
 <2c5ec93d-d1d1-5f08-cbf0-513e101114df@kaod.org>
 <836a36f7-936b-ec36-f8e8-472bcec3970f@redhat.com>
 <25d90a22-63d9-6c15-5ee2-eadda449bcaf@redhat.com>
 <2b2e2d8e-caa5-8ea1-f7da-4b1bb20bd7bd@ilande.co.uk>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <38178271-70a4-7ddc-ab59-b777a49c8947@redhat.com>
Date: Fri, 15 Oct 2021 08:09:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <2b2e2d8e-caa5-8ea1-f7da-4b1bb20bd7bd@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, hpoussin@reactos.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/10/2021 17.58, Mark Cave-Ayland wrote:
> On 14/10/2021 16:37, Thomas Huth wrote:
> 
>> On 14/10/2021 17.26, Philippe Mathieu-Daudé wrote:
>>> On 10/14/21 13:29, Cédric Le Goater wrote:
>>>> On 10/14/21 12:34, Christophe Leroy wrote:
>>>
>>>>> I have the following change in QEMU to be able to run the bamboo,
>>>>> found it some time ago via google (can't remember where):
>>>>>
>>>>> diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
>>>>> index 8147ba6f94..600e89e791 100644
>>>>> --- a/hw/ppc/ppc4xx_pci.c
>>>>> +++ b/hw/ppc/ppc4xx_pci.c
>>>>> @@ -246,7 +246,7 @@ static int ppc4xx_pci_map_irq(PCIDevice *pci_dev,
>>>>> int irq_num)
>>>>>
>>>>>        trace_ppc4xx_pci_map_irq(pci_dev->devfn, irq_num, slot);
>>>>>
>>>>> -    return slot - 1;
>>>>> +    return slot ? slot - 1 : slot;
>>>>>    }
>>>>>
>>>>>    static void ppc4xx_pci_set_irq(void *opaque, int irq_num, int level)
>>>>
>>>> could you try to use :
>>>>
>>>> static inline int ppce500_pci_map_irq_slot(int devno, int irq_num)
>>>> {
>>>>      return (devno + irq_num) % 4;
>>>> }
>>>
>>> Is this pci_swizzle()?
>>
>> It's pci_swizzle, but I don't think that we should take irq_num into 
>> account here. The comment right in front of the function says:
>>
>>   On Bamboo, all pins from each slot are tied to a single board IRQ
>>
>> Similar comment in pc-bios/bamboo.dts:
>>
>>   Bamboo has all 4 IRQ pins tied together per slot
>>
>> So the return value should only depend on the slot number.
>>
>> Not sure how to properly fix this yet, though.
>>
>>   Thomas
>>
>>
>> PS: Found a working pre-compiled kernel for bamboo:
>> http://landley.net/aboriginal/downloads/binaries/system-image-powerpc-440fp.tar.gz 
>>
> 
> Hi Thomas,
> 
> Did you see my reply from earlier today? Last time I checked the backtrace 
> from the assert() it was coming via pci_update_irq_disabled() although 
> that's not to say that something else could have changed since the original 
> thread.

Yes, I saw it ... it's just that I'm still in process of digesting the 
problem here .... I'll reply to that mail later, when I feel more confident 
with the topic...

  Thomas


