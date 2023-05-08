Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7706FA36B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 11:34:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvxF9-0002WU-Q8; Mon, 08 May 2023 05:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pvxF3-0002Rq-Jn
 for qemu-devel@nongnu.org; Mon, 08 May 2023 05:33:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pvxEy-0004ic-MA
 for qemu-devel@nongnu.org; Mon, 08 May 2023 05:33:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683538386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7dSrMDc89dlDyunJYxbEJMSCVtez/eRUpQBWGgV6TnU=;
 b=eDzZnHU1cwwUar/+gSnOX7skxfq5mAD9DKo7dxh0qDsezaHIRvSc8eLsaEvzjHH+Uwtvf6
 4e4j+mYFGqmP1EFurdgtRu248DWQ0x4Q0SGhx9nI3j0ht8niV1vba1RYZdzUSKLJ1kXxaa
 iGymQ6nCNTQFA8aUQLEJjckm/jtBwmE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-8ympW2mnO7OKNuHF-GJwTg-1; Mon, 08 May 2023 05:33:05 -0400
X-MC-Unique: 8ympW2mnO7OKNuHF-GJwTg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30629b36d9bso1578445f8f.0
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 02:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683538384; x=1686130384;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7dSrMDc89dlDyunJYxbEJMSCVtez/eRUpQBWGgV6TnU=;
 b=Rb2LWpRxfRvNraKYd1eYCNRwJ5yqaOGZkamxqXJXwyNN/Z9xOaN2ZwWhmXTudNcNRH
 iaFAvAyvZbzorFlc0UXfzqngC3Gv32ha2/1tyrQXzyzKcb9RrblbFA1qGgbrQJZPnDsk
 4uF5VHdVabjuBz8U6YqPvSiA4mXkNvLFQf46wL/0+41N/63Z4gwM8kq47Lz9BBpzfkZ2
 VciGwLWuF+cs7ku9r/ukgU4JQ3c0dtEfhpTymJLAQBbcyF9ixVxJSmFNBjT8jVqT7JSC
 1NVRhmxdMz6us8gsQB2Um/x1vepl26Fk7EHNMqC5HX6U6xz+egvN3lRajU4mV5HOabtZ
 /OyQ==
X-Gm-Message-State: AC+VfDx3z8relFmwrmZyd4+I1AlOjTFpnhCyQe3VgtVtS/8X+U3Th+0X
 UxjiwYMRN2muizCuMle0hac1gtCexSSTfnojGdvaFV9kBPWjEpdfCTPtW8ZMnLapj6aZLNFnRSt
 qKCUsDxOhS/rb4zA=
X-Received: by 2002:adf:ef47:0:b0:2f0:e287:1fbc with SMTP id
 c7-20020adfef47000000b002f0e2871fbcmr6243811wrp.11.1683538383873; 
 Mon, 08 May 2023 02:33:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4h1q7lJ49jwKVkV8nmiN8y5ybQPoOWYgnWsjKU2MAImhRJYif3iQ5KuoOy2n2pdXYf+pOD0w==
X-Received: by 2002:adf:ef47:0:b0:2f0:e287:1fbc with SMTP id
 c7-20020adfef47000000b002f0e2871fbcmr6243781wrp.11.1683538383532; 
 Mon, 08 May 2023 02:33:03 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-212.web.vodafone.de.
 [109.43.179.212]) by smtp.gmail.com with ESMTPSA id
 r10-20020a056000014a00b00307972e46fasm2421582wrx.107.2023.05.08.02.33.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 02:33:02 -0700 (PDT)
Message-ID: <981cdcd7-7326-08f0-9882-e66840175205@redhat.com>
Date: Mon, 8 May 2023 11:33:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v10 1/8] memory: prevent dma-reentracy issues
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, Alexander Bulekov <alxndr@bu.edu>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
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
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>, maobibo@loongson.cn,
 Tianrui Zhao <zhaotianrui@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230427211013.2994127-1-alxndr@bu.edu>
 <20230427211013.2994127-2-alxndr@bu.edu> <ZEt/3RwtL/jePTTv@redhat.com>
 <828514c6-44f0-32f0-1eb1-a49f21617585@redhat.com>
 <20230428091159.haydefdtq4m6z2tz@mozz.bu.edu>
 <b151ecf7-0544-86ac-a182-1112a4dd7dca@redhat.com>
 <c01a2b87-27be-e92a-3a5b-d561eadbc516@loongson.cn>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <c01a2b87-27be-e92a-3a5b-d561eadbc516@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.964, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 06/05/2023 11.25, Song Gao wrote:
>   Hi Alexander
> 
> 在 2023/4/28 下午5:14, Thomas Huth 写道:
>> On 28/04/2023 11.11, Alexander Bulekov wrote:
>>> On 230428 1015, Thomas Huth wrote:
>>>> On 28/04/2023 10.12, Daniel P. Berrangé wrote:
>>>>> On Thu, Apr 27, 2023 at 05:10:06PM -0400, Alexander Bulekov wrote:
>>>>>> Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
>>>>>> This flag is set/checked prior to calling a device's MemoryRegion
>>>>>> handlers, and set when device code initiates DMA.  The purpose of this
>>>>>> flag is to prevent two types of DMA-based reentrancy issues:
>>>>>>
>>>>>> 1.) mmio -> dma -> mmio case
>>>>>> 2.) bh -> dma write -> mmio case
>>>>>>
>>>>>> These issues have led to problems such as stack-exhaustion and
>>>>>> use-after-frees.
>>>>>>
>>>>>> Summary of the problem from Peter Maydell:
>>>>>> https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com
>>>>>>
>>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
>>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
>>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
>>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
>>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
>>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
>>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1282
>>>>>> Resolves: CVE-2023-0330
>>>>>>
>>>>>> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
>>>>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>>>> ---
>>>>>>    include/exec/memory.h  |  5 +++++
>>>>>>    include/hw/qdev-core.h |  7 +++++++
>>>>>>    softmmu/memory.c       | 16 ++++++++++++++++
>>>>>>    3 files changed, 28 insertions(+)
>>>>>>
>>>>>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>>>>>> index 15ade918ba..e45ce6061f 100644
>>>>>> --- a/include/exec/memory.h
>>>>>> +++ b/include/exec/memory.h
>>>>>> @@ -767,6 +767,8 @@ struct MemoryRegion {
>>>>>>        bool is_iommu;
>>>>>>        RAMBlock *ram_block;
>>>>>>        Object *owner;
>>>>>> +    /* owner as TYPE_DEVICE. Used for re-entrancy checks in MR access 
>>>>>> hotpath */
>>>>>> +    DeviceState *dev;
>>>>>>        const MemoryRegionOps *ops;
>>>>>>        void *opaque;
>>>>>> @@ -791,6 +793,9 @@ struct MemoryRegion {
>>>>>>        unsigned ioeventfd_nb;
>>>>>>        MemoryRegionIoeventfd *ioeventfds;
>>>>>>        RamDiscardManager *rdm; /* Only for RAM */
>>>>>> +
>>>>>> +    /* For devices designed to perform re-entrant IO into their own 
>>>>>> IO MRs */
>>>>>> +    bool disable_reentrancy_guard;
>>>>>>    };
>>>>>>    struct IOMMUMemoryRegion {
>>>>>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>>>>>> index bd50ad5ee1..7623703943 100644
>>>>>> --- a/include/hw/qdev-core.h
>>>>>> +++ b/include/hw/qdev-core.h
>>>>>> @@ -162,6 +162,10 @@ struct NamedClockList {
>>>>>>        QLIST_ENTRY(NamedClockList) node;
>>>>>>    };
>>>>>> +typedef struct {
>>>>>> +    bool engaged_in_io;
>>>>>> +} MemReentrancyGuard;
>>>>>> +
>>>>>>    /**
>>>>>>     * DeviceState:
>>>>>>     * @realized: Indicates whether the device has been fully constructed.
>>>>>> @@ -194,6 +198,9 @@ struct DeviceState {
>>>>>>        int alias_required_for_version;
>>>>>>        ResettableState reset;
>>>>>>        GSList *unplug_blockers;
>>>>>> +
>>>>>> +    /* Is the device currently in mmio/pio/dma? Used to prevent 
>>>>>> re-entrancy */
>>>>>> +    MemReentrancyGuard mem_reentrancy_guard;
>>>>>>    };
>>>>>>    struct DeviceListener {
>>>>>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>>>>>> index b1a6cae6f5..fe23f0e5ce 100644
>>>>>> --- a/softmmu/memory.c
>>>>>> +++ b/softmmu/memory.c
>>>>>> @@ -542,6 +542,18 @@ static MemTxResult 
>>>>>> access_with_adjusted_size(hwaddr addr,
>>>>>>            access_size_max = 4;
>>>>>>        }
>>>>>> +    /* Do not allow more than one simultaneous access to a device's 
>>>>>> IO Regions */
>>>>>> +    if (mr->dev && !mr->disable_reentrancy_guard &&
>>>>>> +        !mr->ram_device && !mr->ram && !mr->rom_device && 
>>>>>> !mr->readonly) {
>>>>>> +        if (mr->dev->mem_reentrancy_guard.engaged_in_io) {
>>>>>> +            warn_report("Blocked re-entrant IO on "
>>>>>> +                    "MemoryRegion: %s at addr: 0x%" HWADDR_PRIX,
>>>>>> +                    memory_region_name(mr), addr);
>>>>>> +            return MEMTX_ACCESS_ERROR;
>>>>>
>>>>> If we issue this warn_report on every invalid memory access, is this
>>>>> going to become a denial of service by flooding logs, or is the
>>>>> return MEMTX_ACCESS_ERROR, sufficient to ensure this is only printed
>>>>> *once* in the lifetime of the QEMU process ?
>>>>
>>>> Maybe it's better to use warn_report_once() here instead?
>>>
>>> Sounds good - should I respin the series to change this?
>>
>> Not necessary, I've got v10 already queued, I'll fix it up there
>>
>>  Thomas
>>
> This patch causes the loongarch virtual machine to fail to start the slave cpu.
> 
>      ./build/qemu-system-loongarch64 -machine virt -m 8G -cpu la464 \
>               -smp 4 -bios QEMU_EFI.fd -kernel vmlinuz.efi -initrd ramdisk   \
>                 -serial stdio   -monitor telnet:localhost:4495,server,nowait  \
>                 -append "root=/dev/ram rdinit=/sbin/init 
> console=ttyS0,115200"   --nographic
> 
> 
> ....
> qemu-system-loongarch64: warning: Blocked re-entrant IO on MemoryRegion: 
> loongarch_ipi_iocsr at addr: 0x24

Oh, another spot that needs special handling ... I see Alexander already 
sent a patch (thanks!), but anyway, this is a good indication that we're 
missing some test coverage in the CI.

Are there any loongarch kernel images available for public download 
somewhere? If so, we really should add an avocado regression test for this - 
since as far as I can see, we don't have any  tests for loongarch in 
tests/avocado yet?

  Thomas


