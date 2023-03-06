Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFF26AC483
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:11:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCUp-0003JS-RS; Mon, 06 Mar 2023 10:11:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZCUo-0003Iw-0O
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:11:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZCUm-0005IZ-5r
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:11:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678115483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R7t+U8D65PWQ4iaU2lla0cGxRxAPY9AYOnwhtH/oHhg=;
 b=EjeWjgCo5Saw+4OdTU26bkB1EJrPuToNLW4kgcwYvzp3T93ymjnpauU2ThgNTsz/t7ILCC
 owJxJGcIbk2UIhsgftjJZ15xAiT6beCYOsGf0XVs0ZcOb7aYNBphQBzSIIpikutj1JP1C9
 iSeYiL8ULzdWxLtKeO0JRTy81AJb97w=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-H9ND89NzPmGP2sNSFroCtA-1; Mon, 06 Mar 2023 10:11:22 -0500
X-MC-Unique: H9ND89NzPmGP2sNSFroCtA-1
Received: by mail-io1-f71.google.com with SMTP id
 k23-20020a5e8917000000b0074cbfb58b5bso5454445ioj.14
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:11:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678115476;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R7t+U8D65PWQ4iaU2lla0cGxRxAPY9AYOnwhtH/oHhg=;
 b=R9GGMxpLVgbWdKBZc7sVqoau8jDbMnwDtIaGV2X3T4e69OMB8bDa09yY0Xm574o4rJ
 ZHKZ6bH+kN0kVzzbcwzxuKv1ui9UngqKlkYBpW5wpQik4aFQcw8WBwHzZ9NC0IGHaT2o
 0sYnruNIr5VbhtWIV9yDW0q1gILOv735g+4vP3WNOll/p+sXpjEVVdkoYPg/SfLSTBmA
 QEAuGLBGphC57i/rLbpmkZWhNQrFFpaFpDR0vT5sEKfNHkeZL0rtIkdrMODjfmPUiPJH
 DDv6Nq2l3yafKQ5dEJOkzfvkNz+vJkQipXD5lb1CSG20dfFItgxQ0Xu4MuAqbUAMQDtO
 wq6g==
X-Gm-Message-State: AO0yUKW1J6QtN8SBkeqOUPQENauVfnksHY1X6oWf6/emtOESqU3eqkne
 qM4Ci/X3+QPPViWeDY5dMmVVHXMNsRABJFc6skdRGFJVCoJhmlMUXxOsSb+Mzv0ix4F9epaDZAO
 Y+hUmO8qPox+8o4I=
X-Received: by 2002:a6b:fe08:0:b0:74c:b8f9:651b with SMTP id
 x8-20020a6bfe08000000b0074cb8f9651bmr11245320ioh.1.1678115476344; 
 Mon, 06 Mar 2023 07:11:16 -0800 (PST)
X-Google-Smtp-Source: AK7set+HWIV3+a1cnDmskCMyG50M9CL0X8NCmgj/mVZXs/RHqBKPM4pYTKkAEIG6ewiz8Gi96yTLIg==
X-Received: by 2002:a6b:fe08:0:b0:74c:b8f9:651b with SMTP id
 x8-20020a6bfe08000000b0074cb8f9651bmr11245302ioh.1.1678115476029; 
 Mon, 06 Mar 2023 07:11:16 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 v12-20020a6b5b0c000000b00746cb6d90c0sm3262396ioh.14.2023.03.06.07.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:11:15 -0800 (PST)
Date: Mon, 6 Mar 2023 08:11:14 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 07/13] vfio/common: Record DMA mapped IOVA ranges
Message-ID: <20230306081114.4cfa7c32.alex.williamson@redhat.com>
In-Reply-To: <1e41f0d1-5b65-4a90-c8ac-16177d6460a6@oracle.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230304014343.33646-8-joao.m.martins@oracle.com>
 <2d1677ea-4895-f7e9-a6dd-0973cd270e5b@redhat.com>
 <1e41f0d1-5b65-4a90-c8ac-16177d6460a6@oracle.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

On Mon, 6 Mar 2023 14:37:04 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 06/03/2023 13:41, C=C3=A9dric Le Goater wrote:
> > On 3/4/23 02:43, Joao Martins wrote: =20
> >> According to the device DMA logging uAPI, IOVA ranges to be logged by
> >> the device must be provided all at once upon DMA logging start.
> >>
> >> As preparation for the following patches which will add device dirty
> >> page tracking, keep a record of all DMA mapped IOVA ranges so later th=
ey
> >> can be used for DMA logging start.
> >>
> >> Note that when vIOMMU is enabled DMA mapped IOVA ranges are not tracke=
d.
> >> This is due to the dynamic nature of vIOMMU DMA mapping/unmapping.
> >>
> >> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> >> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> >> ---
> >> =C2=A0 hw/vfio/common.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 84 +++++++++++++++++++++++++++++++++++
> >> =C2=A0 hw/vfio/trace-events=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 1 +
> >> =C2=A0 include/hw/vfio/vfio-common.h | 11 +++++
> >> =C2=A0 3 files changed, 96 insertions(+)
> >>
> >> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> >> index ed908e303dbb..d84e5fd86bb4 100644
> >> --- a/hw/vfio/common.c
> >> +++ b/hw/vfio/common.c
> >> @@ -44,6 +44,7 @@
> >> =C2=A0 #include "migration/blocker.h"
> >> =C2=A0 #include "migration/qemu-file.h"
> >> =C2=A0 #include "sysemu/tpm.h"
> >> +#include "qemu/iova-tree.h"
> >> =C2=A0 =C2=A0 VFIOGroupList vfio_group_list =3D
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 QLIST_HEAD_INITIALIZER(vfio_group_list);
> >> @@ -1313,11 +1314,94 @@ static int vfio_set_dirty_page_tracking(VFIOCo=
ntainer
> >> *container, bool start)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> >> =C2=A0 }
> >> =C2=A0 +/*
> >> + * Called for the dirty tracking memory listener to calculate the iov=
a/end
> >> + * for a given memory region section. The checks here, replicate the =
logic
> >> + * in vfio_listener_region_{add,del}() used for the same purpose. And=
 thus
> >> + * both listener should be kept in sync.
> >> + */
> >> +static bool vfio_get_section_iova_range(VFIOContainer *container,
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 MemoryRegionSection *section,
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 hwaddr *out_iova, hwaddr *out_end)
> >> +{
> >> +=C2=A0=C2=A0=C2=A0 Int128 llend;
> >> +=C2=A0=C2=A0=C2=A0 hwaddr iova;
> >> +
> >> +=C2=A0=C2=A0=C2=A0 iova =3D REAL_HOST_PAGE_ALIGN(section->offset_with=
in_address_space);
> >> +=C2=A0=C2=A0=C2=A0 llend =3D int128_make64(section->offset_within_add=
ress_space);
> >> +=C2=A0=C2=A0=C2=A0 llend =3D int128_add(llend, section->size);
> >> +=C2=A0=C2=A0=C2=A0 llend =3D int128_and(llend, int128_exts64(qemu_rea=
l_host_page_mask()));
> >> +
> >> +=C2=A0=C2=A0=C2=A0 if (int128_ge(int128_make64(iova), llend)) {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
> >> +=C2=A0=C2=A0=C2=A0 }
> >> +
> >> +=C2=A0=C2=A0=C2=A0 *out_iova =3D iova;
> >> +=C2=A0=C2=A0=C2=A0 *out_end =3D int128_get64(llend) - 1;
> >> +=C2=A0=C2=A0=C2=A0 return true;
> >> +}
> >> +
> >> +static void vfio_dirty_tracking_update(MemoryListener *listener,
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 MemoryRegionSection *section)
> >> +{
> >> +=C2=A0=C2=A0=C2=A0 VFIOContainer *container =3D container_of(listener=
, VFIOContainer,
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tracking_listener);
> >> +=C2=A0=C2=A0=C2=A0 VFIODirtyTrackingRange *range =3D &container->trac=
king_range;
> >> +=C2=A0=C2=A0=C2=A0 hwaddr max32 =3D (1ULL << 32) - 1ULL;
> >> +=C2=A0=C2=A0=C2=A0 hwaddr iova, end;
> >> +
> >> +=C2=A0=C2=A0=C2=A0 if (!vfio_listener_valid_section(section) ||
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !vfio_get_section_iova_ran=
ge(container, section, &iova, &end)) {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> >> +=C2=A0=C2=A0=C2=A0 }
> >> +
> >> +=C2=A0=C2=A0=C2=A0 WITH_QEMU_LOCK_GUARD(&container->tracking_mutex) {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (iova < max32 && end <=
=3D max32) {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (range->min32 > iova) {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->min32 =3D iova;
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (range->max32 < end) {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->max32 =3D end;
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 trace_vfio_device_dirty_tracking_update(iova, end,
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->min32, range->max32);
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (!range->min64 || range->min64 > iova) {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->min64 =3D iova;
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (range->max64 < end) {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->max64 =3D end;
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 trace_vfio_device_dirty_tracking_update(iova, end,
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->min64, range->max64);
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0=C2=A0=C2=A0 return;
> >> +}
> >> +
> >> +static const MemoryListener vfio_dirty_tracking_listener =3D {
> >> +=C2=A0=C2=A0=C2=A0 .name =3D "vfio-tracking",
> >> +=C2=A0=C2=A0=C2=A0 .region_add =3D vfio_dirty_tracking_update,
> >> +};
> >> +
> >> +static void vfio_dirty_tracking_init(VFIOContainer *container)
> >> +{
> >> +=C2=A0=C2=A0=C2=A0 memset(&container->tracking_range, 0, sizeof(conta=
iner->tracking_range));
> >> +=C2=A0=C2=A0=C2=A0 qemu_mutex_init(&container->tracking_mutex);
> >> +=C2=A0=C2=A0=C2=A0 container->tracking_listener =3D vfio_dirty_tracki=
ng_listener;
> >> +=C2=A0=C2=A0=C2=A0 memory_listener_register(&container->tracking_list=
ener,
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 container->space->as); =20
> >=20
> > The following unregister+destroy calls seem to belong to a _fini routin=
e.
> > Am I missing something ?
> >  =20
> The thinking is that once we register the memory listener, it will iterate
> over all the sections and once that is finished the memory_listener_regis=
ter
> returns. So the state we initialize here isn't needed anyelse other than =
to
> create the range and hence we destroy it right away. It was at container_=
init()
> but it was unnecessary overhead to keep around if it's *only* needed when=
 we
> start/stop dirty tracking.
>=20
> So the reason I don't add a _fini method is because there's no need to te=
ardown
> the state anywhere else other than this function.
>=20
> I would argue that maybe I don't need the mutex at all as this is all ser=
ialized...

Right, this is in line with my previous comments that we don't need to
keep the listener around since we don't expect changes to memory
regions, ex. virtio-mem slots are locked down during migration, and we
don't support removal of ranges from the device anyway.  We're done with
the listener after it's built our min/max ranges.  And yes, the mutex
seems superfluous.  Thanks,

Alex


