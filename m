Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC350423E68
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 15:06:52 +0200 (CEST)
Received: from localhost ([::1]:52618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY6dI-0000oj-0q
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 09:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mY6as-000733-Dy
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 09:04:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mY6aq-0006EZ-LU
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 09:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633525460;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B9HnXuE02AWOMpgbvkN6gXtebkmF8deZmDQ05Gf/mlQ=;
 b=Qo9oAnNGsnRurQxOf6U3Rb273WnRt64JbgjEuwWbp6GF0PBYo3xHj/YVNjJV8afkutGaP7
 oA1v0EDgIP/EnSD1f8tIVrISfsJ+oLYqSkHZhsiTGQnm7ry90pS1idWBn+QiE1/3NiDCyC
 UsL+EMdSXU7Ecb9iQlxJaAwgWYYH8pk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-MCj39GPcNe2M5Lni8FNBSA-1; Wed, 06 Oct 2021 09:04:19 -0400
X-MC-Unique: MCj39GPcNe2M5Lni8FNBSA-1
Received: by mail-wr1-f72.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso1985454wrc.2
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 06:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=B9HnXuE02AWOMpgbvkN6gXtebkmF8deZmDQ05Gf/mlQ=;
 b=1YAS7CXrgXBof+yricO6dzVd9I5+UHa/TCOaHTpfefOdTldMRB888JDy2eOluYZT1L
 4mIYXLcODxtWOi+j2VDGQnfaTf/A3g+4Xsr6tkOiLhfQVDAL1MYsbO76JGa8BoX8BONk
 7yosi9ws/ODFkpemXnTebSoQkuEJuD8pruRVL49ffN9kq4ge1+9bfUBUqYR31lHjcaaO
 92Wj4lD8qerVfDH1+qKysNp4RI95xrjQdXMGbHYikPAEhSiCxG6xxQSGbjOuJlV6NF2b
 TgVB/MVxf1HR0LAIVKi5qPrp3MEezQB8aHOkenmDWT4TNTDYN9R9x7L3RU5kY5UxJXjp
 hEGg==
X-Gm-Message-State: AOAM5325KAHY5lXd4f289NbaKmDVSk+m5q9z2mHOgUEhO/+RQrZwSciD
 pCyhVyxHulZJU/eoc9HWZGiCwj5WyAuOEMbIBKHbbfOonnZzOvvWutIhn9V35xd7O8t5Gxj9CEo
 Zi5V02DcUm2WEPfQ=
X-Received: by 2002:a7b:cf24:: with SMTP id m4mr9772341wmg.133.1633525457862; 
 Wed, 06 Oct 2021 06:04:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhPoiBK5ldACDaVfC8ERStD/3k/I6xiEnGdTg++ywUvHbMExAQ4i5iQQFy4oZj+5sRwQasPA==
X-Received: by 2002:a7b:cf24:: with SMTP id m4mr9772298wmg.133.1633525457580; 
 Wed, 06 Oct 2021 06:04:17 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id y11sm25123303wrg.18.2021.10.06.06.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 06:04:17 -0700 (PDT)
Subject: Re: [PATCH 2/3] virtio-iommu: Default to bypass during boot
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210930185050.262759-1-jean-philippe@linaro.org>
 <20210930185050.262759-3-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <8fc7acc5-2ce5-293a-0db3-40ff52b91803@redhat.com>
Date: Wed, 6 Oct 2021 15:04:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210930185050.262759-3-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.05, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.964,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi jean,

On 9/30/21 8:50 PM, Jean-Philippe Brucker wrote:
> Currently the virtio-iommu device must be programmed before it allows
> DMA from any PCI device. This can make the VM entirely unusable when a
> virtio-iommu driver isn't present, for example in a bootloader that
> loads the OS from storage.
>
> Similarly to the other vIOMMU implementations, default to DMA bypassing
> the IOMMU during boot. Add a "boot-bypass" option that lets users change
> this behavior.
s/option/property
set to true by default.

Also mention this deprecates the legacy VIRTIO_IOMMU_F_BYPASS feature
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  include/hw/virtio/virtio-iommu.h |  1 +
>  hw/virtio/virtio-iommu.c         | 28 +++++++++++++++++++++++-----
>  hw/virtio/trace-events           |  4 ++--
>  3 files changed, 26 insertions(+), 7 deletions(-)
>
> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
> index 273e35c04b..4c66989ca4 100644
> --- a/include/hw/virtio/virtio-iommu.h
> +++ b/include/hw/virtio/virtio-iommu.h
> @@ -58,6 +58,7 @@ struct VirtIOIOMMU {
>      GTree *domains;
>      QemuMutex mutex;
>      GTree *endpoints;
> +    bool boot_bypass;
>  };
>  
>  #endif
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 1b23e8e18c..82edeaa101 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -728,8 +728,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>          .perm = IOMMU_NONE,
>      };
>  
> -    bypass_allowed = virtio_vdev_has_feature(&s->parent_obj,
> -                                             VIRTIO_IOMMU_F_BYPASS);
> +    bypass_allowed = s->config.bypass;
>  
>      sid = virtio_iommu_get_bdf(sdev);
>  
> @@ -828,7 +827,8 @@ static void virtio_iommu_get_config(VirtIODevice *vdev, uint8_t *config_data)
>                                    config->input_range.start,
>                                    config->input_range.end,
>                                    config->domain_range.end,
> -                                  config->probe_size);
> +                                  config->probe_size,
> +                                  config->bypass);
>      memcpy(config_data, &dev->config, sizeof(struct virtio_iommu_config));
>  }
>  
> @@ -836,13 +836,29 @@ static void virtio_iommu_set_config(VirtIODevice *vdev,
>                                        const uint8_t *config_data)
>  {
>      struct virtio_iommu_config config;
> +    VirtIOIOMMU *dev = VIRTIO_IOMMU(vdev);
>  
>      memcpy(&config, config_data, sizeof(struct virtio_iommu_config));
> +
> +    if (config.bypass != dev->config.bypass) {
> +        if (!virtio_vdev_has_feature(vdev, VIRTIO_IOMMU_F_BYPASS_CONFIG)) {
> +            virtio_error(vdev, "cannot set config.bypass");
> +            return;
> +        }
> +        if (config.bypass != 0 && config.bypass != 1) {
> +            warn_report("invalid config.bypass value '%d'", config.bypass);
> +            dev->config.bypass = 0;
Shouldn't we leave the old value instead. The spec proposal says it
takes 0 though.
> +            return;
> +        }
> +        dev->config.bypass = config.bypass;
> +    }
> +
>      trace_virtio_iommu_set_config(config.page_size_mask,
>                                    config.input_range.start,
>                                    config.input_range.end,
>                                    config.domain_range.end,
> -                                  config.probe_size);
> +                                  config.probe_size,
> +                                  config.bypass);
>  }
>  
>  static uint64_t virtio_iommu_get_features(VirtIODevice *vdev, uint64_t f,
> @@ -986,6 +1002,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>      s->config.input_range.end = -1UL;
>      s->config.domain_range.end = 32;
>      s->config.probe_size = VIOMMU_PROBE_SIZE;
> +    s->config.bypass = s->boot_bypass;
>  
>      virtio_add_feature(&s->features, VIRTIO_RING_F_EVENT_IDX);
>      virtio_add_feature(&s->features, VIRTIO_RING_F_INDIRECT_DESC);
> @@ -993,9 +1010,9 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_INPUT_RANGE);
>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_DOMAIN_RANGE);
>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MAP_UNMAP);
> -    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS);
>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MMIO);
>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_PROBE);
> +    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS_CONFIG);
>  
>      qemu_mutex_init(&s->mutex);
>  
> @@ -1169,6 +1186,7 @@ static const VMStateDescription vmstate_virtio_iommu = {
>  
>  static Property virtio_iommu_properties[] = {
>      DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus, "PCI", PCIBus *),
> +    DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 8ed19e9d0c..6bc3821ba3 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -90,8 +90,8 @@ virtio_mmio_setting_irq(int level) "virtio_mmio setting IRQ %d"
>  virtio_iommu_device_reset(void) "reset!"
>  virtio_iommu_get_features(uint64_t features) "device supports features=0x%"PRIx64
>  virtio_iommu_device_status(uint8_t status) "driver status = %d"
> -virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_range, uint32_t probe_size) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" domain_range=%d probe_size=0x%x"
> -virtio_iommu_set_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_range, uint32_t probe_size) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" domain_bits=%d probe_size=0x%x"
> +virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_range, uint32_t probe_size, uint8_t bypass) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" domain_range=%d probe_size=0x%x bypass=0x%x"
> +virtio_iommu_set_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_range, uint32_t probe_size, uint8_t bypass) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" domain_bits=%d probe_size=0x%x bypass=0x%x"
>  virtio_iommu_attach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
>  virtio_iommu_detach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
>  virtio_iommu_map(uint32_t domain_id, uint64_t virt_start, uint64_t virt_end, uint64_t phys_start, uint32_t flags) "domain=%d virt_start=0x%"PRIx64" virt_end=0x%"PRIx64 " phys_start=0x%"PRIx64" flags=%d"
Thanks

Eric


