Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0299D337B04
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 18:38:25 +0100 (CET)
Received: from localhost ([::1]:44330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKPGS-0006Vj-0R
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 12:38:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lKP5j-0005nH-Ez
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:27:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lKP5g-0002si-3j
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:27:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615483635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XDRPOhjyqGDEeDS9xr1SxQsefqd+Cwy2DSwDQ0NsU/w=;
 b=MEiIUjZkFD2GX/mRJlTVDba/cAOFUZveN51uFRWdboRZ0AEsPe/lVYltO9//wlo9Abl1Hp
 WGXWQKd8F6Qpn3waIjhwoSHVWC3p7IOoSfdmPIuSfNqgoXxxfAL0x4gjTRTYiAKn1smHYY
 eO7lBTvJwSl0WiZbmwMQ4wM7zWuaBMU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-dO08zRbFPPW8RG70qfdflQ-1; Thu, 11 Mar 2021 12:27:13 -0500
X-MC-Unique: dO08zRbFPPW8RG70qfdflQ-1
Received: by mail-qk1-f197.google.com with SMTP id c184so550307qkb.17
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 09:27:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XDRPOhjyqGDEeDS9xr1SxQsefqd+Cwy2DSwDQ0NsU/w=;
 b=R0YM910fPb4X8bNaw5ZSUav5U3UXujC4SpErSu3VLCdugsLgY6WyIX+HeVWMnG1K9f
 zmpzhxU1Uj1wuyJypefUDhqRUpxLiuz3uDpTfyANASeA8ntSU/BFSiSLwP20WzeiBQ0f
 mDsu2ZNqsRfOaM3aqvpvUwBcDZIaudLHywMHqoS0MpcBC18YUoAYcRMZIxqqwUMtXupU
 SDAfpCjQy3HkJaYamTKcz7Op0RAECoyR4ddwBrDeNfnKy1g3i7mwCshOImE1w/UMwV7t
 p8woFig8wkRkjEH8IFVUYhSo1uw5s/VRVlve6EpEWxD95CxSnPb8fOmQOW7lWi8Dd6Hb
 Hn9g==
X-Gm-Message-State: AOAM5311S1lJ2KLMv8JM8YFCmiOwwsQclU12PJF/JYo6CSdTs4ztNJwL
 Koxqf0zx8iIlgC9nf5uSEi2SHuexdaNquV/uacc8ChDfnXm/7NiK2REwYzuBIXga/QGBPkkxz5Q
 UkopVM3BL9PcyqLY=
X-Received: by 2002:a05:620a:819:: with SMTP id
 s25mr9087714qks.485.1615483633220; 
 Thu, 11 Mar 2021 09:27:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjt9i5EkfTx9eYqo+jex3rbn0UoBlzbZuZ+j+6xfaEBepdMk2DYwdzs7pW/EEDLbR5gKq2PQ==
X-Received: by 2002:a05:620a:819:: with SMTP id
 s25mr9087684qks.485.1615483632879; 
 Thu, 11 Mar 2021 09:27:12 -0800 (PST)
Received: from xz-x1 ([142.126.89.138])
 by smtp.gmail.com with ESMTPSA id z5sm2211310qtc.42.2021.03.11.09.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 09:27:12 -0800 (PST)
Date: Thu, 11 Mar 2021 12:27:10 -0500
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/2] hw/mips/jazz: Use generic I/O bus via get_system_io()
Message-ID: <20210311172710.GH194839@xz-x1>
References: <f776956e-dd3b-98f8-4b99-0cd234d227c0@amsat.org>
 <20210310191255.1229848-1-f4bug@amsat.org>
 <20210310194924.GF6530@xz-x1>
 <5e53b99f-548c-8da9-f6fd-9c764642350b@amsat.org>
 <20210310202919.GH6530@xz-x1>
 <a97eb0b5-d3fd-ca44-4490-c5e5bc796699@amsat.org>
 <a64ff8f0-5db1-c338-b99b-7a74a150a770@amsat.org>
MIME-Version: 1.0
In-Reply-To: <a64ff8f0-5db1-c338-b99b-7a74a150a770@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Alexander Bulekov <alxndr@bu.edu>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 11, 2021 at 05:21:49PM +0100, Philippe Mathieu-Daudé wrote:
> +Aspeed team
> 
> On 3/11/21 1:18 PM, Philippe Mathieu-Daudé wrote:
> > On 3/10/21 9:29 PM, Peter Xu wrote:
> 
> >> Yeah no worry - it's just that I feel one memory_region_init_alias() call is
> >> probably missing in your huge series somewhere, so that you'll take that alias
> >> MR as subregion rather than the real MR (which is the root of one AS).
> > 
> > OK, with your earlier comments start + Mark other comment I start
> > to understand better.
> > 
> > So far:
> > 
> > (1a) AddressSpace is a physical view, its base address must be zero
> > 
> > (1b) AddressSpace aperture is fixed (depends on hardware design,
> > not changeable at runtime
> > 
> > Therefore due to (1a):
> > (2) AddressSpace root MemoryRegion is a container and must not be
> > mmio-mapped anywhere (in particular not on SysBus).
> > 
> > (3) If hardware has a MMIO view of an AddressSpace, it has to be
> > via a MemoryRegion alias. That way the alias handles paddr offset
> > adjustment to the zero-based AddressSpace root container MR.
> > Aliasing allows resizing the alias size without modifying the AS
> > aperture size (1b).
> > 
> > I'll start adding assertions for (1a) and (2) in the code base and
> > see if (3) adjustments are required.
> 
> So using:
> 
> -- >8 --
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 874a8fccdee..8ce2d7f83b9 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -713,6 +713,12 @@ static MemoryRegion
> *memory_region_get_flatview_root(MemoryRegion *mr)
>                  continue;
>              }
>          }
> +        if (mr && mr->addr) {
> +            error_report("Detected flatview root memory region '%s' with"
> +                         " non-zero base address (0x%"HWADDR_PRIx"):
> aborting",
> +                         memory_region_name(mr), mr->addr);
> +            abort();
> +        }
> 
>          return mr;
>      }
> ---

Maybe it works, but it looks a bit odd to test here.  What I meant was
something like attached.

> 
> I get:
> 
> $ ./qemu-system-arm -M ast2600-evb
> qemu-system-arm: Detected flatview root memory region
> 'aspeed.fmc-ast2600.flash' with non-zero base address (0x20000000): aborting
> Aborted (core dumped)
> 
> Indeed:
> 
> $ ./qemu-system-arm -M ast2600-evb -S -monitor stdio
> QEMU 5.2.50 monitor - type 'help' for more information
> (qemu) info mtree
> address-space: dma-dram
>   0000000080000000-000000017fffffff (prio 0, i/o): aspeed-ram-container
>     0000000080000000-00000000bfffffff (prio 0, ram): ram
>     00000000c0000000-00000000ffffffff (prio 0, i/o): max_ram
> 
> address-space: aspeed.fmc-ast2600-dma-flash
>   0000000020000000-000000002fffffff (prio 0, i/o): aspeed.fmc-ast2600.flash
>     0000000020000000-0000000027ffffff (prio 0, i/o): aspeed.fmc-ast2600.0
>     0000000028000000-000000002fffffff (prio 0, i/o): aspeed.fmc-ast2600.1
> 
> address-space: aspeed.fmc-ast2600-dma-dram
>   0000000080000000-000000017fffffff (prio 0, i/o): aspeed-ram-container
>     0000000080000000-00000000bfffffff (prio 0, ram): ram
>     00000000c0000000-00000000ffffffff (prio 0, i/o): max_ram
> 
> address-space: aspeed.spi1-ast2600-dma-flash
>   0000000030000000-000000003fffffff (prio 0, i/o): aspeed.spi1-ast2600.flash
>     0000000030000000-0000000037ffffff (prio 0, i/o): aspeed.spi1-ast2600.0
> 
> address-space: aspeed.spi1-ast2600-dma-dram
>   0000000080000000-000000017fffffff (prio 0, i/o): aspeed-ram-container
>     0000000080000000-00000000bfffffff (prio 0, ram): ram
>     00000000c0000000-00000000ffffffff (prio 0, i/o): max_ram
> 
> address-space: aspeed.spi2-ast2600-dma-flash
>   0000000050000000-000000005fffffff (prio 0, i/o): aspeed.spi2-ast2600.flash
>     0000000050000000-0000000057ffffff (prio 0, i/o): aspeed.spi2-ast2600.0
> 
> address-space: aspeed.spi2-ast2600-dma-dram
>   0000000080000000-000000017fffffff (prio 0, i/o): aspeed-ram-container
>     0000000080000000-00000000bfffffff (prio 0, ram): ram
>     00000000c0000000-00000000ffffffff (prio 0, i/o): max_ram
> 
> Many address spaces not zero-based...

Maybe it's still legal to make the root mr a subregion of another, so maybe I'm
completely wrong... then the patch attached won't make any sense either.  It's
just that in my mind each MR should have a "parent" - for normal MR it's the
container MR, then for root MR it's easier to see the AS as its "parent".

Maybe Paolo could clarify this..

Thanks,

-- 
Peter Xu


