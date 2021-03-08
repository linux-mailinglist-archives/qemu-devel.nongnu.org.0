Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6773313C0
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 17:48:53 +0100 (CET)
Received: from localhost ([::1]:40158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJ3s-0005tV-Aw
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 11:48:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJ0Q-00041Y-Df
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:45:18 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:39191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJ0M-0003qf-7e
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:45:16 -0500
Received: by mail-ej1-x633.google.com with SMTP id p7so10270255eju.6
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 08:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wfNylX5tlH6KMqo6GDpzneUD/I7zzn0NvWjHUf252PA=;
 b=HEpcFEhm6oj/ZbbQ1hv0NFWEQsLpwrom0OtvS8WMD6Gt55gOhOG+CJwVP4Sh1Ny63R
 7aSQmZFO1DvLlG89OUVsSmRYT9/oDp2gaTzwHnIoLg+isClgBTk30bJUM2j124aVAwSK
 BWVfOuzGp4s1bRGOLvv4Q59+1yejoqmNKewzFo3imHk/7ibXpj0V1nC9XJrMuo4MyEcf
 qg6y8FsQe9Dk000i3KoxGCqkgRnUJ3Jd2SEkrHnzcbeWGx9FvmnKIslGne+pZ83mnUtQ
 XKVg4uViml47QxAETrrmgoml9Z0eYUakN6+4hMU173G9iGFlsD1l2slp6lUir+WbIAPU
 k/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wfNylX5tlH6KMqo6GDpzneUD/I7zzn0NvWjHUf252PA=;
 b=AJctQjzp7Za10+f8skOGuyKugmOiLDXqcqIoQXnOmEI0bI5DCKbszaSH7eXFnJ+Mpm
 kXYftztCJ8Hoq2o9hQumj4va7qNhKO8vGyRcfFmy301wu1pziLbe/AOyEdkyRRxGzVyM
 vLrOjJFKOtZSWgc7W5wQPboTT0HqNYplULAyzXcjvuG7vZAfRfgXaGbA7a4fpiHUW21a
 tcK2r0M3Gbn6mn2kCkG0hg51tLAv9nm6Q9Lf5OmWuxpIhQKe2HbGcdM0zjMWFzWsIekU
 jmGk0AH1SIY26RJRYjBIpzAebqITgW6AUyg7ATLOrLHbYK39tzhiM9mhv9cvNbX5kfgj
 wjXA==
X-Gm-Message-State: AOAM531u9PrAEbua1+3BpO+sxSSp60IUh+cYM9uZvrGt5HagFGAjFMR7
 tvqsCA2XkllgElARlQtyIMb/DWrP993C2zWJMGEvpg==
X-Google-Smtp-Source: ABdhPJxTC5EHUD1a2PXugEcNOk8Ml2AIjLhu/EsBivEq2o5paBP19cOpO65N7nJ/csJ9Hk3pt39F4a01O9Nu0Xu/vi0=
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr16157455ejb.56.1615221911857; 
 Mon, 08 Mar 2021 08:45:11 -0800 (PST)
MIME-Version: 1.0
References: <20210225091435.644762-1-eric.auger@redhat.com>
 <20210225091435.644762-6-eric.auger@redhat.com>
In-Reply-To: <20210225091435.644762-6-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 16:44:55 +0000
Message-ID: <CAFEAcA_MTmFWLVVZbeNYB5cjRtZ20Qw34z4bhE8pxvQ5-a6ZiA@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] hw/arm/smmuv3: Enforce invalidation on a power of
 two range
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, vivek.gautam@arm.com,
 qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Feb 2021 at 09:15, Eric Auger <eric.auger@redhat.com> wrote:
>
> As of today, the driver can invalide a number of pages that is

"invalidate"

> not a power of 2. However IOTLB unmap notifications and internal
> IOTLB invalidations work with masks leading to erroneous
> invalidations.
>
> In case the range is not a power of 2, split invalidations into
> power of 2 invalidations.
>
> When looking for a single page entry in the vSMMU internal IOTLB,
> let's make sure that if the entry is not found using a
> g_hash_table_remove() we iterate over all the entries to find a
> potential range that overlaps it.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/smmu-common.c | 30 ++++++++++++++++++------------
>  hw/arm/smmuv3.c      | 24 ++++++++++++++++++++----
>  2 files changed, 38 insertions(+), 16 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index e9ca3aebb2..84d2c62c26 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -151,22 +151,28 @@ inline void
>  smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
>                      uint8_t tg, uint64_t num_pages, uint8_t ttl)
>  {
> +    /* if tg is not set we use 4KB range invalidation */
> +    uint8_t granule = tg ? tg * 2 + 10 : 12;

I see this in-passing side-steps the question about how
we should be handling the lookup-by-key when the tg isn't set.

> +
>      if (ttl && (num_pages == 1) && (asid >= 0)) {
>          SMMUIOTLBKey key = smmu_get_iotlb_key(asid, iova, tg, ttl);
>
> -        g_hash_table_remove(s->iotlb, &key);
> -    } else {
> -        /* if tg is not set we use 4KB range invalidation */
> -        uint8_t granule = tg ? tg * 2 + 10 : 12;
> -
> -        SMMUIOTLBPageInvInfo info = {
> -            .asid = asid, .iova = iova,
> -            .mask = (num_pages * 1 << granule) - 1};
> -
> -        g_hash_table_foreach_remove(s->iotlb,
> -                                    smmu_hash_remove_by_asid_iova,
> -                                    &info);
> +        if (g_hash_table_remove(s->iotlb, &key)) {
> +            return;
> +        }
> +        /*
> +         * if the entry is not found, let's see if it does not
> +         * belong to a larger IOTLB entry
> +         */
>      }
> +
> +    SMMUIOTLBPageInvInfo info = {
> +        .asid = asid, .iova = iova,
> +        .mask = (num_pages * 1 << granule) - 1};
> +
> +    g_hash_table_foreach_remove(s->iotlb,
> +                                smmu_hash_remove_by_asid_iova,
> +                                &info);
>  }
>
>  inline void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index bd1f97000d..fdd6332ce5 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -861,7 +861,8 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>      uint16_t vmid = CMD_VMID(cmd);
>      bool leaf = CMD_LEAF(cmd);
>      uint8_t tg = CMD_TG(cmd);
> -    hwaddr num_pages = 1;
> +    uint64_t first_page = 0, last_page;
> +    uint64_t num_pages = 1;
>      int asid = -1;
>
>      if (tg) {
> @@ -874,9 +875,24 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>      if (type == SMMU_CMD_TLBI_NH_VA) {
>          asid = CMD_ASID(cmd);
>      }
> -    trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
> -    smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
> -    smmu_iotlb_inv_iova(s, asid, addr, tg, num_pages, ttl);
> +
> +    /* Split invalidations into ^2 range invalidations */
> +    last_page = num_pages - 1;
> +    while (num_pages) {
> +        uint8_t granule = tg * 2 + 10;
> +        uint64_t mask, count;
> +
> +        mask = dma_aligned_pow2_mask(first_page, last_page, 64 - granule);
> +        count = mask + 1;
> +
> +        trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, count, ttl, leaf);
> +        smmuv3_inv_notifiers_iova(s, asid, addr, tg, count);
> +        smmu_iotlb_inv_iova(s, asid, addr, tg, count, ttl);
> +
> +        num_pages -= count;
> +        first_page += count;
> +        addr += count * BIT_ULL(granule);
> +    }
>  }

This is probably right but I'll wait to review it until I read
the doc comment for dma_aligned_pow2_mask().

-- PMM

