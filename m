Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 535E96BF0C1
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 19:33:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdErI-0003Qg-1q; Fri, 17 Mar 2023 14:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pdErF-0003Q0-8l
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 14:31:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pdErD-0005g2-2o
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 14:31:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679077874;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0FZg0Pw/U+ARciyeTV50a3uEYXT0+7DWBMSe524/w2M=;
 b=X+X3VA7kC2xqnbub6hTkCwT/sry2ETnOO0y1+uIf3Kx9SnwwuOhOJXKS+sNCNlhGTUp3rF
 iaITASH/ExmZz16OjdxuqM4dvQ0P3nwFms0vTW1WYbtd9HoZY2B7GDg8rEA9dsDuEXueoz
 qlNkK1UYrWLUAPCRN6uQXWrD2VopHSc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-9KlqXSo_N9CTQSb1QIqxug-1; Fri, 17 Mar 2023 14:31:12 -0400
X-MC-Unique: 9KlqXSo_N9CTQSb1QIqxug-1
Received: by mail-wm1-f70.google.com with SMTP id
 l17-20020a05600c1d1100b003ed29ba093cso2230033wms.6
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 11:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679077868;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0FZg0Pw/U+ARciyeTV50a3uEYXT0+7DWBMSe524/w2M=;
 b=idiDXhEl70Ciy/n0h2lnirc8af0SeCEzpxA/A5KmRRHwTWeDOgCXKqH+4N/b6V4s90
 vV/YZYwAwSd6FaX7Gb5SeR9HuFWgrzy97VwOySCy6uS2lIzDoSmfxRzqBj5q2Orm8Hid
 m3g3I+d3ym5SvBtvgfmvOOh3vRvw74d1junQitn5FxTY5XI3xI6Nqs76rTQZ45l6lZLZ
 wDEhcAS3xPquPSCTd5oHw5Pvbyk46j+HVjUhy1uVW2R9IQtGsCQwxT9TP5Qmc2Xr05wW
 HD+QYCClH6YTmeOyHPqkmLi88WlToMkNhEghSyxrLR6q4HWlpUkrtsWmWNL0LYOKbDYj
 l7RQ==
X-Gm-Message-State: AO0yUKV2j7w/h00OFv/vmJ53NnsxSwmZVKhckYhsbNr1869mqvip+ndt
 0T4ZFQGbl1lXSsSOpkg7PkqXQkJq2jRR9N0+CKWErJ/mlVgnqxFX+fjjiMPRKUA3UKzvTLJtyh/
 kVy47Na7N56r/Cvg=
X-Received: by 2002:a05:600c:4fc5:b0:3e2:f80:3df1 with SMTP id
 o5-20020a05600c4fc500b003e20f803df1mr25855042wmq.19.1679077868167; 
 Fri, 17 Mar 2023 11:31:08 -0700 (PDT)
X-Google-Smtp-Source: AK7set+3iCGiFX2Gr2cuJslR71uWaEaXn9IjF+MskiAb7fRqB75sIV6iJxH8J66xyROJfpRX1BD44A==
X-Received: by 2002:a05:600c:4fc5:b0:3e2:f80:3df1 with SMTP id
 o5-20020a05600c4fc500b003e20f803df1mr25855022wmq.19.1679077867827; 
 Fri, 17 Mar 2023 11:31:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a05600c4e4400b003e8f0334db8sm8698929wmq.5.2023.03.17.11.31.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 11:31:07 -0700 (PDT)
Message-ID: <13459f92-da9f-f7a8-9c18-1870a9def7e8@redhat.com>
Date: Fri, 17 Mar 2023 19:31:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v2 03/11] hw/arm/smmuv3: Refactor stage-1 PTW
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-4-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230226220650.1480786-4-smostafa@google.com>
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
> In preparation for adding stage-2 support, rename smmu_ptw_64 to
> smmu_ptw_64_s1 and refactor some of the code so it can be reused in
> stage-2 page table walk.
>
> Remove AA64 check from PTW as decode_cd already ensures that AA64 is
> used, otherwise it faults with C_BAD_CD.
>
> A stage member is added to SMMUPTWEventInfo to differentiate
> between stage-1 and stage-2 ptw faults.
>
> Add stage argument to trace_smmu_ptw_level be consistent with other
> trace events.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
> Changes in v2:
> - Refactor common functions to be use in stage-2.
> - Add stage to SMMUPTWEventInfo.
> - Remove AA64 check.
> ---
>  hw/arm/smmu-common.c         | 27 ++++++++++-----------------
>  hw/arm/smmuv3.c              |  2 ++
>  hw/arm/trace-events          |  2 +-
>  include/hw/arm/smmu-common.h | 15 ++++++++++++---
>  4 files changed, 25 insertions(+), 21 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 0a5a60ca1e..b49c1affdb 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -264,7 +264,7 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
>  }
>  
>  /**
> - * smmu_ptw_64 - VMSAv8-64 Walk of the page tables for a given IOVA
> + * smmu_ptw_64_s1 - VMSAv8-64 Walk of the page tables for a given IOVA
>   * @cfg: translation config
>   * @iova: iova to translate
>   * @perm: access type
> @@ -276,9 +276,9 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
>   * Upon success, @tlbe is filled with translated_addr and entry
>   * permission rights.
>   */
> -static int smmu_ptw_64(SMMUTransCfg *cfg,
> -                       dma_addr_t iova, IOMMUAccessFlags perm,
> -                       SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> +static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
> +                          dma_addr_t iova, IOMMUAccessFlags perm,
> +                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
>  {
>      dma_addr_t baseaddr, indexmask;
>      int stage = cfg->stage;
> @@ -291,14 +291,14 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
>      }
>  
>      granule_sz = tt->granule_sz;
> -    stride = granule_sz - 3;
> +    stride = SMMU_STRIDE(granule_sz);
>      inputsize = 64 - tt->tsz;
>      level = 4 - (inputsize - 4) / stride;
> -    indexmask = (1ULL << (inputsize - (stride * (4 - level)))) - 1;
> +    indexmask = SMMU_IDXMSK(inputsize, stride, level);
>      baseaddr = extract64(tt->ttb, 0, 48);
>      baseaddr &= ~indexmask;
>  
> -    while (level <= 3) {
> +    while (level < SMMU_LEVELS) {
>          uint64_t subpage_size = 1ULL << level_shift(level, granule_sz);
>          uint64_t mask = subpage_size - 1;
>          uint32_t offset = iova_level_offset(iova, inputsize, level, granule_sz);
> @@ -309,7 +309,7 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
>          if (get_pte(baseaddr, offset, &pte, info)) {
>                  goto error;
>          }
> -        trace_smmu_ptw_level(level, iova, subpage_size,
> +        trace_smmu_ptw_level(stage, level, iova, subpage_size,
>                               baseaddr, offset, pte);
>  
>          if (is_invalid_pte(pte) || is_reserved_pte(pte, level)) {
> @@ -358,6 +358,7 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
>      info->type = SMMU_PTW_ERR_TRANSLATION;
>  
>  error:
> +    info->stage = 1;
>      tlbe->entry.perm = IOMMU_NONE;
>      return -EINVAL;
>  }
> @@ -376,15 +377,7 @@ error:
>  int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>               SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
>  {
> -    if (!cfg->aa64) {
> -        /*
> -         * This code path is not entered as we check this while decoding
> -         * the configuration data in the derived SMMU model.
> -         */
> -        g_assert_not_reached();
> -    }
> -
> -    return smmu_ptw_64(cfg, iova, perm, tlbe, info);
> +    return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
>  }
>  
>  /**
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 270c80b665..4e90343996 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -716,6 +716,8 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>      cached_entry = g_new0(SMMUTLBEntry, 1);
>  
>      if (smmu_ptw(cfg, aligned_addr, flag, cached_entry, &ptw_info)) {
> +        /* All faults from PTW has S2 field. */
> +        event.u.f_walk_eabt.s2 = (ptw_info.stage == 2);
>          g_free(cached_entry);
>          switch (ptw_info.type) {
>          case SMMU_PTW_ERR_WALK_EABT:
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 2dee296c8f..205ac04573 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -5,7 +5,7 @@ virt_acpi_setup(void) "No fw cfg or ACPI disabled. Bailing out."
>  
>  # smmu-common.c
>  smmu_add_mr(const char *name) "%s"
> -smmu_ptw_level(int level, uint64_t iova, size_t subpage_size, uint64_t baseaddr, uint32_t offset, uint64_t pte) "level=%d iova=0x%"PRIx64" subpage_sz=0x%zx baseaddr=0x%"PRIx64" offset=%d => pte=0x%"PRIx64
> +smmu_ptw_level(int stage, int level, uint64_t iova, size_t subpage_size, uint64_t baseaddr, uint32_t offset, uint64_t pte) "stage=%d level=%d iova=0x%"PRIx64" subpage_sz=0x%zx baseaddr=0x%"PRIx64" offset=%d => pte=0x%"PRIx64
>  smmu_ptw_invalid_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, uint32_t offset, uint64_t pte) "stage=%d level=%d base@=0x%"PRIx64" pte@=0x%"PRIx64" offset=%d pte=0x%"PRIx64
>  smmu_ptw_page_pte(int stage, int level,  uint64_t iova, uint64_t baseaddr, uint64_t pteaddr, uint64_t pte, uint64_t address) "stage=%d level=%d iova=0x%"PRIx64" base@=0x%"PRIx64" pte@=0x%"PRIx64" pte=0x%"PRIx64" page address = 0x%"PRIx64
>  smmu_ptw_block_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, uint64_t pte, uint64_t iova, uint64_t gpa, int bsize_mb) "stage=%d level=%d base@=0x%"PRIx64" pte@=0x%"PRIx64" pte=0x%"PRIx64" iova=0x%"PRIx64" block address = 0x%"PRIx64" block size = %d MiB"
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 2deead08d6..1ada792122 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -23,9 +23,17 @@
>  #include "hw/pci/pci.h"
>  #include "qom/object.h"
>  
> -#define SMMU_PCI_BUS_MAX      256
> -#define SMMU_PCI_DEVFN_MAX    256
> -#define SMMU_PCI_DEVFN(sid)   (sid & 0xFF)
> +#define SMMU_PCI_BUS_MAX                    256
> +#define SMMU_PCI_DEVFN_MAX                  256
> +#define SMMU_PCI_DEVFN(sid)                 (sid & 0xFF)
> +
> +#define SMMU_LEVELS                         4
> +
> +#define SMMU_STRIDE(gran)                   ((gran) - SMMU_LEVELS + 1)
> +#define SMMU_BIT_LVL(isz, strd, lvl)        ((isz) - (strd) * \
> +                                             (SMMU_LEVELS - (lvl)))
> +#define SMMU_IDXMSK(isz, strd, lvl)         ((1ULL << \
> +                                             SMMU_BIT_LVL(isz, strd, lvl)) - 1)
This looks good to me. Just a question about the BIT_LVL and IDXMSK
defines. Do they correspond to any documented pseudocode functions
documented somewhere in the ARM ARM?

Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>


Thanks

Eric
>  
>  /*
>   * Page table walk error types
> @@ -40,6 +48,7 @@ typedef enum {
>  } SMMUPTWEventType;
>  
>  typedef struct SMMUPTWEventInfo {
> +    int stage;
>      SMMUPTWEventType type;
>      dma_addr_t addr; /* fetched address that induced an abort, if any */
>  } SMMUPTWEventInfo;


