Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A60FC6A017D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 04:21:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV28q-00062x-2U; Wed, 22 Feb 2023 22:19:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pV28o-00062n-BH
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 22:19:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pV28m-0007Kc-Rk
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 22:19:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677122367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vkLX3XA3NCywMtZFNsONZt1un9vKg7WD5DBLTEUtdFg=;
 b=TGQCZmI3LO9aMByYiYcERG5kKFjQ0U68odHi+weky/b8/Ce0PwG5mvjmJCgao0BMCmEbJn
 eo54XVhYcInV4gL6wSJgpB1QldJLtI0dNFdVul87vQNf0hTyNEm9syn78heMa7rxZze60k
 PvdlBKB4+1P+zaBF0axBqjpcqSkntVU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-562-8gQVMX2LNqKXkK5C3kDXow-1; Wed, 22 Feb 2023 22:19:26 -0500
X-MC-Unique: 8gQVMX2LNqKXkK5C3kDXow-1
Received: by mail-qk1-f198.google.com with SMTP id
 c19-20020a05620a165300b007389d2f57f3so4645227qko.21
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 19:19:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vkLX3XA3NCywMtZFNsONZt1un9vKg7WD5DBLTEUtdFg=;
 b=bBbBcPfFXFikoo89Lgdsb2vpcyX6aUMYfcVq5T6I0B2876gfENFhbBhqxiDos2WiGq
 sttR5XbDiZEUpU7C0x1kglVUuFEDb+mbxwVhsUGI0leC16oqUNVG6R4GvqZtLadFXlVM
 C6Wa4fAW+MAWZX5KALezJ5pfVHaiJ15+N6o++9+YRIibl2Jk/Va+9fzC3HfuPHxuhX8I
 XSTF7I1nA8g5vtLQbvv8DXX/6F0iflueovUJjpS7fQ2Ven3CtTgLhmT/EuAjbf8dKeTj
 su1pMzspY89SwnIO85A2LGHR7reaHOXD/lB1M2xweGBQZLOwOd2hOp81C3gMKzk8t4eP
 I4eA==
X-Gm-Message-State: AO0yUKXUFKJfai/uJQywOPi5Lh2AoOlQzBIiueqTf57TBZYbRDjwf5b5
 Hd050awuR256aQqbGeFG64/rMT2bt2qEzy5Mm4KC6J4Pa7+bbwEirMMC/PDFgqD9B3dQKrZ+840
 VDlUJd/kEEj/0UoxjICPPlEviGiMkjUE=
X-Received: by 2002:ad4:4f26:0:b0:56c:1ff3:9e93 with SMTP id
 fc6-20020ad44f26000000b0056c1ff39e93mr1509629qvb.5.1677122365790; 
 Wed, 22 Feb 2023 19:19:25 -0800 (PST)
X-Google-Smtp-Source: AK7set+NaVAsxjZ0PyBLmQ3c2m4o7g/cmhswi7jtDoD99FueP0VLFNQZx7orjvUCAmnGN9yjGgfzDVPWqlNGiUTdQn0=
X-Received: by 2002:ad4:4f26:0:b0:56c:1ff3:9e93 with SMTP id
 fc6-20020ad44f26000000b0056c1ff39e93mr1509624qvb.5.1677122365535; Wed, 22 Feb
 2023 19:19:25 -0800 (PST)
MIME-Version: 1.0
References: <20221129081037.12099-1-jasowang@redhat.com>
 <20221129081037.12099-3-jasowang@redhat.com> <Y4jQRu9KB05EYDVm@x1n>
In-Reply-To: <Y4jQRu9KB05EYDVm@x1n>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 23 Feb 2023 11:19:14 +0800
Message-ID: <CACGkMEtXsapwGJG1Fk=-q8D-KTQdqd7jY29QVs8tF2Z_ir=SBQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] intel-iommu: fail DEVIOTLB_UNMAP without dt mode
To: Peter Xu <peterx@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com, 
 viktor@daynix.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Fri, Dec 2, 2022 at 12:03 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Tue, Nov 29, 2022 at 04:10:36PM +0800, Jason Wang wrote:
> > Without dt mode, device IOTLB notifier won't work since guest won't
> > send device IOTLB invalidation descriptor in this case. Let's fail
> > early instead of misbehaving silently.
> >
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> >  hw/i386/intel_iommu.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > index 9143376677..d025ef2873 100644
> > --- a/hw/i386/intel_iommu.c
> > +++ b/hw/i386/intel_iommu.c
> > @@ -3179,6 +3179,7 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
> >  {
> >      VTDAddressSpace *vtd_as = container_of(iommu, VTDAddressSpace, iommu);
> >      IntelIOMMUState *s = vtd_as->iommu_state;
> > +    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(s);
> >
> >      /* TODO: add support for VFIO and vhost users */
> >      if (s->snoop_control) {
> > @@ -3193,6 +3194,13 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
> >                           PCI_FUNC(vtd_as->devfn));
> >          return -ENOTSUP;
> >      }
> > +    if (!x86_iommu->dt_supported && (new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP)) {
> > +        error_setg_errno(errp, ENOTSUP,
> > +                         "device %02x.%02x.%x requires device IOTLB mode",
> > +                         pci_bus_num(vtd_as->bus), PCI_SLOT(vtd_as->devfn),
> > +                         PCI_FUNC(vtd_as->devfn));
> > +        return -ENOTSUP;
> > +    }
>
> While my r-b holds.. let's also do this for amd-iommu in the same patch?
> dt never supported there, so we can fail as long as DEVIOTLB registered.

Looks like there's one implementation:

Per spec:

""
The INVALIDATE_IOTLB_PAGES command is only present in IOMMU
implementations that support remote IOTLB caching of translations (see
Capability Offset 00h[IotlbSup]). This command instructs the specified
device to invalidate the given range of addresses in its IOTLB. The
size of the invalidate command is determined by the S bit and the
address.
""

And it has one implementation (though buggy) iommu_inval_iotlb() which
doesn't trigger any DEVIOTLB_UNMAP notifier.

We can leave this for the future.

(Last time I tried amd-iommu it didn't even boot).

Thanks

>
> >
> >      /* Update per-address-space notifier flags */
> >      vtd_as->notifier_flags = new;
> > --
> > 2.25.1
> >
>
> --
> Peter Xu
>


