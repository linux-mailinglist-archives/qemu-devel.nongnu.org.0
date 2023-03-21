Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A70D6C2888
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 04:22:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peSYt-0001rc-8N; Mon, 20 Mar 2023 23:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1peSYr-0001rS-8F
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 23:21:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1peSYp-0007UL-AW
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 23:21:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679368877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vud1drJ4ZGpzCAcZahUDGz2dK2ubwNQj4nNcNt97T+s=;
 b=NY2zZyvlJgb5TSt0lAzuyothxrQQxb5vJJ/jM6xvyo80iPkRC78AVA/qGFTAPbznOgPVtA
 380AwStIJNbFTsFyr1uNjiXA74tIaNiQvIKDhLXXbubf3a2tjF/QvFfJ0szbJGCxNRojLu
 nd1N2xzZBjBv8Ydf0lnznFQH+7fe0nI=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-8_eNb2r2PvuPmRZld85ivg-1; Mon, 20 Mar 2023 23:21:15 -0400
X-MC-Unique: 8_eNb2r2PvuPmRZld85ivg-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-1777653e2c4so7936250fac.1
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 20:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679368875;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vud1drJ4ZGpzCAcZahUDGz2dK2ubwNQj4nNcNt97T+s=;
 b=4cCnf1vkNMXaKAWFha/3AazAzWz2mV35RyOhVFGDF/hLTDQkKZlUaMgjcj0DeHs2Et
 JWxCFOHfLt0ZHGvZZ/Xn5GihKYXXf7eQmSYU13QcnzIyi+GBnxeoAZO/8X00ph6nAbkP
 BMXPKL/aEO3AC/MU11B4/uFGeoRNAQf8D3Zo+tytk7oAqqDSP0wkBionEPcvzlSQLO3p
 4qs3SaH8rs3Ue4KD4q0jyruVidKm4hGr5DExcDcbLyze2qbofvXJDOkkFLGg7lEwsgCl
 4WnxyfX8Bn2Nk5CIZCj4YQXclloAr3gDaPl2RBYoYInNhWCLl1OL+dG9DYDB2Y6M4cmn
 vxOw==
X-Gm-Message-State: AO0yUKUnBFW2L70qfXdQYjNN5wweMIQqpDqGy1FHI1b4md1mZevuBnO/
 1p9sWXjSlfXgPO2ppMrNAHwpKIE4dxACbp6wndb0/c9XPbYJlmpOrNHPinkNBYTuhr65J1KXmyR
 gJ7SvycnORyYeUc4MSYSimmh9lyS6z4s=
X-Received: by 2002:a05:6871:8703:b0:17e:255e:b1 with SMTP id
 tc3-20020a056871870300b0017e255e00b1mr165094oab.9.1679368874782; 
 Mon, 20 Mar 2023 20:21:14 -0700 (PDT)
X-Google-Smtp-Source: AK7set+23c8hnNZU5UYkLjcMiQchMY8lUhAHLbsJr2eg4LNAXdEAy3+7sFqsgBX3a5GNsvjCTnz5DQxX6rc9uwDnloU=
X-Received: by 2002:a05:6871:8703:b0:17e:255e:b1 with SMTP id
 tc3-20020a056871870300b0017e255e00b1mr165085oab.9.1679368874545; Mon, 20 Mar
 2023 20:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230320161959.650841-1-lulu@redhat.com>
 <20230320161959.650841-5-lulu@redhat.com>
In-Reply-To: <20230320161959.650841-5-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 21 Mar 2023 11:21:03 +0800
Message-ID: <CACGkMEuRZ4EvtYq45ZF0wgjR4g6eZHCfsfcgG45HfeAkZ47gGg@mail.gmail.com>
Subject: Re: [PATCH v14 4/4] vhost-vdpa: Add support for vIOMMU.
To: Cindy Lu <lulu@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Mar 21, 2023 at 12:20=E2=80=AFAM Cindy Lu <lulu@redhat.com> wrote:
>
> 1. The vIOMMU support will make vDPA can work in IOMMU mode. This
> will fix security issues while using the no-IOMMU mode.
> To support this feature we need to add new functions for IOMMU MR adds an=
d
> deletes.
>
> Also since the SVQ does not support vIOMMU yet, add the check for IOMMU
> in vhost_vdpa_dev_start, if the SVQ and IOMMU enable at the same time
> the function will return fail.
>
> 2. Skip the iova_max check vhost_vdpa_listener_skipped_section(). While
> MR is IOMMU, move this check to  vhost_vdpa_iommu_map_notify()
>
> Verified in vp_vdpa and vdpa_sim_net driver
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>  hw/virtio/vhost-vdpa.c         | 149 +++++++++++++++++++++++++++++++--
>  include/hw/virtio/vhost-vdpa.h |  11 +++
>  2 files changed, 152 insertions(+), 8 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 0c8c37e786..b36922b365 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -26,6 +26,7 @@
>  #include "cpu.h"
>  #include "trace.h"
>  #include "qapi/error.h"
> +#include "hw/virtio/virtio-access.h"
>
>  /*
>   * Return one past the end of the end of section. Be careful with uint64=
_t
> @@ -60,15 +61,22 @@ static bool vhost_vdpa_listener_skipped_section(Memor=
yRegionSection *section,
>                       iova_min, section->offset_within_address_space);
>          return true;
>      }
> +    /*
> +     * While using vIOMMU, sometimes the section will be larger than iov=
a_max,
> +     * but the memory that actually maps is smaller, so move the check t=
o
> +     * function vhost_vdpa_iommu_map_notify(). That function will use th=
e actual
> +     * size that maps to the kernel
> +     */
>
> -    llend =3D vhost_vdpa_section_end(section);
> -    if (int128_gt(llend, int128_make64(iova_max))) {
> -        error_report("RAM section out of device range (max=3D0x%" PRIx64
> -                     ", end addr=3D0x%" PRIx64 ")",
> -                     iova_max, int128_get64(llend));
> -        return true;
> +    if (!memory_region_is_iommu(section->mr)) {
> +        llend =3D vhost_vdpa_section_end(section);
> +        if (int128_gt(llend, int128_make64(iova_max))) {
> +            error_report("RAM section out of device range (max=3D0x%" PR=
Ix64
> +                         ", end addr=3D0x%" PRIx64 ")",
> +                         iova_max, int128_get64(llend));
> +            return true;
> +        }
>      }
> -

Unnecessary changes.

>      return false;
>  }
>
> @@ -185,6 +193,118 @@ static void vhost_vdpa_listener_commit(MemoryListen=
er *listener)
>      v->iotlb_batch_begin_sent =3D false;
>  }
>
> +static void vhost_vdpa_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry =
*iotlb)
> +{
> +    struct vdpa_iommu *iommu =3D container_of(n, struct vdpa_iommu, n);
> +
> +    hwaddr iova =3D iotlb->iova + iommu->iommu_offset;
> +    struct vhost_vdpa *v =3D iommu->dev;
> +    void *vaddr;
> +    int ret;
> +    Int128 llend;
> +
> +    if (iotlb->target_as !=3D &address_space_memory) {
> +        error_report("Wrong target AS \"%s\", only system memory is allo=
wed",
> +                     iotlb->target_as->name ? iotlb->target_as->name : "=
none");
> +        return;
> +    }
> +    RCU_READ_LOCK_GUARD();
> +    /* check if RAM section out of device range */
> +    llend =3D int128_add(int128_makes64(iotlb->addr_mask), int128_makes6=
4(iova));
> +    if (int128_gt(llend, int128_make64(v->iova_range.last))) {
> +        error_report("RAM section out of device range (max=3D0x%" PRIx64
> +                     ", end addr=3D0x%" PRIx64 ")",
> +                     v->iova_range.last, int128_get64(llend));
> +        return;
> +    }
> +
> +    vhost_vdpa_iotlb_batch_begin_once(v);

Quoted from you answer in V1:

"
the VHOST_IOTLB_BATCH_END message was send by
vhost_vdpa_listener_commit, because we only use
one vhost_vdpa_memory_listener and no-iommu mode will also need to use
this listener, So we still need to add the batch begin here, based on
my testing after the notify function was called,  the listener_commit
function was also called .so it works well in this situation
"

This assumes the map_notify to be called within the memory
transactions which is not necessarily the case.

I think it could be triggered when guest tries to establish a new
mapping in the vIOMMU. In this case there's no memory transactions at
all?

Thanks


