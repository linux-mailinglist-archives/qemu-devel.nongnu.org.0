Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 677C66C15BC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 15:57:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peGwB-0000pe-Jq; Mon, 20 Mar 2023 10:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1peGwA-0000pA-8H
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:56:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1peGw7-0003h9-GZ
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679324193;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tfXCN9jJAIiPhiFWLkMZvDBnksi9ZzNEgwsXDYDYKeI=;
 b=bujRsFqlur4Gv0A1VxdUuS22T2apZi4NyJw+Y3xnxIDB/O+m3R+ef3cPjQKY1LnN5CUzEa
 +hzqGRXiVLo5grML5rIauwOSWQmUl3jsNU77ns+Nmz5cTiHd42RSqYUkrkkw7DSA6uOVCk
 HNHqvBboYwJpe9lZ8n+nNzJV4xxiTCw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-vtd8RFdjPYWkGdCvTeEsfw-1; Mon, 20 Mar 2023 10:56:31 -0400
X-MC-Unique: vtd8RFdjPYWkGdCvTeEsfw-1
Received: by mail-qk1-f197.google.com with SMTP id
 66-20020a370345000000b00746886b1593so1093864qkd.14
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 07:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679324191;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tfXCN9jJAIiPhiFWLkMZvDBnksi9ZzNEgwsXDYDYKeI=;
 b=r5eW4id+szEuQ5bFeng4mvhxxADLotjydn9lSnepvJhVhaCIkyH2jwVFc+FXuj0Blz
 vM7yozcIaR1p5Txzn6886JndUh+Sd222UBymJCcoe4r80ORWAA+dStL6gJjHJza5zoX8
 NgB92k8fYSKeOJLCgBrI0rpa88uhT8Sp3Sa+0x7k1M8HaY9DlOuV1ms45OxhtDRCOK3Q
 /ylakTvJ6QsiL7A9JFeujCbb7ISDDx7V5yOOcY/WKvg/YmLBRyHpoIkKzmOFkzGsBLbl
 4nEfG35hbz3sjd6S2gKzABB3wwklh7uJZWxdP2EXE0kzrYqvbo6IZBD6Ff37WKWyL/aX
 jQWw==
X-Gm-Message-State: AO0yUKV4zxVVs7mD1xiN6H48N8+M29kAElRmseYkt+TzuID5A+KgC1hS
 9ruQnOBj4oiZq/CDAfT+RQ2WN54TRw/pb9Ou/N+YAW8Fn1i73DUvNlmJWZGePpialMp9sxPp2Vt
 hqv9/w3ZrKcADPNw=
X-Received: by 2002:a05:622a:1046:b0:3bc:dd21:4a0 with SMTP id
 f6-20020a05622a104600b003bcdd2104a0mr27460888qte.30.1679324191321; 
 Mon, 20 Mar 2023 07:56:31 -0700 (PDT)
X-Google-Smtp-Source: AK7set+EKKF7wxyabp0WKf3FLz19Oz6PQcgdvMOrBXRHMVeHbbUg/WQBv8XxMoEdKFAHwhMXjyGYEg==
X-Received: by 2002:a05:622a:1046:b0:3bc:dd21:4a0 with SMTP id
 f6-20020a05622a104600b003bcdd2104a0mr27460808qte.30.1679324190535; 
 Mon, 20 Mar 2023 07:56:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 o16-20020ac86990000000b003bf9f9f1844sm6527686qtq.71.2023.03.20.07.56.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 07:56:29 -0700 (PDT)
Message-ID: <2432f1f4-6cb8-3811-86cf-ee856fe9b3d8@redhat.com>
Date: Mon, 20 Mar 2023 15:56:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v2 04/11] hw/arm/smmuv3: Add page table walk for
 stage-2
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-5-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230226220650.1480786-5-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
> In preparation for adding stage-2 support, add Stage-2 PTW code.
> Only Aarch64 format is supported as stage-1.
>
> Nesting stage-1 and stage-2 is not supported right now.
>
> HTTU is not supported, SW is expected to maintain the Access flag.
> This is described in the SMMUv3 manual "5.2. Stream Table Entry" in
> "[181] S2AFFD".
> This flag determines the behavior on access of a stage-2 page whose
> descriptor has AF == 0:
> - 0b0: An Access flag fault occurs (stall not supported).
> - 0b1: An Access flag fault never occurs.
> An Access fault takes priority over a Permission fault.
>
> Checks for IPA and output PA are done according to the user manual
> "3.4 Address sizes".
replace user manual by the exact ref of the doc. I guess this is IHI0070E
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
> Changes in v2:
> - Squash S2AFF PTW code.
> - Use common functions between stage-1 and stage-2.
> - Add checks for IPA and out PA.
> ---
>  hw/arm/smmu-common.c   | 132 ++++++++++++++++++++++++++++++++++++++++-
>  hw/arm/smmu-internal.h |  39 ++++++++++++
>  2 files changed, 170 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index b49c1affdb..3f448bc82e 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -363,6 +363,130 @@ error:
>      return -EINVAL;
>  }
>  
> +/**
> + * smmu_ptw_64_s2 - VMSAv8-64 Walk of the page tables for a given IOVA
> + * for stage-2.
> + * @cfg: translation config
> + * @iova: iova to translate
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
> +                          dma_addr_t iova, IOMMUAccessFlags perm,
Rename iova into ipa?
> +                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> +{
> +    const int stage = 2;
> +    int granule_sz = cfg->s2cfg.granule_sz;
> +    /* ARM ARM: Table D8-7. */
You may refer the full reference
in  DDI0487I.a as the chapter/table may vary. For instance in
ARM DDI 0487F.c D8 corresponds to the activity monitor extensions
> +    int inputsize = 64 - cfg->s2cfg.tsz;
> +    int level = get_start_level(cfg->s2cfg.sl0, granule_sz);
> +    int stride = SMMU_STRIDE(granule_sz);
> +    int idx = pgd_idx(level, granule_sz, iova);
> +    /*
> +     * Get the ttb from concatenated structure.
> +     * The offset is the idx * size of each ttb(number of ptes * (sizeof(pte))
> +     */
what I don't get is the spec that concatenated tables are used if the
initial lookup level would require less or equal than 16 entries. I
don't see such kind of check or is done implicitly somewhere else?
> +    uint64_t baseaddr = extract64(cfg->s2cfg.vttb, 0, 48) + (1 << stride) *
> +                                  idx * sizeof(uint64_t);
> +    dma_addr_t indexmask = SMMU_IDXMSK(inputsize, stride, level);
> +
> +    baseaddr &= ~indexmask;
> +
> +    /*
> +     * If the input address of a transaction exceeds the size of the IAS, a
> +     * stage 1 Address Size fault occurs.
> +     * For AA64, IAS = OAS
then you may use a local variable max_as = cfg->s2cfg.oas used below and
in 

if (gpa >= (1ULL << cfg->s2cfg.oas)) {
this is not obvious though that the ias = oas. Where does it come from?

In implementations of SMMUv3.1 and later, this value is Reserved and S2PS behaves as 0b110 (52 bits).
Effective_S2PS = MIN(STE.S2PS, SMMU_IDR5.OAS);
OAS is a maximum of 52 bits in SMMUv3.1 and later

> +     */
> +    if (iova >= (1ULL << cfg->s2cfg.oas)) {
> +        info->type = SMMU_PTW_ERR_ADDR_SIZE;
> +        info->stage = 1;
> +        goto error_no_stage;
> +    }
> +
> +    while (level < SMMU_LEVELS) {
I would rename SMMU_LEVELs
> +        uint64_t subpage_size = 1ULL << level_shift(level, granule_sz);
> +        uint64_t mask = subpage_size - 1;
> +        uint32_t offset = iova_level_offset(iova, inputsize, level, granule_sz);
> +        uint64_t pte, gpa;
> +        dma_addr_t pte_addr = baseaddr + offset * sizeof(pte);
> +        uint8_t ap;
> +
> +        if (get_pte(baseaddr, offset, &pte, info)) {
> +                goto error;
> +        }
> +        trace_smmu_ptw_level(stage, level, iova, subpage_size,
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
> +            trace_smmu_ptw_page_pte(stage, level, iova,
> +                                    baseaddr, pte_addr, pte, gpa);
> +        } else {
> +            uint64_t block_size;
> +
> +            gpa = get_block_pte_address(pte, level, granule_sz,
> +                                        &block_size);
> +            trace_smmu_ptw_block_pte(stage, level, baseaddr,
> +                                     pte_addr, pte, iova, gpa,
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
> +        ap = PTE_AP(pte);
> +        if (is_permission_fault_s2(ap, perm)) {
> +            info->type = SMMU_PTW_ERR_PERMISSION;
> +            goto error;
> +        }
> +
> +        /*
> +         * The address output from the translation causes a stage 2 Address
> +         * Size fault if it exceeds the effective PA output range.
> +         */
> +        if (gpa >= (1ULL << cfg->s2cfg.oas)) {
> +            info->type = SMMU_PTW_ERR_ADDR_SIZE;
> +            goto error;
> +        }
> +
> +        tlbe->entry.translated_addr = gpa;
> +        tlbe->entry.iova = iova & ~mask;
> +        tlbe->entry.addr_mask = mask;
> +        tlbe->entry.perm = ap;
> +        tlbe->level = level;
> +        tlbe->granule = granule_sz;
> +        return 0;
> +    }
> +    info->type = SMMU_PTW_ERR_TRANSLATION;
> +
> +error:
> +    info->stage = 2;
> +error_no_stage:
> +    tlbe->entry.perm = IOMMU_NONE;
> +    return -EINVAL;
> +}
> +
>  /**
>   * smmu_ptw - Walk the page tables for an IOVA, according to @cfg
>   *
> @@ -377,7 +501,13 @@ error:
>  int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>               SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
>  {
> -    return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
> +    if (cfg->stage == 1) {
> +        return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
> +    } else if (cfg->stage == 2) {
> +        return smmu_ptw_64_s2(cfg, iova, perm, tlbe, info);
> +    }
> +
> +    g_assert_not_reached();
>  }
>  
>  /**
> diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
> index 2d75b31953..f79c389cd3 100644
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
> +#define is_permission_fault_s2(ap, perm) \
I would rename ap param into s2ap. This is the name of the field in the spec
> +    (!((ap & perm) == perm))
> +
>  #define PTE_AP_TO_PERM(ap) \
>      (IOMMU_ACCESS_FLAG(true, !((ap) & 0x2)))
>  
> @@ -96,6 +101,40 @@ uint64_t iova_level_offset(uint64_t iova, int inputsize,
>              MAKE_64BIT_MASK(0, gsz - 3);
>  }
>  
> +#define SMMU_MAX_S2_CONCAT    16
it is not really an SMMU property (same as SMMU_LEVELS by the way). This
is rather something related to VMSA spec, no?.
> +
> +/*
> + * Relies on correctness of gran and sl0 from caller.
I would remove the above line as we generally expect the caller to
behave properly or do you mean we do not handle any sanity check?
I refer to some of them in target/arm/ptw.c:check_s2_mmu_setup()
> + * FEAT_LPA2 and FEAT_TTST are not implemented.
> + */
> +static inline int get_start_level(int sl0 , int gran)
> +{
> +    /* ARM ARM: Table D8-12. */
> +    if (gran == 12) {
> +        return 2 - sl0;
> +    }
> +    /* ARM ARM: Table D8-22 and Table D8-31. */
> +    return 3 - sl0;
> +}
> +
> +/*
> + * Index in a concatenated first level stage-2 page table.
> + * ARM ARM: D8.2.2 Concatenated translation tables.
> + */
> +static inline int pgd_idx(int start_level, int granule, dma_addr_t iova)
then the name of the function may better reflect what is does?
> +{
> +    uint64_t ret;
> +    /*
> +     * Get the number of bits handled by next levels, then any extra bits in
> +     * the address should index the concatenated tables. This relation can
> +     * deduced from tables in ARM ARM: D8.2.7-9
> +     */
> +    int shift = (SMMU_LEVELS - start_level) * (granule - 3) + granule;
this looks like level_shift() with level = start_level - 1, no.
s/granule_sz/gsz or granule_sz to match the rest of the code
> +
> +    ret = iova >> shift;
> +    return ret;
> +}
> +
>  #define SMMU_IOTLB_ASID(key) ((key).asid)
>  
>  typedef struct SMMUIOTLBPageInvInfo {
Thanks

Eric


