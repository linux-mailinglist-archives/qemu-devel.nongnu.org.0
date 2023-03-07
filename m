Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526866AE078
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 14:27:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZXLa-0003d7-1X; Tue, 07 Mar 2023 08:27:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZXLY-0003cx-3l
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:27:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZXLW-00039b-HY
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:27:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678195633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6FxhsYmCihwGx2mcknYU1JyxzHadOgp99jDW/rqGw8A=;
 b=a05AXUjiBkM5tXxd5hGSDAp4GFkp2l3QuSWrCE2g1K3JCX9RI41uSbS/bsyrpKjDgckR8U
 yL/VdaJHK/pPtla8b/JJhfnx3/MRYZGMnltXTFho64oMMZen6gkh1iZ8W0zb/GezqrziOq
 yX+oaRY0LT8nnwTlR7zi/TzGewS0vIY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-uanmye7BMym0qAdnt-IavQ-1; Tue, 07 Mar 2023 08:27:12 -0500
X-MC-Unique: uanmye7BMym0qAdnt-IavQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 8-20020a370508000000b00724fd33cb3eso7356660qkf.14
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 05:27:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678195631;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6FxhsYmCihwGx2mcknYU1JyxzHadOgp99jDW/rqGw8A=;
 b=Lv/yUfcTBl/jeVstTX/fOp5BUAoqzcKJWZwMRYguI+8Zb4sWnr60KHd5AeSKrU4NQ2
 Lrybo4ESAhgTqKlccM+kDlnVG621C2j2J/fXganExNHG4jLM6YQHrqHWoH1c9BftYUAX
 ZhYR2m1UHfA2GPOvSM5bAEPkxlrcsyeY8mQYmFZyNwHG4MEImNwK032Qy7IJDzNhHzEX
 bgQnSF5rrSJursLsBQdpxH1gQler7bqpNJdJn0rnVf8nTNgEvttwnaXx9z1EctmqEDr/
 pQNi2az44rk0uI5eQfZjlvsQkcEHgBqEYoL/EXC1sjTEOOJnHnKYeImdfYgCAak3/ZsC
 0Ueg==
X-Gm-Message-State: AO0yUKUYmFDGNx1k9x0eqM0sOw/OhAgW8NFZFnXCQ+UlJihNvpAt2OgK
 /l2wP/JdlV6DkCQqgawAAaS8O62db/EkooVNqqRf13huZFjW0WiRqYfzZLBmLwzeslkLTLJ37xR
 nfAZXLP27APgM6cw=
X-Received: by 2002:a05:622a:54f:b0:3b8:6c68:e6d with SMTP id
 m15-20020a05622a054f00b003b86c680e6dmr22349474qtx.13.1678195631782; 
 Tue, 07 Mar 2023 05:27:11 -0800 (PST)
X-Google-Smtp-Source: AK7set+cKOYsu+9SYIuqohnizoBXgXUkogK4NfflwxRCEivejo2eHFtZ7TMJz2Vq+5Ylx6I+6uPhyw==
X-Received: by 2002:a05:622a:54f:b0:3b8:6c68:e6d with SMTP id
 m15-20020a05622a054f00b003b86c680e6dmr22349451qtx.13.1678195631531; 
 Tue, 07 Mar 2023 05:27:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 j10-20020ac8440a000000b003b82a07c4d6sm9447103qtn.84.2023.03.07.05.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 05:27:11 -0800 (PST)
Message-ID: <eeb850c5-8da2-d1c2-65ea-13050051ff4f@redhat.com>
Date: Tue, 7 Mar 2023 14:27:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 06/15] vfio/common: Use a single tracepoint for skipped
 sections
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
References: <20230307125450.62409-1-joao.m.martins@oracle.com>
 <20230307125450.62409-7-joao.m.martins@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230307125450.62409-7-joao.m.martins@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/7/23 13:54, Joao Martins wrote:
> In preparation to turn more of the memory listener checks into
> common functions, one of the affected places is how we trace when
> sections are skipped. Right now there is one for each. Change it
> into one single tracepoint `vfio_listener_region_skip` which receives
> a name which refers to the callback i.e. region_add and region_del.
> 
> Suggested-by: Avihai Horon <avihaih@nvidia.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.

> ---
>   hw/vfio/common.c     | 4 ++--
>   hw/vfio/trace-events | 3 +--
>   2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 99acb998eb14..1cb62efa9743 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -945,7 +945,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
>       Error *err = NULL;
>   
>       if (vfio_listener_skipped_section(section)) {
> -        trace_vfio_listener_region_add_skip(
> +        trace_vfio_listener_region_skip("region_add",
>                   section->offset_within_address_space,
>                   section->offset_within_address_space +
>                   int128_get64(int128_sub(section->size, int128_one())));
> @@ -1183,7 +1183,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
>       bool try_unmap = true;
>   
>       if (vfio_listener_skipped_section(section)) {
> -        trace_vfio_listener_region_del_skip(
> +        trace_vfio_listener_region_skip("region_del",
>                   section->offset_within_address_space,
>                   section->offset_within_address_space +
>                   int128_get64(int128_sub(section->size, int128_one())));
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 669d9fe07cd9..7173e6a5c721 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -96,13 +96,12 @@ vfio_pci_igd_lpc_bridge_enabled(const char *name) "%s"
>   vfio_region_write(const char *name, int index, uint64_t addr, uint64_t data, unsigned size) " (%s:region%d+0x%"PRIx64", 0x%"PRIx64 ", %d)"
>   vfio_region_read(char *name, int index, uint64_t addr, unsigned size, uint64_t data) " (%s:region%d+0x%"PRIx64", %d) = 0x%"PRIx64
>   vfio_iommu_map_notify(const char *op, uint64_t iova_start, uint64_t iova_end) "iommu %s @ 0x%"PRIx64" - 0x%"PRIx64
> -vfio_listener_region_add_skip(uint64_t start, uint64_t end) "SKIPPING region_add 0x%"PRIx64" - 0x%"PRIx64
> +vfio_listener_region_skip(const char *name, uint64_t start, uint64_t end) "SKIPPING %s 0x%"PRIx64" - 0x%"PRIx64
>   vfio_spapr_group_attach(int groupfd, int tablefd) "Attached groupfd %d to liobn fd %d"
>   vfio_listener_region_add_iommu(uint64_t start, uint64_t end) "region_add [iommu] 0x%"PRIx64" - 0x%"PRIx64
>   vfio_listener_region_add_ram(uint64_t iova_start, uint64_t iova_end, void *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64" [%p]"
>   vfio_known_safe_misalignment(const char *name, uint64_t iova, uint64_t offset_within_region, uintptr_t page_size) "Region \"%s\" iova=0x%"PRIx64" offset_within_region=0x%"PRIx64" qemu_real_host_page_size=0x%"PRIxPTR
>   vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
> -vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
>   vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
>   vfio_disconnect_container(int fd) "close container->fd=%d"
>   vfio_put_group(int fd) "close group->fd=%d"


