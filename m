Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CC35E9C97
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 10:56:06 +0200 (CEST)
Received: from localhost ([::1]:55936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocjuH-0001k7-JW
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 04:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ocjpk-0006Bd-Iy
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 04:51:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ocjpi-0002G0-RM
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 04:51:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664182278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9khF7HtdEw1lIqHQJnQwM+tQ7swsOFx5voia+tsmqxU=;
 b=CmrdBEFK01W1JEamf0c5Bi5GRuUd0eTc64Tpwdy7kmq/sLC6hZHDDNazZ/Q3nZeh+Y6x+r
 OxVZiPZ3EX++u9wRU8xJaJk4hUTIAY+jbr740jEzP7hRVUkgVaux3hoLHQqNCVKJqIxhpV
 i/oO0epOfKT5eT68mJuhoCDbpiW0S4g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-irTcw-lKNTGV6HXlccdGvw-1; Mon, 26 Sep 2022 04:51:16 -0400
X-MC-Unique: irTcw-lKNTGV6HXlccdGvw-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay21-20020a05600c1e1500b003b45fd14b53so5924949wmb.1
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 01:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9khF7HtdEw1lIqHQJnQwM+tQ7swsOFx5voia+tsmqxU=;
 b=MM/djXHPx150pr9NuTqYVOCwXVNbKrrDclA0+m+1hVEfnNU68lUaa3kmL0vCqgQ38D
 ozg/lNTNNsOGBaT8xocS0x6YXyQ/fY2XWrLaminyXZX6ZXEFyJm0bbwBK4anq7nZlc2g
 hcHRzm1RO+F0tnQrCsSp74xTipzlqY7R7n+Xiu0kSfIe3N35wkJgxwgWnGU0jPz6MFVg
 nBLSEIP2gf/a2RSetN9kyqEj3dfpKrqBjh9pWFIvWdqWjPnYk9MAXr37NVhkd+E9QUxM
 CGLvMkp0cJTYWSy5LUw/+5vLipzPM7DkFSjJ79dnh5r8er5OFO6gEM5noExsLjlEkbA6
 Hwdg==
X-Gm-Message-State: ACrzQf2S8aj5gGkHCKsqCtpE0jKglFubMflSfyBHycuXpFunYNMlDV8F
 dPzj1qs8Ek/uyZ177SFOGP3TILMPOp3idFTvAgkckNMcP+S66A6zLtSI6n+GGeqwzR++M2JUukd
 gHeCPhmAaWLCYFd0=
X-Received: by 2002:adf:dccf:0:b0:228:635f:90b8 with SMTP id
 x15-20020adfdccf000000b00228635f90b8mr12431382wrm.703.1664182275753; 
 Mon, 26 Sep 2022 01:51:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6RM5DAd5t0eQcennRgov7zPM4/+zD9SpwZdK421FNXnMj8gItWMKppLjo5QLjMn/R6Gq6OTQ==
X-Received: by 2002:adf:dccf:0:b0:228:635f:90b8 with SMTP id
 x15-20020adfdccf000000b00228635f90b8mr12431368wrm.703.1664182275545; 
 Mon, 26 Sep 2022 01:51:15 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 q18-20020adfdfd2000000b0022ad393ba3csm13800727wrn.107.2022.09.26.01.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 01:51:15 -0700 (PDT)
Date: Mon, 26 Sep 2022 09:51:13 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Yang Zhong <yang.zhong@linux.intel.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, "Wang, Lei" <lei4.wang@intel.com>,
 paul.c.lai@intel.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 robert.hu@intel.com, chenyi.qiang@intel.com
Subject: Re: [PATCH] i386: Add new CPU model SapphireRapids
Message-ID: <YzFoAWTHZZUE3CkW@work-vm>
References: <20220812055751.14553-1-lei4.wang@intel.com>
 <Yysk/taT/eKR0Bp3@work-vm> <Yy21A2CWzrS3SIzH@yangzhon>
 <b1f238c6-ab3d-eb8f-d1b4-dbdf342c002c@intel.com>
 <YzFX04164F6KfZdY@yangzhon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzFX04164F6KfZdY@yangzhon>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Yang Zhong (yang.zhong@linux.intel.com) wrote:
> On Sat, Sep 24, 2022 at 12:01:16AM +0800, Xiaoyao Li wrote:
> > On 9/23/2022 9:30 PM, Yang Zhong wrote:
> > > On Wed, Sep 21, 2022 at 03:51:42PM +0100, Dr. David Alan Gilbert wrote:
> > > > * Wang, Lei (lei4.wang@intel.com) wrote:
> > > > > The new CPU model mostly inherits features from Icelake-Server, while
> > > > > adding new features:
> > > > >   - AMX (Advance Matrix eXtensions)
> > > > >   - Bus Lock Debug Exception
> > > > > and new instructions:
> > > > >   - AVX VNNI (Vector Neural Network Instruction):
> > > > >      - VPDPBUS: Multiply and Add Unsigned and Signed Bytes
> > > > >      - VPDPBUSDS: Multiply and Add Unsigned and Signed Bytes with Saturation
> > > > >      - VPDPWSSD: Multiply and Add Signed Word Integers
> > > > >      - VPDPWSSDS: Multiply and Add Signed Integers with Saturation
> > > > >   - FP16: Replicates existing AVX512 computational SP (FP32) instructions
> > > > >     using FP16 instead of FP32 for ~2X performance gain
> > > > >   - SERIALIZE: Provide software with a simple way to force the processor to
> > > > >     complete all modifications, faster, allowed in all privilege levels and
> > > > >     not causing an unconditional VM exit
> > > > >   - TSX Suspend Load Address Tracking: Allows programmers to choose which
> > > > >     memory accesses do not need to be tracked in the TSX read set
> > > > >   - AVX512_BF16: Vector Neural Network Instructions supporting BFLOAT16
> > > > >     inputs and conversion instructions from IEEE single precision
> > > > > 
> > > > > Features may be added in future versions:
> > > > >   - CET (virtualization support hasn't been merged)
> > > > > Instructions may be added in future versions:
> > > > >   - fast zero-length MOVSB (KVM doesn't support yet)
> > > > >   - fast short STOSB (KVM doesn't support yet)
> > > > >   - fast short CMPSB, SCASB (KVM doesn't support yet)
> > > > > 
> > > > > Signed-off-by: Wang, Lei <lei4.wang@intel.com>
> > > > > Reviewed-by: Robert Hoo <robert.hu@linux.intel.com>
> > > > 
> > > > Hi,
> > > >     What fills in the AMX tile and tmul information leafs
> > > > (0x1D, 0x1E)?
> > > >    In particular, how would we make sure when we migrate between two
> > > > generations of AMX/Tile/Tmul capable devices with different
> > > > register/palette/tmul limits that the migration is tied to the CPU type
> > > > correctly?
> > > >    Would you expect all devices called a 'SappireRapids' to have the same
> > > > sizes?
> > > > 
> > > 
> > >     There is only one palette in current design. This palette include 8
> > >     tiles.  Those two CPUID leafs defined bytes_per_tile, total_tile_bytes,
> > >     max_rows and etc, the AMX tool will configure those values into TILECFG with
> > >     ldtilecfg instrcutions. Once tiles are configured, we can use
> > >     tileload instruction to load data into those tiles.
> > > 
> > >     We did migration between two SappireRapids with amx self test tool
> > >     (tools/testing/selftests/x86/amx.c)started in two sides, the migration
> > >     work well.
> > > 
> > >     As for SappireRapids and more newer cpu types, those two CPUID leafs
> > >     definitions are all same on AMX.
> > 
> > I'm not sure what definitions mean here. Are you saying the CPUID values of
> > leaf 0x1D and 0x1E won't change for any future Intel Silicion?
> > 
> > Personally, I doubt it. And we shouldn't take such assumption unless Intel
> > states it SDM.
> 
>   The current 0x1D and 0x1E definitions as below:
> 
>   /* CPUID Leaf 0x1D constants: */
>   #define INTEL_AMX_TILE_MAX_SUBLEAF     0x1
>   #define INTEL_AMX_TOTAL_TILE_BYTES     0x2000
>   #define INTEL_AMX_BYTES_PER_TILE       0x400
>   #define INTEL_AMX_BYTES_PER_ROW        0x40
>   #define INTEL_AMX_TILE_MAX_NAMES       0x8
>   #define INTEL_AMX_TILE_MAX_ROWS        0x10
> 
>   /* CPUID Leaf 0x1E constants: */
>   #define INTEL_AMX_TMUL_MAX_K           0x10
>   #define INTEL_AMX_TMUL_MAX_N           0x40
> 
>   These values are defined from SDM, and from the new developping CPU,
>   these values are still same with SappireRapids. thanks!

But there's nothing stopping them increasing in future versions ?

Dave

>   Yang
> > 
> > > So, on AMX perspective, the migration
> > >     should be workable on subsequent cpu types. thanks!
> > 
> > I think what Dave worried is that when migrating one VM created with
> > "SapphireRapids" model on SPR machine to some newer platform in the future,
> > where the newer platform reports different value on CPUID leaves 0x1D and
> > 0x1E than SPR platform.
> > 
> > I think we need to contain CPUID leaves 0x1D and 0x1E into CPU model as
> > well. Otherwise we will hit the same as Intel PT that SPR reports less
> > capabilities that ICX.
> > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


