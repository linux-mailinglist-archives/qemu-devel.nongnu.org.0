Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 235313064F9
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 21:22:38 +0100 (CET)
Received: from localhost ([::1]:60624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4rKn-0001Mg-7q
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 15:22:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l4rJM-0000dv-Js
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 15:21:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l4rJK-0001r0-Nb
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 15:21:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611778865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dvtd13sSviOOaYr048RY/EVAAnCbIarooxb8W+T7zRQ=;
 b=LykYjGxMCKACy6VJU+/fD4vdmt1SYvYGIy5eIHT+DCvA0LJKzk0Q1oItoTK48ygcYwjTZP
 J0dOu6VeCxw6v4NKmFA4rhJmWeXyjQcVcG6Jjahv6Nlkdiwug/BBJjbTdS6/uvYezriDiy
 q8p94O2Xx/pl1HXxf6laRb4nmb/u7CY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-qg9zebBYMoigHn7rlkEMjg-1; Wed, 27 Jan 2021 15:21:04 -0500
X-MC-Unique: qg9zebBYMoigHn7rlkEMjg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC95659;
 Wed, 27 Jan 2021 20:21:02 +0000 (UTC)
Received: from [10.36.114.237] (ovpn-114-237.ams2.redhat.com [10.36.114.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDAB910016F7;
 Wed, 27 Jan 2021 20:20:48 +0000 (UTC)
Subject: Re: [PATCH v5 03/11] virtio-mem: Implement RamDiscardMgr interface
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210121110540.33704-1-david@redhat.com>
 <20210121110540.33704-4-david@redhat.com> <20210127201441.GR3052@work-vm>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <2fc589da-298e-6e89-671a-b64595ecda5a@redhat.com>
Date: Wed, 27 Jan 2021 21:20:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210127201441.GR3052@work-vm>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27.01.21 21:14, Dr. David Alan Gilbert wrote:
> * David Hildenbrand (david@redhat.com) wrote:
>> Let's properly notify when (un)plugging blocks, after discarding memory
>> and before allowing the guest to consume memory. Handle errors from
>> notifiers gracefully (e.g., no remaining VFIO mappings) when plugging,
>> rolling back the change and telling the guest that the VM is busy.
>>
>> One special case to take care of is replaying all notifications after
>> restoring the vmstate. The device starts out with all memory discarded,
>> so after loading the vmstate, we have to notify about all plugged
>> blocks.
>>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Alex Williamson <alex.williamson@redhat.com>
>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
>> Cc: Peter Xu <peterx@redhat.com>
>> Cc: Auger Eric <eric.auger@redhat.com>
>> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
>> Cc: teawater <teawaterz@linux.alibaba.com>
>> Cc: Marek Kedzierski <mkedzier@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   hw/virtio/virtio-mem.c         | 258 ++++++++++++++++++++++++++++++++-
>>   include/hw/virtio/virtio-mem.h |   3 +
>>   2 files changed, 258 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
>> index 471e464171..6200813bb8 100644
>> --- a/hw/virtio/virtio-mem.c
>> +++ b/hw/virtio/virtio-mem.c
>> @@ -172,7 +172,110 @@ static int virtio_mem_for_each_unplugged_range(const VirtIOMEM *vmem, void *arg,
>>       return ret;
>>   }
>>   
>> -static bool virtio_mem_test_bitmap(VirtIOMEM *vmem, uint64_t start_gpa,
>> +static int virtio_mem_for_each_plugged_range(const VirtIOMEM *vmem, void *arg,
>> +                                             virtio_mem_range_cb cb)
>> +{
>> +    unsigned long first_bit, last_bit;
>> +    uint64_t offset, size;
>> +    int ret = 0;
>> +
>> +    first_bit = find_first_bit(vmem->bitmap, vmem->bitmap_size);
>> +    while (first_bit < vmem->bitmap_size) {
>> +        offset = first_bit * vmem->block_size;
>> +        last_bit = find_next_zero_bit(vmem->bitmap, vmem->bitmap_size,
>> +                                      first_bit + 1) - 1;
>> +        size = (last_bit - first_bit + 1) * vmem->block_size;
>> +
>> +        ret = cb(vmem, arg, offset, size);
>> +        if (ret) {
>> +            break;
>> +        }
>> +        first_bit = find_next_bit(vmem->bitmap, vmem->bitmap_size,
>> +                                  last_bit + 2);
>> +    }
>> +    return ret;
>> +}
>> +
>> +static void virtio_mem_notify_unplug(VirtIOMEM *vmem, uint64_t offset,
>> +                                     uint64_t size)
>> +{
>> +    RamDiscardListener *rdl;
>> +
>> +    QLIST_FOREACH(rdl, &vmem->rdl_list, next) {
>> +        rdl->notify_discard(rdl, &vmem->memdev->mr, offset, size);
>> +    }
>> +}
>> +
>> +static int virtio_mem_notify_plug(VirtIOMEM *vmem, uint64_t offset,
>> +                                  uint64_t size)
>> +{
>> +    RamDiscardListener *rdl, *rdl2;
>> +    int ret = 0, ret2;
>> +
>> +    QLIST_FOREACH(rdl, &vmem->rdl_list, next) {
>> +        ret = rdl->notify_populate(rdl, &vmem->memdev->mr, offset, size);
>> +        if (ret) {
>> +            break;
>> +        }
>> +    }
>> +
>> +    if (ret) {
>> +        /* Could be a mapping attempt resulted in memory getting populated. */
>> +        ret2 = ram_block_discard_range(vmem->memdev->mr.ram_block, offset,
>> +                                       size);
>> +        if (ret2) {
>> +            error_report("Unexpected error discarding RAM: %s",
>> +                         strerror(-ret2));
> 
> Not a blocker, but it's good to include the RAMBlock/offset/size in
> errors like these.
> 

We really only have the single RAMBlock managed by the device. offset 
and size can be useful, indeed.

As we have some other similar cases, I'll do a cleanup of that on top - 
unless I have to resend.

Thanks!

> Dave


-- 
Thanks,

David / dhildenb


