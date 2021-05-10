Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E41FC378735
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 13:35:05 +0200 (CEST)
Received: from localhost ([::1]:59964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg4Bl-0000Ye-0F
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 07:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg49K-0007Sy-74
 for qemu-devel@nongnu.org; Mon, 10 May 2021 07:32:34 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:35837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg49G-0005bI-0b
 for qemu-devel@nongnu.org; Mon, 10 May 2021 07:32:33 -0400
Received: by mail-ed1-x535.google.com with SMTP id di13so18298515edb.2
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 04:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CcRJ1mcECD6ljze5xB69l0GAoTn2jD6JD0zuakEXLOE=;
 b=mQYzNULtWyrS8HDJ9v+FAAfyrHqTlwNPj6tSJDWKoFjb1A8rfcRWXktba+PnxibiYK
 hClp8aPW9BrYyK33mtSGQBPG2DfYRmligAPfbXIF6XMxFo+/ikheJ3MGkXHdzWNhEWxF
 0w9zIt38sNZ7FoICMsdIaCmMTwF/azrFRy2JVOSNyPZkLPaA4ymBgdbYNneDJ23zK5P7
 0QSBZZbAdecnkfN1QsfDog/2F18Y/uTde0Hkzk3w1CS2JpD4Xo8MbWdEoQAzickA+V66
 FB1xsLzXifidPq2ufDREdLgY7NVr45fkJHxMBs6GExuoy0aYc8ve6eVjjDDHaunBNhQQ
 JcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CcRJ1mcECD6ljze5xB69l0GAoTn2jD6JD0zuakEXLOE=;
 b=Tf9tIipsQ8kh5BcEFWNY4LyKxrEquJWfbkZ1r8yh/oUnfKZVQW3Bx9zPttY0qFtBLV
 8NE2SyjZOmqJyooXnJCAAu2s4BRm2zi/mrL21ITAc+Llp/PDZsYlkWMLws7ITST6LUHA
 kmh5mo3sAhsRNlbd8B2GwNTwiDFomIld5zJXJNqWkHTvAf25dJvQ2VYBMNuTkfnaXA/8
 sfKIQfsr4JRD8dq5s8q1Zaqiu4f64vpBJlKXnE2F5T7sTcSgjZIsK0KcHoC49xgY50i9
 qzcTMmAPm50a/97xseIeic24WjNGXYyxFUhdMxFS9zAEuBkPXFZJR+0yPUG19fTk2ar4
 J97g==
X-Gm-Message-State: AOAM532j9Y44KGIbkhzx2hC87bJw13HhFMoiJZe9hcKiDLFKbRRzbU+5
 uyrC4kZ2bCGtpznLuzAjAFTvEU9FrTsH1jwgw1J1+g==
X-Google-Smtp-Source: ABdhPJyl02mJN558q9VeZT1GYwddYCyybS9DWNeY4VjnBEtXosu3E4SELiixx9DzUNJbYI9xNy4d40IjgeNxUfk3DPA=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr28448352edv.44.1620646346186; 
 Mon, 10 May 2021 04:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210421172910.11832-1-eric.auger@redhat.com>
In-Reply-To: <20210421172910.11832-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 May 2021 12:31:14 +0100
Message-ID: <CAFEAcA_R4UY1vr3ZKEf_egF7e5GmFDWuDV_SGenUkLOygh0hGQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/smmuv3: Another range invalidation fix
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Kunkun Jiang <jiangkunkun@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 21 Apr 2021 at 18:29, Eric Auger <eric.auger@redhat.com> wrote:
>
> 6d9cd115b9 ("hw/arm/smmuv3: Enforce invalidation on a power of two range")
> failed to completely fix misalignment issues with range
> invalidation. For instance invalidations patterns like "invalidate 32
> 4kB pages starting from 0xff395000 are not correctly handled" due
> to the fact the previous fix only made sure the number of invalidated
> pages were a power of 2 but did not properly handle the start
> address was not aligned with the range. This can be noticed when
> boothing a fedora 33 with protected virtio-blk-pci.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Fixes: 6d9cd115b9 ("hw/arm/smmuv3: Enforce invalidation on a power of two range")
>
> ---
>
> This bug was found with SMMU RIL avocado-qemu acceptance tests
> ---
>  hw/arm/smmuv3.c | 49 +++++++++++++++++++++++++------------------------
>  1 file changed, 25 insertions(+), 24 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 8705612535..16f285a566 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -856,43 +856,44 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
>
>  static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>  {
> -    uint8_t scale = 0, num = 0, ttl = 0;
> -    dma_addr_t addr = CMD_ADDR(cmd);
> +    dma_addr_t end, addr = CMD_ADDR(cmd);
>      uint8_t type = CMD_TYPE(cmd);
>      uint16_t vmid = CMD_VMID(cmd);
> +    uint8_t scale = CMD_SCALE(cmd);
> +    uint8_t num = CMD_NUM(cmd);
> +    uint8_t ttl = CMD_TTL(cmd);
>      bool leaf = CMD_LEAF(cmd);
>      uint8_t tg = CMD_TG(cmd);
> -    uint64_t first_page = 0, last_page;
> -    uint64_t num_pages = 1;
> +    uint64_t num_pages;
> +    uint8_t granule;
>      int asid = -1;
>
> -    if (tg) {
> -        scale = CMD_SCALE(cmd);
> -        num = CMD_NUM(cmd);
> -        ttl = CMD_TTL(cmd);
> -        num_pages = (num + 1) * BIT_ULL(scale);
> -    }
> -
>      if (type == SMMU_CMD_TLBI_NH_VA) {
>          asid = CMD_ASID(cmd);
>      }
>
> +    if (!tg) {
> +        trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
> +        smmuv3_inv_notifiers_iova(s, asid, addr, tg, 1);
> +        smmu_iotlb_inv_iova(s, asid, addr, tg, 1, ttl);
> +    }

Is this intended to fall through ?

> +
> +    /* RIL in use */
> +
> +    num_pages = (num + 1) * BIT_ULL(scale);
> +    granule = tg * 2 + 10;
> +
>      /* Split invalidations into ^2 range invalidations */
> -    last_page = num_pages - 1;
> -    while (num_pages) {
> -        uint8_t granule = tg * 2 + 10;
> -        uint64_t mask, count;
> +    end = addr + (num_pages << granule) - 1;
>
> -        mask = dma_aligned_pow2_mask(first_page, last_page, 64 - granule);
> -        count = mask + 1;
> +    while (addr != end + 1) {
> +        uint64_t mask = dma_aligned_pow2_mask(addr, end, 64);
>
> -        trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, count, ttl, leaf);
> -        smmuv3_inv_notifiers_iova(s, asid, addr, tg, count);
> -        smmu_iotlb_inv_iova(s, asid, addr, tg, count, ttl);
> -
> -        num_pages -= count;
> -        first_page += count;
> -        addr += count * BIT_ULL(granule);
> +        num_pages = (mask + 1) >> granule;
> +        trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
> +        smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
> +        smmu_iotlb_inv_iova(s, asid, addr, tg, num_pages, ttl);
> +        addr += mask + 1;
>      }
>  }

thanks
-- PMM

