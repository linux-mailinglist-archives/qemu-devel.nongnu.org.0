Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC57702DD8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:18:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyY5F-0005mm-NR; Mon, 15 May 2023 09:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pyY59-0005aW-DR
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:17:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pyY52-00045l-Fg
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:17:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684156655;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bVrp7bKqaEmaulYHyWvRnd/QOHI239gdpZnAyJ5DOR0=;
 b=XYLhxsfD4ClIpXB0mm0Qb7ZLUR8/jQdZEa8XdFNI7g58LKgo/YawYFYbEk08aVgJ9znm2E
 /gnkod1Ak7aQr0AwZEpTFXHyi5jE3+Bd5tY6QCUTJLjf+t3BqeRnF/kcpSzPpFXFFglZEk
 OKLfMqI4RmkhHttSnMvUoufN4sHfq/U=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-iY-t8X4lNVe9EhbDx7tFNg-1; Mon, 15 May 2023 09:17:34 -0400
X-MC-Unique: iY-t8X4lNVe9EhbDx7tFNg-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-621247fde5cso47378446d6.0
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 06:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684156653; x=1686748653;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bVrp7bKqaEmaulYHyWvRnd/QOHI239gdpZnAyJ5DOR0=;
 b=EVP6pRQ6gE4mUp6s07jW3lL/+DYV+xdS4u1ZRixcLU3/SfxBXEmnU1AWMCEFrKGy/i
 eDk3Lbb3W91VQLroBKcgH/ITNrlVco5skIkM41xlRji0M/cPVVIjGASh8zZWrISoGoLu
 ZpHsZ/JC0iuiKmDriUEOufABHNgv+V63gH+6l3BZifbUybiIoSTRZyCpIQmMbyydNiGn
 T0h0uyHrPOBkQlLDJ0jq4r1+osuW4dxMi/mQCpsWMYNWvWc1pEVG3NE4u4br34stAEWt
 l/zVFFs9we5uT0p5q5erteM/ur9GYle0cfUYcLLEpe7izrFDj87vRERamTYnFwSzoiuN
 w3vQ==
X-Gm-Message-State: AC+VfDwEddp3cVtSGpGAOPKznNQHDS+IZIkiIW7jzn6OtU94Ila75Zoc
 j4Qa1gEPzciESCpdU9kEs59Qr5lfDKqTKBglwLRHcPqrtYllTvlSR0hoRK/aLYEpZzheZx5meYb
 sFKYH3IQ8mg1Ar5o=
X-Received: by 2002:ad4:594d:0:b0:621:65de:f5f9 with SMTP id
 eo13-20020ad4594d000000b0062165def5f9mr24321311qvb.5.1684156653359; 
 Mon, 15 May 2023 06:17:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Cs/pPq9DMou5CnTAasqNb+UbWweS0UOrPJ22zJ2SGKOPwaSDYMDtsFkwWomTdP+Wj+N6eOw==
X-Received: by 2002:ad4:594d:0:b0:621:65de:f5f9 with SMTP id
 eo13-20020ad4594d000000b0062165def5f9mr24321280qvb.5.1684156653036; 
 Mon, 15 May 2023 06:17:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a0cf247000000b0061b75f3d9bcsm4920156qvl.38.2023.05.15.06.17.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 06:17:32 -0700 (PDT)
Message-ID: <dfdc1e2f-4b9c-28f5-22b3-3a19f9c58844@redhat.com>
Date: Mon, 15 May 2023 15:17:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v3 08/10] hw/arm/smmuv3: Add CMDs related to stage-2
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org
References: <20230401104953.1325983-1-smostafa@google.com>
 <20230401104953.1325983-9-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230401104953.1325983-9-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
> CMD_TLBI_S2_IPA: As S1+S2 is not enabled, for now this can be the
> same as CMD_TLBI_NH_VAA.
>
> CMD_TLBI_S12_VMALL: Added new function to invalidate TLB by VMID.
>
> For stage-1 only commands, add a check to throw CERROR_ILL if used
> when stage-1 is not supported.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
> Changes in v3:
> - Log guest error for all illegal commands.
> Changes in v2:
> - Add checks for stage-1 only commands
> - Rename smmuv3_s1_range_inval to smmuv3_range_inval
> ---
>  hw/arm/smmu-common.c         | 16 +++++++++++
>  hw/arm/smmuv3.c              | 53 ++++++++++++++++++++++++++++++------
>  hw/arm/trace-events          |  4 ++-
>  include/hw/arm/smmu-common.h |  1 +
>  4 files changed, 65 insertions(+), 9 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 72ed6edd48..45e9d7e752 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -135,6 +135,16 @@ static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
>  
>      return SMMU_IOTLB_ASID(*iotlb_key) == asid;
>  }
> +
> +static gboolean smmu_hash_remove_by_vmid(gpointer key, gpointer value,
> +                                         gpointer user_data)
> +{
> +    uint16_t vmid = *(uint16_t *)user_data;
> +    SMMUIOTLBKey *iotlb_key = (SMMUIOTLBKey *)key;
> +
> +    return SMMU_IOTLB_VMID(*iotlb_key) == vmid;
> +}
> +
>  static gboolean smmu_hash_remove_by_asid_vmid_iova(gpointer key, gpointer value,
>                                                gpointer user_data)
>  {
> @@ -187,6 +197,12 @@ void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
>      g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid);
>  }
>  
> +inline void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid)
> +{
> +    trace_smmu_iotlb_inv_vmid(vmid);
> +    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_vmid, &vmid);
> +}
> +
>  /* VMSAv8-64 Translation */
>  
>  /**
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index d7e7003da9..3b5b1fad1a 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1069,7 +1069,7 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
>      }
>  }
>  
> -static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
> +static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
>  {
>      dma_addr_t end, addr = CMD_ADDR(cmd);
>      uint8_t type = CMD_TYPE(cmd);
> @@ -1094,7 +1094,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>      }
>  
>      if (!tg) {
> -        trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
> +        trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
>          smmuv3_inv_notifiers_iova(s, asid, addr, tg, 1);
>          smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
>          return;
> @@ -1112,7 +1112,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>          uint64_t mask = dma_aligned_pow2_mask(addr, end, 64);
>  
>          num_pages = (mask + 1) >> granule;
> -        trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
> +        trace_smmuv3_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
>          smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
>          smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
>          addr += mask + 1;
> @@ -1246,12 +1246,22 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>          {
>              uint16_t asid = CMD_ASID(&cmd);
>  
> +            if (!STAGE1_SUPPORTED(s)) {
> +                cmd_error = SMMU_CERROR_ILL;
> +                break;
> +            }
> +
>              trace_smmuv3_cmdq_tlbi_nh_asid(asid);
>              smmu_inv_notifiers_all(&s->smmu_state);
>              smmu_iotlb_inv_asid(bs, asid);
>              break;
>          }
>          case SMMU_CMD_TLBI_NH_ALL:
> +            if (!STAGE1_SUPPORTED(s)) {
> +                cmd_error = SMMU_CERROR_ILL;
> +                break;
> +            }
> +            QEMU_FALLTHROUGH;
>          case SMMU_CMD_TLBI_NSNH_ALL:
>              trace_smmuv3_cmdq_tlbi_nh();
>              smmu_inv_notifiers_all(&s->smmu_state);
> @@ -1259,7 +1269,34 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>              break;
>          case SMMU_CMD_TLBI_NH_VAA:
>          case SMMU_CMD_TLBI_NH_VA:
> -            smmuv3_s1_range_inval(bs, &cmd);
> +            if (!STAGE1_SUPPORTED(s)) {
> +                cmd_error = SMMU_CERROR_ILL;
> +                break;
> +            }
> +            smmuv3_range_inval(bs, &cmd);
> +            break;
> +        case SMMU_CMD_TLBI_S12_VMALL:
> +            uint16_t vmid = CMD_VMID(&cmd);
> +
> +            if (!STAGE2_SUPPORTED(s)) {
> +                cmd_error = SMMU_CERROR_ILL;
> +                break;
> +            }
> +
> +            trace_smmuv3_cmdq_tlbi_s12_vmid(vmid);
> +            smmu_inv_notifiers_all(&s->smmu_state);
> +            smmu_iotlb_inv_vmid(bs, vmid);
> +            break;
> +        case SMMU_CMD_TLBI_S2_IPA:
> +            if (!STAGE2_SUPPORTED(s)) {
> +                cmd_error = SMMU_CERROR_ILL;
> +                break;
> +            }
> +            /*
> +             * As currently only either s1 or s2 are supported
> +             * we can reuse same function for s2.
> +             */
> +            smmuv3_range_inval(bs, &cmd);
>              break;
>          case SMMU_CMD_TLBI_EL3_ALL:
>          case SMMU_CMD_TLBI_EL3_VA:
> @@ -1267,8 +1304,6 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>          case SMMU_CMD_TLBI_EL2_ASID:
>          case SMMU_CMD_TLBI_EL2_VA:
>          case SMMU_CMD_TLBI_EL2_VAA:
> -        case SMMU_CMD_TLBI_S12_VMALL:
> -        case SMMU_CMD_TLBI_S2_IPA:
>          case SMMU_CMD_ATC_INV:
>          case SMMU_CMD_PRI_RESP:
>          case SMMU_CMD_RESUME:
> @@ -1277,12 +1312,14 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>              break;
>          default:
>              cmd_error = SMMU_CERROR_ILL;
> -            qemu_log_mask(LOG_GUEST_ERROR,
> -                          "Illegal command type: %d\n", CMD_TYPE(&cmd));
>              break;
>          }
>          qemu_mutex_unlock(&s->mutex);
>          if (cmd_error) {
> +            if (cmd_error == SMMU_CERROR_ILL) {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                              "Illegal command type: %d\n", CMD_TYPE(&cmd));
> +            }
>              break;
>          }
>          /*
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 705104e58b..f8fdf1ca9f 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -12,6 +12,7 @@ smmu_ptw_block_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, ui
>  smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte) "baseaddr=0x%"PRIx64" index=0x%x, pteaddr=0x%"PRIx64", pte=0x%"PRIx64
>  smmu_iotlb_inv_all(void) "IOTLB invalidate all"
>  smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=%d"
> +smmu_iotlb_inv_vmid(uint16_t vmid) "IOTLB invalidate vmid=%d"
>  smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
>  smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
>  smmu_iotlb_lookup_hit(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
> @@ -45,9 +46,10 @@ smmuv3_cmdq_cfgi_ste_range(int start, int end) "start=0x%x - end=0x%x"
>  smmuv3_cmdq_cfgi_cd(uint32_t sid) "sid=0x%x"
>  smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache HIT for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
>  smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache MISS for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
> -smmuv3_s1_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d"
> +smmuv3_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d"
>  smmuv3_cmdq_tlbi_nh(void) ""
>  smmuv3_cmdq_tlbi_nh_asid(uint16_t asid) "asid=%d"
> +smmuv3_cmdq_tlbi_s12_vmid(uint16_t vmid) "vmid=%d"
>  smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
>  smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
>  smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 3cbb4998ad..fd8d772da1 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -193,6 +193,7 @@ SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
>                                  uint8_t tg, uint8_t level);
>  void smmu_iotlb_inv_all(SMMUState *s);
>  void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
> +void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid);
>  void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
>                           uint8_t tg, uint64_t num_pages, uint8_t ttl);
>  
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric


