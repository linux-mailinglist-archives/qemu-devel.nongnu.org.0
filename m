Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088A069592B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 07:26:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRol5-0002c0-TN; Tue, 14 Feb 2023 01:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pRol3-0002bI-RF
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 01:25:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pRol2-0004sh-9J
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 01:25:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676355939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mAOheiVDR9ru+yHpelyBKcAbzU8vpyppOn7BqAVksgQ=;
 b=WfsiWlvfbnWIRx8Nt51GmnPPwj3OceASgq5tU1/8XTIyaWjf6zPgghT04zV67AJLu7FLPZ
 tRZB4WDHydyp3OzVxOY/9XgLnmKKba7jWKaUDlaZt8P2ZoDksKG9jAghiTr9a7SgyQeckH
 CqM/V7S+s4Eqcbg9+DDm4hdEFhm8WJo=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-KbxLwHdPPXOUQkNn-T7tsw-1; Tue, 14 Feb 2023 01:25:30 -0500
X-MC-Unique: KbxLwHdPPXOUQkNn-T7tsw-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-1618a3467cdso7487727fac.9
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 22:25:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mAOheiVDR9ru+yHpelyBKcAbzU8vpyppOn7BqAVksgQ=;
 b=o23eEu7bRbSFTiuyUKYdElOGLn2qjSH31KZOxkRyzFrv6RLKmXnfQPI3lSQVfMpgG7
 TJgw9J7v/MFU6N70YfKJAoWGtBj3OD9eSJFmYp7/FGzhyBLgAcXWGPXXF82HR0rxiNNY
 I82rN11IzpQbPyDaf1kX7fVS0MBgioL0L5EJ8LrO5mqDu2ciL1Stia4vjsC6Ig65BAYA
 Y0/3RwaCqI0B0vAshFboEwGXdS7mrL4CAwiMEFhLNmRosfvAsIOEYniJvIF5a1PJO/zt
 Cglb3Ync1y+m93QJDig0ATNGoNOKibFD8YAycrg3La7uOIZU/R4OXol7nMlDTIQoIRTg
 7jtg==
X-Gm-Message-State: AO0yUKVudLKK3kYkZNS/uxd1I3Sc5+153ZsTlT3UASiopydQUFFRoyxN
 yds+Pwm4Ra9y7weH1gBnkN37MNaI8mtTF2iXHzYGAvDt/Ts+2PiyY2GXwbxwZvVUGcfVrC7OhBa
 Zrqm0vAM/V9oaTd1Cw0SuTLUmR9ZLRBc=
X-Received: by 2002:aca:705:0:b0:363:a978:6d41 with SMTP id
 5-20020aca0705000000b00363a9786d41mr51103oih.280.1676355929533; 
 Mon, 13 Feb 2023 22:25:29 -0800 (PST)
X-Google-Smtp-Source: AK7set+Eh/Hn801Fb9PjAYnJGmtlwW6k9HYcy7DaWckKwgnLC+NAcT+5G9cfvmPNTFFGQ86xUhdVq+omAklfXzP3KR8=
X-Received: by 2002:aca:705:0:b0:363:a978:6d41 with SMTP id
 5-20020aca0705000000b00363a9786d41mr51096oih.280.1676355929306; Mon, 13 Feb
 2023 22:25:29 -0800 (PST)
MIME-Version: 1.0
References: <20230214034211.683203-1-zhenzhong.duan@intel.com>
In-Reply-To: <20230214034211.683203-1-zhenzhong.duan@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 14 Feb 2023 14:25:18 +0800
Message-ID: <CACGkMEse_BFRaTV0NkvsGD_ptsTzrBGKLBZg59NtSCR_Z-=V1w@mail.gmail.com>
Subject: Re: [PATCH] memory: Optimize replay of guest mapping
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, peterx@redhat.com, 
 pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net, 
 marcel.apfelbaum@gmail.com, david@redhat.com, philmd@linaro.org
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

On Tue, Feb 14, 2023 at 11:43 AM Zhenzhong Duan
<zhenzhong.duan@intel.com> wrote:
>
> On x86, there are two notifiers registered due to vtd-ir memory region
> splitting the whole address space. During replay of the address space
> for each notifier, the whole address space is scanned which is
> unnecessory.
>
> We only need to scan the space belong to notifier montiored space.
>
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
> Tested only on x86 with a net card passed to guest, ping/ssh pass.
>
>  hw/i386/intel_iommu.c | 2 +-
>  softmmu/memory.c      | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 98a5c304a7d7..6b1de80e8573 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -3831,7 +3831,7 @@ static void vtd_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
>                  .domain_id = vtd_get_domain_id(s, &ce, vtd_as->pasid),
>              };
>
> -            vtd_page_walk(s, &ce, 0, ~0ULL, &info, vtd_as->pasid);
> +            vtd_page_walk(s, &ce, n->start, n->end, &info, vtd_as->pasid);
>          }
>      } else {
>          trace_vtd_replay_ce_invalid(bus_n, PCI_SLOT(vtd_as->devfn),
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 9d64efca269b..f096716e6e78 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1923,7 +1923,6 @@ uint64_t memory_region_iommu_get_min_page_size(IOMMUMemoryRegion *iommu_mr)
>
>  void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
>  {
> -    MemoryRegion *mr = MEMORY_REGION(iommu_mr);
>      IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
>      hwaddr addr, granularity;
>      IOMMUTLBEntry iotlb;
> @@ -1936,7 +1935,7 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
>
>      granularity = memory_region_iommu_get_min_page_size(iommu_mr);
>
> -    for (addr = 0; addr < memory_region_size(mr); addr += granularity) {
> +    for (addr = n->start; addr < n->end; addr += granularity) {

Is [n->start, n->end] guaranteed to be the subset of memory_region_size(mr)?

Thanks

>          iotlb = imrc->translate(iommu_mr, addr, IOMMU_NONE, n->iommu_idx);
>          if (iotlb.perm != IOMMU_NONE) {
>              n->notify(n, &iotlb);
> --
> 2.25.1
>
>


