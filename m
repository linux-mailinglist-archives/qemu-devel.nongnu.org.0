Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013584672B5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 08:41:14 +0100 (CET)
Received: from localhost ([::1]:45620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt3Bw-0003Qw-K9
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 02:41:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mt3A1-0002kc-Im
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 02:39:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mt39x-0006mE-UF
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 02:39:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638517148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Me0qJTPJg6CrY49sF1a+q5OulxFACxIelecpx3gQeEE=;
 b=CXATl2xujLDzp/RqIH74KbM6WQbBY1in6UZCaiIcEbXL8w7mwfs9n0J2f1zyJUx4Sg+zDy
 MynTR3bmqkBn0QrgPocfk+twrmCXNbbUmrmrgz44EJgzjLU0MqpS/WQERzzX92FxZuUVhD
 xPM/kDMDQrMiO8aPZIPJO4B6nvnUtug=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-hGdJul5lNouDr7tV6CgigQ-1; Fri, 03 Dec 2021 02:39:05 -0500
X-MC-Unique: hGdJul5lNouDr7tV6CgigQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n16-20020a05600c3b9000b003331973fdbbso1002745wms.0
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 23:39:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Me0qJTPJg6CrY49sF1a+q5OulxFACxIelecpx3gQeEE=;
 b=KFKwwucGka2+BvTODN8pLSSBzOivt/+dQiIety7X0ysYI6WJ/hmKFNsznqqwrmVSz9
 uSxEcq3MVuTE2ig0ihQi7WV0lMf+G0My2ONZ1zqlsYE7FfCenk2LKRehyvbZDQJofiz/
 FDZLIOeYCd+I5yr3xyOPGFKvnSm3N8WDMsYbRVgiVE7dl25k7Udr20sLf/DiTEGpYO2N
 Gd8Ep2BeuGp2sc/YKp77IoTisEAtD5TT2X9WKBp5M5LpdHJabhFhk9Sn+9sQgHTmitDe
 dgToeJ+/mfo/LfroM+ECE2QVF0lc6uLwKo/0YVXIBqNDKWokca8cgtOdGos84jv/LXup
 FTxg==
X-Gm-Message-State: AOAM530kIG4Q5FTeY0gjQnh8RbOogHBocUwJgGkGxHBKO5UUsXtEP2Iq
 bQRHrxusbD1BWIAXGfxF379rzCXrrJiKPJ+bvb9Rlv+AHvE8on6MNA4D0HC9WmMRFVElup8c/Oz
 NKTsP7egMMXk2eds=
X-Received: by 2002:a1c:23d4:: with SMTP id j203mr12573277wmj.35.1638517143795; 
 Thu, 02 Dec 2021 23:39:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgDxBMx+LsR1fkFfORz7P9FgxJBHqv5xGY2n6KBaXnw9Ak4cA5FP4dCSk4g4LnrDK5y5RiIg==
X-Received: by 2002:a1c:23d4:: with SMTP id j203mr12573257wmj.35.1638517143521; 
 Thu, 02 Dec 2021 23:39:03 -0800 (PST)
Received: from xz-m1.local ([64.64.123.26])
 by smtp.gmail.com with ESMTPSA id z6sm2171922wmp.9.2021.12.02.23.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 23:39:02 -0800 (PST)
Date: Fri, 3 Dec 2021 15:38:56 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 1/2] intel_iommu: Support IR-only mode without DMA
 translation
Message-ID: <YanJkBiLtxzt04Hn@xz-m1.local>
References: <20211201205113.57299-1-dwmw2@infradead.org>
 <CACGkMEuhnUZuKa-u1MDudmnLrwXO=B5WSp-siAC-UpUONey8xw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEuhnUZuKa-u1MDudmnLrwXO=B5WSp-siAC-UpUONey8xw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 02, 2021 at 11:49:25AM +0800, Jason Wang wrote:
> On Thu, Dec 2, 2021 at 4:55 AM David Woodhouse <dwmw2@infradead.org> wrote:
> >
> > From: David Woodhouse <dwmw@amazon.co.uk>
> >
> > By setting none of the SAGAW bits we can indicate to a guest that DMA
> > translation isn't supported. Tested by booting Windows 10, as well as
> > Linux guests with the fix at https://git.kernel.org/torvalds/c/c40aaaac10
> >
> > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> > ---
> >  hw/i386/intel_iommu.c         | 14 ++++++++++----
> >  include/hw/i386/intel_iommu.h |  1 +
> >  2 files changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > index 294499ee20..ffc852d110 100644
> > --- a/hw/i386/intel_iommu.c
> > +++ b/hw/i386/intel_iommu.c
> > @@ -2202,7 +2202,7 @@ static void vtd_handle_gcmd_write(IntelIOMMUState *s)
> >      uint32_t changed = status ^ val;
> >
> >      trace_vtd_reg_write_gcmd(status, val);
> > -    if (changed & VTD_GCMD_TE) {
> > +    if ((changed & VTD_GCMD_TE) && s->dma_translation) {
> >          /* Translation enable/disable */
> >          vtd_handle_gcmd_te(s, val & VTD_GCMD_TE);
> >      }
> > @@ -3100,6 +3100,7 @@ static Property vtd_properties[] = {
> >      DEFINE_PROP_BOOL("caching-mode", IntelIOMMUState, caching_mode, FALSE),
> >      DEFINE_PROP_BOOL("x-scalable-mode", IntelIOMMUState, scalable_mode, FALSE),
> >      DEFINE_PROP_BOOL("dma-drain", IntelIOMMUState, dma_drain, true),
> > +    DEFINE_PROP_BOOL("dma-translation", IntelIOMMUState, dma_translation, true),
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> >
> > @@ -3605,12 +3606,17 @@ static void vtd_init(IntelIOMMUState *s)
> >      s->next_frcd_reg = 0;
> >      s->cap = VTD_CAP_FRO | VTD_CAP_NFR | VTD_CAP_ND |
> >               VTD_CAP_MAMV | VTD_CAP_PSI | VTD_CAP_SLLPS |
> > -             VTD_CAP_SAGAW_39bit | VTD_CAP_MGAW(s->aw_bits);
> > +             VTD_CAP_MGAW(s->aw_bits);
> >      if (s->dma_drain) {
> >          s->cap |= VTD_CAP_DRAIN;
> >      }
> > -    if (s->aw_bits == VTD_HOST_AW_48BIT) {
> > -        s->cap |= VTD_CAP_SAGAW_48bit;
> > +    if (s->dma_translation) {
> > +            if (s->aw_bits >= VTD_HOST_AW_39BIT) {
> > +                    s->cap |= VTD_CAP_SAGAW_39bit;
> > +            }
> > +            if (s->aw_bits >= VTD_HOST_AW_48BIT) {
> > +                    s->cap |= VTD_CAP_SAGAW_48bit;
> > +            }
> >      }
> 
> Just wonder if this is the hardware behaviour as I see 0 is reserved
> for SAGAW in vtd 3.3 spec.

Yes I have the same question.  But if latest Linux & Windows work fine then it
seems ok if we have explicit use scenario with enabling IR only.

In that case commenting with some details would be more than welcomed, e.g.
mentioning Linux commit c40aaaac1018 ("iommu/vt-d: Gracefully handle DMAR units
with no supported address widths", 2020-10-07) as comments above the code.

One more question: SAGAW is a bitmask, is it intended to only set 1 bit out of
the mask?  I'm afraid it could break guest OS that only support 39 bits when
the qemu cmdline has aw-bits=48 specified.

Thanks,

-- 
Peter Xu


