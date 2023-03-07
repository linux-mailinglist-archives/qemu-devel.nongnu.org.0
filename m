Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601636AE0B5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 14:37:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZXUh-0008Dg-2p; Tue, 07 Mar 2023 08:36:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZXUb-0008DO-Vb
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:36:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZXUa-0005Is-3g
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:36:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678196195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z6caRF6e4NyIgAAn6fLla0fT3otbzOkBHnyQwqtsT08=;
 b=bYByA+rOuasfe1ERS4iAJek6zAO5IakpDFUQ0z/N0tx6tECiUg9r/FxVvKAT+wyWSEIEof
 FYqyfQoZE+TUoHHzOvj4+GO00RL5CWLMsqwg08mzPZE9h8XkJBwjTbqi6dvLN1yZdkSp0q
 qvYedecaXuVG7IOE551tk/cyMWAVgQI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-STuSgZ9ZPAm4Zq_W0M-gbQ-1; Tue, 07 Mar 2023 08:36:33 -0500
X-MC-Unique: STuSgZ9ZPAm4Zq_W0M-gbQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 4-20020a05600c024400b003eb2e295c05so4827412wmj.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 05:36:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678196192;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z6caRF6e4NyIgAAn6fLla0fT3otbzOkBHnyQwqtsT08=;
 b=wh03kkEcvfxwpL41yUxD4e7coDXu1QLtT+Cv2iYnBX8gFLc91w2w0xyeLxEG0G8SBV
 zuZVygTeeP2L5/93sfJGKTDjaZWjWbEkOzxcjeowAwSLoP/XySkIpVAloVzP9B74yS1p
 7PenpcUhEQony4AwFQogZcZkTnYNz5XURytFcq95J0JzRBRvnLxudU/M4P0bgxv1W6p3
 ulBXyRPQ5W3b23lUiPfVoVidNKAlALLvgn+Mhy+pX+9jhEq+37bo2JT2B0m6QVVnYx/8
 nWudPrDRJ2RNtaPaV9mD0cc5Q8vcE0WqDzz8FQLZCFEw4+8UCnCtHtHzg+1pSlUDK/sN
 LEbQ==
X-Gm-Message-State: AO0yUKW6oL6H9WxuK4XPmJ7uDoOYZIiVDEch5+sbqsg2INzawJ1j7p3M
 mr1Q4TES5guuR2fGBaha58RO1Ffad0UKmeSxYp1hbmVXWy2fLX+FP8+5cCLRjm9gtOADYwBLqDg
 Pi6pKbqGWQQfw1uBk3V3yWDc=
X-Received: by 2002:a05:600c:4ecb:b0:3e7:b17f:9af1 with SMTP id
 g11-20020a05600c4ecb00b003e7b17f9af1mr13169220wmq.22.1678196192575; 
 Tue, 07 Mar 2023 05:36:32 -0800 (PST)
X-Google-Smtp-Source: AK7set/xwV6sVCM9c4p/s/VSQAvIFudixLwlptPW+yozhAd4X6qthYJIfHmISdysTjF1e3x2XzovKw==
X-Received: by 2002:a05:600c:4ecb:b0:3e7:b17f:9af1 with SMTP id
 g11-20020a05600c4ecb00b003e7b17f9af1mr13169199wmq.22.1678196192299; 
 Tue, 07 Mar 2023 05:36:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a5d50c2000000b002c704271b05sm12450244wrt.66.2023.03.07.05.36.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 05:36:31 -0800 (PST)
Message-ID: <c419c84d-12fc-fff0-3af9-04582860b89b@redhat.com>
Date: Tue, 7 Mar 2023 14:36:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 09/15] vfio/common: Record DMA mapped IOVA ranges
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
References: <20230307125450.62409-1-joao.m.martins@oracle.com>
 <20230307125450.62409-10-joao.m.martins@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230307125450.62409-10-joao.m.martins@oracle.com>
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
> According to the device DMA logging uAPI, IOVA ranges to be logged by
> the device must be provided all at once upon DMA logging start.
> 
> As preparation for the following patches which will add device dirty
> page tracking, keep a record of all DMA mapped IOVA ranges so later they
> can be used for DMA logging start.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>   hw/vfio/common.c     | 85 ++++++++++++++++++++++++++++++++++++++++++++
>   hw/vfio/trace-events |  1 +
>   2 files changed, 86 insertions(+)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 63831eab78a1..811502dbc97c 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -1325,11 +1325,96 @@ static int vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
>       return ret;
>   }
>   
> +typedef struct VFIODirtyRanges {
> +    hwaddr min32;
> +    hwaddr max32;
> +    hwaddr min64;
> +    hwaddr max64;
> +} VFIODirtyRanges;
> +
> +typedef struct VFIODirtyRangesListener {
> +    VFIOContainer *container;
> +    VFIODirtyRanges ranges;

I would have introduced a pointer instead, to avoid the memcpy.

Anyhow, this is minor.

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> +    MemoryListener listener;
> +} VFIODirtyRangesListener;
> +
> +static void vfio_dirty_tracking_update(MemoryListener *listener,
> +                                       MemoryRegionSection *section)
> +{
> +    VFIODirtyRangesListener *dirty = container_of(listener,
> +                                                  VFIODirtyRangesListener,
> +                                                  listener);
> +    VFIODirtyRanges *range = &dirty->ranges;
> +    hwaddr iova, end, *min, *max;
> +
> +    if (!vfio_listener_valid_section(section, "tracking_update") ||
> +        !vfio_get_section_iova_range(dirty->container, section,
> +                                     &iova, &end, NULL)) {
> +        return;
> +    }
> +
> +    /*
> +     * The address space passed to the dirty tracker is reduced to two ranges:
> +     * one for 32-bit DMA ranges, and another one for 64-bit DMA ranges.
> +     * The underlying reports of dirty will query a sub-interval of each of
> +     * these ranges.
> +     *
> +     * The purpose of the dual range handling is to handle known cases of big
> +     * holes in the address space, like the x86 AMD 1T hole. The alternative
> +     * would be an IOVATree but that has a much bigger runtime overhead and
> +     * unnecessary complexity.
> +     */
> +    min = (end <= UINT32_MAX) ? &range->min32 : &range->min64;
> +    max = (end <= UINT32_MAX) ? &range->max32 : &range->max64;
> +
> +    if (*min > iova) {
> +        *min = iova;
> +    }
> +    if (*max < end) {
> +        *max = end;
> +    }
> +
> +    trace_vfio_device_dirty_tracking_update(iova, end, *min, *max);
> +    return;
> +}
> +
> +static const MemoryListener vfio_dirty_tracking_listener = {
> +    .name = "vfio-tracking",
> +    .region_add = vfio_dirty_tracking_update,
> +};
> +
> +static void vfio_dirty_tracking_init(VFIOContainer *container,
> +                                     VFIODirtyRanges *ranges)
> +{
> +    VFIODirtyRangesListener dirty;
> +
> +    memset(&dirty, 0, sizeof(dirty));
> +    dirty.ranges.min32 = UINT32_MAX;
> +    dirty.ranges.min64 = UINT64_MAX;
> +    dirty.listener = vfio_dirty_tracking_listener;
> +    dirty.container = container;
> +
> +    memory_listener_register(&dirty.listener,
> +                             container->space->as);
> +
> +    *ranges = dirty.ranges;
> +
> +    /*
> +     * The memory listener is synchronous, and used to calculate the range
> +     * to dirty tracking. Unregister it after we are done as we are not
> +     * interested in any follow-up updates.
> +     */
> +    memory_listener_unregister(&dirty.listener);
> +}
> +
>   static void vfio_listener_log_global_start(MemoryListener *listener)
>   {
>       VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> +    VFIODirtyRanges ranges;
>       int ret;
>   
> +    vfio_dirty_tracking_init(container, &ranges);
> +
>       ret = vfio_set_dirty_page_tracking(container, true);
>       if (ret) {
>           vfio_set_migration_error(ret);
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 7173e6a5c721..dd9fd7b9bddb 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -103,6 +103,7 @@ vfio_listener_region_add_ram(uint64_t iova_start, uint64_t iova_end, void *vaddr
>   vfio_known_safe_misalignment(const char *name, uint64_t iova, uint64_t offset_within_region, uintptr_t page_size) "Region \"%s\" iova=0x%"PRIx64" offset_within_region=0x%"PRIx64" qemu_real_host_page_size=0x%"PRIxPTR
>   vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
>   vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
> +vfio_device_dirty_tracking_update(uint64_t start, uint64_t end, uint64_t min, uint64_t max) "section 0x%"PRIx64" - 0x%"PRIx64" -> update [0x%"PRIx64" - 0x%"PRIx64"]"
>   vfio_disconnect_container(int fd) "close container->fd=%d"
>   vfio_put_group(int fd) "close group->fd=%d"
>   vfio_get_device(const char * name, unsigned int flags, unsigned int num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"


