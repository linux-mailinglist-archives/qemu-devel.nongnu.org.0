Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BE963D8D4
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 16:08:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Ofc-000501-Oh; Wed, 30 Nov 2022 10:06:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p0Ofa-0004zp-CN
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 10:06:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p0OfX-00013N-Nn
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 10:06:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669820798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V6oF428QdwtdSsm2xrAAcO/ScUcM71M6UXKJclmggJ0=;
 b=GrLOoAEMnpTkwmodZYMIdDrtIu8bnLLXoSfN+WjhCZD9abm434SpatjLfGRMwdAdjp8zzT
 F1GCkNO6ofR1SQpMT5Hb8MkluBGRFGhGxScdo/OCNpSlNQlC0SpFGtRSH0ny3nUiJITJO+
 s9d8Gwii425Cngct3Jds8bMeBIJVSaY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-btAfw9puPL-T7Z8xBwJeTg-1; Wed, 30 Nov 2022 10:06:37 -0500
X-MC-Unique: btAfw9puPL-T7Z8xBwJeTg-1
Received: by mail-qv1-f70.google.com with SMTP id
 ns11-20020a056214380b00b004c64784249eso26319939qvb.7
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 07:06:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V6oF428QdwtdSsm2xrAAcO/ScUcM71M6UXKJclmggJ0=;
 b=xojcO/QInF3uAR1E81PjLqeMMDev/6NkZ6xFgXYZm7ZT7lqumlkJJyo6cV4Orsfjep
 vrq3pdq07nCY6fhcEqm06d2dC6Dv8ue3CCVYB3PfaqA0lzEjbCXz8PRGWyQGdx88xQgl
 neOEALHcdHuF92RBK4A5qOLlJTXYyXW0bdV8WE+uzfMSjgghaN83s2GRqSNFqsoC0Lio
 iiWw8FDy9lK5IbOUMS+HJc01nJNyxdMe9Qdi6l7PpUKxSpPL0IzXEfLyDDJ9iavagSmq
 clqaZZ6s2kOmpnuAw9ieJ1LFbp1BAcpmgVARBL/rtAy8NqFgLOmi64L/6TRyD3uo4GcT
 jeYA==
X-Gm-Message-State: ANoB5pnPO/ZAhpv+sAvAZ7g/9JPBa/Ck8lkdsBgsGk2twUNNv1Eg/O/W
 vQlFE1lX/NE10bfC4nihx4cZxOG6IHU6QOAU+RYW8cGv9vrU8WMwGeHa1H6pop1Y7xRSDZm1dns
 E8VVGapG0+4P3G1I=
X-Received: by 2002:a37:8883:0:b0:6fa:93b1:8b6f with SMTP id
 k125-20020a378883000000b006fa93b18b6fmr55850361qkd.357.1669820796306; 
 Wed, 30 Nov 2022 07:06:36 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6DM26GyqBK1w5kO6n/pAEgTl4AsM/GfgAv3uK8sI7nf1/okszJMmnT9rO6tWQyrL0LBKCbMw==
X-Received: by 2002:a37:8883:0:b0:6fa:93b1:8b6f with SMTP id
 k125-20020a378883000000b006fa93b18b6fmr55850323qkd.357.1669820795976; 
 Wed, 30 Nov 2022 07:06:35 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 do23-20020a05620a2b1700b006fa32a26433sm1330359qkb.38.2022.11.30.07.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 07:06:35 -0800 (PST)
Date: Wed, 30 Nov 2022 10:06:34 -0500
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com,
 viktor@daynix.com
Subject: Re: [PATCH 1/3] intel-iommu: fail MAP notifier without caching mode
Message-ID: <Y4dxerC2E2jYxlEe@x1n>
References: <20221129081037.12099-1-jasowang@redhat.com>
 <20221129081037.12099-2-jasowang@redhat.com> <Y4YmvYzVGwciJUbk@x1n>
 <CACGkMEsYCUO+C6ocXryxX9J9E5PrQhS-c3v=ydY601U7Lzp_Jg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACGkMEsYCUO+C6ocXryxX9J9E5PrQhS-c3v=ydY601U7Lzp_Jg@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Wed, Nov 30, 2022 at 02:23:06PM +0800, Jason Wang wrote:
> On Tue, Nov 29, 2022 at 11:35 PM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Tue, Nov 29, 2022 at 04:10:35PM +0800, Jason Wang wrote:
> > > Without caching mode, MAP notifier won't work correctly since guest
> > > won't send IOTLB update event when it establishes new mappings in the
> > > I/O page tables. Let's fail the IOMMU notifiers early instead of
> > > misbehaving silently.
> > >
> > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > ---
> > >  hw/i386/intel_iommu.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > > index a08ee85edf..9143376677 100644
> > > --- a/hw/i386/intel_iommu.c
> > > +++ b/hw/i386/intel_iommu.c
> > > @@ -3186,6 +3186,13 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
> > >                           "Snoop Control with vhost or VFIO is not supported");
> > >          return -ENOTSUP;
> > >      }
> > > +    if (!s->caching_mode && (new & IOMMU_NOTIFIER_MAP)) {
> > > +        error_setg_errno(errp, ENOTSUP,
> > > +                         "device %02x.%02x.%x requires caching mode",
> > > +                         pci_bus_num(vtd_as->bus), PCI_SLOT(vtd_as->devfn),
> > > +                         PCI_FUNC(vtd_as->devfn));
> > > +        return -ENOTSUP;
> > > +    }
> >
> > We used to have that but got reverted because it's too late to fail, so we
> > moved it over even though not as clean..
> >
> > https://lore.kernel.org/all/20190916080718.3299-5-peterx@redhat.com/
> 
> One of the difference is that the patch doesn't do exit() here. I
> think it's better to fail instead of misbehving silently, this is what
> other vIOMMU did:
> 
> E.g in smmu we had:
> 
>     if (new & IOMMU_NOTIFIER_MAP) {
>         error_setg(errp,
>                    "device %02x.%02x.%x requires iommu MAP notifier which is "
>                    "not currently supported", pci_bus_num(sdev->bus),
>                    PCI_SLOT(sdev->devfn), PCI_FUNC(sdev->devfn));
>         return -EINVAL;
>     }
> 
> So did for amd iommu.

Yeah that's fine.  Would you mind add the explanation (and also above link,
which might be helpful to pick up the history..) to the commit message?
With that:

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu


