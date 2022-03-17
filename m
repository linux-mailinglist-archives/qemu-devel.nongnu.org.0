Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B62C4DC98A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 16:04:27 +0100 (CET)
Received: from localhost ([::1]:44784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUrft-0004Qd-R0
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 11:04:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nUrDT-0001He-EB
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:35:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nUrDP-0001Vd-Nl
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:35:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647527698;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6n4y9hEBD5o3MsbkSN8vCJn/ITjJz4WS9pHtIyWkuCw=;
 b=NnWpTgXs/fKHgSweft4KYfOs6AQdkHkCikw753RsfSlgWle9hxkP8x9zGYhlBa3pDDgW4y
 +P5RjrpLdM9HL7bQ96wVdIEdfXjag+UCrcHmkwqiiBISaelok17Yvb76kCiRuyhOOQgKqb
 aGkluaq91YiBJ0j6lzuCHO3cXa1g4gU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-jjQY_wboMtWDjm3ULAeBNQ-1; Thu, 17 Mar 2022 10:34:57 -0400
X-MC-Unique: jjQY_wboMtWDjm3ULAeBNQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k41-20020a05600c1ca900b00389a2b983efso1716737wms.4
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 07:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=6n4y9hEBD5o3MsbkSN8vCJn/ITjJz4WS9pHtIyWkuCw=;
 b=sqijAHPCysfO8ycU4F99soC/VV11TxjnENRsnQGz2y+2+SYgm8ch3jaln3fAcdXQhj
 395dpOL7LsymFI7XnY7Mlol9wofm5wA5LzxqAOWCVhdKcJb8GsaiEg5wlcfWdVdKZNea
 LADRdRhFOBx7XYJzpnd9BV/RXGsUj4yTBzcRjMXmohEq3sbfn6MRlF4Wq5JtHFUnc2zc
 LvqZ2SiYKLeegSGs8LEwzT/vhVKQojMcmtKFJYgrWYF1z4Woa0WYIsbl8ch3w7jiPRL6
 Bi900pX6Kzb5eVG7o2vgFnr3Y4wc/GwfJ1ySqfX5UULDfehaCILjGkRSZ25W8z5pod17
 Y2rA==
X-Gm-Message-State: AOAM532kh5bmF7vZGGL0zEIQ+zKKPkmwKMh16kpWc8PYQIYZFv43b52B
 VAWOQeaNnpivYJiIp9YHKUyC5/7Tj3+eZ1ddBhUlx21KzNZubYr5Nc1pqoGWyj7RL1vm/AeSI4R
 WUxOJwMWef66cZ4M=
X-Received: by 2002:adf:e78a:0:b0:203:8acf:4a65 with SMTP id
 n10-20020adfe78a000000b002038acf4a65mr4319278wrm.660.1647527696107; 
 Thu, 17 Mar 2022 07:34:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpp7CC8tonrbWZRff7HzMDOQTJDlbddWVpWOD+032khq/OxAzSyEgAsRF91YRtqspxtRoG2Q==
X-Received: by 2002:adf:e78a:0:b0:203:8acf:4a65 with SMTP id
 n10-20020adfe78a000000b002038acf4a65mr4319257wrm.660.1647527695819; 
 Thu, 17 Mar 2022 07:34:55 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a1c5456000000b00389a558670fsm7672037wmi.11.2022.03.17.07.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 07:34:55 -0700 (PDT)
Subject: Re: [PATCH for-7.1] vfio/common: remove spurious tpm-crb-cmd
 misalignment warning
To: Alex Williamson <alex.williamson@redhat.com>
References: <20220316202951.294860-1-eric.auger@redhat.com>
 <20220316170818.5b4f0032.alex.williamson@redhat.com>
 <826be3d2-8403-5d8f-9eee-f58b15bc1c32@redhat.com>
 <20220317082315.0a293120.alex.williamson@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <0ea966f3-d53f-3a43-9d02-36f4907eb000@redhat.com>
Date: Thu, 17 Mar 2022 15:34:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220317082315.0a293120.alex.williamson@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, stefanb@linux.vnet.ibm.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On 3/17/22 3:23 PM, Alex Williamson wrote:
> On Thu, 17 Mar 2022 14:57:30 +0100
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> Hi Alex,
>>
>> On 3/17/22 12:08 AM, Alex Williamson wrote:
>>> On Wed, 16 Mar 2022 21:29:51 +0100
>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>  
>>>> The CRB command buffer currently is a RAM MemoryRegion and given
>>>> its base address alignment, it causes an error report on
>>>> vfio_listener_region_add(). This region could have been a RAM device
>>>> region, easing the detection of such safe situation but this option
>>>> was not well received. So let's add a helper function that uses the
>>>> memory region name to recognize the region and detect the situation
>>>> is safe wrt assignment. Other regions can be listed here if such kind
>>>> of problem occurs again.
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>> ---
>>>>  hw/vfio/common.c     | 26 +++++++++++++++++++++++++-
>>>>  hw/vfio/trace-events |  1 +
>>>>  2 files changed, 26 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>>>> index 080046e3f51..b58a38f5c57 100644
>>>> --- a/hw/vfio/common.c
>>>> +++ b/hw/vfio/common.c
>>>> @@ -861,6 +861,22 @@ static void vfio_unregister_ram_discard_listener(VFIOContainer *container,
>>>>      g_free(vrdl);
>>>>  }
>>>>  
>>>> +static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
>>>> +{
>>>> +    MemoryRegion *mr = section->mr;
>>>> +
>>>> +    if (strcmp(memory_region_name(mr), "tpm-crb-cmd") != 0) {
>>>> +        return false;
>>>> +    }  
>>> Hi Eric,
>>>
>>> I was thinking more along the lines that we could use
>>> memory_region_owner() to get the owning Object, then on
>>> that we could maybe use INTERFACE_CHECK to look for TYPE_MEMORY_DEVICE,
>>> then consider anything else optional.  (a) could something like that
>>> work and (b) do all required mappings currently expose that interface?
>>> Thanks,  
>> If I understand correctly you just want to error_report() misalignement
>> of MR sections belonging to
>>
>> TYPE_MEMORY_DEVICE devices and silence the rest? Is that a correct
>> understanding? I thought you wanted to be much more protective and
>> ignore misalignments on a case by case basis hence the white listing
>> of this single tpm-crb-cmd region.
> Ah right, so I'm just slipping back into what we currently do, fail for
> memory and warn on devices, which would be a generally reasonable long
> term plan except people file bugs about those warnings.  Crud.
>
> I guess I don't have a better idea than creating essentially an
> exception list like this.  Do you think it's better to do the strcmp
> for the specific memory region or would it maybe be sufficient to test
> the owner object is TYPE_TPM_CRB?  Thanks,
I asked myself the question and eventually chose to be more conservative
with the granularity of the MR. Sometimes objects own several MRs and I
wondered if some misalignments could be considered as safe while others
unsafe, within the same object.  Nevertheless I don't have a strong
opinion and will respin according to your preferencee.

Thanks

Eric
>
> Alex
>
>>>> +
>>>> +    /* this is a known safe misaligned region, just trace for
>>>> debug purpose */
>>>> +    trace_vfio_known_safe_misalignment(memory_region_name(mr),
>>>> +
>>>> section->offset_within_address_space,
>>>> +
>>>> section->offset_within_region,
>>>> +                                       qemu_real_host_page_size);
>>>> +    return true;
>>>> +}
>>>> +
>>>>  static void vfio_listener_region_add(MemoryListener *listener,
>>>>                                       MemoryRegionSection *section)
>>>>  {
>>>> @@ -884,7 +900,15 @@ static void
>>>> vfio_listener_region_add(MemoryListener *listener, if
>>>> (unlikely((section->offset_within_address_space &
>>>> ~qemu_real_host_page_mask) != (section->offset_within_region &
>>>> ~qemu_real_host_page_mask))) {
>>>> -        error_report("%s received unaligned region", __func__);
>>>> +        if (!vfio_known_safe_misalignment(section)) {
>>>> +            error_report("%s received unaligned region %s
>>>> iova=0x%"PRIx64
>>>> +                         " offset_within_region=0x%"PRIx64
>>>> +                         " qemu_real_host_page_mask=0x%"PRIxPTR,
>>>> +                         __func__,
>>>> memory_region_name(section->mr),
>>>> +                         section->offset_within_address_space,
>>>> +                         section->offset_within_region,
>>>> +                         qemu_real_host_page_mask);
>>>> +        }
>>>>          return;
>>>>      }
>>>>  
>>>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>>>> index 0ef1b5f4a65..6f38a2e6991 100644
>>>> --- a/hw/vfio/trace-events
>>>> +++ b/hw/vfio/trace-events
>>>> @@ -100,6 +100,7 @@ vfio_listener_region_add_skip(uint64_t start,
>>>> uint64_t end) "SKIPPING region_add vfio_spapr_group_attach(int
>>>> groupfd, int tablefd) "Attached groupfd %d to liobn fd %d"
>>>> vfio_listener_region_add_iommu(uint64_t start, uint64_t end)
>>>> "region_add [iommu] 0x%"PRIx64" - 0x%"PRIx64
>>>> vfio_listener_region_add_ram(uint64_t iova_start, uint64_t
>>>> iova_end, void *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64"
>>>> [%p]" +vfio_known_safe_misalignment(const char *name, uint64_t
>>>> iova, uint64_t offset_within_region, uint64_t page_size) "Region
>>>> \"%s\" iova=0x%"PRIx64" offset_within_region=0x%"PRIx64"
>>>> qemu_real_host_page_mask=0x%"PRIxPTR ": cannot be mapped for DMA"
>>>> vfio_listener_region_add_no_dma_map(const char *name, uint64_t
>>>> iova, uint64_t size, uint64_t page_size) "Region \"%s\"
>>>> 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and
>>>> cannot be mapped for DMA" vfio_listener_region_del_skip(uint64_t
>>>> start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
>>>> vfio_listener_region_del(uint64_t start, uint64_t end) "region_del
>>>> 0x%"PRIx64" - 0x%"PRIx64  


