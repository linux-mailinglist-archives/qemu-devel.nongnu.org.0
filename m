Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBCF70275E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:39:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyThs-0006so-6J; Mon, 15 May 2023 04:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pyThp-0006sF-Ti
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:37:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pyTho-0003Q8-0E
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:37:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684139839;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EE8YjPacciVWtv3LaXpdDgVasvrE7pNrZBpUME8KvmU=;
 b=V7waZelmjyldqQ42N1TAPp8ppZYl89mp6NdkybrcVWWGEltPmypCvt2hLeZzYfGGUF9RTb
 AwgGVPPjw8bYytfWXxL8WqOnz4vgHcHuKLJOxgfv7T+XfXXZ0nD3k7LJdPJBxwNIHKY7KW
 id8XWq4vKixkbCZc5aoCqjGzNDgzLow=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-lHvULeLbNKmKwcE4XtzLfg-1; Mon, 15 May 2023 04:37:17 -0400
X-MC-Unique: lHvULeLbNKmKwcE4XtzLfg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f41a04a297so32326705e9.3
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 01:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684139836; x=1686731836;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EE8YjPacciVWtv3LaXpdDgVasvrE7pNrZBpUME8KvmU=;
 b=ijgSX8r6S8MOZaRwrGTjPL8dQnY5/OUtWlx7rplYOfWATZ3K4a8You1nRNRPsXhN7d
 5Xe6cpWkelg3qcl1+o9S1hyGhmIh4JMiBDP2G3FJYjTFZIgPBHLoboh0Y8ZmcAXLj2pJ
 MaCOQtRSurDWCZ21NiIbXZvuJwTFMIQZc+ElM0jPwlBu9ZE6MrDlfKG2w6Fqp4omgfgl
 CRwFh6cyGi50XfNDzRMk7I8G9OmsVcCeaann5jfcqmRwI5RCKlx5mZuSCVz65DAawSVP
 2V2lPXKaw4IoUppuy0ahgQxxXDkmDvZgDA90t0eLeGzeLuknBN1M03PargsS9ig4sji/
 serA==
X-Gm-Message-State: AC+VfDwMXjrGCAHJJMtXPQ+0E+6A8/OeBVt3/8WUudiT+VclUb0b5oKJ
 3KiqpuRZ8QiMe/Un+uvd0DyBhMPUptQ+sKtawiIrwrxolf1LWIsazv46zqxqATc6JgYPGfralpl
 BtDIonuCeoSMCarw=
X-Received: by 2002:a05:600c:2059:b0:3f4:2492:a91f with SMTP id
 p25-20020a05600c205900b003f42492a91fmr18797017wmg.27.1684139836181; 
 Mon, 15 May 2023 01:37:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4V8AdE31YXbbh5LUsOZo0YOCm55lq5sQwxn34D33ztABCIkVy/ka4Lf2N/QnoQJ3cR41d/Jg==
X-Received: by 2002:a05:600c:2059:b0:3f4:2492:a91f with SMTP id
 p25-20020a05600c205900b003f42492a91fmr18796999wmg.27.1684139835765; 
 Mon, 15 May 2023 01:37:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a1c4b11000000b003f4fbd9cdb3sm7239459wma.34.2023.05.15.01.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 01:37:15 -0700 (PDT)
Message-ID: <cecbe93e-b384-2524-0c62-7aed496edc17@redhat.com>
Date: Mon, 15 May 2023 10:37:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v3 04/10] hw/arm/smmuv3: Add page table walk for
 stage-2
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org
References: <20230401104953.1325983-1-smostafa@google.com>
 <20230401104953.1325983-5-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230401104953.1325983-5-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.93, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/1/23 12:49, Mostafa Saleh wrote:
> In preparation for adding stage-2 support, add Stage-2 PTW code.
> Only Aarch64 format is supported as stage-1.
>
> Nesting stage-1 and stage-2 is not supported right now.
>
> HTTU is not supported, SW is expected to maintain the Access flag.
> This is described in the SMMUv3 manual(IHI 0070.E)
nit the exact version might be E.a.
> "5.2. Stream Table Entry" in "[181] S2AFFD".
> This flag determines the behavior on access of a stage-2 page whose
> descriptor has AF == 0:
> - 0b0: An Access flag fault occurs (stall not supported).
> - 0b1: An Access flag fault never occurs.
> An Access fault takes priority over a Permission fault.
>
> There are 3 address size checks for stage-2 according to "IHI 0070.E"
> in "3.4. Address sizes".
> - As nesting is not supported, input address is passed directly to
> stage-2, and is checked against IAS.
> We use cfg->oas to hold the OAS when stage-1 is not used, this is set
> in the next patch.
> This check is done outside of smmu_ptw_64_s2 as it is not part of
> stage-2(it throws stage-1 fault), and the stage-2 function shouldn't
> change it's behavior when nesting is supported.
> When nesting is supported and we figure out how to combine TLB for
> stage-1 and stage-2 we can move this check into the stage-1 function
> as described in ARM DDI0487I.a in pseudocode
> aarch64/translation/vmsa_translation/AArch64.S1Translate
> aarch64/translation/vmsa_translation/AArch64.S1DisabledOutput
>
> - Input to stage-2 is checked against s2t0sz, and throws stage-2
> transaltion fault if exceeds it.
>
> - Output of stage-2 is checked against effective PA output range.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
> Changes in v3:
> - Fix IPA address size check.
> - s2cfg.oas renamed to s2cfg.eff_ps.
> - s/iova/ipa
> - s/ap/s2ap
> - s/gran/granule_sz
> - use level_shift instead of inline code.
> - Add missing brackets in is_permission_fault_s2.
> - Use new VMSA_* macros and functions instead of SMMU_*
> - Rename pgd_idx to pgd_concat_idx.
> - Move SMMU_MAX_S2_CONCAT to STE patch as it is not used here.
> Changes in v2:
> - Squash S2AFF PTW code.
> - Use common functions between stage-1 and stage-2.
> - Add checks for IPA and out PA.
> ---
>  hw/arm/smmu-common.c   | 142 ++++++++++++++++++++++++++++++++++++++++-
>  hw/arm/smmu-internal.h |  35 ++++++++++
>  2 files changed, 176 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 50391a8c94..a4ebd004c5 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -363,6 +363,127 @@ error:
>      return -EINVAL;
>  }
>  
> +/**
> + * smmu_ptw_64_s2 - VMSAv8-64 Walk of the page tables for a given ipa
> + * for stage-2.
> + * @cfg: translation config
> + * @ipa: ipa to translate
> + * @perm: access type
> + * @tlbe: SMMUTLBEntry (out)
> + * @info: handle to an error info
> + *
> + * Return 0 on success, < 0 on error. In case of error, @info is filled
> + * and tlbe->perm is set to IOMMU_NONE.
> + * Upon success, @tlbe is filled with translated_addr and entry
> + * permission rights.
> + */
> +static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
> +                          dma_addr_t ipa, IOMMUAccessFlags perm,
> +                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> +{
> +    const int stage = 2;
> +    int granule_sz = cfg->s2cfg.granule_sz;
> +    /* ARM DDI0487I.a: Table D8-7. */
> +    int inputsize = 64 - cfg->s2cfg.tsz;
> +    int level = get_start_level(cfg->s2cfg.sl0, granule_sz);
> +    int stride = VMSA_STRIDE(granule_sz);
> +    int idx = pgd_concat_idx(level, granule_sz, ipa);
> +    /*
> +     * Get the ttb from concatenated structure.
> +     * The offset is the idx * size of each ttb(number of ptes * (sizeof(pte))
> +     */
> +    uint64_t baseaddr = extract64(cfg->s2cfg.vttb, 0, 48) + (1 << stride) *
> +                                  idx * sizeof(uint64_t);
> +    dma_addr_t indexmask = VMSA_IDXMSK(inputsize, stride, level);
> +
> +    baseaddr &= ~indexmask;
> +
> +    /*
> +     * On input, a stage 2 Translation fault occurs if the IPA is outside the
> +     * range configured by the relevant S2T0SZ field of the STE.
> +     */
> +    if (ipa >= (1ULL << inputsize)) {
> +        info->type = SMMU_PTW_ERR_TRANSLATION;
> +        goto error;
> +    }
> +
> +    while (level < VMSA_LEVELS) {
> +        uint64_t subpage_size = 1ULL << level_shift(level, granule_sz);
> +        uint64_t mask = subpage_size - 1;
> +        uint32_t offset = iova_level_offset(ipa, inputsize, level, granule_sz);
> +        uint64_t pte, gpa;
> +        dma_addr_t pte_addr = baseaddr + offset * sizeof(pte);
> +        uint8_t s2ap;
> +
> +        if (get_pte(baseaddr, offset, &pte, info)) {
> +                goto error;
> +        }
> +        trace_smmu_ptw_level(stage, level, ipa, subpage_size,
> +                             baseaddr, offset, pte);
> +        if (is_invalid_pte(pte) || is_reserved_pte(pte, level)) {
> +            trace_smmu_ptw_invalid_pte(stage, level, baseaddr,
> +                                       pte_addr, offset, pte);
> +            break;
> +        }
> +
> +        if (is_table_pte(pte, level)) {
> +            baseaddr = get_table_pte_address(pte, granule_sz);
> +            level++;
> +            continue;
> +        } else if (is_page_pte(pte, level)) {
> +            gpa = get_page_pte_address(pte, granule_sz);
> +            trace_smmu_ptw_page_pte(stage, level, ipa,
> +                                    baseaddr, pte_addr, pte, gpa);
> +        } else {
> +            uint64_t block_size;
> +
> +            gpa = get_block_pte_address(pte, level, granule_sz,
> +                                        &block_size);
> +            trace_smmu_ptw_block_pte(stage, level, baseaddr,
> +                                     pte_addr, pte, ipa, gpa,
> +                                     block_size >> 20);
> +        }
> +
> +        /*
> +         * If S2AFFD and PTE.AF are 0 => fault. (5.2. Stream Table Entry)
> +         * An Access fault takes priority over a Permission fault.
> +         */
> +        if (!PTE_AF(pte) && !cfg->s2cfg.affd) {
> +            info->type = SMMU_PTW_ERR_ACCESS;
> +            goto error;
> +        }
> +
> +        s2ap = PTE_AP(pte);
> +        if (is_permission_fault_s2(s2ap, perm)) {
> +            info->type = SMMU_PTW_ERR_PERMISSION;
> +            goto error;
> +        }
> +
> +        /*
> +         * The address output from the translation causes a stage 2 Address
> +         * Size fault if it exceeds the effective PA output range.
> +         */
> +        if (gpa >= (1ULL << cfg->s2cfg.eff_ps)) {
> +            info->type = SMMU_PTW_ERR_ADDR_SIZE;
> +            goto error;
> +        }
> +
> +        tlbe->entry.translated_addr = gpa;
> +        tlbe->entry.iova = ipa & ~mask;
> +        tlbe->entry.addr_mask = mask;
> +        tlbe->entry.perm = s2ap;
> +        tlbe->level = level;
> +        tlbe->granule = granule_sz;
> +        return 0;
> +    }
> +    info->type = SMMU_PTW_ERR_TRANSLATION;
> +
> +error:
> +    info->stage = 2;
> +    tlbe->entry.perm = IOMMU_NONE;
> +    return -EINVAL;
> +}
> +
>  /**
>   * smmu_ptw - Walk the page tables for an IOVA, according to @cfg
>   *
> @@ -377,7 +498,26 @@ error:
>  int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>               SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
>  {
> -    return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
> +    if (cfg->stage == 1) {
> +        return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
> +    } else if (cfg->stage == 2) {
> +        /*
> +         * If bypassing stage 1(or unimplemented), the input address is passed
> +         * directly to stage 2 as IPA. If the input address of a transaction
> +         * exceeds the size of the IAS, a stage 1 Address Size fault occurs.
> +         * For AA64, IAS = OAS according to (IHI 0070.E) "3.4 Address sizes"
> +         */
> +        if (iova >= (1ULL << cfg->oas)) {
> +            info->type = SMMU_PTW_ERR_ADDR_SIZE;
> +            info->stage = 1;
> +            tlbe->entry.perm = IOMMU_NONE;
> +            return -EINVAL;
> +        }
> +
> +        return smmu_ptw_64_s2(cfg, iova, perm, tlbe, info);
> +    }
> +
> +    g_assert_not_reached();
>  }
>  
>  /**
> diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
> index 2d75b31953..a9454f914e 100644
> --- a/hw/arm/smmu-internal.h
> +++ b/hw/arm/smmu-internal.h
> @@ -66,6 +66,8 @@
>  #define PTE_APTABLE(pte) \
>      (extract64(pte, 61, 2))
>  
> +#define PTE_AF(pte) \
> +    (extract64(pte, 10, 1))
>  /*
>   * TODO: At the moment all transactions are considered as privileged (EL1)
>   * as IOMMU translation callback does not pass user/priv attributes.
> @@ -73,6 +75,9 @@
>  #define is_permission_fault(ap, perm) \
>      (((perm) & IOMMU_WO) && ((ap) & 0x2))
>  
> +#define is_permission_fault_s2(s2ap, perm) \
> +    (!(((s2ap) & (perm)) == (perm)))
> +
>  #define PTE_AP_TO_PERM(ap) \
>      (IOMMU_ACCESS_FLAG(true, !((ap) & 0x2)))
>  
> @@ -96,6 +101,36 @@ uint64_t iova_level_offset(uint64_t iova, int inputsize,
>              MAKE_64BIT_MASK(0, gsz - 3);
>  }
>  
> +/* FEAT_LPA2 and FEAT_TTST are not implemented. */
> +static inline int get_start_level(int sl0 , int granule_sz)
> +{
> +    /* ARM DDI0487I.a: Table D8-12. */
> +    if (granule_sz == 12) {
> +        return 2 - sl0;
> +    }
> +    /* ARM DDI0487I.a: Table D8-22 and Table D8-31. */
> +    return 3 - sl0;
> +}
> +
> +/*
> + * Index in a concatenated first level stage-2 page table.
> + * ARM DDI0487I.a: D8.2.2 Concatenated translation tables.
> + */
> +static inline int pgd_concat_idx(int start_level, int granule_sz,
> +                                 dma_addr_t ipa)
> +{
> +    uint64_t ret;
> +    /*
> +     * Get the number of bits handled by next levels, then any extra bits in
> +     * the address should index the concatenated tables. This relation can be
> +     * deduced from tables in ARM DDI0487I.a: D8.2.7-9
> +     */
> +    int shift =  level_shift(start_level - 1, granule_sz);
> +
> +    ret = ipa >> shift;
> +    return ret;
> +}
> +
>  #define SMMU_IOTLB_ASID(key) ((key).asid)
>  
>  typedef struct SMMUIOTLBPageInvInfo {
Besides

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric


