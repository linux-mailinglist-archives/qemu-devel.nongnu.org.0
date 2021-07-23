Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200693D4082
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 21:03:21 +0200 (CEST)
Received: from localhost ([::1]:39144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m70S8-0000pA-6P
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 15:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m70Qq-00007E-4J
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:02:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m70Qm-0005Ai-Lf
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:01:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627066915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rE4CEJqngJGFA0RdK6leMPGkkHx5LRJH3ylHfe2YRBw=;
 b=FEHLEquypVzyw0ELtvMcjNCr67mAZz9VVeE34t904c1Cqs98wcHog0tA6q1gSWY+GMyW6x
 +Zihe6EmVx38GPz55rxYoY52J7X7OUfUzlg97qimwk/sgeRUq+Cqby1gcP3oEziATrVqoK
 24Oj7mW7FbGXwG2KzkIWm1n8rhvzSdw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-IF-xrYEaM86jv6U10H1pTg-1; Fri, 23 Jul 2021 15:01:54 -0400
X-MC-Unique: IF-xrYEaM86jv6U10H1pTg-1
Received: by mail-wm1-f72.google.com with SMTP id
 25-20020a05600c0219b029024ebb12928cso438205wmi.3
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 12:01:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rE4CEJqngJGFA0RdK6leMPGkkHx5LRJH3ylHfe2YRBw=;
 b=P15yPzwUqVUUWOQhb8WL/8DlEQJxEuO1vLoud1yMoFaM9xIm62Oq2j3ewnfMw0Ho7h
 PdmXyY3zZRUbaW+05d/GZzZLTpRESsLbYhH207Efa5v6HqiMOTatZfVfnIdqt3uxrFEY
 aQXvT+NknjVcbWNabywNLsYJGlsV851s52T9/DSfwQQ5TkvF55aKf9vsQ5ruYF2AMoRY
 ezEkL5FJ/fefafjCgTNKzAhrS45GIL4JdELL1MShg1R/Dc1Dxa5NixGjB+9NSXz0sz1y
 +r/HBLLKIIK0eNJoArW6WQsELIERgiJa1AQqZce3loS1YiekkwFc3L0K19gjW/N6ajhl
 jc/w==
X-Gm-Message-State: AOAM532bSqRPGrwM+zc1IzAIxqCZyQTuEFzHJM+9p8+RI54cSD1zwWyn
 jzt6WHwTe4eG8NCRq+hUGvjSP1FMGCaX5xyM5jvI63aMzvRikF86C8pFRsvcIW0q1S5NMmu0EXj
 WOsje6g3vpHiGaPI=
X-Received: by 2002:adf:d0ce:: with SMTP id z14mr6738579wrh.67.1627066912926; 
 Fri, 23 Jul 2021 12:01:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySRj3VVYqGupD1vSYhB4n4L7xDeewrbLbKn8t0AcZmklAPxarXSe+wcUIWW6smA+ea+D+BzA==
X-Received: by 2002:adf:d0ce:: with SMTP id z14mr6738559wrh.67.1627066912721; 
 Fri, 23 Jul 2021 12:01:52 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c676e.dip0.t-ipconnect.de. [91.12.103.110])
 by smtp.gmail.com with ESMTPSA id l22sm5707518wmp.41.2021.07.23.12.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 12:01:52 -0700 (PDT)
Subject: Re: [PATCH v2 5/6] migration/postcopy: Handle RAMBlocks with a
 RamDiscardManager on the destination
To: Peter Xu <peterx@redhat.com>
References: <20210721092759.21368-1-david@redhat.com>
 <20210721092759.21368-6-david@redhat.com> <YPrvfST43SFOMA1F@t490s>
 <2ce949f2-6950-5404-70e4-73a2e41b4ca8@redhat.com> <YPsP8+STD836MO3L@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <124693ef-5595-85c9-da5a-8f8e6a827c19@redhat.com>
Date: Fri, 23 Jul 2021 21:01:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPsP8+STD836MO3L@t490s>
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

On 23.07.21 20:52, Peter Xu wrote:
> On Fri, Jul 23, 2021 at 08:36:32PM +0200, David Hildenbrand wrote:
>>>> +static int postcopy_request_page(MigrationIncomingState *mis, RAMBlock *rb,
>>>> +                                 ram_addr_t start, uint64_t haddr)
>>>> +{
>>>> +    /*
>>>> +     * Discarded pages (via RamDiscardManager) are never migrated. On unlikely
>>>> +     * access, place a zeropage, which will also set the relevant bits in the
>>>> +     * recv_bitmap accordingly, so we won't try placing a zeropage twice.
>>>> +     */
>>>> +    if (ramblock_page_is_discarded(rb, start)) {
>>>> +        bool received = ramblock_recv_bitmap_test_byte_offset(rb, start);
>>>
>>> Will received be set for any case with the current code base?  As I thought
>>> virtio-mem forbids plug/unplug during the whole lifecycle of migration.
>>
>> receive would only be set if you have two CPUs faulting on the same address
>> at the same time and the first one already placed a zeropage on this code
>> path (as the comment said, that will implicitly set it in the rceivedmask).
> 
> Ah I see; or just ignore the error of postcopy_place_page_zero() here because
> per my understanding this whole path is not expected after all.

See below, if placing would go wrong in this corner case, I think we 
would still want to know it instead of letting a guest thread not make 
progress because nobody would wake it up.

Does that make sense?

> 
>>
>> So, pretty unlikely to happen, but if the stars align ... :)
>>
>>>
>>>> +
>>>> +        return received ? 0 : postcopy_place_page_zero(mis, (void *)haddr, rb);
>>>
>>> (now we can fill up pages in two threads.. but looks thread-safe)
>>>
>>> Meanwhile if this is highly not wanted, maybe worth an error_report_once() so
>>> the admin could see something?
>>
>>
>> You mean, if postcopy_place_page_zero() fails?
> 
> I meant ramblock_page_is_discarded() shouldn't really trigger for a sane guest,
> right?  Because it means the guest is accessing some unplugged memory.

It can happen in corner cases and is valid: with the current virtio-mem 
spec, guests are allowed to read unplugged memory. This will, for 
example, happen on older Linux guests when reading /proc/kcore or (with 
even older guests) when dumping guest memory via kdump. These corner 
cases were the main reason why the spec allows for it -- until we have 
guests properly adjusted such that it won't happen even in corner cases.

A future feature bit will disallow it for the guest: required for 
supporting shmem/hugetlb cleanly. With that in place, I agree that we 
would want to warn in this case!

-- 
Thanks,

David / dhildenb


