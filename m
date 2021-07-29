Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 177783DAC71
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 22:07:30 +0200 (CEST)
Received: from localhost ([::1]:38124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9CJV-000232-5R
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 16:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m9CIS-0001Ky-Lw
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 16:06:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m9CIQ-0004DW-Cz
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 16:06:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627589181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZoOP0k2sd9hCpP3zpxcH8FPtkWS/3sHlMZmyPbArQcM=;
 b=H+WF8jltKoau0rmPChdwXLUANqpFo7YvBVz7qpPFRW2ZCzOQraxgznzXKxcikelmYTZja8
 U1SlyBSKOw+FU4QeaCgCin9+eCJn7kEaPTWB1h4akCPFzNxJ4FgYfvxBjlchhfxVOY2m5D
 Etm84SbP59NDs8bL9GasR6O7eclx6Bg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-6Ii8l9dkMyabR50ID4WYHQ-1; Thu, 29 Jul 2021 16:06:19 -0400
X-MC-Unique: 6Ii8l9dkMyabR50ID4WYHQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 n1-20020a5d59810000b029013cd60e9baaso2573394wri.7
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 13:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZoOP0k2sd9hCpP3zpxcH8FPtkWS/3sHlMZmyPbArQcM=;
 b=DDGricq+nc7Hga4vH3HZs6vqNyuKTR68qfZucE4+X4q8p5m93lDna20yTyj7YtEodx
 xfq9gPXbNUTGsOCSGVjnF/WVebRlpM+PxpfCtC39J1VFaVXUKTBuqQUMs5++cy3zdX7s
 9DtvwvAi2etfJ4mqn75RrKfLueb8J1PhGSNkrPFqmfvBwKOg0BWJ+9th/+m7JZb7ZoMv
 8XDzgzrm203pqWKZiMqLy61gwq9iCU6KRl56AojbqB2mtMSC+BAMsfjDplOMy0LcvK25
 FAG6z9zD+LeU5WBiVqQivMi9TQBYj8ZPHd80FDS46bftU/0tMKAnZRsUYXbSKRdG1d/f
 oIJQ==
X-Gm-Message-State: AOAM5312D1F8I5wW/8WmD/NKNXr3P5haNJ2k0e5gub+93I058fN63qRv
 BmwTlPeKcwRuW5BTKQMczhlNQQKU5+rHQCeMIeBukp72cHg/3s4cRjQz3wr7pGDoJpt7SB+DjVw
 +3aBlJniNpxFXLgw=
X-Received: by 2002:a7b:cc16:: with SMTP id f22mr138572wmh.99.1627589178653;
 Thu, 29 Jul 2021 13:06:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7Otxlnh6H9IF90w0DLbJBeCuEVrj58UE+4tlXblNnr2027mXDA/hIXYf0oMpkW5PR4oxg6g==
X-Received: by 2002:a7b:cc16:: with SMTP id f22mr138539wmh.99.1627589178413;
 Thu, 29 Jul 2021 13:06:18 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id a8sm4385581wmj.8.2021.07.29.13.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 13:06:17 -0700 (PDT)
Subject: Re: [PATCH v2 0/6] migration/ram: Optimize for virtio-mem via
 RamDiscardManager
To: Peter Xu <peterx@redhat.com>
References: <YQA+CUCWV4YDdu9C@t490s>
 <74271964-c481-7168-2a70-ea9eb5067450@redhat.com> <YQGzLl9IHod5rJRb@t490s>
 <b54cab91-87a6-298c-e527-0f75f8c38c74@redhat.com> <YQG74AsEBE0uaN4U@t490s>
 <a1c80a40-2828-3373-c906-870f0dbb6db8@redhat.com> <YQLTUIvrVe+TM/lw@t490s>
 <df5c7623-9986-d282-2ee9-eb28908d2994@redhat.com> <YQMCUHWuviDcIc+I@t490s>
 <cebb804b-4b85-8619-0fd0-7aad5a261384@redhat.com> <YQMI4HLsgnfsU/Wh@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <a5551871-61ce-0cef-dfb1-7738b38d2be8@redhat.com>
Date: Thu, 29 Jul 2021 22:06:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQMI4HLsgnfsU/Wh@t490s>
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Juan Quintela <quintela@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29.07.21 22:00, Peter Xu wrote:
> On Thu, Jul 29, 2021 at 09:39:24PM +0200, David Hildenbrand wrote:
>>
>>>> In the meantime I adjusted the code but it does the clearing under the
>>>> iothread lock, which should not be what we want ... I'll have a look.
>>>
>>> Thanks; if it takes more changes than expected we can still start from simple,
>>> IMHO, by taking bql and timely yield it.
>>>
>>> At the meantime, I found two things in ram_init_bitmaps() that I'm not sure we
>>> need them of not:
>>>
>>>     1. Do we need WITH_RCU_READ_LOCK_GUARD() if with both bql and ramlist lock?
>>>        (small question)
>>
>> Good question, I'm not sure if we need it.
>>
>>>
>>>     2. Do we need migration_bitmap_sync_precopy() even if dirty bmap is all 1's?
>>>        (bigger question)
>>
>> IIRC, the bitmap sync will fetch the proper dirty bitmap from KVM and set
>> the proper bits in the clear_bitmap. So once we call
>> migration_clear_memory_region_dirty_bitmap_range() etc. later we will
>> actually clear dirty bits.
> 
> Good point, however.. then I'm wondering whether we should just init clear_bmap
> to all 1's too when init just like dirty bmap. :)

Yes, but ... I'm not sure if we have to get the dirty bits into 
KVMSlot->dirty_bmap as well in order to clear them.

It could work with "manual_dirty_log_protect". For 
!manual_dirty_log_protect we might have to keep it that way ... which 
means we might have to expose some ugly details up to migration/ram.c .
Might require some thought :)

> 
> Besides: let's not be affected with these details as they should be more
> suitable to be handled separately; maybe I'll follow this up.  It could be a
> place to discuss things, but shouldn't be a burden to block this series.


Agreed :)


-- 
Thanks,

David / dhildenb


