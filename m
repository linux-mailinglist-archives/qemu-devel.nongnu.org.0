Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2554B6F131E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 10:16:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psJGm-0000QD-J0; Fri, 28 Apr 2023 04:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psJGg-0000Pk-Jy
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 04:15:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psJGe-0007MV-Oy
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 04:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682669747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G0uywQ45ufAXZfmAd2ESbJlam4XZWWSDCgJwPjPh8mY=;
 b=eiCoOIzkfVdmJuExIdkoNDoRVZW5hHfelcsetg6Y8ofLMU1lpXYsDWmT/k85rareXM82xY
 SKyO2rhqxhLhi7rBqJaLSPs0Gx6eXzbra1PJxtwGmg3hf5bXbU1SMDPCCs8RM32HRu0fmB
 GJld6ChRAruRWGSrB4tIdaBhlFQlDPU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-ccWnF64iOT-4JHpAU2WG5g-1; Fri, 28 Apr 2023 04:15:46 -0400
X-MC-Unique: ccWnF64iOT-4JHpAU2WG5g-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f19517536eso31699735e9.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 01:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682669745; x=1685261745;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G0uywQ45ufAXZfmAd2ESbJlam4XZWWSDCgJwPjPh8mY=;
 b=B5iKDtvouRF87hA9eYY7TYlK4E6liBl24FVEpE79QQAEW7X9h9TtYy0J15e+pc508d
 QEj4bH7cQslSwAxZQ75N0LRV+F3XvaNQWPIyKcsy1yw4hHraDMSF2CgLmQ2UcmQ/7ls8
 XJ6lyp0+DcyRxwN6GXsvojb96IjM2TfCi5ySpA90nX9gW4YtAnq2wBq1FzFZdin8RQEl
 Ahfip7Ywzs/9eGrbGMqK5UDSPHH9ZLhu21FyNywKfgtsmgBrulWSm9pYlrTWTkVP3BuK
 cbPhf4Rzpfq4wFmSjZMay7IVpQqkPFP3MiJGmd753gB3+oI+hJAe5Qi6ba67n7EAZwfg
 +DAw==
X-Gm-Message-State: AC+VfDwFCYdsfH9lL9E4wVsXz8iWDK5GDicOYqUuxRAa74FWOAzwmzUk
 By5TT9g3chEeSWUdB73Q0AOdDkkY+Y3rajongBUpiLgn4KivJGx7hJNTTK+PFS4flDPrTOa/ViF
 wgBwTFzEFRiXCvEE=
X-Received: by 2002:a1c:4c03:0:b0:3ef:acf6:f815 with SMTP id
 z3-20020a1c4c03000000b003efacf6f815mr3142994wmf.32.1682669744848; 
 Fri, 28 Apr 2023 01:15:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5QxWjrWOorp2q8va3jyvguqs9kg6VJnQCH7ohWNa72O+IcNUIZfwtgwtgD72fGjp+umlSVzA==
X-Received: by 2002:a1c:4c03:0:b0:3ef:acf6:f815 with SMTP id
 z3-20020a1c4c03000000b003efacf6f815mr3142966wmf.32.1682669744504; 
 Fri, 28 Apr 2023 01:15:44 -0700 (PDT)
Received: from [192.168.8.102] (tmo-098-235.customers.d1-online.com.
 [80.187.98.235]) by smtp.gmail.com with ESMTPSA id
 k25-20020a05600c081900b003f17122587bsm26937312wmp.36.2023.04.28.01.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 01:15:43 -0700 (PDT)
Message-ID: <828514c6-44f0-32f0-1eb1-a49f21617585@redhat.com>
Date: Fri, 28 Apr 2023 10:15:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v10 1/8] memory: prevent dma-reentracy issues
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>
References: <20230427211013.2994127-1-alxndr@bu.edu>
 <20230427211013.2994127-2-alxndr@bu.edu> <ZEt/3RwtL/jePTTv@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ZEt/3RwtL/jePTTv@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/04/2023 10.12, Daniel P. Berrangé wrote:
> On Thu, Apr 27, 2023 at 05:10:06PM -0400, Alexander Bulekov wrote:
>> Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
>> This flag is set/checked prior to calling a device's MemoryRegion
>> handlers, and set when device code initiates DMA.  The purpose of this
>> flag is to prevent two types of DMA-based reentrancy issues:
>>
>> 1.) mmio -> dma -> mmio case
>> 2.) bh -> dma write -> mmio case
>>
>> These issues have led to problems such as stack-exhaustion and
>> use-after-frees.
>>
>> Summary of the problem from Peter Maydell:
>> https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1282
>> Resolves: CVE-2023-0330
>>
>> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   include/exec/memory.h  |  5 +++++
>>   include/hw/qdev-core.h |  7 +++++++
>>   softmmu/memory.c       | 16 ++++++++++++++++
>>   3 files changed, 28 insertions(+)
>>
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index 15ade918ba..e45ce6061f 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -767,6 +767,8 @@ struct MemoryRegion {
>>       bool is_iommu;
>>       RAMBlock *ram_block;
>>       Object *owner;
>> +    /* owner as TYPE_DEVICE. Used for re-entrancy checks in MR access hotpath */
>> +    DeviceState *dev;
>>   
>>       const MemoryRegionOps *ops;
>>       void *opaque;
>> @@ -791,6 +793,9 @@ struct MemoryRegion {
>>       unsigned ioeventfd_nb;
>>       MemoryRegionIoeventfd *ioeventfds;
>>       RamDiscardManager *rdm; /* Only for RAM */
>> +
>> +    /* For devices designed to perform re-entrant IO into their own IO MRs */
>> +    bool disable_reentrancy_guard;
>>   };
>>   
>>   struct IOMMUMemoryRegion {
>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>> index bd50ad5ee1..7623703943 100644
>> --- a/include/hw/qdev-core.h
>> +++ b/include/hw/qdev-core.h
>> @@ -162,6 +162,10 @@ struct NamedClockList {
>>       QLIST_ENTRY(NamedClockList) node;
>>   };
>>   
>> +typedef struct {
>> +    bool engaged_in_io;
>> +} MemReentrancyGuard;
>> +
>>   /**
>>    * DeviceState:
>>    * @realized: Indicates whether the device has been fully constructed.
>> @@ -194,6 +198,9 @@ struct DeviceState {
>>       int alias_required_for_version;
>>       ResettableState reset;
>>       GSList *unplug_blockers;
>> +
>> +    /* Is the device currently in mmio/pio/dma? Used to prevent re-entrancy */
>> +    MemReentrancyGuard mem_reentrancy_guard;
>>   };
>>   
>>   struct DeviceListener {
>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>> index b1a6cae6f5..fe23f0e5ce 100644
>> --- a/softmmu/memory.c
>> +++ b/softmmu/memory.c
>> @@ -542,6 +542,18 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>>           access_size_max = 4;
>>       }
>>   
>> +    /* Do not allow more than one simultaneous access to a device's IO Regions */
>> +    if (mr->dev && !mr->disable_reentrancy_guard &&
>> +        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
>> +        if (mr->dev->mem_reentrancy_guard.engaged_in_io) {
>> +            warn_report("Blocked re-entrant IO on "
>> +                    "MemoryRegion: %s at addr: 0x%" HWADDR_PRIX,
>> +                    memory_region_name(mr), addr);
>> +            return MEMTX_ACCESS_ERROR;
> 
> If we issue this warn_report on every invalid memory access, is this
> going to become a denial of service by flooding logs, or is the
> return MEMTX_ACCESS_ERROR, sufficient to ensure this is only printed
> *once* in the lifetime of the QEMU process ?

Maybe it's better to use warn_report_once() here instead?

  Thomas



