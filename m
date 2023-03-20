Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB1B6C1CCD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 17:52:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peIj6-0001pM-Qb; Mon, 20 Mar 2023 12:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1peIj5-0001oh-8P
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:51:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1peIj3-00007N-7t
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679331072;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UVxoInKrCrZC4c8SkZeI5OTtbyn+6I2meuEkVtZLdvg=;
 b=HpqVWotlhc5VgcHF6i0CFR6JeGQkgiMf6JXrgNkNwZY/dqNonpuKq/lEyimAgP15hVd4C/
 wQp4KFNSkKQsFK7542jKVbVmt/Dl5Gfd05HQ9BhyqWYHNBWGj7Y9YixVAHDiL9e+dBxGeW
 gPsnOL7GUMptKloHTErER55WzbhhrEo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-WJtSVTSBPD-54aM2q2kskg-1; Mon, 20 Mar 2023 12:51:10 -0400
X-MC-Unique: WJtSVTSBPD-54aM2q2kskg-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay12-20020a05600c1e0c00b003ed201dcf71so5807405wmb.4
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 09:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679331069;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UVxoInKrCrZC4c8SkZeI5OTtbyn+6I2meuEkVtZLdvg=;
 b=YLEAGF8bp1iCxVeaaTsyXtsTXimHqR+Woo8tcksyuQXRoWaonwXp9s1vIqjIzsq6oY
 lZDaRrSbSUq6tWeWVaWs6uoa0y+Na6ZwiC/zMJN+3L1iGVblNXAxg4xVXu/6iO0HhKgE
 hhqD+m9kCOs+L1k4mkp96kzjOgfIvycvpqq+N/6oG3Nf+Dw26Jpu7YCFWXQpmJEmmDUB
 8EhrT8L05qP0Ke4rHPp351DL1EMMNK92n4lwCKbGW0Phb5EJL4glafoiVntWTldMc+lU
 SL0NAFqmveqWNxMPLlNu6OOcDBAtMATwmLgM6/anjvFJGZ9bRMNQC2XthceL/cjUw77l
 9y8Q==
X-Gm-Message-State: AO0yUKWJZn8/vjBOjpStkWG3do7e5la5oH87a7l59d90Q9Gy0BShfDtc
 nz66q723SdMSacaef9nLhbMldIZ/Y64+06U3McG3bOP0Rt6i3b2FXpqz9YDNrFXKOPl6Aajj9K8
 v0ruZv7Pk/dgvDMs=
X-Received: by 2002:a05:6000:1ce:b0:2d2:2a9e:2312 with SMTP id
 t14-20020a05600001ce00b002d22a9e2312mr10756769wrx.59.1679331069677; 
 Mon, 20 Mar 2023 09:51:09 -0700 (PDT)
X-Google-Smtp-Source: AK7set+s54LVittgPXvE6BF9hgNF6zqSdsYSpxFPoQ+yvGAfGzeUaRVH4N0iqxa0kT52TI6YdLLeFQ==
X-Received: by 2002:a05:6000:1ce:b0:2d2:2a9e:2312 with SMTP id
 t14-20020a05600001ce00b002d22a9e2312mr10756755wrx.59.1679331069392; 
 Mon, 20 Mar 2023 09:51:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a5d5044000000b002c70851fdd8sm9369191wrt.75.2023.03.20.09.51.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 09:51:08 -0700 (PDT)
Message-ID: <4960b6a9-4044-eee4-c790-fd18ce1033e8@redhat.com>
Date: Mon, 20 Mar 2023 17:51:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v2 08/11] hw/arm/smmuv3: Add CMDs related to stage-2
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-9-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230226220650.1480786-9-smostafa@google.com>
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

Hi Mostafa,

On 2/26/23 23:06, Mostafa Saleh wrote:
> CMD_TLBI_S2_IPA: As S1+S2 is not enabled, for now this can be the
> same as CMD_TLBI_NH_VAA.
>
> CMD_TLBI_S12_VMALL: Added new function to invalidate TLB by VMID.
>
> For stage-1 only commands, add a check to to throw CERROR_ILL if used
s/to to/to
> when stage-1 is not supported.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
> Changes in v2:
> - Add checks for stage-1 only commands
> - Rename smmuv3_s1_range_inval to smmuv3_range_inval
> ---
>  hw/arm/smmu-common.c         | 16 ++++++++++++
>  hw/arm/smmuv3.c              | 47 +++++++++++++++++++++++++++++++-----
>  hw/arm/trace-events          |  4 ++-
>  include/hw/arm/smmu-common.h |  1 +
>  4 files changed, 61 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 3191a008c6..e4b477af10 100644
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
> index f9c06723f9..8c76a48c8d 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1034,7 +1034,7 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
>      }
>  }
>  
> -static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
> +static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
>  {
>      dma_addr_t end, addr = CMD_ADDR(cmd);
>      uint8_t type = CMD_TYPE(cmd);
> @@ -1059,7 +1059,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>      }
>  
>      if (!tg) {
> -        trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
> +        trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
>          smmuv3_inv_notifiers_iova(s, asid, addr, tg, 1);
>          smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
>          return;
> @@ -1077,7 +1077,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>          uint64_t mask = dma_aligned_pow2_mask(addr, end, 64);
>  
>          num_pages = (mask + 1) >> granule;
> -        trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
> +        trace_smmuv3_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
>          smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
>          smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
>          addr += mask + 1;
> @@ -1211,12 +1211,22 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>          {
>              uint16_t asid = CMD_ASID(&cmd);
>  
> +            if (!STAGE1_SUPPORTED(s)) {
> +                cmd_error = SMMU_CERROR_ILL;
Well looking further this is not said explicitly this should return

SMMU_CERROR_ILL. Maybe you should mark it as a guest error because we do not expect a guest to send such command when S1 is not supported?


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

there is a VMID field. Can't this be used in S2 mode as well?

> +            }
> +            QEMU_FALLTHROUGH;
>          case SMMU_CMD_TLBI_NSNH_ALL:
>              trace_smmuv3_cmdq_tlbi_nh();
>              smmu_inv_notifiers_all(&s->smmu_state);
> @@ -1224,7 +1234,34 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
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
> @@ -1232,8 +1269,6 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>          case SMMU_CMD_TLBI_EL2_ASID:
>          case SMMU_CMD_TLBI_EL2_VA:
>          case SMMU_CMD_TLBI_EL2_VAA:
> -        case SMMU_CMD_TLBI_S12_VMALL:
> -        case SMMU_CMD_TLBI_S2_IPA:
>          case SMMU_CMD_ATC_INV:
>          case SMMU_CMD_PRI_RESP:
>          case SMMU_CMD_RESUME:
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
> index c415e8d853..d8b458379e 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -186,6 +186,7 @@ SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
>                                  uint8_t tg, uint8_t level);
>  void smmu_iotlb_inv_all(SMMUState *s);
>  void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
> +void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid);
>  void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
>                           uint8_t tg, uint64_t num_pages, uint8_t ttl);
>  
Thanks

Eric


