Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C4D6C1D03
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 17:59:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peIpg-0005uV-1t; Mon, 20 Mar 2023 12:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1peIpb-0005tw-TQ
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:58:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1peIpa-0002GR-AP
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:57:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679331477;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hLkK/N49gy8Be4VCtaz8MeUC/vgaKJhJiCR1FPNh//s=;
 b=O5hLKwtH3bYpLYi9kv+9hP60hJyVUPeba3hYbWpm78HyzIE4F2iauQXkPavA1I/cSGFMf8
 SUKlkrqA6keEO0kku5uBiDTjAusAfcR8O9P1Tccb3XnDs8GuLW2gTTQj8lfQb2ndHMVfsj
 QDqRwkY2STB5HcLAUB3jlA578/ApuPM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-gv-_vzKrPkWeUFaNdU8DsA-1; Mon, 20 Mar 2023 12:57:55 -0400
X-MC-Unique: gv-_vzKrPkWeUFaNdU8DsA-1
Received: by mail-wm1-f70.google.com with SMTP id
 t1-20020a7bc3c1000000b003dfe223de49so8728231wmj.5
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 09:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679331474;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hLkK/N49gy8Be4VCtaz8MeUC/vgaKJhJiCR1FPNh//s=;
 b=YMADvKhmFdu8CN+U3peRC/vtCLaSB3QGqNPTLQh0by+2tB6zwdJ1VwwCn49O4ObuFS
 26nzPurZau1VSqe2uKj7Pto6bRbFItSRhzT+119VD32sex75cyPCTtzYOCyGAi8QWDaQ
 ktFSS0POhLmRxoMiX9RdlP76fEJo6LuPIRSV8PHi5lXdIoyk+TBT8QYeF7j6ZhG1kJMs
 okXnIv9mEWMe0YX18Z2RX9X9ES5icInSZ+T7z6rlVOUA1494tZmSC9TyO13L4b3TLN5+
 7OiG0z9OMz50jloa3wm/+BwyX1WM5W0lKmufIcBLcZaC0NHmArnpfZI0pNTUYbd7vu5f
 kumg==
X-Gm-Message-State: AO0yUKWAbC8Pwd5I8HWi2zMOAC6QE2hc9dd8zUX2Rv9BHY8qNRPbgTO5
 E9g20hYFKMLjfh9X96/QAQ3Yl26Sh3aYcKfFzvpnuFpgB2ammVGQ+2zr6zDi7uG3ImVb7rqWbFI
 haYcA/hQZPDqmTDk=
X-Received: by 2002:a05:600c:21da:b0:3ed:307f:1663 with SMTP id
 x26-20020a05600c21da00b003ed307f1663mr221545wmj.15.1679331474577; 
 Mon, 20 Mar 2023 09:57:54 -0700 (PDT)
X-Google-Smtp-Source: AK7set/BuW/MWBZWyfdV3aVydvp7hkJLuE0+SRo+rUi1h7ZNqg2RpfGNkRGiQQ9RBZOL1bV/RjHbfA==
X-Received: by 2002:a05:600c:21da:b0:3ed:307f:1663 with SMTP id
 x26-20020a05600c21da00b003ed307f1663mr221535wmj.15.1679331474306; 
 Mon, 20 Mar 2023 09:57:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a05600c224300b003eae73f0fc1sm10901381wmm.18.2023.03.20.09.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 09:57:53 -0700 (PDT)
Message-ID: <599b0374-a8a0-8f47-cd3f-0e67801d6cd6@redhat.com>
Date: Mon, 20 Mar 2023 17:57:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v2 09/11] hw/arm/smmuv3: Add stage-2 support in iova
 notifier
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-10-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230226220650.1480786-10-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On 2/26/23 23:06, Mostafa Saleh wrote:
> In smmuv3_notify_iova, read the granule based on translation stage
> and use VMID if valid value is sent.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmuv3.c     | 39 ++++++++++++++++++++++++++-------------
>  hw/arm/trace-events |  2 +-
>  2 files changed, 27 insertions(+), 14 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 8c76a48c8d..7297f6adc1 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -971,18 +971,21 @@ epilogue:
>   * @mr: IOMMU mr region handle
>   * @n: notifier to be called
>   * @asid: address space ID or negative value if we don't care
> + * @vmid: virtual machine ID or negative value if we don't care
>   * @iova: iova
>   * @tg: translation granule (if communicated through range invalidation)
>   * @num_pages: number of @granule sized pages (if tg != 0), otherwise 1
>   */
>  static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>                                 IOMMUNotifier *n,
> -                               int asid, dma_addr_t iova,
> -                               uint8_t tg, uint64_t num_pages)
> +                               int asid, int vmid,
> +                               dma_addr_t iova, uint8_t tg,
> +                               uint64_t num_pages)
>  {
>      SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
>      IOMMUTLBEvent event;
>      uint8_t granule;
> +    SMMUv3State *s = sdev->smmu;

I am not sure notifiers are likely to be registered in the S2 case
because it is mostly meant to integrate with vhost or VFIO. The code in
this patch would rather prepare for nested stage support I guess, I
don't think it can harm.

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

>  
>      if (!tg) {
>          SMMUEventInfo event = {.inval_ste_allowed = true};
> @@ -997,11 +1000,20 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>              return;
>          }
>  
> -        tt = select_tt(cfg, iova);
> -        if (!tt) {
> +        if (vmid >= 0 && cfg->s2cfg.vmid != vmid) {
>              return;
>          }
> -        granule = tt->granule_sz;
> +
> +        if (STAGE1_SUPPORTED(s)) {
> +            tt = select_tt(cfg, iova);
> +            if (!tt) {
> +                return;
> +            }
> +            granule = tt->granule_sz;
> +        } else {
> +            granule = cfg->s2cfg.granule_sz;
> +        }
> +
>      } else {
>          granule = tg * 2 + 10;
>      }
> @@ -1015,9 +1027,10 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>      memory_region_notify_iommu_one(n, &event);
>  }
>  
> -/* invalidate an asid/iova range tuple in all mr's */
> -static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
> -                                      uint8_t tg, uint64_t num_pages)
> +/* invalidate an asid/vmid/iova range tuple in all mr's */
> +static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
> +                                      dma_addr_t iova, uint8_t tg,
> +                                      uint64_t num_pages)
>  {
>      SMMUDevice *sdev;
>  
> @@ -1025,11 +1038,11 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
>          IOMMUMemoryRegion *mr = &sdev->iommu;
>          IOMMUNotifier *n;
>  
> -        trace_smmuv3_inv_notifiers_iova(mr->parent_obj.name, asid, iova,
> -                                        tg, num_pages);
> +        trace_smmuv3_inv_notifiers_iova(mr->parent_obj.name, asid, vmid,
> +                                        iova, tg, num_pages);
>  
>          IOMMU_NOTIFIER_FOREACH(n, mr) {
> -            smmuv3_notify_iova(mr, n, asid, iova, tg, num_pages);
> +            smmuv3_notify_iova(mr, n, asid, vmid, iova, tg, num_pages);
>          }
>      }
>  }
> @@ -1060,7 +1073,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
>  
>      if (!tg) {
>          trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
> -        smmuv3_inv_notifiers_iova(s, asid, addr, tg, 1);
> +        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1);
>          smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
>          return;
>      }
> @@ -1078,7 +1091,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
>  
>          num_pages = (mask + 1) >> granule;
>          trace_smmuv3_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
> -        smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
> +        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, num_pages);
>          smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
>          addr += mask + 1;
>      }
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index f8fdf1ca9f..cdc1ea06a8 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -53,5 +53,5 @@ smmuv3_cmdq_tlbi_s12_vmid(uint16_t vmid) "vmid=%d"
>  smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
>  smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
>  smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
> -smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
> +smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint16_t vmid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
>  


