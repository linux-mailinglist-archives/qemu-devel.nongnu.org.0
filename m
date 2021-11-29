Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EFF461FE0
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 20:06:52 +0100 (CET)
Received: from localhost ([::1]:54680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrlzH-0000hE-42
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 14:06:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mrlx9-0007V0-48
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 14:04:39 -0500
Received: from [2a00:1450:4864:20::436] (port=45693
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mrlx4-00087H-0i
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 14:04:38 -0500
Received: by mail-wr1-x436.google.com with SMTP id o13so38922858wrs.12
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 11:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uUluT2JOvEPt2cRmSmpNXjbuo27s9L40V//c+pgYyGY=;
 b=LVb7sr6GTImDiHe616x9Cq/t2fEXFM4NK7C8IkH2E56hXa313Wc3mZO02Keaq57cep
 BF0eEQZ5UJgOKesqG4HggKVOY/QyFBjDMyUE7TEfQzwG+Fq/uoN7pMRsW25I8PmXDWO1
 m/AFY3GhGZNtlJFmOV06A4B1tQmHxmYxLABbCSPOulQN/5sTIuzeemevhcsPaVt5/tCh
 njj01QKM30aIclJNTEvx9Q0LqpiFTCJxYNBo4VHAo7BnVMZuMZK42e8NL8O/S8AIGe5W
 5LZwMMhez/DYW1eLI8nfRg2xT7T0UurNdOz3h1V75w9yoXfvM/dd39X/CfGKmKNTKUkb
 G+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uUluT2JOvEPt2cRmSmpNXjbuo27s9L40V//c+pgYyGY=;
 b=LUKz9dIz7Awfd0ezWNES3Dag2trfTl2026TJ4aeu264CB+pUbNRtSlYDn8hYxDN2MB
 jVUgy+7C/JkNiDBxdXwYO+GVrpm3jnVpRbxiie1u9Ubhr9SzatawBmd/aFeGIlp37P+L
 Sikfb6atLSv7iokSuTRKPPCXNHkvOy2/PO5JKAqvFb5qiZZmamjm3ej33T9w+ds1Fei2
 Zl8qyIeEqnNW9tizTkOyjCueC3F+JAa3ob9U8cEt/LP5OVIH9yYFs7q5ktgL+58d00EB
 +qOayJkypHAqTWNfr1BS23P7EfDPUy8YIWHz/kh4hHnQsm4/+6MriWyeiEUoYROG3mEk
 j7IA==
X-Gm-Message-State: AOAM532KBgWI3V2XPLmRBvCeWDarJDgOBgLax6CeR7eFtqA3BtBkG1DT
 kyCfuH4TJyqGPqO/kdQ8IKMdLQ==
X-Google-Smtp-Source: ABdhPJyg4xBL842zyrnibXMQ3g+cLGHHFD451anZYsx+E7IeXnKAx9M7+ND6NgfbcA6TcNGnycEh/g==
X-Received: by 2002:a5d:6481:: with SMTP id o1mr37251097wri.305.1638212664489; 
 Mon, 29 Nov 2021 11:04:24 -0800 (PST)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id z5sm199951wmp.26.2021.11.29.11.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 11:04:24 -0800 (PST)
Date: Mon, 29 Nov 2021 19:04:01 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v6 1/4] virtio-iommu: Remove set_config callback
Message-ID: <YaUkIV4DleMtTDu3@myrica>
References: <20211127072910.1261824-1-eric.auger@redhat.com>
 <20211127072910.1261824-2-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211127072910.1261824-2-eric.auger@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On Sat, Nov 27, 2021 at 08:29:07AM +0100, Eric Auger wrote:
> The spec says "the driver must not write to device configuration
> fields". So remove the set_config() callback which anyway did
> not do anything.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Removing this makes sense. For bypass, I'll add the function back with a
reduced trace

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  hw/virtio/trace-events   |  1 -
>  hw/virtio/virtio-iommu.c | 14 --------------
>  2 files changed, 15 deletions(-)
> 
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 650e521e351..54bd7da00c8 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -92,7 +92,6 @@ virtio_iommu_device_reset(void) "reset!"
>  virtio_iommu_get_features(uint64_t features) "device supports features=0x%"PRIx64
>  virtio_iommu_device_status(uint8_t status) "driver status = %d"
>  virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_range, uint32_t probe_size) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" domain_range=%d probe_size=0x%x"
> -virtio_iommu_set_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_range, uint32_t probe_size) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" domain_bits=%d probe_size=0x%x"
>  virtio_iommu_attach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
>  virtio_iommu_detach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
>  virtio_iommu_map(uint32_t domain_id, uint64_t virt_start, uint64_t virt_end, uint64_t phys_start, uint32_t flags) "domain=%d virt_start=0x%"PRIx64" virt_end=0x%"PRIx64 " phys_start=0x%"PRIx64" flags=%d"
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 1b23e8e18c7..645c0aa3997 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -832,19 +832,6 @@ static void virtio_iommu_get_config(VirtIODevice *vdev, uint8_t *config_data)
>      memcpy(config_data, &dev->config, sizeof(struct virtio_iommu_config));
>  }
>  
> -static void virtio_iommu_set_config(VirtIODevice *vdev,
> -                                      const uint8_t *config_data)
> -{
> -    struct virtio_iommu_config config;
> -
> -    memcpy(&config, config_data, sizeof(struct virtio_iommu_config));
> -    trace_virtio_iommu_set_config(config.page_size_mask,
> -                                  config.input_range.start,
> -                                  config.input_range.end,
> -                                  config.domain_range.end,
> -                                  config.probe_size);
> -}
> -
>  static uint64_t virtio_iommu_get_features(VirtIODevice *vdev, uint64_t f,
>                                            Error **errp)
>  {
> @@ -1185,7 +1172,6 @@ static void virtio_iommu_class_init(ObjectClass *klass, void *data)
>      vdc->unrealize = virtio_iommu_device_unrealize;
>      vdc->reset = virtio_iommu_device_reset;
>      vdc->get_config = virtio_iommu_get_config;
> -    vdc->set_config = virtio_iommu_set_config;
>      vdc->get_features = virtio_iommu_get_features;
>      vdc->set_status = virtio_iommu_set_status;
>      vdc->vmsd = &vmstate_virtio_iommu_device;
> -- 
> 2.26.3
> 

