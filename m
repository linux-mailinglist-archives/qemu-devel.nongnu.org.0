Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DCB68A4A7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 22:30:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO3bz-0007ht-FI; Fri, 03 Feb 2023 16:28:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pO3bx-0007hU-3h
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:28:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pO3bv-0000dV-6v
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:28:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675459720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KQhsMCOyS2Unsi3MVU+lCA1x0CqiAAWETpWTQsaDVDY=;
 b=V0Ztro/+BWbO4RdNtvzuC42/XBD3942sh1GWrnlldbaf6L0xu62lxkWf6t2s9qD9n2nJrj
 jVmIkXlTjVFNz0KvLzsU537e9FUmSG3kEixHvyvYUyHiD1StTgBb1+d6fff6LQfGR6v+He
 KRx1fmAZq3dNhH+neCSQBqvvBMW48qA=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-y2pvkGnwPp-LjXDGBq_ZEw-1; Fri, 03 Feb 2023 16:28:39 -0500
X-MC-Unique: y2pvkGnwPp-LjXDGBq_ZEw-1
Received: by mail-io1-f69.google.com with SMTP id
 d8-20020a6b6e08000000b00722d8d9c432so3715771ioh.19
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 13:28:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KQhsMCOyS2Unsi3MVU+lCA1x0CqiAAWETpWTQsaDVDY=;
 b=n/Q6S1dQjZSipXQDwNpXYqqS4iVsMhG7dBYMyrHI+blM6GSUaetOGblnf3YGqL4pK2
 SV/NgF59UaxS+GVl4yUpPAficeXYgQSQ2d6F4NBRD7+tMu3grEnWPJWT9XYICUrc7rtq
 wkDgODXLlomdz7Avb+TYPOWqhg3cKpFFc7dqb9Gbw+PKTwGC1mkzCesG3SozXA2h2K2P
 JbggvmLpNQItK1bfWAXFiaurBPvE2AM9Il8XAQ6vKed47svpyLVu/7nTfsDZkxkmDosg
 e551ssfLMDSyLLe18GZU477Opj0w7zWKEHcPSzclPZF73rhWlOFGMBA1RPl6YpUj+zcs
 yrbA==
X-Gm-Message-State: AO0yUKWTNGELt/bBqOId8Rsguh7VOJhitfZN9FXvBsUu5MlcFvV1gPyA
 Lc5PDIS0pKxfIQVT56CeaNcfTCQdVD5CpZ0x2M2nlKydDkzZw2tfW114koeohi8jOx2xQOEYlGK
 J8P+xTESDfPoL22U=
X-Received: by 2002:a05:6e02:1bac:b0:311:e8:e82e with SMTP id
 n12-20020a056e021bac00b0031100e8e82emr10216588ili.17.1675459718273; 
 Fri, 03 Feb 2023 13:28:38 -0800 (PST)
X-Google-Smtp-Source: AK7set/518aY/fU9/HKggm2A6PO8hPggVHBlD3YKGu7xVArVi56nzvLc2WF0fqsx61B9Ri4mOi0saA==
X-Received: by 2002:a05:6e02:1bac:b0:311:e8:e82e with SMTP id
 n12-20020a056e021bac00b0031100e8e82emr10216574ili.17.1675459717954; 
 Fri, 03 Feb 2023 13:28:37 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 n8-20020a922608000000b0031119a42b2dsm1047458ile.78.2023.02.03.13.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 13:28:37 -0800 (PST)
Date: Fri, 3 Feb 2023 14:28:36 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Cc: qemu-devel@nongnu.org, clg@redhat.com, philmd@linaro.org
Subject: Re: [PATCH v2 17/23] vfio-user: dma map/unmap operations
Message-ID: <20230203142836.440fb63d.alex.williamson@redhat.com>
In-Reply-To: <1ec25a5832299083fee3c90bd89561f5c1d42ba9.1675228037.git.john.g.johnson@oracle.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
 <1ec25a5832299083fee3c90bd89561f5c1d42ba9.1675228037.git.john.g.johnson@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
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

On Wed,  1 Feb 2023 21:55:53 -0800
John Johnson <john.g.johnson@oracle.com> wrote:

> Add ability to do async operations during memory transactions
> 
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> ---
>  hw/vfio/user-protocol.h       |  32 ++++++
>  include/hw/vfio/vfio-common.h |   4 +-
>  hw/vfio/common.c              |  64 +++++++++---
>  hw/vfio/user.c                | 224 ++++++++++++++++++++++++++++++++++++++++++
>  hw/vfio/trace-events          |   2 +
>  5 files changed, 311 insertions(+), 15 deletions(-)
...
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 6f99907..f04fd20 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
...
> @@ -587,7 +586,8 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
>  
>  /* Called with rcu_read_lock held.  */
>  static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> -                               ram_addr_t *ram_addr, bool *read_only)
> +                               ram_addr_t *ram_addr, bool *read_only,
> +                               MemoryRegion **mrp)
>  {
>      MemoryRegion *mr;
>      hwaddr xlat;
> @@ -668,6 +668,10 @@ static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
>          *read_only = !writable || mr->readonly;
>      }
>  
> +    if (mrp != NULL) {
> +        *mrp = mr;
> +    }
> +
>      return true;
>  }
>  

This needs a rebase, the contents of vfio_get_xlat_addr() were largely
moved to memory_get_xlat_addr() and the context is all wrong now.
Thanks,

Alex

commit baa44bce87fe53ef5c95d39e634b3bace014d235
Author: Cindy Lu <lulu@redhat.com>
Date:   Mon Oct 31 11:10:19 2022 +0800

    vfio: move implement of vfio_get_xlat_addr() to memory.c
    
    - Move the implement vfio_get_xlat_addr to softmmu/memory.c, and
      change the name to memory_get_xlat_addr(). So we can use this
      function on other devices, such as vDPA device.
    - Add a new function vfio_get_xlat_addr in vfio/common.c, and it will check
      whether the memory is backed by a discard manager. then device can
      have its own warning.
    
    Signed-off-by: Cindy Lu <lulu@redhat.com>
    Message-Id: <20221031031020.1405111-2-lulu@redhat.com>
    Acked-by: Alex Williamson <alex.williamson@redhat.com>
    Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
    Signed-off-by: Michael S. Tsirkin <mst@redhat.com>


