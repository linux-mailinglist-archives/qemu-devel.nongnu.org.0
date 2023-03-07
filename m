Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B00486ADCD3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:08:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVAP-0003lp-2E; Tue, 07 Mar 2023 06:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZVAM-0003ay-4q
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:07:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZVAJ-00029s-W9
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:07:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678187241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d3k1u/Geca9Wh03fryn16slek5asgRrPJXd6TgI1ZRE=;
 b=Q1tsF6zBjoSKE4JPCDKmLO8FdwT3MpvIzdr+dBZiEmKIjwDNgSTJ3UMxWxtZvextJRLETf
 0KsdJk8WHNyiRVUTDTRJx2S7kgwcJ0upCLp2sw1dBnDi0CkYbzurNyZCS0JPzKKUgqbr2H
 i5vIJFsrF9PjzykOeLLB26DnU/2/fm4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-i7j2BFEgN761EnQFDemJBA-1; Tue, 07 Mar 2023 06:07:12 -0500
X-MC-Unique: i7j2BFEgN761EnQFDemJBA-1
Received: by mail-wr1-f71.google.com with SMTP id
 d14-20020adfa34e000000b002bfc062eaa8so2128036wrb.20
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:07:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678187231;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d3k1u/Geca9Wh03fryn16slek5asgRrPJXd6TgI1ZRE=;
 b=ptjwS/X1qbtb30R3PHGIrr9Zaqm0OA7TbiNa3gh06mTCzWVuC8jJOMrNDc7MiFAyQQ
 wFbBcNS5r6PoLMwcvu/FM/AuUqRAyllcKL9tY4ZEHkLVMoVQghErTqebPIU7y/TbUeWC
 n++7/7cFxsn7AJC/jRX8QPaH/MhePskZ9vqjHg6OSLwfgkEprlTtHcPvgKyJKBUkfNC+
 qfhDJN2oHt7FT0LZWtxD8rHJufkaWqaAS4VIW2NNDw4tRieMm+1ykzGZHDaWoUfKLjgy
 wKMKq3UjYbwMKlLSfZrrKb83mITEdLWgXi8sL+kFpk3rfElG2bCg+k2GeDGXHsChuRWw
 SuGg==
X-Gm-Message-State: AO0yUKXKkp7f87usm2nTciiiPHsizp6lNs6oG0S6g4mo85PnKPJjlLqd
 iC2r4+oDLXAqNDS6s+VJpQlJB7PC9hLY8kel1gTLpVG+wFWp/qzYfZuSKfQulw2XUFI1twndknS
 S1Zxyipvzed8/MAU=
X-Received: by 2002:adf:d850:0:b0:2c5:a742:572f with SMTP id
 k16-20020adfd850000000b002c5a742572fmr8912516wrl.49.1678187231224; 
 Tue, 07 Mar 2023 03:07:11 -0800 (PST)
X-Google-Smtp-Source: AK7set9SEMa2u2mJehWpfbx9h/RneXpGzyPm3lTUlKWewTl1tUJy+/7fbawT4j7TR8L/R+HpRp/ruQ==
X-Received: by 2002:adf:d850:0:b0:2c5:a742:572f with SMTP id
 k16-20020adfd850000000b002c5a742572fmr8912502wrl.49.1678187230974; 
 Tue, 07 Mar 2023 03:07:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 j4-20020adfff84000000b002cda9aa1dc1sm12334931wrr.111.2023.03.07.03.07.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 03:07:10 -0800 (PST)
Message-ID: <f865312e-2f8c-c037-a8d2-34b82c8c1709@redhat.com>
Date: Tue, 7 Mar 2023 12:07:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 06/14] vfio/common: Consolidate skip/invalid section
 into helper
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Avihai Horon <avihaih@nvidia.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, qemu-devel@nongnu.org,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
 <20230307020258.58215-7-joao.m.martins@oracle.com>
 <8ef23f46-a5c7-2723-42e3-6f5efa7f993d@nvidia.com>
 <e9773720-77e5-4e93-3b24-e01dbbefc817@redhat.com>
 <4c6fad10-a71f-7b8f-87d5-09c57b0cfc70@oracle.com>
 <a7cfce4f-80a8-7af8-da29-1cea93d3ebbc@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <a7cfce4f-80a8-7af8-da29-1cea93d3ebbc@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 3/7/23 12:00, Joao Martins wrote:
> On 07/03/2023 10:22, Joao Martins wrote:
>> On 07/03/2023 09:47, Cédric Le Goater wrote:
>>> On 3/7/23 10:13, Avihai Horon wrote:
>>>> On 07/03/2023 4:02, Joao Martins wrote:
>>>>> External email: Use caution opening links or attachments
>>>>>
>>>>> The checks are replicated against region_add and region_del
>>>>> and will be soon added in another memory listener dedicated
>>>>> for dirty tracking.
>>>>>
>>>>> Move these into a new helper for avoid duplication.
>>>>>
>>>>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>>>>> Reviewed-by: Cédric Le Goater <clg@redhat.com>
>>>>> ---
>>>>>    hw/vfio/common.c | 52 +++++++++++++++++++-----------------------------
>>>>>    1 file changed, 21 insertions(+), 31 deletions(-)
>>>>>
>>>>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>>>>> index 99acb998eb14..54b4a4fc7daf 100644
>>>>> --- a/hw/vfio/common.c
>>>>> +++ b/hw/vfio/common.c
>>>>> @@ -933,23 +933,14 @@ static bool
>>>>> vfio_known_safe_misalignment(MemoryRegionSection *section)
>>>>>        return true;
>>>>>    }
>>>>>
>>>>> -static void vfio_listener_region_add(MemoryListener *listener,
>>>>> -                                     MemoryRegionSection *section)
>>>>> +static bool vfio_listener_valid_section(MemoryRegionSection *section)
>>>>>    {
>>>>> -    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>>>>> -    hwaddr iova, end;
>>>>> -    Int128 llend, llsize;
>>>>> -    void *vaddr;
>>>>> -    int ret;
>>>>> -    VFIOHostDMAWindow *hostwin;
>>>>> -    Error *err = NULL;
>>>>> -
>>>>>        if (vfio_listener_skipped_section(section)) {
>>>>>            trace_vfio_listener_region_add_skip(
>>>>>                    section->offset_within_address_space,
>>>>>                    section->offset_within_address_space +
>>>>>                    int128_get64(int128_sub(section->size, int128_one())));
>>>>
>>>> The original code uses two different traces depending on add or del --
>>>> trace_vfio_listener_region_{add,del}_skip.
>>>> Should we combine the two traces into a single trace? If the distinction is
>>>> important then maybe pass a flag or the caller name to indicate whether it's
>>>> add, del or dirty tracking update?
>>>
>>> I think introducing a new trace event 'trace_vfio_listener_region_skip'
>>> to replace 'trace_vfio_listener_region_add_skip' above should be enough.
>>>
>> OK, I'll introduce a predecessor patch to change the name.
>>
> 
> Albeit this trace_vfio_listener_region_skip will have a new argument which the
> caller passes e.g. region_add, region_skip, tracking_update.

yes. That's fine. The important part is to be able to select a family
of events with '-trace vfio_listener_region*'

Thanks,

C.


