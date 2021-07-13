Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E943C6E39
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 12:09:42 +0200 (CEST)
Received: from localhost ([::1]:45902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3FMC-0000TW-MS
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 06:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3FLB-00087Y-AJ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:08:38 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:39425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3FL9-0001st-GO
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:08:36 -0400
Received: by mail-ej1-x633.google.com with SMTP id ga14so25472283ejc.6
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 03:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OUnIUgn2rH6X2UQnBTngu5DffL3SQsMsVrtv2L1fBYY=;
 b=SvQQL5HTTo+n1shRox4mKnMXCRqoQo2N8ybyD4/yrtnc4/v1RH6+NQJTdJu9qiEfUn
 +JCj6LyNsewWofk9HZqvct888LluUhd40jpIVyR5huX0ceYpN7FI4wrnXWnz7LxMHUnY
 BmID3tIyQTfBn8tVGDUPceYKQ/JYT0skS/n6Wyu7akQOx7IxDJn2ngoF+xr49hP+A4wM
 ofo6vA6z0TMM8WVFB3rAscXlAH/rfqEW1ulJdkVH2Jz7r8OB5gNNh9L/c7qZQ8kOqgRl
 P5iYGznpxKuRYw3jw+i6GkdugeuugRV0CAMUqJBKuNokHlcb2r7ln9pR4nIPPjLW3kIn
 OZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OUnIUgn2rH6X2UQnBTngu5DffL3SQsMsVrtv2L1fBYY=;
 b=ctX8qlOgoiZzxFF3DZ9fmqhEiNNYfWKV7Hkcb21WiC20aTVVBkohjp31/hrp7dkP6j
 j1kE9dsxnIAjwjwxan3KxkzqKjG0/c+EZVfKFnv0zIDj1hBGbGgckOwjOcL3R50g7n7p
 Aq8TPWLz/0J7ntNwDYG9v2v97bNajL0245WiV83sdawJPv0p9lBGsjqES6ji320r38NI
 l1BgbgN9opiWT4bd33Io22nG2i4P7Bj97HXNsDy0ON5ZKZi5HnqXUXmu3dCFDVraCO3q
 VXopk/Lb+c7vEd/0ulHPnWbIwZ6hQtj5EzRBCzH+lREjwczwC3tKd2VugrLk1Z64YPWo
 G5fQ==
X-Gm-Message-State: AOAM530ptIB0zpo6UcLgSjfnDzfcTCo95mlrlgwf4n8Kyyx1cMrEMH06
 XmxieSDrPYE/k/ajyFzFzQw6F4OxafSthGu5NcwCmw==
X-Google-Smtp-Source: ABdhPJwaIkTwvPk3+Ibtb4PxsIQrjbTqiDEKLZ8ILH3gTtHGrQ+b8vi3/pzX3Q/JWCUswV5QxN+3R0JLflLYfuHxB0s=
X-Received: by 2002:a17:907:a05c:: with SMTP id
 gz28mr4756933ejc.56.1626170913776; 
 Tue, 13 Jul 2021 03:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210713054359.831878-1-its@irrelevant.dk>
In-Reply-To: <20210713054359.831878-1-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jul 2021 11:07:54 +0100
Message-ID: <CAFEAcA8Qo7xfjAHNbZmDiVUkhnL2WRrEWp7U-urxOTBnao8Oyg@mail.gmail.com>
Subject: Re: [PATCH] hw/nvme: fix mmio read
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Jul 2021 at 06:44, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> The new PMR test unearthed a long-standing issue with MMIO reads on
> big-endian hosts.
>
> Fix by using the ldn_he_p helper instead of memcpy.
>
> Cc: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/nvme/ctrl.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 2f0524e12a36..dd81c3b19c7e 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -5951,7 +5951,6 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
>  {
>      NvmeCtrl *n = (NvmeCtrl *)opaque;
>      uint8_t *ptr = (uint8_t *)&n->bar;
> -    uint64_t val = 0;
>
>      trace_pci_nvme_mmio_read(addr, size);
>
> @@ -5977,14 +5976,15 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
>              (NVME_PMRCAP_PMRWBM(n->bar.pmrcap) & 0x02)) {
>              memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
>          }
> -        memcpy(&val, ptr + addr, size);
> -    } else {
> -        NVME_GUEST_ERR(pci_nvme_ub_mmiord_invalid_ofs,
> -                       "MMIO read beyond last register,"
> -                       " offset=0x%"PRIx64", returning 0", addr);
> +
> +        return ldn_he_p(ptr + addr, size);

I don't think this will do the right thing for accesses which aren't
of the same width as whatever the field in NvmeBar is defined as.
For instance, if the guest does a 32-bit access to offset 0,
because the first field is defined as 'uint64_t cap', on a
big-endian host they will end up reading the high 4 bytes of the
64-bit value, and on a little-endian host they will get the low 4 bytes.

>      }
>
> -    return val;
> +    NVME_GUEST_ERR(pci_nvme_ub_mmiord_invalid_ofs,
> +                   "MMIO read beyond last register,"
> +                   " offset=0x%"PRIx64", returning 0", addr);
> +
> +    return 0;
>  }

Looking at the surrounding code, I notice that we guard this "read size bytes
from &n->bar + addr" with
    if (addr < sizeof(n->bar)) {

but that doesn't account for 'size', so if the guest asks to read
4 bytes starting at offset sizeof(n->bar)-1 then we'll still read
3 bytes beyond the end of the buffer...

thanks
-- PMM

