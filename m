Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36D8702E7B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:39:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXsa-0000Io-E8; Mon, 15 May 2023 09:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pyXrX-0005Fy-Q9
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:03:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pyXrV-0001BS-GU
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:03:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684155815;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tSE4Ah9B8k8og44x82RDuelRO/3Z0f47L+mLzgmKGc8=;
 b=co3ATIx3c/9Wrwp4z3S1U0UhRmYIF7NYLJGnsnx8cuYA51vgQF+be4G/o3YDMpMAB7r7ve
 KpqX8JnOYPophHYAoa2CiwiSHwOfDN7KLXdNLEITmmH+6aTm79sWfRaQ9pCtjInDTSHZKa
 1JQ60qkUi35XuwhHyrsbde4Ifgiay10=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-4v4lsAcfM0KhpcrlDGeGYQ-1; Mon, 15 May 2023 09:03:34 -0400
X-MC-Unique: 4v4lsAcfM0KhpcrlDGeGYQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f4f2f5098bso20514835e9.1
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 06:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684155812; x=1686747812;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tSE4Ah9B8k8og44x82RDuelRO/3Z0f47L+mLzgmKGc8=;
 b=K5mNqRRmUX//v8v2n6CZzHJryJzRLJhnXvnivSxa/+DL/7YFqsSaQ26roY8rVaC6JZ
 QB7CojPZsGXWE/kByq4TK741hj7sJ+C6AJSkTzU6vcAOlSJ+RcZwi9p8PxiAU4BdUHuH
 g38FbzpPBXv5Xh0Na0pKb/t+52Xa5fnThvsouKV13tDv8gTMIPeLbkrkPsteLS1D1mXp
 6796SBO29K5Bas3b0SjRGeC80QuYueCUkAkJo2iavFzPaXF71MJZOzXV3HAKqUP5IeUF
 JC1u+HftDW5tlTCAreqoSt0U7fLf9A11AB8P5ifTtoJYKb4cGd90TBaooy+P3+6PCqE/
 V3fQ==
X-Gm-Message-State: AC+VfDzcH0qp3R8tR60wBodFJ9O17P7BGurTaOjKTn+Dx5MjlHO95XGw
 h1e61b1HvQhr/w8XsPQKp3aj4J6STqrcYVy9I2FT4rwAIwx8Am0r8kaxvJzkTEA8C4gR07gkeIG
 OzRlMCLKSOjgHc38=
X-Received: by 2002:a7b:c38f:0:b0:3f4:ef34:fbc2 with SMTP id
 s15-20020a7bc38f000000b003f4ef34fbc2mr10132859wmj.24.1684155811610; 
 Mon, 15 May 2023 06:03:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6lwouT5JNypHW+wP6WwCQsDvW3kllWRiEzveGaSZdSo40TdTKUuRcb0WDvSse9fOPYjDNe+A==
X-Received: by 2002:a7b:c38f:0:b0:3f4:ef34:fbc2 with SMTP id
 s15-20020a7bc38f000000b003f4ef34fbc2mr10132801wmj.24.1684155810448; 
 Mon, 15 May 2023 06:03:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a5d4104000000b00304832cd960sm32554189wrp.10.2023.05.15.06.03.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 06:03:29 -0700 (PDT)
Message-ID: <c5b495d4-8679-8190-9966-d3ab82cb1a6d@redhat.com>
Date: Mon, 15 May 2023 15:03:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v3 05/10] hw/arm/smmuv3: Parse STE config for stage-2
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org
References: <20230401104953.1325983-1-smostafa@google.com>
 <20230401104953.1325983-6-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230401104953.1325983-6-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.811, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> Parse stage-2 configuration from STE and populate it in SMMUS2Cfg.
> Validity of field values are checked when possible.
>
> Only AA64 tables are supported and Small Translation Tables (STT) are
> not supported.
>
> According to SMMUv3 UM(IHI0070E) "5.2 Stream Table Entry": All fields
> with an S2 prefix (with the exception of S2VMID) are IGNORED when
> stage-2 bypasses translation (Config[1] == 0).
>
> Which means that VMID can be used(for TLB tagging) even if stage-2 is
> bypassed, so we parse it unconditionally when S2P exists. Otherwise
> it is set to -1.(only S1P)
>
> As stall is not supported, if S2S is set the translation would abort.
> For S2R, we reuse the same code used for stage-1 with flag
> record_faults. However when nested translation is supported we would
> need to separate stage-1 and stage-2 faults.
>
> Fix wrong shift in STE_S2HD, STE_S2HA, STE_S2S.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
> Changes in V3:
> - Separate fault handling.
> - Fix shift in STE_S2HD, STE_S2HA, STE_S2S, STE_S2R.
> - Rename t0sz_valid to s2t0sz_valid.
> - separate stage-2 STE parsing in decode_ste_s2_cfg.
> - Add a log for invalid S2ENDI and S2TTB.
> - Set default value for stage-1 OAS.
> - Move and rename SMMU_MAX_S2_CONCAT to VMSA_MAX_S2_CONCAT.
> Changes in V2:
> - Parse S2PS and S2ENDI
> - Squash with S2VMID parsing patch
> - Squash with S2AFF parsing
> - Squash with fault reporting patch
> - Add check for S2T0SZ
> - Renaming and refactoring code
> ---
>  hw/arm/smmuv3-internal.h     |  10 +-
>  hw/arm/smmuv3.c              | 188 +++++++++++++++++++++++++++++++++--
>  include/hw/arm/smmu-common.h |   1 +
>  include/hw/arm/smmuv3.h      |   3 +
>  4 files changed, 192 insertions(+), 10 deletions(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 183d5ac8dc..6d1c1edab7 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -526,9 +526,13 @@ typedef struct CD {
>  #define STE_S2TG(x)        extract32((x)->word[5], 14, 2)
>  #define STE_S2PS(x)        extract32((x)->word[5], 16, 3)
>  #define STE_S2AA64(x)      extract32((x)->word[5], 19, 1)
> -#define STE_S2HD(x)        extract32((x)->word[5], 24, 1)
> -#define STE_S2HA(x)        extract32((x)->word[5], 25, 1)
> -#define STE_S2S(x)         extract32((x)->word[5], 26, 1)
> +#define STE_S2ENDI(x)      extract32((x)->word[5], 20, 1)
> +#define STE_S2AFFD(x)      extract32((x)->word[5], 21, 1)
> +#define STE_S2HD(x)        extract32((x)->word[5], 23, 1)
> +#define STE_S2HA(x)        extract32((x)->word[5], 24, 1)
> +#define STE_S2S(x)         extract32((x)->word[5], 25, 1)
> +#define STE_S2R(x)         extract32((x)->word[5], 26, 1)
> +
>  #define STE_CTXPTR(x)                                           \
>      ({                                                          \
>          unsigned long addr;                                     \
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 4e90343996..0f5429aed8 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -33,6 +33,16 @@
>  #include "smmuv3-internal.h"
>  #include "smmu-internal.h"
>  
> +/* If stage-1 fault enabled and ptw event targets it. */
> +#define PTW_FAULT_S1(cfg, event)            ((cfg)->record_faults && \
> +                                             !(event).u.f_walk_eabt.s2)
> +/* If stage-2 fault enabled and ptw event targets it. */
> +#define PTW_FAULT_S2(cfg, event)            ((cfg)->s2cfg.record_faults && \
> +                                             (event).u.f_walk_eabt.s2)
> +
> +#define PTW_FAULT_ALLOWED(cfg, event)       (PTW_FAULT_S1(cfg, event) || \
> +                                             PTW_FAULT_S2(cfg, event))
The name of the macro does not really reflect what it tests. I would
suggest PTW_RECORD_FAULT and PTW_RECORD_S1|S2_FAULT
I would also suggest (cfg->stage == 1) ?  PTW_RECORD_S1_FAULT(cfg,
event) :  PTW_RECORD_S2_FAULT(cfg, event)

PTW_FAULT_S1() and PTW_FAULT_S2() are not used anywhere else.

I would simplify PTW_RECORD_FAULT(cfg)  (cfg->stage == 1) ?
(cfg)->record_faults:  (cfg)->s2cfg.record_faults
> +
>  /**
>   * smmuv3_trigger_irq - pulse @irq if enabled and update
>   * GERROR register in case of GERROR interrupt
> @@ -329,11 +339,141 @@ static int smmu_get_cd(SMMUv3State *s, STE *ste, uint32_t ssid,
>      return 0;
>  }
>  
> +/*
> + * Max valid value is 39 when SMMU_IDR3.STT == 0.
> + * In architectures after SMMUv3.0:
> + * - If STE.S2TG selects a 4KB or 16KB granule, the minimum valid value for this
> + * field is MAX(16, 64-IAS)
nit: maybe indent with the if
> + * - If STE.S2TG selects a 64KB granule, the minimum valid value for this field
> + * is (64-IAS).
ditto
> + * As we only support AA64, IAS = OAS.
> + */
> +static bool s2t0sz_valid(SMMUTransCfg *cfg)
> +{
> +    if (cfg->s2cfg.tsz > 39) {
> +        return false;
> +    }
> +
> +    if (cfg->s2cfg.granule_sz == 16) {
> +        return (cfg->s2cfg.tsz >= 64 - oas2bits(SMMU_IDR5_OAS));
> +    }
> +
> +    return (cfg->s2cfg.tsz >= MAX(64 - oas2bits(SMMU_IDR5_OAS), 16));
> +}
> +
> +/*
> + * Return true if s2 page table config is valid.
> + * This checks with the configured start level, ias_bits and granularity we can
> + * have a valid page table as described in ARM ARM D8.2 Translation process.
> + * The idea here is to see for the highest possible number of IPA bits, how
> + * many concatenated tables we would need, if it is more than 16, then this is
> + * not possible.
> + */
> +static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
> +{
> +    int level = get_start_level(sl0, gran);
> +    uint64_t ipa_bits = 64 - t0sz;
> +    uint64_t max_ipa = (1ULL << ipa_bits) - 1;
> +    int nr_concat = pgd_concat_idx(level, gran, max_ipa) + 1;
> +
> +    return nr_concat <= VMSA_MAX_S2_CONCAT;
> +}
> +
> +static int decode_ste_s2_cfg(SMMUTransCfg *cfg, STE *ste)
> +{
> +    cfg->stage = 2;
> +
> +    if (STE_S2AA64(ste) == 0x0) {
> +        qemu_log_mask(LOG_UNIMP,
> +                      "SMMUv3 AArch32 tables not supported\n");
> +        g_assert_not_reached();
> +    }
> +
> +    switch (STE_S2TG(ste)) {
> +    case 0x0: /* 4KB */
> +        cfg->s2cfg.granule_sz = 12;
> +        break;
> +    case 0x1: /* 64KB */
> +        cfg->s2cfg.granule_sz = 16;
> +        break;
> +    case 0x2: /* 16KB */
> +        cfg->s2cfg.granule_sz = 14;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "SMMUv3 bad STE S2TG: %x\n", STE_S2TG(ste));
> +        goto bad_ste;
> +    }
> +
> +    cfg->s2cfg.vttb = STE_S2TTB(ste);
> +
> +    cfg->s2cfg.sl0 = STE_S2SL0(ste);
> +    /* FEAT_TTST not supported. */
> +    if (cfg->s2cfg.sl0 == 0x3) {
> +        qemu_log_mask(LOG_UNIMP, "SMMUv3 S2SL0 = 0x3 has no meaning!\n");
> +        goto bad_ste;
> +    }
> +
> +    /* For AA64, The effective S2PS size is capped to the OAS. */
> +    cfg->s2cfg.eff_ps = oas2bits(MIN(STE_S2PS(ste), SMMU_IDR5_OAS));
> +    /*
> +     * It is ILLEGAL for the address in S2TTB to be outside the range
> +     * described by the effective S2PS value.
> +     */
> +    if (cfg->s2cfg.vttb & ~(MAKE_64BIT_MASK(0, cfg->s2cfg.eff_ps))) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "SMMUv3 S2TTB too large 0x%lx, effective PS %d bits\n",
> +                      cfg->s2cfg.vttb,  cfg->s2cfg.eff_ps);
> +        goto bad_ste;
> +    }
> +
> +    cfg->s2cfg.tsz = STE_S2T0SZ(ste);
> +
> +    if (!s2t0sz_valid(cfg)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "SMMUv3 bad STE S2T0SZ = %d\n",
> +                      cfg->s2cfg.tsz);
> +        goto bad_ste;
> +    }
> +
> +    if (!s2_pgtable_config_valid(cfg->s2cfg.sl0, cfg->s2cfg.tsz,
> +                                    cfg->s2cfg.granule_sz)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "SMMUv3 STE stage 2 config not valid!\n");
> +        goto bad_ste;
> +    }
> +
> +    /* Only LE supported(IDR0.TTENDIAN). */
> +    if (STE_S2ENDI(ste)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "SMMUv3 STE_S2ENDI only supports LE!\n");
> +        goto bad_ste;
> +    }
> +
> +    cfg->s2cfg.affd = STE_S2AFFD(ste);
> +
> +    cfg->s2cfg.record_faults = STE_S2R(ste);
> +    /* As stall is not supported. */
> +    if (STE_S2S(ste)) {
> +        qemu_log_mask(LOG_UNIMP, "SMMUv3 Stall not implemented!\n");
> +        goto bad_ste;
> +    }
> +
> +    /* This is still here as stage 2 has not been fully enabled yet. */
> +    qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
> +    goto bad_ste;
> +
> +    return 0;
> +
> +bad_ste:
> +    return -EINVAL;
> +}
> +
>  /* Returns < 0 in case of invalid STE, 0 otherwise */
>  static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>                        STE *ste, SMMUEventInfo *event)
>  {
>      uint32_t config;
> +    int ret;
>  
>      if (!STE_VALID(ste)) {
>          if (!event->inval_ste_allowed) {
> @@ -354,11 +494,39 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>          return 0;
>      }
>  
> -    if (STE_CFG_S2_ENABLED(config)) {
> -        qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
> +    /*
> +     * If a stage is enabled in SW while not advertised, throw bad ste
> +     * according to user manual(IHI0070E) "5.2 Stream Table Entry".
> +     */
> +    if (!STAGE1_SUPPORTED(s) && STE_CFG_S1_ENABLED(config)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "SMMUv3 S1 used but not supported.\n");
> +        goto bad_ste;
> +    }
> +    if (!STAGE2_SUPPORTED(s) && STE_CFG_S2_ENABLED(config)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "SMMUv3 S2 used but not supported.\n");
>          goto bad_ste;
>      }
>  
> +    if (STAGE2_SUPPORTED(s)) {
> +        /* VMID is considered even if s2 is disabled. */
> +        cfg->s2cfg.vmid = STE_S2VMID(ste);
> +    } else {
> +        /* Default to -1 */
> +        cfg->s2cfg.vmid = -1;
> +    }
> +
> +    if (STE_CFG_S2_ENABLED(config)) {
> +        /*
> +         * Stage-1 OAS defaults to OAS even if not enabled as it would be used
> +         * in input address check for stage-2.
> +         */
> +        cfg->oas = oas2bits(SMMU_IDR5_OAS);
> +        ret = decode_ste_s2_cfg(cfg, ste);
> +        if (ret) {
> +            goto bad_ste;
> +        }
> +    }
> +
>      if (STE_S1CDMAX(ste) != 0) {
>          qemu_log_mask(LOG_UNIMP,
>                        "SMMUv3 does not support multiple context descriptors yet\n");
> @@ -702,7 +870,13 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>      if (cached_entry) {
>          if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
>              status = SMMU_TRANS_ERROR;
> -            if (cfg->record_faults) {
> +            /*
> +             * We know that the TLB only contains either stage-1 or stage-2 as
> +             * nesting is not supported. So it is sufficient to check the
> +             * translation stage to know the TLB stage for now.
> +             */
> +            event.u.f_walk_eabt.s2 = (cfg->stage == 2);
> +            if (PTW_FAULT_ALLOWED(cfg, event)) {
>                  event.type = SMMU_EVT_F_PERMISSION;
>                  event.u.f_permission.addr = addr;
>                  event.u.f_permission.rnw = flag & 0x1;
> @@ -728,28 +902,28 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>              event.u.f_walk_eabt.addr2 = ptw_info.addr;
>              break;
>          case SMMU_PTW_ERR_TRANSLATION:
> -            if (cfg->record_faults) {
> +            if (PTW_FAULT_ALLOWED(cfg, event)) {
>                  event.type = SMMU_EVT_F_TRANSLATION;
>                  event.u.f_translation.addr = addr;
>                  event.u.f_translation.rnw = flag & 0x1;
>              }
>              break;
>          case SMMU_PTW_ERR_ADDR_SIZE:
> -            if (cfg->record_faults) {
> +            if (PTW_FAULT_ALLOWED(cfg, event)) {
>                  event.type = SMMU_EVT_F_ADDR_SIZE;
>                  event.u.f_addr_size.addr = addr;
>                  event.u.f_addr_size.rnw = flag & 0x1;
>              }
>              break;
>          case SMMU_PTW_ERR_ACCESS:
> -            if (cfg->record_faults) {
> +            if (PTW_FAULT_ALLOWED(cfg, event)) {
>                  event.type = SMMU_EVT_F_ACCESS;
>                  event.u.f_access.addr = addr;
>                  event.u.f_access.rnw = flag & 0x1;
>              }
>              break;
>          case SMMU_PTW_ERR_PERMISSION:
> -            if (cfg->record_faults) {
> +            if (PTW_FAULT_ALLOWED(cfg, event)) {
>                  event.type = SMMU_EVT_F_PERMISSION;
>                  event.u.f_permission.addr = addr;
>                  event.u.f_permission.rnw = flag & 0x1;
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 97cea8ea06..4f1405d4e4 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -29,6 +29,7 @@
>  
>  /* VMSAv8-64 Translation constants and functions */
>  #define VMSA_LEVELS                         4
> +#define VMSA_MAX_S2_CONCAT                  16
>  
>  #define VMSA_STRIDE(gran)                   ((gran) - VMSA_LEVELS + 1)
>  #define VMSA_BIT_LVL(isz, strd, lvl)        ((isz) - (strd) * \
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index a0c026402e..6031d7d325 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -83,4 +83,7 @@ struct SMMUv3Class {
>  #define TYPE_ARM_SMMUV3   "arm-smmuv3"
>  OBJECT_DECLARE_TYPE(SMMUv3State, SMMUv3Class, ARM_SMMUV3)
>  
> +#define STAGE1_SUPPORTED(s)      FIELD_EX32(s->idr[0], IDR0, S1P)
> +#define STAGE2_SUPPORTED(s)      FIELD_EX32(s->idr[0], IDR0, S2P)
> +
>  #endif
Thanks

Eric


