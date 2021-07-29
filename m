Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4447B3D9F45
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 10:16:22 +0200 (CEST)
Received: from localhost ([::1]:53828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m91DJ-0003Fv-BH
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 04:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m91Bw-0002T7-CW
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:14:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m91Bs-00027z-UQ
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:14:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627546491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KWTm2AFQQJQ1nALvJ3KH563ObTx1pwlqHHuQFXbVdLM=;
 b=H/j+aalYxVu7OKfTIfHhci3Fcs1qecKxODayAhvwKWqtx7qRwBlghnKVs9PfPLKVJSGNUZ
 p0n5GLiEdHIGQxRpqufbLAglPaYcNN7sEYEjSW3V+HitAH1jDe5mygelZNthwjhep5WdAy
 E6dsIs8MPWu9fxTYI0UTHV3AbtO352M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-COuYEIyrM92PRIJb9sjMHA-1; Thu, 29 Jul 2021 04:14:50 -0400
X-MC-Unique: COuYEIyrM92PRIJb9sjMHA-1
Received: by mail-wr1-f72.google.com with SMTP id
 r14-20020a5d4e4e0000b029015409d80a01so1700107wrt.12
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 01:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=KWTm2AFQQJQ1nALvJ3KH563ObTx1pwlqHHuQFXbVdLM=;
 b=JVpJZxXvtqTFuYJFkCUHbqH8YaMM5woRFlBMc7YByPQUibPYXPvfWLLbj5Wha8FF7V
 Xcq6cgd+nUl/Vr1vyln6gTlMF8SPfHRtaFVtAOPvLRnuVPn4HRMVUcV4H9VXgyJGB/Ob
 QnGyD7E3pSL7TOvtYFOHP5xEHKXLxhLOfCUYUvQiwqynY7To+w/4qh61ukz0xM5T0kGU
 WjdG7S9trUPNxAmwtbLYphtNDCunSAfzOoewjooRZNlgRLUHH2gIXFYgAtM1q+mY95XY
 hZs5RijFRqvvRMZv4mgqa2pMJV0MlsVNfqxVz74y2C3qDdPVK3fSP4Y7b/6ysPstUFNi
 X9Lw==
X-Gm-Message-State: AOAM532rna9hYqMpPOi2aVYMXdnvQ9mtcRwc2lulLrZgV3ZgwBfOeJ9j
 qvpxrHBCoUvJwtsE1z+zqsNElMxphEIPxuvFJ2o4RjAjyn+lDBisdHL+M1XAAOx/Fr8uzDZFd3g
 3Vo8L+vYKjquOC4U=
X-Received: by 2002:a05:6000:120f:: with SMTP id
 e15mr3290065wrx.399.1627546489335; 
 Thu, 29 Jul 2021 01:14:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx93QU3/geCnFcuX5DLk3+HVK6sa/nXU2dTxGYACkujdY1x2TWCDdODdqh05JCGv4Uizml7gw==
X-Received: by 2002:a05:6000:120f:: with SMTP id
 e15mr3290037wrx.399.1627546489148; 
 Thu, 29 Jul 2021 01:14:49 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id s14sm2297731wmc.25.2021.07.29.01.14.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 01:14:48 -0700 (PDT)
To: Peter Xu <peterx@redhat.com>
References: <YPlWqs8N+NiFH/yj@work-vm>
 <800e421c-70b8-1ef2-56f7-cdbce7a7706b@redhat.com> <YPrqfkCk7EM7QLpa@t490s>
 <ea9e9071-4ecb-9c28-9567-92585a18b4eb@redhat.com> <YPtAd+JqfNeQqGib@t490s>
 <da54f4ab-2f20-a780-1a9c-b6f4c1c50969@redhat.com> <YQA+CUCWV4YDdu9C@t490s>
 <74271964-c481-7168-2a70-ea9eb5067450@redhat.com> <YQGzLl9IHod5rJRb@t490s>
 <b54cab91-87a6-298c-e527-0f75f8c38c74@redhat.com> <YQG74AsEBE0uaN4U@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 0/6] migration/ram: Optimize for virtio-mem via
 RamDiscardManager
Message-ID: <a1c80a40-2828-3373-c906-870f0dbb6db8@redhat.com>
Date: Thu, 29 Jul 2021 10:14:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQG74AsEBE0uaN4U@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

>>>>> The thing is I still think this extra operation during sync() can be ignored by
>>>>> simply clear dirty log during bitmap init, then.. why not? :)
>>>>
>>>> I guess clearing the dirty log (especially in KVM) might be more expensive.
>>>
>>> If we send one ioctl per cb that'll be expensive for sure.  I think it'll be
>>> fine if we send one clear ioctl to kvm, summarizing the whole bitmap to clear.
>>>
>>> The other thing is imho having overhead during bitmap init is always better
>>> than having that during sync(). :)
>>
>> Oh, right, so you're saying, after we set the dirty bmap to all ones and
>> excluded the discarded parts, setting the respective bits to 0, we simply
>> issue clearing of the whole area?
>>
>> For now I assumed we would have to clear per cb.
> 
> Hmm when I replied I thought we can pass in a bitmap to ->log_clear() but I
> just remembered memory API actually hides the bitmap interface..
> 
> Reset the whole region works, but it'll slow down migration starts, more
> importantly that'll be with mmu write lock so we will lose most clear-log
> benefit for the initial round of migration and stuck the guest #pf at the
> meantime...
> 
> Let's try do that in cb()s as you mentioned; I think that'll still be okay,
> because so far the clear log block size is much larger (1gb), 1tb is worst case
> 1000 ioctls during bitmap init, slightly better than 250k calls during sync(),
> maybe? :)

Just to get it right, what you propose is calling 
migration_clear_memory_region_dirty_bitmap_range() from each cb(). Due 
to the clear_bmap, we will end up clearing each chunk (e.g., 1GB) at 
most once.

But if our layout is fragmented, we can actually end up clearing all 
chunks (1024 ioctls for 1TB), resulting in a slower migration start.

Any gut feeling how much slower migration start could be with largish 
(e.g., 1 TiB) regions?

-- 
Thanks,

David / dhildenb


