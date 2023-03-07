Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E256C6ADD37
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:24:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVQc-0004Bl-05; Tue, 07 Mar 2023 06:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZVQa-0004Ba-GM
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:24:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZVQY-0004ks-LZ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:24:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678188257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hGW6gMXtl1N1AurIVkjT6BB0KoHI9jcM+KQyGOmdB3M=;
 b=iRMvXpGZKR6BnqdbS6bZZnIid0wvhEJWIxom0kmf929hKmBCnX4bDUUffLe7kviKXk/uud
 GjanQVS/tO9xfo+MGgAChZY48fpsPKoRHmjBHmi1NaCVw/rjaBuZYJiPsyOD7bPUAvRQ+G
 L+hwnBg6bHwcWSiIhCpIa3RZWj8SftE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-JQ6z0PdIMWC0AqfQlN3bCg-1; Tue, 07 Mar 2023 06:24:16 -0500
X-MC-Unique: JQ6z0PdIMWC0AqfQlN3bCg-1
Received: by mail-wm1-f72.google.com with SMTP id
 az12-20020a05600c600c00b003e8910ec2fdso4674002wmb.6
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:24:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678188255;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hGW6gMXtl1N1AurIVkjT6BB0KoHI9jcM+KQyGOmdB3M=;
 b=WvtBgrW8DrHlQu/qTECE9w2GMD66cj917z9GRuKlV0RWUpaKl5j5AjedSkvWd/RQJh
 pBlgCmjVZHFezoRzdoGllroAfZrcaHUJwpDHH7xWzF3oRs/DRdKhqh4xNDLoIqfZNiyG
 alrJCN5izNFQQFVO7w+VxYi9FrquIOssuTlqYlpzqUcchQPijwv2/5Ctx4NmkaF7cDMS
 A4/jJfNIw5XwZg4YlqTjYHVJSsWQdkqT/6Mf4FgwmIRVQo4uw42e6J/h+iYn+YASEjd0
 tirGhN4S4QBClqtUMix12/POEH88ZTkhlXF/Skjg0X9GbX4hOZwInr1r53VDKx7lei6k
 sjBA==
X-Gm-Message-State: AO0yUKX04d96Oc//aoCxxhfbvhFNhrmFJdWrwNfqYKLdPW4ikK7dUzKS
 FXsA1zML1m1uOnp2qq28RhPftNDpGC6JhRmBBTwvoVRi8smWp4o375riAwGEHj9vprQozPoePzT
 CR8dcIEcO/I9Cj08=
X-Received: by 2002:a05:6000:128a:b0:2c7:17a0:c6b5 with SMTP id
 f10-20020a056000128a00b002c717a0c6b5mr9626956wrx.34.1678188254793; 
 Tue, 07 Mar 2023 03:24:14 -0800 (PST)
X-Google-Smtp-Source: AK7set+MeRZRSNUz8rPqt2FlFtaMS47vqRBgE6xnITDmgO1lJ4fLwBFWbZLQ8Pa1EYgRfzuA87BFsQ==
X-Received: by 2002:a05:6000:128a:b0:2c7:17a0:c6b5 with SMTP id
 f10-20020a056000128a00b002c717a0c6b5mr9626936wrx.34.1678188254415; 
 Tue, 07 Mar 2023 03:24:14 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:a100:e20:41da:c49b:8974?
 (p200300cbc707a1000e2041dac49b8974.dip0.t-ipconnect.de.
 [2003:cb:c707:a100:e20:41da:c49b:8974])
 by smtp.gmail.com with ESMTPSA id
 z1-20020adff1c1000000b002c70c99db74sm12379651wro.86.2023.03.07.03.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 03:24:14 -0800 (PST)
Message-ID: <9159ed0c-4d09-a633-813c-11b8c72fbf9b@redhat.com>
Date: Tue, 7 Mar 2023 12:24:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 2/2] vhost: Remove vhost_backend_can_merge() callback
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20230216114752.198627-1-david@redhat.com>
 <20230216114752.198627-3-david@redhat.com>
 <20230307112548.062b068d@imammedo.users.ipa.redhat.com>
 <20230307121644.755438a3@imammedo.users.ipa.redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230307121644.755438a3@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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

On 07.03.23 12:16, Igor Mammedov wrote:
> On Tue, 7 Mar 2023 11:25:48 +0100
> Igor Mammedov <imammedo@redhat.com> wrote:
> 
>> On Thu, 16 Feb 2023 12:47:52 +0100
>> David Hildenbrand <david@redhat.com> wrote:
>>
>>> Checking whether the memory regions are equal is sufficient: if they are
>>> equal, then most certainly the contained fd is equal.
>> sounds reasonable to me.
>>
>>>
>>> The whole vhost-user memslot handling is suboptimal and overly
>>> complicated. We shouldn't have to lookup a RAM memory regions we got
>>> notified about in vhost_user_get_mr_data() using a host pointer. But that
>>
>> While on janitor duty can you fixup following?
>>
>> vhost_user_get_mr_data() -> memory_region_from_host ->
>>   -> qemu_ram_block_from_host()
>> for qemu_ram_block_from_host doc comment seems to out of
>> sync (ram_addr not longer exists)
>>
>>> requires a bigger rework -- especially an alternative vhost_set_mem_table()
>>> backend call that simply consumes MemoryRegionSections.
>>
>> just skimming through  usage of vhost_user_get_mr_data() it looks like
>> we are first collecting MemoryRegionSection-s into tmp_sections
>> then we do vhost_commit we convert then into vhost_memory_region list
>> and the we are trying hard to convert addresses from the later
>> to back to MemoryRegions we've lost during tmp_sections conversion
>> all over the place.
>>
>> To me it looks like we should drop conversion to vhost_dev::mem
>> and replace its usage with vhost_dev::mem_sections directly
>> to get rid of data duplication and back and forth addr<->mr conversion.
>>
>>> For now, let's just drop vhost_backend_can_merge().
>>>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>
>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>>
>>> ---
>>>   hw/virtio/vhost-user.c            | 14 --------------
>>>   hw/virtio/vhost-vdpa.c            |  1 -
>>>   hw/virtio/vhost.c                 |  6 +-----
>>>   include/hw/virtio/vhost-backend.h |  4 ----
>>>   4 files changed, 1 insertion(+), 24 deletions(-)
>>>
>>> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
>>> index e68daa35d4..4bfaf559a7 100644
>>> --- a/hw/virtio/vhost-user.c
>>> +++ b/hw/virtio/vhost-user.c
>>> @@ -2195,19 +2195,6 @@ static int vhost_user_migration_done(struct vhost_dev *dev, char* mac_addr)
>>>       return -ENOTSUP;
>>>   }
>>>   
>>> -static bool vhost_user_can_merge(struct vhost_dev *dev,
>>> -                                 uint64_t start1, uint64_t size1,
>>> -                                 uint64_t start2, uint64_t size2)
>>> -{
>>> -    ram_addr_t offset;
>>> -    int mfd, rfd;
>>> -
>>> -    (void)vhost_user_get_mr_data(start1, &offset, &mfd);
>>> -    (void)vhost_user_get_mr_data(start2, &offset, &rfd);
>>> -
>>> -    return mfd == rfd;
>>> -}
>>> -
>>>   static int vhost_user_net_set_mtu(struct vhost_dev *dev, uint16_t mtu)
>>>   {
>>>       VhostUserMsg msg;
>>> @@ -2704,7 +2691,6 @@ const VhostOps user_ops = {
>>>           .vhost_set_vring_enable = vhost_user_set_vring_enable,
>>>           .vhost_requires_shm_log = vhost_user_requires_shm_log,
>>>           .vhost_migration_done = vhost_user_migration_done,
>>> -        .vhost_backend_can_merge = vhost_user_can_merge,
>>>           .vhost_net_set_mtu = vhost_user_net_set_mtu,
>>>           .vhost_set_iotlb_callback = vhost_user_set_iotlb_callback,
>>>           .vhost_send_device_iotlb_msg = vhost_user_send_device_iotlb_msg,
>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>> index 542e003101..9ab7bc8718 100644
>>> --- a/hw/virtio/vhost-vdpa.c
>>> +++ b/hw/virtio/vhost-vdpa.c
>>> @@ -1317,7 +1317,6 @@ const VhostOps vdpa_ops = {
>>>           .vhost_set_config = vhost_vdpa_set_config,
>>>           .vhost_requires_shm_log = NULL,
>>>           .vhost_migration_done = NULL,
>>> -        .vhost_backend_can_merge = NULL,
>>>           .vhost_net_set_mtu = NULL,
>>>           .vhost_set_iotlb_callback = NULL,
>>>           .vhost_send_device_iotlb_msg = NULL,
>>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>>> index b7fb960fa9..9d8662aa98 100644
>>> --- a/hw/virtio/vhost.c
>>> +++ b/hw/virtio/vhost.c
>>> @@ -733,11 +733,7 @@ static void vhost_region_add_section(struct vhost_dev *dev,
>>>               size_t offset = mrs_gpa - prev_gpa_start;
>>>   
>>>               if (prev_host_start + offset == mrs_host &&
>>> -                section->mr == prev_sec->mr &&
>>> -                (!dev->vhost_ops->vhost_backend_can_merge ||
>>> -                 dev->vhost_ops->vhost_backend_can_merge(dev,
> 
> another question, can it relly happen, i.e. having 2 abut memory sections
> with the same memory region, is yes then when/why?

Unfortunately yet, because vhost relies on some hacks (sorry, but
that's what it is) to make huge pages work. The following commit
contains some details:

commit 76525114736e8f669766e69b715fa59ce8648aae
Author: Dr. David Alan Gilbert <dgilbert@redhat.com>
Date:   Thu Jan 16 20:24:14 2020 +0000

     vhost: Only align sections for vhost-user
     
     I added hugepage alignment code in c1ece84e7c9 to deal with
     vhost-user + postcopy which needs aligned pages when using userfault.
     However, on x86 the lower 2MB of address space tends to be shotgun'd
     with small fragments around the 512-640k range - e.g. video RAM, and
     with HyperV synic pages tend to sit around there - again splitting
     it up.  The alignment code complains with a 'Section rounded to ...'
     error and gives up.


Otherwise it wouldn't be needed, because flatview simplification code already
merges what's reasonable.

[I'll reply to you pother mail regarding that shortly]

-- 
Thanks,

David / dhildenb


