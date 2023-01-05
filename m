Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B90265E83C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:53:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMu8-0005UH-OO; Thu, 05 Jan 2023 04:51:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMu5-0005TN-T6
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:51:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMu4-0004Gt-3n
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:51:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672912274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VraYDWQrxOluMgs2e/mUwLw8Zu3kKh+q/NFtPWHrNI8=;
 b=F+Ma8rngrT1vyZXQd3vvGmhkdBioAeLLlU6PphlSVdPWA171mdoYZJcdqPj0uRz65J60PS
 8MWUkQ3rW6Y12VlgfcwIWUUzTjyi/B1uI2rGDUHIm5vVwfnC6AfYSApYySYUNKHGiai23O
 +ZPmyd40sAoSlKqyvoj4AksFy8vgXnM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-351-CVjPBieyN2uGBEzuQGy0Hg-1; Thu, 05 Jan 2023 04:51:13 -0500
X-MC-Unique: CVjPBieyN2uGBEzuQGy0Hg-1
Received: by mail-ej1-f72.google.com with SMTP id
 hr34-20020a1709073fa200b0083a60c1d7abso23041566ejc.13
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:51:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VraYDWQrxOluMgs2e/mUwLw8Zu3kKh+q/NFtPWHrNI8=;
 b=gFleDuy3Yk1Zc/0mS93OwNRcOgLvnib/K1dPKiQxQpdc6+GvYCTSW529DCq0UhWn/X
 QXOplaraZmaKeBvdlGt2i9LLBZev3XcYQQvQCn456B7TiQ315vU4CAcTzvWdWlpC4xVt
 remhhlDQEOu9e8qln4GzqvRtX9Dx9WwM/euxa129YgKHCYZpqzMTcN1UdGxNfRqyKh+3
 x9jnnlyQMPSofPEPnl8+IKBr98a0RhhbHqFGjok3Zw2DaOmfLs9ojmq83Ge8LI4Vo3HY
 4VUus4VfcRkuldOlJWAZWCMGkCSNVv88JXzfT4gVlvuDJ7uhtnfN7Tiai7xIUQ83n/mR
 thQg==
X-Gm-Message-State: AFqh2koZhfmNOKKoEwi2qiynxKfCOe+UH9/BM5SanlUn81D2Ps2JSOyY
 xyyyp5EIFvjXjYvaopEyICZ26KCbnzsOMrMRGVAdx9cdxAYFnwvdY5xFfON80DXK9yustW7B3SE
 FRerL1HeCvNFE4rg=
X-Received: by 2002:a05:6402:c91:b0:463:398a:9fe7 with SMTP id
 cm17-20020a0564020c9100b00463398a9fe7mr40504959edb.34.1672912272091; 
 Thu, 05 Jan 2023 01:51:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuhZ8lB61IeslzUuHG4vHlNtEGrj1sj7kJ0uAdY0vrh7td9ym4XN9ue6CXZBvmZabHGj8oMug==
X-Received: by 2002:a05:6402:c91:b0:463:398a:9fe7 with SMTP id
 cm17-20020a0564020c9100b00463398a9fe7mr40504945edb.34.1672912271879; 
 Thu, 05 Jan 2023 01:51:11 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 gf3-20020a170906e20300b007bff9fb211fsm16300813ejb.57.2023.01.05.01.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:51:11 -0800 (PST)
Date: Thu, 5 Jan 2023 04:51:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Laszlo Ersek <lersek@redhat.com>, qemu devel list <qemu-devel@nongnu.org>,
 Ani Sinha <ani@anisinha.ca>, Ard Biesheuvel <ardb@kernel.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-stable@nongnu.org
Subject: Re: [PATCH] acpi: cpuhp: fix guest-visible maximum access size to
 the legacy reg block
Message-ID: <20230105045025-mutt-send-email-mst@kernel.org>
References: <20230104090138.214862-1-lersek@redhat.com>
 <20230104072457-mutt-send-email-mst@kernel.org>
 <7122894b-ccbf-9d30-ee54-c23c25c0f82b@redhat.com>
 <2f32e669-2263-01c5-28d4-5721b3144b32@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f32e669-2263-01c5-28d4-5721b3144b32@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 05, 2023 at 10:00:00AM +0100, Philippe Mathieu-Daudé wrote:
> On 5/1/23 08:13, Laszlo Ersek wrote:
> > On 1/4/23 13:35, Michael S. Tsirkin wrote:
> > > On Wed, Jan 04, 2023 at 10:01:38AM +0100, Laszlo Ersek wrote:
> [...]
> 
> > > > To make things *even more* complicated, the breakage was (and remains, as
> > > > of today) visible with TCG acceleration only.  Commit 5d971f9e6725 makes
> > > > no difference with KVM acceleration -- the DWORD accesses still work,
> > > > despite "valid.max_access_size = 1".
> > > 
> > > BTW do you happen to know why that's the case for KVM? Because if kvm
> > > ignores valid.max_access_size generally then commit 5d971f9e6725 is
> > > incomplete, and we probably have some related kvm-only bugs.
> > 
> > It remains a mystery for me why KVM accel does not enforce
> > "valid.max_access_size".
> > 
> > In the thread I started earlier (which led to this patch), at
> > 
> >    "IO port write width clamping differs between TCG and KVM"
> >    https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg00199.html
> 
> [...]
> 
> > So, I think the bug is somehow "distributed" between
> > flatview_write_continue(), flatview_access_allowed(), and
> > memory_access_size(). flatview_access_allowed() does not care about "l"
> > at all, when it should (maybe?) compare it against
> > "mr->ops->valid.max_access_size". In turn, memory_access_size()
> > *silently* reduces the access width, based on
> > "->ops->valid.max_access_size".
> > 
> > And all this this *precedes* the call to memory_region_access_valid(),
> > which is only called from within memory_region_dispatch_write(), which
> > already gets the reduced width only.
> > 
> > Now, flatview_access_allowed() is from commit 3ab6fdc91b72
> > ("softmmu/physmem: Introduce MemTxAttrs::memory field and
> > MEMTX_ACCESS_ERROR", 2022-03-21), and the fact it does not check "len"
> > seems intentional -- it only takes "len" for logging.
> > 
> > Hmm. After digging a lot more, I find the issue may have been introduced
> > over three commits:
> > 
> > - 82f2563fc815 ("exec: introduce memory_access_size", 2013-05-29), which
> >    (IIUC) was the first step towards automatically reducing the address
> >    width, but at first only based on alignment,
> > 
> > - 23326164ae6f ("exec: Support 64-bit operations in address_space_rw",
> >    2013-07-14), which extended the splitting based on
> >    "MemoryRegionOps.impl",
> > 
> > - e1622f4b1539 ("exec: fix incorrect assumptions in memory_access_size",
> >    2013-07-18), which flipped the splitting basis to
> >    "MemoryRegionOps.valid".
> > 
> > To me, 23326164ae6f seems *vaguely* correct ("vague" is not criticism
> > for the commit, it's criticism for my understanding :)); after all we're
> > on our way towards the device model, and the device model exposes via
> > "MemoryRegionOps.impl" what it can handle. Plus, commit 5d971f9e6725
> > does direct us towards "MemoryRegionOps.impl"!
> > 
> > But clearly there must have been something wrong with 23326164ae6f,
> > according to e1622f4b1539...
> 
> Maybe the long-standing unaligned access problem? Could be fixed by:
> https://lore.kernel.org/qemu-devel/20210619172626.875885-15-richard.henderson@linaro.org/

indeed. want to dust it up and post?

> > The latter is what introduced the current "silent splitting of access
> > based on 'valid'". The message of commit e1622f4b1539 says, almost like
> > an afterthought:
> > 
> > >      access_size_max can be mr->ops->valid.max_access_size because memory.c
> > >      can and will still break accesses bigger than
> > >      mr->ops->impl.max_access_size.
> > 
> > I think this argument may have been wrong: if "impl.max_access_size" is
> > large (such as: unset), but "valid.max_access_size" is small, that just
> > means:
> > 
> >    the implementation is flexible and can deal with any access widths (so
> >    "memory.c" *need not* break up accesses for the device model's sake),
> >    but the device should restrict the *guest* to small accesses. So if
> >    the guest tries something larger, we shouldn't silently accommodate
> >    that.
> 
> Indeed. '.impl' is a software thing for the device modeller, ideally one
> will chose a value that allows the simplest implementation. I.e. if a
> device only allows 8-bit access, use 8-bit registers aligned on a 64-bit
> boundary, the model might use:
> 
>   .impl.min_access_size = 8,
>   .impl.max_access_size = 1,
> 
> Also we need to keep in mind that even if most MemoryRegionOps structs
> are 'static const', such structure can be dynamically created. I.e.:
> https://lore.kernel.org/qemu-devel/20200817161853.593247-5-f4bug@amsat.org/
> 
> > I have zero idea how to fix this, but I feel that the quoted argument
> > from commit e1622f4b1539 is the reason why KVM accel is so lenient that
> > it sort of "de-fangs" commit 5d971f9e6725.
> > 
> > Laszlo
> > 


