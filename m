Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620EF3E1010
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 10:18:52 +0200 (CEST)
Received: from localhost ([::1]:42930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBYaZ-0005yL-FK
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 04:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mBYZT-0005HX-JI
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 04:17:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mBYZR-00027N-1k
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 04:17:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628151459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dZpcYFqTpL+F2v7tIvjaEs9K6InPGhugIlkFJawQ1Kk=;
 b=FeNZaG1pL3rSpy4RP5m68m5krwMcLynHjxBkp7NXYSpmNI4X3dYYQ6HPOsR7zRjZf0Z5k4
 5wtqzCKB3jUKexJJO2mknuBnyC3WQNWvyUEh3gS76NrV9qHZiFdrwok/jYcq4v1bu+W7pf
 FJ0k+ZMvn5TT5CJMVTYg3CL3fKdcfN4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-hJn5iztkNBmE1HXGga1h_A-1; Thu, 05 Aug 2021 04:17:36 -0400
X-MC-Unique: hJn5iztkNBmE1HXGga1h_A-1
Received: by mail-wm1-f69.google.com with SMTP id
 k13-20020a05600c1c8db029025018ac4f7dso1363644wms.2
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 01:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dZpcYFqTpL+F2v7tIvjaEs9K6InPGhugIlkFJawQ1Kk=;
 b=rI4a/a3sIXwdCLazhAPML9EC7hxPq2fLzZWyTeparoRQTv6UwdmzIGWuazZ5OfELPi
 CvTy1VnKgRzaJ50Q2YrcFTcZ91X/8VvtMZnyWlALHt9vHqdhJfrRWzLhEimk69Q0UAuX
 LL9s+jGDQR6+cdyTxq2ky+NwrkwtLuwnuDCIoCyAt0uVX7qyONB2y6VwzLWBaodo9DmK
 CyDE1nwHQ0lnsPZ87qHF+HvRQtY2yU/AUZQjdL3LdOugUaGCjsBljBLfVlQ6kSrdt2M5
 C8UY8hzlP6A6jUv5MNohrXH4RxYRwfzNaU71hZcfr8dUUQWRfM85g03CcsIPEyp39Me2
 dC+g==
X-Gm-Message-State: AOAM533F4oGu7OLKKdWNQYy4Tt+4HLRHIsHj1vjkUnYIUtoDW0HxSkY8
 PM9wZSnmkf8/Gp6w/ZiCsGI8xl4sWHcN/JREI864HgON/ga6TGCal6aJUe+A4DHCOci6nLDldiN
 PJVZU1jQPSptejRY=
X-Received: by 2002:a7b:c3ce:: with SMTP id t14mr3678870wmj.50.1628151454935; 
 Thu, 05 Aug 2021 01:17:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZ53/uyGGGk06OHppHADXIbtTUhTlvUNe/jvI3UtCpzRvLzznuTQV8+pkWh2AgJOFL5fvXJg==
X-Received: by 2002:a7b:c3ce:: with SMTP id t14mr3678845wmj.50.1628151454753; 
 Thu, 05 Aug 2021 01:17:34 -0700 (PDT)
Received: from [192.168.43.238] (109.red-95-127-154.staticip.rima-tde.net.
 [95.127.154.109])
 by smtp.gmail.com with ESMTPSA id 140sm4977580wmb.43.2021.08.05.01.17.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 01:17:34 -0700 (PDT)
Subject: Re: [PATCH v3 6/7] migration/postcopy: Handle RAMBlocks with a
 RamDiscardManager on the destination
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210730085249.8246-1-david@redhat.com>
 <20210730085249.8246-7-david@redhat.com>
 <5f8c6173-046d-9fc2-c649-93ede45ca77d@redhat.com>
 <a5ef8f64-0336-c5fa-a81e-2caed5296dee@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2c8d80ad-f171-7d5f-3235-92f02fa174b3@redhat.com>
Date: Thu, 5 Aug 2021 10:17:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a5ef8f64-0336-c5fa-a81e-2caed5296dee@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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

On 8/5/21 10:07 AM, David Hildenbrand wrote:
> On 05.08.21 09:48, Philippe Mathieu-Daudé wrote:
>> On 7/30/21 10:52 AM, David Hildenbrand wrote:
>>> Currently, when someone (i.e., the VM) accesses discarded parts inside a
>>> RAMBlock with a RamDiscardManager managing the corresponding mapped
>>> memory
>>> region, postcopy will request migration of the corresponding page
>>> from the
>>> source. The source, however, will never answer, because it refuses to
>>> migrate such pages with undefined content ("logically unplugged"): the
>>> pages are never dirty, and get_queued_page() will consequently skip
>>> processing these postcopy requests.
>>>
>>> Especially reading discarded ("logically unplugged") ranges is
>>> supposed to
>>> work in some setups (for example with current virtio-mem), although it
>>> barely ever happens: still, not placing a page would currently stall the
>>> VM, as it cannot make forward progress.
>>>
>>> Let's check the state via the RamDiscardManager (the state e.g.,
>>> of virtio-mem is migrated during precopy) and avoid sending a request
>>> that will never get answered. Place a fresh zero page instead to keep
>>> the VM working. This is the same behavior that would happen
>>> automatically without userfaultfd being active, when accessing virtual
>>> memory regions without populated pages -- "populate on demand".
>>>
>>> For now, there are valid cases (as documented in the virtio-mem spec)
>>> where
>>> a VM might read discarded memory; in the future, we will disallow that.
>>> Then, we might want to handle that case differently, e.g., warning the
>>> user that the VM seems to be mis-behaving.
>>>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> ---
>>>   migration/postcopy-ram.c | 31 +++++++++++++++++++++++++++----
>>>   migration/ram.c          | 21 +++++++++++++++++++++
>>>   migration/ram.h          |  1 +
>>>   3 files changed, 49 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
>>> index 2e9697bdd2..38cdfc09c3 100644
>>> --- a/migration/postcopy-ram.c
>>> +++ b/migration/postcopy-ram.c
>>> @@ -671,6 +671,29 @@ int postcopy_wake_shared(struct PostCopyFD *pcfd,
>>>       return ret;
>>>   }
>>>   +static int postcopy_request_page(MigrationIncomingState *mis,
>>> RAMBlock *rb,
>>> +                                 ram_addr_t start, uint64_t haddr)
>>> +{
>>> +    void *aligned = (void *)(uintptr_t)(haddr &
>>> -qemu_ram_pagesize(rb));
>>
>>    void *aligned = QEMU_ALIGN_PTR_DOWN(haddr, qemu_ram_pagesize(rb)));
>>
> 
> Does not compile as haddr is not a pointer.

I suppose the typeof() fails?

/* n-byte align pointer down */
#define QEMU_ALIGN_PTR_DOWN(p, n) \
    ((typeof(p))QEMU_ALIGN_DOWN((uintptr_t)(p), (n)))


> void *aligned = QEMU_ALIGN_PTR_DOWN((void *)haddr, qemu_ram_pagesize(rb)));
> 
> should work.

What about

void *aligned = QEMU_ALIGN_DOWN(haddr, qemu_ram_pagesize(rb)));

else

void *aligned = (void *)QEMU_ALIGN_DOWN(haddr, qemu_ram_pagesize(rb)));

I don't mind much the style you prefer, as long as it compiles :p
But these QEMU_ALIGN_DOWN() macros make the review easier than (a & -b).

> I can also add a patch to adjust a similar call in
> migrate_send_rp_req_pages()!
> 
> Thanks!
> 


