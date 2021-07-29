Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2433F3DABEF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 21:40:20 +0200 (CEST)
Received: from localhost ([::1]:52466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9BtD-0007wI-7j
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 15:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m9BsQ-0007DI-UF
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 15:39:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m9BsP-0002PW-9n
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 15:39:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627587568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2jtO1wqRaLHmgv4Kj3W3dnomylb+occ2lWcbt0UBxas=;
 b=bHFBrTdAber3Gk5NDOOIJqBBHzhQMoHJ6hY9KHLXHVVB1pse+/lY665ogHeJlC49e6bk5N
 I0poJkoE+4jgNt4iFQRBQaXY0hTluK8jeGNYwA+CS3smxVxbdXpnSU3H7RLoXEoQCFDAyB
 XPBL8LdPlOplYivGv9oddpV8zDTVyMI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-y00Q1nwaPje9jP0_hFrhQg-1; Thu, 29 Jul 2021 15:39:27 -0400
X-MC-Unique: y00Q1nwaPje9jP0_hFrhQg-1
Received: by mail-wm1-f71.google.com with SMTP id
 w25-20020a1cf6190000b0290252505ddd56so1085259wmc.3
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 12:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2jtO1wqRaLHmgv4Kj3W3dnomylb+occ2lWcbt0UBxas=;
 b=ic8YvRa79YMRp9R9sBjnY3Byq6NJkfw71Lo4aoqkTM9zb/Jc6ENX0wqrW4dna6rurE
 hHWlIWupUrkYhCrOmpdEIA46z+U41u/j0OX6Km9v8w/kNhLU50n6y/noZKGB/MTXOuGE
 SzZ08sNFC5n0Vq9Fh2fG9gGSY7OAwS3OwhgiaOP9+vgYYGV989PhJ5vCqqJvAdlfChXB
 WGbJzF/ST9eJ6YmTUc1gDUU/18v52mtzvVwVgICQjWSTZsxeySqkPXMhmWE2o1ClAIYf
 60ov4Ci3r65g6ifONEPFdGeeIxVHOyervpdVT5zRJZ4tBr3RccCI3f2SDyiLREUkqdQ6
 seVA==
X-Gm-Message-State: AOAM533UNpdbAWhUFLR7xXM0+d0/nvvRRxDUg2x0OXMT4nznj92TMk1k
 8UHOQrOlge2BGudYrFU9ULCkBUvIUHe2jeL8SMsmJXWa9wespFCjSQ/AuOswY8qF1SVLTJXDBm0
 E6cMM24XtCqzec4k=
X-Received: by 2002:a7b:c30f:: with SMTP id k15mr64653wmj.128.1627587565931;
 Thu, 29 Jul 2021 12:39:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRsLJUZkMisxc6zLjoiqIZcAMYidNoGcN/MaBkflrZFBw+A2IdQ+zEz9actWd0KZ71OCqJIg==
X-Received: by 2002:a7b:c30f:: with SMTP id k15mr64635wmj.128.1627587565744;
 Thu, 29 Jul 2021 12:39:25 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id y19sm9957609wma.21.2021.07.29.12.39.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 12:39:25 -0700 (PDT)
To: Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>
References: <YPtAd+JqfNeQqGib@t490s>
 <da54f4ab-2f20-a780-1a9c-b6f4c1c50969@redhat.com> <YQA+CUCWV4YDdu9C@t490s>
 <74271964-c481-7168-2a70-ea9eb5067450@redhat.com> <YQGzLl9IHod5rJRb@t490s>
 <b54cab91-87a6-298c-e527-0f75f8c38c74@redhat.com> <YQG74AsEBE0uaN4U@t490s>
 <a1c80a40-2828-3373-c906-870f0dbb6db8@redhat.com> <YQLTUIvrVe+TM/lw@t490s>
 <df5c7623-9986-d282-2ee9-eb28908d2994@redhat.com> <YQMCUHWuviDcIc+I@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 0/6] migration/ram: Optimize for virtio-mem via
 RamDiscardManager
Message-ID: <cebb804b-4b85-8619-0fd0-7aad5a261384@redhat.com>
Date: Thu, 29 Jul 2021 21:39:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQMCUHWuviDcIc+I@t490s>
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
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>, qemu-devel@nongnu.org,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>> In the meantime I adjusted the code but it does the clearing under the
>> iothread lock, which should not be what we want ... I'll have a look.
> 
> Thanks; if it takes more changes than expected we can still start from simple,
> IMHO, by taking bql and timely yield it.
> 
> At the meantime, I found two things in ram_init_bitmaps() that I'm not sure we
> need them of not:
> 
>    1. Do we need WITH_RCU_READ_LOCK_GUARD() if with both bql and ramlist lock?
>       (small question)

Good question, I'm not sure if we need it.

> 
>    2. Do we need migration_bitmap_sync_precopy() even if dirty bmap is all 1's?
>       (bigger question)

IIRC, the bitmap sync will fetch the proper dirty bitmap from KVM and 
set the proper bits in the clear_bitmap. So once we call 
migration_clear_memory_region_dirty_bitmap_range() etc. later we will 
actually clear dirty bits.

Without that, migration_clear_memory_region_dirty_bitmap_range() is a 
nop and we might migrate stuff unnecessarily twice as dirty bits are not 
cleared:

I certainly need that, otherwise the 
migration_clear_memory_region_dirty_bitmap_range() is a nop and it all 
won't work as you proposed.

-- 
Thanks,

David / dhildenb


