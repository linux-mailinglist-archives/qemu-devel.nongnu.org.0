Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C91696C17A9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 16:16:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peHE0-0001P4-Lc; Mon, 20 Mar 2023 11:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1peHDv-0001O0-HA
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:14:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1peHDt-0002Bw-Fj
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:14:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679325296;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9704uFkS13kobmIrI/iVy8sLmlOw+uneTDbqmfJ/xV8=;
 b=V9/cPIRf3eF404I8Ugvl0FyEFPZlPXBUsebweMMLFi9WSQx4/0zO7ox/KPrz3utVxk9Opu
 annVYjHxzIC4y3AU4mVX96JpqemkxF1XDeUkyf94sf4NukhtYAYgXOK6N4iDjIwqPAxz9b
 fEPbv+wt9l6G98SpjBKn7hWOrEuwqXY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-6U4OdYm4OXe8Uw4rT7xJZg-1; Mon, 20 Mar 2023 11:14:55 -0400
X-MC-Unique: 6U4OdYm4OXe8Uw4rT7xJZg-1
Received: by mail-qt1-f200.google.com with SMTP id
 i2-20020ac84882000000b003d6fee1d438so7075387qtq.1
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 08:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679325293;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9704uFkS13kobmIrI/iVy8sLmlOw+uneTDbqmfJ/xV8=;
 b=i/bY4L99cQWkp8Ie6cioAd5UmfhzEAo4H7QkfRaKqSkQinRfmvdR2XVYLmqtHO6PCl
 lDMWDoB+9OqqtqtJ5NPmnkKnEzObK4tJNUWHTfABcl3JDmq7qZz18yVtGCsXGX3I3bCZ
 tjf3mk4gt7DVPNgsHjTA0u5P3OadF6HijRrHlGqKpJouNh1Kji2Jg9BU8pDizwyUaUf9
 6cghQjDDWBBNQVyeJiIk0ty3cLWY3QL8iMFmHRs6mZXJ8DzGukldrGqUvrqXWqApsHLA
 FcRf4WDHjXFG7tZpOSe1LdQ+lfDto6fW5mjWB9L327OzcsppEKrVqjga7e9SVx8Urijq
 wBBw==
X-Gm-Message-State: AO0yUKVMW5L9zD0amHNg5IyLV4/y3aoCZ/WneAfqG9P7xUC2/ItDG2CV
 iEgpM2BTjpxxumzCQQ+soOBjfd0AApz7j+V9d09xPv1KDnouNOZs88HGvQryqakOUJrfjHWACcv
 Lt4Ug+YWf9x5pF2Cagz134sI=
X-Received: by 2002:ac8:5acf:0:b0:3da:aa9b:105a with SMTP id
 d15-20020ac85acf000000b003daaa9b105amr19541464qtd.17.1679325292594; 
 Mon, 20 Mar 2023 08:14:52 -0700 (PDT)
X-Google-Smtp-Source: AK7set8Q2eq1CXTbLmfTdWNOYx26usr42jCNH5oL5T7guHBxmoXs6ZWe5DBAjMcAl2tX5GWU1+Wipw==
X-Received: by 2002:ac8:5acf:0:b0:3da:aa9b:105a with SMTP id
 d15-20020ac85acf000000b003daaa9b105amr19541414qtd.17.1679325292147; 
 Mon, 20 Mar 2023 08:14:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 q6-20020ac87346000000b003df5fd89e21sm3288301qtp.0.2023.03.20.08.14.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 08:14:51 -0700 (PDT)
Message-ID: <de65ac97-7566-98a1-052c-f175a950e995@redhat.com>
Date: Mon, 20 Mar 2023 16:14:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v2 05/11] hw/arm/smmuv3: Parse STE config for stage-2
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-6-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230226220650.1480786-6-smostafa@google.com>
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
> Parse stage-2 configuration from STE and populate it in SMMUS2Cfg.
> Validity of these value are checked when possible.
s/these value/field values
>
> Only AA64 tables are supported and STT is not supported.
Small Translation Tables (STT)
>
> According to SMMUv3 user manual "5.2 Stream Table Entry": All fields
it is not a user manual but rather an IP architecture spec. put the full
ref?
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
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
> Changes in V2:
> - Parse S2PS and S2ENDI
> - Squash with S2VMID parsing patch
> - Squash with S2AFF parsing
> - Squash with fault reporting patch
> - Add check for S2T0SZ
> - Renaming and refactoring code
> ---
>  hw/arm/smmuv3-internal.h |   4 ++
>  hw/arm/smmuv3.c          | 138 +++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/smmuv3.h  |   3 +
>  3 files changed, 145 insertions(+)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 183d5ac8dc..3388e1a5f8 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -526,9 +526,13 @@ typedef struct CD {
>  #define STE_S2TG(x)        extract32((x)->word[5], 14, 2)
>  #define STE_S2PS(x)        extract32((x)->word[5], 16, 3)
>  #define STE_S2AA64(x)      extract32((x)->word[5], 19, 1)
> +#define STE_S2ENDI(x)      extract32((x)->word[5], 20, 1)
> +#define STE_S2AFFD(x)      extract32((x)->word[5], 21, 1)
I am afraid there is a shift in the fields below. S2HD should be 23
(problem in the original code) and everything is shifted.
>  #define STE_S2HD(x)        extract32((x)->word[5], 24, 1)
>  #define STE_S2HA(x)        extract32((x)->word[5], 25, 1)
>  #define STE_S2S(x)         extract32((x)->word[5], 26, 1)
> +#define STE_S2R(x)         extract32((x)->word[5], 27, 1)
> +
>  #define STE_CTXPTR(x)                                           \
>      ({                                                          \
>          unsigned long addr;                                     \
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 4e90343996..dc74a5442d 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -329,6 +329,46 @@ static int smmu_get_cd(SMMUv3State *s, STE *ste, uint32_t ssid,
>      return 0;
>  }
>  
> +/*
> + * Max valid value is 39 when SMMU_IDR3.STT == 0.
> + * In architectures after SMMUv3.0:
> + * - If STE.S2TG selects a 4KB or 16KB granule, the minimum valid value for this
> + * field is MAX(16, 64-IAS)
> + * - If STE.S2TG selects a 64KB granule, the minimum valid value for this field
> + * is (64-IAS).
> + * As we only support AA64, IAS = OAS.
OK this comes from STE.S2T0SZ description on the SMMU arch spec. You can
add this in previous patch too.
> + */
> +static bool t0sz_valid(SMMUTransCfg *cfg)
use S2t0sz to avoid confusion with S1 stuff
> +{
> +    if (cfg->s2cfg.tsz > 39) {
> +        return false;
> +    }
> +
> +    if (cfg->s2cfg.granule_sz == 16) {
> +        return (cfg->s2cfg.tsz >= 64 - cfg->s2cfg.oas);
> +    }
> +
> +    return (cfg->s2cfg.tsz >= MAX(64 - cfg->s2cfg.oas, 16));
> +}

this chapter also states:
"The usable range of values is further constrained by a function of the
starting level set by S2SL0 and, if S2AA64 == 1, granule size set by
S2TG as described by the Armv8 translation system. Use of a value of
S2T0SZ that is inconsistent with the permitted range (given S2SL0 and
S2TG) is ILLEGAL."
> +
> +/*
> + * Return true if s2 page table config is valid.
> + * This checks with the configured start level, ias_bits and granularity we can
> + * have a valid page table as described in ARM ARM D8.2 Translation process.
> + * The idea here is to see for the highest possible number of IPA bits, how
> + * many concatenated tables we would need, if it is more than 16, then this is
> + * not possible.
why? in that case doesn't it mean that we can't use concatanated tables?
> + */
> +static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
> +{
> +    int level = get_start_level(sl0, gran);
> +    uint64_t ipa_bits = 64 - t0sz;
> +    uint64_t max_ipa = (1ULL << ipa_bits) - 1;
> +    int nr_concat = pgd_idx(level, gran, max_ipa) + 1;
> +
> +    return nr_concat <= SMMU_MAX_S2_CONCAT;
> +}
> +
>  /* Returns < 0 in case of invalid STE, 0 otherwise */
>  static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>                        STE *ste, SMMUEventInfo *event)
> @@ -354,7 +394,105 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>          return 0;
>      }
>  
> +    /*
> +     * If a stage is enabled in SW while not advertised, throw bad ste
> +     * according to SMMU manual 5.2 Stream Table Entry - [3:1] Config.
> +     */
> +    if (!STAGE1_SUPPORTED(s) && STE_CFG_S1_ENABLED(config)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "SMMUv3 S1 used but not supported.\n");
> +        goto bad_ste;
> +    }
> +    if (!STAGE2_SUPPORTED(s) && STE_CFG_S2_ENABLED(config)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "SMMUv3 S2 used but not supported.\n");
> +        goto bad_ste;
> +    }
> +
> +    if (STAGE2_SUPPORTED(s)) {
> +        /* VMID is considered even if s2 is disabled. */
> +        cfg->s2cfg.vmid = STE_S2VMID(ste);
> +    } else {
> +        /* Default to -1 */
> +        cfg->s2cfg.vmid = -1;
> +    }
> +
>      if (STE_CFG_S2_ENABLED(config)) {
I think it would improve the readability to introduce a separate
function decode_ste_s2_cftg() taking the s2cfg to be populated
> +        cfg->stage = 2;
> +
> +        if (STE_S2AA64(ste) == 0x0) {
> +            qemu_log_mask(LOG_UNIMP,
> +                          "SMMUv3 AArch32 tables not supported\n");
> +            g_assert_not_reached();
> +        }
> +
> +        switch (STE_S2TG(ste)) {
> +        case 0x0: /* 4KB */
> +            cfg->s2cfg.granule_sz = 12;
> +            break;
> +        case 0x1: /* 64KB */
> +            cfg->s2cfg.granule_sz = 16;
> +            break;
> +        case 0x2: /* 16KB */
> +            cfg->s2cfg.granule_sz = 14;
> +            break;
> +        default:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "SMMUv3 bad STE S2TG: %x\n", STE_S2TG(ste));
> +            goto bad_ste;
> +        }
> +
> +        cfg->s2cfg.vttb = STE_S2TTB(ste);
> +
> +        cfg->s2cfg.sl0 = STE_S2SL0(ste);
> +        /* FEAT_TTST not supported. */
> +        if (cfg->s2cfg.sl0 == 0x3) {
> +            qemu_log_mask(LOG_UNIMP, "SMMUv3 S2SL0 = 0x3 has no meaning!\n");
> +            goto bad_ste;
> +        }
> +
> +
> +        cfg->s2cfg.oas = oas2bits(MIN(STE_S2PS(ste), SMMU_IDR5_OAS));
> +        /*
> +         * It is ILLEGAL for the address in S2TTB to be outside the range
> +         * described by the effective S2PS value.
> +         */
> +        if (cfg->s2cfg.vttb & ~(MAKE_64BIT_MASK(0, cfg->s2cfg.oas))) {
> +            goto bad_ste;
> +        }
> +
> +        cfg->s2cfg.tsz = STE_S2T0SZ(ste);
> +
> +        if (!t0sz_valid(cfg)) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "SMMUv3 bad STE S2T0SZ = %d\n",
> +                          cfg->s2cfg.tsz);
> +            goto bad_ste;
> +        }
> +
> +        if (!s2_pgtable_config_valid(cfg->s2cfg.sl0, cfg->s2cfg.tsz,
> +                                     cfg->s2cfg.granule_sz)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "SMMUv3 STE stage 2 config not valid!\n");
> +            goto bad_ste;
> +        }
> +
> +        /* Only LE supported(IDR0.TTENDIAN). */
> +        if (STE_S2ENDI(ste)) {
qemu_log
> +            goto bad_ste;
> +        }
> +
> +        cfg->s2cfg.affd = STE_S2AFFD(ste);
> +        /*
> +         * We reuse the same code used for stage-1 with flag record_faults.
> +         * However when nested translation is supported we would
> +         * need to separate stage-1 and stage-2 faults.
> +         */
> +        cfg->record_faults = STE_S2R(ste);
> +        /* As stall is not supported. */
> +        if (STE_S2S(ste)) {
> +            qemu_log_mask(LOG_UNIMP, "SMMUv3 Stall not implemented!\n");
> +            goto bad_ste;
> +        }
> +
> +        /* This is still here as stage 2 has not been fully enabled yet. */
>          qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
>          goto bad_ste;
>      }
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


