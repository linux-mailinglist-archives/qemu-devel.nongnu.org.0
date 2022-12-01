Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5175C63EB80
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 09:47:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0fDg-0005VW-JB; Thu, 01 Dec 2022 03:47:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0fDN-0005Sw-UW
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:46:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0fDM-0007Qg-7k
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:46:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669884398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=crcIKfKw8ePgGXkUJYfSzTxdml4tbdaqLgG7XUEYdv0=;
 b=G4VGbTiEEtk2jTvSiMowdpEjIkrs1wq+ofag685ss4kOzN76ow/1ZeJatrYlPKx8QDmuOo
 6U9T3HowMal4JokCEChQMYxLABBLs9aMIAdQE/LTBsstceYaVQ5rM5uV9fUydu5bawYQTd
 wVE2cEjwCHRy+hSpWIUkYBHYQw4hVlw=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-139-98cUszJoP1KjSIP4rMtVkg-1; Thu, 01 Dec 2022 03:46:37 -0500
X-MC-Unique: 98cUszJoP1KjSIP4rMtVkg-1
Received: by mail-oi1-f200.google.com with SMTP id
 bi42-20020a05680818aa00b0035b92218ef3so778941oib.16
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 00:46:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=crcIKfKw8ePgGXkUJYfSzTxdml4tbdaqLgG7XUEYdv0=;
 b=kMhP8GxAVmGYrRcl6cgVGWNYiTGpH+CBblgRrY7PBZPxaKVcqKuzmKXLQlM88tbL0c
 vweJHpgOb29hr5W3mcHvnwQKudZNubfB/sgIhm5IOdVQJSXvVMyg3PXicZcdluXLWsBW
 9RijU7/bOSLYXty9VLZf5tCxfdL+0cScSJ/AJVRYF5EUpKYVLhiGhRa12mfnZMqzdSVm
 ToMD6jKhXydTTE4NTvcmN01XkvsmgQ6CeYcyWbtvr/RvwDLN0EbGbwRHJrw053D3tiiL
 QE6wCEp/E2Cv951o0E/nztVXIExV0Z3RJJH7m8iXUaAp76mgabyp4pOBv6m81usQ0jEN
 C9gQ==
X-Gm-Message-State: ANoB5pmXAn5wdszVbTAxPXUaWBVl6naG6oaxPpklX6aMCdNkAgKwwmL5
 pKONB01sF1SeC/7KWombU/eJOZU29nVbrQkd9g3u1xih5pNoraybxcsnvofZAhQYUpnIbJwG4k7
 EMRosTgSx9r5FMG89lqAdgqeAd4al5gc=
X-Received: by 2002:a05:6870:75c3:b0:142:f59e:e509 with SMTP id
 de3-20020a05687075c300b00142f59ee509mr26896969oab.280.1669884395874; 
 Thu, 01 Dec 2022 00:46:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4LFWcJ8JHzgYSw5+F7c8GEFYIlsBPUuw+FTDdJN3jktz2x3Bo1T3BIYfVLqPqRauBDAah6Mffu9YA4vTX8buA=
X-Received: by 2002:a05:6870:75c3:b0:142:f59e:e509 with SMTP id
 de3-20020a05687075c300b00142f59ee509mr26896961oab.280.1669884395698; Thu, 01
 Dec 2022 00:46:35 -0800 (PST)
MIME-Version: 1.0
References: <20221129081037.12099-1-jasowang@redhat.com>
 <20221129081037.12099-2-jasowang@redhat.com> <Y4YmvYzVGwciJUbk@x1n>
 <CACGkMEsYCUO+C6ocXryxX9J9E5PrQhS-c3v=ydY601U7Lzp_Jg@mail.gmail.com>
 <Y4dxerC2E2jYxlEe@x1n>
In-Reply-To: <Y4dxerC2E2jYxlEe@x1n>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 1 Dec 2022 16:46:24 +0800
Message-ID: <CACGkMEsJcgeRmbG-6Jm6Mm+6r5xT=z37g_rmHu153X5GMOYceA@mail.gmail.com>
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

On Wed, Nov 30, 2022 at 11:06 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Nov 30, 2022 at 02:23:06PM +0800, Jason Wang wrote:
> > On Tue, Nov 29, 2022 at 11:35 PM Peter Xu <peterx@redhat.com> wrote:
> > >
> > > On Tue, Nov 29, 2022 at 04:10:35PM +0800, Jason Wang wrote:
> > > > Without caching mode, MAP notifier won't work correctly since guest
> > > > won't send IOTLB update event when it establishes new mappings in the
> > > > I/O page tables. Let's fail the IOMMU notifiers early instead of
> > > > misbehaving silently.
> > > >
> > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > ---
> > > >  hw/i386/intel_iommu.c | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >
> > > > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > > > index a08ee85edf..9143376677 100644
> > > > --- a/hw/i386/intel_iommu.c
> > > > +++ b/hw/i386/intel_iommu.c
> > > > @@ -3186,6 +3186,13 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
> > > >                           "Snoop Control with vhost or VFIO is not supported");
> > > >          return -ENOTSUP;
> > > >      }
> > > > +    if (!s->caching_mode && (new & IOMMU_NOTIFIER_MAP)) {
> > > > +        error_setg_errno(errp, ENOTSUP,
> > > > +                         "device %02x.%02x.%x requires caching mode",
> > > > +                         pci_bus_num(vtd_as->bus), PCI_SLOT(vtd_as->devfn),
> > > > +                         PCI_FUNC(vtd_as->devfn));
> > > > +        return -ENOTSUP;
> > > > +    }
> > >
> > > We used to have that but got reverted because it's too late to fail, so we
> > > moved it over even though not as clean..
> > >
> > > https://lore.kernel.org/all/20190916080718.3299-5-peterx@redhat.com/
> >
> > One of the difference is that the patch doesn't do exit() here. I
> > think it's better to fail instead of misbehving silently, this is what
> > other vIOMMU did:
> >
> > E.g in smmu we had:
> >
> >     if (new & IOMMU_NOTIFIER_MAP) {
> >         error_setg(errp,
> >                    "device %02x.%02x.%x requires iommu MAP notifier which is "
> >                    "not currently supported", pci_bus_num(sdev->bus),
> >                    PCI_SLOT(sdev->devfn), PCI_FUNC(sdev->devfn));
> >         return -EINVAL;
> >     }
> >
> > So did for amd iommu.
>
> Yeah that's fine.  Would you mind add the explanation (and also above link,
> which might be helpful to pick up the history..) to the commit message?

Will do.

> With that:
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
>
> Thanks,

Thanks

>
> --
> Peter Xu
>


