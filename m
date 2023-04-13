Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2586C6E0744
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 08:58:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmqt5-0003qC-Vw; Thu, 13 Apr 2023 02:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pmqt3-0003pr-4s
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 02:56:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pmqt1-0003QC-Gh
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 02:56:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681369010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lhl9PZRhu56laHcfb/TN1B8QC9v3FfBrVryYS+pqjdU=;
 b=XNUCN5tSh08mAuwaccult17DNI/0yZwu65jXh1gSl0sGYaCnryKqgRyzsEZ+X0SgCwbQ5n
 QN4LRYValm4oRu69xwuNXA9KOfKZmDcb4YawnI7rc76C7Gj14h+4GDK0OUMRdZt6N7HQhq
 3342TQ/H22ViltnkbToGiedLBNHooU8=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-IAxJxBygNYGiSqHW9XeMFA-1; Thu, 13 Apr 2023 02:56:46 -0400
X-MC-Unique: IAxJxBygNYGiSqHW9XeMFA-1
Received: by mail-ot1-f72.google.com with SMTP id
 e8-20020a0568301e4800b006a1461bc5cdso1560875otj.12
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 23:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681369005; x=1683961005;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lhl9PZRhu56laHcfb/TN1B8QC9v3FfBrVryYS+pqjdU=;
 b=OTT2wthahsabKFl5wW+ICinKEty63ZnjGBtyPB0gepXoY1WRp59Dez0hgvgz7n1ILt
 QC5asEHX6KSQjVZAapPAb+94uwoqQtgvzQecTQ1+gYUsX4dkhAGCQ+blKytWik68bS1B
 Kx8Gzoulmwzap+uVtOKiOwSp8JKT68Wy2fBycZTrQYFuJrvKdYws5m3MVkNOXGNLpnwl
 m8i9B5DWwVW58wJkX+fjpLmg9FHxv4nmsQM3uWhRWXnl4TzHO/HDKGrjh76q1HMVoxyA
 F+5F1x4TByWmCtX6lVShi/3YjPi/1WUv0Q+CBmfSR6wOuJqa+xhjyAKOXNOPu+GxvBrO
 gPkw==
X-Gm-Message-State: AAQBX9dzcKST8Qlnnem8157cOtVLZrW7UFbtuQuX+D2cXkCC2y1U8FCY
 64Z4dq70SuEiWSYoxzXpJbOQWLuHdKDQB7aJ8vpYtiBcJvvYEYRasGIGkOZFZjhlUd6TmuQ4HNz
 3JDXcojjRIPofsGZRFEbAkCSVsq1PRZI=
X-Received: by 2002:a05:6870:910a:b0:184:cb2c:e81c with SMTP id
 o10-20020a056870910a00b00184cb2ce81cmr735051oae.9.1681369005524; 
 Wed, 12 Apr 2023 23:56:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350b852Rp/tHYzrTDr4aykS5UWnZTvCuVfY1o4TxHrkcu9dHm3zFcOv2EAAPxfNTwFok6Pq2c6oCLFsQVpSRqaHg=
X-Received: by 2002:a05:6870:910a:b0:184:cb2c:e81c with SMTP id
 o10-20020a056870910a00b00184cb2ce81cmr735044oae.9.1681369005245; Wed, 12 Apr
 2023 23:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230330164944.75481-1-viktor@daynix.com>
 <CAPv0NP6dMyB-CZgvrjW93aWbutj2dkFPT_2KYutMJLc6rFytzQ@mail.gmail.com>
In-Reply-To: <CAPv0NP6dMyB-CZgvrjW93aWbutj2dkFPT_2KYutMJLc6rFytzQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 13 Apr 2023 14:56:33 +0800
Message-ID: <CACGkMEtivcqgN06bNve5T3_iPnhmOja6nsb1+bf4e0mPj4ax-w@mail.gmail.com>
Subject: Re: [RFC PATCH] vhost: enable IOMMU_NOTIFIER_UNMAP events handling
 when device-iotlb=on
To: Viktor Prutyanov <viktor@daynix.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, yan@daynix.com, 
 yuri.benditovich@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Apr 13, 2023 at 2:24=E2=80=AFPM Viktor Prutyanov <viktor@daynix.com=
> wrote:
>
> On Thu, Mar 30, 2023 at 7:49=E2=80=AFPM Viktor Prutyanov <viktor@daynix.c=
om> wrote:
> >
> > Even if Device-TLB and PCI ATS is enabled, the guest can reject to use
> > it. For example, this situation appears when Windows Server 2022 is
> > running with intel-iommu with device-iotlb=3Don and virtio-net-pci with
> > vhost=3Don. The guest implies that no address translation info cached i=
n
> > device IOTLB and doesn't send device IOTLB invalidation commands. So,
> > it leads to irrelevant address translations in vhost-net in the host
> > kernel. Therefore network frames from the guest in host tap interface
> > contains wrong payload data.
> >
> > This patch enables IOTLB unmap events (IOMMU_NOTIFIER_UNMAP) along with
> > Device-TLB unmap events (IOMMU_NOTIFIER_DEVIOTLB_UNMAP) handling for
> > proper vhost IOTLB unmapping when the guest isn't aware of Device-TLB.
> >
> > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D2001312
> > Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
> > ---
> >
> >  Tested on Windows Server 2022 and Fedora guests with
> >  -device virtio-net-pci,bus=3Dpci.3,netdev=3Dnd0,iommu_platform=3Don,at=
s=3Don
> >  -netdev tap,id=3Dnd0,ifname=3Dtap1,script=3Dno,downscript=3Dno,vhost=
=3Don
> >  -device intel-iommu,intremap=3Don,eim=3Don,device-iotlb=3Don/off
> >
> >  hw/virtio/vhost.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > index a266396576..968ca18fce 100644
> > --- a/hw/virtio/vhost.c
> > +++ b/hw/virtio/vhost.c
> > @@ -796,7 +796,7 @@ static void vhost_iommu_region_add(MemoryListener *=
listener,
> >      iommu_idx =3D memory_region_iommu_attrs_to_index(iommu_mr,
> >                                                     MEMTXATTRS_UNSPECIF=
IED);
> >      iommu_notifier_init(&iommu->n, vhost_iommu_unmap_notify,
> > -                        IOMMU_NOTIFIER_DEVIOTLB_UNMAP,
> > +                        IOMMU_NOTIFIER_DEVIOTLB_UNMAP | IOMMU_NOTIFIER=
_UNMAP,
> >                          section->offset_within_region,
> >                          int128_get64(end),
> >                          iommu_idx);

This looks kind of tricky. E.g when ATS is enabled, there could be
unnecessary flues. Or at least it requires some comment to explain.

I think the correct fix is:

1) introduce a transport specific method for querying if it supports
device IOTLB
2) in the pci implementation hook it to some like pice_ats_enabled()
3) so we can decide if device IOTLB is enabled, go for DEVIOTLB_UNMAP
otherwise a simple UNMAP.

Thanks

> > --
> > 2.35.1
> >
>
> ping
>


