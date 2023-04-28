Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDEB6F11A1
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 08:10:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psHIO-0000bH-3M; Fri, 28 Apr 2023 02:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psHIL-0000at-JU
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 02:09:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psHIJ-00062h-76
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 02:09:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682662162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZjbZxE4rO12xm7v+m3qDdMiuNYSjwbiWUbqg7xa+qVI=;
 b=TsNpYNsQLCzsCN43Btndi07Phj74y6r1VQ2iT8P6MDwFmtqdM1lUHHN6W18VxzrshoJ9xU
 pXVCl3DEbowKBprS9nrdAzpVw0L3mR07zgVgAMRpb2CrK8oUh3EWveOG2iCTKh1mW38SE6
 PctgE5LGTtefx5QI8RIaDPB+9mbXggk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-ih7snIKyNw-Z56sJU8ZaYw-1; Fri, 28 Apr 2023 02:09:20 -0400
X-MC-Unique: ih7snIKyNw-Z56sJU8ZaYw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f1745d08b5so36270125e9.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 23:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682662159; x=1685254159;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZjbZxE4rO12xm7v+m3qDdMiuNYSjwbiWUbqg7xa+qVI=;
 b=mB0DriyGdxzQDufJxB/TdD81aHVUEe+bcCkG45JldDJrAMsRgAdyuLS6Dxcr1gPedc
 9gHukluDipqc+Nvac5haWoNF5+uMS1YWsidRgyIby+73nT3MD3VGqWZZO7zeN1H4prhX
 1W/vF4X1IzmpTf9pdTjpqAUaa2hGgsXPa/nKECXPfzffT0Jx6Nxx1x5CUY+YQGlpZ8bM
 AZbzBJIyinkHXafWLprrONtOuPxS5jD4f2a/zZJc25C4aVmGqcXCbXyO0+jz+QjhLmX8
 2U1hdCCB0joFbRkGpg4m/YHXNaSqx+9vcN2HaLsEVMn3p2dqYmswdKmqilZJZWpTM8VG
 NRtQ==
X-Gm-Message-State: AC+VfDwkOJAOfnBHqWRmLmtz2bHx1cDxYtaQhGhnLHBAjkFWXA+bMp39
 BrkKs+RmkXvnKv4k3KdXLlM+RPys6TM9FKtebd5x+2Q/7MHxD2wSmkdl9pGIpKhiOXpeC/pdntO
 Cvb5xPkzsuVRqnX8=
X-Received: by 2002:a5d:4a0a:0:b0:301:8551:446f with SMTP id
 m10-20020a5d4a0a000000b003018551446fmr3166290wrq.38.1682662159630; 
 Thu, 27 Apr 2023 23:09:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5uKQPc2/J6yuMou5PXAUnRiLcaU2cGn304rS/fSrFrYUXCzm1xeM9pzZPGSQkSkJ9/noiGbA==
X-Received: by 2002:a5d:4a0a:0:b0:301:8551:446f with SMTP id
 m10-20020a5d4a0a000000b003018551446fmr3166266wrq.38.1682662159353; 
 Thu, 27 Apr 2023 23:09:19 -0700 (PDT)
Received: from [192.168.8.102] (tmo-098-235.customers.d1-online.com.
 [80.187.98.235]) by smtp.gmail.com with ESMTPSA id
 e16-20020a5d5950000000b0030490c8ccafsm8207476wri.52.2023.04.27.23.09.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 23:09:18 -0700 (PDT)
Message-ID: <2c193be7-542f-ed4c-8a80-ff8b0de186cb@redhat.com>
Date: Fri, 28 Apr 2023 08:09:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v10 1/8] memory: prevent dma-reentracy issues
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>
References: <20230427211013.2994127-1-alxndr@bu.edu>
 <20230427211013.2994127-2-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230427211013.2994127-2-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/04/2023 23.10, Alexander Bulekov wrote:
> Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
> This flag is set/checked prior to calling a device's MemoryRegion
> handlers, and set when device code initiates DMA.  The purpose of this
> flag is to prevent two types of DMA-based reentrancy issues:
> 
> 1.) mmio -> dma -> mmio case
> 2.) bh -> dma write -> mmio case
> 
> These issues have led to problems such as stack-exhaustion and
> use-after-frees.
> 
> Summary of the problem from Peter Maydell:
> https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1282
> Resolves: CVE-2023-0330
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>   include/exec/memory.h  |  5 +++++
>   include/hw/qdev-core.h |  7 +++++++
>   softmmu/memory.c       | 16 ++++++++++++++++
>   3 files changed, 28 insertions(+)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 15ade918ba..e45ce6061f 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -767,6 +767,8 @@ struct MemoryRegion {
>       bool is_iommu;
>       RAMBlock *ram_block;
>       Object *owner;
> +    /* owner as TYPE_DEVICE. Used for re-entrancy checks in MR access hotpath */
> +    DeviceState *dev;
>   
>       const MemoryRegionOps *ops;
>       void *opaque;
> @@ -791,6 +793,9 @@ struct MemoryRegion {
>       unsigned ioeventfd_nb;
>       MemoryRegionIoeventfd *ioeventfds;
>       RamDiscardManager *rdm; /* Only for RAM */
> +
> +    /* For devices designed to perform re-entrant IO into their own IO MRs */
> +    bool disable_reentrancy_guard;
>   };
>   
>   struct IOMMUMemoryRegion {
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index bd50ad5ee1..7623703943 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -162,6 +162,10 @@ struct NamedClockList {
>       QLIST_ENTRY(NamedClockList) node;
>   };
>   
> +typedef struct {
> +    bool engaged_in_io;
> +} MemReentrancyGuard;
> +
>   /**
>    * DeviceState:
>    * @realized: Indicates whether the device has been fully constructed.
> @@ -194,6 +198,9 @@ struct DeviceState {
>       int alias_required_for_version;
>       ResettableState reset;
>       GSList *unplug_blockers;
> +
> +    /* Is the device currently in mmio/pio/dma? Used to prevent re-entrancy */
> +    MemReentrancyGuard mem_reentrancy_guard;
>   };
>   
>   struct DeviceListener {
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index b1a6cae6f5..fe23f0e5ce 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -542,6 +542,18 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>           access_size_max = 4;
>       }
>   
> +    /* Do not allow more than one simultaneous access to a device's IO Regions */
> +    if (mr->dev && !mr->disable_reentrancy_guard &&
> +        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
> +        if (mr->dev->mem_reentrancy_guard.engaged_in_io) {
> +            warn_report("Blocked re-entrant IO on "
> +                    "MemoryRegion: %s at addr: 0x%" HWADDR_PRIX,
> +                    memory_region_name(mr), addr);

Ack, a warn_report make sense here, at least initially, to make sure that 
people get aware of related problems!

  Thomas



