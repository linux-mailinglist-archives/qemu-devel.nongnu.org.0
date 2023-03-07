Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6926AD4E7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 03:41:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZNGA-0002EJ-Us; Mon, 06 Mar 2023 21:41:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZNG8-00025B-NB
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:41:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZNG6-0002YV-Vq
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:41:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678156857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZuFvTQcUuaioBIv36PnvqcW0MhvuZgPzuvc9d503NVw=;
 b=KexxXrZMhVLna4j6yVRJMCujU+QZMJ712eABDLtffbOt+kqnuKZ61c8J8tP4AZApp3EQTy
 wQLn5ePLOJpDDgRmKY3Izbbyg5iXmI1N2dJzkIWoQn4TRgsPKg8n0HZjqNNco96YdgqmvK
 2ETFM/IadmoRj7EcVlCJRrZJgU4jBBQ=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-exaD1SKANd62I-kIycKTgw-1; Mon, 06 Mar 2023 21:40:56 -0500
X-MC-Unique: exaD1SKANd62I-kIycKTgw-1
Received: by mail-il1-f200.google.com with SMTP id
 l5-20020a92d8c5000000b00316f26477d6so6309769ilo.10
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 18:40:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678156855;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZuFvTQcUuaioBIv36PnvqcW0MhvuZgPzuvc9d503NVw=;
 b=KeMZn1Pjwl2pqSsvHx8QYOuweMy4WVrP9S0SN2LsP2w4JPCqQgY6UISRrtkzsWkW1X
 S8jVOlxEiwPAgkYtU1onuYkKHXwQsYk67Rm/rvrFxQkFYGRRtmp2CgxhzVvu3CX75mco
 JCs/h/a0t5zK6LvbBMn4491ezSB8AI2j/4mgaAk0TMUbuyYVKFdYBhrZy0kZyJp5eSYw
 DxJHwBhxleZbV/Z4XCzF97tCRa3uXXo4FyxkoS7wHsVUCtRC0sS2wypALe9o06QapFaO
 V+gxMP18n+xsmNPYll+iLg2SHf9IXGM/59ltGb/11pu5E442J/clTQXoXkEsIv7g6RWp
 i+Hw==
X-Gm-Message-State: AO0yUKX6obXZlrPdgMI8+ylpmSlpccUo6tpxTgzs2kJdiWimjpyc1ynO
 Yy9W+myopTe3i28KmSzB05i1a0mTAGkl0grgLkyJnyFRLk9SwC3753IIVQAqxfPhE9CBimT+p68
 xFFCerAyU4M6v0PE=
X-Received: by 2002:a05:6e02:20c7:b0:315:3036:4da with SMTP id
 7-20020a056e0220c700b00315303604damr11157175ilq.30.1678156855209; 
 Mon, 06 Mar 2023 18:40:55 -0800 (PST)
X-Google-Smtp-Source: AK7set+gsyIRoTjQnwHRxD7oFfiSxvHNP2pBaeRZLNBJ0QBLZC20m3aZtcAWX/brWC00v82Wu8YUSw==
X-Received: by 2002:a05:6e02:20c7:b0:315:3036:4da with SMTP id
 7-20020a056e0220c700b00315303604damr11157157ilq.30.1678156854871; 
 Mon, 06 Mar 2023 18:40:54 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 m2-20020a056638224200b003a9595b7e3asm3753464jas.46.2023.03.06.18.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 18:40:54 -0800 (PST)
Date: Mon, 6 Mar 2023 19:40:53 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Cedric Le Goater <clg@redhat.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
Subject: Re: [PATCH v4 07/14] vfio/common: Add helper to consolidate
 iova/end calculation
Message-ID: <20230306194053.36cbfe12.alex.williamson@redhat.com>
In-Reply-To: <20230307020258.58215-8-joao.m.martins@oracle.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
 <20230307020258.58215-8-joao.m.martins@oracle.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
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

On Tue,  7 Mar 2023 02:02:51 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> In preparation to be used in device dirty tracking, move the code that
> calculates a iova/end range from the container/section.  This avoids
> duplication on the common checks across listener callbacks.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  hw/vfio/common.c | 37 ++++++++++++++++++++++++++++++-------
>  1 file changed, 30 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 54b4a4fc7daf..3a6491dbc523 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -961,6 +961,35 @@ static bool vfio_listener_valid_section(MemoryRegionSection *section)
>      return true;
>  }
>  
> +/*
> + * Called for the dirty tracking memory listener to calculate the iova/end
> + * for a given memory region section.
> + */
> +static bool vfio_get_section_iova_range(VFIOContainer *container,
> +                                        MemoryRegionSection *section,
> +                                        hwaddr *out_iova, hwaddr *out_end,
> +                                        Int128 *out_llend)
> +{
> +    Int128 llend;
> +    hwaddr iova;
> +
> +    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
> +    llend = int128_make64(section->offset_within_address_space);
> +    llend = int128_add(llend, section->size);
> +    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask()));
> +
> +    if (int128_ge(int128_make64(iova), llend)) {
> +        return false;
> +    }
> +
> +    *out_iova = iova;
> +    *out_end = int128_get64(int128_sub(llend, int128_one()));
> +    if (out_llend) {
> +        *out_llend = llend;
> +    }
> +    return true;
> +}
> +
>  static void vfio_listener_region_add(MemoryListener *listener,
>                                       MemoryRegionSection *section)
>  {
> @@ -976,12 +1005,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
>          return;
>      }
>  
> -    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
> -    llend = int128_make64(section->offset_within_address_space);
> -    llend = int128_add(llend, section->size);
> -    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask()));
> -
> -    if (int128_ge(int128_make64(iova), llend)) {
> +    if (!vfio_get_section_iova_range(container, section, &iova, &end, &llend)) {
>          if (memory_region_is_ram_device(section->mr)) {
>              trace_vfio_listener_region_add_no_dma_map(
>                  memory_region_name(section->mr),
> @@ -991,7 +1015,6 @@ static void vfio_listener_region_add(MemoryListener *listener,
>          }
>          return;
>      }
> -    end = int128_get64(int128_sub(llend, int128_one()));
>  
>      if (container->iommu_type == VFIO_SPAPR_TCE_v2_IOMMU) {
>          hwaddr pgsize = 0;

Shouldn't this convert vfio_listener_region_del() too?  Thanks,

Alex


