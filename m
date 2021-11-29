Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC96461FF5
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 20:14:09 +0100 (CET)
Received: from localhost ([::1]:34036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrm6K-00061U-PN
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 14:14:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mrm3a-0003oZ-EZ
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 14:11:18 -0500
Received: from [2a00:1450:4864:20::42d] (port=42637
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mrm3Y-0000bz-Ms
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 14:11:18 -0500
Received: by mail-wr1-x42d.google.com with SMTP id c4so39047170wrd.9
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 11:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pJ9b+4aPl6Iv7XWLbFd1twXTk5kMDZBC5zXPPrAQmkA=;
 b=zOs7gN8WOmMfjZyhbnjlhSMC+Jhw1HEQd+YwjwzPFFlvdI+DKBTz51OGUpdIQDxtSy
 zUGpIV7fMn0+uSFOONKmIgDAbahIufZFIg78KLBGS7UcfCupew/B1+cWD04zr13Af6rq
 qZ3R2kDS/IA2Racc3oejvyu/sRHeTaUaKbeOUCFcCgxUdVzSK81wcH6/Y4wvYCOd8iXY
 KuNEr4rcXjRfV+DQ6pv0rfZZobDq2LXwxT5dqcRYSKKSjiaLxWzaGEKzx/NOF+gimUiw
 nBkLQLd/QH9W9ZZD81GPUh2/bL2ZnTBPjKbcs/0l4RLHlNNxCPvN/R/yYC3IimFoyApR
 Z4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pJ9b+4aPl6Iv7XWLbFd1twXTk5kMDZBC5zXPPrAQmkA=;
 b=j7kf3KmoZwIRKGXcGAGc8x/O77HrvnJBhNZj4jkyP+0CQ77nW/qN6txp82kbz2MXbE
 vjjDR84jfmKZxvQ4j0xqE2ZN3Ym7Sp+j+NACNe0Jky+s4nsst2S6kJa7uKXb5E8k7+VP
 5zs+RNgGsTTC115yAsxzLueVEnCSmqGjBQHTdysCOAdzU6me3UxFL/db8Peyo+U8Um2Q
 rJzCmHc+JeAg0qOPg1DoukJH9nc03DwkwKQkuAYxKEozVej6UW24a/MbUL09sCOEKoEO
 pZWll3rliRV1BTf5wdA6Hq/c+knsyyFK3UQR56W/nT84/z9tXfQ4GBf3qleJPDSpO20G
 V2SQ==
X-Gm-Message-State: AOAM531QhV/8n2/wUfEYKYbHBkw+S90/LmjU1Y88djnLATpMzkrQQzap
 KynmDwtYfm7FqmBzBKOFM8M0ow==
X-Google-Smtp-Source: ABdhPJym/kUfHaCrF2a+vyHMwYZS2/XRB0+pa7gfCB0nOSoIdrN8rSKQeB/diLm3Zy1wj91mRXHRpQ==
X-Received: by 2002:a5d:59aa:: with SMTP id p10mr35892431wrr.210.1638213075192; 
 Mon, 29 Nov 2021 11:11:15 -0800 (PST)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id m9sm200357wmq.1.2021.11.29.11.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 11:11:14 -0800 (PST)
Date: Mon, 29 Nov 2021 19:10:52 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v6 2/4] virtio-iommu: Fix endianness in get_config
Message-ID: <YaUlvHiWSj3nEno5@myrica>
References: <20211127072910.1261824-1-eric.auger@redhat.com>
 <20211127072910.1261824-3-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211127072910.1261824-3-eric.auger@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lvivier@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Nov 27, 2021 at 08:29:08AM +0100, Eric Auger wrote:
> Endianess is not properly handled when populating
> the returned config. Use the cpu_to_le* primitives
> for each separate field. Also, while at it, trace
> the domain range start.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  hw/virtio/trace-events   |  2 +-
>  hw/virtio/virtio-iommu.c | 22 +++++++++++++++-------
>  2 files changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 54bd7da00c8..f7ad6be5fbb 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -91,7 +91,7 @@ virtio_mmio_setting_irq(int level) "virtio_mmio setting IRQ %d"
>  virtio_iommu_device_reset(void) "reset!"
>  virtio_iommu_get_features(uint64_t features) "device supports features=0x%"PRIx64
>  virtio_iommu_device_status(uint8_t status) "driver status = %d"
> -virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_range, uint32_t probe_size) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" domain_range=%d probe_size=0x%x"
> +virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_start, uint32_t domain_end, uint32_t probe_size) "page_size_mask=0x%"PRIx64" input range start=0x%"PRIx64" input range end=0x%"PRIx64" domain range start=%d domain range end=%d probe_size=0x%x"
>  virtio_iommu_attach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
>  virtio_iommu_detach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
>  virtio_iommu_map(uint32_t domain_id, uint64_t virt_start, uint64_t virt_end, uint64_t phys_start, uint32_t flags) "domain=%d virt_start=0x%"PRIx64" virt_end=0x%"PRIx64 " phys_start=0x%"PRIx64" flags=%d"
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 645c0aa3997..30ee09187b8 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -822,14 +822,22 @@ unlock:
>  static void virtio_iommu_get_config(VirtIODevice *vdev, uint8_t *config_data)
>  {
>      VirtIOIOMMU *dev = VIRTIO_IOMMU(vdev);
> -    struct virtio_iommu_config *config = &dev->config;
> +    struct virtio_iommu_config *dev_config = &dev->config;
> +    struct virtio_iommu_config *out_config = (void *)config_data;
>  
> -    trace_virtio_iommu_get_config(config->page_size_mask,
> -                                  config->input_range.start,
> -                                  config->input_range.end,
> -                                  config->domain_range.end,
> -                                  config->probe_size);
> -    memcpy(config_data, &dev->config, sizeof(struct virtio_iommu_config));
> +    out_config->page_size_mask = cpu_to_le64(dev_config->page_size_mask);
> +    out_config->input_range.start = cpu_to_le64(dev_config->input_range.start);
> +    out_config->input_range.end = cpu_to_le64(dev_config->input_range.end);
> +    out_config->domain_range.start = cpu_to_le32(dev_config->domain_range.start);
> +    out_config->domain_range.end = cpu_to_le32(dev_config->domain_range.end);
> +    out_config->probe_size = cpu_to_le32(dev_config->probe_size);
> +
> +    trace_virtio_iommu_get_config(dev_config->page_size_mask,
> +                                  dev_config->input_range.start,
> +                                  dev_config->input_range.end,
> +                                  dev_config->domain_range.start,
> +                                  dev_config->domain_range.end,
> +                                  dev_config->probe_size);
>  }
>  
>  static uint64_t virtio_iommu_get_features(VirtIODevice *vdev, uint64_t f,
> -- 
> 2.26.3
> 

