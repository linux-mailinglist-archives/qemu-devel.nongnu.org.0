Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D41D3E0FDD
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 10:08:44 +0200 (CEST)
Received: from localhost ([::1]:58068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBYQl-0005Gt-FJ
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 04:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBYPX-0004Wj-VW
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 04:07:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBYPW-0001qE-Ee
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 04:07:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628150845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nEs/CZkN4RFI0KYcZkIQDBEl99D4/JNCUQSyNdqhl2k=;
 b=VXRJ7t7etdqGCnsa9Y0kx7whHKT684uldTb4eK0ZDiSca6nS7ymStpH2KhZOujuhmReE2z
 iPfaAA+VDus1+IXUTt8/S9e960kKj2Y9UPqX/ZfpAmhq+hbsp+VeAeTXh8CiqpT2bpiqu4
 727UfEAFi2dJw0IpRjkiBvl86nGGVpc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-d95_4qIhO2mkU-vF1Yto6g-1; Thu, 05 Aug 2021 04:07:24 -0400
X-MC-Unique: d95_4qIhO2mkU-vF1Yto6g-1
Received: by mail-wr1-f69.google.com with SMTP id
 o11-20020a5d474b0000b02901533f8ed22cso1643922wrs.22
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 01:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=nEs/CZkN4RFI0KYcZkIQDBEl99D4/JNCUQSyNdqhl2k=;
 b=Ibjb++d37ZgdaqJy9gulMHSTzSX0RyOiP0Vu9Wjw6AHC+3lXGGvrQkGqKSdkCOPgi5
 5SSBs1ZK0po9232mZIFl5/7IgAbvB8TUtx8fUgF/KGY2zbwzGC/Xc4pTNZJsdTF4xRK3
 t8vY2CV4qa6qoxRuUlGlMXhe5ESs/N8DOO3nCBOP7awGe4oNz/4q4fUiXiBuuUSvSICC
 YTdQVpujCNGu8HQE7qutN4hC/HrhKjxY6ZvCVBh95n9u7dpefZBiPu0mM+/UcVgDfLLU
 11DFtuEfZf8/fFAFyDBfvvHQLEGI75v7iomQfy7vp23tjThZ9n8/DSWnjMtkkr8B+kWe
 sqYw==
X-Gm-Message-State: AOAM532aZrEFm3ng2jmYl0kTH1V8M6I8LCETsTjCZQSgK0Cyf/TInwT2
 qe15+PjWZuUOYRPX+vLBT3Mq4ssF1BmJALPxH/1iR5X+F2XrWlyrjF+Ma/P5lOeG2s/U8OVJ6WN
 Th0LiPkgCFORF+q8=
X-Received: by 2002:a05:600c:2908:: with SMTP id
 i8mr3573077wmd.108.1628150841939; 
 Thu, 05 Aug 2021 01:07:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnHB2OG00K9YCkFkQsidef8eNGteWot9DtaVZSoVYEnMqG/ijl7ysbZ139/VjjSoHSKzSniw==
X-Received: by 2002:a05:600c:2908:: with SMTP id
 i8mr3573055wmd.108.1628150841690; 
 Thu, 05 Aug 2021 01:07:21 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c630b.dip0.t-ipconnect.de. [91.12.99.11])
 by smtp.gmail.com with ESMTPSA id
 l5sm5967522wrc.90.2021.08.05.01.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 01:07:21 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210730085249.8246-1-david@redhat.com>
 <20210730085249.8246-7-david@redhat.com>
 <5f8c6173-046d-9fc2-c649-93ede45ca77d@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 6/7] migration/postcopy: Handle RAMBlocks with a
 RamDiscardManager on the destination
Message-ID: <a5ef8f64-0336-c5fa-a81e-2caed5296dee@redhat.com>
Date: Thu, 5 Aug 2021 10:07:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5f8c6173-046d-9fc2-c649-93ede45ca77d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.08.21 09:48, Philippe Mathieu-Daudé wrote:
> On 7/30/21 10:52 AM, David Hildenbrand wrote:
>> Currently, when someone (i.e., the VM) accesses discarded parts inside a
>> RAMBlock with a RamDiscardManager managing the corresponding mapped memory
>> region, postcopy will request migration of the corresponding page from the
>> source. The source, however, will never answer, because it refuses to
>> migrate such pages with undefined content ("logically unplugged"): the
>> pages are never dirty, and get_queued_page() will consequently skip
>> processing these postcopy requests.
>>
>> Especially reading discarded ("logically unplugged") ranges is supposed to
>> work in some setups (for example with current virtio-mem), although it
>> barely ever happens: still, not placing a page would currently stall the
>> VM, as it cannot make forward progress.
>>
>> Let's check the state via the RamDiscardManager (the state e.g.,
>> of virtio-mem is migrated during precopy) and avoid sending a request
>> that will never get answered. Place a fresh zero page instead to keep
>> the VM working. This is the same behavior that would happen
>> automatically without userfaultfd being active, when accessing virtual
>> memory regions without populated pages -- "populate on demand".
>>
>> For now, there are valid cases (as documented in the virtio-mem spec) where
>> a VM might read discarded memory; in the future, we will disallow that.
>> Then, we might want to handle that case differently, e.g., warning the
>> user that the VM seems to be mis-behaving.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   migration/postcopy-ram.c | 31 +++++++++++++++++++++++++++----
>>   migration/ram.c          | 21 +++++++++++++++++++++
>>   migration/ram.h          |  1 +
>>   3 files changed, 49 insertions(+), 4 deletions(-)
>>
>> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
>> index 2e9697bdd2..38cdfc09c3 100644
>> --- a/migration/postcopy-ram.c
>> +++ b/migration/postcopy-ram.c
>> @@ -671,6 +671,29 @@ int postcopy_wake_shared(struct PostCopyFD *pcfd,
>>       return ret;
>>   }
>>   
>> +static int postcopy_request_page(MigrationIncomingState *mis, RAMBlock *rb,
>> +                                 ram_addr_t start, uint64_t haddr)
>> +{
>> +    void *aligned = (void *)(uintptr_t)(haddr & -qemu_ram_pagesize(rb));
> 
>    void *aligned = QEMU_ALIGN_PTR_DOWN(haddr, qemu_ram_pagesize(rb)));
> 

Does not compile as haddr is not a pointer.

void *aligned = QEMU_ALIGN_PTR_DOWN((void *)haddr, qemu_ram_pagesize(rb)));

should work.

I can also add a patch to adjust a similar call in
migrate_send_rp_req_pages()!

Thanks!

-- 
Thanks,

David / dhildenb


