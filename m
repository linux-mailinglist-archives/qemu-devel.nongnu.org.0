Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27753D9626
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 21:44:01 +0200 (CEST)
Received: from localhost ([::1]:39712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8pTE-0002uh-Ih
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 15:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8pS2-0001Vk-L0
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 15:42:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8pRz-0003Yr-KT
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 15:42:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627501362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dixDcnd6N1BrTYVPdPzyaLbyD8bQcU1LuPyncgjOC24=;
 b=DzgUZjBX0gHuJb74vF9KIVJmYEdMYuTDyJR9CxFT/+kk0+VNvFvPIx3XM+2uC+aWbvrqW2
 nZi84zwgGa59uqJHY6PL4/1hvOUwG4zJLXzBW9e1PiQl+eSoR+d1IdEMCqR4UaWS3puaHI
 wmALWWvdiqZry+N4Arz/kkRAo1Hpv1M=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-RQsGiy1oPnuiJXMdfJbp8w-1; Wed, 28 Jul 2021 15:42:41 -0400
X-MC-Unique: RQsGiy1oPnuiJXMdfJbp8w-1
Received: by mail-qv1-f71.google.com with SMTP id
 v15-20020a0ccd8f0000b0290335f005a486so2543002qvm.22
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 12:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dixDcnd6N1BrTYVPdPzyaLbyD8bQcU1LuPyncgjOC24=;
 b=s6nlsOdV3HuSYd2MtAd+VzgOEtsfLKqQQ7oFOclIha9Wm69zE85XMJ4Q1Y5XQlrKau
 TsMMG2jrf3/nz9gkOglXeBV5S56XuACWH94TXO4CbUgjRnp2MG8E8AVWAAVBhhB9DHtm
 cuqo5TTqE4ivpp8uhP8VLtRIsQ2yyKHjgQDPEoQ8oXRNDqbJMtLOW6V4n3roDBsBYLlQ
 2OEPsLPiQEwbzy5GZTbi9qC7CkC7/mkKd7jLN9y6qoCn24jV7+B13+NSH0MLIN8iONA7
 0KpHD9RevhisKjg9ZPOa2f5Mi5N2bmZomQk1WfJQwpHwhGYcrWMrnK2zAbQ/R+ZHFF93
 rPVw==
X-Gm-Message-State: AOAM531UYPyetvxcNgtoPGk4ZMvfc/49umOh1hIElqDpR3Tn3apfvB/Y
 8yvB1gGMtIoCnmxEdD5p2BXKXQVtZCZUpRLsdOzTQivx8kHWTEzx/3H6MuAwfq7BVVMNkSooIP9
 GFJyW0kMLZgMwWaE=
X-Received: by 2002:a05:622a:188d:: with SMTP id
 v13mr1139990qtc.192.1627501360551; 
 Wed, 28 Jul 2021 12:42:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8PL0yZi7ZX+MCuLRqYTsN5CasAFF0avYnqGd62aFuWCnQxv9tbHUuubGZkByXYJzHDIb3gA==
X-Received: by 2002:a05:622a:188d:: with SMTP id
 v13mr1139974qtc.192.1627501360336; 
 Wed, 28 Jul 2021 12:42:40 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id n188sm528339qke.54.2021.07.28.12.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 12:42:39 -0700 (PDT)
Date: Wed, 28 Jul 2021 15:42:38 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 0/6] migration/ram: Optimize for virtio-mem via
 RamDiscardManager
Message-ID: <YQGzLl9IHod5rJRb@t490s>
References: <20210721092759.21368-1-david@redhat.com>
 <YPlWqs8N+NiFH/yj@work-vm>
 <800e421c-70b8-1ef2-56f7-cdbce7a7706b@redhat.com>
 <YPrqfkCk7EM7QLpa@t490s>
 <ea9e9071-4ecb-9c28-9567-92585a18b4eb@redhat.com>
 <YPtAd+JqfNeQqGib@t490s>
 <da54f4ab-2f20-a780-1a9c-b6f4c1c50969@redhat.com>
 <YQA+CUCWV4YDdu9C@t490s>
 <74271964-c481-7168-2a70-ea9eb5067450@redhat.com>
MIME-Version: 1.0
In-Reply-To: <74271964-c481-7168-2a70-ea9eb5067450@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Jul 28, 2021 at 07:39:39PM +0200, David Hildenbrand wrote:
> > Meanwhile, I still have no idea how much overhead the "loop" part could bring.
> > For a large virtio-mem region with frequent plugged/unplugged mem interacted,
> > it seems possible to take a while to me..  I have no solid idea yet.
> 
> Let's do some math. Assume the worst case on a 1TiB device with a 2MiB block
> size: We have 524288 blocks == bits. That's precisely a 64k bitmap in
> virtio-mem. In the worst case, every second bit would be clear
> ("discarded"). For each clear bit ("discarded"), we would have to clear 512
> bits (64 bytes) in the dirty bitmap. That's storing 32 MiB.
> 
> So scanning 64 KiB, writing 32 MiB. Certainly not perfect, but I am not sure
> if it will really matter doing that once on every bitmap sync. I guess the
> bitmap syncing itself is much more expensive -- and not syncing the
> discarded ranges (b ) above) would make a bigger impact I guess.

I'm not worried about the memory size to be accessed as bitmaps; it's more
about the loop itself.  500K blocks/bits means the cb() worse case can be
called 500K/2=250k times, no matter what's the hook is doing.

But yeah that's the worst case thing and for a 1TB chunk, I agree that can also
be too harsh.  It's just that if it's very easy to be done in bitmap init then
still worth thinking about it.

> 
> > 
> > The thing is I still think this extra operation during sync() can be ignored by
> > simply clear dirty log during bitmap init, then.. why not? :)
> 
> I guess clearing the dirty log (especially in KVM) might be more expensive.

If we send one ioctl per cb that'll be expensive for sure.  I think it'll be
fine if we send one clear ioctl to kvm, summarizing the whole bitmap to clear.

The other thing is imho having overhead during bitmap init is always better
than having that during sync(). :)

> But, anyhow, we actually want b) long-term :)

Regarding the longterm plan - sorry to say that, but I still keep a skeptical
view.. :) 

You did mention that for 1tb memory we only have 32mb dirty bitmap, that's
actually not so huge.  That's why I'm not sure whether that complexity of plan
b would bring a lot of help (before I started to think about the interface of
it).  But I could be missing something.

> 
> > 
> > Clear dirty bitmap is as simple as "reprotect the pages" functional-wise - if
> > they are unplugged memory ranges, and they shouldn't be written by the guest
> > (we still allow reads even for virtio-mem compatibility), then I don't see it
> > an issue to wr-protect it using clear dirty log when bitmap init.
> > 
> > It still makes sense to me to keep the dirty/clear bitmap in-sync, at least
> > before your plan b proposal; leaving the dirty bits set forever on unplugged
> > memory is okay but just sounds a bit weird.
> > 
> > Though my concern is only valid when virtio-mem is used, so I don't have a
> > strong opinion on it as you maintains virtio-mem. I believe you will always
> > have a better judgement than me on that. Especially, when/if Dave & Juan have
> > no problem on that. :)
> 
> I'd certainly sleep better at night if I can be 100% sure that a page not to
> be migrated will not get migrated. :)
> 
> I'll play with initial clearing and see how much of a difference it makes
> code wise. Thanks a lot for your feedback!

Thanks!

-- 
Peter Xu


