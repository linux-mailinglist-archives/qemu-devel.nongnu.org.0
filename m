Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57503494198
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 21:16:25 +0100 (CET)
Received: from localhost ([::1]:39872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAHNX-0001w5-W3
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 15:16:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nAHLI-00018i-9L
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 15:14:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nAHLE-0001PS-Ue
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 15:14:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642623239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dx6iwoGJaaRX603GZ+c1L/FbhD1HkJ8r69z6JOrz8YI=;
 b=QM1jVVt2oS8RE9/YCKlzXtNPjte6Kh1wYSAhKOeDFjFcgu3HMlx0RZSppV73nZcM+1lLJl
 vRTJDJd9KQx3PmuCfv5q8UBXR2NnKNJAj9RKKOzX51bvBKunRUfgmwkHtl588TiVSe+Gbh
 77EybsnORTicFjYR3lYYTVR/+YOk5VU=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-zCS3kAfVNUGKEopAT60ucA-1; Wed, 19 Jan 2022 15:13:57 -0500
X-MC-Unique: zCS3kAfVNUGKEopAT60ucA-1
Received: by mail-oi1-f197.google.com with SMTP id
 w8-20020aca6208000000b002c7da950057so2480601oib.5
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 12:13:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dx6iwoGJaaRX603GZ+c1L/FbhD1HkJ8r69z6JOrz8YI=;
 b=DIsb8PaX2eOEeWY2SLAkWDnWFiJGG+4iap1+Nul3BaEbKCtfc7+xPBkfb4j+fWSrW2
 NnTKmouvnfRZ20PK6IfbTQONFexpcIKKWYzi5o6T2ZCmvH1Gs1qkQkfOITCESRslGDEv
 uvB51Ydad/xobqICkuR0qGlmwZcAMjVxVSgE2dLsJE5Y+r1qAQ5i3LzF73pY3bl8vjpt
 HMapvosHrk4CColKGJ60fhwyQaKTSfdIHHyql/IJ7McLrx028UMRmFgRlBv/Mz3cE2dT
 WNtuzsMaS/vku9gT9T98Weq5E3QAQOUEhSs8+A7A6KiSp/PFnnGTeaMtnln/pmbsmHKt
 1ZRw==
X-Gm-Message-State: AOAM532uE1V+2Z+/N8Dcp1dG+7C7lhP3wMRhmwf1k1HugxTTbsL0TpAl
 MWw8sEB5b9YIu6wUsN04OXf3k7LSJWTyEJA3fWnrEyDflPjIp7ueGk2/l16/BlM7y/3CF70aaNA
 n0+Nu7sziScyeQ9Y=
X-Received: by 2002:aca:1a0e:: with SMTP id a14mr4581894oia.110.1642623237017; 
 Wed, 19 Jan 2022 12:13:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybZQO+Abov1/2XE9QFGkHX4apJ4HocptE6fzYESOqvVybGeBz7MtLTvutMD+aGGXDQYTUR4Q==
X-Received: by 2002:aca:1a0e:: with SMTP id a14mr4581876oia.110.1642623236825; 
 Wed, 19 Jan 2022 12:13:56 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id i13sm365976otj.13.2022.01.19.12.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 12:13:56 -0800 (PST)
Date: Wed, 19 Jan 2022 13:13:55 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 2/2] hw/vfio/common: Silence ram device offset
 alignment error traces
Message-ID: <20220119131355.47bafabd.alex.williamson@redhat.com>
In-Reply-To: <20220118153306.282681-3-eric.auger@redhat.com>
References: <20220118153306.282681-1-eric.auger@redhat.com>
 <20220118153306.282681-3-eric.auger@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: cohuck@redhat.com, stefanb@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 Jan 2022 16:33:06 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> Failing to DMA MAP a ram_device should not cause an error message.
> This is currently happening with the TPM CRB command region and
> this is causing confusion.
> 
> We may want to keep the trace for debug purpose though.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  hw/vfio/common.c     | 15 ++++++++++++++-
>  hw/vfio/trace-events |  1 +
>  2 files changed, 15 insertions(+), 1 deletion(-)

Thanks!  Looks good to me.

Stefan, I can provide an ack here if you want to send a pull request
for both or likewise I can send a pull request with your ack on the
previous patch.  I suppose the patches themselves are technically
independent if you want to split them.  Whichever you prefer.

Acked-by: Alex Williamson <alex.williamson@redhat.com>

> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 080046e3f5..9caa560b07 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -884,7 +884,20 @@ static void vfio_listener_region_add(MemoryListener *listener,
>      if (unlikely((section->offset_within_address_space &
>                    ~qemu_real_host_page_mask) !=
>                   (section->offset_within_region & ~qemu_real_host_page_mask))) {
> -        error_report("%s received unaligned region", __func__);
> +        if (memory_region_is_ram_device(section->mr)) { /* just debug purpose */
> +            trace_vfio_listener_region_add_bad_offset_alignment(
> +                memory_region_name(section->mr),
> +                section->offset_within_address_space,
> +                section->offset_within_region, qemu_real_host_page_size);
> +        } else { /* error case we don't want to be fatal */
> +            error_report("%s received unaligned region %s iova=0x%"PRIx64
> +                         " offset_within_region=0x%"PRIx64
> +                         " qemu_real_host_page_mask=0x%"PRIx64,
> +                         __func__, memory_region_name(section->mr),
> +                         section->offset_within_address_space,
> +                         section->offset_within_region,
> +                         qemu_real_host_page_mask);
> +        }
>          return;
>      }
>  
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 0ef1b5f4a6..ccd9d7610d 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -100,6 +100,7 @@ vfio_listener_region_add_skip(uint64_t start, uint64_t end) "SKIPPING region_add
>  vfio_spapr_group_attach(int groupfd, int tablefd) "Attached groupfd %d to liobn fd %d"
>  vfio_listener_region_add_iommu(uint64_t start, uint64_t end) "region_add [iommu] 0x%"PRIx64" - 0x%"PRIx64
>  vfio_listener_region_add_ram(uint64_t iova_start, uint64_t iova_end, void *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64" [%p]"
> +vfio_listener_region_add_bad_offset_alignment(const char *name, uint64_t iova, uint64_t offset_within_region, uint64_t page_size) "Region \"%s\" @0x%"PRIx64", offset_within_region=0x%"PRIx64", qemu_real_host_page_mask=0x%"PRIx64 " cannot be mapped for DMA"
>  vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
>  vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
>  vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64


