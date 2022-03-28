Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A31664EA12D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 22:14:05 +0200 (CEST)
Received: from localhost ([::1]:39070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYvkZ-000194-UL
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 16:14:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nYviv-0007qs-Ss
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:12:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nYvir-0002oV-3j
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:12:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648498335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPyB9ixINfp9yiW6K0481yPoG04bFlDUvKB8fTFQ738=;
 b=Y5rqp/4shVJBWX/LTaP8FRugJ8iKHFBhQDL3Z4R7qlIDpsO9V/cuPH/b5+rig6dxanV/oJ
 LWdB90Q7uo6OthIhPQXnroXtjBc+Yau3VkJE2KCUGeMVmJ4LFz5PP0LM9cwBsCF6CLaRdA
 xhs2q36ZQZkO689EUSxuVGS+2FEzEIg=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-1_Y17OA8MnC7XP5xVXvEAA-1; Mon, 28 Mar 2022 16:12:14 -0400
X-MC-Unique: 1_Y17OA8MnC7XP5xVXvEAA-1
Received: by mail-il1-f200.google.com with SMTP id
 c18-20020a056e02059200b002c9b854c3a3so2075834ils.22
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 13:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=DPyB9ixINfp9yiW6K0481yPoG04bFlDUvKB8fTFQ738=;
 b=KtDVZgVtVnhauT0kne5ZRAv2kvarQlzNYeUzJJMEARN9JmKURr9jokCNzPwJkLxS1i
 I6vaop/ZvbJK6G0fN7Lt2F3Jt90ykG5R+LRYKOeMXmqi5l7qopGbUviH6WzEYPUklfG5
 lQLBC333hgbYRnC5TgoUCxGFnKfv7EWiFwe1uu0WlhE2I9ewXVTUVDiggs3/U9xjaiVZ
 Se457iY0jTiOILHT7meFhb4j+DATsXL3yloAd5YfoNvsz6CWleGuVmVW+R1x2yU/YJ1E
 wJIeU//AQEyOB1cf8YRoZnG0Y1+eJT+lbscm8zeXcKa0NLxEbxlgAcwt9E7kYeC8Pg7U
 vJNQ==
X-Gm-Message-State: AOAM533+VOK1zq5540PGCNAjWEt6RsiVyp3uB0OIgAj2Xq1z4LhFCEss
 4db4XtiKKZrXi1WTqBt5B9SnPeBilMdpBJRQbJvPSdxkXe8tCxF/l0t6JMMLukCO2gKIhdt+xHU
 sA4m2p8CigUOhAzE=
X-Received: by 2002:a05:6638:4128:b0:323:62b4:30c3 with SMTP id
 ay40-20020a056638412800b0032362b430c3mr5482076jab.318.1648498333561; 
 Mon, 28 Mar 2022 13:12:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRkAEGWNFygNcXiKv2SXqI348JotSiomm3/mdWczzQ6TvzWvLUSpTQKewiZy9v4kR/htQxWg==
X-Received: by 2002:a05:6638:4128:b0:323:62b4:30c3 with SMTP id
 ay40-20020a056638412800b0032362b430c3mr5482062jab.318.1648498333298; 
 Mon, 28 Mar 2022 13:12:13 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 f9-20020a5ec709000000b00645ec64112asm8194348iop.42.2022.03.28.13.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 13:12:13 -0700 (PDT)
Date: Mon, 28 Mar 2022 14:12:11 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 for-7.1] vfio/common: remove spurious tpm-crb-cmd
 misalignment warning
Message-ID: <20220328141211.5f00c28d.alex.williamson@redhat.com>
In-Reply-To: <20220323203119.360894-1-eric.auger@redhat.com>
References: <20220323203119.360894-1-eric.auger@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, stefanb@linux.vnet.ibm.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Mar 2022 21:31:19 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> The CRB command buffer currently is a RAM MemoryRegion and given
> its base address alignment, it causes an error report on
> vfio_listener_region_add(). This region could have been a RAM device
> region, easing the detection of such safe situation but this option
> was not well received. So let's add a helper function that uses the
> memory region owner type to detect the situation is safe wrt
> the assignment. Other device types can be checked here if such kind
> of problem occurs again.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>=20
> ---

Thanks Eric!  I'll queue this for after the v7.0 release with Connie's
and Stefan's reviews.  Thanks,

Alex

>=20
> v2 -> v3:
> - Use TPM_IS_CRB()
>=20
> v1 -> v2:
> - do not check the MR name but rather the owner type
> ---
>  hw/vfio/common.c     | 27 ++++++++++++++++++++++++++-
>  hw/vfio/trace-events |  1 +
>  2 files changed, 27 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 080046e3f51..55bc116473e 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -40,6 +40,7 @@
>  #include "trace.h"
>  #include "qapi/error.h"
>  #include "migration/migration.h"
> +#include "sysemu/tpm.h"
> =20
>  VFIOGroupList vfio_group_list =3D
>      QLIST_HEAD_INITIALIZER(vfio_group_list);
> @@ -861,6 +862,22 @@ static void vfio_unregister_ram_discard_listener(VFI=
OContainer *container,
>      g_free(vrdl);
>  }
> =20
> +static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
> +{
> +    MemoryRegion *mr =3D section->mr;
> +
> +    if (!TPM_IS_CRB(mr->owner)) {
> +        return false;
> +    }
> +
> +    /* this is a known safe misaligned region, just trace for debug purp=
ose */
> +    trace_vfio_known_safe_misalignment(memory_region_name(mr),
> +                                       section->offset_within_address_sp=
ace,
> +                                       section->offset_within_region,
> +                                       qemu_real_host_page_size);
> +    return true;
> +}
> +
>  static void vfio_listener_region_add(MemoryListener *listener,
>                                       MemoryRegionSection *section)
>  {
> @@ -884,7 +901,15 @@ static void vfio_listener_region_add(MemoryListener =
*listener,
>      if (unlikely((section->offset_within_address_space &
>                    ~qemu_real_host_page_mask) !=3D
>                   (section->offset_within_region & ~qemu_real_host_page_m=
ask))) {
> -        error_report("%s received unaligned region", __func__);
> +        if (!vfio_known_safe_misalignment(section)) {
> +            error_report("%s received unaligned region %s iova=3D0x%"PRI=
x64
> +                         " offset_within_region=3D0x%"PRIx64
> +                         " qemu_real_host_page_mask=3D0x%"PRIxPTR,
> +                         __func__, memory_region_name(section->mr),
> +                         section->offset_within_address_space,
> +                         section->offset_within_region,
> +                         qemu_real_host_page_mask);
> +        }
>          return;
>      }
> =20
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 0ef1b5f4a65..6f38a2e6991 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -100,6 +100,7 @@ vfio_listener_region_add_skip(uint64_t start, uint64_=
t end) "SKIPPING region_add
>  vfio_spapr_group_attach(int groupfd, int tablefd) "Attached groupfd %d t=
o liobn fd %d"
>  vfio_listener_region_add_iommu(uint64_t start, uint64_t end) "region_add=
 [iommu] 0x%"PRIx64" - 0x%"PRIx64
>  vfio_listener_region_add_ram(uint64_t iova_start, uint64_t iova_end, voi=
d *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64" [%p]"
> +vfio_known_safe_misalignment(const char *name, uint64_t iova, uint64_t o=
ffset_within_region, uint64_t page_size) "Region \"%s\" iova=3D0x%"PRIx64" =
offset_within_region=3D0x%"PRIx64" qemu_real_host_page_mask=3D0x%"PRIxPTR "=
: cannot be mapped for DMA"
>  vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uin=
t64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=3D0x%"PRIx6=
4" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
>  vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING re=
gion_del 0x%"PRIx64" - 0x%"PRIx64
>  vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"P=
RIx64" - 0x%"PRIx64


