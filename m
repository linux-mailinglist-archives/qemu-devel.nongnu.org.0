Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E1E6990F5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 11:18:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSbKr-0003mr-VP; Thu, 16 Feb 2023 05:17:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSbKk-0003l1-3J
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 05:17:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSbKh-0007HJ-2z
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 05:17:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676542662;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JA/Zo2oVSssnlXopSwP8Z/emfJQ2phOGxfbmx39Z6rQ=;
 b=ZnIie1fxDEu4L4GZTcsMfAHesnQ6Urhtz3KsQPJE5ar36SL7gul/VSJy/RY9FeXdbuSnqJ
 sgvYwwz2htTXaTGwLYAPDScWPxRzAj1IJsyg0c7G257mZVpkgzJX6Frl5cojne9JzilVf+
 JuebBie61Z+IfwO1ymyNZoKtgsVj7Os=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-422-sL5FXQLAOX6fKasvRvaZyA-1; Thu, 16 Feb 2023 05:17:38 -0500
X-MC-Unique: sL5FXQLAOX6fKasvRvaZyA-1
Received: by mail-qv1-f69.google.com with SMTP id
 r10-20020a0562140c8a00b0056ed45f262dso823905qvr.11
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 02:17:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JA/Zo2oVSssnlXopSwP8Z/emfJQ2phOGxfbmx39Z6rQ=;
 b=TMXJM/P6GZkatjWKc/f25hLBAgvv3rr/pBNu70GTRma8gVD0IICzbOFCk7YNeede/k
 xSzAd+BYVPuknuH8sHxsZaoFf28xZRcxyLnHTsFBcTwPTK0pof6VVqSs7c82Z3Opn9K4
 ywY5pFYGbalrgHyZXj2J5oeH4UiWJgqR7e/BQJAtNUCe/qAUJXcG33STQIljeFAkaCac
 weweFX8SthrxsRjdokAgoG/pTtg0TMVsx0dI4fKI7WZ03TcZ6MjGRjF3YCDyTP/exlMQ
 cTck1Zs/EZZ4Crk3xkLMy3ABbdozQ8qW059BzHpvAOXJcMB3AJD0bXPwrks0sm3DZUs1
 RntA==
X-Gm-Message-State: AO0yUKWNpJey1eEXUEppG6Q/X8PSygo1Ckn7oWsx0Oje0Yl054+BkJQ1
 aZSVU95q7vrFUAmgmTjzmc4hlWGdQ+37trubEO8ZXR2KLy8fAneaqD9S/b3jYGr1He+ZQH/EFB3
 9re3hs4mpdIJ04RU=
X-Received: by 2002:a05:622a:34b:b0:3b9:a3c5:dae9 with SMTP id
 r11-20020a05622a034b00b003b9a3c5dae9mr8776029qtw.48.1676542658182; 
 Thu, 16 Feb 2023 02:17:38 -0800 (PST)
X-Google-Smtp-Source: AK7set+JqtmOy8XPMB2tNrRVHJufsx5l0pkmPZd82s5YV4M1x46ib6+yPRiOKkRQd/UprlE7VqA4xQ==
X-Received: by 2002:a05:622a:34b:b0:3b9:a3c5:dae9 with SMTP id
 r11-20020a05622a034b00b003b9a3c5dae9mr8776013qtw.48.1676542657870; 
 Thu, 16 Feb 2023 02:17:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 19-20020ac85613000000b003bd0a4a30aesm903475qtr.16.2023.02.16.02.17.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 02:17:37 -0800 (PST)
Message-ID: <ae0d6155-138e-5005-733f-f3932a14c6b3@redhat.com>
Date: Thu, 16 Feb 2023 11:17:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 12/16] hw/arm/smmuv3: Add VMID to tlb tagging
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-13-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230205094411.793816-13-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 2/5/23 10:44, Mostafa Saleh wrote:
> Allow TLB to be tagged with VMID.
>
> If stage-1 is only supported, VMID is set to -1 and ignored from STE
> and CMD_TLBI_NH* cmds.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmu-common.c         | 24 +++++++++++++++---------
>  hw/arm/smmu-internal.h       |  2 ++
>  hw/arm/smmuv3.c              | 12 +++++++++---
>  include/hw/arm/smmu-common.h |  5 +++--
>  4 files changed, 29 insertions(+), 14 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 541c427684..028a60949a 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -56,10 +56,11 @@ static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
>             (k1->level == k2->level) && (k1->tg == k2->tg);
>  }
>  
> -SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint64_t iova,
> +SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
>                                  uint8_t tg, uint8_t level)
>  {
> -    SMMUIOTLBKey key = {.asid = asid, .iova = iova, .tg = tg, .level = level};
> +    SMMUIOTLBKey key = {.asid = asid, .vmid = vmid, .iova = iova,
> +                        .tg = tg, .level = level};
>  
>      return key;
>  }
> @@ -78,7 +79,8 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
>          uint64_t mask = subpage_size - 1;
>          SMMUIOTLBKey key;
>  
> -        key = smmu_get_iotlb_key(cfg->asid, iova & ~mask, tg, level);
> +        key = smmu_get_iotlb_key(cfg->asid, cfg->s2cfg.vmid,
> +                                 iova & ~mask, tg, level);
>          entry = g_hash_table_lookup(bs->iotlb, &key);
>          if (entry) {
>              break;
> @@ -111,7 +113,8 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *new)
>          smmu_iotlb_inv_all(bs);
>      }
>  
> -    *key = smmu_get_iotlb_key(cfg->asid, new->entry.iova, tg, new->level);
> +    *key = smmu_get_iotlb_key(cfg->asid, cfg->s2cfg.vmid, new->entry.iova,
> +                              tg, new->level);
>      trace_smmu_iotlb_insert(cfg->asid, new->entry.iova, tg, new->level);
you may update the trace point as well

Thanks

Erric
>      g_hash_table_insert(bs->iotlb, key, new);
>  }
> @@ -130,8 +133,7 @@ static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
>  
>      return SMMU_IOTLB_ASID(*iotlb_key) == asid;
>  }
> -
> -static gboolean smmu_hash_remove_by_asid_iova(gpointer key, gpointer value,
> +static gboolean smmu_hash_remove_by_asid_vmid_iova(gpointer key, gpointer value,
>                                                gpointer user_data)
>  {
>      SMMUTLBEntry *iter = (SMMUTLBEntry *)value;
> @@ -142,18 +144,21 @@ static gboolean smmu_hash_remove_by_asid_iova(gpointer key, gpointer value,
>      if (info->asid >= 0 && info->asid != SMMU_IOTLB_ASID(iotlb_key)) {
>          return false;
>      }
> +    if (info->vmid >= 0 && info->vmid != SMMU_IOTLB_VMID(iotlb_key)) {
> +        return false;
> +    }
>      return ((info->iova & ~entry->addr_mask) == entry->iova) ||
>             ((entry->iova & ~info->mask) == info->iova);
>  }
>  
> -void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
> +void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
>                           uint8_t tg, uint64_t num_pages, uint8_t ttl)
>  {
>      /* if tg is not set we use 4KB range invalidation */
>      uint8_t granule = tg ? tg * 2 + 10 : 12;
>  
>      if (ttl && (num_pages == 1) && (asid >= 0)) {
> -        SMMUIOTLBKey key = smmu_get_iotlb_key(asid, iova, tg, ttl);
> +        SMMUIOTLBKey key = smmu_get_iotlb_key(asid, vmid, iova, tg, ttl);
>  
>          if (g_hash_table_remove(s->iotlb, &key)) {
>              return;
> @@ -166,10 +171,11 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
>  
>      SMMUIOTLBPageInvInfo info = {
>          .asid = asid, .iova = iova,
> +        .vmid = vmid,
>          .mask = (num_pages * 1 << granule) - 1};
>  
>      g_hash_table_foreach_remove(s->iotlb,
> -                                smmu_hash_remove_by_asid_iova,
> +                                smmu_hash_remove_by_asid_vmid_iova,
>                                  &info);
>  }
>  
> diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
> index 7d3f76ce14..3a14e5dca5 100644
> --- a/hw/arm/smmu-internal.h
> +++ b/hw/arm/smmu-internal.h
> @@ -136,9 +136,11 @@ static inline int pgd_idx(int start_level, int granule, dma_addr_t iova)
>  }
>  
>  #define SMMU_IOTLB_ASID(key) ((key).asid)
> +#define SMMU_IOTLB_VMID(key) ((key).vmid)
>  
>  typedef struct SMMUIOTLBPageInvInfo {
>      int asid;
> +    int vmid;
>      uint64_t iova;
>      uint64_t mask;
>  } SMMUIOTLBPageInvInfo;
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 35a0149bbf..8b070f6bb5 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -986,7 +986,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>  {
>      dma_addr_t end, addr = CMD_ADDR(cmd);
>      uint8_t type = CMD_TYPE(cmd);
> -    uint16_t vmid = CMD_VMID(cmd);
> +    int vmid = -1;
>      uint8_t scale = CMD_SCALE(cmd);
>      uint8_t num = CMD_NUM(cmd);
>      uint8_t ttl = CMD_TTL(cmd);
> @@ -995,6 +995,12 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>      uint64_t num_pages;
>      uint8_t granule;
>      int asid = -1;
> +    SMMUv3State *smmuv3 = ARM_SMMUV3(s);
> +
> +    /* Only consider VMID if stage-2 is supported. */
> +    if (STAGE2_SUPPORTED(smmuv3->features)) {
> +        vmid = CMD_VMID(cmd);
> +    }
>  
>      if (type == SMMU_CMD_TLBI_NH_VA) {
>          asid = CMD_ASID(cmd);
> @@ -1003,7 +1009,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>      if (!tg) {
>          trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
>          smmuv3_inv_notifiers_iova(s, asid, addr, tg, 1);
> -        smmu_iotlb_inv_iova(s, asid, addr, tg, 1, ttl);
> +        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
>          return;
>      }
>  
> @@ -1021,7 +1027,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>          num_pages = (mask + 1) >> granule;
>          trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
>          smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
> -        smmu_iotlb_inv_iova(s, asid, addr, tg, num_pages, ttl);
> +        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
>          addr += mask + 1;
>      }
>  }
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 7906e359d9..5cca1c17f5 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -113,6 +113,7 @@ typedef struct SMMUPciBus {
>  typedef struct SMMUIOTLBKey {
>      uint64_t iova;
>      uint16_t asid;
> +    uint16_t vmid;
>      uint8_t tg;
>      uint8_t level;
>  } SMMUIOTLBKey;
> @@ -176,11 +177,11 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
>  SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
>                                  SMMUTransTableInfo *tt, hwaddr iova);
>  void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *entry);
> -SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint64_t iova,
> +SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
>                                  uint8_t tg, uint8_t level);
>  void smmu_iotlb_inv_all(SMMUState *s);
>  void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
> -void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
> +void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
>                           uint8_t tg, uint64_t num_pages, uint8_t ttl);
>  
>  /* Unmap the range of all the notifiers registered to any IOMMU mr */


