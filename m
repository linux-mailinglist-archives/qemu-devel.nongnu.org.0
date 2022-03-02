Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7794CA7C2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 15:17:01 +0100 (CET)
Received: from localhost ([::1]:46158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPmm-00052e-9D
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 09:17:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nPOZ4-0002Ij-1y
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:58:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nPOZ0-0003rg-KX
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:58:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646225921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ls8zGvhed1PmT8PXmpNjbgsZ/iW5f7ZrkDvrKVFI5BU=;
 b=jPjgeR4mZAPP5nUdwpQ/IBwdSHnK64G1cBajxPAW7XyCD9bEY666E8W27aSF9pWsHCc10G
 CakiURxBVhUIEerk2+QC514WdXXnN5GiVInllOTV6nj8rkU8S+XwkgY62d8LCyjUVRWdYA
 CrDkGCC4T2fz4k9Mrr+OAVtWhwhhUSE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-1pbRVA8SNEe2spivBCtd4A-1; Wed, 02 Mar 2022 07:58:40 -0500
X-MC-Unique: 1pbRVA8SNEe2spivBCtd4A-1
Received: by mail-wr1-f70.google.com with SMTP id
 o9-20020adfca09000000b001ea79f7edf8so610631wrh.16
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 04:58:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ls8zGvhed1PmT8PXmpNjbgsZ/iW5f7ZrkDvrKVFI5BU=;
 b=1pnxY4jZNQ2No/SLBdTKrspzEQwYsI+ZQVUn+b4o+CXhKhGbzetREzmUsqgasvW+VB
 F2NKGkP67/JIyzdpOu2yW3shdQf8tnp6TJ2OqMNaOHeHZKIGkNp9wUFLuXnHqCGfDT4w
 7uya3eG2OEnGKFymfCOOepW+LckBx2jUpt80vwOOdGcACJU/QQCuXPmR2OmAv9kFpHtf
 CRyr3iWIbyOgta2l6Be+4gakShLS1a7Uo8FsbEPk8o1Wa9hFM9Lr2ouQ9K9UnAUW838C
 AfJVC/Hsjw5hNRbl3FIkD9Of6eecnXqphFeTJ0TUXnq+mQ1SYkELJihGjb9OjzzcWivZ
 tMng==
X-Gm-Message-State: AOAM530pJk7z8DkyUKHWsGS7RertpBypxS0PCJ2L/RHWOpSE0ny/SALL
 YEy5bOw6cH9hi6PEwbXWufdtnyCdR6OBIcFq6NplfGzQ9aFlJbMrwK7/RtO+GFARZGYc7y/M+Km
 /vvmlYwskT2WoFwY=
X-Received: by 2002:adf:a198:0:b0:1f0:2477:3b79 with SMTP id
 u24-20020adfa198000000b001f024773b79mr3317321wru.24.1646225919055; 
 Wed, 02 Mar 2022 04:58:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhoJzzmGubO9T+P2rp5sbzN9oKf63KELhC21OUOh6oTtXAlLF5dbd9EHC5QGAjjnU8td/9tg==
X-Received: by 2002:adf:a198:0:b0:1f0:2477:3b79 with SMTP id
 u24-20020adfa198000000b001f024773b79mr3317289wru.24.1646225918794; 
 Wed, 02 Mar 2022 04:58:38 -0800 (PST)
Received: from redhat.com ([2a10:8006:355c:0:48d6:b937:2fb9:b7de])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a7bc7d0000000b00381004c643asm5397040wmk.30.2022.03.02.04.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 04:58:36 -0800 (PST)
Date: Wed, 2 Mar 2022 07:58:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: propagating vmgenid outward and upward
Message-ID: <20220302074503-mutt-send-email-mst@kernel.org>
References: <Yh4+9+UpanJWAIyZ@zx2c4.com>
 <223f858c-34c5-3ccd-b9e8-7585a976364d@redhat.com>
 <Yh5JwK6toc/zBNL7@zx2c4.com>
 <20220301121419-mutt-send-email-mst@kernel.org>
 <CAHmME9qieLUDVoPYZPo=N8NCL1T-RzQ4p7kCFv3PKFUkhWZPsw@mail.gmail.com>
 <20220302031738-mutt-send-email-mst@kernel.org>
 <CAHmME9pf-bjnZuweoLqoFEmPy1OK7ogEgGEAva1T8uVTufhCuw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHmME9pf-bjnZuweoLqoFEmPy1OK7ogEgGEAva1T8uVTufhCuw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Brown, Len" <len.brown@intel.com>, linux-hyperv@vger.kernel.org,
 Colm MacCarthaigh <colmmacc@amazon.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 adrian@parity.io, KVM list <kvm@vger.kernel.org>, Jann Horn <jannh@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <graf@amazon.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Theodore Ts'o <tytso@mit.edu>,
 "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 Laszlo Ersek <lersek@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 02, 2022 at 12:26:27PM +0100, Jason A. Donenfeld wrote:
> Hey Michael,
> 
> Thanks for the benchmark.
> 
> On Wed, Mar 2, 2022 at 9:30 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > So yes, the overhead is higher by 50% which seems a lot but it's from a
> > very small number, so I don't see why it's a show stopper, it's not by a
> > factor of 10 such that we should sacrifice safety by default. Maybe a
> > kernel flag that removes the read replacing it with an interrupt will
> > do.
> >
> > In other words, premature optimization is the root of all evil.
> 
> Unfortunately I don't think it's as simple as that for several reasons.
> 
> First, I'm pretty confident a beefy Intel machine can mostly hide
> non-dependent comparisons in the memory access and have the problem
> mostly go away. But this is much less the case on, say, an in-order
> MIPS32r2, which isn't just "some crappy ISA I'm using for the sake of
> argument," but actually the platform on which a lot of networking and
> WireGuard stuff runs, so I do care about it. There, we have 4
> reads/comparisons which can't pipeline nearly as well.

Sure. Want to try running some benchmarks on that platform?
Presumably you have access to such a box, right?


> There's also the atomicity aspect, which I think makes your benchmark
> not quite accurate. Those 16 bytes could change between the first and
> second word (or between the Nth and N+1th word for N<=3 on 32-bit).
> What if in that case the word you read second doesn't change, but the
> word you read first did? So then you find yourself having to do a
> hi-lo-hi dance.
> And then consider the 32-bit case, where that's even
> more annoying. This is just one of those things that comes up when you
> compare the semantics of a "large unique ID" and "word-sized counter",
> as general topics. (My suggestion is that vmgenid provide both.)

I don't see how this matters for any applications at all. Feel free to
present a case that would be race free with a word but not a 16
byte value, I could not imagine one. It's human to err of course.

>
> Finally, there's a slightly storage aspect, where adding 16 bytes to a
> per-key struct is a little bit heavier than adding 4 bytes and might
> bust a cache line without sufficient care, care which always has some
> cost in one way or another.
> 
> So I just don't know if it's realistic to impose a 16-byte per-packet
> comparison all the time like that. I'm familiar with WireGuard
> obviously, but there's also cifs and maybe even wifi and bluetooth,
> and who knows what else, to care about too. Then there's the userspace
> discussion. I can't imagine a 16-byte hotpath comparison being
> accepted as implementable.

I think this hinges on benchmarking results. Want to start with
my silly benchmark at least? If you can't measure an order of
magnitude gain then I think any effect on wireguard will be in the
noise.


> > And I feel if linux
> > DTRT and reads the 16 bytes then hypervisor vendors will be motivated to
> > improve and add a 4 byte unique one. As long as linux is interrupt
> > driven there's no motivation for change.
> 
> I reeeeeally don't want to get pulled into the politics of this on the
> hypervisor side. I assume an improved thing would begin with QEMU and
> Firecracker or something collaborating because they're both open
> source and Amazon people seem interested.

I think it would begin with a benchmark showing there's even any
measureable performance to be gained by switching the semantics.

> And then pressure builds for
> Microsoft and VMware to do it on their side. And then we get this all
> nicely implemented in the kernel. In the meantime, though, I'm not
> going to refuse to address the problem entirely just because the
> virtual hardware is less than perfect; I'd rather make the most with
> what we've got while still being somewhat reasonable from an
> implementation perspective.
> 
> Jason

Right but given you are trading security off for performance, it matters
a lot what the performance gain is.

-- 
MST


