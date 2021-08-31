Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BD93FCA55
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 16:48:14 +0200 (CEST)
Received: from localhost ([::1]:48734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL53c-0005c4-OY
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 10:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mL525-0004YR-PQ
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 10:46:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mL522-0001g2-Tx
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 10:46:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630421193;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NH+y0otVJ9gmIyVkrddHEbZLJjRgx7PdnT3LMRoKqVs=;
 b=b3kZYzZw9CoSlYNGBoohEt/LUvNYc4pS6WRqrYI+/+cVh2yTzBEOJKtFBQBgTZ+R/huKJ+
 yKrIMpU7gMtWICdpzRzl0SLIi631Z9C0ixOPknsMrtrF4KZPUNcOBTxyAiWzZGYoTVKCGu
 ugaKtFWWjff571HxkVs0wQ7bqK4toOM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-ISzBoek0P9CUZHMap4CPtw-1; Tue, 31 Aug 2021 10:46:32 -0400
X-MC-Unique: ISzBoek0P9CUZHMap4CPtw-1
Received: by mail-wr1-f69.google.com with SMTP id
 p10-20020adfce0a000000b001572d05c970so4131189wrn.21
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 07:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=NH+y0otVJ9gmIyVkrddHEbZLJjRgx7PdnT3LMRoKqVs=;
 b=ZA61JIUiuRSHLnZcI5HadfuZE6IXRd0femEvuaxTqCRZy+njqRYMkTxrazUzE2+zfq
 eCvNWDQJDZzXaGxKLs9Ceg5enbiKELx97umfNIDvP7GbOxw6Fk2omhnYbJw9azotgHoG
 2ukMYeDNhqO8BoRKk/X6jbryoONZ4VQvaeM7g1hjMDENgOUV1ix21CBo/RTkNgUFF+Ze
 pgq4kaOXMpAIHchwmtDLLo7yghV9vBdx54LC6TTvDYvWtjtpGERj3LasJJKnZmpawVFd
 AX9ePhNzEqMi0xVqgCX9gttLIElmMO1y2B+cONFR43FlfygZu6KPH5EFt9G1//7r8Jys
 K0WQ==
X-Gm-Message-State: AOAM5307fb58iiwrwLgCuuJ3NRfjIiJcXxsJTQ+AUpyuLxFr67c4/NIY
 qTg0BzCXk0xulVxmVH2S7l/mjyTYjKRTcOLqurUKD01B2E61znHmpFiPdl92C17NBo5CBjIxgKz
 RFKLwBbQ3L9AnZwc=
X-Received: by 2002:adf:9e08:: with SMTP id u8mr14751930wre.383.1630421191153; 
 Tue, 31 Aug 2021 07:46:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0w0D/Y8PdQlTDV2GZqFCtLAB1lfpGEmaDLfGB2R9B81mGl2lnyWk2+EVmOaOft7Vp3O0bKg==
X-Received: by 2002:adf:9e08:: with SMTP id u8mr14751900wre.383.1630421190920; 
 Tue, 31 Aug 2021 07:46:30 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id z2sm2795356wma.45.2021.08.31.07.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 07:46:30 -0700 (PDT)
Subject: Re: [PATCH v2] hw/arm/smmuv3: Simplify range invalidation
To: "Liu, Renwei" <Renwei.Liu@verisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <4FA89A717CD8094DBA0FE20FA5F98EAA010E6E9940@SHASXM03.verisilicon.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <1805dcb3-6f99-0bf1-2d73-be0537c98512@redhat.com>
Date: Tue, 31 Aug 2021 16:46:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <4FA89A717CD8094DBA0FE20FA5F98EAA010E6E9940@SHASXM03.verisilicon.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.932, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Li,
 Chunming" <Chunming.Li@verisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Liu,

On 8/23/21 9:50 AM, Liu, Renwei wrote:
> Simplify range invalidation which can avoid to iterate over all
> iotlb entries multi-times. For instance invalidations patterns like
> "invalidate 32 4kB pages starting from 0xffacd000" need to iterate over
> all iotlb entries 6 times (num_pages: 1, 2, 16, 8, 4, 1). It only needs
> to iterate over all iotlb entries once with new implementation.

This wouldn't work. This reverts commit
6d9cd115b9df ("hw/arm/smmuv3: Enforce invalidation on a power of two range")
which is mandated for VFIO and virtio to work. IOTLB invalidations must
be naturally aligned and with a power of 2 range, hence this iteration.

Thanks

Eric
>
> Signed-off-by: Renwei Liu <renwei.liu@verisilicon.com>
> ---
> v2:
>  - Remove file mode change.
>
>  hw/arm/smmu-common.c   |  6 +++---
>  hw/arm/smmu-internal.h |  2 +-
>  hw/arm/smmuv3.c        | 22 ++++------------------
>  3 files changed, 8 insertions(+), 22 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 0459850a93..ccb085f83c 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -142,8 +142,8 @@ static gboolean smmu_hash_remove_by_asid_iova(gpointer key, gpointer value,
>      if (info->asid >= 0 && info->asid != SMMU_IOTLB_ASID(iotlb_key)) {
>          return false;
>      }
> -    return ((info->iova & ~entry->addr_mask) == entry->iova) ||
> -           ((entry->iova & ~info->mask) == info->iova);
> +    return (entry->iova >= info->iova) &&
> +           ((entry->iova + entry->addr_mask) < (info->iova + info->range));
>  }
>  
>  inline void
> @@ -167,7 +167,7 @@ smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
>  
>      SMMUIOTLBPageInvInfo info = {
>          .asid = asid, .iova = iova,
> -        .mask = (num_pages * 1 << granule) - 1};
> +        .range = num_pages * 1 << granule};
>  
>      g_hash_table_foreach_remove(s->iotlb,
>                                  smmu_hash_remove_by_asid_iova,
> diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
> index 2d75b31953..f0e3a777af 100644
> --- a/hw/arm/smmu-internal.h
> +++ b/hw/arm/smmu-internal.h
> @@ -101,7 +101,7 @@ uint64_t iova_level_offset(uint64_t iova, int inputsize,
>  typedef struct SMMUIOTLBPageInvInfo {
>      int asid;
>      uint64_t iova;
> -    uint64_t mask;
> +    uint64_t range;
>  } SMMUIOTLBPageInvInfo;
>  
>  typedef struct SMMUSIDRange {
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 01b60bee49..0b009107d1 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -857,7 +857,7 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
>  
>  static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>  {
> -    dma_addr_t end, addr = CMD_ADDR(cmd);
> +    dma_addr_t addr = CMD_ADDR(cmd);
>      uint8_t type = CMD_TYPE(cmd);
>      uint16_t vmid = CMD_VMID(cmd);
>      uint8_t scale = CMD_SCALE(cmd);
> @@ -866,7 +866,6 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>      bool leaf = CMD_LEAF(cmd);
>      uint8_t tg = CMD_TG(cmd);
>      uint64_t num_pages;
> -    uint8_t granule;
>      int asid = -1;
>  
>      if (type == SMMU_CMD_TLBI_NH_VA) {
> @@ -880,23 +879,10 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>          return;
>      }
>  
> -    /* RIL in use */
> -
>      num_pages = (num + 1) * BIT_ULL(scale);
> -    granule = tg * 2 + 10;
> -
> -    /* Split invalidations into ^2 range invalidations */
> -    end = addr + (num_pages << granule) - 1;
> -
> -    while (addr != end + 1) {
> -        uint64_t mask = dma_aligned_pow2_mask(addr, end, 64);
> -
> -        num_pages = (mask + 1) >> granule;
> -        trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
> -        smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
> -        smmu_iotlb_inv_iova(s, asid, addr, tg, num_pages, ttl);
> -        addr += mask + 1;
> -    }
> +    trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
> +    smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
> +    smmu_iotlb_inv_iova(s, asid, addr, tg, num_pages, ttl);
>  }
>  
>  static gboolean


