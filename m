Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 688FE63CF2D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 07:25:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0GVD-0002YV-Om; Wed, 30 Nov 2022 01:23:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0GVA-0002Y3-RX
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 01:23:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0GV8-0004WF-7o
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 01:23:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669789400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4duU9MNAVy6hAV+iW2xG0T51F6zxWDehvDSZCoX2bXs=;
 b=fGdRSh9nCgkeRmvrNqJsDthcOwC7FXDL1GDNnZHlaJoevNYpnhp6a0fvBTv22QEtjvuqhm
 hkq136Xjy+6f0gAU4RD2d47A3Iq/L18ue1b+UznCpGi5rlLzsLVKQZj3iiSIZqazjUT6AP
 BDGowfgeqwswq5Voq9B9up9veP6aSTk=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-453-DdarE8zfNje9BSmIPwtojA-1; Wed, 30 Nov 2022 01:23:18 -0500
X-MC-Unique: DdarE8zfNje9BSmIPwtojA-1
Received: by mail-oi1-f197.google.com with SMTP id
 a12-20020a05680804cc00b0035b9a1d20ecso4857694oie.2
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 22:23:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4duU9MNAVy6hAV+iW2xG0T51F6zxWDehvDSZCoX2bXs=;
 b=48KW2pbahJUHRaSPTi4B4mgCFWdAsLzqckw5dnz73Kp2c32ITp9ZZZKzfFTyYEzidl
 1oWKquUYorQ8iPLxF2QE7Z4Fj9OS7CUWWrwek7bUv47hAR4p0PLwCaqAKPQ8k8l09VTz
 4Ej+Y9jZq9J365p7gnz5+ZR5Ke5HsYdjmoExGv1Ww6CKC/5kY+/XV6lBZaTlfh5/P23h
 JcP5rgCF09WvdPNuD6zYSoq/yhrQORZlQGOPT88nQDXvkrMQkDv1DdiqwU/o9RDDPXjb
 ZSFNvckb/SLbL4NAWbqFFbu84vcAtOrtzfi9oxGxrcMjHh+sHWxftJEO3jwhSMdcTMEG
 DYNA==
X-Gm-Message-State: ANoB5plx4OTZpN9R34y4PiNufvO5UFcwRw3wZSecNdlaMO7d5qi8GKVk
 CNTJopkcEe6GpK0bAVHKIAZpa7e3Njvub8rjZ/DlwwZw3H2uSSCKt3elqyGCduiuDJg+UN4Rsfj
 dF141AbqwAa374f380ZEy1k9w/qSz4Ds=
X-Received: by 2002:aca:2103:0:b0:35b:9abf:5031 with SMTP id
 3-20020aca2103000000b0035b9abf5031mr10584140oiz.280.1669789397544; 
 Tue, 29 Nov 2022 22:23:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4zhR/ZVq/ozmCuQwjbna0K+KCrvHxBQ/GAuf6ruzJBuEzHgFK9jrnmP0Pue8nE+NvqCRXDVAKPeENhewQ+2lM=
X-Received: by 2002:aca:2103:0:b0:35b:9abf:5031 with SMTP id
 3-20020aca2103000000b0035b9abf5031mr10584133oiz.280.1669789397261; Tue, 29
 Nov 2022 22:23:17 -0800 (PST)
MIME-Version: 1.0
References: <20221129081037.12099-1-jasowang@redhat.com>
 <20221129081037.12099-2-jasowang@redhat.com> <Y4YmvYzVGwciJUbk@x1n>
In-Reply-To: <Y4YmvYzVGwciJUbk@x1n>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 Nov 2022 14:23:06 +0800
Message-ID: <CACGkMEsYCUO+C6ocXryxX9J9E5PrQhS-c3v=ydY601U7Lzp_Jg@mail.gmail.com>
Subject: Re: [PATCH 1/3] intel-iommu: fail MAP notifier without caching mode
To: Peter Xu <peterx@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com, 
 viktor@daynix.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Tue, Nov 29, 2022 at 11:35 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Tue, Nov 29, 2022 at 04:10:35PM +0800, Jason Wang wrote:
> > Without caching mode, MAP notifier won't work correctly since guest
> > won't send IOTLB update event when it establishes new mappings in the
> > I/O page tables. Let's fail the IOMMU notifiers early instead of
> > misbehaving silently.
> >
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> >  hw/i386/intel_iommu.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > index a08ee85edf..9143376677 100644
> > --- a/hw/i386/intel_iommu.c
> > +++ b/hw/i386/intel_iommu.c
> > @@ -3186,6 +3186,13 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
> >                           "Snoop Control with vhost or VFIO is not supported");
> >          return -ENOTSUP;
> >      }
> > +    if (!s->caching_mode && (new & IOMMU_NOTIFIER_MAP)) {
> > +        error_setg_errno(errp, ENOTSUP,
> > +                         "device %02x.%02x.%x requires caching mode",
> > +                         pci_bus_num(vtd_as->bus), PCI_SLOT(vtd_as->devfn),
> > +                         PCI_FUNC(vtd_as->devfn));
> > +        return -ENOTSUP;
> > +    }
>
> We used to have that but got reverted because it's too late to fail, so we
> moved it over even though not as clean..
>
> https://lore.kernel.org/all/20190916080718.3299-5-peterx@redhat.com/

One of the difference is that the patch doesn't do exit() here. I
think it's better to fail instead of misbehving silently, this is what
other vIOMMU did:

E.g in smmu we had:

    if (new & IOMMU_NOTIFIER_MAP) {
        error_setg(errp,
                   "device %02x.%02x.%x requires iommu MAP notifier which is "
                   "not currently supported", pci_bus_num(sdev->bus),
                   PCI_SLOT(sdev->devfn), PCI_FUNC(sdev->devfn));
        return -EINVAL;
    }

So did for amd iommu.

Thanks

>
> Thanks,
>
> --
> Peter Xu
>


