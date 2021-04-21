Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 431C5366E78
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 16:50:07 +0200 (CEST)
Received: from localhost ([::1]:43764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZEB3-0001Ku-Sn
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 10:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lZE9u-0000uE-L4
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 10:48:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lZE9s-0002PP-0P
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 10:48:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619016530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=48FrQO93lqPJ9WJ13Ly8iYsyf9Q5DpKJ4OM9p1V9Pyg=;
 b=ZB0Eo6rh1z3p0Mlb+TuE+NqyX2/N4SsFyZWoUnnohymJvg3an157zPhnNjm0FUuN1t9ZT+
 HwWAakny8sYOr0wpljUX8RmJLFxnUyA52vhTPsG2hx98wU4DLz0kvhptesIpU+Ca7TaMxH
 3Y65QuPIierRvuwlXZEgs1oIDnXEJco=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-3k-xPaOUNryi3Hmnjanykw-1; Wed, 21 Apr 2021 10:48:49 -0400
X-MC-Unique: 3k-xPaOUNryi3Hmnjanykw-1
Received: by mail-qt1-f199.google.com with SMTP id
 y10-20020a05622a004ab029019d4ad3437cso13310034qtw.12
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 07:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=48FrQO93lqPJ9WJ13Ly8iYsyf9Q5DpKJ4OM9p1V9Pyg=;
 b=TvFZF96kSvjHo4zmZSKneF8Xor+WBcttiJtcusSd4k1X8kbxuauutBJGI5JYWeYw58
 97rc33qDLzX+VZTwo98ZH8zvmNzIZzpJUzjMestt+naoQKYmOPDdoO+Ur8TuE4V/NYIl
 lpDMCwEXs+6GQsiNXm9tSxxvgtC91ObgOxjBPWbCU14pueFQLirR9BqdFUXmTfvT7FOD
 6SE/Q7dvxjVez0otm+MN1ymlIOhTd7f3j+tZl1Rf3HzwpOTyLVkTHNRd1NZZlQLnPytp
 7e1ySwCRDOGdrH0cz6ncoPne7+JM+4B9+Z22OfAxrdWhR5IjM79OEkY9+RzsOX69pejs
 +N1A==
X-Gm-Message-State: AOAM532mwYxSroTQST5Bs/NKIjlFsp71eT5Z82PtldmUQmY5btfAYC45
 I4Izdx1v4qt4iOstqPWOD8kR4QRqHriYdeofMHX35N/AOpKiuHyyJvZVTFQqOwkfwczUPj0Iskq
 GL85FUqZK5CWuKB4=
X-Received: by 2002:a05:620a:14ba:: with SMTP id
 x26mr6665989qkj.457.1619016528647; 
 Wed, 21 Apr 2021 07:48:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1hUOjdCOulB25ZKNQvZ8HENZpP5Ip9t3oZtl2TADkI4L/+RprDwbz/V68PbG8Uy7HaKt/oA==
X-Received: by 2002:a05:620a:14ba:: with SMTP id
 x26mr6665960qkj.457.1619016528248; 
 Wed, 21 Apr 2021 07:48:48 -0700 (PDT)
Received: from xz-x1
 (bras-base-toroon474qw-grc-77-184-145-104-227.dsl.bell.ca. [184.145.104.227])
 by smtp.gmail.com with ESMTPSA id f7sm1915203qtv.53.2021.04.21.07.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 07:48:47 -0700 (PDT)
Date: Wed, 21 Apr 2021 10:48:46 -0400
From: Peter Xu <peterx@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v3] memory: Directly dispatch alias accesses on origin
 memory region
Message-ID: <20210421144846.GI4440@xz-x1>
References: <20210417140206.673885-1-f4bug@amsat.org>
 <8f59bd60-3588-3be0-c44c-1ebfbefd78bd@ilande.co.uk>
 <67955dd0-dfc7-271f-009f-cf7247f3b6c2@amsat.org>
 <efea7689-15c6-44bf-77a8-3d6ee945d097@ilande.co.uk>
 <916b95b2-c128-69e0-6e68-78daa0b15722@amsat.org>
 <20210420205933.GF4440@xz-x1>
 <3329a158-75ce-925e-5a23-830dd2397ca1@ilande.co.uk>
MIME-Version: 1.0
In-Reply-To: <3329a158-75ce-925e-5a23-830dd2397ca1@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jan Kiszka <jan.kiszka@web.de>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 21, 2021 at 11:33:55AM +0100, Mark Cave-Ayland wrote:
> On 20/04/2021 21:59, Peter Xu wrote:
> 
> > > > I agree with this sentiment: it has taken me a while to figure out what
> > > > was happening, and that was only because I spotted accesses being
> > > > rejected with -d guest_errors.
> > > > 
> > > >  From my perspective the names memory_region_dispatch_read() and
> > > > memory_region_dispatch_write() were the misleading part, although I
> > > > remember thinking it odd whilst trying to use them that I had to start
> > > > delving into sections etc. just to recurse a memory access.
> 
> > I think it should always be a valid request to trigger memory access via the MR
> > layer, say, what if the caller has no address space context at all?
> 
> For these cases you can just use the global default address_space_memory
> which is the solution I used in the second version of my patch e.g.
> 
>     val = address_space_ldl_be(&address_space_memory, addr, attrs, &r);

Yes, but what if it's an MR that does not belong to address_space_memory?  We
can still use the other AS, however that's something we don't actually need to
worry if we can directly operate on MRs.

The other thing is if there're plenty of layers of a deep hidden MR, then we'll
also need to cache all the offsets (e.g., mr A is subregion of mr B, B is
subregion of C, C belong to a AS, then we need to record offset of A+B+C to
finally be able to access this MR from the AS?) which seems an overkill if we
know exactly we want to operate on this mr.

I randomly looked at memory_region_dispatch_write(), and I think most of them
indeed do not have the AS context.  As Peter Maydell mentioned in the other
thread, if we have plenty of users use this interface, maybe there's a reason?
I'm thinking is it possible that they "worked" simply because current users
haven't used alias that much.

> 
> > From the
> > name of memory_region_dispatch_write|read I don't see either on why we should
> > not take care of alias mrs.  That's also the reason I'd even prefer this patch
> > rather than an assert.
> 
> The problem I see here is that this patch is breaking the abstraction
> between generating the flatview from the memory topology and dispatching a
> request to it.
> 
> If you look at the existing code then aliased memory regions are
> de-referenced at flatview construction time, so you end up with a flatview
> where each range points to a target (leaf or terminating) memory region plus
> offset. You can see this if you compare the output of "info mtree" with
> "info mtree -f" in the monitor.

Yes it's a fair point.  However per my understanding, address space is solving
some other problems rather than doing memory access on its own.

Staring from flatview: AS operations uses flatview indeed, and also take care
of translations (e.g. flatview_translate), however all of them are logic to
route a AS memory access to memory region only.  If we have the mr in hand, I
see nothing helping in there but extra (useless) work to resolve the mr..

One thing I noticed that may be tricky is what we did in prepare_mmio_access()
before lands e.g. memory_region_dispatch_write() in flatview_write_continue(),
as there're tricks on taking BQL or flushing MMIO buffers. I'm not sure whether
it means if we're going to have a MR layer memory access API then the user
should be aware of them (e.g., we should have BQL taken before calling MR
APIs?).  Or, we can simply move prepare_mmio_access() into the new memory
region API too?  In all cases, that's still not an obvious reason to not having
the memory region API on its own.

We also calculate size of memory ops (memory_access_size), but what if we know
them before hand?  They could be redundant calculations too.

Then we already lands memory_region_dispatch_write().

So if we see memory_region_dispatch_write() is the point where the MR access
really starts.  I don't know whether it works for RAM, but I think that's not a
major concern either..  Then there's a fair point to export it to work for all
general cases, including aliasing.

My point may not stand solid enough as I didn't really use the mr API so I
could have things overlooked... so I think if AS APIs will work for both of you
then why not. :) However I just wanted to express my understanding that AS APIs
should majorly solve some problems else comparing to (if there's going to have)
the memory region APIs, so if we're sure we don't have those AS problems
(routing to the mr not needed as we have the mr pointer; offsetting not needed
as we even know the direct offset of the mr to write to; we know exactly the
size to operate, and so on..) then it's a valid request to ask for a memory
region layer API.

Thanks,

-- 
Peter Xu


