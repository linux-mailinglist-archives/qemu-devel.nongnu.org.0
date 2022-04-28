Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3DE512D57
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 09:51:57 +0200 (CEST)
Received: from localhost ([::1]:42628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njywN-0004jB-Sr
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 03:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1njyYJ-0004am-Bh
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 03:27:04 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:38810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1njyYG-0001TE-Dt
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 03:27:02 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so5023076pjb.3
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 00:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YY0J5984yIxE+f1+BvpcaMrQk2LUwsluaoN6BXBjpV8=;
 b=CSsajBAYY6XkcGIAEsVhpfzNWU/QEigxtT2hmNbEGKuX7Ar9WAPJDUGjOD155U9ZS9
 F9B9hYc/SfUGx5FNzGoNB9Jb3d+y/hJ7AjLm7RjsTWbdodoLVEbiMuFVnlq7prlsbRCg
 tc07hSirrpi2JmJH2bQlk7LEx9BFVEo3BuyRdaYFilTas4ihJF3LmrPDqauPoHYdgqji
 cmHQW68/bpbIv8QhE99MZ/wIukRbxFF8r87ukxZTt4ELYuP4Kgzd4INKfR0+OxrJk/Df
 YmP1AWQSxr4KIkQ9fubfRZxSUoSHlRTjIaHr1AmrH+myeTZJI8PFsWtchGdT3BYUWgMP
 bT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YY0J5984yIxE+f1+BvpcaMrQk2LUwsluaoN6BXBjpV8=;
 b=sAG0i4k8Q+AnoyUPw0ZWEhpVPn5Nif1nUu0MfOijLWpgjk55Bijy10rDdUggyNuRhu
 j8RjKiNdStKgSJbCkcwomtDnIp231/n2dW6SY865sED1Mt1w7gP8B1LHlHUpR64Vpmaj
 6ERTGIHgwS1fh60MBXJBscKlfOSL5wnkG7KTOxNjoUibK2Mwpgdg+KMq3E4XUbhik5dh
 YJWWl7ejPjBap8YZTNIi7JtE/Y+qE4NvEc7HssaEQS1ZV99TAOr8mieXjjNNOA0GHTB2
 qBHlBvzrQyRQbkBzT97QZjxKw6TO+k6eSo/a6i6QLaH9z336H2lKzGHL556iCGdz6jLl
 BKKA==
X-Gm-Message-State: AOAM533hrSLXwOIQheXmfIG1cCpF7kRtehUq94R50Qaz10aDgFQVIyQF
 QUvz3GtB+FMTLnjUHpN+3KdtOg==
X-Google-Smtp-Source: ABdhPJzPN9K1pZj2jH+XIax1R8KnNf37GNg5aMZEYzWj2BeRNd1NtAsn2WOp0PUqSmhcHQ7gPn1ecQ==
X-Received: by 2002:a17:903:32d2:b0:15d:478c:8b46 with SMTP id
 i18-20020a17090332d200b0015d478c8b46mr9448352plr.127.1651130817257; 
 Thu, 28 Apr 2022 00:26:57 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 l5-20020a056a0016c500b004f768db4c94sm22075080pfc.212.2022.04.28.00.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 00:26:56 -0700 (PDT)
Message-ID: <b490310d-debb-fd92-73cd-de9558157098@ozlabs.ru>
Date: Thu, 28 Apr 2022 17:26:51 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: [PATCH qemu] spapr_pci: Disable IRQFD resampling on XIVE
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
References: <20220427043651.1162403-1-aik@ozlabs.ru>
 <880cdd91-3a4a-8c35-1357-d3858950db44@kaod.org>
 <5fa3c59b-de8e-c428-43f1-eb4d698e835a@ozlabs.ru>
 <fcb5a8c0-385b-29c6-4573-6ee09f36a9e4@kaod.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <fcb5a8c0-385b-29c6-4573-6ee09f36a9e4@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/28/22 16:25, Cédric Le Goater wrote:
> On 4/28/22 07:32, Alexey Kardashevskiy wrote:
>>
>>
>> On 4/27/22 17:36, Cédric Le Goater wrote:
>>> Hello Alexey,
>>>
>>> On 4/27/22 06:36, Alexey Kardashevskiy wrote:
>>>> VFIO-PCI has an "KVM_IRQFD_FLAG_RESAMPLE" optimization for INTx EOI
>>>> handling when KVM can unmask PCI INTx (level triggered interrupt) 
>>>> without
>>>> switching to the userspace (==QEMU).
>>>>
>>>> Unfortunately XIVE does not support level interrupts, 
>>>
>>> That's not correctly phrased I think.
>>
>>
>> My bad, I meant "XIVE hardware".
> 
> ok. It makes more sense.
> 
> PSIHB and PHBs have internal latches to maintain the assertion level.
> XIVE has none.
> 
> 
>>
>>>
>>> The QEMU XIVE device support LSIs but the POWER9 kernel-irqchips,
>>> KVM XICS-on-XIVE and XIVE native devices, are broken with respect
>>> to passthrough adapters using INTx.
>>>
>>>
>>>> QEMU emulates them
>>>> and therefore there is no existing code path to kick the resamplefd.
>>>> The problem appears when passing through a PCI adapter with
>>>> the "pci=nomsi" kernel parameter - the adapter's interrupt interrupt
>>>> count in /proc/interrupts will stuck at "1".
>>>>
>>>> This disables resampler when the XIVE interrupt controller is 
>>>> configured.
>>>> This should not be very visible though KVM already exits to QEMU for 
>>>> INTx
>>>> and XIVE-capable boxes (POWER9 and newer) do not seem to have
>>>> performance-critical INTx-only capable devices.
>>>>
>>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>> ---
>>>>
>>>>
>>>> Cédric, this is what I meant when I said that spapr_pci.c was 
>>>> unaware of
>>>> the interrupt controller type, neither xics nor xive was mentioned
>>>> in the file before.
>>>>
>>>>
>>>> ---
>>>>   hw/ppc/spapr_pci.c | 14 +++++++++++---
>>>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
>>>> index 5bfd4aa9e5aa..2675052601db 100644
>>>> --- a/hw/ppc/spapr_pci.c
>>>> +++ b/hw/ppc/spapr_pci.c
>>>> @@ -729,11 +729,19 @@ static void pci_spapr_set_irq(void *opaque, 
>>>> int irq_num, int level)
>>>>   static PCIINTxRoute spapr_route_intx_pin_to_irq(void *opaque, int 
>>>> pin)
>>>>   {
>>>> +    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
>>>>       SpaprPhbState *sphb = SPAPR_PCI_HOST_BRIDGE(opaque);
>>>> -    PCIINTxRoute route;
>>>> +    PCIINTxRoute route = { .mode = PCI_INTX_DISABLED };
>>>> -    route.mode = PCI_INTX_ENABLED;
>>>> -    route.irq = sphb->lsi_table[pin].irq;
>>>> +    /*
>>>> +     * Disable IRQFD resampler on XIVE as it does not support LSI 
>>>> and QEMU
>>>> +     * emulates those so the KVM kernel resamplefd kick is skipped 
>>>> and EOI
>>>> +     * is not delivered to VFIO-PCI.
>>>> +     */
>>>> +    if (!spapr->xive) {
>>>
>>> This is testing the availability of the XIVE interrupt mode, but not
>>> the activate controller. See spapr_irq_init() which is called very
>>> early in the machine initialization.
>>>
>>> Is that what we want ? Is everything fine if we start the machine with
>>> ic-mode=xics ? On a POWER9 host, this would use the KVM XICS-on-XIVE
>>> device which is broken also AFAICT.
>>
>> I should probably fix that in KVM, just not quite sure yet how for the 
>> realmode handlers, or just drop those on P9 and then the fix is trivial.
>>
>>
>>> You should extend the SpaprInterruptControllerClass (for a routine) or
>>> simply SpaprIrq (for a bool) if you need to handle IRQ matters from a
>>> device model.
>>
>> It is a property of KVM rather than the interrupt controller so it 
>> probably makes more sense to just stop advertising 
>> KVM_CAP_IRQFD_RESAMPLE. Hmmm...
> 
> I would fix the realmode handlers of the the KVM XICS-on-XIVE device
> first. The problem has been there for a while.


Are they really used on POWER9? TCE ones are not.


> Then, for the XIVE native mode, I would simply handle it at the QEMU
> level with a 'resample' bool in SpaprIrq. It  would be tested in spapr
> pci when configuring the INTx routing.


But there is a dedicated CAP advertised by the KVM already which is not 
correct as we know that KVM won't resample.


> 
> 
> Thanks,
> 
> C.
> 

