Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A9D6C1B18
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 17:17:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peIBw-0004X2-HV; Mon, 20 Mar 2023 12:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1peIBt-0004So-2P
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:16:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1peIBq-0005Gh-Db
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679329013;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DRH14/Pde10f156ARF7uxf5mcn0o5ZqtTFH+IaGoiVQ=;
 b=XsyXZ2/840LAU2FXsLXZRASL0sU6CRBC9HULTmxHThlxIcAgyMN5ltawEEr2pYGRPfsehu
 aOuAgzK0n3SviAQQ2vRgoewAzex0FZasnXEpxzMdmkM5AuAGIMxkjEcmfmMJR4oqjKculT
 V6X1ertqm87mHjKIsoDzxuDugbXgirs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-XOPL3qbeNxCW_PmOBYnhkw-1; Mon, 20 Mar 2023 12:16:51 -0400
X-MC-Unique: XOPL3qbeNxCW_PmOBYnhkw-1
Received: by mail-wm1-f70.google.com with SMTP id
 z20-20020a05600c0a1400b003edcff41678so686799wmp.0
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 09:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679329009;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DRH14/Pde10f156ARF7uxf5mcn0o5ZqtTFH+IaGoiVQ=;
 b=u5Q9yeSu1oCsWRiBWTLQHnK7mmtuf6sxI5mW6l+cDZ0s/kfscTXU5OXHxiEV6RD6vk
 3LujK/2PCysFWrhMHYqKmuda7DXeUHrx6FFrMUsXYDUASE2BA9CMsOFtH8qJO6MOMO7H
 PWsxJG5Ayb7rgPteGjtLKKzPWh2z2+NVIGeAnzBRuLTb0ZV0N8GZhrRSN8jeqGIuI3ZF
 Dw2CNPObJT0EOi5pv2JwLu8vKw8yBtetQDy0Uh+eI6PCGMBVV+f8ywKvVue9b1rprj3K
 ktCIODllZVT/mLoFNotSoRXc5cm9vPDahAWjJk2kREEcPyHgRjXcfADCs1jzBpeZxsoH
 QHMg==
X-Gm-Message-State: AO0yUKVSRkGAzY0rsP2yUC/s4fCK/PzeGdsdXBDFGS9W68DJucUvQT40
 hdKLM8zpRNgzY2YzA06Z7lWT7RaSwWXMeXmuPLdNo/aMFm0AxY3NF6BYN8DchLmkZC72RL53X+7
 a2sbnDRAyScND5bk=
X-Received: by 2002:a7b:c409:0:b0:3ed:9a37:acbf with SMTP id
 k9-20020a7bc409000000b003ed9a37acbfmr69296wmi.31.1679329009254; 
 Mon, 20 Mar 2023 09:16:49 -0700 (PDT)
X-Google-Smtp-Source: AK7set8hjaSdgLH3E/xqw12108wPWuD+5qZrvhxFiVHUiZfy6EnB6nl6itdRt57SeIxySUf68vFu+w==
X-Received: by 2002:a7b:c409:0:b0:3ed:9a37:acbf with SMTP id
 k9-20020a7bc409000000b003ed9a37acbfmr69277wmi.31.1679329008891; 
 Mon, 20 Mar 2023 09:16:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ay38-20020a05600c1e2600b003df7b40f99fsm16865684wmb.11.2023.03.20.09.16.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 09:16:48 -0700 (PDT)
Message-ID: <3a3ca088-1c9b-f8b6-64af-2346db9a5497@redhat.com>
Date: Mon, 20 Mar 2023 17:16:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v2 07/11] hw/arm/smmuv3: Add VMID to tlb tagging
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-8-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230226220650.1480786-8-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Mostafa,

On 2/26/23 23:06, Mostafa Saleh wrote:
> Allow TLB to be tagged with VMID.

s/tlb/TLB in the commit msg.
>
> If stage-1 is only supported, VMID is set to -1 and ignored from STE
> and CMD_TLBI_NH* cmds.
>
> Update smmu_iotlb_insert trace event to have vmid.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
> Changes in v2:
> -Fix TLB aliasing issue from missing check in smmu_iotlb_key_equal.
> -Add vmid to traces smmu_iotlb_insert and smmu_iotlb_lookup_hit/miss.
> -Add vmid to hash function.
> ---
>  hw/arm/smmu-common.c         | 36 ++++++++++++++++++++++--------------
>  hw/arm/smmu-internal.h       |  2 ++
>  hw/arm/smmuv3.c              | 12 +++++++++---
>  hw/arm/trace-events          |  6 +++---
>  include/hw/arm/smmu-common.h |  5 +++--
>  5 files changed, 39 insertions(+), 22 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 3f448bc82e..3191a008c6 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -38,7 +38,7 @@ static guint smmu_iotlb_key_hash(gconstpointer v)
>  
>      /* Jenkins hash */
>      a = b = c = JHASH_INITVAL + sizeof(*key);
> -    a += key->asid + key->level + key->tg;
> +    a += key->asid + key->vmid + key->level + key->tg;
>      b += extract64(key->iova, 0, 32);
>      c += extract64(key->iova, 32, 32);
>  
> @@ -53,13 +53,15 @@ static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
>      SMMUIOTLBKey *k1 = (SMMUIOTLBKey *)v1, *k2 = (SMMUIOTLBKey *)v2;
>  
>      return (k1->asid == k2->asid) && (k1->iova == k2->iova) &&
> -           (k1->level == k2->level) && (k1->tg == k2->tg);
> +           (k1->level == k2->level) && (k1->tg == k2->tg) &&
> +           (k1->vmid == k2->vmid);
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
> @@ -78,7 +80,8 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
>          uint64_t mask = subpage_size - 1;
>          SMMUIOTLBKey key;
>  
> -        key = smmu_get_iotlb_key(cfg->asid, iova & ~mask, tg, level);
> +        key = smmu_get_iotlb_key(cfg->asid, cfg->s2cfg.vmid,
> +                                 iova & ~mask, tg, level);
>          entry = g_hash_table_lookup(bs->iotlb, &key);
>          if (entry) {
>              break;
> @@ -88,13 +91,13 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
>  
>      if (entry) {
>          cfg->iotlb_hits++;
> -        trace_smmu_iotlb_lookup_hit(cfg->asid, iova,
> +        trace_smmu_iotlb_lookup_hit(cfg->asid, cfg->s2cfg.vmid, iova,
>                                      cfg->iotlb_hits, cfg->iotlb_misses,
>                                      100 * cfg->iotlb_hits /
>                                      (cfg->iotlb_hits + cfg->iotlb_misses));
>      } else {
>          cfg->iotlb_misses++;
> -        trace_smmu_iotlb_lookup_miss(cfg->asid, iova,
> +        trace_smmu_iotlb_lookup_miss(cfg->asid, cfg->s2cfg.vmid, iova,
>                                       cfg->iotlb_hits, cfg->iotlb_misses,
>                                       100 * cfg->iotlb_hits /
>                                       (cfg->iotlb_hits + cfg->iotlb_misses));
> @@ -111,8 +114,10 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *new)
>          smmu_iotlb_inv_all(bs);
>      }
>  
> -    *key = smmu_get_iotlb_key(cfg->asid, new->entry.iova, tg, new->level);
> -    trace_smmu_iotlb_insert(cfg->asid, new->entry.iova, tg, new->level);
> +    *key = smmu_get_iotlb_key(cfg->asid, cfg->s2cfg.vmid, new->entry.iova,
> +                              tg, new->level);
> +    trace_smmu_iotlb_insert(cfg->asid, cfg->s2cfg.vmid, new->entry.iova,
> +                            tg, new->level);
>      g_hash_table_insert(bs->iotlb, key, new);
>  }
>  
> @@ -130,8 +135,7 @@ static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
>  
>      return SMMU_IOTLB_ASID(*iotlb_key) == asid;
>  }
> -
> -static gboolean smmu_hash_remove_by_asid_iova(gpointer key, gpointer value,
> +static gboolean smmu_hash_remove_by_asid_vmid_iova(gpointer key, gpointer value,
>                                                gpointer user_data)
>  {
>      SMMUTLBEntry *iter = (SMMUTLBEntry *)value;
> @@ -142,18 +146,21 @@ static gboolean smmu_hash_remove_by_asid_iova(gpointer key, gpointer value,
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
> @@ -166,10 +173,11 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
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
> index f79c389cd3..4beba76302 100644
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
> index ce193e9598..f9c06723f9 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1038,7 +1038,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>  {
>      dma_addr_t end, addr = CMD_ADDR(cmd);
>      uint8_t type = CMD_TYPE(cmd);
> -    uint16_t vmid = CMD_VMID(cmd);
> +    int vmid = -1;
>      uint8_t scale = CMD_SCALE(cmd);
>      uint8_t num = CMD_NUM(cmd);
>      uint8_t ttl = CMD_TTL(cmd);
> @@ -1047,6 +1047,12 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>      uint64_t num_pages;
>      uint8_t granule;
>      int asid = -1;
> +    SMMUv3State *smmuv3 = ARM_SMMUV3(s);
> +
> +    /* Only consider VMID if stage-2 is supported. */
> +    if (STAGE2_SUPPORTED(smmuv3)) {
> +        vmid = CMD_VMID(cmd);
> +    }
>  
>      if (type == SMMU_CMD_TLBI_NH_VA) {
>          asid = CMD_ASID(cmd);
> @@ -1055,7 +1061,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>      if (!tg) {
>          trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
>          smmuv3_inv_notifiers_iova(s, asid, addr, tg, 1);
> -        smmu_iotlb_inv_iova(s, asid, addr, tg, 1, ttl);
> +        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
>          return;
>      }
>  
> @@ -1073,7 +1079,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>          num_pages = (mask + 1) >> granule;
>          trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
>          smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
> -        smmu_iotlb_inv_iova(s, asid, addr, tg, num_pages, ttl);
> +        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
>          addr += mask + 1;
>      }
>  }
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 205ac04573..705104e58b 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -14,9 +14,9 @@ smmu_iotlb_inv_all(void) "IOTLB invalidate all"
>  smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=%d"
>  smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
>  smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
> -smmu_iotlb_lookup_hit(uint16_t asid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
> -smmu_iotlb_lookup_miss(uint16_t asid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache MISS asid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
> -smmu_iotlb_insert(uint16_t asid, uint64_t addr, uint8_t tg, uint8_t level) "IOTLB ++ asid=%d addr=0x%"PRIx64" tg=%d level=%d"
> +smmu_iotlb_lookup_hit(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
> +smmu_iotlb_lookup_miss(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache MISS asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
> +smmu_iotlb_insert(uint16_t asid, uint16_t vmid, uint64_t addr, uint8_t tg, uint8_t level) "IOTLB ++ asid=%d vmid=%d addr=0x%"PRIx64" tg=%d level=%d"
>  
>  # smmuv3.c
>  smmuv3_read_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 1ada792122..c415e8d853 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -118,6 +118,7 @@ typedef struct SMMUPciBus {
>  typedef struct SMMUIOTLBKey {
>      uint64_t iova;
>      uint16_t asid;
> +    uint16_t vmid;
>      uint8_t tg;
>      uint8_t level;
>  } SMMUIOTLBKey;
> @@ -181,11 +182,11 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
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
Looks good to me:
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


