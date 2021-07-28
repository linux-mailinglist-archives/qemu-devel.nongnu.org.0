Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058A33D9475
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 19:42:20 +0200 (CEST)
Received: from localhost ([::1]:52902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8nZT-0005Mp-3A
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 13:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8nX0-0003vi-9F
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 13:39:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8nWy-0005J6-HW
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 13:39:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627493983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zSqAAQXB6U6kIwNNp8nQ/392MMttolQYeNQOO2HwZ/o=;
 b=HRANq3K911AadOvHeGWtU4LqkPGFkPyO7WbC018h8ppW8V4xCgJFCsdmrpv27YHNy+jkCi
 1rwjNwHAEMa9WZxTWdNiwGakV9OKABfm4iUytixqXDI1HdFV941g2KoQJE8zV6j+7b3BL2
 sat1Oa/PiMbJ3Gt26lmHx5G82cxCtH4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-SuLf2tLYMf2Xv3tnWkOEBg-1; Wed, 28 Jul 2021 13:39:42 -0400
X-MC-Unique: SuLf2tLYMf2Xv3tnWkOEBg-1
Received: by mail-wr1-f70.google.com with SMTP id
 o8-20020a5d4a880000b029013a10564614so1207079wrq.15
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 10:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=zSqAAQXB6U6kIwNNp8nQ/392MMttolQYeNQOO2HwZ/o=;
 b=NETZ/rTtAv1RxoFrdEW6Dh0Wt7m5HuaC1Yf0lLUeLh5VXfPvQMHIgMcFz6OCRIY3+V
 YdV4a46YZj7kfzAqi7PzzyPnWYbCPZt+xl7pVSJPdECRPxKeScz528bTcWeD6gzf8JKM
 4g0hIqWUMg0L2i8ds+B73Jk/CIXVsWRX5xgLgSQdYf/uQhpopHZooeqI+BJxpnV0OJpT
 DI89BNXtGbxMuoAwiB5dkx/O/z/RbS6qbAGE9P9YQPIYIeNsRszF5KQjkzHpJ3bh4dTW
 2J1M923pPFev0uZXt77r64iDohMekHarePsnh+887x6HcJdWScl6q+Kqv9N0OMMZZLk6
 29Sw==
X-Gm-Message-State: AOAM533azOO92xBlexl4WqUjY8I3Tyq06twCx7OFnPgpLGi4/hAWerwt
 3PGHGDMRJ+mlbdU6BGLZFnAlYGQtuDAV696jvxs4NWRigYFp8oXa5Jp8Hu2Z/MablU8oyaB7fA/
 udev58Ouopt8S85E=
X-Received: by 2002:a1c:f214:: with SMTP id s20mr812636wmc.14.1627493981275;
 Wed, 28 Jul 2021 10:39:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjd1R/NsOGLyzOyvibnhz8PFa+8HZbYT3Ym15TXgV03aLIsRE978vSSltoZfGx4hIqCFUXgA==
X-Received: by 2002:a1c:f214:: with SMTP id s20mr812607wmc.14.1627493981016;
 Wed, 28 Jul 2021 10:39:41 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id f7sm561481wrr.54.2021.07.28.10.39.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 10:39:40 -0700 (PDT)
To: Peter Xu <peterx@redhat.com>
References: <20210721092759.21368-1-david@redhat.com>
 <YPlWqs8N+NiFH/yj@work-vm> <800e421c-70b8-1ef2-56f7-cdbce7a7706b@redhat.com>
 <YPrqfkCk7EM7QLpa@t490s> <ea9e9071-4ecb-9c28-9567-92585a18b4eb@redhat.com>
 <YPtAd+JqfNeQqGib@t490s> <da54f4ab-2f20-a780-1a9c-b6f4c1c50969@redhat.com>
 <YQA+CUCWV4YDdu9C@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 0/6] migration/ram: Optimize for virtio-mem via
 RamDiscardManager
Message-ID: <74271964-c481-7168-2a70-ea9eb5067450@redhat.com>
Date: Wed, 28 Jul 2021 19:39:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQA+CUCWV4YDdu9C@t490s>
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

On 27.07.21 19:10, Peter Xu wrote:
> On Tue, Jul 27, 2021 at 11:25:09AM +0200, David Hildenbrand wrote:
>> For 2) I see 3 options:
>>
>> a) Sync everything, fixup the dirty bitmap, never clear the dirty log of
>> discarded parts. It's fairly simple and straight forward, as I can simply
>> reuse the existing helper. Something that's discarded will never be dirty,
>> not even if a misbehaving guest touches memory it shouldn't. [this patch]
>>
>> b) Sync only populated parts, no need to fixup the dirty bitmap, never clear
>> the dirty log of discarded parts. It's a bit more complicated but achieves
>> the same goal as a). [optimization I propose for the future]
>>
>> c) Sync everything, don't fixup the dirty bitmap, clear the dirty log of
>> discarded parts initially. There are ways we still might migrate discarded
>> ranges, for example, if a misbehaving guest touches memory it shouldn't.
>> [what you propose]
>>
>> Is my understanding correct? Any reasons why we should chose c) over b) long
>> term or c) over a) short term?
> 
> My major concern is we could do something during sync() for not a very good
> reason by looping over virtio-mem bitmap for disgarded ranges - IIUC it should
> be destined to be merely no-op if the guest is well-behaved, am I right?

I think yes, as long as we have no initially-set bit stuck somewhere.

> 
> Meanwhile, I still have no idea how much overhead the "loop" part could bring.
> For a large virtio-mem region with frequent plugged/unplugged mem interacted,
> it seems possible to take a while to me..  I have no solid idea yet.

Let's do some math. Assume the worst case on a 1TiB device with a 2MiB 
block size: We have 524288 blocks == bits. That's precisely a 64k bitmap 
in virtio-mem. In the worst case, every second bit would be clear 
("discarded"). For each clear bit ("discarded"), we would have to clear 
512 bits (64 bytes) in the dirty bitmap. That's storing 32 MiB.

So scanning 64 KiB, writing 32 MiB. Certainly not perfect, but I am not 
sure if it will really matter doing that once on every bitmap sync. I 
guess the bitmap syncing itself is much more expensive -- and not 
syncing the discarded ranges (b ) above) would make a bigger impact I guess.

> 
> The thing is I still think this extra operation during sync() can be ignored by
> simply clear dirty log during bitmap init, then.. why not? :)

I guess clearing the dirty log (especially in KVM) might be more 
expensive. But, anyhow, we actually want b) long-term :)

> 
> Clear dirty bitmap is as simple as "reprotect the pages" functional-wise - if
> they are unplugged memory ranges, and they shouldn't be written by the guest
> (we still allow reads even for virtio-mem compatibility), then I don't see it
> an issue to wr-protect it using clear dirty log when bitmap init.
> 
> It still makes sense to me to keep the dirty/clear bitmap in-sync, at least
> before your plan b proposal; leaving the dirty bits set forever on unplugged
> memory is okay but just sounds a bit weird.
> 
> Though my concern is only valid when virtio-mem is used, so I don't have a
> strong opinion on it as you maintains virtio-mem. I believe you will always
> have a better judgement than me on that. Especially, when/if Dave & Juan have
> no problem on that. :)

I'd certainly sleep better at night if I can be 100% sure that a page 
not to be migrated will not get migrated. :)

I'll play with initial clearing and see how much of a difference it 
makes code wise. Thanks a lot for your feedback!

-- 
Thanks,

David / dhildenb


