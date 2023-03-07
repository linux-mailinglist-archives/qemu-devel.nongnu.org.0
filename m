Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E99376ADAE6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 10:49:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZTv3-0002Kp-H4; Tue, 07 Mar 2023 04:47:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZTuz-00029b-5V
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 04:47:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZTux-00068o-2H
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 04:47:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678182453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fqryn8p3MAeKlZLiejRsWrGd4P9KZ0/k/nNn/0XeeXk=;
 b=icaIgSHs6ORcjBtm3UUPYX0V7E6D9NIz/j88y/2wVAsyw5mfXSXvBHhldITS6fy80dtKSa
 DsYbBvpmKNfFul1i9abeu6XKSPXJ63ZfeS8xQY1gfgLUGcWxEO7G0w4sBGb0EzqIuBtVK5
 4kpzLw5EwfP77elgKUcmRR0e6zqvmzw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-T9KNymEoMD21kkYzJBaGmA-1; Tue, 07 Mar 2023 04:47:32 -0500
X-MC-Unique: T9KNymEoMD21kkYzJBaGmA-1
Received: by mail-qk1-f198.google.com with SMTP id
 d4-20020a05620a166400b00742859d0d4fso7071173qko.15
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 01:47:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678182452;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fqryn8p3MAeKlZLiejRsWrGd4P9KZ0/k/nNn/0XeeXk=;
 b=roL/ksNGk3WkSZQ+K7F9zSQXCWtNsL3lOFrHdkeuqCf2qLeJu7OEUyESluFBAa15cP
 LoEfSw9xvdSWf3S5gfyAgDK+6f3mk1YcIOpBb6cXkrdmIB/zpx59iREqGeg4svWJpsYV
 lIAIvl+W8+mx8KFEPJ6a79gIwdt5TtNTJ9+nmldtOxSufgCnmcA4a+lishD5eCdvWPT4
 eFVjn32b+5rhqzpbIeYzrNK7VRxsR1ocPPdZXK1RhFRsaEJxMBYEH/5gHzlrWt6afCAw
 dn9t4qnvlFsNMEMoG7NU71CgmBo/1WtW8+DXjXeKBQtFngX0gS2lY43mjDS7yNT3Gksu
 FVaQ==
X-Gm-Message-State: AO0yUKVpzSH5ixb5s7r8o3UMvclvXNBQbYh7qWBM7EhPiVjmkr86x7E6
 4cK7k6lQDSGrscHYZ5a7p2uQ4IEekvs5419Sg3gh33085VTrIyJMDAfhF1wXTiAL983RFtg1tr/
 53twQnRR4hSojrhI=
X-Received: by 2002:ac8:5b8c:0:b0:3bf:e214:942d with SMTP id
 a12-20020ac85b8c000000b003bfe214942dmr22117213qta.21.1678182452053; 
 Tue, 07 Mar 2023 01:47:32 -0800 (PST)
X-Google-Smtp-Source: AK7set/aDv4NE6d8WA6HZQLtW+pzRlQkkqkmDu92L6QwTnkRv4aLKEZpwZwophrHTiqSGUd/5f2scA==
X-Received: by 2002:ac8:5b8c:0:b0:3bf:e214:942d with SMTP id
 a12-20020ac85b8c000000b003bfe214942dmr22117196qta.21.1678182451765; 
 Tue, 07 Mar 2023 01:47:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 y8-20020ac85248000000b003b86b962030sm9391273qtn.72.2023.03.07.01.47.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 01:47:31 -0800 (PST)
Message-ID: <e9773720-77e5-4e93-3b24-e01dbbefc817@redhat.com>
Date: Tue, 7 Mar 2023 10:47:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 06/14] vfio/common: Consolidate skip/invalid section
 into helper
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
 <20230307020258.58215-7-joao.m.martins@oracle.com>
 <8ef23f46-a5c7-2723-42e3-6f5efa7f993d@nvidia.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <8ef23f46-a5c7-2723-42e3-6f5efa7f993d@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
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

On 3/7/23 10:13, Avihai Horon wrote:
> 
> On 07/03/2023 4:02, Joao Martins wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> The checks are replicated against region_add and region_del
>> and will be soon added in another memory listener dedicated
>> for dirty tracking.
>>
>> Move these into a new helper for avoid duplication.
>>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> Reviewed-by: Cédric Le Goater <clg@redhat.com>
>> ---
>>   hw/vfio/common.c | 52 +++++++++++++++++++-----------------------------
>>   1 file changed, 21 insertions(+), 31 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 99acb998eb14..54b4a4fc7daf 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -933,23 +933,14 @@ static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
>>       return true;
>>   }
>>
>> -static void vfio_listener_region_add(MemoryListener *listener,
>> -                                     MemoryRegionSection *section)
>> +static bool vfio_listener_valid_section(MemoryRegionSection *section)
>>   {
>> -    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>> -    hwaddr iova, end;
>> -    Int128 llend, llsize;
>> -    void *vaddr;
>> -    int ret;
>> -    VFIOHostDMAWindow *hostwin;
>> -    Error *err = NULL;
>> -
>>       if (vfio_listener_skipped_section(section)) {
>>           trace_vfio_listener_region_add_skip(
>>                   section->offset_within_address_space,
>>                   section->offset_within_address_space +
>>                   int128_get64(int128_sub(section->size, int128_one())));
> 
> The original code uses two different traces depending on add or del -- trace_vfio_listener_region_{add,del}_skip.
> Should we combine the two traces into a single trace? If the distinction is important then maybe pass a flag or the caller name to indicate whether it's add, del or dirty tracking update?

I think introducing a new trace event 'trace_vfio_listener_region_skip'
to replace 'trace_vfio_listener_region_add_skip' above should be enough.

Thanks,

C.

> 
> But other than that:
> 
> Reviewed-by: Avihai Horon <avihaih@nvidia.com>
> 
> Thanks.
> 
>> -        return;
>> +        return false;
>>       }
>>
>>       if (unlikely((section->offset_within_address_space &
>> @@ -964,6 +955,24 @@ static void vfio_listener_region_add(MemoryListener *listener,
>>                            section->offset_within_region,
>>                            qemu_real_host_page_size());
>>           }
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>> +static void vfio_listener_region_add(MemoryListener *listener,
>> +                                     MemoryRegionSection *section)
>> +{
>> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>> +    hwaddr iova, end;
>> +    Int128 llend, llsize;
>> +    void *vaddr;
>> +    int ret;
>> +    VFIOHostDMAWindow *hostwin;
>> +    Error *err = NULL;
>> +
>> +    if (!vfio_listener_valid_section(section)) {
>>           return;
>>       }
>>
>> @@ -1182,26 +1191,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
>>       int ret;
>>       bool try_unmap = true;
>>
>> -    if (vfio_listener_skipped_section(section)) {
>> -        trace_vfio_listener_region_del_skip(
>> -                section->offset_within_address_space,
>> -                section->offset_within_address_space +
>> -                int128_get64(int128_sub(section->size, int128_one())));
>> -        return;
>> -    }
>> -
>> -    if (unlikely((section->offset_within_address_space &
>> -                  ~qemu_real_host_page_mask()) !=
>> -                 (section->offset_within_region & ~qemu_real_host_page_mask()))) {
>> -        if (!vfio_known_safe_misalignment(section)) {
>> -            error_report("%s received unaligned region %s iova=0x%"PRIx64
>> -                         " offset_within_region=0x%"PRIx64
>> -                         " qemu_real_host_page_size=0x%"PRIxPTR,
>> -                         __func__, memory_region_name(section->mr),
>> -                         section->offset_within_address_space,
>> -                         section->offset_within_region,
>> -                         qemu_real_host_page_size());
>> -        }
>> +    if (!vfio_listener_valid_section(section)) {
>>           return;
>>       }
>>
>> -- 
>> 2.17.2
>>
> 


