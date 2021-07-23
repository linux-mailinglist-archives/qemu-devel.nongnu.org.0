Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46423D405D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 20:42:32 +0200 (CEST)
Received: from localhost ([::1]:54786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m707z-0007sF-SJ
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 14:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m707G-0007Ca-U1
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 14:41:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m707F-0000GW-B9
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 14:41:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627065704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ClkEToMkywy2EnFu9KQLa7RhgqSLRYUFIXzNTSkLrSA=;
 b=at5gPEPTL458Oqvh1BV8ePzVT7r5RdFMkXjHSgmjCcSQH/hI2x1HtK4ElZDZSAqvAElCAE
 uNGqggRA+9BH0aQD09cbN/0RZq2SVsTjRrSuNi4IINLcnoJCxXJT0TdPJxqbwGrRvlrNXQ
 xVU5sWWascbk3Q/aqgFWQ5jaAruxHKk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-9lXzhSa2M4OFmSbZpbzBZw-1; Fri, 23 Jul 2021 14:41:43 -0400
X-MC-Unique: 9lXzhSa2M4OFmSbZpbzBZw-1
Received: by mail-wm1-f71.google.com with SMTP id
 q188-20020a1ca7c50000b0290241f054d92aso205450wme.5
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 11:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ClkEToMkywy2EnFu9KQLa7RhgqSLRYUFIXzNTSkLrSA=;
 b=sZZK7QmmPxIzRypGLD9o6BvoP3msSm2AsrCFFtjDn+U+2kgYbRYQUmLIzw5hUxsW+X
 wmuQsXXR235pTt+ZzFA/75WnOeSRgyW0YBXtClKxdiKFnOdYAX2mK402P/f+0Z5MbIe6
 zUch3M4VlWj71uVFPie4+tdujRhlM0YkOIXptSgyywQ72b/5CES1klPGLXB9HBOtpcbz
 y68VPzOUld/2ioQ56BpInPT1GmyVGAEx1Ij8SWNif3w4wpNy7J0ZuWZPNWEkg0wTX3tV
 girv0bwtVcOQt4+28uumjWyWNM7xBn6Xg2xd8wHcAsFf1RGFWCspn6rwl1KtbP/ah0SG
 MQGQ==
X-Gm-Message-State: AOAM530P5RaRSu/4TVnFafQ2Xn31220EHmDjbvYJqXDMGOUKEnQOcYlQ
 Q0c8H9JPEenfBFyktKtE7yMa0tnZqnOeyDOLETEInUzM+FFbCGq1znbgLSi/lU9KMqFNhrJHG9z
 S7tRwnayyQKloYxo=
X-Received: by 2002:a5d:6982:: with SMTP id g2mr6612533wru.119.1627065701842; 
 Fri, 23 Jul 2021 11:41:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzciOrB2bPeJjKaHanax0cA1iTmCXe1sMWcUFkY1GyNW3Pfz8+aR8Is7uczs/8h6/n6NyrFnQ==
X-Received: by 2002:a5d:6982:: with SMTP id g2mr6612511wru.119.1627065701630; 
 Fri, 23 Jul 2021 11:41:41 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c676e.dip0.t-ipconnect.de. [91.12.103.110])
 by smtp.gmail.com with ESMTPSA id o15sm5896781wmh.40.2021.07.23.11.41.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 11:41:41 -0700 (PDT)
Subject: Re: [PATCH v2 0/6] migration/ram: Optimize for virtio-mem via
 RamDiscardManager
To: Peter Xu <peterx@redhat.com>
References: <20210721092759.21368-1-david@redhat.com>
 <YPlWqs8N+NiFH/yj@work-vm> <800e421c-70b8-1ef2-56f7-cdbce7a7706b@redhat.com>
 <YPrqfkCk7EM7QLpa@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <ea9e9071-4ecb-9c28-9567-92585a18b4eb@redhat.com>
Date: Fri, 23 Jul 2021 20:41:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPrqfkCk7EM7QLpa@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Juan Quintela <quintela@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.07.21 18:12, Peter Xu wrote:
> On Thu, Jul 22, 2021 at 01:43:41PM +0200, David Hildenbrand wrote:
>>>> a) In precopy code, always clearing all dirty bits from the bitmap that
>>>>      correspond to discarded range, whenever we update the dirty bitmap. This
>>>>      results in logically unplugged memory to never get migrated.
>>>
>>> Have you seen cases where discarded areas are being marked as dirty?
>>> That suggests something somewhere is writing to them and shouldn't be.
>>
>> I have due to sub-optimal clear_bmap handling to be sorted out by
>>
>> https://lkml.kernel.org/r/20210722083055.23352-1-wei.w.wang@intel.com
>>
>> Whereby the issue is rather that initially dirty bits don't get cleared in
>> lower layers and keep popping up as dirty.
>>
>> The issue with postcopy recovery code setting discarded ranges dirty in
>> the dirty bitmap, I did not try reproducing. But from looking at the
>> code, it's pretty clear that it would happen.
>>
>> Apart from that, nothing should dirty that memory. Of course,
>> malicious guests could trigger it for now, in which case we wouldn't catch it
>> and migrate such pages with postcopy, because the final bitmap sync in
>> ram_postcopy_send_discard_bitmap() is performed without calling notifiers
>> right now.
> 
> I have the same concern with Dave: does it mean that we don't need to touch at
> least ramblock_sync_dirty_bitmap in patch 3?

Yes, see the comment in patch #3:

"
Note: If discarded ranges span complete clear_bmap chunks, we'll never
clear the corresponding bits from clear_bmap and consequently never call
memory_region_clear_dirty_bitmap on the affected regions. While this is
perfectly fine, we're still synchronizing the bitmap of discarded ranges,
for example, in
ramblock_sync_dirty_bitmap()->cpu_physical_memory_sync_dirty_bitmap()
but also during memory_global_dirty_log_sync().

In the future, it might make sense to never even synchronize the dirty 
log of these ranges, for example in KVM code, skipping discarded ranges
completely.
"

The KVM path might be even more interesting (with !dirty ring IIRC).

So that might certainly be worth looking into if we find it to be a real 
performance problem.

> 
> Doing that for bitmap init and postcopy recovery looks right.
> 
> One other trivial comment is instead of touching up ram_dirty_bitmap_reload(),
> IMHO it's simpler to set all 1's to disgarded memories on dst receivedmap;
> imagine multiple postcopy recovery happened, then with that we walk the disgard
> memory list only once for each migration.  Not a big deal, though.

Right, but I decided to reuse 
ramblock_dirty_bitmap_exclude_discarded_pages() such that I can avoid 
yet another helper.

-- 
Thanks,

David / dhildenb


