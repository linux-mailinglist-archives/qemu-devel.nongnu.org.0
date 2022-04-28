Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E83513C86
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 22:16:09 +0200 (CEST)
Received: from localhost ([::1]:44950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkAYa-0002zv-2a
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 16:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nkAX8-0002Gt-Jt
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 16:14:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nkAX2-00051U-SV
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 16:14:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651176869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z7JjeR6B8JNuIWU9oLzHL+p9sPxQnGKFhu9bOZGZ3hM=;
 b=ITgtpN5eRZwS6Vizv85tcYtrl9L2LPBQZo5L8VqgeseZuJ64jZSw+/cHjtpn6a4xt2MAss
 i5NhujmSM1Bq3OCwTr4Aty1uMzYqHQ47fP5LbaXVZbNpd3PptdB1SxenR6TC/7gn2f74Be
 yuiaIzR0INnTMidHFPA248WyZCLwZ4w=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-rNABWkNBOt-rLKoGD-JsIg-1; Thu, 28 Apr 2022 16:14:25 -0400
X-MC-Unique: rNABWkNBOt-rLKoGD-JsIg-1
Received: by mail-il1-f200.google.com with SMTP id
 s10-20020a92c5ca000000b002cc45dade1aso2429892ilt.20
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 13:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=z7JjeR6B8JNuIWU9oLzHL+p9sPxQnGKFhu9bOZGZ3hM=;
 b=i4DLPRdixJLSpVqfSX7/1CzlVAA51hgx+VbCw9W5xE2i6CBa5lvAeaJvtD2n8zv2K7
 RvfaPTwXwPORn4eTYIkbhNVkQCYo/88wSWfAPcNHe1a2X11tiHNq2ubg9uNT+MPwaFOd
 jzqw4j7cVaeuGdK88AN8mQEjza63quxStupPTRbdZ8BHPFDD2Efbwl/QwtQ1TLm7yShy
 h/axYu5xTbiG3lpz06cWutjCwsvgJ5PXX6SZHjT067kQH270axC5TvvuOkCTu7VIBeyB
 judJ/YFPn9MWFYq+efWtELawbmP6kJWIeJKD2n9ES/THiViHxWlkrTD8PMo0zahXz+fG
 9frQ==
X-Gm-Message-State: AOAM531S9LPEUsXwKkkhtGnhjEGlPhaIb6lUYAcUOCveV51dr8BoFUid
 QydrlKRZf+RGADiEnXddpfrpUDmq4zbtCBXsUkeeLnDxtogWScYafiG8OXipE7ESAPzmu0LsSYw
 wQIMGCiPHTeV6zbs=
X-Received: by 2002:a5d:8555:0:b0:654:a4c8:35b3 with SMTP id
 b21-20020a5d8555000000b00654a4c835b3mr14598904ios.47.1651176864633; 
 Thu, 28 Apr 2022 13:14:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfC2SvjRn79/ILII/O4RitT78JDmhevd0GHcjBStGNjHul1baVvOWy5ZZjtJCwkfSfKG5Z2A==
X-Received: by 2002:a5d:8555:0:b0:654:a4c8:35b3 with SMTP id
 b21-20020a5d8555000000b00654a4c835b3mr14598895ios.47.1651176864367; 
 Thu, 28 Apr 2022 13:14:24 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 g14-20020a92dd8e000000b002ca7bbf5179sm421351iln.53.2022.04.28.13.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 13:14:24 -0700 (PDT)
Date: Thu, 28 Apr 2022 14:14:23 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v4] vfio/common: remove spurious tpm-crb-cmd
 misalignment warning
Message-ID: <20220428141423.6e2da84c.alex.williamson@redhat.com>
In-Reply-To: <20220428134945.511829-1-eric.auger@redhat.com>
References: <20220428134945.511829-1-eric.auger@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: cohuck@redhat.com, f4bug@amsat.org, stefanb@linux.vnet.ibm.com,
 qemu-devel@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Apr 2022 15:49:45 +0200
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
> Acked-by: Stefan Berger <stefanb@linux.ibm.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
>=20
> ---
>=20
> v3 -> v4:
> - rebase on top of qemu_real_host_page_size() and
>   qemu_real_host_page_size(). Print the size and make the message
>   consistent
> - Added Stefan's A-b and Connie R-b (despite the changes)
> ---
>  hw/vfio/common.c     | 27 ++++++++++++++++++++++++++-
>  hw/vfio/trace-events |  1 +
>  2 files changed, 27 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 2b1f78fdfa..f6b9bb6d71 100644
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

It looks like this test is going to need to be wrapped in #ifdef
CONFIG_TPM:

https://gitlab.com/alex.williamson/qemu/-/jobs/2391952412

Thanks,

Alex

> +
> +    /* this is a known safe misaligned region, just trace for debug purp=
ose */
> +    trace_vfio_known_safe_misalignment(memory_region_name(mr),
> +                                       section->offset_within_address_sp=
ace,
> +                                       section->offset_within_region,
> +                                       qemu_real_host_page_size());
> +    return true;
> +}
> +
>  static void vfio_listener_region_add(MemoryListener *listener,
>                                       MemoryRegionSection *section)
>  {
> @@ -884,7 +901,15 @@ static void vfio_listener_region_add(MemoryListener =
*listener,
>      if (unlikely((section->offset_within_address_space &
>                    ~qemu_real_host_page_mask()) !=3D
>                   (section->offset_within_region & ~qemu_real_host_page_m=
ask()))) {
> -        error_report("%s received unaligned region", __func__);
> +        if (!vfio_known_safe_misalignment(section)) {
> +            error_report("%s received unaligned region %s iova=3D0x%"PRI=
x64
> +                         " offset_within_region=3D0x%"PRIx64
> +                         " qemu_real_host_page_size=3D0x%"PRIxPTR,
> +                         __func__, memory_region_name(section->mr),
> +                         section->offset_within_address_space,
> +                         section->offset_within_region,
> +                         qemu_real_host_page_size());
> +        }
>          return;
>      }
> =20
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 0ef1b5f4a6..582882db91 100644
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
ffset_within_region, uintptr_t page_size) "Region \"%s\" iova=3D0x%"PRIx64"=
 offset_within_region=3D0x%"PRIx64" qemu_real_host_page_size=3D0x%"PRIxPTR =
": cannot be mapped for DMA"
>  vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uin=
t64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=3D0x%"PRIx6=
4" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
>  vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING re=
gion_del 0x%"PRIx64" - 0x%"PRIx64
>  vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"P=
RIx64" - 0x%"PRIx64


