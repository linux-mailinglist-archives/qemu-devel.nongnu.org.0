Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 622D03D962B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 21:48:19 +0200 (CEST)
Received: from localhost ([::1]:44428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8pXO-0006Ep-6v
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 15:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8pVT-0005Up-2h
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 15:46:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8pVP-0005m8-Ic
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 15:46:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627501573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nAl2QQRZD+sgG8n06KJR3IyxkIgcARXEfOqHviv6P/o=;
 b=K/GzIVYuUiaCnodnufBsLk87Bp/3FFJ0YdmBkaw+hsBWkMP6NgSOWWEv6JKBs6URx0Bbs2
 mBy08gVcJMBSdpH3WD438BuOMGLeORXBwokUpSAUooZw2qx4XLPOHSNll8qzNtVI6Xh7Xq
 hFmZit8mdVXt3yGFrOz17iqtbYVcBWU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-7x3RmAloNxqhdmmSn2sckQ-1; Wed, 28 Jul 2021 15:46:12 -0400
X-MC-Unique: 7x3RmAloNxqhdmmSn2sckQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 25-20020a05600c0219b029024ebb12928cso1297214wmi.3
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 12:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=nAl2QQRZD+sgG8n06KJR3IyxkIgcARXEfOqHviv6P/o=;
 b=GHK0HfcLLN9zjC+WSxCf6186R1UgqxBA/t5NCVuazEYknxdSqRM62Knt3szU1U5wrg
 bOXrO++kdrZ/JOgxB4DW76rWbGVQE7/kObHpHpFm2xVLguHsF3JLBH2Yt9qGv4D2Gpf3
 Qrq2VJ1mHMtlSo8ZnIas4txV3nE46DveCfUJhPG1S3v8sFOS/xPc7dKx6HvcbOiIwcjz
 0B/GZkJ1wF34efRhm0Uy3FnZNxbLpDVjWP+5DHm1Hmd/uPvSxM2mVr/5HwCm0n3pc5xE
 scSfNuR2hKwZN1yEsA+KR430vK5vILGKN0gNlBjWjkl5QhuXj6KBYL+C5t7xI28tMPll
 UA1A==
X-Gm-Message-State: AOAM533VTOfyPZfwzQCpEh+TU6QYY26x8pKliAZFkFAcWJaBYNdMPjv/
 8LGMPpm75FHYAnXSuF0itELKguhkeMJfS6evxTWiRVq6+2jz9jGld+9dymgG+0B7Xr45UBb4rNK
 NOLCqYY75oEEYR6Y=
X-Received: by 2002:a7b:cb01:: with SMTP id u1mr1222623wmj.44.1627501570914;
 Wed, 28 Jul 2021 12:46:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjITF/+2eDCmg2kn0IGWm3TMckg/JnE2p1KD2pyhaAV0rEKGhhajypRUeTLvg1lfNC+0WY/w==
X-Received: by 2002:a7b:cb01:: with SMTP id u1mr1222599wmj.44.1627501570684;
 Wed, 28 Jul 2021 12:46:10 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id l23sm6734937wms.5.2021.07.28.12.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 12:46:10 -0700 (PDT)
Subject: Re: [PATCH v2 0/6] migration/ram: Optimize for virtio-mem via
 RamDiscardManager
To: Peter Xu <peterx@redhat.com>
References: <20210721092759.21368-1-david@redhat.com>
 <YPlWqs8N+NiFH/yj@work-vm> <800e421c-70b8-1ef2-56f7-cdbce7a7706b@redhat.com>
 <YPrqfkCk7EM7QLpa@t490s> <ea9e9071-4ecb-9c28-9567-92585a18b4eb@redhat.com>
 <YPtAd+JqfNeQqGib@t490s> <da54f4ab-2f20-a780-1a9c-b6f4c1c50969@redhat.com>
 <YQA+CUCWV4YDdu9C@t490s> <74271964-c481-7168-2a70-ea9eb5067450@redhat.com>
 <YQGzLl9IHod5rJRb@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <b54cab91-87a6-298c-e527-0f75f8c38c74@redhat.com>
Date: Wed, 28 Jul 2021 21:46:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQGzLl9IHod5rJRb@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 28.07.21 21:42, Peter Xu wrote:
> On Wed, Jul 28, 2021 at 07:39:39PM +0200, David Hildenbrand wrote:
>>> Meanwhile, I still have no idea how much overhead the "loop" part could bring.
>>> For a large virtio-mem region with frequent plugged/unplugged mem interacted,
>>> it seems possible to take a while to me..  I have no solid idea yet.
>>
>> Let's do some math. Assume the worst case on a 1TiB device with a 2MiB block
>> size: We have 524288 blocks == bits. That's precisely a 64k bitmap in
>> virtio-mem. In the worst case, every second bit would be clear
>> ("discarded"). For each clear bit ("discarded"), we would have to clear 512
>> bits (64 bytes) in the dirty bitmap. That's storing 32 MiB.
>>
>> So scanning 64 KiB, writing 32 MiB. Certainly not perfect, but I am not sure
>> if it will really matter doing that once on every bitmap sync. I guess the
>> bitmap syncing itself is much more expensive -- and not syncing the
>> discarded ranges (b ) above) would make a bigger impact I guess.
> 
> I'm not worried about the memory size to be accessed as bitmaps; it's more
> about the loop itself.  500K blocks/bits means the cb() worse case can be
> called 500K/2=250k times, no matter what's the hook is doing.
> 
> But yeah that's the worst case thing and for a 1TB chunk, I agree that can also
> be too harsh.  It's just that if it's very easy to be done in bitmap init then
> still worth thinking about it.
> 
>>
>>>
>>> The thing is I still think this extra operation during sync() can be ignored by
>>> simply clear dirty log during bitmap init, then.. why not? :)
>>
>> I guess clearing the dirty log (especially in KVM) might be more expensive.
> 
> If we send one ioctl per cb that'll be expensive for sure.  I think it'll be
> fine if we send one clear ioctl to kvm, summarizing the whole bitmap to clear.
> 
> The other thing is imho having overhead during bitmap init is always better
> than having that during sync(). :)

Oh, right, so you're saying, after we set the dirty bmap to all ones and 
excluded the discarded parts, setting the respective bits to 0, we 
simply issue clearing of the whole area?

For now I assumed we would have to clear per cb.


-- 
Thanks,

David / dhildenb


