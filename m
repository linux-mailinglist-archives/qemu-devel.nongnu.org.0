Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5EC467726
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 13:17:06 +0100 (CET)
Received: from localhost ([::1]:52000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt7Uu-0001mt-NI
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 07:17:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mt7Sn-0008GO-Tz
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 07:14:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mt7Sf-0008V7-OA
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 07:14:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638533670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qLz+UdfNJdJEwrCxG4+FLom0ESnOyXG47LSjDY1GKOw=;
 b=P6RWK+4ZnumgyW+UjNyw1QXcSzUkmuYLSwT9pPkvxqeMaDupReRWpvMHrdvJds8b+2FP4d
 mtVdAah+dABJtFhvl34WJH10wZEXl+EPCWz7PNFTv0ctEHvSv2VjPJFelds8tXk2gQldbh
 B90zwvnHI3FPiKT1h323iZ7O6QRmtl0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-Kwx6a2dVPk6OMRhAxPqRsQ-1; Fri, 03 Dec 2021 07:14:29 -0500
X-MC-Unique: Kwx6a2dVPk6OMRhAxPqRsQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 v62-20020a1cac41000000b0033719a1a714so1453869wme.6
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 04:14:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qLz+UdfNJdJEwrCxG4+FLom0ESnOyXG47LSjDY1GKOw=;
 b=evfm4nmZ3adst0AADQkbSdxq6u52gOEY4xMg8aXwhRyH4fcSYCnsvSl0Qj+vFlkQp7
 efcPB3Y/cQ6nbig2775bgX1PHVbzt618eWuR21nS+8IF4ylI5I0oDjsH0ZcMA4gQZN/8
 d46v6Yhsxf+F2Ds3bWsp9H6V2+gKKFx4wcTMeNiNI+Ed9DqLKHUDLKHweM30ogE26z4p
 5xxGKSyoeNPcS9rA9OQHzZc9dLblkgWtj2HNkRE1dxMVWazhbIZJmkxORy+T7nrqUHsV
 4xGJ/GHqR6yZ/XLMCBL7j97hwd4ceWg3nnLxCpdFLXgk55rsbRA5omWeGJY+21uTCXAN
 W6HA==
X-Gm-Message-State: AOAM533AipaVNWabNSXvbjOfezWUrjiUnU0ztzEjtiOTvxpIP44iXoOz
 i2+tIdpM7LKHDpT3DC/7QCAVxDXtQh5pb0aOyh3caZdVLlfygBXtJyG3YdfqGaeLdTOKmhlLW0U
 0CTXd0GoSSiTIGMg=
X-Received: by 2002:adf:cd06:: with SMTP id w6mr21870008wrm.431.1638533668093; 
 Fri, 03 Dec 2021 04:14:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwa+TcuinoqTYEY52xlfmgUfeF45UvudavKT1tl0Z4K/0hqW7a25NASHl+O/HH7/pDyfOTp6g==
X-Received: by 2002:adf:cd06:: with SMTP id w6mr21869984wrm.431.1638533667829; 
 Fri, 03 Dec 2021 04:14:27 -0800 (PST)
Received: from xz-m1.local ([64.64.123.16])
 by smtp.gmail.com with ESMTPSA id k37sm2572372wms.21.2021.12.03.04.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 04:14:26 -0800 (PST)
Date: Fri, 3 Dec 2021 20:14:20 +0800
From: Peter Xu <peterx@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/2] intel_iommu: Support IR-only mode without DMA
 translation
Message-ID: <YaoKHPR/SiRoAteV@xz-m1.local>
References: <20211201205113.57299-1-dwmw2@infradead.org>
 <CACGkMEuhnUZuKa-u1MDudmnLrwXO=B5WSp-siAC-UpUONey8xw@mail.gmail.com>
 <YanJkBiLtxzt04Hn@xz-m1.local>
 <e5d91ce70d40caa4d91e29d2227ad72ccf1a1bb6.camel@infradead.org>
MIME-Version: 1.0
In-Reply-To: <e5d91ce70d40caa4d91e29d2227ad72ccf1a1bb6.camel@infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 03, 2021 at 10:46:46AM +0000, David Woodhouse wrote:
> On Fri, 2021-12-03 at 15:38 +0800, Peter Xu wrote:
> > On Thu, Dec 02, 2021 at 11:49:25AM +0800, Jason Wang wrote:
> > > On Thu, Dec 2, 2021 at 4:55 AM David Woodhouse <dwmw2@infradead.org> wrote:
> > > > From: David Woodhouse <dwmw@amazon.co.uk>
> > > > 
> > > > By setting none of the SAGAW bits we can indicate to a guest that DMA
> > > > translation isn't supported. Tested by booting Windows 10, as well as
> > > > Linux guests with the fix at 
> > > > https://git.kernel.org/torvalds/c/c40aaaac10
> > > > 
> > > > 
> > > > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> > > > ---
> > > >  hw/i386/intel_iommu.c         | 14 ++++++++++----
> > > >  include/hw/i386/intel_iommu.h |  1 +
> > > >  2 files changed, 11 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > > > index 294499ee20..ffc852d110 100644
> > > > --- a/hw/i386/intel_iommu.c
> > > > +++ b/hw/i386/intel_iommu.c
> > > > @@ -2202,7 +2202,7 @@ static void vtd_handle_gcmd_write(IntelIOMMUState *s)
> > > >      uint32_t changed = status ^ val;
> > > > 
> > > >      trace_vtd_reg_write_gcmd(status, val);
> > > > -    if (changed & VTD_GCMD_TE) {
> > > > +    if ((changed & VTD_GCMD_TE) && s->dma_translation) {
> > > >          /* Translation enable/disable */
> > > >          vtd_handle_gcmd_te(s, val & VTD_GCMD_TE);
> > > >      }
> > > > @@ -3100,6 +3100,7 @@ static Property vtd_properties[] = {
> > > >      DEFINE_PROP_BOOL("caching-mode", IntelIOMMUState, caching_mode, FALSE),
> > > >      DEFINE_PROP_BOOL("x-scalable-mode", IntelIOMMUState, scalable_mode, FALSE),
> > > >      DEFINE_PROP_BOOL("dma-drain", IntelIOMMUState, dma_drain, true),
> > > > +    DEFINE_PROP_BOOL("dma-translation", IntelIOMMUState, dma_translation, true),
> > > >      DEFINE_PROP_END_OF_LIST(),
> > > >  };
> > > > 
> > > > @@ -3605,12 +3606,17 @@ static void vtd_init(IntelIOMMUState *s)
> > > >      s->next_frcd_reg = 0;
> > > >      s->cap = VTD_CAP_FRO | VTD_CAP_NFR | VTD_CAP_ND |
> > > >               VTD_CAP_MAMV | VTD_CAP_PSI | VTD_CAP_SLLPS |
> > > > -             VTD_CAP_SAGAW_39bit | VTD_CAP_MGAW(s->aw_bits);
> > > > +             VTD_CAP_MGAW(s->aw_bits);
> > > >      if (s->dma_drain) {
> > > >          s->cap |= VTD_CAP_DRAIN;
> > > >      }
> > > > -    if (s->aw_bits == VTD_HOST_AW_48BIT) {
> > > > -        s->cap |= VTD_CAP_SAGAW_48bit;
> > > > +    if (s->dma_translation) {
> > > > +            if (s->aw_bits >= VTD_HOST_AW_39BIT) {
> > > > +                    s->cap |= VTD_CAP_SAGAW_39bit;
> > > > +            }
> > > > +            if (s->aw_bits >= VTD_HOST_AW_48BIT) {
> > > > +                    s->cap |= VTD_CAP_SAGAW_48bit;
> > > > +            }
> > > >      }
> > > 
> > > Just wonder if this is the hardware behaviour as I see 0 is reserved
> > > for SAGAW in vtd 3.3 spec.
> > 
> > Yes I have the same question.  But if latest Linux & Windows work fine then it
> > seems ok if we have explicit use scenario with enabling IR only.
> 
> Bit zero is reserved. The *value* zero is just what you get when none
> of the bits are set.
> 
> 	"A value of 1 in any of these bits indicates the corresponding
> 	adjusted guest address width is supported.The adjusted guest
> 	address widths corresponding to various bit positions within
> 	this field are:
> 
> 	 • 0: Reserved
> 	 • 1: 39-bit AGAW (3-level page-table)
> 	 • 2: 48-bit AGAW (4-level page-table)
> 	 • 3: 57-bit AGAW (5-level page-table)
> 	 • 4: Reserved
> 
> 	Software must ensure that the adjusted guest address width used
> 	to set up the page tables is one of the supported guest address
> 	widths reported in this field.
> 
> 	Hardware implementations reporting second-level translation
> 	support (SLTS) field as Clear also report this field as 0.

I see.

>  
> > In that case commenting with some details would be more than welcomed, e.g.
> > mentioning Linux commit c40aaaac1018 ("iommu/vt-d: Gracefully handle DMAR units
> > with no supported address widths", 2020-10-07) as comments above the code.
> > 
> > One more question: SAGAW is a bitmask, is it intended to only set 1 bit out of
> > the mask?  I'm afraid it could break guest OS that only support 39 bits when
> > the qemu cmdline has aw-bits=48 specified.
> 
> No, we should set all bits that correspond to supported page table
> depths. And I believe we still do; there's no 'else' in the patch above
> so it will set *both* the 39-bit and 48-bit support bits if s->aw_bits
> is high enough to support both.

Yeah I missed that, sorry.

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu


