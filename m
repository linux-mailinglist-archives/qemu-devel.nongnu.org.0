Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447A91A97C3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 11:04:20 +0200 (CEST)
Received: from localhost ([::1]:46410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOdxz-00033l-CB
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 05:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33276)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1jOdx0-0002Z1-JV
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 05:03:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1jOdwy-0005oM-Ja
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 05:03:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24302
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1jOdwy-0005o0-A8
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 05:03:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586941395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ObLtVVj5lPys8NxKvGbvXR6gz4fbZsFi9pEJPbdH/9k=;
 b=RDoJisx2nXnlUZXYPQ8Q14/dk5EXUZPzn14kr5BM+9T/mlqpnpVeXYk0Eco1AXg285IC4l
 DA4t1dEqlf8eXbTt6c/D6siTRdcr8QbR5N0fnqw4mM+I7Jsy8+UKreOBdKaCeDYSgC0Htu
 3Sh6JM08F4BzUaLmwRXwsRMDMsK+wgI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-ZA-fO_hbM3aOgXyrK87l5g-1; Wed, 15 Apr 2020 05:03:11 -0400
X-MC-Unique: ZA-fO_hbM3aOgXyrK87l5g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CA01107ACC4;
 Wed, 15 Apr 2020 09:03:10 +0000 (UTC)
Received: from [10.36.114.144] (ovpn-114-144.ams2.redhat.com [10.36.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A578860BE2;
 Wed, 15 Apr 2020 09:03:06 +0000 (UTC)
Subject: Re: [PATCH v19 QEMU 3/4] virtio-balloon: Provide an interface for
 free page reporting
From: David Hildenbrand <david@redhat.com>
To: Alexander Duyck <alexander.duyck@gmail.com>, pbonzini@redhat.com,
 mst@redhat.com
References: <20200410033729.24738.22879.stgit@localhost.localdomain>
 <20200410034143.24738.78852.stgit@localhost.localdomain>
 <4f26ec52-5520-1bfb-a1e5-fe6492f7af60@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <949ed023-8817-967f-9a76-5eb486771bc8@redhat.com>
Date: Wed, 15 Apr 2020 11:03:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <4f26ec52-5520-1bfb-a1e5-fe6492f7af60@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: virtio-dev@lists.oasis-open.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.04.20 10:17, David Hildenbrand wrote:
> On 10.04.20 05:41, Alexander Duyck wrote:
>> From: Alexander Duyck <alexander.h.duyck@linux.intel.com>
>>
>> Add support for free page reporting. The idea is to function very similar
>> to how the balloon works in that we basically end up madvising the page as
>> not being used. However we don't really need to bother with any deflate
>> type logic since the page will be faulted back into the guest when it is
>> read or written to.
>>
>> This provides a new way of letting the guest proactively report free
>> pages to the hypervisor, so the hypervisor can reuse them. In contrast to
>> inflate/deflate that is triggered via the hypervisor explicitly.
> 
> Much better, thanks!
> 
>>
>> Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
>> ---
>>  hw/virtio/virtio-balloon.c         |   63 +++++++++++++++++++++++++++++++++++-
>>  include/hw/virtio/virtio-balloon.h |    2 +
>>  2 files changed, 62 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
>> index 1c6d36a29a04..86d8b48a8e3a 100644
>> --- a/hw/virtio/virtio-balloon.c
>> +++ b/hw/virtio/virtio-balloon.c
>> @@ -321,6 +321,57 @@ static void balloon_stats_set_poll_interval(Object *obj, Visitor *v,
>>      balloon_stats_change_timer(s, 0);
>>  }
>>  
>> +static void virtio_balloon_handle_report(VirtIODevice *vdev, VirtQueue *vq)
>> +{
>> +    VirtIOBalloon *dev = VIRTIO_BALLOON(vdev);
>> +    VirtQueueElement *elem;
>> +
>> +    while ((elem = virtqueue_pop(vq, sizeof(VirtQueueElement)))) {
>> +        unsigned int i;
>> +
>> +        for (i = 0; i < elem->in_num; i++) {
>> +            void *addr = elem->in_sg[i].iov_base;
>> +            size_t size = elem->in_sg[i].iov_len;
>> +            ram_addr_t ram_offset;
>> +            size_t rb_page_size;
>> +            RAMBlock *rb;
>> +
>> +            if (qemu_balloon_is_inhibited() || dev->poison_val) {
>> +                continue;
> 
> actually, you want to do that in the outer loop, no?
> 
>> +            }
>> +
>> +            /*
>> +             * There is no need to check the memory section to see if
>> +             * it is ram/readonly/romd like there is for handle_output
>> +             * below. If the region is not meant to be written to then
>> +             * address_space_map will have allocated a bounce buffer
>> +             * and it will be freed in address_space_unmap and trigger
>> +             * and unassigned_mem_write before failing to copy over the
>> +             * buffer. If more than one bad descriptor is provided it
>> +             * will return NULL after the first bounce buffer and fail
>> +             * to map any resources.
>> +             */
>> +            rb = qemu_ram_block_from_host(addr, false, &ram_offset);
>> +            if (!rb) {
>> +                trace_virtio_balloon_bad_addr(elem->in_addr[i]);
>> +                continue;
>> +            }
>> +
>> +            /* For now we will simply ignore unaligned memory regions */
>> +            rb_page_size = qemu_ram_pagesize(rb);
>> +            if (!QEMU_IS_ALIGNED(ram_offset | size, rb_page_size)) {
> 
> /me thinks you can drop rb_page_size
> 
> I *think* there is still one remaining case to handle: Crossing RAM blocks.
> 
> Most probably you should check
> 
> /* For now, ignore crossing RAM blocks. */
> if (ram_offset + size >= qemu_ram_get_used_length()) {
> 	continue;

(should be an > I guess)


-- 
Thanks,

David / dhildenb


