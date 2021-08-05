Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C713E0FFF
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 10:13:39 +0200 (CEST)
Received: from localhost ([::1]:33296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBYVW-0007mE-6Y
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 04:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBYSi-00066S-MR
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 04:10:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBYSh-0004X7-3J
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 04:10:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628151042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=flrhPSArsqg3ZaDN+CbAZdw/+2bb0a1s7rhZr0r3x/E=;
 b=GoDNU3ZwABsDqpdoBvtY7Pr2zJpqcIgIn87HMM/zFtkeeBTLbvKsL4+D1sHV5nvrLFdLOL
 elfjCP9bNCUn0pPa5EifLuPcYmKVHMU3CY7p2LvuGL52McOLHdkUYhU/K7H0Oth0Yax4It
 gQOKTkG7Zj62DSLeZMJhtj/jHLHvcZM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-Sw71e_O6OTyOc_f-8bK4TQ-1; Thu, 05 Aug 2021 04:10:41 -0400
X-MC-Unique: Sw71e_O6OTyOc_f-8bK4TQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 g187-20020a1c20c40000b02902458d430db6so980908wmg.9
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 01:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=flrhPSArsqg3ZaDN+CbAZdw/+2bb0a1s7rhZr0r3x/E=;
 b=Md/Ap96m9acGheGVsyq4IqhlbOd9a4TLmH1pfxgH5x2RxW0A5xnk8lbD99zeTE0/nc
 Tzmpw7JJJLU3ONiZoyxJJ1uLFWIpMdkcsYn5Ax4/ZlISsfoXZTWxsGG5VFPLPN29JunS
 EvOTqlPnGWz60YzmVKUTHIgXXaZaCBkf6UsMal37N4AsTPdMHJvFDPNwPu++1s5HGrd1
 JF5HrV9uegsa1Ie3ktB7swaTaeFpEPtnfCHXJ9DGKV3e2TsikYjyhCNRIjQ9sOoMPp1b
 w5txzrAOI9QkfKMUtz+XWp2dDZQrPaEqxZzh/6dPNQslUtmcPImamXvYuJgJsuGH5Qxi
 o72A==
X-Gm-Message-State: AOAM532/FxMZbOLVw6rIZHbCEZv9Sc4cqXu9CfSEAGcMYzyBzPAG/7a2
 3Bq3clMjrG+cYjRh7nNFabGj6+RJFVl0sZNHt94Iqm1BwKGLzaMQ2nmQDLY8PB33vYv/Jmj/g8L
 /QO5uGoWA/bq+U74=
X-Received: by 2002:a7b:c041:: with SMTP id u1mr3523330wmc.95.1628151039824;
 Thu, 05 Aug 2021 01:10:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyst9+HYp/PhRTlwwyWUCdgMwqwtY398k8JcKNDxJpPNL0XHZQ17EI6AJbxoPopOnYohZqJaA==
X-Received: by 2002:a7b:c041:: with SMTP id u1mr3523306wmc.95.1628151039629;
 Thu, 05 Aug 2021 01:10:39 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c630b.dip0.t-ipconnect.de. [91.12.99.11])
 by smtp.gmail.com with ESMTPSA id
 m9sm5144546wrz.75.2021.08.05.01.10.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 01:10:39 -0700 (PDT)
Subject: Re: [PATCH v3 6/7] migration/postcopy: Handle RAMBlocks with a
 RamDiscardManager on the destination
To: Peter Xu <peterx@redhat.com>
References: <20210730085249.8246-1-david@redhat.com>
 <20210730085249.8246-7-david@redhat.com> <YQsrIQ4gvP6M+/rS@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <14437dd7-88b2-94df-a70f-e5c38ca861e1@redhat.com>
Date: Thu, 5 Aug 2021 10:10:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQsrIQ4gvP6M+/rS@t490s>
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
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 05.08.21 02:04, Peter Xu wrote:
> On Fri, Jul 30, 2021 at 10:52:48AM +0200, David Hildenbrand wrote:
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
>> +
>> +    /*
>> +     * Discarded pages (via RamDiscardManager) are never migrated. On unlikely
>> +     * access, place a zeropage, which will also set the relevant bits in the
>> +     * recv_bitmap accordingly, so we won't try placing a zeropage twice.
>> +     *
>> +     * Checking a single bit is sufficient to handle pagesize > TPS as either
>> +     * all relevant bits are set or not.
>> +     */
>> +    assert(QEMU_IS_ALIGNED(start, qemu_ram_pagesize(rb)));
> 
> Is this check for ramblock_page_is_discarded()?  If so, shall we move this into
> it, e.g. after memory_region_has_ram_discard_manager() returned true?
> 

It has to hold true also when calling migrate_send_rp_req_pages().

Both callers -- postcopy_request_shared_page() and 
postcopy_ram_fault_thread() properly align the offset down (but not the 
host address). This check is just to make sure we don't mess up in the 
future.

-- 
Thanks,

David / dhildenb


