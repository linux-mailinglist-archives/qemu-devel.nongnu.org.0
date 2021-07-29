Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBFA3DABD4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 21:25:12 +0200 (CEST)
Received: from localhost ([::1]:36980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9BeZ-0004ts-LF
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 15:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m9BcJ-000391-DC
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 15:22:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m9BcH-0007nD-Nk
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 15:22:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627586569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/W6V/QwFbfmSoI18mcFu5r7Qthog7nUKOqiwQjODHm4=;
 b=ExhQ3sWissWzYS8ZUs6bs09TE0lK52nN9em+h5/2SoNphP0LB78WqQiRSSMHELVBvgfFOa
 zK8M6N3lLBmkUUznsoLniOoedcfX+MlcvzFq5TtmeWAbqIiTdrvSJj7yZS1sLMKUAoOQWZ
 FUJ+KvDzXUEBSmX9C4EpjXutUmiy1qg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-Zj3_nk-RMrmKBklU8QnhhA-1; Thu, 29 Jul 2021 15:22:47 -0400
X-MC-Unique: Zj3_nk-RMrmKBklU8QnhhA-1
Received: by mail-wm1-f70.google.com with SMTP id
 u14-20020a7bcb0e0000b0290248831d46e4so2312867wmj.6
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 12:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/W6V/QwFbfmSoI18mcFu5r7Qthog7nUKOqiwQjODHm4=;
 b=s9ax8omWlvv8EP1aU8CEW9hp0gyBumsBPHIJhriQoVflg1SfAFzlqVdb7S2fGYvy5+
 0WAF5pG0gQ+V/uUYlwpzBhBKzJ3ebJhCx0S2txkTJpKh8dkS7tEnA42o3OWsXxVYsHQJ
 HXlfYNw6sDxxRlw+6GFxHwDekYFsXG/nPLW5fydyuZQKY5kGJG9Xp+gfTi4+pn78yS7Z
 OvEaD4N1J8Oe7fUWzy3ltQmbVOcC9YKU4+zgkUN9anvCyev+NaPfWXZPfTOVWQcFZXlW
 SH977/6ydWWJAOHMa4nyjBVOjGrarqSm9T3bl09ZfJYi5aYlg+e7jzHCYdKgvzZUhsz3
 pviA==
X-Gm-Message-State: AOAM531/79Qas62XN+csJFd9nHoHpe7qU7lwYVchWmHdgSPSKjjQSFqa
 GxL6I/g84fpJ5C5R8/EFp7Ko1TYTqSq4axGsanH0ImKYWMC5AkdJ7jpwmQSbOaMYWVMd/WR2rTR
 SaHDNcfrdIU91inU=
X-Received: by 2002:adf:f351:: with SMTP id e17mr6614163wrp.360.1627586566669; 
 Thu, 29 Jul 2021 12:22:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweGU10mga25+BOncguqQncreCN0U6xFodeRvuZJ0PK+34zKrBO0edNecWpvgXTsq0prXSLBA==
X-Received: by 2002:adf:f351:: with SMTP id e17mr6614138wrp.360.1627586566451; 
 Thu, 29 Jul 2021 12:22:46 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id j140sm4269135wmj.37.2021.07.29.12.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 12:22:45 -0700 (PDT)
Subject: Re: [PATCH v2 5/6] migration/postcopy: Handle RAMBlocks with a
 RamDiscardManager on the destination
To: Peter Xu <peterx@redhat.com>
References: <20210721092759.21368-1-david@redhat.com>
 <20210721092759.21368-6-david@redhat.com> <YPrvfST43SFOMA1F@t490s>
 <2ce949f2-6950-5404-70e4-73a2e41b4ca8@redhat.com> <YPsP8+STD836MO3L@t490s>
 <124693ef-5595-85c9-da5a-8f8e6a827c19@redhat.com> <YPs+cO7u1eXMomE0@t490s>
 <de4bd533-efaa-a6e5-c73c-01016d0f229c@redhat.com> <YQLO1QoOIu8dlaEq@t490s>
 <5ede7b00-1048-c124-e239-eeff21d9adb0@redhat.com> <YQL/jxRizBc0OFZS@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <c1edb51d-41c6-a3b8-7b3e-de277abf3ed0@redhat.com>
Date: Thu, 29 Jul 2021 21:22:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQL/jxRizBc0OFZS@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29.07.21 21:20, Peter Xu wrote:
> On Thu, Jul 29, 2021 at 06:15:58PM +0200, David Hildenbrand wrote:
>> On 29.07.21 17:52, Peter Xu wrote:
>>> On Thu, Jul 29, 2021 at 02:14:41PM +0200, David Hildenbrand wrote:
>>>> On 24.07.21 00:10, Peter Xu wrote:
>>>>> On Fri, Jul 23, 2021 at 09:01:42PM +0200, David Hildenbrand wrote:
>>>>>> It can happen in corner cases and is valid: with the current virtio-mem
>>>>>> spec, guests are allowed to read unplugged memory. This will, for example,
>>>>>> happen on older Linux guests when reading /proc/kcore or (with even older
>>>>>> guests) when dumping guest memory via kdump. These corner cases were the
>>>>>> main reason why the spec allows for it -- until we have guests properly
>>>>>> adjusted such that it won't happen even in corner cases.
>>>>>>
>>>>>> A future feature bit will disallow it for the guest: required for supporting
>>>>>> shmem/hugetlb cleanly. With that in place, I agree that we would want to
>>>>>> warn in this case!
>>>>>
>>>>> OK that makes sense; with the page_size change, feel free to add:
>>>>
>>>> I just realized that relying on the page_size would be wrong.
>>>>
>>>> We migrate TARGET_PAGE_SIZE chunks and the offset might not be page_size
>>>> aligned. So if we were to replace TARGET_PAGE_SIZE by rb->page_size, we
>>>> might accidentally cover a "too big" range.
>>>
>>> I'm wondering whether we should make the offset page size aligned instead.  For
>>> example, note that postcopy_place_page_zero() should only take page_size
>>> aligned host addr or UFFDIO_COPY could fail (hugetlb doesn't support
>>> UFFDIO_ZEROPAGE yet).
>>
>> That is true indeed. I'd assume in that case that we would get called with
>> the proper offset already, right? Because uffd would only report properly
>> aligned pages IIRC.
> 
> Nop; it should return the faulted address. So postcopy_request_page() may need
> some alignment work, as it was handled in migrate_send_rp_req_pages().
> 

Right, figured that out myself just now:

static int postcopy_request_page(MigrationIncomingState *mis, RAMBlock *rb,
                                  ram_addr_t start, uint64_t haddr)
{
     void *aligned = (void *)(uintptr_t)(haddr & -qemu_ram_pagesize(rb));

     /*
      * Discarded pages (via RamDiscardManager) are never migrated. On unlikely
      * access, place a zeropage, which will also set the relevant bits in the
      * recv_bitmap accordingly, so we won't try placing a zeropage twice.
      *
      * Checking a single bit is sufficient to handle pagesize > TPS as either
      * all relevant bits are set or not.
      */
     assert(QEMU_IS_ALIGNED(start, qemu_ram_pagesize(rb)));
     if (ramblock_page_is_discarded(rb, start)) {
         bool received = ramblock_recv_bitmap_test_byte_offset(rb, start);

         return received ? 0 : postcopy_place_page_zero(mis, aligned, rb);
     }

     return migrate_send_rp_req_pages(mis, rb, start, haddr);
}


-- 
Thanks,

David / dhildenb


