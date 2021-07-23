Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FA83D4055
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 20:38:09 +0200 (CEST)
Received: from localhost ([::1]:51956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m703j-0005lJ-Np
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 14:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m702P-000545-Eh
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 14:36:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m702L-0005Ir-Uq
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 14:36:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627065400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fkfzcbQNCpAhenx8UuEEpWx7I5l3+/xcN0YuSEjLTBw=;
 b=CueRzn71NHz3Wj5rrRMLgYEjvgd5oDnXJgbxWOdS2CKhZIgigXWE6INR08X7N1NUpfIh/m
 ciMWe35DrfERYdPzcXbefTfryI+CmzZ74HdfNVug02Jjnq8/9zHTZL6DhvBVc5FVRtRu+j
 klcV2NP4KnFoaE0lHleHHjbP+bkGXYQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-iiG2Hcu9MyirdO_SRA44MQ-1; Fri, 23 Jul 2021 14:36:36 -0400
X-MC-Unique: iiG2Hcu9MyirdO_SRA44MQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 f2-20020a5d50c20000b0290138092aea94so1254441wrt.20
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 11:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fkfzcbQNCpAhenx8UuEEpWx7I5l3+/xcN0YuSEjLTBw=;
 b=Et6wZAu9Y78lUKrCKIVd1+5yHv0S0BAksaHlZjyhACRliH5O0vi82iHS3zlM5WL2nW
 AfHrvmN/hyJ1WwsR7t0TEIAJa1mvCNjrotaAjLOKeNZ457igaMHhBgy+/IlbF0jqU3lS
 w49sp6gjY85YtnlEbKImeSn+JCcwQtMI8i/lK5EofuGT9TtsE4ot+yh3u/qrSNkoD/cd
 kbxGrX0M3Y2EbA4kgotOFQPDHIJyvt8nQ3/gL6MeVR+Ey+MjR+8+j1K+epdQiOxGDVI0
 y3FrtzjGn01hJi150hHUO8WP8CffJCo75w/g9kTFlzZ3I3iX2Uj9nIyAB6VEs/YdslYK
 DY4A==
X-Gm-Message-State: AOAM532R6zMNER6CJa9eGQVnjwTcJAzEVzciPScH2xoLhaOWWp9Z9/qa
 JoPPtI8HtvlYxVI86iJaAMCPKnk4gpbZTc8fkzG7HoU6N8o/UjjPOxZlUUXsGDXOrbKZwlh+/Ch
 ne5R91OH9HhtPaGQ=
X-Received: by 2002:a5d:610b:: with SMTP id v11mr6733777wrt.58.1627065395429; 
 Fri, 23 Jul 2021 11:36:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXR/NyatU810K/tlOzChRTw/VbAhncS3sk9EDxBQ2+4gjJ03KK3TN0oRk/kbb2N0BxUirvXA==
X-Received: by 2002:a5d:610b:: with SMTP id v11mr6733755wrt.58.1627065395133; 
 Fri, 23 Jul 2021 11:36:35 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c676e.dip0.t-ipconnect.de. [91.12.103.110])
 by smtp.gmail.com with ESMTPSA id o7sm39175585wrv.72.2021.07.23.11.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 11:36:34 -0700 (PDT)
Subject: Re: [PATCH v2 5/6] migration/postcopy: Handle RAMBlocks with a
 RamDiscardManager on the destination
To: Peter Xu <peterx@redhat.com>
References: <20210721092759.21368-1-david@redhat.com>
 <20210721092759.21368-6-david@redhat.com> <YPrvfST43SFOMA1F@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <2ce949f2-6950-5404-70e4-73a2e41b4ca8@redhat.com>
Date: Fri, 23 Jul 2021 20:36:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPrvfST43SFOMA1F@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
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

>> +static int postcopy_request_page(MigrationIncomingState *mis, RAMBlock *rb,
>> +                                 ram_addr_t start, uint64_t haddr)
>> +{
>> +    /*
>> +     * Discarded pages (via RamDiscardManager) are never migrated. On unlikely
>> +     * access, place a zeropage, which will also set the relevant bits in the
>> +     * recv_bitmap accordingly, so we won't try placing a zeropage twice.
>> +     */
>> +    if (ramblock_page_is_discarded(rb, start)) {
>> +        bool received = ramblock_recv_bitmap_test_byte_offset(rb, start);
> 
> Will received be set for any case with the current code base?  As I thought
> virtio-mem forbids plug/unplug during the whole lifecycle of migration.

receive would only be set if you have two CPUs faulting on the same 
address at the same time and the first one already placed a zeropage on 
this code path (as the comment said, that will implicitly set it in the 
rceivedmask).

So, pretty unlikely to happen, but if the stars align ... :)

> 
>> +
>> +        return received ? 0 : postcopy_place_page_zero(mis, (void *)haddr, rb);
> 
> (now we can fill up pages in two threads.. but looks thread-safe)
> 
> Meanwhile if this is highly not wanted, maybe worth an error_report_once() so
> the admin could see something?


You mean, if postcopy_place_page_zero() fails?

[...]

>>   
>> +/*
>> + * Check if a page falls into a discarded range as managed by a
>> + * RamDiscardManager responsible for the mapped memory region of the RAMBlock.
>> + * Pages inside discarded ranges are never migrated and postcopy has to
>> + * place zeropages instead.
>> + *
>> + * Note: The result is only stable while migration (precopy/postcopy).
>> + */
>> +bool ramblock_page_is_discarded(RAMBlock *rb, ram_addr_t offset)
>> +{
>> +    if (rb->mr && memory_region_has_ram_discard_manager(rb->mr)) {
>> +        RamDiscardManager *rdm = memory_region_get_ram_discard_manager(rb->mr);
>> +        MemoryRegionSection section = {
>> +            .mr = rb->mr,
>> +            .offset_within_region = offset,
>> +            .size = int128_get64(TARGET_PAGE_SIZE),
> 
> rb->page_size?
> 
> Although I think it should also work with TARGET_PAGE_SIZE in this specific
> case, but maybe still better to use what we have.


If rb->page_size is discarded, TARGET_PAGE_SIZE is certainly discarded 
as well (as TARGET_PAGE_SIZE <= rb->page_size).

But yes, sounds cleaner.

Thanks Peter!

-- 
Thanks,

David / dhildenb


